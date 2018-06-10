#!/bin/bash
# echo "Running db:create"
# bundle exec rake db:create
# echo "Running db:migrate"
# bundle exec rake db:migrate

# sh ./set-env.sh
# export PORT=5000
# export DB_HOST=host.docker.internal
# export USERNAME=baldor
# export PASSWORD=baldor123
# cat ./.env
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
while read p; do
  export $p
  echo $p
done < ./.env
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
