FROM ubuntu:16.04

RUN apt-get update \
	&& apt-get install -y wget \
	git \
	openjdk-7-jre \
	&& rm -rf /var/lib/apt/lists/*


COPY welcome.sh /welcome.sh
RUN chmod +x /welcome.sh && sync && \
    echo '[ ! -z "$TERM" -a -x /welcome.sh -a -x /welcome.sh ] && /welcome.sh' >> /etc/bash.bashrc

RUN useradd --create-home -s /bin/bash owl
WORKDIR /home/owl
USER owl

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
