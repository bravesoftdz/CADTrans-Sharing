program PPPPP;
Const
  f = 0.25;
var
    P1: real;    { ��魮��� �� ����饬 誨�� }
    n1: real;    { ��᫮ ����⮢ ����饣� 誨�� }
    up: real;    { �஥�⭮� ��।��筮� �᫮ }
    d1: real;    { ������� ������ 誨�� }
(*    Q: word;     { ���� ������� ��।�� � ��ਧ���� }*)
    q : real;    { ���� ������� ��।�� � ��ਧ���� }
    Tip_nat: boolean; { ���殮��� ६�� }
    Cp: real;    { �����樥�� ०��� ࠡ��� }
    Fdelta: real; { ���騭� ६�� }
    h : real;     {tolsh sloja}
    Tip_pl: word;
    Tip_reg : word;
    alfa_min: real; { �������쭮 �����⨬� 㣮� ��墠� }
    nyu_max: real;  { ���ᨬ��쭮 �����⨬�� �᫮ �஡���� }
    V_max: real;    { ���ᨬ��쭮 �����⨬�� ᪮���� ६�� }
    f_pr: real;     { �ਢ������ �����樥�� �७�� }

  p0,
  C_alfa,
  C_V,
  C_Q: real;
  ib: byte;
  C: real;
  F1, F2, alfa_c, m, Sigma_E : real;
{    F1 - ���殮��� ����饩 ��⢨;
     F2 - ���殮��� ������� ��⢨;
     Fb - �������� �� ���� ६��;
     F0 - �ᨫ�� �।���⥫쭮�� ���殮���;
     Ft - ���㦭�� �ᨫ�� � ��।�� }
{---------------------------------------------------------------}
    a: real;     { �����᪮� ����ᥢ�� ����ﭨ� ��।�� }
    d2: real;    { ������� ����讣� 誨�� }
    alfa: real;  { ���� �墠� ६��� ����襣� 誨�� }
    Vol: real;   { ��ꥬ ��।�� }
    Lh : real;  { �������筮��� }
    Fb: real;    { ����㧪� �� ��� �� ���殮��� ��⢥� ६�� }
{---------------------------------------------------------------}
    l: real;     { ����� ६�� }
    bs: real;    { ��ਭ� 誨�� }
    u: real;     { �����᪮� ��।��筮� �᫮ }
    n2: real;    { ��᫮ ����⮢ �������� 誨�� }
    V: real;     { �������� ᪮���� ६�� }
    nyu: real;   { ��᫮ �஡���� ६�� � ᥪ㭤� }
    Ft: real;    { ���㦭�� �ᨫ�� � ��।�� }
    F0: real;    { ���� �।���⥫쭮�� ���殮��� ६�� }
    z: byte;     { ��᫮ ᫮�� ���⪠�� }
    b: real;     { ��ਭ� ६�� }
    qq : real;   {Lockal var}
{-------------------------------------------------------------------------}
BEGIN
  N1:= 720;
  d1:= 80;
  d2 := 160; {}
  a:=600;    {}
  Q:=0;
  Cp:=1.25;
  Tip_pl := 1;
  Tip_nat := true;
  Fdelta:=6;  {}
  f_pr:=0.25;
  C:=0.99;
  b := 80;    {}

  case Tip_pl of
    0: p0:=3;
    1: p0:=3;
    2: p0:=10;
    3: p0:=10;
    4: p0:=13;
    5: p0:=20;
    6: p0:=20;
  end;
  case Tip_pl of
    0: h:=1.5;
    1: h:=1.5;
    2: h:=1.5;
    3: h:=1.3;
    4: h:=1.4;
    5: h:=1.5;
    6: h:=1.5;
  end;
  z := round(Fdelta/h);
           { �����樥�� 㣫� ��墠� }
  alfa:=180 - (d2 - d1) * 57 / a;
  l:=2 * a + Pi * (d1 + d2) / 2 + sqr(d2 - d1) / (4 * a);
  V:=Pi * d1 * n1 / 60000;
  u:=d2/(C * d1);
  C_alfa:=1 - 0.003 * ( 180 - alfa ) ;
  C_V:=1.04 - 0.0004 * V * V ;
  if Tip_nat then
    if Q = 0 then {Q <= 60}
      C_Q := 1
    else if Q = 1 then {60 < Q <80}
      C_Q := 0.9
    else
      C_Q := 0.8
  else
     C_Q := 1;
  Ft := b * z * p0 * C_alfa * C_v * Cp * C_Q;
  P1:= Ft * n1 * d1/ 19.1E6;




{  if alfa < alfa_min then
    ErrorCode:=erAngle;}
{  if V > V_max then
    ErrorCode:=erSpeed;}
  nyu:=1000 * V/l;
{  if nyu > nyu_max then
    ErrorCode:=erRunway;}
  alfa_c:=0.7 * alfa * pi / 180;
  m := exp(f_pr * alfa_c);
  F1 := m / (m-1) * Ft;
  F2 := F1 - Ft;
  F0 := Ft / 2 * ((m + 1) / (m - 1));
  Fb := sqrt(sqr(F1) + sqr(F2) + 2 * F1 * F2 * cos(alfa));
  Vol:=(b*(Pi*(sqr(d1)+sqr(d2))+4*a*(d1+d2)))/8*1E-6;
  qq := exp(f_pr * alfa_c);
  Sigma_e := q * Ft / (Fdelta * b * (q-1)) + 90 * Fdelta / d1 +
             1.2E-3 * sqr(V);
  Lh := 1.1E6 * l / (V * exp(6 * ln(Sigma_e)));
{  Lh_0 := 60/Sigma_e;}

END.