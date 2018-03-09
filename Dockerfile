FROM aosc/aosc-os-buildkit:latest
MAINTAINER LER0ever (https://rongyi.blog)
ENV HOSTNAME LER0ever-AOSC-BK
ENV SHELL /bin/zsh
ENV HOME /root

# Fuck that localegen
COPY locale.gen /etc/locale.gen

# Full upgrade
RUN apt update && \
    apt full-upgrade -y

# EverVim minimal
COPY EverVim.vimrc $HOME/.EverVim.vimrc
COPY EverVim.bundles $HOME/.EverVim.bundles
RUN apt install neovim -y && \
    curl -sLf https://raw.githubusercontent.com/LER0ever/EverVim/master/Boot-EverVim.sh | bash && \
    echo -e "Installing EverVim Distribution ...\n" && \
    nvim --headless +PlugInstall +qa &> /dev/null

# ZSH
RUN apt install zsh thefuck -y && \
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
COPY zsh/zshrc $HOME/.zshrc
COPY zsh/void-mod.zsh-theme $HOME/.oh-my-zsh/custom/themes/

# Default to abbs
WORKDIR /var/lib/acbs/repo

CMD [ "/bin/zsh" ]
