#!/bin/bash
profile=${1?'ERROR: Expected a profile'}
token=${2?'ERROR: Expected a token'}

function aws_configure_default_profile() {
  aws --profile default configure set aws_access_key_id $1
  aws --profile default configure set aws_secret_access_key $2
  aws --profile default configure set aws_session_token $3
}

aws_configure_default_profile $( \
  aws sts get-session-token \
    --profile login \
    --serial-number $(aws configure --profile login get mfa_serial) \
    --token $token \
    --query Credentials.[AccessKeyId,SecretAccessKey,SessionToken] \
    --output text
)

aws_configure_default_profile $(\
  aws sts assume-role \
  --role-session-name $profile \
  --role-arn $(aws configure --profile $profile get role_arn) \
  --query Credentials.[AccessKeyId,SecretAccessKey,SessionToken] \
  --output text
)

