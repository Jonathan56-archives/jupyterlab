#!/bin/bash

docker build -t lanceyjupyterlab -f config/lanceyjupyterlab.Dockerfile .
docker run -ti -v ${PWD}:/usr/local/bin/lanceyjupyterlab -p 8888:8888 lanceyjupyterlab