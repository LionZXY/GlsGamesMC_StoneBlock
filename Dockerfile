FROM alpine:3.19

RUN apk add --no-cache wget bash

RUN wget https://api.modpacks.ch/public/modpack/100/6967/server/linux

RUN mkdir -p /minecraft/ && chmod +x linux && ./linux 100 6967 --auto --path /minecraft/ &&  chmod +x /minecraft/start.sh

COPY user_jvm_args.txt /minecraft/user_jvm_args.txt
COPY eula.txt /minecraft/eula.txt
COPY mods/telegrambridge-1.18.2-1.3.2.jar /minecraft/mods/telegrambridge-1.18.2-1.3.2.jar

CMD cd /minecraft/ && ./start.sh