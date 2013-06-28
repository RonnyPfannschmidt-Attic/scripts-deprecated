import argparse
from mailcrop.imap import connect
from mailcrop.rules import MailingList as ML, Rule as R
from mailcrop.matching import Header


def pyML(name, suffix=None):
    if suffix is None:
        suffix = name
    target = 'Mailing Listen.python.' + suffix
    address = name + '@python.org'
    return ML(name, address, target)


def main(options, command, rules):
    imap = connect(command=command)
    imap.select(options.mailbox)
    imap.apply_rules(rules)


def MF(name):
    return 'Mailing Listen.' + name

rules = [
    pyML('pypy-dev'),
    pyML('python-ideas'),
    pyML('distutils-sig'),
    pyML('code-quality'),
    pyML('pytest-dev'),
    pyML('execnet-dev'),

    ML('TIP', 'testing-in-python@lists.idyll.org', MF('python.testing')),
    ML('pycologne', 'python-users@uni-koeln.de', MF('python.cologne')),
    ML('py bonn', 'bonn@lists.python-verband.org', MF('python.bonn')),

    ML('pygtk', 'pygtk@daa.com.au', MF('pygtk')),
    ML('docutils', 'docutils-users@lists.sourceforge.net', MF('docutils')),

    ML('couchdb-dev', 'dev@couchdb.apache.org', MF('couch-dev')),


    ML('flask', 'flask@librelist.com', MF('flask')),

    ML('hg', 'mercurial@selenic.com', MF('mercurial-devel')),
    ML('hg dev', 'mercurial-devel@selenic.com', MF('mercurial-devel')),

    ML('zim-wiki', 'zim-wiki@lists.launchpad.net', MF('zim-wiki')),

    R(
        'working github',
        matcher=Header('List-Post', '@reply.github.com'),
        target='working.gh',
    ),
    R(
        'working bb',
        matcher=Header('From', 'reply@bitbucket.org'),
        target='working.bb',
    ),
]


parser = argparse.ArgumentParser()
parser.add_argument('mailbox', nargs='?',
                    default='INBOX')
parser.add_argument('--command', default='ssh us ./bin/imap')

if __name__ == '__main__':
    options = parser.parse_args()
    main(options, options.command, rules)
