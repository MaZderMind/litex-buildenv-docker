#!/bin/sh

docker tag litex-buildenv-docker:latest mazdermind/litex-buildenv-docker:latest
docker push mazdermind/litex-buildenv-docker:latest
