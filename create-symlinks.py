#!/usr/bin/env python3

import os

with open('symlinks.txt') as f:
    for line in f.readlines():
        line = line.strip() if line else None
        if not line or line[0] == "#": continue

        source1, target1 = line.strip().split()

        source = os.path.abspath(os.path.expandvars(source1))
        target = os.path.abspath(os.path.expandvars(os.path.expanduser(target1)))

        if os.path.exists(target):
            print("Skipping " + target1 + ", file exists")
            continue

        # create directories
        dir = os.path.dirname(target)
        if not os.path.exists(dir):
            os.makedirs(dir)

        try:
            os.symlink(source, target)
            print(source + " -> " + target)
        except FileExistsError:
            print("Broken symbolic link: " + target + ", fixing.")
            os.remove(target)
            os.symlink(source, target)
            print(source + " -> " + target)

