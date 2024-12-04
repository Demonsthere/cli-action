FROM alpine:3.20 AS deps

ENV ORY_CLI_VERSION=1.1.0

WORKDIR /usr/local/bin
RUN apk update && \
	apk add curl &&\
	curl -L "https://github.com/ory/cli/releases/download/v${ORY_CLI_VERSION}/ory_${ORY_CLI_VERSION}-linux_sqlite_libmusl_64bit.tar.gz" | tar -xmz

# ####
FROM alpine:3.20 AS runner

COPY --from=deps /usr/local/bin/ory /usr/local/bin/ory

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
