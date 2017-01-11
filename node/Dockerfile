#実行
FROM centos:7

ENV NODE=node-v6.9.4-linux-x64
ENV HOME=/root/
ENV SRC_PATH=./
ENV DST_PATH=${HOME}node/
ENV START_TARGET=hello.js

RUN mkdir -p ${DST_PATH}
COPY ${SRC_PATH}${NODE}.tar.xz ${DST_PATH}
RUN cd ${DST_PATH}; xz -dv ${NODE}.tar.xz
RUN cd ${DST_PATH}; tar xfv ${NODE}.tar

COPY ${SRC_PATH}${START_TARGET} ${DST_PATH}
#RUN cd ${DST_PATH}; ${NODE}/bin/node ${START_TARGET}
RUN cd ${DST_PATH}; ln -s ${NODE}/bin/node node

ENTRYPOINT ["sh", "-c", "${DST_PATH}node ${DST_PATH}${START_TARGET}"]

EXPOSE 3000

# 作成と起動
# docker build -t peke2/node:1.0 .
# docker run -d -p 127.0.0.1:23000:3000 peke2/node:1.0
