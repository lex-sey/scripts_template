cd /home/postgres

PS3="Введите число: "

select character in `su postgres -c "psql postgres -t -c \"select datname from pg_database;\""`
do
    echo "Выбранная база: $character"
    echo "Выбранный номер: $REPLY"
done
