from math import floor
from datetime import datetime
from i3pystatus import IntervalModule

class Countdown(IntervalModule):
    """
    This class shows a countdown.
    """

    settings = (
        ("text", "What the goal is"),
        ("goal", "What date to count down to."),
        ("color", "RGB hexadecimal code color specifier, default to #ffffff"),
    )
    format = None
    color = "#ffffff"
    text = "Goal"
    interval = 1
    current_format_id = 0
    on_upscroll = ["scroll_format", 1]
    on_downscroll = ["scroll_format", -1]

    def run(self):
        difference = self.goal - datetime.now()
        seconds = difference.total_seconds()
        if seconds > 0:
            minutes = seconds / 60.0
            hours = minutes / 60.0
            days = hours / 24.0
            text = "{} in {}".format(self.text,
                "{:.0f}:{:.0f}:{:.0f}".format(floor(hours % 24), floor(minutes % 60), floor(seconds % 60))
                if days < 1 else
                "{:.1f} days".format(days))

            self.output = {
                "full_text": text,
                "color": self.color,
                "urgent": False,
            }
        else:
            self.output = {
                "full_text": self.text + " reached!",
                "color": "#00FF00",
                "urgent": False,
            }
