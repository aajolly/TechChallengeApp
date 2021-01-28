#!/bin/bash
apk update
apk add postgresql-client

echo "Check if we need new table or not"
export PGPASSWORD="$VTT_DBPASSWORD"
data=(`psql -w -d $VTT_DBNAME -h $VTT_DBHOST -p $VTT_DBPORT -U $VTT_DBUSER -c 'SELECT table_schema,table_name FROM information_schema.tables;'`)
if printf -- '%s\n' "${data[@]}" | grep -q "tasks"; then
		echo "Tasks table found, not creating."
	else
			echo "Tasks table not found, creating."
				./TechChallengeApp updatedb -s
fi

echo "Starting app"
./TechChallengeApp serve