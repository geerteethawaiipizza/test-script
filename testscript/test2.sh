#!/bin/bash
source .env

# # Read the rootUrl value from the JSON file
# # jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json
# # grafanarootUrl=$(jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json)

# # # Replace the rootUrl with the one from the .env file
# # sed -i "s|$grafanarootUrl|$GF_SERVER_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json
# sed -i "/\"clientId\" : \"$CLIENT_ID\"/,/}/ s/\(\"rootUrl\" : \"\).*\(\",\)/\1$ROOT_URL\2/" $JSON_FILE


# Get the rootUrl value from the JSON file
rootUrl=$(jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json)

# Replace the rootUrl value with the one from the .env file
echo "nieuw:"
sed -i "s#\(\"rootUrl\" : \"\).*\(\",\)#\1${GF_SERVER_ROOT_URL}\2#" keycloak/esdl-mapeditor-realm.json
# sed -i "s|$grafanarootUrl|$GF_SERVER_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json