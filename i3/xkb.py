import subprocess, mpd, datetime

class Py3status:
    def xkb(self, json, i3status_config):
        x = subprocess.check_output(["/bin/bash", "-c", "setxkbmap -print | grep xkb_symbols | cut -d'+' -f 2"]).strip().decode("ascii")
        response = {"full_text" : x, "name" : "xkb", "color": "#FFFFFF"}
        return (0, response)
