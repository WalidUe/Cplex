/*********************************************
 * OPL 12.6.0.0 Model
 * Author: Walid
 * Creation Date: Nov 15, 2019 at 9:37:04 AM
 *********************************************/
int n=...; //number of cities



float d[1..n][1..n]=...;//distance matrix




dvar boolean x[1..n] [1..n];
dvar int+ u[1..n] in 1..n;
minimize sum(i in 1..n, j in 1..n) d[i][j]*x[i][j];

subject to {
forall (i in 1..n) cont1:
sum(j in 1..n) x[i][j]==1;
forall (j in 1..n) cont2 :
sum(i in 1..n) x[i][j]==1;
forall (i in 2..n, j in 2..n) cont3 :
u[i]-u[j]+(n-1)*x[i][j] <=n-2;
forall (i in 1..n) cont4:
1<=u[i]<=n; }
