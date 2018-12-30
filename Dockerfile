# ----------------------------------
FROM        ubuntu:18.04

MAINTAINER  Nils S. <nilsansa@gmail.com>

# Install Dependencies
RUN         apt update && \
            apt upgrade -y && \
            apt install minetestserver
            apt remove minetestserver minetest-data
            useradd -d /home/container -m container && \
            cd /home/container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
