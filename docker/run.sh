#!/bin/sh

scl enable git19 -- esrally --pipeline=benchmark-only --target-hosts=${TARGET_HOSTS}

