#!/bin/bash

#Import env file
source .env

DriveUrls () {
    oldrootUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json)
    oldbaseUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .baseUrl' keycloak/esdl-mapeditor-realm.json)
    redirectUris=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .redirectUris[0]' keycloak/esdl-mapeditor-realm.json)
    echo "Old value of ESDLDriverootUrl: $oldrootUrl" 
    echo "Old value of ESDLDrivebaseUrl: $oldbaseUrl"
    echo "Old value of ESDLDriveredirectUris: $oldredirectUris"
    # Replace the Urls of ESDLdrive value with the one from the .env file
    sed -i "s#\(\"rootUrl\" : \"\).*\(\",\)#\1${DRIVE_ROOT_URL}\2#" keycloak/esdl-mapeditor-realm.json
    sed -i "s#\(\"baseUrl\" : \"\).*\(\",\)#\1${DRIVE_BASE_URL}\2#" keycloak/esdl-mapeditor-realm.json
    # sed -i "s|\(\"redirectUris\" : \[\)\"https://drive.essim.online/\\*\"|\1\"${DRIVE_REDIRECT_URI}\"|" keycloak/client-list.json
    sed -i "s|\"\(${redirectUris//\//\\/}\)\"|\"${DRIVE_REDIRECT_URI//\//\\/}\"|g" keycloak/esdl-mapeditor-realm.json

    newrootUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json)
    newbaseUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .baseUrl' keycloak/esdl-mapeditor-realm.json)
    newredirectUris=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .redirectUris[0]' keycloak/esdl-mapeditor-realm.json)
    echo "New value of ESDLDriverootUrl: $newrootUrl"
    echo "New value of ESDLDrivebaseUrl: $newbaseUrl"
    echo "New value of ESDLDriveredirectUris: $newredirectUris"
}



DriveUrls





# redirectUris
# baseUrl

#sed -i "s|$grafanarootUrl|$GF_SERVER_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json 





# # Read the rootUrl value from the JSON file
#jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json
# # grafanarootUrl=$(jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json)

# # # Replace the rootUrl with the one from the .env file
# # sed -i "s|$grafanarootUrl|$GF_SERVER_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json
# sed -i "/\"clientId\" : \"$CLIENT_ID\"/,/}/ s/\(\"rootUrl\" : \"\).*\(\",\)/\1$ROOT_URL\2/" $JSON_FILE

