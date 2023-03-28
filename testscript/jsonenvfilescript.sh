#!/bin/bash

# Load environment variables from .env file
source .env

# Update JSON object with example value



jq '.roles.users[] | select(.clientId == "esdl-mapeditor").rootUrl = env.mapeditorrootUrl' keycloak/esdl-mapeditor-realm.json > tmp.json && mv tmp.json keycloak/esdl-mapeditor-realm.json