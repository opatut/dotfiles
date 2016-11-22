# -*- coding: utf-8 -*-
from i3pystatus import Status

status = Status(standalone=True)
status.register("mpd", 
        hints=dict(align="center"), 
        format="{status}{artist}: {title} - {album}", 
        status=dict(pause="(Paused) ", play="", stop="(Stopped) "))
status.register("pomodoro", 
        hints=dict(align="center"), 
        sound="~/.i3/status/pomodoro.wav", 
        pomodoro_duration=25*60,
        break_duration=5*60)
status.run()
