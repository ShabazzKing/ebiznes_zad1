FROM ubuntu:jammy

ENV TZ="Europe/Warsaw"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y software-properties-common sudo openssl
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y curl unzip python3.8 openjdk-8-jdk kotlin
RUN curl https://downloads.gradle-dn.com/distributions/gradle-8.0.2-bin.zip --output gradle.zip && mkdir /opt/gradle && unzip -d /opt/gradle gradle.zip
RUN ln -s /opt/gradle/gradle-8.0.2/bin/gradle /usr/bin/gradle

EXPOSE 80

RUN adduser --shell /bin/bash lkonieczny
RUN adduser lkonieczny sudo
RUN usermod -p "$(openssl passwd -6 haslo)" lkonieczny
USER lkonieczny
WORKDIR /home/lkonieczny/

CMD /bin/bash
