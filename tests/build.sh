#!/usr/bin/env bash
docker buildx build . --output type=docker,name=elestio4test/mage-ai:latest | docker load


