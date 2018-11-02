#Dockerfile

FROM tomcat:9.0.11

LABEL maintainer="greg@servantscode.org"

RUN curl -L -O "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.4.2-amd64.deb" && \
    dpkg -i filebeat-6.4.2-amd64.deb;

COPY ./filebeat/filebeat.yml /etc/filebeat/filebeat.yml
COPY docker-entrypoint /usr/local/bin

RUN rm -rf /usr/local/tomcat/webapps/*
CMD "/usr/local/bin/docker-entrypoint"
