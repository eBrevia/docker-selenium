#!/bin/bash

set -e

if [ "x$1" == "x" ]; then
    echo "Usage: $0 <date>"
    echo "Example: $0 20230320"
    exit 1
fi

DATE=$1
VERSION=3.141.59-$DATE
AUTHORS=victor.smirnov@dfinsolutions.com
NAMESPACE=ebreviainc


cd Base
docker build -t $NAMESPACE/selenium-grid:base-$VERSION .
docker push $NAMESPACE/selenium-grid:base-$VERSION

cd ../NodeBase
. generate.sh $VERSION $NAMESPACE $AUTHORS
docker build -t $NAMESPACE/selenium-grid:node-base-$VERSION .
docker push $NAMESPACE/selenium-grid:node-base-$VERSION

cd ../Hub
. generate.sh $VERSION $NAMESPACE $AUTHORS
docker build -t $NAMESPACE/selenium-grid:hub-$VERSION .
docker push $NAMESPACE/selenium-grid:hub-$VERSION

cd ../NodeChrome
. generate.sh $VERSION $NAMESPACE $AUTHORS
docker build -t $NAMESPACE/selenium-grid:node-chrome-$VERSION .
docker push $NAMESPACE/selenium-grid:node-chrome-$VERSION

cd ../NodeFirefox
. generate.sh $VERSION $NAMESPACE $AUTHORS
docker build -t $NAMESPACE/selenium-grid:node-firefox-$VERSION .
docker push $NAMESPACE/selenium-grid:node-firefox-$VERSION
