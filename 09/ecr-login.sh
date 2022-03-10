#!/bin/bash
REGION="ap-southeast-1"
`aws ecr get-login --no-include-email --region ${REGION}`