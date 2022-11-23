## Image de base
FROM debian:11.1
## Installation de paquets
RUN apt update -y && \
    apt install -y build-essential libfuse-dev libcurl4-openssl-dev libxml2-dev pkg-config libssl-dev mime-support automake libtool wget tar git unzip mariadb-client lsb-release
##Installation docker CLI pour se connecter aux autres DB
RUN apt install -y ca-certificates curl gnupg 
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update
RUN apt install -y docker-ce-cli
## Installation de AWS CLI
RUN apt update && \
    apt install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt clean
RUN pip3 --no-cache-dir install --upgrade awscli
## Entrypoint
COPY start-script.sh start-script.sh
RUN chmod +x ./start-script.sh
ENTRYPOINT [ "./start-script.sh" ]
CMD [ "/bin/bash" ]