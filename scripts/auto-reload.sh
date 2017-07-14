#!/bin/bash

set -eu

docker-compose run --rm ftp-test stack build --exec ftp-test --file-watch