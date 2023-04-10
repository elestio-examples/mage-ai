#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 60s;

login=$(curl https://${DOMAIN}/api/sessions?api_key=zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2 \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  --data-raw '{"session":{"email":"admin@admin.com","password":"admin"},"api_key":"zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2"}' \
  --compressed)

  token=$(echo $login | jq -r '.session.token' )

  curl https://${DOMAIN}/api/users/1?api_key=zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2 \
  -X 'PUT' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'cookie: REQUIRE_USER_AUTHENTICATION=1; oauth_token='${token}'' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  --data-raw '{"user":{"username":"root","email":"'${ADMIN_EMAIL}'","password_current":"admin","password":"'${ADMIN_PASSWORD}'","password_confirmation":"'${ADMIN_PASSWORD}'"},"api_key":"zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2"}' \
  --compressed
