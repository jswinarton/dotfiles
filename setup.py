#!/usr/bin/env python
import argparse
import os
import subprocess

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
HOME = os.environ.get('HOME')


def symlink_dotfiles():
    dotfiles_path = os.path.join(BASE_DIR, 'dotfiles')
    for current, dirs, files in os.walk(dotfiles_path):
        for file in files:
            orig_path = os.path.join(current, file)
            rel_path = os.path.relpath(orig_path, dotfiles_path)
            dest_path = os.path.join(HOME, rel_path)
            subprocess.call(['ln', '-sf', orig_path, dest_path])


def install_atom_packages():
    req_file = os.path.join(BASE_DIR, 'setup', 'apm_requirements.txt')
    subprocess.call(['apm', 'install', '--packages-file', req_file])


def install_homebrew_packages():
    req_file = os.path.join(BASE_DIR, 'setup', 'brew_requirements.txt')
    with open(req_file) as f:
        content = f.readlines()
    content = [i.strip() for i in content]  # strip newlines
    cmd = ['brew', 'install'] + content
    subprocess.call(cmd)


def update_osx():
    script = os.path.join(BASE_DIR, 'setup', 'osx')
    subprocess.call(script)


def update_git_config():
    subprocess.call([
        'git', 'config', '--global',
        'core.excludesfile', '~/.gitignore_global'])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('commands', metavar='commands', type=str, nargs='+')

    args = parser.parse_args()
    for command in args.commands:
        globals()[command]()


if __name__ == '__main__':
    main()
