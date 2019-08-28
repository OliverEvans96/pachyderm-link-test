#!/bin/bash
./create-data.sh
pachctl create repo data
pachctl put file data@master:/ -orf data/
pachctl create pipeline -f pipeline.json

sleep 5
pachctl logs -p combine-data -f 2>&1 | tee pipeline.log
