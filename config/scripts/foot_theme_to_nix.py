#!/usr/bin/env python

import sys
import re

print("colors = {")
for color, value in list(tuple(ul[0].split('=')) for ul in filter(lambda s: len(s) != 0, [re.findall(r"\w+=.*", el) for el in sys.stdin.readlines()])):
    print(f"\t{color} = \"{value.upper()}\";")
print("}")
