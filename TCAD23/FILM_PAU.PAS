PROCEDURE Pauer;
{------------- Расчет допустимой мощности, давления на вал ------------}
Var
  p0, C_alfa, C_V, C_Q, F1, F2, alfa_c, m : float;
BEGIN
 p0 := Array_plen[Tip_pl,5];
            { коэффициент угла обхвата }
 C_alfa  := 1 - 0.003 * ( 180 - alfa ) ;
 C_V := 1.04 - 0.0004 * V * V ;
       if not Tip_nat then
         case Q of
           0: C_Q := 1;
           1: C_Q := 0.9;
           2: C_Q := 0.8;
         end
       else C_Q := 1;
 Ft := b * p0 * C_alfa * C_v * Cp * C_Q ;
 P1:= Ft * n1 * d1 / 19.1E6 ;
 alfa_c := 0.7 * alfa * pi / 180;
 m := exp(f_pr * alfa_c);
 F1 := m / (m-1) * Ft;
 F2 := F1 - Ft;
 Fb := sqrt(sqr(F1) + sqr(F2) + 2 * F1 * F2 * cos(alfa));
{ Конец процедуры  Pauer }
END;