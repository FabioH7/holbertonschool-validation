#!/bin/bash
apt-get update && apt-get install -y git make wget build-essential && wget https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb && dpkg -i hugo_extended_0.109.0_linux-amd64.deb 

make build