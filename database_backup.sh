#!/bin/bash
while getopts "u:p:d:h:c:f:b:" flag;
do
    case $flag in
        u) user=$OPTARG      ;;
        p) password=$OPTARG      ;;
        d) db_name=$OPTARG      ;;
        h) host=$OPTARG      ;;
        c) container=$OPTARG      ;;
        f) file_directory=$OPTARG      ;;
        b) bucket_uri=$OPTARG      ;;
    esac
done

file_path="$file_directory/$db_name.sql"

if [[ $host == "docker" ]]; then
    docker exec $container /usr/bin/mysqldump -u $user --password=$password $db_name > $file_path || { echo "mysqldump failed for database $db_name" ; exit 1; }
elif [[ $host == "local" ]]; then
    mysqldump -u $user --password=$password -p $db_name > $file_path || { echo "mysqldump failed for database $db_name" ; exit 1; }
else
    echo "incorrect location flag given"
fi

gsutil cp -r $file_path $bucket_uri
