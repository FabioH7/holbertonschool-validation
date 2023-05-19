# .build/Dockerfile

# Use an existing docker image as a base
FROM golang:1.15.8-alpine

# Set shell to ash (default for alpine)
SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN apk add --no-cache curl bash gcc musl-dev

# Set shell to bash
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install hadolint
RUN curl -sSfL -o /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.6.0/hadolint-Linux-x86_64 \
    && chmod +x /usr/local/bin/hadolint

# Install container-structure-test
RUN curl -sSfL -o /usr/local/bin/container-structure-test https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 \
    && chmod +x /usr/local/bin/container-structure-test

# Install golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin" v1.29.0

# hadolint ignore=DL3018
RUN apk add --no-cache hugo

# Set the working directory in the container
WORKDIR /go/src/app

# Copy everything from the current directory to the PWD (Present Working Directory) inside the container
COPY . .