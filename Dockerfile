FROM debian:buster-slim
RUN apt-get update && apt-get install -y git curl wget vim-tiny jpegoptim pngquant

WORKDIR /workspace

RUN git clone https://github.com/fszostak/bash-util-scripts.git
RUN ln -s /workspace/bash-util-scripts/src ~/scripts
RUN echo -n "\n\nexport PATH=$PATH:~/scripts" >> ~/.bashrc
RUN echo -n "\n\nexport PATH=$PATH:~/scripts" >> ~/.profile
