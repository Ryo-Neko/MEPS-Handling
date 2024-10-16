#!/bin/bash

docker run -it -u worker --mount type=bind,source=.,target=/home/worker/calc -p 8888:8888 python:3.10-slim /bin/bash

