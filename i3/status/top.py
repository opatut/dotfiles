# -*- coding: utf-8 -*-
from i3pystatus import Status

from config import default_color, warn_color, alert_color

status = Status(standalone=True)

status.register("shell",
    command="/home/paul/.bin/mcp current-song",
    color=default_color,
)

status.register("shell",
    command="bash -c '~/.bin/slack-status get --format simple'",
    color=default_color,
    interval=60,
)


# status.register("mpd", 
#         hints=dict(align="center"), 
#         format="{status}{artist}: {title} - {album}", 
#         status=dict(pause="(Paused) ", play="", stop="(Stopped) "))
# status.register("pomodoro", 
#         hints=dict(align="center"), 
#         sound="~/.i3/status/pomodoro.wav", 
#         pomodoro_duration=25*60,
#         break_duration=5*60)
status.run()
