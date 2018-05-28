FROM debian:jessie

ENV MINECRAFT_VERSION 1.12.2

RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list; \
    apt-get -y update; \
    apt install -y -t jessie-backports openjdk-8-jre-headless ca-certificates-java wget; \
    wget -q https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VERSION}/minecraft_server.${MINECRAFT_VERSION}.jar;

WORKDIR /data
VOLUME /data

EXPOSE 25565

COPY server.properties /data/server.properties

CMD echo eula=true > /data/eula.txt \
  && java -jar -Xms1G -Xmx2G -d64 /minecraft_server.${MINECRAFT_VERSION}.jar nogui
