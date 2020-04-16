#!/bin/bash

echo "> Creating backup directory"
mkdir -f ./backup

echo "> Copying fixtures"
docker cp -a emstrack:/etc/emstrack/fixtures ./backup

echo "> Copying letsencrypt certificates"
docker cp -a nginx:/etc/letsencrypt ./backup
