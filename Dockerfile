FROM alpine:3.19

RUN apk add --no-cache wget

RUN wget https://api.modpacks.ch/public/modpack/100/6967/server/linux

RUN mkdir -p /minecraft/ && chmod +x linux && ./linux 100 6967 --auto --path /minecraft/

RUN ls /minecraft/
RUN cat user_jvm_args.txt

CMD /minecraft/start.sh