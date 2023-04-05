#!/bin/bash

#Import env file
source .env

DriveUrls () {
    oldrootUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json)
    oldbaseUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .baseUrl' keycloak/esdl-mapeditor-realm.json)
    oldredirectUris=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .redirectUris[0]' keycloak/esdl-mapeditor-realm.json)

    echo "Old value of ESDLDriverootUrl: $oldrootUrl" 
    echo "Old value of ESDLDrivebaseUrl: $oldbaseUrl"
    echo "Old value of ESDLDriveredirectUris: $oldredirectUris"

    # Replace the Urls of ESDLdrive value with the one from the .env file
    sed -i "s#\(\"rootUrl\" : \"\).*\(\",\)#\1${DRIVE_ROOT_URL}\2#" keycloak/esdl-mapeditor-realm.json
    sed -i "s#\(\"baseUrl\" : \"\).*\(\",\)#\1${DRIVE_BASE_URL}\2#" keycloak/esdl-mapeditor-realm.json

    #replaces all instances of the value $oldredirectUris so will also change other variables,
    #but shouldnt be a problem since old base url and old redirectUri share the same value:
    sed -i "s|$oldredirectUris|$DRIVE_REDIRECT_URI|g" keycloak/esdl-mapeditor-realm.json
    newrootUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .rootUrl' keycloak/esdl-mapeditor-realm.json)
    newbaseUrl=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .baseUrl' keycloak/esdl-mapeditor-realm.json)
    newredirectUris=$(jq -r '.clients[] | select(.clientId == "cdo-mondaine") | .redirectUris[0]' keycloak/esdl-mapeditor-realm.json)

    echo "New value of ESDLDriverootUrl: $newrootUrl"
    echo "New value of ESDLDrivebaseUrl: $newbaseUrl"
    echo "New value of ESDLDriveredirectUris: $newredirectUris"
}

MapeditorUrls () {
    oldrootUrl1=$(jq -r '.clients[] | select(.clientId == "esdl-mapeditor") | .rootUrl' keycloak/esdl-mapeditor-realm.json)
    oldredirectUris1=$(jq -r '.clients[] | select(.clientId == "esdl-mapeditor") | .redirectUris' keycloak/esdl-mapeditor-realm.json)
    
    echo "Old value of ESDLMapeditorrootUrl: $oldrootUrl1" 
    echo "Old value of ESDLMapeditorredirectUris: $oldredirectUris1"

    # Replace the Urls of ESDLdrive value with the one from the .env file
    # sed -i "s#\(\"oldrootUrl1\" : \"\).*\(\",\)#\1${MAPEDITOR_ROOT_URL}\2#" keycloak/esdl-mapeditor-realm.json
    # sed -i "s#\(\"oldredirectUris1\" : \"\).*\(\",\)#\1$MAPEDITOR_REDIRECT_URL}\2#" keycloak/esdl-mapeditor-realm.json
    sed -i "s#\(\"rootUrl\" : \"${oldrootUrl1}\",\)#\1${MAPEDITOR_ROOT_URL}\2#" keycloak/esdl-mapeditor-realm.json
    sed -i "s#\(\"redirectUris\" : \[\"${oldredirectUris1}\"\],\)#\1\[\"${MAPEDITOR_REDIRECT_URL}\"\]#g" keycloak/esdl-mapeditor-realm.json 


    #replaces all instances of the value $oldredirectUris so will also change other variables,
    #but shouldnt be a problem since old base url and old redirectUri share the same value:
    #sed -i "s|$oldredirectUris|$MAPEDITOR_REDIRECT_URL|g" keycloak/esdl-mapeditor-realm.json
    newrootUrl1=$(jq -r '.clients[] | select(.clientId == "esdl-mapeditor") | .rootUrl' keycloak/esdl-mapeditor-realm.json)
    newredirectUris1=$(jq -r '.clients[] | select(.clientId == "esdl-mapeditor") | .redirectUris' keycloak/esdl-mapeditor-realm.json)
    
    echo "New value of ESDLMapeditorrootUrl: $newrootUrl1"
    echo "New value of ESDLMapeditorredirectUris: $newredirectUris1"
}

DriveUrls

MapeditorUrls



# redirectUris
# baseUrl

#sed -i "s|$grafanarootUrl|$GF_SERVER_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json 





# # Read the rootUrl value from the JSON file
#jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json
# # grafanarootUrl=$(jq -r '.clients[] | select(.clientId == "essim-dashboard") | .rootUrl' keycloak/esdl-mapeditor-realm.json)

# # # Replace the rootUrl with the one from the .env file
# # sed -i "s|$grafanarootUrl|$GF_SERVER_ROOT_URL|g" keycloak/esdl-mapeditor-realm.json
# sed -i "/\"clientId\" : \"$CLIENT_ID\"/,/}/ s/\(\"rootUrl\" : \"\).*\(\",\)/\1$ROOT_URL\2/" $JSON_FILE

