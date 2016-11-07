from i3pystatus import IntervalModule
from random import randint
from datetime import datetime, date, timedelta
from urllib.parse import urlencode
import requests

def partition(l, fn):
    a, b = list(), list()
    for e in l:
        if fn(e): a.append(e)
        else: b.append(e)
    return a, b


def parseDate(d):
    date, timezone = d.split('+')
    return datetime.strptime(date, "%Y-%m-%dT%H:%M:%S" )

def sumDuration(events):
    return sum(map(lambda event: parseDate(event['stop']) - parseDate(event['start']), events), timedelta(seconds=0))

def formatDuration(d):
    seconds = d.total_seconds()
    minutes = seconds // 60 % 60
    hours = seconds // 3600
    return "{:d}:{:02d}".format(int(hours), int(minutes))

class Toggl(IntervalModule):
    """
    Displays current toggl timer.
    """

    settings = (
        ("apikey", "Number of recent matches to calculate"),
        ("interval", "Update interval, in seconds."),
        ("update_iterations", "How many iterations to wait until updating the API data."),
        ("format_running", "Format while timer is running."),
        ("format_stopped", "Format while timer is stopped."),
        ("color_running", "Color while timer is running."),
        ("color_stopped", "Color while timer is stopped."),
    )

    required = ("apikey",)

    interval = 1
    update_iterations = 30
    format_running = "this week {week_duration} / today {today_duration} ({current_duration}) "
    format_stopped = "this week {week_duration} / today {today_duration} "

    color_running = "#00CC88"
    color_stopped = "#880088"

    on_leftclick = "toggle"

    _iterations_left = 0
    _entries = None

    def fetch(self):
        if not self._entries or self._iterations_left <= 0:
            self._iterations_left = self.update_iterations

            day_start  = datetime.combine(date.today(), datetime.min.time())
            week_start = day_start + timedelta(days=-day_start.weekday())
            week_end   = day_start + timedelta(weeks=1)

            url = 'https://www.toggl.com/api/v8/time_entries?' + urlencode(
                dict(
                    start_date=week_start.isoformat() + '+00:00',
                    end_date=week_end.isoformat() + '+00:00',
                )
            )

            response = requests.get(url, auth=(self.apikey, 'api_token'))
            try:
                self._entries = response.json()
            except:
                self._entries = []
        else:
            self._iterations_left -= 1

    def get_data(self):
        day_start  = datetime.combine(date.today(), datetime.min.time())
        # day_end    = day_start + timedelta(days=1)

        # find running event
        running, stopped = partition(self._entries, lambda e: ('stop' not in e) or not e['stop'])

        current_duration = timedelta(minutes=0)
        if len(running):
            current_start = parseDate(running[0]['start'])
            current_duration = datetime.utcnow() - current_start

        # find today's events
        today = filter(lambda e: parseDate(e['start']) > day_start, stopped)

        today_duration = sumDuration(today) + current_duration
        week_duration = sumDuration(stopped) + current_duration

        # get total
        return dict(
            running=len(running) > 0,
            current_duration=formatDuration(current_duration),
            today_duration=formatDuration(today_duration),
            week_duration=formatDuration(week_duration),
        )

    def toggle(self):
        current = requests.get('https://www.toggl.com/api/v8/time_entries/current', auth=(self.apikey, 'api_token')).json()['data']

        if current:
            requests.put(
                'https://www.toggl.com/api/v8/time_entries/' + str(current['id']) + '/stop',
                auth=(self.apikey, 'api_token'),
            )
        else:
            requests.post('https://www.toggl.com/api/v8/time_entries/start', 
                auth=(self.apikey, 'api_token'), 
                json=dict(
                    time_entry=dict(
                        description="Auto-toggled from i3bar",
                        created_with="i3bar",
                    ),
                ),
            )
        self._iterations_left = 0

    def run(self):
        self.fetch()

        data = self.get_data()
        formatter = self.format_running if data['running'] else self.format_stopped

        self.output['color'] = self.color_running if data['running'] else self.color_stopped
        self.output['full_text'] = formatter.format(**data)
