#!/bin/bash
mkdir -p dist
docker run \
    -v $(pwd):/vmq-jwt-auth-plugin \
    -v $(pwd)/dist:/bundler \
    -v $(pwd)/rebar-build.sh:/run.sh \
    -e DEBUG=1 \
    -e VERNEMQ_VERSION=1.12.6.2 \
    -e BUNDLER_CONFIG=/vmq-jwt-auth-plugin/rebar.config \
    vernemq/vmq-plugin-bundler
