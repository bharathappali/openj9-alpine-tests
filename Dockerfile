FROM bharathappali/openj9-jdk11-alpine

RUN apk update \
    && apk add make \
    apache-ant \
    perl-text-csv \
    perl-xml-parser \
    gdb \
    wget \
    git 

RUN mkdir -p /home/openj9-testspace; \
    cd /home/openj9-testspace; \
    git clone -b openj9-alpine-test https://github.com/bharathappali/openj9.git; \
    cd /usr/share/java/apache-ant/lib/; \
    wget https://github.com/bharathappali/openj9-alpine-builds/raw/master/tests/ant-contrib-1.0.jar

ENV TEST_JDK_HOME=/opt/java/openjdk

WORKDIR /home/openj9-testspace/openj9/test/TestConfig
