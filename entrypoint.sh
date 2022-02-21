#!/bin/sh

######################################################################################
# Command:                                                                           #
# run -e PLAYGROUND_PAT=...  "application_path" "namespace" "application_name" "tag" #
######################################################################################

## get args
appPath=$1
namespace=$2
appName=$3
tag=$4
configFile=$5

## add actual dir to the path to allow execute the playground command
export PATH=$PATH:./

## check args
if [[ -z "$appPath" ]]; then
    echo "application_path can not be empty"
    exit -1
fi
if [[ -z "$namespace" ]]; then
    echo "namespace can not be empty"
    exit -1
fi
if [[ -z "$appName" ]]; then
    echo "application_name can not be empty"
    exit -1
fi
if [[ -z "$tag" ]]; then
    echo "tag can not be empty"
    exit -1
fi
#############################

# if there is a configFile...
if [[ -n "$configFile" ]]; then
    mkdir -p ${HOME}/.napptive
    cp ${configFile} ${HOME}/.napptive/.playground.yaml
fi

# Step 1. Login in to the platform
# Login into the platform (with pat flag)
playground login --pat
if [[ $? -ne 0 ]]; then
    exit -1
fi


# push the app
#   playground catalog push <namespace/appName[:tag]> <application_path> [flags]
appFullName="${namespace}/${appName}:${tag}"
playground catalog push ${appFullName} ${appPath} 
if [[ $? -ne 0 ]]; then
    exit -1
fi


