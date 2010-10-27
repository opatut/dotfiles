#!/usr/bin/python2
# -*- coding: cp1252 -*-

import sys
import dbus, gobject

#########################################################
# CONSTANTS                                             #
#########################################################

HELPINFO = '''Usage:
\t./.get_online_buddies.py [options]
Get Pidgin Buddies lists all buddies of your currently active pidgin accounts

Options:
\t-h  --help\tShow this help screen
\t-a  --all\tShow offline contacts as well
\t-c  --count\tOnly print the number of contacts fetched

AUTHOR:
\tPaul 'opatut' Bienkowski <paulbienkowski@aol.com>
'''


###########################################################
# CLASS DEFINITION                                        #
###########################################################

class PidginBuddies(object):
    def __init__(self, show_offlines = False):
        self.mBus = dbus.SessionBus()
        try:
            self.mObj = self.mBus.get_object("im.pidgin.purple.PurpleService", "/im/pidgin/purple/PurpleObject")
        except:
            print "Purple dbus interface not reachable."
            exit(1);
        self.mPurple = dbus.Interface(self.mObj, "im.pidgin.purple.PurpleInterface")
        self.mShowOfflines = show_offlines
    
    def GetBuddies(self):
        res = []
        for account in self.mPurple.PurpleAccountsGetAllActive():
            for buddy in self.mPurple.PurpleFindBuddies(account, ""):
                if (self.mShowOfflines or self.mPurple.PurpleBuddyIsOnline(buddy)):
                    res.append( self.mPurple.PurpleBuddyGetAlias(buddy).encode("utf-8") )
        
        return res



###########################################################
# MAIN PROGRAM                                            #
###########################################################

show_offlines = False
count = False

for arg in sys.argv[1:]:
    if arg == "--help" or arg == "-h":
        print HELPINFO
        exit(1)
    elif arg == "--all" or arg == "-a":
        show_offlines = True
    elif arg == "--count" or arg == "-c":
        count = True
    else:
        print "Unknown Parameter: "+arg
        print "Type \"--help\" for usage information."
        exit(1)

b = PidginBuddies(show_offlines);
if count:
    print len(b.GetBuddies())
else:
    for bu in b.GetBuddies():
        print bu
