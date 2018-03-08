FROM aosc/aosc-os-buildkit:latest
MAINTAINER LER0ever (https://rongyi.blog)
ENV HOSTNAME LER0ever-AOSC-BK

RUN apt update && \
    apt full-upgrade && \

COPY EverVim.vimrc /root/.EverVim.vimrc
COPY EverVim.bundles /root/.EverVim.bundles

RUN apt install neovim -y && \
    curl -sLf https://raw.githubusercontent.com/LER0ever/EverVim/master/Boot-EverVim.sh | bash && \
    echo -e "Installing EverVim Distribution ...\n" && \
    nvim --headless +PlugInstall +qa &> /dev/null

WORKDIR /var/lib/acbs/repo

CMD [ "/bin/bash" ]
