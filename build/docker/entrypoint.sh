#!/bin/bash

if [[ "$@" == "bash" ]]; then
    exec $@
fi

OPTS=""

if [[ -z $GH_RUNNER_NAME ]]; then
    echo "Error: GH_RUNNER_NAME is not set"
    exit 1
fi

if [[ -z $GH_RUNNER_TOKEN ]]; then
    echo "Error: GH_RUNNER_TOKEN is not set"
    exit 1
fi

if [[ -z $GH_RUNNER_URL ]]; then
    echo "Error: GH_RUNNER_URL is not set"
    exit 1
fi

if [[ -n $GH_RUNNER_LABELS ]]; then
    OPTS="--labels ${GH_RUNNER_LABELS}"
fi


./config.sh \
    --url $GH_RUNNER_URL \
    --token $GH_RUNNER_TOKEN \
    --name $GH_RUNNER_NAME \
    $OPTS \
    --unattended

./run.sh

$@