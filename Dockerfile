FROM ubuntu:16.04

RUN apt-get update \
  apt-get install -y wget \
  git \
  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean

COPY welcome.sh /welcome.sh
RUN chmod +x /welcome.sh && sync && \
    echo '[ ! -z "$TERM" -a -x /welcome.sh -a -x /welcome.sh ] && /welcome.sh' >> /etc/bash.bashrc

RUN useradd --create-home -s /bin/bash owl
WORKDIR /home/owl
USER owl

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
