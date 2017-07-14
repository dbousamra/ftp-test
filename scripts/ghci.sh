#!/bin/bash

set -eu

docker-compose run --rm -p 12345:12345 ftp-test stack ghci