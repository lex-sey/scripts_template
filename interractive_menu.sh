cd /home/postgres

PS3="������� �����: "

select character in `su postgres -c "psql postgres -t -c \"select datname from pg_database;\""`
do
    echo "��������� ����: $character"
    echo "��������� �����: $REPLY"
done
