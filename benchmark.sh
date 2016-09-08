#!/bin/sh

# see https://github.com/wg/wrk/, brew install wrk
wrk -t10 -c100 -d30s http://localhost:3333/ping; echo;
