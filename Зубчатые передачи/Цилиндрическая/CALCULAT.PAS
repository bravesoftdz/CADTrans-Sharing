{$O+}
Unit
  Calculat;
INTERFACE
Type
    TLoading = record

      GraphBar: word;
      x, y, z, i, j, k: single;
    end;
    TSteelMark = string[23];
    TTwoWord = array [1..2] of word;
    var  f1:    TextFile;

procedure CalculateCWheel (
    Loading: TLoading;
    P1,               {Мощность, передаваемая быстроходным валом}
    n1,               {Частота вращения быстроходного вала}
    U:real;           {Передаточное число передачи}
    DeltaU: byte;
    Lh:real;          {Расчетный ресурс передачи}
    Tipz:word;        {тип зубьев колес: 1 - прямые
                                         2 - косые
                                         3 - шевронные
                                         0 - автовыбор}
    betg:real;        {угол наклона зуба в градусах;
                                    при Tipz= 0 становится варьируемым
                                    параметром со знчениями 0, 10, 25 }
    kanavka: word;    {Для шевронных колес при наличии канавки = 1,
                                           при отсутствии канавки =0}
    mc1,              {марка стали для шестерни}   {????????????????}
    mc2:TSteelMark;   {марка стали для колеса}     {??????????????????}
    Termobr1,         {термообработка зуба шестерни, номер}
    Termobr2:byte;    {термообработка зуба колеса, номер}
    Zagotowka:TTwoWord;
                      {Способ получения заготовки шестерни и колеса
                         = 1 для поковок
                         = 2 для штамповок
                         = 3 для проката
                         = 4 для отливок  }
    Ra1,              {Шероховатость боковой поверхности зуба шестерни}
    Ra2:word;         {Шероховатость боковой поверхности зуба колеса}
    Wikrugka:TTwoWord;
                      {Финишная обработка выкружки зуба
                        = 0 выкружка зубофрезерована или шлифована
                        = 1 при полировании выкружки}
    Nom_sx,           {Номер схемы расположения колес}
    Zw:byte;          {Число колес находящихся в одновремен-
                       ном контакте с шестерней}
    Psi_ba:real;      {Коффициент ширины венца,
                       при фиксированном значении вводится из стандартного
                       ряда в зависимости от схемы передачи;
                       при вводе АВТОВЫБОР становится варьируемым
                       параметром также в зависимости от схемы передачи}
    Nagr,             {=1 для типового режима,
                       = 0 для циклограммы}
    rewers:boolean;   {При реверсировании = 1;
                       без реверсирования = 0}
    Ka:real;          {Коэффициент внешней динамики}
    otw1:boolean;     {При стандартном межосевом расстоянии = 'Y',
                       при нестандартном межосевом расстоянии ='n'}
    BISTR:boolean;    { "0", если передача является тихоходной ступенью}
                      { "1", если передача является быстроходной ступенью}
    motw:TTwoWord;
                      {Выбор инструмента:
                                      1   при нарезании долбяком
                                      0   при нарезании фрезой
                                      2   при нарезании старым долбякоми}
    H_HRcs1,          {Твердость сердцевины зуба шестерни по Роквеллу}
    H_HRcs2,          {Твердость сердцевины зуба колеса по Роквеллу}
    H_HRcp1,          {Твердость поверхности зуба шестерни по Роквеллу}
    H_HRcp2,          {Твердость поверхности зуба колеса по Роквеллу}
    H_HBs1,           {Твердость сердцевины зуба шестерни по Бринелю}
    H_HBs2,           {Твердость сердцевины зуба колеса по Бринелю}
    H_HBp1,           {Твердость поверхности зуба шестерни по Бринелю}
    H_HBp2,           {Твердость поверхности зуба колеса по Бринелю}
    H_HVs1,           {Твердость сердцевины зуба шестерни по Виккерсу}
    H_HVs2,           {Твердость сердцевины зуба колеса по Виккерсу}
    H_HVp1,           {Твердость поверхности зуба шестерни по Виккерсу}
    H_HVp2 : integer; {Твердость поверхности зуба колеса по Виккерсу}
    S_f1,             { Коэффициент выносливости по изгибу для шестерни}
    S_f2,             { Коэффициент выносливости по изгибу для колеса}
    Y_d1,             {Коэффициент деформационного упрочнения для шестерни}
    Y_d2,             {Коэффициент деформационного упрочнения для колеса}
    Y_g1,             {Коэффициент, учитывающий шлифование  для шестерни}
    Y_g2 : real;      {Коэффициент, учитывающий шлифование  для колеса}
    Sigma_t1,         {Предел текучести материала шестерни}
    Sigma_t2,         {Предел текучести материала колеса}
    Sigma_Flim01,     {Предел выносливости по изгибу для шестерни}
    Sigma_Flim02,     {Предел выносливости по изгибу для колеса}
    Sigma_Fst01,      {Предельное напряжение для шестерни}
    Sigma_Fst02: real; {Предельное напряжение для колеса}
    {-------------------------------------------------------------------}
    var
{--------------------- Критерии качества ---------------------------------}
    Massa,                   {Суммарная масса зубчатых колес}
    V_p,                     {Объём занимаемый передачей}
    B1,
{-------------------------------------------------------------------------}
    b2,                      {ширина венца}
    Mn,                      {Нормальный модуль }
    aw:real;                 {межосевое расстояние передачи}
    var
    z1, z2 : word;           {Числа зубьев}
    var
    St : integer;            {Степень точности}
    var
    Fv ,                     {Суммарное давление на вал}
    epsias,                  {суммарный к-т перекрытия}
    alfatw,                  {угол зацепления зубчатых колес}
    Uf,                      {Фактическое передаточное число передачи}
    n2,                      {Частота вращения колеса}
    V,                        { Скорость, м/с}
    Da1, Da2,                {Диаметр окружности вершин }
    d1,  d2,                 {Делительный диаметр}
    x1,  x2,                 {Коэффициент смещения исходного контура}
    Dw1,                      {Начальный диаметр }
    Df1,                      {Диаметр окружности впадин }
    Dw2,                      {Начальный диаметр }
    Df2,                      {Диаметр окружности впадин }
    Bet,
    Sigma_H,                  {Контактное напряжение }
    T1,                     {Момент, передаваемый быстроходным валом}
    T2,                     {Момент, передаваемый тихоходным валом}
    Ft1,                      { Окружное усилие   }
    Fr1,                      {Радиальное усилие}
    Fx1,                      {Осевое усилие  }
    Ft2,                      { Окружное усилие}
    Fr2,                      { Радиальное усилие}
    Fx2 : real;
    var
    Error: byte;
   var Sigma_F1,                 {Напряжения изгиба в зубе шестерни}
             Sigma_F2,                 {Напряжения изгиба в зубе колеса}
             Sigma_Fp1,
             Sigma_Fp2,               {Допускаемые напряжения изгиба }
             Sigma_Hp :real          {Допускаемое контактное напряжение} );

IMPLEMENTATION
Uses
  Math1;

procedure CalculateCWheel;
           Label 1,2,3,7 ;
           Var  Iz, I, II, IAw, Metka, Tipp, otbet, otbet1 : byte;
              H_l, dv2, Ro_f, Alfa, Epsia1, Epsia2, Za, K_HB,
              Sigma_Hlimb1, Sigma_Hlimb2,
                     {Параметры исходного контура}
              ha, hl, rof : real;
                       {--------------------------}
              Z_min, Z1_ : byte;
              otw : char;
                     { Параметры долбяка }
             aw0, betaa0, roa0, sn0, alfatw0, alfaa0 : real;
             { Переменные для расчета коэффициентов смещения}
             z0,
             z:array[1..2] of integer;
             x, alfaa, dww, db, roa, alfaat, x11, x22:array[1..2] of real;
             sss : string [40];
             s : array [1..8] of byte;
             Sigma_Fpmax1, Sigma_Fpmax2: real;
             Sigma_Hpmax: real;
             Imn: byte;
             da0, db0, x0: array [1..2] of real;
             rol, rop, xmin:array [1..2] of real;
             Alfat: real;
             xs: real;
             a: real;
             bw, Bk: real;
             tet1, tet2: real;
             izn: real;
             sna1, sna2, epsia: real;
             Zmin: real;
             x1min: real;
             Eps_bet: real;
             Betb: real;
             Sigma_Hmax: real;
             Sigma_Fmax1, Sigma_Fmax2: real;
             db1, db2: real;
             Sna, Srezmax, Srez: array [1..2] of real;
             TipZp: byte;
             Massa1, Massa2: real;
//             Sigma_F1,                 {Напряжения изгиба в зубе шестерни}
//             Sigma_F2,                 {Напряжения изгиба в зубе колеса}
//             Sigma_Fp1,
//             Sigma_Fp2,               {Допускаемые напряжения изгиба }
//             Sigma_Hp :real;          {Допускаемое контактное напряжение}

Type
  TT1 = array [1..45] of single;

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
     c_ = 0.25;
      {---------------------------------------------------------------------}
FUNCTION Mu_H: real;
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

FUNCTION Mu_F (Target: byte): real;
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
          {     Расчет допускаемых контактных напряжений          }
          PROCEDURE PzubC2;
              Var c1 : real;
                  Sigma_Hp1, Sigma_Hp2: real;
                  Sigma_Hpmax1, Sigma_Hpmax2: real;
          { Процедура расчета допускаемых контактных напряжений }
PROCEDURE PrSigHp (Da,Mn,N,Mu_H,H_HBp,H_HRcp,H_HVp,Ra:real; Lh:integer;
                    Termobr,Zw: byte; var Sigma_Hlimb,Sigma_Hp :real);

          var Zx,Zv,Zr,Sh,N_Hlim,N_sum,N_He,Zn,Sigma_Hlim :real;

      BEGIN
          If Ra = 0 then
            Zr:= 1
          else if Ra = 1 then
            Zr:= 0.95
          else
            Zr:= 0.9;

         Case Termobr of
                  1,2,3   : Sh := 1.1;
                  4,5,6,7 : Sh := 1.2
         end;
         Case Termobr of
              1,2 : Sigma_Hlim := 2 * H_HBp + 70;
                3 : Sigma_Hlim := 1.8 * H_HBp + 150;
                4 : Sigma_Hlim := 1.7 * H_HBp + 200;
              5,6 : Sigma_Hlim := 2.3 * H_HBp ;
                7 : Sigma_Hlim := 1050;
          End;
     N_Hlim := 30 * Exp(2.4*Ln(H_HBp));
     if N_Hlim > 12E7 then N_Hlim := 12E7;
     N_sum := 60 * N * Lh * Zw;
     N_He := Mu_H * N_sum;
       If N_He <= N_Hlim then begin
            Zn := Exp(0.167*Ln(N_Hlim / N_He));
              if Termobr <= 3 then if Zn > 2.6 then Zn := 2.6
              else if Zn > 1.8 then Zn := 1.8;
                             end
       Else begin
            Zn := Exp(0.05*Ln(N_Hlim / N_He));
              if Zn < 0.75 then Zn := 0.75;
            end;
      If Da = 0 then
              Sigma_Hp := Sigma_Hlim * Zn * 0.9/ Sh
      else begin
            if Da <= 700 then Zx := 1 else Zx := Sqrt(1.07 - 0.0001 * Da);
            v := Pi * ( Da - 2 * Mn) * N / 60000 ;
            if H_HBp <= 350 then Zv := 0.85 *Exp(0.1*Ln(v))
            else Zv := 0.925 * Exp(0.05*Ln(v));
           Sigma_Hp := Sigma_Hlim * Zn * Zr * Zv * Zx / Sh
           End;
           Sigma_Hlimb:=Sigma_Hlim;
      END;
            {   Расчет допускаемых изгибных напряжений       }
     PROCEDURE PrSigFp (DA,Mn,Mu_f,N,S_f,Yd,Yg:real; Lh:integer;
                       H_HBp,Sigma_Flim0:real; Rewers: boolean;
                       Termobr,Zagotowka,
                       Wikrugka,Zw:byte; var Sigma_Fp:real );
     var  Yx,Yr,Yn,Y_delta,Yz,N_sum,N_Fe,Sigma_Flim,Ya,q_F : real;
         BEGIN
            if Wikrugka = 0 then
              Yr := 1
            else
              case Termobr of
                 1..3 : Yr := 1.2;
                 4..7 : Yr := 1.05;
              end;
            N_sum := 60 * N * Lh * Zw;
            N_Fe := Mu_F * N_sum;
              if (Wikrugka =0) and ( H_HBp > 350 )  then q_F := 9
              else   q_F := 6;
            If  N_Fe > 4E6 then Yn := 1
            else Yn := Exp(q_f*Ln(4E6 / N_Fe ));
            if ((q_F = 6) and (Yn > 4)) then Yn := 4;
            if ((q_f = 9) and (Yn > 2.5)) then Yn := 2.5;
            If not Rewers then Ya := 1
            else  Case Termobr of
                       1,2     : Ya := 0.65;
                       3,4,5,6 : Ya := 0.75;
                        7 : Ya := 0.9
                  end;
            Case Zagotowka of
                        0,1 : Yz := 1;
                          2 : Yz := 0.9;
                          3 : Yz := 0.8
            end;
            If Da =0 then Sigma_Fp := 0.4 * Sigma_Flim0 *Yn*Ya
            else begin
                   Yx := 1.05 - 0.000125 * Da;
                   Y_delta := 1.082 - 0.172 * Log10(Mn);
                   Sigma_Flim := Sigma_Flim0 * Yz * Yg * Yd * Ya;
                   Sigma_Fp := Sigma_Flim * Yn * Y_delta * Yr * Yx / S_f;
                 end;
         END;
               {   РАСЧЕТ максимальных допускаемых напряжений   }
     PROCEDURE  PrSigMax (Sigma_t,H_HRcp,H_HVp,Sigma_Fst0,Da: real;
                Zagotowka,Termobr:byte; var Sigma_Hpmax,Sigma_Fpmax:real);
            var S_Fst,Yx,Yz : real;

            BEGIN
               Case Termobr of
                     1,2,3 : Sigma_HPmax := 2.8 * Sigma_t;
                     4,5,6 : Sigma_HPmax := 44 * H_HRcp;
                         7 : Sigma_HPmax := 3 * H_HVp
               end;
               Case Zagotowka of
                     0,1 : Yz := 1;
                       2 : Yz := 0.9;
                       3 : Yz := 0.8
               end;
               S_Fst := Yz * 1.75;
               Yx := 1.05 - 0.000125 * Da;
               Sigma_FPmax := Sigma_Fst0 * Yx / S_Fst
            END;
        BEGIN
        c1:=1.23;
 PrSigHp (Da1,Mn,N1,Mu_H,H_HBp1,H_HRcp1,H_HVp1,Ra1,trunc(Lh),Termobr1,Zw,
          Sigma_Hlimb1,Sigma_Hp1);
            N2 := N1 /U;
 PrSigHp (Da2,Mn,N2,Mu_H,H_HBp2,H_HRcp2,H_HVp2,Ra2,trunc(Lh),Termobr2,Zw,
          Sigma_Hlimb2,Sigma_Hp2);
          If Bet = 0 then Sigma_Hp:= Min3(Sigma_Hp1,Sigma_Hp2,Sigma_Hp2)
          else begin
 if 0.45*(Sigma_Hp1 + Sigma_Hp2) > c1*Min3(Sigma_Hp1,Sigma_Hp2,Sigma_Hp2)
      then Sigma_Hp := c1*Min3(Sigma_Hp1,Sigma_Hp2,Sigma_Hp2)
else Sigma_Hp := 0.45 * ( Sigma_Hp1 + Sigma_Hp2);
               end;
     PrSigFp (Da1,Mn,Mu_F(1),N1,S_f1,Y_d1,Y_g1,trunc(Lh),H_HBp1,
             Sigma_Flim01,Rewers,Termobr1,Zagotowka[1],Wikrugka[1],
             Zw,Sigma_Fp1);
     PrSigFp (Da2,Mn,Mu_F(2),N2,S_f2,Y_d2,Y_g2,trunc(Lh),H_HBp2,
             Sigma_Flim02,Rewers,
              Termobr2,Zagotowka[2],Wikrugka[2],Zw,
              Sigma_Fp2);
     PrSigMax (Sigma_t1,H_HRcp1,H_HVp1,Sigma_Fst01,Da1,Zagotowka[1],
              Termobr1,Sigma_Hpmax1,Sigma_Fpmax1);
     PrSigMax (Sigma_t2,H_HRcp2,H_HVp2,Sigma_Fst02,Da2,Zagotowka[2],
              Termobr2,Sigma_Hpmax2,Sigma_Fpmax2 );
              Sigma_Hpmax:= Min3(Sigma_Hpmax1,Sigma_Hpmax2,Sigma_Hpmax2);


        END;      { Конец   PzubC2   }

   {-----------------------------------------------------------------------}
               {процедура выбора ближайшего большего из массива}
       Procedure Wibor (a:real; b:TT1; N:byte; var Iw: byte);
          label 1;
           var I: integer;
       BEGIN
         for I:=1 to N do
          if a <= b[I] then
             begin
               Iw:=I; goto 1
             end;
       1:END;
             {   Проектировочный расчет зубчатой передачи  }
               {  с цилиндрическими зубчатыми колесами  }
     PROCEDURE PzubC3 ;
           Label 1, 2,3,4 ;
           Var AA, BB, Psi_bd, A_w, M_n,T_He2 : real;
           K_a, Ze, K_ma : integer;
                   {                                }
           BEGIN
               Psi_bd := 0.5 * Psi_ba *( u +1);
               Case Metka of
                   1 : Goto 1;
                   2 : Goto 2;
                   3 : Goto 3;
               End;
           1: If H_HBp2 < 350 then Case Nom_Sx of
                1: begin AA:=0.125;   BB:=0.425;  end;
                2: begin AA:=0.125;   BB:=0.265;  end;
                3: begin AA:=0.0293;  BB:=0.128; end;
                4: begin AA:=0.0465;  BB:=0.058; end;
                5: begin AA:=0.0435;  BB:=0.0313; end;
                6: begin AA:=0.0362;  BB:=0.0141;  end;
                7: begin AA:=0.0272;  BB:=0.0035;  end;
                8: begin AA:=0.0293;  BB:=0.128; end;
                                    end
              else Case Nom_Sx of
                1: begin AA:=0;      BB:=1.25;  end;
                2: begin AA:=0.542;  BB:=0.42;  end;
                3: begin AA:=0.106;  BB:=0.247; end;
                4: begin AA:=0.0675; BB:=0.221; end;
                5: begin AA:=0.083;  BB:=0.111; end;
                6: begin AA:=0.0869; BB:=0.0307; end;
                7: begin AA:=0.0448; BB:=0.0251; end;
                8: begin AA:=0.106;  BB:=0.247; end;
                                    end;
             K_HB:= AA*sqr(Psi_bd) + BB*Psi_bd + 1;
             if Bet = 0 then K_a := 495 else K_a:=430;
             if Nom_Sx = 8 then T_He2:= 0.5* T2 else T_He2:=T2/Zw;
             if Mn = 0 then
             begin
             Psi_ba:=0.25;//расчет коэффицента ширины венца (сам добавил){ TODO : Сам добавил }
               A_w:=T_He2*K_HB/(u*u*Psi_ba*sqr(Sigma_Hp) );
               A_w:=K_a*(u+1)*Exp(0.333*Ln(A_w));   //добавить power
               If A_w >2500 then
                          Error := 4;
               If otw1 then  begin
                      Wibor (A_w, Aws,32,IAw);
                      Aw := Aws[IAw];                End
               else Aw:=A_w;
             end;
      2 :       Case TipZ of
                 1 : K_ma := 1400;
                 2 : K_ma := 1100;
                 3 : K_ma := 850;
             End;
      if Mn = 0 then
           M_n:=K_ma*T1*(u +1)*3.5/(Aw*Psi_ba*Aw*Sigma_Fp1)
      else
           M_n:=Mn;
            If M_n > 25 then
                           Error := 5;
                 Wibor (M_n,Ms,41,IMn);
                 if IMn < 5 then IMn:=5;
                 Mn := Ms[IMn];
         3: Ze:=Round (2*Aw*Cos(Bet)/Mn);
            z1:=Round (Ze / (u+1));
            if ((Bet=0)  and (z1<13) or (Bet>0) and (z1 < 10)) then
            begin
                           Error := 3;
                           Exit;
            end;
             z2:=Round (Ze-z1);

//             if ((u-z2/z1)/u) < -0.04 then z2:=z2-1;
//             if ((u-z2/z1)/u) > 0.04 then z2:=z2+1;
//             if abs((u-z2/z1)/u) <= 0.04 then
begin
                   Uf:=z2/z1;
 //
//            if Mn*(Z1+Z2)/(2*Cos(Bet)) >= Aw then
//            begin
//              Error:=20;
//              Exit;
//            end;
                   if Bet > 0 then Bet:=ArcCos((z1+z2)*Mn/(2*Aw));
            if not otw1 then
              Aw:=0.5*(z1+z2)*Mn/Cos(Bet);
                  Dw1:=2*Aw/(Uf+1);
                  Dw2:=2*Aw - Dw1;
                  Da1:=(2+z1)*Mn/Cos(Bet);
                  Da2:=(2+z2)*Mn/Cos(Bet);
                  B2:= Round (Psi_ba * Aw );
            if (TipZ = 3) and (Kanavka = 1) then
            begin
              if Round(Mn) < 2 then
                Bk:=15
              else if Round(Mn) in [2..5] then
                Bk:=17-Mn
              else
                Bk:=10;
              Bk:=Round(Bk*Mn);
              B2:=B2+Bk;
            end;
                  If TipZ = 1 then
                    if Mn < 16 then
                      B1:=B2+5
                    else
                      B1:= Round(B2 + 0.3*Mn)
                  else
                    B1:= B2;
                                                End;
      4:   END;  {    Конец PzubC3    }
            {---------------------------------------------------------}
            {             Расчет коэффициентов смещения   Х1 и Х2     }
       PROCEDURE PzubC4;
            {                                                        }
               var Alfaa0,Alfatw0,InwAtw,invAtw0,inwAt,xx1,xx2: real;
                   Alfaat1:Array [1..2] of real;
                s:array[1..8] of byte;
                sa: array [1..2] of real;
                xx:Array [1..2] of real;
                k : byte;
                cm : real;
                f: real;
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

      {========Проверка осуществимости передачи=============================}
        Function Ppe2:boolean;
                Var hg,xsmin,vaat,beta, Alfat,vat, dely,x1min,
                    x2min, Epsia, Epsias :real;
                    i : byte;
                    H_HBp:array [1..2] of integer;
                    d, da,db:array[1..2] of real;
      {========Определение радиуса кривизны переходной поверхности=========}
  Procedure Ppe6;
            Var v0,d,xmind,t, vat :real;
                m: real;
            Begin
              M:=Mn;
              if motw[i]=0 Then Begin
                 z0[i]:=0; da0[i]:=0; x0[i]:=0; db0[i]:=0;
                 d:=m*z[i]/Cos(bet);
                rol[i]:=0.5*d*Sin(alfat)/Cos(bet)-(1-xx[i])*m/Sin(alfat);
                 xmin[i]:=1-0.5*z[i]*Sqr(Sin(alfat))/Cos(bet);
                                             End;
               if motw[i] in [1,2] then Begin
                 vat := Tan(Alfat) - Alfat;
                 v0:=(xx[i]+x0[i])*0.728/(z[i]+z0[i])+vat;
                 Involuta(v0,alfatw0);
                 alfaa0:=ArcCos(m*z0[i]*0.9397/(da0[i]*Cos(bet)));
                 aw0:=(z[i]+z0[i])*m*Cos(alfat)/(2*Cos(bet)*Cos(alfatw0));
                rol[i]:=aw0*Sin(alfatw0)-0.5*Sqrt(Sqr(da0[i])-Sqr(db0[i]));
                 t:=z0[i]*Tan(alfaa0)/(z[i]+z0[i]);
                 xmin[i]:=(t-ArcTan(t)-vat)*(z[i]+z0[i])/0.728-x0[i];
                    End;
              Roa[i]:=0.5*Sqrt(da[i]*da[i]-db[i]*db[i]);
           End;

                Begin
                    Alfat:=ArcTan(0.364/Cos(bet));
                  vat:=Tan(alfat)-Alfat;
                  Betb:=ArcSin(0.9397*Sin(bet));
                  hg:=0.45;
                  if xs = 0 then
                    dely:=0
                  else
                    dely:=xs-(aw-a)/Mn;
                  xx[1]:=x1; xx[2]:=x2; z[1]:=z1; z[2]:=z2;
                  H_HBp[1] := H_HBp1;
                  H_HBp[2] := H_HBp2;
                  {проверка величины к-та суммарного смещения}
                 xsmin:=-vat*(z1+z2)/0.728;
                if xs-xsmin < 0 Then Begin Ppe2:=False; Exit; End;
            For i:=1 To 2 Do Begin
                    {проверка заострения зуба на диаметре вершин}
               d[i]:= Mn*z[i]/Cos(bet);
               da[i]:=d[i]+2*Mn*(ha+xx[i]-dely);
               beta:=ArcTan(da[i]*Tan(bet)/d[i]);
               db[i]:=d[i]*Cos(alfat);
             if da[i] < db[i] Then Begin Ppe2:=False; Exit; End;
              alfaat1[i]:=ArcCos(db[i]/da[i]);
              vaat:=Tan(alfaat1[i])-alfaat1[i];
              sa[i]:=da[i]*((Pi/2+0.728*xx[i])/z[i]+vat-vaat)/Mn*Cos(beta);
            if H_HBp[i] < 350 Then Begin
              if sa[i] < 0.4 Then Begin Ppe2:=False; Exit; End;
                                   End
            Else
              if sa[i] < 0.25 Then Begin Ppe2:=False; Exit; End;
                     {проверка подрезания ножки зуба}
              Ppe6;
             if xx[i]-xmin[i] < 0 Then Begin Ppe2:=False; Exit; End;
                     {проверка соотношения da и db}
             if (da[i]-db[i])/(2*Mn) < 0 Then Begin Ppe2:=False; Exit; End;
          {проверка черезмерного срезания головки зуба ножкой  долбяка}
            if z0[i] <> 0 Then  Begin
               Beta:=ArcTan(da[i]*Sin(bet)/(d[i]*Cos(bet)));
      if (Sqrt(Sqr(db[i]) + Sqr(2*aw0*Sin(alfatw0)))+hg*Mn/Cos(beta)-da[i])
          < 0 Then Begin Ppe2:=False; Exit; End;
                                End;
                End;
                {Проверка к-та перекрытия}
  epsia:=(z1*(Tan(alfaat1[1])-Tan(alfatw))+z2*(Tan(alfaat1[2])-Tan(alfatw)))
   /(2*Pi);
          epsias:=epsia;
           if bet > 0 Then
             case TipZ of
               1: epsias:=epsia+bw*Sin(bet)/Pi/Mn;
               2,3: epsias:=epsia+0.5*bw*Sin(bet)/Pi/Mn;
             end;
           if epsia < 1.2 Then Begin Ppe2:=False; Exit; End;
                       {проверка интерференции}
          rop[1]:=aw*Sin(alfatw)-0.5*Sqrt(da[2]*da[2]-db[2]*db[2]);
          rop[2]:=aw*Sin(alfatw)-0.5*Sqrt(da[1]*da[1]-db[1]*db[1]);
         if rop[1]-rol[1] < 0 Then Begin Ppe2:=False; Exit; End;
         if rop[2]-rol[2] < 0 Then Begin Ppe2:=False; Exit; End;
          x1min:=xmin[1];
          x2min:=xmin[2];
                    {удельное скольжение}
          tet2:=Tan(alfatw);
tet1:=-(z2/z1+1)*(Tan(alfaat1[2])-tet2)/(tet2-z2*(Tan(alfaat1[1])-tet2)/z1);
tet2:=-(z2/z1+1)*(Tan(alfaat1[1])-tet2)/(z2*tet2/z1-(Tan(alfaat1[1])-tet2));
 End;

{==================Расчет обобщенного критерия оптимизации====================}
     Procedure Ppe14;
             Var cr:array [1..3] of real;
                j:integer;
                   {------------------------------}
             Begin
                s[1]:=1;
                s[2]:=1;
                s[3]:=1;
                cr[1]:=-epsias;
                cr[2]:=abs(3.47+13.2/Z1*exp(3*ln(cos(bet)))-
                  Sigma_Flim01/Sigma_Flim02*
                  (3.47+13.2/Z2*exp(3*ln(cos(bet)))));
                cr[3]:=Abs(tet2-tet1);

                f:=0;
             For j:=1 To 3 Do f:=f+s[j]*cr[j];
            End;
                {------------------------------------------------------}
            BEGIN
                Bw:=B2;
                Alfat:= ArcTan(0.364 /Cos(Bet));
                if Bet=0 then Zmin:=17
                else Zmin:= Round (2*cos(Bet)/sqr(sin(alfat)));
                AlfatW:=Alfat;
                  { Проверка межосевого расстояния  }
                A:= Mn*(z1+z2)/(2*Cos(Bet));
     {1}     if not (abs(Aw-A) > 1.0E-5) then begin
                     {      Проверка подрезания         }
     {2}          If z1 < Zmin then Begin
                      If motw[1]=0 then begin
                       if Bet=0 then x1min:=1-z1*sqr(0.342)/2
                       else x1min:=1-z1*sqr(sin(Alfat))/(2*cos(Bet));
                                                             end;
                    If motw[1] in [1..2] then begin
                 Alfaa0:=ArcCos(Mn*z[1]/cos(Bet)*0.9397/(Da0[1]*cos(Bet)));
                 AlfatW0:=ArcTan(z0[1]*Tan(Alfaa0)/(z1*(1+z0[1]/z1)));
                 invAtw0:=Tan(Alfatw0)-Alfatw0;
                 inwAt:=Tan(Alfat)-Alfat;
                 x1min:=( invAtw0 - inwAt)*(z1 - z0[1])/0.728;
                                                              end;
                 x1:= x1min;
                 x2:=-x1;
                 Xs:=0;
                 Alfatw:=Alfat;
                  if not PPe2 then
                            Error := 6;
     {2}                             end
     {3}          else begin
                     x1:=0;
                     x2:=0;
                     Alfatw := Alfat;
     {3}               end;
     {1}         end
     {4}         Else begin
                     if A < Aw*1.024 then begin
                         Alfatw:=ArcCos(0.5*Mn*(z1+z2)*cos(Alfat)/
                                       (Aw * Cos(Bet)));
                         inwAtw:=Tan(Alfatw)-Alfatw;
                         inwAt:=Tan(Alfat)-Alfat;
                         Xs:=(inwAtw-inwAt)*(z1+z2)/0.728;
                                          end;
                    x1:=-1;
                    xx1:=-2;
                    Cm:=1E10;
              For k:=1 to 101 Do BEGIN
                    x2:=Xs-x1;
                    if PPe2 then begin
                       PPe14;
                       if xx1=-2 then begin
                          xx1:=x1;
                          xx2:=x2;
                          Cm:=f;
                                      end;
                      if cm > f then begin
                              xx1:=x1;
                              xx2:=x2;
                              Cm:=f;
                                      end;
                              end;
                    x1:=x1 + 0.03;
               End;
                   if xx1 >-2 then begin
                      x1:=xx1;
                      x2:=xx2;
                      f:=Cm;
                                   end;
    {4}               END;
         END;    {     Конец PzubC4      }
       {--------------------------------------------------------------}

{-------------------------- РАСЧЕТ НАПРЯЖЕНИЙ В ЗУБЬЯХ----------------------}
     PROCEDURE PzubC5;

          Type TT1=array[1..5,1..7] of real;
          Var C_prim,  f_pb, K_Hv, K_Hbeta, K_Halfa, g0,
              Epsia1, Epsia2,Z_v1,Z_v2, n_alfa, n_beta, y_alfa : real;
              Ft: real;

{------------------процедура расчета контактных напряжений-------------------}
       Procedure PrSigH ;
           Label 1,2,3,4,5;
           Const
       f_pb_6:TT1 = ((9.5,10,12,13,15,0,0),
                     (12,13,13,15,17,19,0),
                     (13,15,17,17,19,21,24),
                     (0,17,19,19,21,24,25),
                     (0, 0, 0, 0, 0, 0, 0));

       f_pb_7:TT1 = ((13,15,17,19,21, 0, 0),
                     (17,19,19,21,24,26, 0),
                     (19,21,24,24,26,30,34),
                     (0, 24,26,26,30,34,38),
                     (0, 30,34,34,38,38,42));

       f_pb_8:TT1 = ((19,21,21,26,30, 0, 0),
                     (24,26,26,30,34,38, 0),
                     (26,30,34,34,38,42,48),
                     (0, 34,38,38,42,48,53),
                     (0, 42,48,48,53,53,60));

       f_pb_9:TT1 = ((26,30,34,38,42, 0, 0),
                     (34,38,38,42,48,53, 0),
                     (38,42,45,48,53,60,67),
                     (0, 48,53,53,60,67,75),
                     (0, 60,67,67,75,75,85));

       f_pb_g:array[1..7] of integer = (125,480,800,1000,2000,4000,8000);

       f_pb_v:array[1..5] of real = (3.55,6.3,10,16,25);

       F_betm:array[1..4,1..6] of integer = ((9,12,16,20,25,28),
                                             (11,16,20,25,28,32),
                                             (18,25,32,40,45,56),
                                             (28,40,50,63,71,90));

        F_beta_g:array[1..6] of integer = (40,100,160,200,400,630);

       Var Delta_H, W_Hv, F_beta, a_beta, f_ky, f_kz, K_Hw, Y_a,
           f_pb_1, f_pb_2, a_alfa,  K_H, Z_eps, Z_H, Sigma_H0,
            Alfaa1, Alfaa2, Gamma_sig, Bwl, eps_betbet, y_betb,
            y_alfa1, y_alfa2, y_alfamax,  betb,
            psi_lm, l_k, K_epsi, epsilon,  a_n,
            K_epsbet: real;
           I,I1,I_pb_v,I_pb_g: byte;
           M: real;

       BEGIN
       {расчет K_Hv}
        if betg = 0 Then Begin Z_v1:=z1; Z_v2:=z2; End
                    Else Begin Z_v1:=Z1/Exp(3*Ln(Cos(bet)));
                               Z_v2:=Z2/Exp(3*Ln(Cos(bet)));
                         End;
        d1:=z1*Mn/Cos(Bet);
        d2:=z2*Mn/Cos(Bet);
        bw:=B2;
        Ft:=2000*T1/(d1*Zw);
        if Nom_Sx = 8 then
          Ft:=Ft/2;
        V:=pi*d1*n1/60000;
        if Bet=0 then begin
             if V < 2 then St:= 9 else
                 if V < 6 then St:= 8 else
                    if V < 10 then St:= 7
                    else St:=6;
                       end;
         if Bet>0 then begin
                 if V < 10 then St:= 8 else
                    if V < 16 then St:= 7
                    else St:=6;
                       end;
        M:=mn;
        case St of
         6: if m<=3.55 then g0:=3.8 else if m<=10 then g0:=4.2 else g0:=4.8;
         7: if m<=3.55 then g0:=4.7 else if m<=10 then g0:=5.3 else g0:=6.4;
         8: if m<=3.55 then g0:=5.6 else if m<=10 then g0:=6.1 else g0:=7.3;
         9: if m<=3.55 then g0:=7.3 else if m<=10 then g0:=8.2 else g0:=10
        end;
       if (H_HVp1>350) and (H_HVp2>350) then
            if Betg=0 then Delta_H:=0.14
            else Delta_H:=0.04
       else if Betg=0 then Delta_H:=0.06
            else Delta_H:=0.02;
       W_Hv:=Delta_H*g0*V*sqrt(aw/u);
       K_Hv:=1+W_Hv*bw/(Ft*Ka);
                         {    расчет K_Halfa     }
         for i:=1 to 7 do
            if d1<=f_pb_g[i] then begin
                I_pb_v:=i; goto 2 end;
      2: for i:=1 to 5 do
         if Mn<=f_pb_v[i] then
         begin
         I_pb_g:=i; goto 3 end;
      3: case St of
          6: f_pb_1:=f_pb_6[I_pb_g,I_pb_v];
          7: f_pb_1:=f_pb_7[I_pb_g,I_pb_v];
          8: f_pb_1:=f_pb_8[I_pb_g,I_pb_v];
          9: f_pb_1:=f_pb_9[I_pb_g,I_pb_v];
         end;
         for i:=1 to 7 do
         if d2 <= f_pb_g[i] then
         begin
         I_pb_v:=i; goto 4 end;
       4:case St of
          6: f_pb_2:=f_pb_6[I_pb_g,I_pb_v];
          7: f_pb_2:=f_pb_7[I_pb_g,I_pb_v];
          8: f_pb_2:=f_pb_8[I_pb_g,I_pb_v];
          9: f_pb_2:=f_pb_9[I_pb_g,I_pb_v];
         end;
        if (H_HVp1>350) and (H_HVp2>350) then a_alfa:=0.3 else a_alfa:=0.2;
         f_pb:=a_alfa*sqrt(sqr(f_pb_1)+sqr(f_pb_2));
         Alfaa1:=ArcCos(Mn*z1/Cos(Bet)*Cos(Alfat)/Da1);
         Alfaa2:=ArcCos(Mn*z2/Cos(Bet)*Cos(Alfat)/Da2);
         Epsia1:=z1*(Tan(Alfaa1)-Tan(Alfatw))/(2*Pi);
         Epsia2:=z2*(Tan(Alfaa2)-Tan(Alfatw))/(2*Pi);
         Epsia:= Epsia1 + Epsia2;
         case TipZ of
           1: Eps_bet:=0;
           2: Eps_bet:=B2*Sin(bet)/(Pi*Mn);
           3: Eps_bet:=0.5*B2*Sin(bet)/(Pi*Mn);
         end;
         EpsIas:=Epsia + Eps_Bet;
         if Bet > 0 then begin
             if Eps_bet <1 then
                 Z_eps:=sqrt((4-epsia)*(1-Eps_bet)/3+Eps_bet/(epsia))
             else Z_eps:=sqrt(1/epsia);
                         end
          else  Z_eps:=Sqrt((4-epsia)/3);
 C_prim:=1/(0.05139+0.1425/Z_v1+0.186/Z_v2-0.1027*X1/Z_v1-0.01*x1+0.00455*X2+
  0.3762*X2/Z_v2+0.00734*sqr(X1)-0.00054*sqr(X2));

         if Betg=0 then K_Halfa:=1
         else begin
           n_alfa := frac(Epsia);
           n_beta := frac(Eps_bet);
             if H_HVp1>350  then begin
                        Y_alfa1:=0.075*f_pb;
                        if Y_alfa1 > 3 then Y_alfa1 := 3;
                             end
         else begin
              Y_alfa1 := 160*f_pb / Sigma_Hlimb1;
              if v >= 5 then Y_alfamax := 12800 / Sigma_Hlimb1;
              if v >= 10 then Y_alfamax := 6400 / Sigma_Hlimb1;
              if v >= 5 then
                 if Y_alfa1 > Y_alfamax then Y_alfa1 := Y_alfamax;
              end;
         if H_HVp2>350  then begin
                         Y_alfa2:=0.075*f_pb;
                         if Y_alfa2 > 3 then Y_alfa2 := 3;
                             end
         else begin
              Y_alfa2 := 160*f_pb / Sigma_Hlimb2;
              if v >= 5 then Y_alfamax := 12800 / Sigma_Hlimb2;
              if v >= 10 then Y_alfamax := 6400 / Sigma_Hlimb2;
              if v >= 5 then
                 if Y_alfa2 > Y_alfamax then Y_alfa2 := Y_alfamax;
              end;
         Y_alfa := (Y_alfa1 + Y_alfa2 ) / 2;
         if Eps_Bet = 0 then
         begin
           Error:=20;
           Exit;
         end
         else if (n_alfa + n_beta) <= 1 then
                  K_epsi:= 1- n_alfa*n_beta/(Epsia*Eps_bet)
             else K_epsi := 1 - (1 -n_alfa)*(1 - n_beta)/(Epsia*Eps_bet);
           if Eps_bet <= Epsia then
 K_Halfa:=(0.9+Cos(Alfat)*Cos(bet)*C_prim*bw*(f_pb- y_alfa)/
 (Ft*Ka*K_Hv)*(K_epsi*Epsia-1))/(K_epsi*Epsia)
          else
  K_Halfa:=(0.9+Cos(Alfat)*Cos(bet)*C_prim*bw*(f_pb-y_alfa)/(Ft*Ka*K_Hv)*
(Epsia-Epsia/Eps_bet))/Eps_bet;
              End;
          If K_Halfa > 1 then K_Halfa := 1;
                     {--------------------------}
                      {    расчет K_Hbeta        }
         K_Hbeta:=K_HB;
         K_H:=K_Hv*K_Hbeta*K_Halfa*Ka;
         Betb:=ArcSin(Sin(bet)*Cos(20*Pi/180));
         Z_H:=1/cos(Alfat)*sqrt(2*cos(Betb)/tan(Alfatw));
         if Nom_Sx < 8 then
           Sigma_H0:=190*Z_H*Z_eps*sqrt(2000*T1*(U+1)/(bw*sqr(d1)*Uf*Zw))
         else
           Sigma_H0:=190*Z_H*Z_eps*sqrt(1000*T1*(U+1)/(bw*sqr(d1)*Uf*Zw));
         Sigma_H:=Sigma_H0*sqrt(K_H) ;
         Sigma_Hmax:=Sigma_H*Sqrt(Loading.X);

         {конец процедуры расчета контактных напряжений}
    END;
{------------------ Расчет изгибных напряжений -----------------------------}
   Procedure PrSigF( z :integer; x: real; var Sigma_F,Sigma_Fmax:real);

         Var Y_epsilon,Y_beta,Y_Fs,K_Falfa,K_Fbeta,Delta_F,W_Fv,
             K_epsbet, K_F,K_Fv, Z_v,l_k,Psi_lm,H :real;
     BEGIN
         bw:=B2;
        if Betg=0 then Y_epsilon:=1
        else if Eps_bet<1 then Y_epsilon:=0.2+0.8/epsia
             else Y_epsilon:=1/epsia;
        Y_beta:=1-Eps_bet*Betg/120;
            {учесть разницу градусов и радиан}
       if Y_beta<0.7 then Y_beta:=0.7;
       Z_v:=z/Exp(3*Ln(Cos(Bet)));
       Y_Fs:=3.47+13.2/Z_v-29.7*X/Z_v+0.092*sqr(X);
                   {--------------------}
      if Betg=0 then K_Falfa:=1
      else begin
            n_alfa := Frac(Epsia);
            n_beta := Frac(Eps_bet);
           if Eps_bet <= Epsia then begin
               if Eps_Bet = 0 then
               begin
                 Error:=20;
                 Exit;
               end
               else if n_alfa < n_beta then
                    K_epsbet:= ( n_alfa- n_alfa*n_beta)/Eps_bet
               else K_epsbet:= ( n_beta- n_alfa*n_beta)/Eps_bet;
 K_Falfa:=(0.9+Cos(Alfat)*Cos(bet)*C_prim*bw*(f_pb-y_alfa)/(Ft*Ka*K_Hv)*
 (Epsia -1+K_epsbet))/(Epsia + K_epsbet);
                                   End
           else  K_Falfa:=K_Halfa;
           if K_Falfa > 1 then
             K_Falfa:=1;
           End;
                    {---------------------}
  H:=2*Mn;
  if Bet = 0 then
    H:=H/Epsia;
  K_Fbeta:=Exp(Sqr(Bw/H)/(Sqr(Bw/H)+Bw/H+1)*Ln(K_Hbeta));
                     {-----------------------}
    if Betg=0 then Delta_F:=0.16 else Delta_F:=0.06;
    W_Fv:=Delta_F*g0*v*sqrt(Aw/Uf);
    K_Fv:=1+W_Fv*bw/(Ft*Ka);
                    {-------------------------}
    K_F:=Ka*K_Fv*K_Fbeta*K_Falfa;
    append(f1);

          Writeln(F1,'Ft =', Ft );
         Writeln(F1,'K_F =', K_F );
         Writeln(F1,'Y_Fs =', Y_Fs );
         Writeln(F1,'Y_beta =', Y_beta );
         Writeln(F1,'Y_epsilon =', Y_epsilon );
           Writeln(F1,'bw =', bw );
         Writeln(F1,'Mn =', Mn );
            Writeln(F1, '_________________________');
   CloseFile(F1);
    Sigma_F:=Ft*K_F*Y_Fs*Y_beta*Y_epsilon/(bw*Mn);
    Sigma_Fmax:=Sigma_F*Ka;
   END;

     {---------------------------------------------------------------}
       Begin
          PrSigH;
          PrSigF(Z1,x1, Sigma_F1,Sigma_Fmax1);
          PrSigF(Z2,x2, Sigma_F2,Sigma_Fmax2);
  END;
      {----------------------------------------------------------------}
                  { Расчет размеров колес и передачи  }
      PROCEDURE PzubC6;
           Var invAlfatw0 : real;
           dely : real;
           i: byte;
         BEGIN
            Alfat:= ArcTan(0.364/Cos(Bet));
            d1:=Mn*z1/Cos(Bet);
            d2:=Mn*z2/Cos(Bet);

            dw1:=2*Aw/(uf+1);
            dw2:=2*Aw-dw1;
            A:=0.5*(d1+d2);
            if x1+x2 = 0 then
              dely:=0
            else
              dely:=(x1+x2)-(Aw-A)/Mn;
            da1:= d1+2*Mn*(1+x1-dely);
            da2:= d2+2*Mn*(1+x2-dely);
            db1:=d1*Cos(Alfat);
            db2:=d2*Cos(Alfat);
            x[1]:=x1;
            x[2]:=x2;
            z[1]:=z1;
            z[2]:=z2;
          For i:=1 to 2 Do begin
             If motw[i]=0 then begin
                df1:=d1-2*Mn*(1 + c_- x1);
                df2:=d2-2*Mn*(1 + c_- x2);
                                                      End
             else begin
               invAlfatw0:=(x[i]+x0[i])/(z[i]+z0[i])*0.728+(0.364-20*Pi/180);
               Involuta(invAlfatw0,Alfatw0);
               Aw0:=Mn*(z[i]+z0[i])/2*Cos(Alfat)/(Cos(Alfatw0)*Cos(Bet));
               df1:=2*Aw0-Da0[1];
               df2:=2*Aw0-Da0[2];
                   End;
           end;
       END;       {  Конец PzubC6  }

        {          Расчет усилий в зацеплении               }
      PROCEDURE PzubC8;
          BEGIN

                   Ft1:= 2*T2*1000 / (Dw2*Zw);
                   if Nom_Sx = 8 then
                     Ft1:=Ft1/2;
                   Ft2:= Ft1;
                   Fr1:= Ft2*Tan(Alfat);
                   Fr2:= Fr1;
                   Fx1:= Ft2*Tan(Bet);
                   Fv:= sqrt(sqr(Ft1)+sqr(Fr1));
                   Fx2 :=Fx1;

          END;    {     Конец    PzubC8     }
      {------------------------------------------------------------------}
               {-------------------------------------}
          BEGIN
           AssignFile(f1, 'F:\dddd');
           Rewrite(f1);
             {    Парметры исходного контура       }
              Ha:=1;
              H_l:=2;
              Ro_f:=0.38;
              Alfa:=Pi*20/180;
       {---------------------------------------------------------------}
             TipZp:=1;
             if Wikrugka[1] = 0 then
               Y_g1:=1;
             if Wikrugka[2] = 0 then
               Y_g2:=1;
             Bet := Betg*Pi/180;
             if Mn <> 0 then
               Z1:=Round(2*Aw*Cos(Bet)/(Mn*(U+1)));
                   {-------------------------------------------}

           T1:=P1*30*1000 /(Pi*N1);
           T2:= T1 * U;
                  {  Расчет допускаемых напряжений   }
               Da1:=0;
               Da2:=0;
               Metka:=1;
          PZUBC2;
                    {     Проектный расчет передачи     }
         1:    PzubC3;
         if Error <> 0 then
           Exit;
                    {  Выбор коэффициентов Х1 и Х2  }
          2: PzubC4;
                   {  Расчет фактических напряжений  }
          3: PzubC5;
                   {  Уточнение допускаемых напряжений  }
             PzubC2;
       {  Проверка условия: допускаемое напряжение больше фактического  }
                   {  Проверка по контактным напряжениям  }
       if Error <> 0 then
         Exit;
          if Sigma_H > (1.03*Sigma_Hp) then begin
            if not otw1 then
                 Aw:=Aw*Exp(0.666*Ln(Sigma_H/Sigma_Hp));
            if otw1 then begin
                 Inc(IAw);
                 Aw:=Aws[IAw];
                                               end;
             Metka:=2;
             Goto 1;
                                      End;
            {---------------------------------------}
          if Sigma_Hmax > Sigma_Hpmax then begin
            if not otw1 then
                Aw:=Aw*Exp(0.666*Ln(Sigma_Hmax/Sigma_Hpmax));
            if otw1 then begin
                 IAw:=IAw+1;
                 Aw:=Aws[IAw];
                                               end;
             Metka:=2;
             Goto 1;
                                            End;
                         {----------------------------}
                   {  Проверка по изгибным напряжениям   }
          If ((Sigma_F1 > Sigma_Fp1) or (Sigma_F2 > Sigma_Fp2)) then
            Begin
                IMn:=IMn+1;
                Mn:=Ms[IMn];
                Metka:= 3;
                Goto 1;
             End;
       If ((Sigma_Fmax1 > Sigma_Fpmax1) or (Sigma_Fmax2 > Sigma_Fpmax2)) then
            Begin
                IMn:=IMn+1;
                Mn:=Ms[IMn];
                Metka:= 3;
                Goto 1;
             End;
                      {  Расчет усилий   }
             PzubC8;
             Fv:=sqrt(Ft1*Ft1 + Fr1*Fr1);
                      {  Расчет размеров }
             PzubC6;
                      {  Расчет массы колес  }
                dv2:= Exp(0.333*Ln(T2/5))*10;
        Massa1:=Pi*0.25*(dw1*dw1*B1+0.54*Zw*B2*(dw2*dw2+dv2*dv2))*1.0E-6*7.81;
        Massa2:=Pi*0.25*(dw1*dw1*B1+Zw*B2*(dw2*dw2-dv2*dv2))*1.0E-6*7.81;
        if Nom_Sx = 8 then
        begin
          Massa1:=2*Massa1;
          Massa2:=2*Massa2;
        end
        else if Nom_Sx = 4 then
        begin
          Massa1:=Pi*0.25*(dw1*dw1*Zw*B1+0.54*B2*(dw2*dw2+dv2*dv2))*1.0E-6*7.81;
          Massa2:=Pi*0.25*(dw1*dw1*Zw*B1+B2*(dw2*dw2-dv2*dv2))*1.0E-6*7.81;
        end;
                Massa:= Min3(Massa1,Massa2,Massa2);
                   {  Расчет объёма, занимаемого передачей}
        V_p:= B1*(Pi/8*(sqr(d1)+sqr(d2)) + (d1+d2)/2*aw)*1E-6;
  7: END;    {  Конец процедуры  ExpanData      }
END.
