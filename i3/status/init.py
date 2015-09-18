# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock", format="🕗 %X")
status.register("clock", format="📅 %a %-d %b")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp", format="{temp:.0f}°C")

# The battery monitor has many formatting options, see README for details

# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
#status.register("battery", format="🔋 {status} {percentage:.2f}% {remaining:%E%hh:%Mm}", alert=True, alert_percentage=5, status=dict(DIS="(-)", CHR="(+)", FULL="(=)"))

status.register("network", interface="wire", format_up="{v4cidr}", format_down="")

# Has all the options of the normal network and adds some wireless specific things
# like quality and network names.
status.register("network", interface="wifi", format_up="🌍 {essid} {quality:03.0f}%",)

status.register("cpu_usage", format="💻 {usage}%")
status.register("mem", format="💾 {percent_used_mem:.0f}%", warn_percentage=70, alert_percentage=85)

# Shows pulseaudio default sink volume
status.register("pulseaudio", format="🔊 {volume}",)

status.register("dota2wins", steam_api_key="53AACE69A9E67ADE6560BCBCEB035C42", interval=30*60, steamid="opatut", matches=20, screenname='', format='🎮 {win_percent:.0f}%', good_threshold=55, bad_threshold=45)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("mpd", format="🎶 {title} - {album} \[{status}\]", status=dict(pause="Paused", play="Playing", stop="Stopped"))

status.run()
