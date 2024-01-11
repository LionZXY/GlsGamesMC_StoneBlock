FROM alpine:3.19

RUN apk add --no-cache wget

RUN wget https://api.modpacks.ch/public/modpack/100/6967/server/linux

RUN mkdir -p /minecraft/ && chmod +x linux && ./linux 100 6967 --auto --path /minecraft/

COPY user_jvm_args.txt /minecraft/user_jvm_args.txt
COPY eula.txt /minecraft/eula.txt

CMD cd /minecraft/ && ls . && chmod +x ./start.sh && ./start.sh