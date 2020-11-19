#!/bin/bash
log()
{
  local MESSAGE=${@}
  if [[ ${VERBOSE} = true ]]
  then
    echo "${MESSAGE}"
  fi
  logger -t StaticVariableLogger.sh "${MESSAGE}"
}

readonly VERBOSE='true'     #because VERBOSE true and golbal, function if block will be executed true
log 'Hello'
log 'this is fun'

#readonly VERBOSE='true'     #because VERBOSE false and golbal, function if block will not be executed true
#log 'Hello'
#log 'this is fun'
