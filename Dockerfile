FROM ubuntu:15.04
MAINTAINER supermomonga
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libsqlite3-dev \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*


RUN curl -s --insecure --location http://github.com/kabukky/journey/releases/download/v0.1.9/journey-linux-amd64.zip > /journey.zip
RUN unzip /journey.zip
RUN mv /journey-linux-amd64 /journey
RUN rm /journey.zip

COPY journey.sh /journey.sh
RUN chmod +x /journey.sh

VOLUME ["/data"]

EXPOSE 8080:8080

ENV JOURNEY_HTTP_PORT=8080

CMD ["/journey.sh"]
