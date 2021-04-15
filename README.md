# Database mysql dump backup

## How to run

`sh database_backup.sh -u {user} -p {password} -d {database_name} -h {host} -c {container} -f {file_path} -b {gcp_bucket_uri}`

where:

- user: is the user to login to mysql e.g. root
- password: is the password
- database_name: name of the database you want to run the dump on
- host: must be `docker` if database is hosted in a docker container or `local` if the database is in the default localhost host name
- container (optional): is the container id of the docker container which hosts the database
- file_path: the path to the folder where the dump should go e.g. `/home/projects/mysql-backups`
- gcp_bucket_uri: uri of gcp storage bucket the backup should go e.g. `gs://example-backup-bucket`