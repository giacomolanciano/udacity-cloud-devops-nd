#!/bin/bash

aws cloudformation create-stack \
--stack-name "$1" \
--template-body file://"$2"  \
--parameters file://"$3"
