from __future__ import print_function
from __future__ import unicode_literals
import os
from os.path import join, basename, dirname, abspath, expanduser

SCRIPTS = dirname(abspath(__file__))

links = [
    ('vim/rcfile', '~/.vimrc'),
    ('vim/', '~/.vim'),
]

for src, dst in links:
    dst = expanduser(dst)
    src = join(SCRIPTS, src)
    try:
        existing = os.readlink(dst)
    except OSError:
        existing = ''
    if existing != src:
        print('linking', src, 'to', dst)
        if existing:
            print('  was', existing)
        os.symlink(src, dst)

contents = [
    ('~/.hgrc', '%include {SCRIPTS}/configs/mercurial.ini\n'),
]


for dst, data in contents:
    data = data.format(SCRIPTS=SCRIPTS)
    dst = expanduser(dst)
    try:
        with open(dst) as fd:
            current = fd.read()
    except IOError:
        current = ''
    if data not in current:
        print('updating', dst, 'with\n ', repr(data))
        current = data + current
        with open(dst, 'w') as fd:
            fd.write(current)
