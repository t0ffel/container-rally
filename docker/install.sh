#!/bin/sh

scl enable git19 bash
pip3.4 install esrally

mkdir -p ${HOME}/.rally
mkdir -p /root/.rally
chmod -R og+w /opt/app-root

scl enable git19 -- esrally list tracks

