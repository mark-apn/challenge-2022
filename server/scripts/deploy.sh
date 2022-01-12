#!/bin/bash

function deployFunction () {
    functionId=$1
    folderName=$2

    echo "Deploying function $functionId ($folderName)"

    # CD into function folder
    cd ./server/functions/$folderName/

    dart pub get

    # Up one folder
    cd ..

    # Execute the following commands and save result in variable 'result'
    RESULT="$(appwrite functions createTag  --functionId=\"$functionId\"  --command=\"dart main.dart\"  --code=\"$folderName\" | grep \$id)"

    # Strip ID from result
    ID=${RESULT/\$id : /}

    # Activate the new tag
    appwrite functions updateTag \
       --functionId="$functionId" \
       --tag=$ID

    # Return to root folder
    cd ../../../
}

# Change pubcache to be inside the function folder, so all dependencies are packaged together
export PUB_CACHE=.pub_cache

# Deploy all functions given their AppWrite function IDs and folder names
deployFunction 61de8af23b7b0fb732db "create_puzzle"