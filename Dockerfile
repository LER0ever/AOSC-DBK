FROM aosc/aosc-os-buildkit:latest
MAINTAINER LER0ever (https://rongyi.blog)
ENV HOSTNAME LER0ever-AOSC-BK
ENV SHELL /bin/zsh
ENV HOME /root

# STPD localegen
COPY locale/locale.gen /etc/locale.gen

# Full upgrade
RUN apt update && \
    apt full-upgrade -y

RUN apt install the-silver-searcher ctags fzf -y

# EverVim minimal
# With aosc.vim plugin installed by default
COPY vim/EverVim.vimrc $HOME/.EverVim.vimrc
COPY vim/EverVim.bundles $HOME/.EverVim.bundles
RUN apt install neovim -y && \
    curl -sLf https://raw.githubusercontent.com/LER0ever/EverVim/master/Boot-EverVim.sh | bash && \
    echo -e "Installing EverVim Distribution ...\n" && \
    nvim --headless +PlugInstall +qa &> /dev/null

# ZSH
RUN apt install zsh thefuck -y && \
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
COPY zsh/zshrc $HOME/.zshrc
COPY zsh/void-mod.zsh-theme $HOME/.oh-my-zsh/custom/themes/

# Git config
COPY git/gitconfig $HOME/.gitconfig
COPY git/gitignore_global $HOME/.gitignore_global

# Autobuild config
COPY acbs/ab3cfg.sh /etc/autobuild/ab3cfg.sh
COPY acbs/forest.conf /etc/acbs/forest.conf

# Default to abbs
WORKDIR /workdir

CMD [ "/bin/zsh" ]
