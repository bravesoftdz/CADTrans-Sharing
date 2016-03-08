UNIT ProcCep;
        INTERFACE
          Uses Crt, GOST { Math};
     { *                                                   *}
           {   расчет чисел зубьев                     }
   PROCEDURE PP3 (U, Tip, Kd, N1 : Real;
                   var z1, z2 : byte;
                   var Uf, N2 : real;
                    var IZmin, IZmax : byte);
           {   Проверка применимости передачи по крутящему моменту }
   PROCEDURE PP2 (P1, N1, Uf, Ke, Tip : Real;
                   z1 : byte;
                  var It:byte );

           {  Расчет роликовой цепи на износостойкость }
   PROCEDURE PP10(P, P1, N1, Uf, Ke, Khe : Real;
                  z1, Ka, NRAD, IP : byte;
                  Lh: real;
                  var V, Ft : Real;
                  var IPP, IS : byte);

                 {   Проверка быстроходности цепи            }
   PROCEDURE PP4 (P, N1, Tip : Real;
                  z1 : byte;
                  var INS : byte);
           {   Расчет на прочность по разрывному усилию      }
   PROCEDURE PP6 (P1, x, N1, Kd : Real;
                  IP, z1, Ka, Nrad, Bet : byte;
                  P, B : real;
                  var Fb : real;
                  var IPP, Is : byte);
     PROCEDURE PP6B (P1, x, n1, Kd, Q : real ;
                     z1, Ka, bet : byte;
                     P : real;
                     B : real;
                     IP : byte;
                     var Fb : real;
                     var Is : byte );

           {   Расчет размеров цепи                    }
   PROCEDURE PP5 (P, Tip : Real;
                  Bet, z1, z2, Ka : byte;
                  var A, L, d1, d2, Da1, Da2 : real;
                  var Lp: Integer;
                  var Ia : byte);

           {   Проверка долговечности по числу ударов  }
   PROCEDURE PP7 (z1 : byte;
                  N1, P, Tip : Real;
                  Lp : Integer;
                  var IWmax: byte);


IMPLEMENTATION

             {          Расчет чисел зубьев                   }
  PROCEDURE PP3(U, Tip, Kd, N1 : Real;
                var z1, z2 : byte;
                var Uf, N2 : real;
                var IZmin, IZmax : byte);
   Var  Zmin : byte;
BEGIN
           IZmin := 1; IZmax := 1;
             If Kd <= 1.2 then
                Begin
                 if N1 < 50 then Zmin := Round(11 * Tip);
                 if N1 < 300 then Zmin := Round(13 * Tip);
                 if N1 >= 300 then Zmin := Round(17 * Tip);
                end
                          else Zmin := Round(23 * Tip);
             If z1 < Zmin then IZmin := 0;
             z2 := Trunc( z1 * U );
             z2 := Trunc ( z2 / 2) * 2;
             If z2 > 120 then  IZmax := 0;
             Uf := z2 / z1;
             N2:= N1 / Uf
END;

   PROCEDURE PP2 (P1, N1, Uf, Ke, Tip : Real;
                   z1 : byte;
                  var IT:byte );
   Var T1,T2,v, T1max :real;
BEGIN
   T1 := P1 * 3000 / (pi * n1) ;
   T2 := T1 * Uf ;
   if Tip=1 then T1max:=sqr(50.8)*50.8*z1*3/(sqr(13.2)*13.2)
            else
               begin
                 V := Z1 * n1 *31.75 / (sin (pi / Z1) * 60000) ;
                 T1max :=117 *sqr(31.75)*z1/(1500*Exp(0.667 *ln(V))*Ke)
               end;
              if  T1 > T1max  then IT := 0 else IT:=1;
END ;             {конец процедуры PP2}

               {     Расчет роликовой цепи на износостойкость     }
  PROCEDURE PP10(P, P1, N1, Uf, Ke, Khe : Real;
                  z1, Ka, NRAD, IP : byte;
                  Lh : real;
                  var V, Ft : Real;
                  var IPP, IS : byte);

   Var Pf, Pmax, Lhe, Khp, a : Real;
BEGIN
   IPP := 1;  IS := 1;
   a := Ka * P;
   Lhe:=Lh * Khe;
   V := z1 * P * n1 / 60000 ;
   Ft := P1 * 1000 / V ;
   Case Nrad of
        1: Khp:=1;
        2: Khp:= 1.15;
        3: Khp:= 1.25;
        4: Khp:= 1.5;
     End;
   Pf := Ft * Ke * Khp / (0.28 * sqr (P) * Nrad) ;
   Pmax := 510000 * Exp(0.166 * Ln(z1)) * Exp(0.333 * Ln (Uf * A /
           (sqr (P) * n1))) / Lhe;
   if  Pmax > 40  then  Pmax := 40 ;
   if (Pf > Pmax)  then  IPP := 0;
   if (Pf < 0.2 * Pmax) then IS := 0;
END;

            {  Проверка быстроходности цепи      }
  PROCEDURE PP4 (P, N1, Tip : real;
                 z1 : byte ;
                 var Ins : byte);
   Var Nmax : real;
BEGIN                   { начало процедуры }
    if Tip = 1 then Nmax := 14.E+3 * Exp(0.25 * Ln( z1 )) / p
               else Nmax := 17.E+3*Exp(0.25*Ln(z1))/P;
    If N1 > Nmax then INs := 0  else INs := 1;
END;                  { конец процедуры }

             {     Расчет цепи на прочность                   }
  PROCEDURE PP6 (P1, x, N1, Kd : Real;
                  IP, z1, Ka, Nrad, Bet : byte;
                  P, B : real;
                  var Fb : real;
                  var IPP, Is : byte);
  const
     QZS : array [1..6,1..5] of real =
                    ( (1.31, 2.21, 3.9,  8.4,  14.35),
                      (1.6,  2.71, 4.9,  10.8, 16.55),
                      (2.0,  3.3,  5.91, 13.2, 18.8 ),
                      (2.31, 3.9,  7.0,  15.4, 21.0 ),
                      (2.7,  4.41, 8.0,  0,    0    ),
                      (3.0,  5.0,  0,   0,    0    ));
  Type    TT=Array[1..10] of real;
  Var A, Fud, D1, v, Fmax, Ft, Q, Fc, Fpr, Ftmax, c, m, Smin,
      Fsig, T1,Kpik, S, Frazr : Real;
      Kf, II: byte;
      QRS : TT;

BEGIN                  { начало процедуры }
      IPP := 1;  IS := 1;
      D1 := P / sin (pi / z1) ;
      T1:= P1 * 1000 * 30 /(Pi*N1);
      V := z1 * P * n1 /60000 ;
      If x <= 3 then Kpik:= 2;
      if x <=2 then Kpik:= 1.7;
      if x <=1.5 then Kpik:=1.2;
      Ft := 2000 * T1 * Pi / ( z1 * P);
      Q := PstR[IP,6] * Nrad;
      Fc := Q * sqr (V) ;
      if V > 10  then Fud := 1.3E-7 * n1 * sqr (P) * P
                 else Fud := 0 ;
      if bet = 0  then Kf := 5
                  else
                    if bet <= 40 then Kf := 4
                              else
                                 if bet = 90 then Kf := 1
                                             else Kf := 2 ;

      a := Ka * P ;
      Fpr := Kf * Q * a / 1000 ;
      If v > 2 then  Fsig := Ft * Kd + Fc + Fud + Fpr
               else  Fsig := Ft *Kpik + Fc + Fpr ;
      Frazr := 1000 * PstR[IP,4] * Nrad ;
      S := Frazr / Fsig;
      CASE IP OF
           1,2,3,4 : c := 0.8 ;
             5 , 6 : c := 1.2 ;
             7 , 8 : c := 2.0 ;
             9, 10 : c := 2.3
         end;
      Smin := 7 + c * n1 / 200 ;
      if S < Smin then IPP := 0;
      if S > 5 * Smin then IS := 0;
      Fb:= 2000 * T1 / D1 + 2 * Fpr;
END ;               { конец процедуры }

             {     Расчет цепи на прочность                   }
     PROCEDURE PP6B (P1, x, n1, Kd, Q : real ;
                     z1, Ka, bet : byte;
                     P : real;
                     B : real;
                     IP : byte;
                     var Fb : real;
                     var Is : byte );

  Var A, Fud, D1, v, Fmax, Ft, Fc, Fpr, Ftmax, c, m, Smin,
      S, Fsig, T1,Kpik, Frazr : Real;
      Kf, j1: byte;
BEGIN                  { начало процедуры }
      CASE IP OF
           1..12 : c := 0.8 ;
           13..21 : c := 1.2 ;
           22..25 : c := 2.0
         end;
   D1 := P / sin (pi / z1) ;
   T1 := P1 * 1000 * 30 /(Pi*N1);
   V := z1 * P * n1 /60000 ;
   If x <=10 then Kpik:= 2;
   if x <=2 then Kpik:= 1.7;
   if x <=1.5 then Kpik:=1.2;
   Ft := 2000 * T1 * Pi / ( z1 * P);
   Fc := Q * sqr (V) ;
   if V > 10  then Fud := 1.3E - 7 * n1 * sqr (P) * P
              else Fud := 0 ;
   if bet = 0  then Kf := 5
                else
                   if bet <= 40 then Kf := 4
                              else
                                 if bet = 90 then Kf := 1
                                           else Kf := 2 ;

   A := Ka * P ;
   Fpr := Kf * Q * A / 1000 ;
   Fmax := Ft * Kd + Fc + Fud + Fpr ;
   Ftmax := Ft *Kpik + Fc + Fpr ;
   if Fmax > Ftmax  then  Fsig := Fmax
                    else  Fsig := Ftmax ;
   Smin := 7 + c * n1 / 200 ;
   Frazr := PstZ[IP, 2];
  CASE IP OF
   1,2,3 : begin Smin:= 20 + N1 / 100 ; j1:=6; end;
       4 : begin Smin := 20 + N1 / 83.5 ; j1:=12; end;
       5 : begin Smin := 21 + N1 / 71.5 ; j1:=17; end;
       6 : begin Smin := 21 + N1 / 53 ; j1:=21; end;
       7 : begin Smin := 21 + N1 / 42 ; j1:=25; end;
    end ;
  S := Frazr * 1000 / Fsig ;
  if S < Smin   then IS := 0  else IS:=1;
  Fb:= 1.2 * Ft + 2 * Fpr;
END ;               { конец процедуры }

                        {     Расчет размеров цепи                       }
 PROCEDURE PP5 (P, Tip : real;
                bet, z1, z2, Ka : byte;
                var A, L, D1, D2, DA1, DA2 :real;
                var Lp : integer;
                var Ia : byte);
   Var alf, Lp1, Lpp : real;
BEGIN  {начало процедуры PP5}
        A := Ka * P ;
        Lp1:=2 * A / P + 0.5 * (z1 + z2) + 0.25 * sqr(z2 - z1) *
             P / (sqr(pi) * A) ;
        Lp := 2 * TRUNC (Lp1 / 2) ;
        L := Lp * P ; Lpp := Lp - (z1 + z2) / 2;
        A := P / 4 * (Lpp + sqrt(sqr(Lpp) - 8 * sqr((z2 - z1) /
             (2 * Pi))));
        D1 := P / sin(Pi / z1) ;
        D2 := P / sin(Pi / z2) ;
        alf := 180 - 57 * (D2 - D1) / A ;
        if  alf < 120 then IA := 0 else IA := 1;
        If IA= 1 then
                   if  bet < 70  then  A := A * 0.993 ;
        If Tip = 1 then
        begin
          DA1 := P * (Cos(pi / z1) / Sin(pi / z1) + 0.5);
          DA2 := P * (Cos(pi / z2) / Sin(pi / z2) + 0.5);
        end
        else begin
          DA1 := P * cos( Pi / z1) / sin(Pi / z1);
          DA2 := P * cos( Pi / z2) / sin(Pi / z2);
        end;
END; {конец процедуры PP5}

               {   Проверка долговечности цепи по числу ударов  }
 PROCEDURE PP7 (z1 : byte;
                N1, P, Tip : Real;
                Lp : integer;
                var IWmax : byte);
  Var W, Wmax : real;
         {                                            }
BEGIN
    W := 4 * N1 / (60 * Lp);
    If Tip =1 then Wmax:= 508 / P
              else Wmax:= 800/P - 0.2*P;
    If W > Wmax then IWmax := 0 else  IWmax := 1
END;

END.
