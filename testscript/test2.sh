#!/bin/bash
source .env
# Read the rootUrl value from the JSON file
jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json
rootUrl=$(jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json)

# Replace the rootUrl with the one from the .env file
sed -i "s|$rootUrl|$ROOT_URL|g" keycloak/esdl-mapeditor-realm.json 