import subprocess, mpd, datetime

def time(seconds):
    seconds = int(seconds)
    h, m, s = seconds//3600, (seconds//60)%60, seconds%60
    return (("{h}:{m:02}" if h else "{m}") + ":{s:02}").format(h=h,m=m,s=s)

class Py3status:
    def mpd(self, json, i3status_config):
        status = "MPD unavailable"
        color = "#555555"

        try:
            c = mpd.MPDClient()
            c.connect(host = "_mpd", port = 6600)

            status = "MPD stopped"

            s = c.status()
            song = c.currentsong()

            if song and s["state"] in ("play", "pause"):
                status = "{elapsed} {song} ({length}) {volume}%".format(
                        elapsed = time(s["time"].split(":")[0]),
                        length  = time(s["time"].split(":")[1]),
                        song    = "{artist} - {title}".format(**song) if song and "artist" in song and "title" in song else (song["file"] if song and "file" in song else "-"),
                        volume  = s["volume"]
                        )
                color = "#AAAAFF"

        except:
            pass

        response = {"full_text" : status, "name" : "mpd", "color": color}
        return (0, response)
