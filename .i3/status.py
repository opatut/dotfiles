# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock", format="%a %-d %b %X")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp", format="{temp:.0f}°C")

# The battery monitor has many formatting options, see README for details

# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
status.register("battery", format="{status} {percentage:.2f}% {remaining:%E%hh:%Mm}", alert=True, alert_percentage=5, status=dict(DIS="(-)", CHR="(+)", FULL="(=)"))

# Has all the options of the normal network and adds some wireless specific things
# like quality and network names.
status.register("wireless", interface="wlp2s0", format_up="{essid} {quality:03.0f}%",)

# Shows pulseaudio default sink volume
status.register("pulseaudio", format="♪{volume}",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("mpd", format="{title} - {album} \[{status}\]", status=dict(pause="Paused", play="Playing", stop="Stopped"))

status.run()
