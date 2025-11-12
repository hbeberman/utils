#! /bin/bash
docker build -t simple:0.0.1 -f simple-0.0.1.yml --target=azlinux3/testing/sysext --output=_output .
