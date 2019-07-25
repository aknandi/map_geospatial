#!/bin/bash

set -e

docker build . -t gcr.io/map-demo-0001/map_geospatial:$TRAVIS_COMMIT --build-arg git_username=$username --build-arg git_password=$password

echo $GCLOUD_SERVICE_KEY | base64 --decode -i > ${HOME}/gcloud-service-key.json
gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json

gcloud docker push gcr.io/map-demo-0001/map_geospatial