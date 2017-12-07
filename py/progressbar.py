#!/bin/python
from time import sleep
import sys

if len(sys.argv) != 3:
    print "Usage:", sys.argv[0], "<total_time>", "<progressbar_size>"
    exit()

TOTTIME=float(sys.argv[1])
BARSIZE=float(sys.argv[2])

PERCRATE=100.0/TOTTIME
BARRATE=BARSIZE/TOTTIME

for i in range(int(TOTTIME)+1):
    sys.stdout.write('\r')
    s = "[%-"+str(int(BARSIZE))+"s] %d%% "
    sys.stdout.write(s % ('='*int(BARRATE*i), int(PERCRATE*i)))
    sys.stdout.flush()
    SLEEPTIME = 1.0
    if i == int(TOTTIME): SLEEPTIME = 0.1
    sleep(SLEEPTIME)
print ""
