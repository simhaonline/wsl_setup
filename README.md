# WSL setup

This script is intended for my personal use only, but if you want to tweak it for *your* 
personal use read along.

Go through wsl_setup.sh file in this repo, it is like the main() function of this setup program.
It works with both WSL v1 and v2.

The bin directory, if present, contains all the executables that I need in my User's PATH. This may
include static binaries like `hugo` or bash scripts that simplify everyday work.

The snippets directory contain fragments of code to be inserted in `~/.bashrc` and/or `~/.profile`,
as well as config files like .vimrc and .tmux.conf.
