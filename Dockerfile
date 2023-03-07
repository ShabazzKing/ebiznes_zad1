FROM ubuntu:jammy

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3.8

EXPOSE 80

RUN adduser --shell /bin/bash lkonieczny
RUN adduser lkonieczny sudo
USER lkonieczny
WORKDIR /home/lkonieczny/

CMD /bin/bash
