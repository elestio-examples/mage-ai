#set env vars
#set -o allexport; source .env; set +o allexport;

apt install jq -y

mkdir -p ./pgdata
chown -R 1000:1000 ./pgdata

mkdir -p ./data
chown -R 1000:1000 ./data

mkdir -p ./mage_data
chown -R 1000:1000 ./mage_data