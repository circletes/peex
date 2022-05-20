#!/bin/bash

cat $HOME/.aws/test_creds | grep "[[*]*]" > $HOME/.aws/credentials
readarray name_array < $HOME/.aws/credentials
for i in ${!name_array[@]}
do
  echo $i "${name_array[i]}" 
done
read j
id=$(grep ${name_array[$j]} $HOME/.aws/credentials | tail -4 | awk -F 'aws_access_key_id = ' '{print $2}')
key=$(grep ${name_array[$j]} $HOME/.aws/test_creds | tail -4 | awk -F 'aws_secret_access_key = ' '{print $2}')
token=$(grep ${name_array[$j]} $HOME/.aws/test_creds | tail -4 | awk -F 'aws_session_token = ' '{print $2}')
export AWS_ACCESS_KEY_ID="$id"
export AWS_SECRET_ACCESS_KEY="$key"
export AWS_SESSION_TOKEN="$token"
