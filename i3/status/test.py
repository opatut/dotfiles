from dota2py import api
from i3pystatus import IntervalModule


class Dota2wins(IntervalModule):
    good_color = "#00FF00"     # green
    caution_color = "#FFFF00"  # yellow
    bad_color = "#FF0000"      # red
    good_threshold = 50
    bad_threshold = 45
    matches = 25
    interval = 1800
    screenname = 'retrieve'
    format = "{screenname} {wins}W:{losses}L {win_percent}%"

    steamid = "opatut"
    steam_api_key="53AACE69A9E67ADE6560BCBCEB035C42"

    def run(self):
        api.set_api_key(self.steam_api_key)

        if not isinstance(self.steamid, int):
            # find by username
            self.steamid = int(api.get_steam_id(self.steamid)['response']['steamid'])

        hist = api.get_match_history(account_id=self.steamid)['result']
        recent_matches = []
        while len(recent_matches) < self.matches:
            recent_matches.append(hist['matches'].pop(0))

        player_team_per_match = []
        # create a list of tuples where each tuple is:
        # [match_id, bool]
        # The bool will be true if the player is on Radiant and alse if they
        # are on Dire.
        for match in recent_matches:
            this_match = [match['match_id']]
            for player in match['players']:
                # 64bit player ID
                long_id = player['account_id'] + 76561197960265728
                if long_id == self.steamid:
                    if player['player_slot'] < 128:
                        this_match.append(True)
                    else:
                        this_match.append(False)
            player_team_per_match.append(this_match)
        
        outcomes = []

        for match in player_team_per_match:
            if api.get_match_details(match[0])['result']['radiant_win'] == match[1]:
                outcomes.append(1)
            else:
                outcomes.append(0)


        wins = outcomes.count(1)
        losses = outcomes.count(0)
        win_percent = float(sum(outcomes) / float(len(outcomes))) * 100

        if win_percent >= float(self.good_threshold):
            color = self.good_color
        elif win_percent <= float(self.bad_threshold):
            color = self.bad_color
        else:
            color = self.caution_color

        if self.screenname == 'retrieve':
            from urllib.request import urlopen
            import json
            response = urlopen(
                'http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=%s&steamids=%s' %
                (self.steam_api_key, self.steamid))
            screenname = json.loads(bytes.decode(response.read()))['response']['players'][0]['personaname']
        else:
            screenname = self.screenname

        cdict = {
            "screenname": screenname,
            "wins": wins,
            "losses": losses,
            "win_percent": "%.2f" % win_percent,
        }

        self.output = {
            "full_text": self.format.format(**cdict),
            "color": color
        }


Dota2wins().run()
