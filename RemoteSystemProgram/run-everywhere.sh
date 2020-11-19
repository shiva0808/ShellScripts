#!/bin/bash
SERVER_LIST=/temp/server
SSH_OPTIONS='-o ConnectTimeout=2'

usage()
{
  echo "Usage ${0} [-nsv] [-f file] COMMAND" >&2
  exit 1
}
if [[ ${UID} -eq 0 ]]
then
  echo "You are running this script as root user. use sudo" >&2
  usage
fi

while getopts f:nsv OPTION
do
  case ${OPTION} in
    f)
      SERVER_LIST=${OPTARG}
      ;;
    n)
      DRY_RUN='true'
      ;;
    s)
      SUDO='sudo'
      ;;
    v)
      VERBOSE='true'
      ;;
    ?)
      usage
      ;;
  esac
done
shift "$(( OPTIND-1 ))"
if [[ ${#} -lt 1 ]]
then
  usage
fi

COMMAND="${@}"

if [[ ! -e ${SERVER_LIST} ]]
then
  echo "can not find ${SERVER_LIST}" >&2
  exit
fi
EXIT_STATUS=0

for SERVER in $(cat ${SERVER_LIST})
do
  if [[ "${VERBOSE}" = true ]]
  then
    echo "${SERVER}"
  fi
  SSH_COMMAND="ssh ${SSH_OPTIONS} ${SERVER} ${SUDO} ${COMMAND}"

  if [[ "${DRY_RUN}" = true ]]
  then
    echo "DRY RUN: ${SSH_COMMAND}"
  else
    ${SSH_COMMAND}
    SSH_EXIT_STATUS="${?}"

    if [[ ${SSH_EXIT_STATUS} -ne 0 ]]
    then
      EXIT_STATUS="${SSH_EXIT_STATUS}"
      echo "Execution on ${SERVER} failed" >&2
    fi
  fi
done

exit ${EXIT_STATUS}
