#!/bin/bash
#
#
. config.sh

# options
#  -d
#  -p 27017:27017 \
#  --network "${APP}-network" \
#  mongod --replSet rs0

docker run -d \
  -e MONGO_INITDB_ROOT_USERNAME="$USER" \
  -e MONGO_INITDB_ROOT_PASSWORD="$PASSWORD" \
  -e MONGO_INITDB_DATABASE="$APP" \
  -v "$(pwd)/mongodb-data:/data/db" \
  --restart unless-stopped \
  --name "mongodb-${APP}" \
  --network "${APP}-network" \
  "mongodb-${APP}" \
  mongod
