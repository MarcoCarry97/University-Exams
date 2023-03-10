# Title     : TODO
# Objective : TODO
# Created by: Marco
# Created on: 03/01/2021

moment=function(x,n)
{
  return(sum(x^n)/length(x))
}

centralMoment=function(x,n)
{
  avg=moment(x,1);
  return(sum((x-avg)^n)/length(x))
}

centralToNormal=function(x,n)
{
  avg=moment(x,1);
  acc=0;
  for(k in 0:n)
  {
    coeff=choose(n,k);
    mk=centralMoment(x,k)
    expAvg=avg^(n-k)
    acc=acc+(coeff*mk*expAvg)
  }
  return(acc);
}

normalToCentral=function(x,n)
{
  avg=moment(x,1);
  acc=0;
  for(k in 0:n)
    {
    coeff=choose(n,k);
    mk=moment(x,k)
    expAvg=(-avg)^(n-k)
    acc=acc+(coeff*mk*expAvg)
  }
  return(acc);
}

table=read.table("settembre/2018-09-01.dat",sep=" ")
temp=table[,"V6"];
print("Moments:")
print(moment(temp,0))
print(moment(temp,1))
print(moment(temp,2))
print("Central Moments:")
print(centralMoment(temp,0))
print(centralMoment(temp,1))
print(centralMoment(temp,2))
print("Central to normal:")
print(centralToNormal(temp,0))
print(centralToNormal(temp,1))
print(centralToNormal(temp,2))
print("Normal to central:")
print(normalToCentral(temp,0))
print(normalToCentral(temp,1))
print(normalToCentral(temp,2))
print("Stats:");
print(paste("Mean: ",mean(temp)))
print(paste("Var: ",var(temp)))
partNormal=3*moment(temp,1)*centralMoment(temp,2);
partCentral=3*moment(temp,1)*moment(temp,2);
part2=moment(temp,1)^3
print(paste("m3 =u3 + 3*m1*u2 + m1^3 ==>",moment(temp,3),centralMoment(temp,3) + partNormal + part2));
print(paste("u3 = m3 - 3*m1*m2 + 2*m1^3 ==>",centralMoment(temp,3),moment(temp,3) - partCentral + 2*part2));