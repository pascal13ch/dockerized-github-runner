FROM debian:bullseye-slim

ENV GH_RUNNER_NAME=""
ENV GH_RUNNER_TOKEN=""
ENV GH_RUNNER_URL=""
ENV GH_RUNNER_LABELS=""


RUN apt-get update
RUN apt-get install -y \
    curl

RUN curl -fsSL https://get.docker.com -o- | sh && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean


RUN curl -L -o /usr/local/bin/docker-compose \
    "https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-$(uname -s)-$(uname -m)" && \
    chmod +x /usr/local/bin/docker-compose

RUN useradd -ms /bin/bash gh_runner
WORKDIR /home/gh_runner

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER gh_runner


RUN curl -o actions-runner-linux-x64-2.300.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.300.2/actions-runner-linux-x64-2.300.2.tar.gz
RUN tar xzf ./actions-runner-linux-x64-2.300.2.tar.gz

ENTRYPOINT [ "/entrypoint.sh" ]