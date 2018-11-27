#!/usr/bin/env python

import sys
from subprocess import check_output

blacklist = [l.strip() for l in open('blacklist', 'r').readlines()]


def in_blacklist(section: str) -> bool:
    title = section.split('\n')[0]
    for pattern in blacklist:
        if pattern in title:
            return True
    return False


config = check_output(['dconf', 'dump', '/']).decode().strip()

sections = config.split('\n\n')
filtered = [s for s in sorted(sections) if not in_blacklist(s)]

with open('config', 'w') as f:
    f.write('\n\n'.join(filtered))
