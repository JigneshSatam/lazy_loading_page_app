#!/bin/bash
if [ -f ./tmp/pids/server.pid ]
then
  echo "#############################################"
  echo "           Removing Server Pid               "
  rm ./tmp/pids/server.pid
  echo "#############################################"
  echo
fi

echo "#############################################"
echo "        Setting Environment Variables        "

echo "PORT: $PORT"
echo "Database url: $DATABASE_URL"
echo "#############################################"
echo

echo "#############################################"
echo "              Creating Database              "
bundle exec rake db:create
echo "#############################################"
echo

echo "#############################################"
echo "              Migrating Database             "
bundle exec rake db:migrate
echo "#############################################"
echo

echo "#############################################"
echo "               Starting server               "
echo "#############################################"
echo
bundle exec rails s -p $PORT -b '0.0.0.0'
