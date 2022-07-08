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


# https://www.elastic.co/guide/en/beats/metricbeat/current/running-on-docker.html#_run_the_metricbeat_setup

docker run \
docker.elastic.co/beats/metricbeat:$ELASTICSEARCH_VERSION  \
  setup                                                    \
  -E setup.kibana.host=$KIBANA_URL                         \
  -E setup.kibana.username=$KIBANA_USERNAME                \
  -E setup.kibana.password=$KIBANA_PASSWORD                \
  -E output.elasticsearch.hosts=[$ELASTICSEARCH_URL]       \
  -E output.elasticsearch.username=$ELASTICSEARCH_USERNAME \
  -E output.elasticsearch.password=$ELASTICSEARCH_PASSWORD