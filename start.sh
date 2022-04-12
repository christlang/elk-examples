#!/bin/bash

sudo sysctl -w vm.max_map_count=262144

docker-compose up -d

echo "do setup in localhost:5601"
docker-compose exec elasticsearch bin/elasticsearch-create-enrollment-token --scope kibana
docker-compose exec kibana bin/kibana-verification-code
echo "create passwords"
docker-compose exec elasticsearch bin/elasticsearch-setup-passwords interactive

# docker-compose logs -f