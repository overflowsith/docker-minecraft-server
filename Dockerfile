FROM ubuntu:18.04

#ENV MINECRAFT_VERSION 1.14.4

RUN apt -y update; \
    apt -y upgrade; \
    apt install -y --no-install-recommends software-properties-common openjdk-8-jdk-headless wget; \
    wget -q https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar;

WORKDIR /data
VOLUME /data

EXPOSE 25565

COPY server.properties /data/server.properties

CMD echo eula=true > /data/eula.txt \
  && java -jar -Xms1G -Xmx2G -d64 /server.jar nogui
