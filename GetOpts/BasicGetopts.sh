while getopts vl:s OPTION
do
  case ${OPTION} in
    v)
      VERBOSE=true
      echo "Verbose enabled"
      ;;
    l)
      LENGTH="${OPTARG}"
      echo "Setting Password length to 8"
      ;;
    s)
      SPECIAL_CHARACTER=true
      ;;
    ?)
      echo "Illegal option !!! Provide valid option"
      ;;
  esac
done

#   ./BasicGetopts.sh -vsl
