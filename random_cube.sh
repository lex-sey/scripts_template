# Имтация бросания 2-х игровых кубиков.
SPOTS=7   # остаток от деления на 7 дает диапазон 0 - 6.
ZERO=0
die1=0
die2=0

#  убики "выбрасываются" раздельно.
  while [ "$die1" -eq $ZERO ]     # ѕока на "кубике" ноль.
  do
    let "die1 = $RANDOM % $SPOTS" # Имитировать бросок первого кубика.
    echo "ѕервый кубик " $die1
  done

  while [ "$die2" -eq $ZERO ]
  do
    let "die2 = $RANDOM % $SPOTS" # Имитировать бросок второго кубика.
    echo "¬торой кубик " $die2
  done

let "throw = $die1 + $die2"
echo "—умма результатов броска кубиков = $throw"
echo


exit 0
