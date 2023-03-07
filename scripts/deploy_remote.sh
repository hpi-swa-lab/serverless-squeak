#!/bin/bash

TMP_ZIP=function.zip
FUNCTION_NAME=squeak-runtime

chmod 755 bootstrap squeak.image
chmod -R 755 squeak
zip -r $TMP_ZIP bootstrap squeak.image squeak squeak.changes

aws lambda delete-function --function-name=$FUNCTION_NAME

aws lambda create-function --function-name $FUNCTION_NAME \
        --zip-file fileb://function.zip --handler function.handler --runtime provided \
        --role arn:aws:iam::263359213548:role/lambda-role \
        --architectures x86_64 \
        --memory-size 512 \
        --timeout 10


