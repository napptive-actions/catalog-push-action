#!/bin/sh

######################################################################################
# Command:                                                                           #
# run -e PLAYGROUND_PAT=...  "application_path" "namespace" "application_name" "tag" #
######################################################################################

## get args
debug=$1
appPath=$2
namespace=$3
appName=$4
tag=$5
configFile=$6

## check args
if [[ -z "$appPath" ]]; then
    echo "applicationPath can not be empty"
    exit 1
fi
if [[ -z "$namespace" ]]; then
    echo "namespace can not be empty"
    exit 1
fi
if [[ -z "$appName" ]]; then
    echo "applicationName can not be empty"
    exit 1
fi
if [[ -z "$tag" ]]; then
    echo "tag can not be empty"
    exit 1
fi
#############################

# if there is a configFile...
if [[ -n "$configFile" ]]; then
    echo "using custom installation from $configFile to ${HOME}/.napptive/.playground.yaml"
    cp ${configFile} ./.playground.yaml
    mkdir -p ${HOME}/.napptive
    cp ${configFile} ${HOME}/.napptive/.playground.yaml
    if [[ $? -ne 0 ]]; then
      exit 1
    fi
fi

# Step 1. Login in to the platform
# Login into the platform (with pat flag)
/app/playground login --pat --debug=$debug
if [[ $? -ne 0 ]]; then
    exit 1
fi


# push the app
#   playground catalog push <namespace/appName[:tag]> <application_path> [flags]
appFullName="${namespace}/${appName}:${tag}"
echo "Pushing ${appFullName}"
/app/playground catalog push ${appFullName} ${appPath} --debug=$debug
if [[ $? -ne 0 ]]; then
    exit 1
fi


