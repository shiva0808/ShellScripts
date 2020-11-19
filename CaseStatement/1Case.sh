case ${1} in
  start)
    echo "starting"
    ;;
  stop)
    echo "Stopping"
    ;;
  status|state|--status|--state)
    echo "status"
    ;;
  *)
  echo "Enter a valid value" >& 2
  exit 1
  ;;
esac
