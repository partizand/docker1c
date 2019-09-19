#!/bin/bash

/opt/1C/v8.3/x86_64/1cestart &

sleep 10 

# Ждем выполнения 1с (wait pid не работает!!! 1cestart стартует что-то еще, что уже не отследить)
# Без ожидания docker закрывается при окончании скрипта
SERVICE="1cv8s"
#RESULT=`ps -a | sed -n /${SERVICE}/p`


while ps -C ${SERVICE} >/dev/null 2>&1
do
   sleep 10
done 

#until [ "${RESULT:-null}" = null ]
#do
#sleep 5
# echo "Waiting..."
#done

echo "Done"

# if [ "${RESULT:-null}" = null ]; then
#     echo "not running"
# else
#     echo "running"
# fi
