#!/bin/bash

docker run -it --mount type=bind,source=.,target=/home/worker/calc -p 8888:8888 python:3.10-slim /bin/bash

