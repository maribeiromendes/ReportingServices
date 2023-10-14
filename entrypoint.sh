#!/bin/bash
wait_time=30s
password=fakePassw0rd

if ! [ -d /var/opt/mssql/backup ]; then
  mkdir /var/opt/mssql/backup
fi

if [ -d /var/opt/mssql/backup ]; then
  echo "Backup directory exists or was created."

  cp AdventureWorks2022.bak /var/opt/mssql/backup

  if [ -f /var/opt/mssql/backup/AdventureWorks2022.bak ]; then
    echo "File exist."
  else 
    echo "AdventureWorks2022.bak does not exist."
  fi
else
  echo "Backup directory does not exists."
fi

until /opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U SA -P $password; do
  >&2 echo "SQL Server is unavailable - sleeping"
  sleep 1
done
  
 >&2 echo "SQL Server is up - executing command"

echo importing data will start in $wait_time...
sleep $wait_time
echo executing script...

/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./setup.sql