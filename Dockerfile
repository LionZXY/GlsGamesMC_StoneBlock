FROM alpine:3.19

RUN apk add --no-cache wget bash

RUN wget https://api.modpacks.ch/public/modpack/100/6967/server/linux

RUN mkdir -p /minecraft/ && chmod +x linux && ./linux 100 6967 --auto --path /minecraft/ &&  chmod +x /minecraft/start.sh

ADD user_jvm_args.txt /minecraft/user_jvm_args.txt
ADD eula.txt /minecraft/eula.txt
RUN rm /minecraft/mods/ironfurnaces-1.18.2-3.3.3.jar
ADD mods/* /minecraft/mods/

CMD cd /minecraft/ && ./start.sh