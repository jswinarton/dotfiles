#!/usr/bin/env python
import argparse
import os
import subprocess

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
HOME = os.environ.get('HOME')

tasks = {}


def task(f):
    tasks[f.__name__] = f
    return f


@task
def symlink_dotfiles():
    print 'Symlinking dotfiles'
    dotfiles_path = os.path.join(BASE_DIR, 'dotfiles')

    for file in os.listdir(dotfiles_path):
        orig_path = os.path.join(dotfiles_path, file)
        dest_path = os.path.join(HOME, file)
        subprocess.call(['ln', '-sf', orig_path, dest_path])

@task
def install_atom_packages():
    print 'Installing atom packages'
    req_file = os.path.join(BASE_DIR, 'setup', 'apm_requirements.txt')
    subprocess.call(['apm', 'install', '--packages-file', req_file])


@task
def install_homebrew_packages():
    print 'Installing homebrew packages'
    req_file = os.path.join(BASE_DIR, 'setup', 'brew_requirements.txt')
    with open(req_file) as f:
        content = f.readlines()
    content = [i.strip() for i in content]  # strip newlines
    cmd = ['brew', 'install'] + content
    subprocess.call(cmd)


@task
def update_osx():
    print 'Updating OS X settings'
    script = os.path.join(BASE_DIR, 'setup', 'osx')
    subprocess.call(script)


@task
def install_everything():
    for name, f in tasks.iteritems():
        if name != 'install_everything':
            f()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('commands', metavar='commands', type=str, nargs='*')
    args = parser.parse_args()
    commands = args.commands

    if not commands:  # no commands specified
        print 'Available commands:\n'
        for task in tasks.keys():
            print task
    elif filter(lambda x: x not in tasks, commands):  # invalid command
        raise Exception('Invalid commands specified')
    else:
        for command in commands:
            tasks[command]()


if __name__ == '__main__':
    main()
