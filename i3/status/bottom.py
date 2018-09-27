# -*- coding: utf-8 -*-
from toggl import Toggl
from countdown import Countdown
from i3pystatus import Status
from datetime import datetime
import os
from config import default_color, warn_color, alert_color

status = Status(standalone=True)

# Clock
status.register("clock",
    format="%a %-d %b %X",
    color=default_color,
)

# Temperature
status.register("temp",
    format="{temp:02.0f}°C",
    color=default_color,
)

# Battery
status.register("battery",
    format="{status} {percentage:.0f}%",
    alert_percentage=5,
    alert=True,
    status=dict(DIS="↓", CHR="↑", FULL="→"),
    color=default_color,
    full_color=default_color,
    charging_color=default_color,
    critical_color=alert_color,
    not_present_color=default_color,
)

# Ethernet
# status.register("network",
#     interface="eth0",
#     format_up="eth {v4}",
#     format_down="no eth",
# )

# Wifi
status.register("network",
    interface="wlan0",
    format_down="no wifi",
    format_up="{essid} {v4}",
    color_up=default_color,
    color_down=default_color,
)

# CPU
status.register("cpu_usage",
    format="{usage:.0f}% CPU",
    color=default_color,
)

# Memory
status.register("mem",
    format="{percent_used_mem:.0f}% MEM",
    color=default_color,
    warn_percentage=60,
    alert_percentage=80,
    warn_color=warn_color,
    alert_color=alert_color,
)

# status.register("pulseaudio", format="{volume:02.f}% ",)
# status.register("dota2wins", steam_api_key="53AACE69A9E67ADE6560BCBCEB035C42", interval=30*60, steamid="opatut", matches=20, screenname='', format='🎮 {win_percent:.0f}%', good_threshold=55, bad_threshold=45)
# status.register("mpd", format="({status}) {artist} - {title} ({album}) ", status=dict(pause="", play="", stop=""))
# status.register(Toggl, apikey=os.environ["TOGGL_API_KEY"])
# status.register(Countdown, goal=datetime(2016, 9, 15, 10, 0, 0), text="Welpe")

status.run()
