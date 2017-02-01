#!/bin/sh

set -e

export LANG=C

DISTRIBUTION=$(basename ${PWD} | cut -f1 -d '-')

docker build --pull --tag=aboudra/robot .
