#just color definitions
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;1;33m'

echo -e "${GREEN} Запрос на запуск скрипта. ${NC}"
#echo -e "${YELLOW}Для продолжения нажмите любую кнопку${NC}"
#read -s -n 1 -p "$*"

read -n 1 -p " Начать выполнение скрипта? (y/[a]): " AMSURE
[ "$AMSURE" = "y" ] || exit
echo "" 1>&2
echo ""