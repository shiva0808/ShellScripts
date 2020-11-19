#!/bin/bash
log()
{
  VERBOSE=${1}
  shift
  local MESSAGE=${@}      #this defines varibale in local scope of function
  if [[ ${VERBOSE} = "true" ]]
  then
    echo "${MESSAGE}"
  fi
}

VERBOSITY="false"
log "${VERBOSITY}" 'this is message 1'
VERBOSITY="true"
log "${VERBOSITY}" 'This is message 2'
