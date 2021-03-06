FROM 0x01be/maven

RUN apk add --no-cache --virtual ride-build-dependencies \
    git \
    unzip \
    openjdk11-jdk \
    openjdk11-doc

ENV RIDE_REVISION develop
RUN git clone --depth 1 --branch ${RIDE_REVISION} https://github.com/adobe/ride.git /ride

WORKDIR /ride/build

ENV JAVA_HOME /usr/lib/jvm/default-jvm/
RUN mvn -Dmaven.test.skip=true package

