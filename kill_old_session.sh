NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;1;33m'

echo -e "${GREEN} ������ ������������ ��� ���������� ������ ������ ${NC}"
#echo -e "${YELLOW}��� ����������� ������� ����� ������${NC}"
#read -s -n 1 -p "$*"

read -n 1 -p " ������ ���������� �������? (y/[a]): " AMSURE
[ "$AMSURE" = "y" ] || exit
echo "" 1>&2
echo ""

export INTERVAL=1
export DBNAME=postgres

select DBNAME in `su postgres -c "psql postgres -t -c \"select datname from pg_database;\""`
do
    echo "������a ����: $DBNAME"
    echo "��������� �����: $REPLY"
    break
done



export DBNAME=$DBNAME

#echo "������������ � ���� $DBNAME ?"

echo -e " ������������ � ���� ${GREEN} $DBNAME  ${NC} (y/[a]): "
#read -n 1 -p " ������������ � ���� ${GREEN} $DBNAME  ${NC} (y/[a]): " AMSURE
read -n 1 -p "" AMSURE
[ "$AMSURE" = "y" ] || exit
echo "" 1>&2
echo ""


select INTERVAL in 1 2 6 8 12 24 36 48 "������"
do
if [[ $REPLY -eq 9 ]]
then read -n 2 -p "��������: " INTERVAL
        echo $INTERVAL
        echo $REPLY
fi

    echo ""
    echo "������ �������� $INTERVAL �����"
    echo "��������� �����: $REPLY"
    break
done


cd /home/postgres
echo -e " ������� ������ � ���� ${GREEN} $DBNAME ${NC} ������ ${YELLOW} $INTERVAL ${NC}  �����"

su postgres -c "psql postgres -c \"SELECT pid, usename, client_addr, backend_start, query FROM pg_stat_activity WHERE datname = 'postgres' and backend_start <= NOW() - '$INTERVAL hour'::interval;\""



echo "����� ��������� ��� ������ ������ " $INTERVAL " �����"
read -n 1 -p " ��������� ��� ������ ������ $INTERVAL ����� (y/[a]): " AMSURE
[ "$AMSURE" = "y" ] || exit
echo "" 1>&2
echo ""

su postgres -c "psql postgres -c \"select pg_terminate_backend(pid) from pg_stat_activity where datname='$DBNAME' AND pid <> pg_backend_pid() and backend_start <= NOW() - '$INTERVAL hour'::interval;\""
echo $date

