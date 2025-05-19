#!/bin/bash
#
. ~/.doce-vars
CHECK_PAT=${THE_PAT}x
if [ $CHECK_PAT == "x" ];then
  echo "Need PAT defined"
  exit 1 
fi

CHECK_SSH=${THE_SSH}x
if [ $CHECK_SSH == "x" ];then
  echo "Need SSH key defined"
  exit 1
fi

terraform init \
  -var "do_token=${THE_PAT}" \
  -var "pvt_key=${THE_SSH}"
