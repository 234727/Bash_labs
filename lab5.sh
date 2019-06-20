#! /bin/bash

# 1
echo Zadanie1
ps aux | awk \
'
{
  n = split($11, commands, "/");
  {
    print "PID: " $2 " CPU: " $3 " MEM: " $4 " NAME: "commands[n]
  }
}
'

# # 2
echo Zadanie2
ps aux | awk \
'
  {
    split($10, times, ":");
    split($3, cpus, ".");
    split($4, mems, ".");
    if(cpus[1] >= 1 && mems[1] >= 1)
    {
      if(times[1] == 1 && times[2] <= 45)
      {
        print "PID: " $2 " CPU: " $3 " MEM: " $4 " time: " $10
      }
      else if(times[1] == 0 && times[2] >= 15)
      {
        print "PID: " $2 " CPU: " $3 " MEM: " $4 " time: " $10
      }
    }
  }
'

# 3
echo Zadanie3

ps aux | awk \
'
{
  n = split($10, times, ":");
  if(n > 2  && times[n-3] == 1 )
  {
    {print "n"}
    n2 += 1;
    cpu2 += $3;
    mem2 += $4;
  }
  else if( n > 2 && times[n-3] >= 2)
  {
    n3 += 1;
    cpu3 += $3;
    mem3 += $4;
  }
  else if(times[n-2] == 0)
  {
    n1 += 1;
    cpu1 += $3;
    mem1 += $4;
  }
}
END{ print "Przedział 0-59\n" "Ilość: " n1 " CPU: " cpu1 " MEM: " mem1 "\nPrzedział 1:00-1:59\n" "Ilość: " n2 " CPU: " cpu2 " MEM: " mem2 "\nPrzedział 2:00+\n" "Ilość: " n2 " CPU: " cpu2 " MEM: " mem2};
'
