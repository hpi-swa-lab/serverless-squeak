#!/bin/bash

TMP_ZIP=function.zip
FUNCTION_NAME=squeak-runtime

chmod 755 bootstrap squeak.image
chmod -R 755 squeak
zip $TMP_ZIP bootstrap squeak.image squeak squeak.changes

awslocal lambda delete-function --function-name=$FUNCTION_NAME
awslocal lambda delete-function-url-config --function-name $FUNCTION_NAME

awslocal lambda create-function --function-name $FUNCTION_NAME \
        --zip-file fileb://function.zip --handler function.handler --runtime provided \
        --role arn:aws:iam::613468429976:role/AWSLambda

awslocal lambda create-function-url-config --function-name $FUNCTION_NAME --auth-type NONE | jq -r '.FunctionUrl'


