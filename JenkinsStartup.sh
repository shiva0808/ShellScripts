#!/bin/bash
#This script is for starting,Stopping and checking status of Jenkins
#Jenkins is installed using jenkins war file
stop()
{
  process_id=$( ps -eaf | grep jenkins | grep -v grep | awk '{print $2}' )
  if [[ -z ${process_id} ]]
  then
    echo "nothing to stop... exiting"
    exit 1
  fi
  kill -9 ${process_id}
  if [[ ${?} -eq 0 ]]
  then
    echo "Jenkins Stopped Sucessfully"
  fi
  rm -rf ${PID_FILE}
  exit 0
}

startup_check()
{
  if [[ -a ${PID_FILE} ]]
  then
    while IFS= read -r line
      do
        if [[ $( ps -eaf | grep jenkins | grep -v grep | awk '{print $2}' ) -eq ${line} ]]
          then
            echo "process already running"
          fi
          exit 0
    done < ${PID_FILE}
  fi
}

start()
{
  startup_check
  LOG_CHECK
  java -jar jenkins.war &>> startup.log &
  echo "check $STARTUP_LOG file for startup information"
  touch ${PID_FILE}
  echo "${PID_FILE} created"
  process_id=$( ps -eaf | grep jenkins | grep -v grep | awk '{print $2}' )
  echo ${process_id} > ${PID_FILE}
}

LOG_CHECK()
{
    if [[ -a ${STARTUP_LOG} ]]
    then
      BACKUP_TIME=$(date +%Y%m%d%S)
      cp -p ${STARTUP_LOG} "${STARTUP_LOG}${BACKUP_TIME}.bak"
      echo "Started application On" > ${STARTUP_LOG}
      echo $(date) >> ${STARTUP_LOG}
    else
      touch ${STARTUP_LOG}
    fi
}

status()
{
  if [[ -a ${PID_FILE} ]]
  then
    while IFS= read -r line
      do
        if [[ $( ps -eaf | grep jenkins | grep -v grep | awk '{print $2}' ) -eq ${line} ]]
          then
            echo "Jenking is running. [PID] [$line]"
          fi
          exit 0
    done < ${PID_FILE}
    echo "Jenkins is not running"
  else
    echo "PID file not found, please check manually"
  fi
}

STARTUP_LOG="/opt/jenkins/startup.log"
PID_FILE="/opt/jenkins/pid.file"
if [[ ${1} = "start" ]]
then
  start
elif [[ ${1} = "stop" ]]
then
  stop
elif [[ ${1} = "status" ]]
then
  status
else
  echo "invalid arguments... usage below"
  echo "${0} start|stop|status"
fi
