FROM openjdk:8

LABEL maintainer="Pagero RnD <rnd@pagero.com>"
ARG VERSION=MUST_BE_SET_WITH_BUILD_ARG_FLAG

ENV DOWNLOAD http://www.h2database.com/h2-${VERSION}.zip
ENV DATA_DIR /opt/h2-data

RUN curl ${DOWNLOAD} -o h2.zip \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip \
    && mkdir -p ${DATA_DIR}

EXPOSE 81 1521

CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
 	-web -webAllowOthers -webPort 81 \
 	-tcp -tcpAllowOthers -tcpPort 1521 \
 	-baseDir ${DATA_DIR}
