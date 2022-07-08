#!/bin/bash

set -a

source .env

# https://www.elastic.co/guide/en/beats/heartbeat/current/heartbeat-installation-configuration.html#setup-assets

docker run \
  -v $PWD/configs/heartbeat.yml:/usr/share/heartbeat/heartbeat.yml \
  -e ELASTICSEARCH_USERNAME=$ELASTICSEARCH_USERNAME        \
  -e ELASTICSEARCH_PASSWORD=$ELASTICSEARCH_PASSWORD        \
  -e ELASTICSEARCH_URL=$ELASTICSEARCH_URL                  \
  -e KIBANA_URL=$KIBANA_URL                                \
  -e KIBANA_USERNAME=$KIBANA_USERNAME                      \
  -e $KIBANA_PASSWORD=$$KIBANA_PASSWORD                    \
  docker.elastic.co/beats/heartbeat:$ELASTICSEARCH_VERSION \
  setup -e


# https://github.com/elastic/uptime-contrib