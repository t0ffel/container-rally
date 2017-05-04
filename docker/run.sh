#!/bin/sh

echo "I'm in the container!"

echo "TARGET HOSTS are: ${TARGET_HOSTS}"

scl enable git19 -- esrally --pipeline=benchmark-only --target-hosts=${TARGET_HOSTS}

