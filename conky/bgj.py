#!/usr/bin/env python3
import requests, json
try:
    data = requests.get("http://bacongamejam.org/current_jam_info").json()
    print(data["participants_count"])
except:
    print("??")
