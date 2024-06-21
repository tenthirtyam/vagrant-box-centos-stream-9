#!/usr/bin/env bash
set -e

VAGRANT_TOKEN=${VAGRANT_TOKEN:-""}

ruby --version
bundle install
ruby upload_artifact.rb
