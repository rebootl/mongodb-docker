. config.sh

for c in "${COLLECTIONS[@]}"; do
  mongoimport --db "$APP" \
    --collection data \
    --jsonArray \
    --file "/docker-entrypoint-initdb.d/${c}.json"
done
