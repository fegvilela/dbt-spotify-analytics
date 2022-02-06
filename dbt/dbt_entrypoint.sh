#!/bin/bash
if [ [ -d /spotify_analytics ]]; then
	echo "spotify_analytics exists"
else
	echo "spotify_analytics doesnt exist"
  dbt init spotify_analytics
fi
cp -r /dbt_init/. /dbt/spotify_analytics &&
cp -r /data/. /dbt/spotify_analytics/data &&
rm -rf /dbt/spotify_analytics/models/example &&
mv /dbt/spotify_analytics/profiles.yml /root/.dbt/profiles.yml &&
cd /dbt/spotify_analytics &&
dbt debug &&
dbt deps &&
dbt seed &&
tail -f /dev/null
# dbt run &&
# dbt test &&
# dbt docs generate &&
# dbt docs serve


# #!/bin/bash
# cp -r /data/. /dbt/data &&
# dbt debug --profiles-dir . &&
# dbt seed --profiles-dir . &&
# dbt deps --profiles-dir . &&
# dbt run --profiles-dir . &&
# dbt test --profiles-dir .  &&
# dbt docs generate --profiles-dir . &&
# dbt docs serve --profiles-dir .