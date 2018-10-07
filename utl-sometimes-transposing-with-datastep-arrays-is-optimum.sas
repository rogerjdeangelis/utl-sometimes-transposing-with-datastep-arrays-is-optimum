Sometimes transposing with datastep arrays is optimum

github
https://tinyurl.com/yb7dvchx
https://github.com/rogerjdeangelis/utl-sometimes-transposing-with-datastep-arrays-is-optimum

SAS Forum
https://tinyurl.com/ybfjoc64
https://communities.sas.com/t5/SAS-Programming/SAS-transpose-multiple-variables-wide-to-long/m-p/502177

Astounding
https://communities.sas.com/t5/user/viewprofilepage/user-id/4954

INPUT
=====

Up to 40 obs WORK.HAVE total obs=3

Obs    ID    NAME    FIRMID    A1981    A1982    B1981    B1982    C1981    C1982

 1     1      x       123         2        3        4        5        6        7
 2     2      y       124        22       33       44       55       66       77
 3     3      z       555       222      333      444      555      666      777

EXAMPLE OUTPUT
--------------


Up to 40 obs WORK.WANT total obs=6
                                                 |
Obs    ID    NAME    FIRMID      A      B      C |   RULES
                                                 |
 1     1      x       123        2      4      6 |   A1981 B1981 C1981
 2     1      x       123        3      5      7 |   A1982 B1982 C1982
                                                 |
 3     2      y       124       22     44     66 |
 4     2      y       124       33     55     77 |
                                                 |
 5     3      z       555      222    444    666 |
 6     3      z       555      333    555    777 |


PROCESS
=======

data want;
  set have;
  array oldvars {3, 1981:1982} A: B: C: ;
  array newvars {3} A B C;
  do year = 1981 to 1982;
     do k=1 to 3;
        newvars{k} = oldvars{k, year};
     end;
     output;
  end;
  keep id Name FirmID A B C;
run;


OUTPUT
======

see above


*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

data have;
input ID $ Name $ FirmID $ A1981 A1982 B1981 B1982 C1981 C1982;
cards;
1 x 123 2 3 4 5 6 7
2 y 124 22 33 44 55 66 77
3 z 555 222 333 444 555 666 777
;;;;
run;quit;


