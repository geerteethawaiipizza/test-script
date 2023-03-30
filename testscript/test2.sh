#!/bin/bash

# Read the rootUrl value from the JSON file
rootUrl=$(jq -r '.clients[] | select(.clientId == "account-console") | .rootUrl' keycloak/client.json)

# Replace the rootUrl with the one from the .env file
sed -i "s|$rootUrl|$ROOT_URL|g" keycloak/client.json