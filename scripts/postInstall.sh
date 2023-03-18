#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 20s;

login=$(curl https://${DOMAIN}/api/sessions?api_key=zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2 \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  --data-raw '{"session":{"email":"jojo@admin.com","password":"admin"},"api_key":"zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2"}' \
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



















#   curl https://${DOMAIN}/api/sessions?api_key=zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2 \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: application/json' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
#   --data-raw '{"session":{"email":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'"},"api_key":"'${token}'"}' \
#   --compressed



# curl https://${DOMAIN}/api/users/1?api_key=zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2 \
#   -X 'PUT' \
#   -H 'authorization: Bearer rA_ZYilX_Z21AEKOBRFtjaBDylRJ9xRuvkJplsU6fcA' \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: application/json' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
#   --data-raw '{"user":{"username":"root","email":"'${ADMIN_EMAIL}'","password_current":"admin","password":"'${ADMIN_PASSWORD}'","password_confirmation":"'${ADMIN_PASSWORD}'"},"api_key":"'${token}'"}' \
#   --compressed




#   curl 'https://mage-ai-yuyuyu-u353.vm.elestio.app/api/users/1?api_key=zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2' \
#   -X 'PUT' \
#   -H 'authority: mage-ai-yuyuyu-u353.vm.elestio.app' \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'authorization: Bearer rA_ZYilX_Z21AEKOBRFtjaBDylRJ9xRuvkJplsU6fcA' \
#   -H 'content-type: application/json' \
#   -H 'cookie: ajs_anonymous_id=93fd7d45-2f30-4972-b019-93f1cdd540a9; _ga_R4YJ9JN8L4=GS1.1.1676460410.18.1.1676461759.0.0.0; _ga=GA1.2.2136135344.1675585239; ph_phc_7F92HoXJPeGnTKmYv0eOw62FurPMRW9Aqr0TPrDzvHh_posthog=%7B%22distinct_id%22%3A%22sq1dBVll3Ecwof60SbBGM%22%2C%22%24device_id%22%3A%22185fe5c0c521826-0d7abf7a8f6f13-26021051-1fa400-185fe5c0c53ad7%22%2C%22%24referrer%22%3A%22https%3A%2F%2Fdash.elest.io%2F%22%2C%22%24referring_domain%22%3A%22dash.elest.io%22%2C%22%24sesid%22%3A%5B1678091403064%2C%22186b5ea7884fe8-04b34fe8f4490c-26031951-1fa400-186b5ea788519bf%22%2C1678089287812%5D%2C%22%24user_id%22%3A%22sq1dBVll3Ecwof60SbBGM%22%2C%22%24active_feature_flags%22%3A%5B%5D%2C%22%24enabled_feature_flags%22%3A%7B%7D%2C%22%24session_recording_enabled_server_side%22%3Afalse%2C%22%24feature_flag_payloads%22%3A%7B%7D%2C%22%24user_state%22%3A%22identified%22%7D; ph_phc_nSin8j5q2zdhpFDI1ETmFNUIuTG4DwKVyIigrY10XiE_posthog=%7B%22distinct_id%22%3A%22amsellem.joseph%40gmail.com%22%2C%22%24device_id%22%3A%22186977993eb125e-0d3174c114d09a-26031951-1fa400-186977993ec1974%22%2C%22%24referrer%22%3A%22%24direct%22%2C%22%24referring_domain%22%3A%22%24direct%22%2C%22%24sesid%22%3A%5B1678284432697%2C%22186c18c2539eba-0e29e992cc837c-26031951-1fa400-186c18c253a106e%22%2C1678284432697%5D%2C%22%24session_recording_enabled_server_side%22%3Afalse%2C%22%24active_feature_flags%22%3A%5B%5D%2C%22%24enabled_feature_flags%22%3A%7B%7D%2C%22%24user_id%22%3A%22amsellem.joseph%40gmail.com%22%7D; REQUIRE_USER_AUTHENTICATION=1; oauth_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzIjoxNjgxMjIxMjU4LjM4MDU1MSwidG9rZW4iOiJyQV9aWWlsWF9aMjFBRUtPQlJGdGphQkR5bFJKOXhSdXZrSnBsc1U2ZmNBIn0.-a3-6P_FqKMF4FubW_NMS_PayAbhFrXo9zlzR5sg_fk' \
#   -H 'origin: https://mage-ai-yuyuyu-u353.vm.elestio.app' \
#   -H 'referer: https://mage-ai-yuyuyu-u353.vm.elestio.app/settings/account/profile' \
#   -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
#   --data-raw '{"user":{"username":"jojo","email":"jojo@admin.com"},"api_key":"zkWlN0PkIKSN0C11CfUHUj84OT5XOJ6tDZ6bDRO2"}' \
#   --compressed