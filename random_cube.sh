# ������� �������� 2-� ������� �������.
SPOTS=7   # ������� �� ������� �� 7 ���� �������� 0 - 6.
ZERO=0
die1=0
die2=0

# ������ "�������������" ���������.
  while [ "$die1" -eq $ZERO ]     # ���� �� "������" ����.
  do
    let "die1 = $RANDOM % $SPOTS" # ����������� ������ ������� ������.
    echo "������ ����� " $die1
  done

  while [ "$die2" -eq $ZERO ]
  do
    let "die2 = $RANDOM % $SPOTS" # ����������� ������ ������� ������.
    echo "������ ����� " $die2
  done

let "throw = $die1 + $die2"
echo "����� ����������� ������ ������� = $throw"
echo


exit 0
