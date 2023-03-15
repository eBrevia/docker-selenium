#!/bin/bash

set -e

VERSION=3.141.59-20230320
AUTHORS=victor.smirnov@dfinsolutions.com
NAMESPACE=ebreviainc


cd Base
docker build -t . $NAMESPACE/selenium-grid:base-$VERSION .
docker push $NAMESPACE/selenium-grid:base-$VERSION

cd ../NodeBase
. generate.sh $VERSION $NAMESPACE $AUTHORS
docker build -t . $NAMESPACE/selenium-grid:node-base-$VERSION
docker push $NAMESPACE/selenium-grid:node-base-$VERSION

cd ../Hub
. generate.sh $VERSION $NAMESPACE $AUTHORS
docker build -t . $NAMESPACE/selenium-grid:hub-$VERSION
docker push $NAMESPACE/selenium-grid:hub-$VERSION

cd ../NodeChrome
. generate.sh $VERSION $NAMESPACE $AUTHORS
docker build -t . $NAMESPACE/selenium-grid:node-chrome-$VERSION
docker push $NAMESPACE/selenium-grid:node-chrome-$VERSION

cd ../NodeFirefox
. generate.sh $VERSION $NAMESPACE $AUTHORS
docker build -t . $NAMESPACE/selenium-grid:node-firefox-$VERSION
docker push $NAMESPACE/selenium-grid:node-firefox-$VERSION
