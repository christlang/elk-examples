#!/bin/bash

set -a

source .env

echo "test elaasticsearch"
curl -u $ELASTICSEARCH_USERNAME:$ELASTICSEARCH_PASSWORD $ELASTICSEARCH_URL/_cluster/health && \
echo " "                   && \
echo " "                   && \
echo "test a"              && \
curl http://localhost:8081 && \
echo " "                   && \
echo " "                   && \
echo "test b"              && \
curl http://localhost:8082 && \
echo " "                   && \
echo " "                   && \
echo "test c"              && \
curl http://localhost:8083 && \
echo " "                   && \
echo " "                   && \
echo "test d"              && \
curl http://localhost:8091 && \
echo " "                   && \
echo " "                   && \
echo "test e"              && \
curl http://localhost:8092 && \
echo " "                   && \
echo " "                   && \
echo "test f"              && \
curl http://localhost:8093 && \
echo " "
echo " "
echo "finished with success"