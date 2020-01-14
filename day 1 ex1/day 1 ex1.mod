/*********************************************
 * OPL 12.6.0.0 Model
 * Author: walid
 * Creation Date: 8 nov. 2019 at 10:23:18
 *********************************************/

 //variables
 
 dvar float+ x;
 dvar float+ y;
 
 //expressions
 
 dexpr float cost = 0.12*x+0.15*y;
 
 //model
 
 //Min
 minimize cost;
 //s.t
 subject to
 {
  cons01:
  60*x+60*y>=300;
  
  cons02:
  12*x +6*y>=36;
  
  cons03:
  10*x+30*y>=90;
  
 }
 
 //postprocessing
 
 execute
 {
  if(cplex.getCplexStatus()==1)//solution found?
  {
    writeln("reduced cost of x:", x.reducedCost);
    writeln("reduced cost of y:", y.reducedCost);
    
    writeln("dual of cons01:", cons01.dual);
    writeln("dual of cons02:", cons02.dual);
    writeln("dual of cons03:", cons03.dual);
    
  } else//no solution found
  {
    writeln("ERROR! No Solution Found!");
  }
 }