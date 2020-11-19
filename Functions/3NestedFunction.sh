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

backup_file()
{
  local FILE=${1}
  if [[ -f ${FILE} ]]
  then
    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
    log "backing up ${FILE} in ${BACKUP_FILE}"
    cp -p ${FILE} ${BACKUP_FILE}
  else
    echo "${FILE} file does not exist"
    return 1      #this will work as exit status, we are not using exit coz it will exit from here
  fi              #but we want to process after this also
}

readonly VERBOSE='true'     #because VERBOSE true and golbal, function if block will be executed true
log 'Hello'
log 'this is fun'

#readonly VERBOSE='true'     #because VERBOSE false and golbal, function if block will not be executed true
#log 'Hello'
#log 'this is fun'

backup_file "/etc/passwd"

if [[ ${?} -eq 0 ]]
then
  echo "File copy successfully completed"
else
  echo "file copy failed"
fi
