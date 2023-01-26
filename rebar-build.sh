#!/usr/bin/env bash
set -e

curl https://raw.githubusercontent.com/vernemq/vernemq/${VERNEMQ_VERSION:-master}/rebar.lock --output vernemq.rebar.lock
rebar3 get-deps
rm -Rf _build
rebar3 compile
find -L _build/default/lib -regex ".*\/\(plugins\|ebin\|priv\)\/.*" -print0 | tar -cvf bundle.tar -T-
gzip bundle.tar
mv bundle.tar.gz bundler/vmq-jwt-auth-plugin.tar.gz
