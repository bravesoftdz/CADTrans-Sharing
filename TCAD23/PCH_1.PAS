PROCEDURE TWormWheelTransCAD.MakeVersion;
     Label 1;
     Var
     Mu_H, Mu_f, c_, Ro, Alfa, dv1, dv2, Massa1, Massa2 : real;
     Metka, Imat1, Iq, IAw, IM, IVs : byte;
     dp, Mr,K_Hbeta, K_Hbet: real;
      Sigma_Hmax,               {Максимальное контактное напряжение }
      Sigma_F,                  {Напряжения изгиба }
      Sigma_Fmax,               {Максимальные напряжения изгиба }
      Sigma_Fp,                 {Допускаемые напряжения изгиба }
      Sigma_Fpmax,{Допускаемые пиковые напряжения изгиба }
      Sigma_Hpmax,              {Допускаемое пиковое контактное напряжение }
      Sigma_Hpmax1,
      Sigma_Hpmax2 : real;
     {---------------------------------------------------------}
     Type tt1=array [1..45] of real;
  Const
    ms: tt1 = ( 1.0, 1.125, 1.25, 1.375, 1.5, 1.75, 2.0,
                2.25,  2.5, 2.75, 3.0, 3.5, 4.0, 4.5, 5.0,
                5.5, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0,
                14.0, 16.0, 18.0, 20.0, 22.0, 25.0, 28.0,
                32.0, 36.0, 40.0, 45.0, 50.0, 55.0, 60.0,
                70.0, 80.0, 90.0, 100.0, 0, 0, 0, 0 );

    Aws : tt1 = (40, 50, 63, 80, 100, 125, 140, 160, 180, 200,
                 225, 250, 280, 315, 355, 400, 450, 500, 560,
                 630, 710, 800, 900, 1000, 1120, 1250, 1400,
                 1600, 1800, 2000, 2240, 2500, 0, 0, 0, 0, 0, 0,
                 0, 0, 0, 0, 0, 0, 0);

           Qs : tt1 = (7.1, 8.,9., 10, 11.2, 12.5, 14, 16, 18, 20, 22.4,
                      25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
           Vss : tt1 = (1, 2, 3, 4, 5, 6, 8, 12, 15, 25, 30, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    {------------------------------------------------------------------}
                        { Выбор по переменной ее порядкового номера из массива }
      PROCEDURE PNomer (a:real;var b :TT1; I,N : byte; var ia : byte);
           Label 1;
           var j : byte;
           Begin
             For j:= I to N do
                if a <= b[j] then begin ia := j; goto 1; end;

        1: End;
              {  Процедура округления до ближайшего большего стандартного значения }
  PROCEDURE Wibor (Ac : tt1;
                     i_min, i_max : byte;
                     Ap : real;
                     Var A : real;
                     Var iA : byte );
    Label 1;
    Var i : integer;
          Begin
               { Начало процедуры Wibor }
             For i := i_min to i_max  do begin
                 if Ac[i]>=Ap then begin
                         A:=Ac[i];
                         iA:=i ;
                         goto 1;
                                   end;
                 if i=i_max then begin
                          A:=Ac[i_max];
                          iA:=i_max;
                          goto 1;
                                 end;
                                         end;
         1:End;



                {   Процедура выбора ближайшего из стандартного ряда  }
      PROCEDURE VIBOR (As: Tt1; i_min, i_max : byte;
                        Ar : real; var A1r : real; var Id : byte);
             Var del, del1 : real;
                 A0, I1 : byte;
             Begin
                 del := Abs(Ar - As[1]);
                 Id := i_min;
                 A0 := 0;
               For I1 := 2 to i_max DO begin
                  del1 := Abs( Ar - As[I1]);
                  If del < del1 then begin
                     A1r:= As[Id];
                     A0:= A0 +1;
                                     end
                  else begin
                    del := del1;
                    id := I1;
                       end;
                                      end;
             END;
  {---------------------------------------------------------------------}
                       {  Расчет допускаемых напряжений    }
    PROCEDURE PrCH1;
       LABEL 1;
       VAR Cv, K_Hl, K_Fl: REAL;
          PROCEDURE PR_KL (N,Mu_H,Mu_F : REAL; LH : integer;
                            VAR K_Hl, K_Fl : REAL );
                VAR N_sum, N_He, N_Fe :REAL;
               BEGIN
                  N_sum:= 60*N*LH;
                  N_He:= N_sum * Mu_H;
                  IF N_He > 25.E7 then N_He:= 25.E7;
                  IF N_He < 1.E6 then N_He := 1.E6;
                  K_Hl:= Exp(0.125 * Ln(1.E7/N_He));
                  N_Fe:= N_sum * Mu_F;
                  IF N_Fe > 25.E7 then N_Fe:= 25.E7;
                  IF N_Fe < 1.E6 then N_Fe := 1.E6;
                  K_Fl:= Exp(0.111 * Ln(1.E6/N_Fe));
                END;
            BEGIN
               IF Sigma_B2 <> 0 then
               begin
                  PR_KL (N2,Mu_H,Mu_F,LH,K_Hl,K_Fl);
                  IF Vs < 1 then Cv:= 1.33
                  else
                  begin
                   if Vs < 8 then Cv:= 1.4 - 0.076 * Vs
                   else Cv:= 0.8;
                  END;
                  If Termobr1 = 5 then
                  CASE WheelGroup of
                    '1'..'2' : Sigma_Hp:= 0.9*Cv*Sigma_B2*K_Hl;
                    '3'..'4' : Sigma_Hp:= 300 - 25*Vs;
                    '5'      : Sigma_HP:= 275 - 25*Vs;
                  End;
                  If Termobr1 = 4 then
                  CASE WheelGroup of
                    '2' : Sigma_Hp := 0.7*Cv*Sigma_B2*K_Hl;
                    '3' : Sigma_Hp := 275 - 25*Vs;
                    '4' : Sigma_Hp := 250 - 25*Vs;
                    '5' : Sigma_Hp := 200 - 35*Vs;
                  END;
                 If (Termobr1 = 1) and (WheelGroup = '5') then Sigma_Hp:=175-35*Vs;
                 CASE WheelGroup of
                   '1'..'4' : Sigma_Fp:= (0.25*Sigma_T2+0.08*Sigma_B2)*K_Fl;
                   '5'      : Sigma_Fp := 0.22*Sigma_B2*K_Fl;
                 END;
                 If Reverse  then Sigma_Fp := 0.8*Sigma_Fp;
                 CASE WheelGroup OF
                   '1'..'2' : Sigma_Hpmax := 4 * Sigma_T2;
                   '3'..'4' : Sigma_Hpmax := 2 * Sigma_T2;
                   '5'      : Sigma_Hpmax := 1.65 * Sigma_B2;
                 END;
                 CASE  WheelGroup of
                   '1'..'4' : Sigma_Fpmax := 0.8 * Sigma_T2;
                   '5' : Sigma_Fpmax := 0.75 * Sigma_B2;
                 END;
                                    END;
        1: END;
        {----------------------------------------------------------}
                     {   Проектный расчет    }
      PROCEDURE PrCH2;

         Label 1, 2, 3, 4;
         Var  Awr,  M_r, Q_r, Qz : REAL;
           BEGIN

               If U < 16 then z1 := 4
               else
               Begin
                 If U > 32 then z1 := 1
                 else z1 := 2;
               End;
             z2 := Round(z1 *U);
              CASE Metka of
                 1 : Goto 1;
                 2 : Goto 2;
                 3 : Goto 3;
                 4 : Goto 4;
               END;
        1 :  CASE z1 of
               1 : K_Hbet := 1.06;
               2 : K_Hbet := 1.15;
               4 : K_Hbet := 1.25;
             End;
         Awr:= 610*Exp(0.333*Ln(T2*K_Hbet/sqr(Sigma_Hp)));
         If Awr > 2500 then
         begin
            ErrorCode := 1;
            Exit;
         End;
       If otw1 then Wibor (Aws,1,32,Awr,Aw,IAw)
       else Aw:=Awr;
     2 :  If Metka = 2 then
            M_r:=2*Aw/(Q + z2);
          IF Metka = 1 then M_r:=1.6 * Aw/z2;
          If  M_r > 100 then
          begin
             ErrorCode := 2;
             Exit;
          End;
          Vibor (Ms,1,40,M_r,M,IM);
3:        Q_r := 2 * Aw / M - z2;
          If Q_r > 25 then
          begin
             ErrorCode := 3;
             Exit;
          End;
          Vibor (Qs,1,12,Q_r,Q,Iq);
          If not otw1 then
            Aw:=0.5*M*(Q + z2);
4:        X1 := (Aw - 0.5*M*(Q + z2))/ M;
          If X1 > 1 then
  {1}        Begin
                If (x1-1) <= Round(0.03*z2)/2 then
  {3}             Begin
                    z2:=z2 + Round(0.03*z2);
                    X1 := (Aw - 0.5 * M* (Q + z2)) / M;
       {3}        END
                else
  {4}              Begin
                   If (IQ + 1) <= 12 then
                   begin
                      IF (x1-1) <= (Qs[IQ+1]-Q)/2 then
  {5}                    Begin
                          Q := Qs [IQ + 1];
                          X1 := (Aw - 0.5*M*(Q + z2)) / M;
        {5}              END
                      else
  {6}                    Begin
                           if (x1-1) <= (Round(0.03*Z2)+(Qs[IQ+1]-Q))/2 then
                           begin
                            Q := Qs [IQ + 1];
                          z2 := z2 + Round(0.03*Z2);
                          X1 := (Aw - 0.5*M*(Q +z2)) / M;
                          end
                          else begin
                               X1 := 0;
                               Aw := 0.5 * M * (Q +z2 );
        {7}               END
                      end
        end
                    else begin
                               X1 := 0;
                               Aw := 0.5 * M * (Q +z2 );
                  end
                end
        end
               else If X1 < -1 then
  {9}                    Begin
                         If abs(x1+1) <= Round(0.03 * z2)/2 then
  {10}                       Begin
                           z2 := z2 - Round(0.03*z2);
                           X1 :=(Aw - 0.5*M*(Q + z2))/M;
        {10}                 END
                         else
  {11}                       Begin
                           if (IQ - 1) >= 1 then
                           begin
                             if abs(x1+1) <= (Q - Qs[IQ-1])/2 then
  {12}                           Begin
                               Q := Qs[IQ-1];
                               X1 := (Aw-0.5*M*(Q+z2))/M;
        {12}                     END
                             else Begin
                             if abs(x1+1) <= (Round(0.03*Z1)+(Q - Qs[IQ-1]))/2 then
                             begin
                               z2 := z2 - Round(0.03*Z2);
                               Q := Qs[IQ-1];
                               X1 := (Aw -0.5*M*(Q+z2))/M;
        {14}                 END
                               else
  {15}                             Begin
                                 X1 :=0;
                                 Aw := 0.5*M*(Q + z2);
        {15}                       END;
        {13}                     END;
        {11}                  END
                          else begin
                                 X1 :=0;
                                 Aw := 0.5*M*(Q + z2);
        {9}              END;
        {1}           End;
                     end;
               GammaW := ArcTan(z1 / (Q + 2*X1));
               Vs := PI * N1 * M * (Q + 2*X1)/(Cos(GammaW)*60000);
               If Vs > 8 then St := 7 else
                  if Vs < 2 then St :=9
                  else St := 8;
               D1 := Q * M;
               D2 := M *z2;
               Dw1 := M * (Q + 2 *X1);
       END;
 {------------------------------------------------------------------------}
             {   Расчет всех фактических  напряжений  }
PROCEDURE PrCH3;
      Var Tet, K_Hbeta,K_Hv, KH, CosGam, Zv, YF, Ft : Real;
      Begin
         Case z1 of
            1 : Tet := 18 *Q - 70;
            2 : Tet := 13.6 * Q -70;
            3 : Tet := 12.5 *Q - 70;
         END;
               {   K_Hbeta }
         with Loading do
           K_Hbeta := 1 + Exp(3*Ln(z2/Tet)) * (1-(I +Y*J +Z*K));
               {   K_HV    }
         K_Hv := 1.01 + 0.01 * Vs;
         KH := K_Hbeta * K_Hv;
         Sigma_H := 15000 * sqrt(T2 * KH / Dw1) / D2;
         Sigma_Hmax := Sigma_H *sqrt(Loading.X);
         CosGam := Cos(GammaW);
         Zv := z2 / Exp(3*Ln(CosGam));
         Yf := 3.55 / (Exp(0.22*Ln(Zv))) + 0.01;
         Dw1 := M *(Q + 2*X1);
         Ft := 2 *T2 *1000 /(M *z2);
         Sigma_F := Ft *KH * CosGam * Yf / (1.3 *M *Dw1);
         Sigma_Fmax := Sigma_F *Loading.X;
      END;
  {------------------------------------------------------------------}
                    { Рачет геометрических размеров  }
    PROCEDURE PrCH4;
         Const
           Xs : tt1 = ( -1.0, -0.5, 0, 0.5, 1.0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
         Var I, Ix :Byte;
             H_f1,H_A1, H_1 :real;
           Begin
             D1 := M * Q;
             Dw1 := M * (Q + 2 * X1);
             D2 := M * Z2;
             Da1 := D1 + 2 * M;
             Da2 := D2 + 2 * (1 + X1) *M;
             H_A1 := M;
             Gamma := ArcTan(Z1 / Q);
             CASE TipCH of
               0 : H_F1 := 1.2 * M;
               1 : H_F1 := (2.2 * Cos(Gamma) -1) * M;
               2 : H_F1 := 1.2 *M;
             END;
             Df1 := D1 - 2 * H_F1;
             Df2 := D2 - 2 * (1.2 - X1) * M;
             Dam2 := Da2 + 6 *M /(z1 + 2);
             Rf := 0.5 * D1 + 1.2 * M;
             Ra := 0.5 *D1 - M;
             GammaW := ArcTan( Z1 * M / DW1);
             Pnomer(x1,Xs,1,5,Ix);
                 If Z1 < 4 then
                 Begin
                     B2 := Round (0.75*Da1);
                     CASE IX of
                        1 : B1 := Round ((10.5 + 0.06 * z2 ) * M);
                        2 : B1 := Round ((8 + 0.06 * z2 ) *M);
                        3 : B1 := Round ((11 + 0.06 * z2 ) * M);
                        4 : B1 := Round ((11 + 0.1 * z2 ) * M);
                        5 : B1 := Round ((12 + 0.1 * z2 ) * M);
                     END;
                 END
                 else
                 Begin
                   B2 := Round (0.67*Da1);
                   CASE IX of
                     1 : B1 := Round ((10.5 + 0.06 * z2) * M);
                     2 : B1 := Round ((9.5 + 0.09 * z2 ) * M);
                     3 : B1 := Round ((12.5 + 0.09 * z2 ) * M);
                     4 : B1 := Round ((12.5 + 0.1 * z2 ) * M);
                     5 : B1 := Round ((13 + 0.1 *z2 ) * M );
                   END;
                 END;
               IF H_HBp1 > 350 then B1 := Round (B1 + 4 * M);
               deltaO := 2 * ArcSin(B2 / (Da1 - 0.5 * M ));
               H_1 := 2 * M;
               Rof1 := 0.3 * M;
           END;
   {----------------------------------------------------------------}
                {  Расчет контрольного комплекса    }
   PROCEDURE PrCH5;

         Const
    DpS : tt1 = (1.591, 1.732, 1.838, 2.020, 2.071,
                 2.217, 2.311, 2.595, 2.866, 3.106,
                 3.177, 3.287, 3.310, 3.468, 3.580,
                 3.666, 4.091, 4.141, 4.211, 4.400,
                 4.773, 5.175, 5.493, 6.212, 6.585,
                 8.262, 8.767, 10.353, 10.95, 12.423,
                13.133, 16.565, 17.362, 20.706, 21.863,
                24.287, 26.231,0, 0, 0, 0, 0, 0, 0, 0 );
       Var K, Alfa_, Gamma, S2 : REAL;
           Idp : byte;
                          {------------------}
       BEGIN
         P_1 := PI * M;
         Pz1 :=P_1 * Z1;
         Gamma := ArcTan(Z1 /Q);
         Sna1 := 0.5 *PI * M * Cos(Gamma);
      Ha1 := M + 0.5 * Sna1 * Tan(0.5*ArcSin(Sna1*SQR(Sin(Gamma))/D1));
        S2 := PI *M/2 + 2*X1*M* 0.364;
        K :=M * Z2 / Sqr(Gamma);
        Sna2 := K * Sin(S2/K);
        Ha2 := Da2 / 2 - M*Z2/2 + 0.5 *K *(1 - Cos(S2 / K));
                           {-----------------}
        d_p := 1.67 * M;
        If d_p > 26.231 then
        begin
          ErrorCode := 4;
          Exit;
        End;
        Vibor (Dps,1,37,d_p,dp,Idp);
        CASE TipCH OF
          0 : Alfa_ := ArcTan(0.364 / COS(Gamma));
          1..2 : Alfa_ :=20 *PI /180;
        END;
        M1:=d1-(P_1-0.5*PI*M)*Cos(Gamma)/Tan(Alfa_)+dp*(1/Sin(Alfa_)+1);
     END;
          {-------------------------------------------------------------}
                 { Расчет качественных показателей   }
     PROCEDURE PrCH6;
         Label 1 ;
         Var Alfaa2, Alfa_X, db2, AWpodr, Awzaostr, Alfat : REAL;
         Begin
            If TipCH = 0 then Alfa_X := 20*Pi/180
            else Alfa_X := ArcTan(0.364/ Cos(Gamma));
                 {  Проверка подрезания   }
            AWpodr := 0.5 * (da1 + M * Z2 *Sqr(Cos(Alfa_X)));
            If Aw < Awpodr then
            begin
                   ErrorCode := 5;
                   Goto 1;
            End;
                 {    Проверка заострения   }
            AWzaostr := M*(0.55*Z2-0.64-0.024*Alfa_X*180/Pi)+0.5*da1;
           If Aw >= Awzaostr then
           begin
                   ErrorCode := 6;
                   Goto 1;
           End;
                 {  Коэффициент перекрытия   }
          Alfat := ArcTan(Cos(Alfa)/Cos(Gamma));
          db2 := M*z2*Cos(Alfat)/Cos(Gamma);
          Alfaa2 := ArcCos(db2/Da2);
{  Epsia:=z2*(Tan(Alfaa2)-Tan(Alfa))/(2*Pi)-2*(Ha1-X1-0.1)/(Pi*Sin(2*Alfa));
         If Epsia < 1.2 then
         begin
                  Error := 7;
                  Goto 1;
         End;}
     1:   END;
             {--------------------------------}
     Begin                {Начало процедуры Expandata }
         Alfa := 20*Pi/180;
         ErrorCode := 0;
         T1 := P1 *1000*30 /( Pi*N1);
     with Loading do
     IF not Nagr then Case GraphBar of
       1 : BEGIN I:= 1; J :=0;  k :=0; Y :=0; Z :=0; END;
       2 : BEGIN I:= 0.3; J:= 0.4; k:= 0.3; Y:= 0.8; Z:= 0.4; END;
       3 : BEGIN I:= 0.15; J:= 0.45; k:=0.4; Y:= 0.6; Z:=0.2; END;
       4 : BEGIN I:=0.1; J:= 0.4; k:= 0.5; Y:= 0.6; Z:= 0.2; END;
       5 : BEGIN I:= 0.1; J:= 0.2; k:= 0.7; Y:= 0.5; Z:=0.1; END;
       6 : BEGIN I:= 0.05; J:= 0.2; k:=0.75; Y:= 0.4; Z:= 0.1; END;
       7 : BEGIN I:= 0.025; J:= 0.125; k:=0.8; Y:= 0.35; Z:= 0.1; END;
                      END;
     with Loading do
     begin
    Mu_H := Exp(0.25 * Ln(I + Y*Y*Y*Y*J + Z*Z*Z*Z*k));
    T2 := T1 * U *(1 - U/200);
    Mu_F := Exp(0.11 *Ln(I+J*Y*Y*Y*Y*Y*Y*Y*Y*Y+k*Z*Z*Z*Z*Z*Z*Z*Z*Z));
    end;
    N2:=N1/U;
    Vs := 4.5 * N1 *Exp(0.333 * Ln(T2))/10000;
              {  Расчет допускаемых нпряжений   }
                 PrCH1;
                {  Проектный расчет передачи }
   Metka := 1;
  1:               PrCH2;
                 { Расчет фактических напряжений }
                 PrCH3;
                  Vs := Pi *N1 * dw1/(Cos(GammaW)*60000);
                  Pnomer (Vs, Vss,1, 10, Ivs);
                {  Уточнение допускаемых нпряжений  }
                 PrCH1;
  { Проверка условия фактическое напряжение < допускаемого напряжения}
                 { Проверка по контактным напряжениям}
             IF Sigma_H > 1.03*Sigma_Hp THEN
             BEGIN
                IF otw1 THEN
                BEGIN
                     IAw := IAw + 1;
                     If IAw < 32 then  Aw := Aws[IAw]
                     else
                     Begin
                     ErrorCode := 1;
                     Exit;
                     End;
                END
                else
                     Aw := Aw * Exp(0.333*Ln(Sigma_H / Sigma_Hp));
                Metka := 2;
                GOTO 1;
             END;
             IF Sigma_Hmax > Sigma_Hpmax THEN
             BEGIN
                IF otw1 THEN
                BEGIN
                     IAw := IAw + 1;
                     If IAw < 32 then  Aw := Aws[IAw]
                     else
                     Begin
                     ErrorCode := 1;
                     Exit;
                     End;
                     Aw := Aws[IAw];
                END
                else
                     Aw := Aw * Exp(0.333*Ln(Sigma_H / Sigma_Hp));
                Metka := 2;
                GOTO 1;
             END;
                     { Проверка изгибных напряжений}
          If Sigma_F > 1.03* Sigma_Fp then
          begin
             M := M * Sqrt( Sigma_F / Sigma_Fp);
             Wibor (Ms, 1, 40, M, M, Im);
            If Iq > 1 then
            begin
               Q := 2 * Aw / M -2 * X1 - z2;
               If Q > 25 then
               Begin
                  ErrorCode := 3;
                  Exit;
               End;
               Vibor (Qs,1, 12, Q, Q, Iq);
               Metka := 4;
               Goto 1;
            End
            else
            begin
               Aw := 0.5*M*(q+z2)+2*x1;
               Wibor (Aws, 1, 32, Aw, Aw, IAw);
               Metka := 3;
               Goto 1;
            End;
          End;
          If Sigma_Fmax > Sigma_Fpmax then
          begin
             M := M * Sqrt( Sigma_F / Sigma_Fp);
             Wibor (Ms, 1, 40, M, M, Im);
            If Iq > 1 then
            begin
               Q := 2 * Aw / M -2 * X1 - z2;
               Vibor (Qs,1, 12, Q, Q, Iq);
               Metka := 4;
               Goto 1;
            End
            else
            begin
               Aw := 0.5*M*(q+z2)+2*x1;
               Wibor (Aws, 1, 32, Aw, Aw, IAw);
               Metka := 3;
               Goto 1;
            End;
          End;
                { Геометрический расчет   }
           PrCH4;
                { Расчет   КПД  }
          Ro := 2.97*Pi / ( Exp (0.45*Ln(Vs))*180);
          KPD := Tan(GammaW) / Tan (GammaW + Ro);
          Uf:=z2/z1;
                {  Расчет усилий в зацеплении   }
              Ft1 := 2 * T1 * 1E3 / d1;
              Ft2 := 2 * T1 * Uf * KPD * 1E3 / D2;
              Fr1 := Ft2 * Tan (Alfa);
              Fr2 := Fr1;
              Fx1 := Ft2;
              Fx2 := Ft1;
              Fb1 := Sqrt(sqr(Ft1)+Sqr(Fr1));
              Fb2 := Sqrt(sqr(Ft2)+Sqr(Fr2));
                { Контрольный комплекс  }
          PrCH5;
                { Расчет показателей качества   }
{          PrCH6;}
                { Расчет массы и обьема  }
          dv1 := Exp(0.333*Ln(T1 * 1000 /5));
          N2:=N1/Uf;
          T2 := T1 * Uf * KPD;
          dv2 := Exp(0.333*Ln(T2 * 1000 /10));
Massa1:=Pi*0.25*(d1*d1*B1+dv1*dv1*(d2-B1)+0.54*B2*(d2*d2+dv2*dv2))/1.E6;
Massa1 := Massa1 * 7.81;

    Massa2 :=Pi*0.25*((d1*d1*B1)+dv1*dv1*(d2-B1)+B2*(d2*d2-dv2*dv2))/1.E6;
    Massa2 := Massa2 *7.81;
    Massa := Min3 (Massa1, Massa1, Massa2);
    Vp := (Pi*d1*d1*B1/4 +Pi*dam2*dam2*B2/4)*1.E-6;
END;
