#!/usr/bin/env bash

set -e

url='https://downloads.raspberrypi.org/raspbian_lite_latest'
simultaneous='8'

aria2c -x "$simultaneous" "$url"
