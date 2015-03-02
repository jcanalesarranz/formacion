#!/bin/sh

cd tomcat-7.0.42

rm -rf webapps/*-ext
# deleting jars and config files from Liferay
find -name "ext-*" | xargs rm -rf
