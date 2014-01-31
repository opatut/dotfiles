#!/usr/bin/env python3

from math import sqrt, ceil, log
from time import strftime

global formatMode, divider
formatMode = "numbers"
divider = " "

def powerOfTwo(n):
    return int(pow(2, ceil(log(n, 2))))

def formatOnOff(string, on):
    #return "${color" + ("3" if on else "2") + "}" + "\u2022" #str(string)
    s = "${color" + ("2" if on else "3") + "}"
    if formatMode == "numbers":
        s += str(string) 
    elif formatMode == "bullets":
        s += "\u2022"
    else:
        s += "?"
    #s += "${color3}"
    return s

def binaryPrint(num, until = 0):
    i = powerOfTwo(until if until else num)
    left = num
    while i >= 1:
        on = (left >= i)
        print(formatOnOff(i, on), end = divider if i != 1 else "")
        if on: left = left - i
        i = i // 2


second = int(strftime("%S"))
minute = int(strftime("%M"))
hour   = int(strftime("%H"))

font = "BIRTH OF A HERO:bold"

formatMode = "numbers"
divider = "   "
print("${font " + font + ":pixelsize=58}", end = "")
binaryPrint(hour, 16)
print("\n${voffset -20}${font " + font + ":pixelsize=42}", end = "")
binaryPrint(minute, 32)

formatMode = "bullets"
divider = " "
print("\n${voffset -15}${font Arial:pixelsize=40}", end = "")
binaryPrint(second, 32)
print("${voffset -30}")
