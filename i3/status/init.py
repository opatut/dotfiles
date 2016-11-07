# -*- coding: utf-8 -*-
from toggl import Toggl
from countdown import Countdown
from i3pystatus import Status
from datetime import datetime
import os

status = Status(standalone=True)

#status.register("clock", format="%X ")
status.register("clock", format="%a %-d %b %X")

# Shows your CPU temperature, if you have a Intel CPU
# status.register("temp", format="{temp:02.0f}°C ")

# The battery monitor has many formatting options, see README for details

# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
status.register("battery", format="{percentage:5.2f}% {status}", alert=True, alert_percentage=5, status=dict(DIS="on battery", CHR="charging", FULL="full"))

status.register("network", interface="eth0", format_up="eth {v4}", format_down="no eth ")

# Has all the options of the normal network and adds some wireless specific things
# like quality and network names.
status.register("network", interface="wlan0", format_down="no wifi", format_up="{essid} {v4} ",)

status.register("cpu_usage", format="{usage:.0f}% CPU")
status.register("mem", format="{percent_used_mem:.0f}% MEM", warn_percentage=70, alert_percentage=85)

# Shows pulseaudio default sink volume
# status.register("pulseaudio", format="{volume:02.f}% ",)

#status.register("dota2wins", steam_api_key="53AACE69A9E67ADE6560BCBCEB035C42", interval=30*60, steamid="opatut", matches=20, screenname='', format='🎮 {win_percent:.0f}%', good_threshold=55, bad_threshold=45)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
# status.register("mpd", format="({status}) {artist} - {title} ({album}) ", status=dict(pause="", play="", stop=""))

status.register(Toggl, apikey=os.environ["TOGGL_API_KEY"])
# status.register(Countdown, goal=datetime(2016, 9, 15, 10, 0, 0), text="Welpe")

status.run()
