#! /bin/ksh
CONFIRM_MODE="WARN"
CONFIRM_MESSAGE="message"
VERBOSE=$1

echo $VERBOSE
if [ "$CONFIRM_MODE" = "WARN" ]; then
  echo $CONFIRM_MESSAGE
  echo "Do you want to continue? (Y/N)"
  while true; do

    if [[ $VERBOSE = '-verbose' ]]; then
    echo "AUTO START"
    echo "y" | read user_response
    case $user_response in
        [Yy]* ) CHECK_RESULT=0; break;;
        [Nn]* ) CHECK_RESULT=1; break;;
        * ) echo "Please provide a correct values: Y/N ";;
    esac
    fi

    read user_response
    case $user_response in
        [Yy]* ) CHECK_RESULT=0; break;;
        [Nn]* ) CHECK_RESULT=1; break;;
        * ) echo "Please provide a correct values: Y/N ";;
    esac
  done

  if [ $CHECK_RESULT = 1 ]; then
 echo $CHECK_RESULT "Вы выбрали " $user_response
 exit 0
  fi
  echo ""
fi

echo $CHECK_RESULT "Вы выбрали " $user_response
echo "Скрипт запускается "
sleep 1
echo "Скрипт останавливается"

