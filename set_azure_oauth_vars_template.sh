#!/bin/bash

export SPRING_PROFILES_ACTIVE=msad

export BASE_URL=https://jsp-demo-ent-jl-jsp-demo.azuremicroservices.io

# obtain this from `az account show` or `az account list`
export AZURE_TENANT_ID=<redacted_tenant_id>

# obtain this from the result of az create app
export APP_ID=<redacted_app_id>
export MSAD_OAUTH_CLIENT_ID=${APP_ID}

export MSAD_OAUTH2_CLIENT_SECRET=<redacted_client_secret>    # Your SSO Provider Client Secret
export MSAD_OAUTH2_ISSUER_URI=https://login.microsoftonline.com/${AZURE_TENANT_ID}/v2.0      # Your SSO Provider Issuer URI = TENANT_ID
export MSAD_OAUTH2_JWK_SET_URI=https://login.microsoftonline.com/${AZURE_TENANT_ID}/discovery/v2.0/keys      # Your SSO Provider Json Web Token URI = TENANT_ID
export MSAD_OAUTH2_SCOPE=openid,profile,email

