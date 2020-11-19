usage()
{
  echo "Usage: ${0} [-vs] [-l Lenght]" >&2
  echo "Generating Random Password application"
  echo "-l Length Specify the password length"
  echo "-s Append a special character in the password"
  echo "-v Increase verbosity"
  exit 1
}

LENGTH=16
log()
{
  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = true ]]
  then
    echo "${MESSAGE}"
  fi
}
while getopts vl:s OPTION
do
  case ${OPTION} in
    v)
      VERBOSE=true
      log "Verbose enabled"
      ;;
    l)
      LENGTH="${OPTARG}"
      echo "Setting Password length to ${LENGTH}"
      ;;
    s)
      SPECIAL_CHARACTER=true
      ;;
    ?)
      usage
      ;;
  esac
done

echo "total number of arguments are ${#}"
echo "Passed arguments are ${@}"
echo "First argument is ${1}"
echo "Second Argument is ${2}"
echo "Third Argumsnt is ${3}"
echo "Third Argumsnt is ${4}"
echo "OPTIND is ${OPTIND}"    #this parameter helps give index of getops args index
#ex -vsl 8  optindx will be 3 and with only -vs it will be 2
#Remove the options while leaving the remainig arguments
shift "$((${OPTIND}-1))"
echo "Argument after the shift"
echo "total number of arguments are ${#}"
echo "Passed arguments are ${@}"
echo "First argument is ${1}"
echo "Second Argument is ${2}"
echo "Third Argumsnt is ${3}"
echo "Third Argumsnt is ${4}"

#if more argument are provided, then it will be treated as error and usage will be printed
if [[ ${#} -gt 0 ]]
then
  Usage
fi

log "Generating a password"
PASSWORD=$(date +%s%N${RANDOM} | sha256sum | head -c${LENGTH})

if [[ "${SPECIAL_CHARACTER}" = "true" ]]
then
  SPECIAL_CHAR=$(echo "!@#$%^&*()-=_+"| fold -w1 | shuf | head -c1)
  PASSWORD=${PASSWORD}${SPECIAL_CHAR}
fi

log "done"
log "here is the password"
echo "${PASSWORD}"      #We are printing using echo coz if verbose is off then also password get printed
exit 0
#   ./BasicGetopts.sh -vsl 8
