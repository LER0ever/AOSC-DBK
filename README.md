# Unofficial AOSC Dockerized Buildkit

This project is mainly for myself.

If you are looking for a dockerized development environment, please try [LER0ever/EvDev](https://github.com/LER0ever/EvDev)

## Features
- Minimal EverVim
- AOSC.vim plugin
    - Autobuild / ABBS configuration syntax highlighting
    - Code snippets for common packaging tasks
    - Fugitive, git operation inside vim
- Preconfigured zsh and tmux

## Docker Hub
This docker image is automatically built every night using Travis CI and cron job.

## Usage
- Copy the `aosc-dbk` script to `/usr/local/bin`
- Navigate into an abbs tree
- `aosc-dbk`


## Notice
If you want to use this project as your packaging environment for whatever reason (which is highly unlikely),
please use the following config to create a derivative in order to get rid of my personal info (email, git identity, etc.)

```dockerfile
FROM ler0ever/aosc-dbk:latest
MAINTAINER Your Name <you@riseup.net>

# Add packages
RUN apt install \
    fish

# Override dotfiles
COPY vim/EverVim.vimrc $HOME/.EverVim.vimrc

# Override ab3cfg
COPY acbs/ab3cfg.sh /etc/autobuild/ab3cfg.sh

# ...
```


## License
GPL V3
