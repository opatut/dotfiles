#!/usr/bin/env python2
import codecs

def conky_im(account, sender, message, conversation, flags):
    # remove html tags
    message = re.sub('<(.|\n)+?>', '', message)#[0:24]
    maxlen = 40
    if len(message) > maxlen:
        message = message[0:maxlen] + "..."
    sender = sender.split("@")[0]
    IM = sender + ":${color} " + message + "\n"
    with codecs.open("/home/paul/scripts/conky/pidgin_log.txt", "a", encoding="utf-8") as f:
        f.write(IM.decode("utf-8").encode("utf-8"))

import dbus, gobject, re
from dbus.mainloop.glib import DBusGMainLoop
dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
bus = dbus.SessionBus()

bus.add_signal_receiver(conky_im,
        dbus_interface="im.pidgin.purple.PurpleInterface",
        signal_name="ReceivedImMsg")

loop = gobject.MainLoop()
loop.run()
