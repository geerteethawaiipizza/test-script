#!/bin/bash

#Import env file
source .env

# Get the ESDLDRIVE rootUrl value from the JSON file

oldrootUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json)
echo "Old value of ESDLDriverootUrl: $newrootUrl" 
jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json

# Replace the Urls of ESDLdrive value with the one from the .env file

sed -i "s#\(\"rootUrl\" : \"\).*\(\",\)#\1${GF_SERVER_ROOT_URL}\2#" keycloak/esdl-mapeditor-realm.json
newrootUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json)
echo "New value of ESDLDriverootUrl: $newrootUrl" 


#sed -i "s|$grafanarootUrl|$GF_SERVER_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json 





# # Read the rootUrl value from the JSON file
jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json
# # grafanarootUrl=$(jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json)

# # # Replace the rootUrl with the one from the .env file
# # sed -i "s|$grafanarootUrl|$GF_SERVER_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json
# sed -i "/\"clientId\" : \"$CLIENT_ID\"/,/}/ s/\(\"rootUrl\" : \"\).*\(\",\)/\1$ROOT_URL\2/" $JSON_FILE

