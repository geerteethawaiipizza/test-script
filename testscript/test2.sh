#!/bin/bash
source .env
# Read the rootUrl value from the JSON file
jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json
grafanarootUrl=$(jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json)

# Replace the rootUrl with the one from the .env file
sed -i "s|$grafanarootUrl|$GF_SERVER_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json
echo "naar:" 
jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json
echo ""
jq -r '.clients[] | select(.clientId == "esdl-mapeditor") | .rootUrl' keycloak/esdl-mapeditor-realm.json
mapeditorrootUrl=$(jq -r '.clients[] | select(.clientId == "esdl-mapeditor") | .rootUrl' keycloak/esdl-mapeditor-realm.json)

# Replace the rootUrl with the one from the .env file
sed -i "s|$mapeditorrootUrl|$MAPEDITOR_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json
echo "naar:"
jq -r '.clients[] | select(.clientId == "esdl-mapeditor") | .rootUrl' keycloak/esdl-mapeditor-realm.json
echo ""
jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json
driverootUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json)

# Replace the rootUrl with the one from the .env file
sed -i "s|$driverootUrl|$DRIVE_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json 
echo "naar:"
jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json
echo ""