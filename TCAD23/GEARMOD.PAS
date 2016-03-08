FUNCTION Mu_H: real; {Исправить}
Const
  ConstMh : array [0..5] of single =
  (1, 0.5, 0.25, 0.18, 0.125, 0.063);

BEGIN
  if not Nagr then
    Mu_H:=ConstMh [Loading.GraphBar]
  else
    with Loading do
      Mu_H:=i+j*XBY(y,3)+k*XBY(z,3);
END;

FUNCTION Mu_F (Target: byte): real; {Исправить}
Const
  Mf6 : array [0..5] of single =
  (1, 0.3, 0.143, 0.065, 0.038, 0.013);
  Mf9 : array [0..5] of single =
  (1, 0.2, 0.1, 0.063, 0.016, 0.004);
Var
  qF : byte;
  Termobr: real;

BEGIN
  if Target = 1 then
    Termobr:=Termobr1
  else
    Termobr:=Termobr2;
  if (Wikrugka[Target] <> 0) or not (Termobr > 2) then
    qF:=6
  else
    qF:=9;
  if not Nagr then
    case qF of
      6: Mu_F:=Mf6 [Loading.GraphBar];
      9: Mu_F:=Mf9 [Loading.GraphBar];
    end
  else
    with Loading do
      Mu_F:=i+j*XBY(y,qF)+k*XBY(z,qF);
END;
{-----------------------------------------------------}
      Procedure Involuta (v:real; var al:real);
             var t,del:real;
                 n:integer;
             Begin
               al:=1; n:=0;
               Repeat
                t:=Tan(al);
                del:=t-al-v;
                al:=al-del/sqr(t);
                Inc(n);
               Until (abs(del) < 1e-6) or (n > 50);
             End;