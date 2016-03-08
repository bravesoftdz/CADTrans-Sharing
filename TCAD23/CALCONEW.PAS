{$O+}
Unit
  CalConeWheel;

INTERFACE
Type
    TLoading = record
      GraphBar: word;
      x, y, z, i, j, k, m: real;
    end;
    TSteelMark = string[23];
    TTwoWord = array [1..2] of word;

PROCEDURE CalculateConeWheel(
    Loading:TLoading;
    P1,               {Мощность, передаваемая быстроходным валом}
    n1,               {Частота вращения быстроходного вала}
    U:real;           {Передаточное число передачи}
    DeltaU: byte;
    Lh:longint;          {Расчетный ресурс передачи}
    Tipz:word;        {тип зубьев колес: 1 - прямые
                                         2 - косые
                                         0 - автовыбор}

    Napr_Vr,
    TipOpor: boolean;
    Forma: byte;
    mc1:TSteelMark;   {марка стали для шестерни}   {????????????????}
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
    Nom_sx: word;     {Номер схемы расположения колес}
    Nagr,             {=1 для типового режима,
                       = 0 для циклограммы}
    rewers:boolean;   {При реверсировании = 1;
                       без реверсирования = 0}
    Ka:real;          {Коэффициент внешней динамики}
    otw1:boolean;     {При стандартном межосевом расстоянии = 'Y',
                       при нестандартном межосевом расстоянии ='n'}
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
    Sigma_t1,         {Предел текучести материала шестерни}
    Sigma_t2,         {Предел текучести материала колеса}
    Sigma_Flim01,     {Предел выносливости по изгибу для шестерни}
    Sigma_Flim02,     {Предел выносливости по изгибу для колеса}
    Sigma_Fst01,      {Предельное напряжение для шестерни}
    Sigma_Fst02: real; {Предельное напряжение для колеса}
    {-------------------------------------------------------------------}
{--------------------- Критерии качества ---------------------------------}
    Var
    Massa,                   {Суммарная масса зубчатых колес}
    V_p,                     {Объём занимаемый передачей}
    Re,
    Fv,
    Dae2,
{-------------------------------------------------------------------------}
    Mn,                   {Модуль нормальный в среднем сечении}
    Mte,                  {Модуль торцевой на внешнем торце}
    Me,                   {Модуль торцевой на внешнем торце}
    Betn,                 {Нормальный угол наклона в
                            среднем сечении в радианах}
    Xtau1,
    Xtau2,                {Коэффициенты тангенциального смещения}
    x1,
    x2,                    {Коэффициент смещения исходного контура
                                для прямозубых колес}
    xn1,
    xn2:real;            {Коэффициент смещения исходного контура
                                в нормальном сечении для колес с круговым
                                зубом}
    Var
    z1, z2 : byte;             {Числа зубьев}
    Var
    St : integer;              {Степень точности}
    Var
    Uf,                      {Фактическое передаточное число передачи}
    n2,               {Частота вращения колеса}
    V,                 { Скорость, м/с}
    de1,                       {Диаметр делителбного конуса шестерни}
    Dae1,                      {Диаметр окружности вершин }
    Dfe1,                      {Диаметр окружности впадин шестерни}
    d1,                        {Средний делительный диаметр шестерни}
    Delta1,                    {Угол делительного конуса шестерни}
    Delta_A1,                   {Угол конуса вершин шестерни}
    Delta_F1,                   {Угол конуса впадин шестерни}
    Sce1,                       {Врешняя постоянная хорда}
    Hce1,                        {Измерительная высота}
    de2,                       {Диаметр делительного конуса колеса}
    Dfe2,                      {Диаметр окружности впадин колеса}
    d2,                   {Средний делительный диаметр колеса}
    Delta2,                    {Угол делительного конуса колеса}
    Delta_A2,                   {Угол конуса вершин колеса}
    Delta_F2,             {Угол конуса впадин колеса}
    Sce2,                       {Врешняя постоянная хорда}
    Hce2,                       {Измерительная высота}
    Rs,                         {Среднее конусное расстояние по делительному
                                конусу}
    B,                         {Ширина венца}
    b1,                        {Расстояние от вершины конуса до базовой поверхности}
    b2,
    H_e1,                  {Высота зуба на внешнем торце}
    H_e2,                  {Высота зуба на внешнем торце}
    d0,                 {Диаметр резцовой головки}
    Sigma_H,                  {Контактное напряжение }
    T1,                     {Момент, передаваемый быстроходным валом}
    T2,                     {Момент, передаваемый тихоходным валом}
    Ft1,                      { Окружное усилие   }
    Fr1,                      {Радиальное усилие}
    Fx1,                      {Осевое усилие  }
    Ft2,                      { Окружное усилие}
    Fr2,                      { Радиальное усилие}
    Fx2,                      { Осевое усилие}
    Epsias: real;
    Var Error: byte);

IMPLEMENTATION
Uses
  Math;

PROCEDURE CalculateConeWheel;

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
  if not (Termobr > 2) then
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

           Label 1, 2, 3 ;
           Type Tt1=Array [1..45] of real;
           Var  Iz, Metka,Zw   : byte;
                dv2, Massa1, Massa2, k, KFtr, de2r,
                Epsia1, Epsia2, X : real;
                z2min, Z1min : integer;
                Nu_H, Nu_F, K_HAlfa, Dm1, Da1, Da2 :real;
                S_e1, H_Ae1, H_A1, H_Fe1, H_Fi1, Ha1,
                Tet_A1, Tet_H, Tet_F, S_ae1,
                Se_1, Hae_1, Alfat : real;
              H_Femax : Array[1..2] of real;
               Dm2:real;
              Sn1, Sn2, S_ae2,  Se_2, S_e2, H_Ae2,
              H_A2, H_Fe2, H_Fi2, Ha2, Tet_A2, Se_y2, dey2,
              hae_y2, dy2, Sn_y2, Ha_y2, Hae_2 : real;
              K_HB, K_Hbeta, K_Fbeta, Tet, Kbe, Zc : real;
              Id0,  ISna, Ixx, Ide2, IEpsia : byte;
              W2, delta_hf, Betn_e, Betn_i,  Epsi_Bet,
              Epsi_Sum : real;
              x1min, x2min, Xmax, tet1, tet2, Sna1, Sna2, Rol1,
              Rol2, Rop1, Rop2 : real;
              Sigma_Hmax, Sigma_Hpmax, Sigma_Fmax1, Sigma_Fpmax1,
              Sigma_Fmax2, Sigma_Fpmax2,Sigma_Hpmax1, Sigma_Hpmax2,
              Sigma_Hp1, Sigma_Hp2, Sigma_Hp,
              Sigma_F1, Sigma_Fp1, Sigma_F2, Sigma_Fp2,
              q_f,H_HBp, Sigma_Flim0   : real; IMn, IDe: byte;
              S_Ae : Array [1..2] of real;
              Sn_a : Array [1..2] of real;
              Kgam : Array [1..2] of real;
                     {  Параметры исходного контура  }
              Ha,
              c_,
              H_l,
              Ro_f,
              Alfa : real;
              NaprZub1: byte;

              {                                     }
                Const
    ms: tt1 = ( 1.0, 1.125, 1.25, 1.375, 1.5, 1.75, 2.0,
                2.25,  2.5, 2.75, 3.0, 3.5, 4.0, 4.5, 5.0,
                5.5, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0,
                14.0, 16.0, 18.0, 20.0, 22.0, 25.0, 28.0,
                32.0, 36.0, 40.0, 45.0, 50.0, 55.0, 60.0,
                70.0, 80.0, 90.0, 100.0, 0, 0, 0, 0 );

    TArrayDe : tt1 = ( 50, 56, 63, 71, 80, 90, 100, 112, 125, 140, 160,
                  180, 200, 225, 250, 280, 315, 355, 400, 450, 500, 560,
                  630, 710, 800, 900, 1000, 1120, 1250, 1400,
                 1600, 1800, 2000, 2240, 2500, 0, 0, 0, 0, 0, 0,
                 0, 0, 0, 0);
                   {  Массив стандартных значений разводов резцов   }
   Const
    TArrayW : tt1 = (0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.3, 1.4, 1.6,
                        1.8, 2.0, 2.2, 2.6, 2.8, 3.2,3.6, 4.0, 4.5, 5.2,
                        6.0, 6.5, 7, 8, 9, 10, 12, 13, 14, 16, 18, 0,
                        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    CONST
           { Массив значений разводов резцов резцовой головки }
    TArrayW2 : Array[1..25,1..8] of real =
          ((1.5,  0,  1,   0.010, 0,    0,   0,    0  ),
           (1.75, 0,  1.1, 0.077, 0,    0,   0,    0  ),
           (2.0,  0,  1.3, 0.030, 0.04, 1.4, 0.14, 1.6 ),
           (2.25, 0,  1.4, 0.119, 0.05, 1.6, 0.14, 1.8 ),
           (2.5,  0,  1.6, 0.072, 0.06, 1.8, 0.14, 2.0 ),
           (2.75, 0,  1.8, 0.024, 0.07, 2.0, 0.14, 2.2 ),
           (3.0,  0,  2.0, 0.024, 0.07, 2.2, 0.2,  2.6 ),
           (3.5,  0,  2.2, 0.155, 0.08, 2.6, 0.14, 2.8 ),
           (4.0,  0,  2.6, 0.060, 0.04, 2.8, 0.14, 3.2 ),
           (4.5,  0,  2.8, 0.239, 0.05, 3.2, 0.14, 3.6 ),
           (5.0,  0,  3.2, 0.143, 0.06, 3.6, 0.14, 4.0 ),
           (5.5,  0,  3.6, 0.048, 0.07, 4.0, 0.18, 4.6 ),
           (6.0,  0,  4.0, 0.047, 0.10, 4.6, 0.20, 5.2 ),
           (7.0,  0,  4.6, 0.036, 0.08, 5.2, 0.20, 6.0 ),
           (8.0,  0,  5.2, 0.120, 0.09, 6.0, 0.15, 6.5 ),
           (9.0,  0,  6.0, -0.071, 0.06, 6.5, 0.12, 7. ),
           (10,   0,  6.5, 0.150, 0.04, 7.0, 0.14, 8.0 ),
           (11,   0,  7,   0.371, 0.07, 8.0, 0.16, 9.0 ),
           (12,   0,  8,  -0.095, 0.09, 9.0, 0.17, 10. ),
           (14,   0,  9,   0.347, 0.05, 10., 0.20, 12. ),
           (16,   0, 10,   0.789, 0.09, 12., 0.15, 13. ),
           (18,   0, 12,  -0.143, 0.06, 13., 0.12, 14. ),
           (20,   0, 12,   0.299, 0.04, 14., 0.14, 16. ),
           (22,   0, 14,   0.741, 0.07, 16., 0.16, 18. ),
           (25,   0, 16,   0.718, 0.06, 18., 0.14, 20));
                   {--------------------------}
        {  Массив значений диаметров резцовой глдовки для 1-й формы зуба}
        Const
      TArray01 : Array [1..16,1..8] of real =
           ((  88.9,  40,  55,  8,  10,  20,  2.,   3. ),
            ( 100.,   45,  65,  9,  10,  20,  2.,   3. ),
            ( 125,    55,  75, 10,  12,  25,  2.,   3.5 ),
            ( 152.4,  70,  90, 10,  15,  30,  2.5,  3.5 ),
            ( 160,    72,  95, 12,  16,  32,  2.5,  4   ),
            ( 190.5,  85, 115, 15,  20,  40,  2.5,  5  ),
            ( 200,    90, 120, 15,  20,  40,  2.5,  5  ),
            ( 228.6, 100, 135, 15,  20,  40,  2.5,  5  ),
            ( 250,   110, 150, 18,  25,  50,  2.5,  6  ),
            ( 315,   140, 190, 24,  32,  65,  2.5,  9  ),
            ( 400,   180, 240, 30,  40,  80,  3.,  10  ),
            ( 457.2, 200, 280, 28,  50, 100,  4.,  10  ),
            ( 500,   225, 300, 36,  50, 100,  4.,  12  ),
            ( 630,   290, 380, 45,  70, 125,  4,   16  ),
            ( 800,   360, 480, 60,  80, 160,  5,   20  ),
            (1000,   450, 600, 70, 100, 200,  6,   25  ));
         Const
      TArrayD01: tt1  =  ( 88.9, 100, 125, 152.4, 160,
                          190.5, 200, 228.6, 250, 315,
                          400, 457.2, 500, 630, 800,1000,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0);
                      {-----------------------------------}
   { Массив значений диаметров резцовой головки для 2-й формы зуба }
       Const
      TArray02 : Array [1..18,1..8] OF REAL =
           ((  60,   18,  42,   7,   5,  15,  0.6,  2.  ),
            (  80,   24,  56,   8,   6,  20,  1,    2.5 ),
            (  88.9, 25,  60,   8,   8,  20,  1,    2.5 ),
            ( 100,   30,  70,   9,   8,  25,  1,    3.  ),
            ( 125,   40,  90,  10,  10,  30,  1,    3.5 ),
            ( 152.4, 45, 105,  10,  12,  30,  1.5,  3.5 ),
            ( 160,   50, 110,  12,  12,  40,  1.5,  4   ),
            ( 190.5, 60, 135,  15,  15,  40,  2,    5   ),
            ( 200,   60, 140,  15,  16,  50,  2,    5   ),
            ( 228.6, 70, 160,  15,  18,  60,  2,    6   ),
            ( 250,   75, 175,  18,  20,  65,  2,    6   ),
            ( 315,   95, 220,  24,  25,  80,  3,    8   ),
            ( 400,  120, 280,  30,  32, 100,  3,   10   ),
            ( 457.2,140, 320,  28,  36, 120,  4,   10   ),
            ( 500,  150, 350,  36,  40, 125,  4,   12   ),
            ( 630,  190, 440,  45,  50, 160,  5,   16   ),
            ( 800,  240, 560,  60,  65, 200,  6,   20   ),
            (1000,  300, 65,   70,  80, 250,  8,   25   ));
       Const
     TArrayD02 :tt1  = ( 60, 80,88.9, 100, 125, 152.4,
                        160, 190.5, 200, 228.6, 250, 315,
                        400, 457.2, 500, 630, 800,1000,
                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0, 0, 0, 0, 0);

                  {------------------------------}
       {   Массив коэффициентов смещения для круговых зубьев   }
       Const
       TArrayXn : Array [1..13,1..13] of real =
  (( 9, 0, 0,   0,   0,   0,   0,   0,   0, 0.46, 0.49, 0.50, 0.52),
  (10, 0, 0,   0,   0,   0,   0,   0,   0, 0.44, 0.47, 0.45, 0.48),
  (11, 0, 0,   0,   0,   0,   0,   0,   0.38, 0.41, 0.44, 0.45, 0.46),
  (12, 0, 0,   0,   0,   0,   0,   0.32, 0.37, 0.39, 0.41, 0.42, 0.43),
  (13, 0, 0,   0,   0,   0,   0.27, 0.30, 0.36, 0.37, 0.39, 0.40, 0.41),
  (14, 0, 0,   0,   0.18, 0.23, 0.26, 0.29, 0.33, 0.35, 0.37, 0.38,0.38),
  (15, 0, 0,   0.12, 0.17, 0.22, 0.25, 0.27, 0.31, 0.33, 0.35, 0.36, 0.37),
  (16, 0, 0.06, 0.11, 0.16, 0.21, 0.24, 0.26, 0.30, 0.32, 0.34, 0.35, 0.35),
  (18, 0, 0.05, 0.10, 0.15, 0.19, 0.22, 0.24, 0.27, 0.30, 0.32, 0.32, 0.33),
  (20, 0, 0.05, 0.09, 0.13, 0.17, 0.20, 0.22, 0.26, 0.28, 0.29, 0.29, 0.30),
  (25, 0, 0.04, 0.08, 0.11, 0.15, 0.17, 0.19, 0.21, 0.24, 0.25, 0.25, 0.26),
  (30, 0, 0.03, 0.07, 0.09, 0.11, 0.15, 0.16, 0.18, 0.21, 0.22, 0.22, 0.25),
  (40, 0, 0.03, 0.05, 0.07, 0.09, 0.11, 0.11, 0.14, 0.16, 0.17, 0.17, 0.18));
    {--------------------------------------------------------------}
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
  {------------------------------------------------------------------}
            { Выбор по переменной ее порядкового номера из массива }
      PROCEDURE PNomer (a:real;var b :TT1; I,N : byte; var ia : byte);
           Label 1;
           var j : byte;
           Begin
             For j:= I to N do
                if a <= b[j] then begin ia := j; goto 1; end;

        1: End;
                  {     Расчет допускаемых напряжений          }
       PROCEDURE PzubC2;
              Var c1 : real;
          { Процедура расчета допускаемых контактных напряжений }
  PROCEDURE PrSigHp (Da,Mn,N,Mu_H,H_HBp,H_HRcp,H_HVp,Ra,Lh:real;                    Termobr,Zw: byte; var Sigma_Hp :real);

          var Zx,Zv,Zr,Sh,N_Hlim,N_sum,N_He,Zn,Sigma_Hlim :real;

      BEGIN
          If Ra <= 1.25 then Zr:= 1
          else if Ra <= 2.5 then Zr:= 0.95 else Zr:= 0.9;

         Case Termobr of
                  1,2,3   : Sh := 1.1;
                  4,5,6,7 : Sh := 1.2
         end;
         Case Termobr of
              1,2 : Sigma_Hlim := 2 * H_HBp + 70;
                3 : Sigma_Hlim := 18 * H_HRcp + 150;
                4 : Sigma_Hlim := 17 * H_HRcp + 200;
              5,6 : Sigma_Hlim := 23 * H_HRcp ;
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
              Sigma_Hp := Sigma_Hlim * Zn * Zr * 0.9/ Sh
      else begin
            if Da <= 700 then Zx := 1 else Zx := Sqrt(1.07 - 0.0001 * Da);
            v := Pi * ( Da - 2 * Mn) * N / 60000 ;
            if H_HBp <= 350 then Zv := 0.85 *Exp(0.1*Ln(v))
            else Zv := 0.925 * Exp(0.05*Ln(v));
           Sigma_Hp := Sigma_Hlim * Zn * Zr * Zv * Zx / Sh;
           End;
      END;
            {   Расчет допускаемых изгибных напряжений       }
     PROCEDURE PrSigFp (DA,Mn,Mu_f,N,S_f, Lh:real;
                       H_HBp,Sigma_Flim0:real; Rewers: boolean;
                       Termobr,Zagotowka,
                       Zw:byte; var Sigma_Fp:real );
     var  Yx,Yr,Yn,Y_delta,Yz,N_sum,N_Fe,Sigma_Flim,Ya,q_F : real;
         BEGIN
             Yr := 1;
             N_sum := 60 * N * Lh * Zw;
             N_Fe := Mu_F * N_sum;
              if  H_HBp > 350   then q_F := 9
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
                        1,2 : Yz := 1;
                          3 : Yz := 0.9;
                          4 : Yz := 0.8
            end;
            If Da =0 then Sigma_Fp := 0.4 * Sigma_Flim0 *Yn*Ya
            else begin
                   Yx := 1.05 - 0.000125 * Da;
                   Y_delta := 1.082 - 0.172 * Log10(Mn);
                   Sigma_Flim := Sigma_Flim0 * Yz * Ya;
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
                     1,2 : Yz := 1;
                       3 : Yz := 0.9;
                       4 : Yz := 0.8
               end;
               S_Fst := Yz * 1.75;
               Yx := 1.05 - 0.000125 * Da;
               Sigma_FPmax := Sigma_Fst0 * Yx / S_Fst
            END;
        BEGIN
         c1:=1.15;
 PrSigHp (Da1,Mn,N1,Mu_H,H_HBp1,H_HRcp1,H_HVp1,Ra1,Lh,Termobr1,Zw,Sigma_Hp1);
            N2 := N1 /U;
 PrSigHp (Da2,Mn,N2,Mu_H,H_HBp2,H_HRcp2,H_HVp2,Ra2,lh,Termobr2,Zw,Sigma_Hp2);
          If TipZ=1 then Sigma_Hp:= Min3(Sigma_Hp1,Sigma_Hp2,Sigma_Hp2)
          else begin
 if 0.45*(Sigma_Hp1 + Sigma_Hp2) > c1*Min3(Sigma_Hp1,Sigma_Hp2,Sigma_Hp2)
      then Sigma_Hp := c1*Min3(Sigma_Hp1,Sigma_Hp2,Sigma_Hp2)
 else Sigma_Hp := 0.45 * ( Sigma_Hp1 + Sigma_Hp2);
               end;
     PrSigFp (Da1,Mn,Mu_f(1),N1,S_f1,Lh,H_HBp1,Sigma_Flim01,Rewers,
             Termobr1,Zagotowka[1],Zw,Sigma_Fp1);
     PrSigFp (Da2,Mn,Mu_f(2),N2,S_f2,Lh,H_HBp2,Sigma_Flim02,Rewers,
              Termobr2,Zagotowka[2],Zw, Sigma_Fp2);
     PrSigMax (Sigma_t1,H_HRcp1,H_HVp1,Sigma_Fst01,Da1,Zagotowka[1],
              Termobr1,Sigma_Hpmax1,Sigma_Fpmax1);
     PrSigMax (Sigma_t2,H_HRcp2,H_HVp2,Sigma_Fst02,Da2,Zagotowka[2],
              Termobr2,Sigma_Hpmax2,Sigma_Fpmax2 );
              Sigma_Hpmax:= Min3(Sigma_Hpmax1,Sigma_Hpmax2,Sigma_Hpmax2);
        END;      { Конец   PzubC2   }
   {-----------------------------------------------------------------------}
   {--------------------------------------------------------------------}
      Procedure PzubKon1;
              {          проектный расчет             }
        Label 1,2,3,4,5,6, 7;

  Const Us : TT1 = (1, 1.12, 1.25, 1.4, 1.6, 1.8, 2.0, 2.5, 3.15,
                    4.0, 5.0, 6.3,0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0, 0, 0, 0 );
  Const Zs : TT1 = (9, 10, 11, 12, 13, 14, 15, 16, 18, 20, 25, 30,
                   40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Var delta_u,d0min,d0minr,d0max,
      d0maxr,Rmin,Rmax,Mnmin,Mnmax,K0,C,Be,Bmin,Bmax,
      Gam,Gam1,Gam2,X1min,W2prim,deltaW2,Kz,delta_u1,deltahf : Real;
      Iu,Iz,Id0min,Id0max,IW2  : Byte;
      z1min, z2min : integer;

   {----------------------------------------------------------------------}
    Begin
      Case Metka of
        1 : Goto 1;
        2 : Goto 2;
        3 : Goto 3;
        4 : Goto 4;
        5 : Goto 5;
     end;
     1: if Betn=0 then Tet_H:=0.85 else
        if Betn>0 then
          Begin
           if (H_HBp1<350) and (H_HBp2<350) then Tet_H:=1.22+0.21*U;
           if (H_HBp1>350) and (H_HBp2<350) then Tet_H:=1.23+0.13*U;
           if (H_HBp1>350) and (H_HBp2>350) then Tet_H:=0.81+0.15*U;
         End;
         Nu_H:= Tet_H;
   {------------------- Выбор Kbe ---------------------------------- }
   if Nom_sx=4 then  Kbe:=1.8/(U+0.9) else
      if Nom_sx < 4 then
       begin
         if (H_HBp1>350) and (H_HBp2>350) then Kbe:=1.2/(U+0.6)
                                           else Kbe:=0.285;
       end;
   if Kbe > 0.3 then Kbe:=0.3;
   { ---------------------- КОэффицент K_Hbeta --------------------- }
     If TipOpor then begin
                  {    На шариковых подшипниках   }
        if (H_HBp1>350) and (H_HBp2>350) then
             if Betn=0 then Case Nom_Sx of
                 1,2,3 : K_HBeta := 1 +0.98*Kbe*u/(2 - Kbe);
                     4 : K_HBeta := 1 + 0.39*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                            End
             else  Case Nom_Sx of
                 1,2,3 : K_HBeta := 1 +0.46*Kbe*u/(2 - Kbe);
                     4 : K_HBeta := 1 + 0.189*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                            End
        else
          if Betn > 0 then K_HBeta := 1
          else  Case Nom_Sx of
                 1,2,3 : K_HBeta := 1 +0.39*Kbe*u/(2 - Kbe);
                     4 : K_HBeta := 1 + 0.118*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                End;
     End;
       If not TipOpor then begin
                 {  на роликовых подшипниках   }
        if (H_HBp1>350) and (H_HBp2>350) then
             if Betn = 0 then Case Nom_Sx of
                 1,2,3 : K_HBeta := 1 +0.54*Kbe*u/(2 - Kbe);
                     4 : K_HBeta := 1 + 0.39*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                            End
             else  Case Nom_Sx of
                 1,2,3 : K_HBeta := 1 +0.226*Kbe*u/(2 - Kbe);
                     4 : K_HBeta := 1 + 0.189*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                            End
        else
          if Betn > 0 then K_HBeta := 1
          else  Case Nom_Sx of
                 1,2,3 : K_HBeta := 1 +0.217*Kbe*u/(2 - Kbe);
                     4 : K_HBeta := 1 + 0.118*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                End;
     End;
 {-------------------------------------------------------------------------}
   De2R:=1013*Exp(0.333*Ln(T2*K_Hbeta*u/(NU_H*Kbe*(1-Kbe)*Sqr(Sigma_Hp))));
 2:  if otw1 then Wibor(TArrayDe,1,31,De2R,De2,IDe)
             else De2:=De2R;
   {------------------ числа зубьев z1 и  z2 ------------------------------}
     if Betn=0 then begin
          z1:=round(20/(Kbe*u)) ;
          z2:=round(z1*u);
                    end
     else begin
       if (H_HBp1<350) and (H_HBp2<350) then Kz:=18;
       if (H_HBp1>350) and (H_HBp2<350) then Kz:=14;
       if (H_HBp1>350) and (H_HBp2>350) then Kz:=11.2;
       z2:=round(Kz*Exp(0.4*ln(u))*Exp(0.167*ln(De2)));
       z1:=round(z2/u)
          end;
     z1min:=Round(18.4*cos(delta1)*Exp(3*Ln(cos(betn))));
     if Betn>0 then
              if z1min < 9  then z1min:=9;
     if z1 < z1min then  begin
            z1:=z1min ;
            z2:=Round(z1*u);
                         end;
     If z2 <18 then
      if Betn=0 then case z1 of
         12: z2min:=30;
         13: z2min:=21;
         14: z2min:=20;
         15: z2min:=19;
         16: z2min:=18;
         17: z2min:=17;
                   end{ case z1 }
      else case z1 of
          9: z2min:=31;
         10: z2min:=30;
         11: z2min:=28;
         12: z2min:=26;
         13: z2min:=22;
         14: z2min:=20;
         15: z2min:=19;
         16: z2min:=18;
         17: z2min:=17;
           end{ case z1 / if Betn>0 }
        Else Z2min := 17;
    if z2 < z2min then begin
            z2:=z2min ;
            z1:=Round(z2/u);
                       end;
{--------------------------------------------------------------------------}
  3:   delta_u1:=(u-z2/z1)/u;
       if delta_u1>0.04  then z1:=round(z2/(u-0.04*u));
       if delta_u1<-0.04 then z2:=Trunc(z1*1.04*u);
       Uf:=z2/z1;
       Mte:=de2/z2;
       Zc:=sqrt(z1*z1+z2*z2);
{--------------------------------------------------------------------------}
  5:   Re:=0.5*Mte*Zc;
       b:=round(Kbe*Re);
       Mn:=(Mte-b/Zc)*cos(Betn);
      if betn=0 then begin
        if Mn<1.5 then  Mn:=1.5;
         Mte:=Mn/cos(Betn)+b/Zc;
         de2:=Mte*z2;
         if otw1 then
         Wibor(TarrayDe,1,31,de2,de2,Ide2);
         Mte:=de2/z2;
         Re:=0.5*Mte*Zc;
         b:=round(Kbe*Re);
         Mn:=(Mte-b/Zc)*cos(betn)
      end;{ if  betg=0 }
{---------------------------------------------------------------------------}
  4:   if Betn>0 then begin
          if Mn<1.5 then Mn:=1.5;
          Wibor(Ms,1,37,Mn,Mn,IMn);
          if Forma=1 then  if Mn<2 then  Mn :=2;
  7:      Mte:=Mn/cos(Betn)+b/Zc;
         if (de2/Mte>z2min) and (de2/(Mte*u)>z1min) then begin
           z2:=round(de2/Mte);
           z1:=round(z2/u);
           Zc:=sqrt(z1+z2);
           Mte:=Mn/cos(Betn);
           u := z2 / z1;
           delta_u1:=(u-z2/z1)/u;
           if delta_u1>0.04  then z1:=round(z2/(u-0.04*u));
           if delta_u1<-0.04 then z2:=Trunc(z1*1.04*u);
           u:=z2/z1;
           Mte:=de2/z2;
           Zc:=sqrt(z1*z1+z2*z2);
                                                          end
        else begin
           if Forma = 1 then begin
               if Mn > 1.5 then begin
                  IMn := IMn -1;
                  Mn := Ms [IMn];
                  goto 7;       end
               else begin
                  Error :=1;
                  Goto 6;
                    end;
                             end;
           If Forma = 2 then begin
               if Mn > 2 then begin
                  IMn := IMn -1;
                  Mn := Ms [IMn];
                  goto 7;       end
               else begin
                  Error :=1;
                  Goto 6;
                    end;
                             end;
             End;
                  de2:=Mte*z2;
                  Re:=0.5*Mte*Zc;
                  b:=round(Kbe*Re);
        end;  { Конец if Betg > 0 }
              Rs:=Re-0.5*b;
              { Выбор  d0 для круговых зубьев }
             if Betn > 0 then
         begin
           if forma=1 then
             begin
               d0min:=Rs/0.6;
               d0max:=Rs/0.45;
               Wibor(TArrayd01,1,16,d0min,d0min,Id0min);
               Wibor(tarrayd01,1,16,d0max,d0max,Id0max);
               if Id0max-Id0min=0 then begin  d0:=d0min; Id0:=Id0min  end;
               if Id0max-Id0min=1 then begin  d0:=d0min; Id0:=Id0min  end;
               if Id0max-Id0min>=2 then
                begin  d0:=Tarrayd01[Id0min+1];Id0:=Id0min+1  end;
               Rmin:=Tarray01[Id0,2];
               Rmax:=TArray01[Id0,3];
               Bmin:=TArray01[Id0,5];
               Bmax:=TArray01[Id0,6];
               Mnmin:=TArray01[Id0,7];
               Mnmax:=TArray01[Id0,8]
             end;{ if forma=1 }
           if Forma=2 then
             begin
               d0minR:=Rs/0.65;
               d0maxR:=Rs/0.4;
               Wibor(TArrayd02,1,18,d0minR,d0min,Id0min);
               Wibor(TArrayd02,1,18,d0maxR,d0max,Id0max);
               if Id0max-Id0min=0 then begin  d0:=d0min; Id0:=Id0min  end;
               if Id0max-Id0min=1 then begin  d0:=d0min; Id0:=Id0min  end;
               if Id0max-Id0min>=2 then
                begin  d0:=Tarrayd02[Id0min+1];Id0:=Id0min+1  end;
               if Id0max-Id0min=3 then
                begin  d0:=Tarrayd02[Id0min+1];Id0:=Id0min+1  end;
                Rmin:=Tarray02[Id0,2];
                Rmax:=TArray02[Id0,3];
               Bmin:=TArray02[Id0,5];
               Bmax:=TArray02[Id0,6];
               Mnmin:=TArray02[Id0,7];
               Mnmax:=TArray02[Id0,8]
             end;{ if Forma=2 }
           {--------- проверка правильности d0 по Mn ------------------}
           if Mn > Mnmax then
             begin
               if forma=1 then begin
                    Id0:=Id0+1;
                    d0:=TArrayd01[Id0];
                              end;
               if forma=2 then begin
                    Id0:=Id0+1;
                    d0:=TArrayd02[Id0];
                               end;
             end; {if Mn>Mnmax}
          {------------------- Проверка d0 на вторичное действие ----------}
          K0:=Rs/d0;
          if (delta2>=50*PI/180) and (K0>0.7) then
            begin
              C:=cos(delta2+2*cos(betn)/Zc)/cos(delta2-2.5*cos(Betn)/Zc);
              Gam:=arctan(2*Rs/(d0*cos(Betn))-tan(Betn))-b*tan(Betn)/(2*Rs);
              Gam1:=ArcCos(C);
              Gam2:=0.5*arcCos(C)+5*cos(Betn)/ZC-b*Tan(Betn)/(8*Rs);
              if Gam-Gam1>0.1 then
          writeln('':5,'Возможно вторичное резание при черновой обработке');
              if (Gam-Gam2) > 0.1 then
                begin
                  Id0:=Id0+1;
                  if Forma=1 then d0:=TArrayd01[Id0] else d0:=TArrayd02[Id0];
                end { if Gam-Gam2>0.1 }
            end;{ if (delta>=50*PI/180) and K0>0.7 }
         end;{ - if TipZ=1 - }
{------------ Конец выбора  d0 для круговых зубьев --------------------}
       {----------- выбор коэффицентов Xn1 и Xn2 или   X1 и X1 ----------}
       if H_HBp1-H_HBp2<100 then
        begin
         if Betn=0 then X1:= 2*(1-1/(u*u))*sqrt(1/z1)
          else
           begin
            Pnomer(u,us,1,12,Iu);
            Pnomer(z1,zs,1,13,Iz);
            Xn1:=TArrayXn[Iz,Iu+1]
           end      {else/if Betg=0}
        end         {then/if H_HBp1-H_HBp2<100 }
        else begin
            if Betn=0 then
                begin
                 if z1<z1min then X1min:=1.068-0.58*z1/cos(delta1);
                 if X1min<0 then X1:=0 else X1:=X1min;
                end   {then/if Betg=0}
            else
              begin
  if z1<z1min then X1min:=1.068-0.058*z1/(cos(delta1)*exp(3*ln(cos(Betn))));
           if X1min<0 then Xn1:=0 else Xn1:=X1min;
              end;{ if Betg> 0}
             End;
       X2:=-X1;
       Xn2:=-Xn1;
               { Коэффициенты Xtau1 и Xtau2  }
       If u < 2.5 then Xtau1 := 0
       else
          if Betn=0 then Xtau1:= 0.03*0.008*(u-2.5)
                   else Xtau1:= 0.11+0.01*(u-2.5);
         if Betn>0   then
          begin
             if Mn < 2 then Xtau1 := 0;
             W2prim := Mn*(0.6609 + Xtau1);
             WIBOR (TArrayW,1,30,W2prim,W2,IW2);
             deltaW2 := W2prim - W2;
           If  Xtau1=0 then
              begin
                deltahf := 0.5 *(W2prim - W2)/0.364;
               if ((deltaW2>0.06*Mn) or (deltaW2<-0.02*Mn))then
                  begin
               Mn:=W2/(0.6609-Xtau1);
               Rs:=Mn*Zc/(2*cos(Betn));
               Mte:=Mn/cos(Betn)+b/Zc;
               Re:=Mte*Zc/2;
                  end;
              End
           else
            begin
               if abs(deltaW2) <= 0.05*Mn then Xtau1 := W2/Mn -0.6609
               else begin
                      Mn:=W2/(0.6609 + Xtau1);
                      Mte:=Mn/cos(Betn)+b/Zc;
                      Rs:=Mn*Zc/(2*cos(Betn));
                      Re:=Mte*Zc/2
                    end;
            end;
          End;
               Xtau2:=-Xtau1;
               de1:=Mte*z1;
               dm1:=de1*Rs/Re;
               dm2:=de2*Rs/Re;
               v:=PI*dm1*N1/60000;
               if Betn=0 then
         begin
          if v>14  then St:=5 else st:=6;
          if v<=10 then St:=7;
          if v<=5  then St:=8;
          if v<=2  then St:=9
         end;{if Betg=0}
        if Betn>0 then
         begin
          if v>25 then St:=5 else St:=6;
          if v<=16 then St:=7;
          if v<=8 then St:=8;
          if v<4 then St:=9;
         end;{if Betg>0}
    6: End;{ Конец проектировчного расчета по PzubKon1 }
    {---------------------------------------------------------------------}
            {      Расчет всех напряжений          }
      PROCEDURE PzubKon2;
               Var Yf1, Yf2 : real;
             {                                     }
{------------------------ РАСЧЕТ НАПРЯЖЕНИЙ В ЗУБЬЯХ----------------------}

{---------------процедура расчета контактных напряжений-------------------}
       Procedure PrSigH ;
             Var Whv, delta_H, g0,Ft, K_H,dm1,v_m,Z_v1,Z_v2,W_Hv,
                 K_Hv,K_Halfa : real;
       BEGIN
                         {расчет K_Hv}
         dm1:= 0.857*de1;
         v_m:= Pi*dm1*N1/60000;
        if betn = 0 Then Begin Z_v1:=z1/Cos(delta1);
                               Z_v2:=z2/Cos(delta2); End
                    Else Begin Z_v1:=Z1/(Cos(delta1)*Exp(3*Ln(Cos(betn))));
                               Z_v2:=Z1/(Cos(delta2)*Exp(3*Ln(Cos(betn))));
                         End;
        Ft:=2000*T1/dm1;
           Case St of
     6: if Mte<=3.55 then g0:=3.8 else if Mte<=10 then g0:=4.2 else g0:=4.8;
     7: if Mte<=3.55 then g0:=4.7 else if Mte<=10 then g0:=5.3 else g0:=6.4;
     8: if Mte<=3.55 then g0:=5.6 else if Mte<=10 then g0:=6.1 else g0:=7.3;
     9: if Mte<=3.55 then g0:=7.3 else if Mte<=10 then g0:=8.2 else g0:=10
           end;
       if (H_HVp1>350) and (H_HVp2>350) then
            if Betn=0 then Delta_H:=0.14
            else Delta_H:=0.04
       else if Betn=0 then Delta_H:=0.06
            else Delta_H:=0.02;
       W_Hv:=Delta_H*g0*V_m*sqrt(dm1*(u+1)/(2*u));
       K_Hv:=1+W_Hv*B/(Ft*K_Hbeta);
              {    ------------------------------------    }
        K_H:= K_HBeta*K_Hv;
              {---------------------------------------------}
        Sigma_H:=32200*Sqrt(T1*K_H/(de1*de1*de1*Kbe*(1-Kbe)*u*Nu_H));
        Sigma_Hmax:= Sigma_H*Sqrt(Ka);
         {конец процедуры расчета контактных напряжений}
    END;
{------------------ Расчет изгибных напряжений ---------------------------}
   Procedure PrSigF;
            Var Z_v1, Z_v2,Yfs1,Yfs2,delta_F,g0,W_Fv,Y_Fs1,Y_Fs2,
                Ft,bw,K_FAlfa,K_Fv,K_F,V_m : real;
     BEGIN
             if betn = 0 Then Begin Z_v1:=z1/Cos(delta1);
                               Z_v2:=z2/Cos(delta2); End
                    Else Begin Z_v1:=Z1/(Cos(delta1)*Exp(3*Ln(Cos(betn))));
                               Z_v2:=Z2/(Cos(delta2)*Exp(3*Ln(Cos(betn))));
                         End;
         bw:=B;
       Y_Fs1:=(3.47+13.2/Z_v1-29.7*X1/Z_v1+0.092*sqr(X1))*1.2;
       Y_Fs2:=(3.47+13.2/Z_v2-29.7*X2/Z_v2+0.092*sqr(X2))*1.2;
          If Betn=0 then Delta_F:=0.16 else Delta_F:=0.06;
          V_m:=Pi*de1*N1/60000;
           Case St of
   6: if Mte<=3.55 then g0:=3.8 else if Mte<=10 then g0:=4.2 else g0:=4.8;
   7: if Mte<=3.55 then g0:=4.7 else if Mte<=10 then g0:=5.3 else g0:=6.4;
   8: if Mte<=3.55 then g0:=5.6 else if Mte<=10 then g0:=6.1 else g0:=7.3;
   9: if Mte<=3.55 then g0:=7.3 else if Mte<=10 then g0:=8.2 else g0:=10
           end;
       {           Коэффициент K_FBeta      }
     If TipOpor then begin
                  {    На шариковых подшипниках   }
        if (H_HBp1>350) and (H_HBp2>350) then
             if Betn=0 then Case Nom_Sx of
                 1,2,3 : K_FBeta := 1 +1.46*Kbe*u/(2 - Kbe);
                     4 : K_FBeta := 1 + 0.56*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                            End
             else  Case Nom_Sx of
                 1,2,3 : K_FBeta := 1 +0.69*Kbe*u/(2 - Kbe);
                     4 : K_FBeta := 1 + 0.282*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                            End
        else
          if Betn > 0 then Case Nom_Sx of
                1,2,3 : K_FBeta := 1 + 0.355*Kbe*u/(2-Kbe);
                    4 : K_FBeta := 1 + 0.114*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                           End
          else  Case Nom_Sx of
                 1,2,3 : K_FBeta := 1 +0.76*Kbe*u/(2 - Kbe);
                     4 : K_FBeta := 1 + 0.214*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                End;
     End;
     If not TipOpor then begin
                 {  на роликовых подшипниках   }
        if (H_HBp1>350) and (H_HBp2>350) then
             if Betn=0 then Case Nom_Sx of
                 1,2,3 : K_FBeta := 1 +0.87*Kbe*u/(2 - Kbe);
                     4 : K_FBeta := 1 + 0.56*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                            End
             else  Case Nom_Sx of
                 1,2,3 : K_FBeta := 1 +0.33*Kbe*u/(2 - Kbe);
                     4 : K_FBeta := 1 + 0.282*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                    End
        else
          if Betn > 0 then Case Nom_Sx of
                 1,2,3 : K_FBeta := 1 + 0.207*Kbe*u/(2-Kbe);
                     4 : K_FBeta := 1 + 0.114*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                           End
          else  Case Nom_Sx of
                 1,2,3 : K_FBeta := 1 +0.434*Kbe*u/(2 - Kbe);
                     4 : K_FBeta := 1 + 0.214*Exp(1.71*Ln(Kbe*u/(2-Kbe)));
                End;
     End;
    W_Fv:=Delta_F*g0*v*sqrt(dm1*(u+1)/(2*u));
    K_Fv:=1+W_Fv*bw*0.857*de1/(2000*T1*K_HBeta);
    K_F:=K_Fv*K_Fbeta;
        if Betn=0 then Tet_F:=0.85
        else Begin
         if (H_HBp1<350) and (H_HBp2<350) then Tet_F:=0.94+0.08*U;
         if (H_HBp1>350) and (H_HBp2<350) then Tet_F:=0.85+0.043*U;
         if (H_HBp1>350) and (H_HBp2>350) then Tet_F:=0.65+0.11*U;
             end;
    Ft:=2000*T1/(0.857*de1);
    Sigma_F1:=2.7*1000*T1*K_F*Y_Fs1/(bw*de1*Mte*Tet_F);
    Sigma_Fmax1:=Sigma_F1*Ka;
    Sigma_F2:=Sigma_F1*Y_Fs2/Y_Fs1;
    Sigma_Fmax2:=Sigma_F2*Ka;
   END;

     {---------------------------------------------------------------}
       Begin
          PrSigH;
          PrSigF;
       END; {   Конец PzubKon2     }
   {-----------------------------------------------------------------------}
              {  Расчет геометрических размеров      }
      PROCEDURE PzubKon3;
          Const
             Uka:tt1  = (1.25, 1.6, 2.5, 4.0, 8,0,0,0,0,0,0,0,0,0,0,0,
                            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                            0,0,0,0,0,0,0, 0);
             Z_1:tt1  = (9, 11, 13, 15, 17, 19, 24, 0, 0, 0,
                         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,
                         0,0,0,0,0,0,0,0,0,0,0,0,0,0);
             Ka_1:array [1..7,1..10] of real =
                       ((0, 0, 0, 0, 0.75, 0, 0, 0, 0, 1 ),
                        (0, 0, 0, 0.8, 0.8, 0, 0, 0, 1, 1 ),
                        (0, 0, 0.9, 0.85, 0.85, 0, 0, 1, 1, 1 ),
                        (0, 0.9, 0.9, 0.9, 0.85, 0, 0.9, 1, 1, 1 ),
                        (0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 1, 1, 1, 1 ),
                        (0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 1, 1, 1, 1 ),
                        (1, 1, 1, 1, 1, 0.9, 1, 1, 1, 1 ));
          Var  Tet_F1, Tet_F2, Zc,  H_F1, H_F2, K, Ka1,
              Ka2, Tet_FSig, deltah_A1, deltah_A2,le : real;
              IUKa, Iz_1 : byte;

              {----------------------------------------------}
          Procedure PrRazmer1 (z:integer; B, Mn, Mte, Betn, H_F, Tet_A,
                             Tet_F, Xn, deltah_A, delta : real;
                             var  H_Fe,H_Fi, H_e, H_A, delta_A, delta_F,
                             H_Ae, d, dm, de, dae, dfe :real );
                    { Расчет размеров для круговых зубьев  }
              Var   le,  deltah_Ae, deltah_Fe  : real;
                         {-------------------------}
              Begin
                  le:= 0.5 * B;
                  Ha:= 1;
                  deltah_Ae:= le * Tan(Tet_A);
                  deltah_Fe:= le * Tan(Tet_F);
                { Высота головки зуба в нормальном сечении }
         H_A := (Ha + Xn ) * Mn - deltah_A ;
                { Высота головки зуба на торце  }
         H_Ae := H_A + deltah_Ae;
                { Внешняя высота ножки зуба на торце  }
         H_Fe := H_F + deltah_Fe ;
                {  Высота ножки зуба на внутреннем торце  }
         H_Fi := H_Fe - B * Tan(Tet_F);
                {  Высота зуба на торце  }
         H_e := H_Ae + H_Fe;
                {     Угол конуса вершин  }
         delta_A := delta + Tet_A;
                {     Угол конуса впадин  }
         delta_F := delta - Tet_F;
         dm := Mn * Z / Cos(Betn);
         de := Mte * Z;
         dfe := de -2 * H_Fe *Cos(delta);
         dae := de + 2 * H_Ae * Cos(delta);
           End;
                  {-------------------------}
       Procedure PrRazmer2 (z:integer; B, Mte, delta,Xe, Xtay,Re,
                            Tet_A : real;  var  H_Ae,H_Fe,H_e, S_e, delta_A,
                            delta_F, de, dm, dae, dfe :real );
                    { Расчет размеров для прямых зубьев  }
           Var Ha, c_,   Tet_F : real;
             Begin
                Ha := 1;
                c_ :=0.2;
                    {  Ынешняя высота головки зуба }
                H_Ae := (Ha + Xe) * Mte;
                    {  Внешняя высота ножки зуба   }
                H_Fe := (Ha + c_ - Xe) * Mte;
                    {  Высота зуба на торце  }
                H_e := H_Ae + H_Fe;
                    {  Толщина зуба на внешнем торце  }
                S_e := (0.5 * Pi + 2 * Xe * 0.364 + Xtay ) * Mte ;
                    {  Угол ножки зуба       }
                Tet_F := ArcTan(H_Fe / Re);
                    {     Угол конуса вершин  }
               delta_A := delta + Tet_A;
                    {     Угол конуса впадин  }
               delta_F := delta - Tet_F;
               dm := Mte * Z *(Re - 0.5*B)/ Re;
               de := Mte * Z;
               dfe := de -2 * H_Fe *Cos(delta);
               dae := de + 2 * H_Ae * Cos(delta);
           End;
                {--------------------------------------------------}
           Begin
             le := 0.5;
             Zc := Sqrt(z1*z1 +z2*z2);
             If Betn > 0 then begin
                if Xtau1 = 0 then begin
                   H_F1 := (Ha + c_ - Xn1)*Mn + delta_hf;
                   H_F2 := (Ha + c_ - Xn2)*Mn + delta_hf;
                                  end
                else begin
                   H_F1 := (Ha + c_ - Xn1)*Mn ;
                   H_F2 := (Ha + c_ - Xn2)*Mn ;
                     end;
                Sn1 := (0.5 * Pi + 2*Xn1*0.364 + Xtau1)*Mn;
                Sn2 := Pi * Mn - Sn1;
                If Forma = 2 then begin
                    K :=10800*Tan(Betn)/(Zc*0.364)*(1-2*Rs*Sin(Betn)/d0);
                    K := Round(K/20)*20;
                    if K <= 0 then d0 := TArrayD02[Id0];
                    if K > 500 then d0 := TArrayD02[Id0-1];
                    Tet_Fsig := K / sin(Betn);
                      {}
                    Tet_F1 := Tet_Fsig*(0.5-2/Pi*Xn1*0.364);
                    Tet_F2 := Tet_Fsig - Tet_f1;
                    Tet_F1 := Tet_F1 * Pi /( 180*60);
                    Tet_F2 := Tet_F2 * Pi /( 180*60);
                                  end
                else begin
                    Tet_F1 := ArcTan(H_F1 / Rs);
                    Tet_F2 := ArcTan(H_F2 / Rs);
                     end;
                       {}
                if Forma = 2 then begin
                    Pnomer (U,Uka, 1, 5, IUka);
                    if z1 < 25 then  Pnomer (z1,Z_1, 1, 7, Iz_1);
                    if z1 > 24 then begin
                        Ka1 := 1;
                        Ka2 := 1;
                                    end
                    else begin
                        Ka1 := Ka_1 [Iz_1,IUKa];
                        Ka2 := Ka_1 [Iz_1,IUKa+5];
                         end;
                    Tet_A1 := Ka1 * Tet_F2;
                    Tet_A2 := Ka2 * Tet_F1;
                                    end
                else begin
                    Tet_A1 := Tet_F2;
                    Tet_A2 := Tet_F1;
                     end;
                if Forma = 2  then begin
                    deltah_A1 := (B-le)*(Tan(Tet_F2)-Tan(Tet_A1));
                    deltah_A2 := (B-le)*(Tan(Tet_F1)-Tan(Tet_A2));
                                   end
                else begin
                    deltah_A1 := 0;
                    deltah_A2 := 0;
                     end;
           PrRazmer1 (z1, B, Mn, Mte, Betn, H_F1, Tet_A1,Tet_F1, Xn1,
                      deltah_A1, delta1, H_Fe1,H_Fi1, H_e1, H_A1, delta_A1,
                       delta_F1,H_Ae1, d1, dm1, de1, dae1, dfe1);
           PrRazmer1 (z2, B, Mn, Mte, Betn, H_F2, Tet_A2, Tet_F2, Xn2,
                     deltah_A2, delta2, H_Fe2,H_Fi2, H_e2, H_A2, delta_A2,
                       delta_F2,H_Ae2,  d2, dm2, de2, dae2, dfe2);
                            end; {  Конец для bet > 0 }
             If Betn = 0 then begin
                    Tet_A1 := ArcTan((Ha+c_ - x2)*Mte / Re);
                    Tet_A2 := ArcTan((Ha + c_ -x1)* Mte / Re);
           PrRazmer2 (z1, B, Mte, delta1, X1, Xtau1,Re,Tet_A1, H_Ae1,H_Fe1,
                     H_e1, S_e1, delta_A1,delta_F1, de1, dm1, dae1, dfe1);
           PrRazmer2 (z2, B, Mte, delta2, X2, Xtau2,Re,Tet_A2, H_Ae2,H_Fe2,
                     H_e2,S_e2, delta_A2, delta_F2, de2, dm2, dae2, dfe2);
                              end;
       {  Расстояние от вершины конуса до плоскости вершины зубьев }
             B1 := 0.5 * de2 - H_Ae1 * Sin(delta1);
             B2 := 0.5 * de1 - H_Ae2 * Sin(delta2);
        END;
     {---------------------------------------------------------------------}
       PROCEDURE PZubKon4 ;
                 {  Расчет качественных показателей  }
            Label 1;
            Const
              RoK01 : Array [1..23] of real = (0.22, 0.22, 0.3, 0.3, 0.38,
                                               0.38, 0.45, 0.5, 0.6, 0.6,
                                               0.75, 0.75, 0.9, 1.0, 1.2,
                                                                                              1.3, 1.5, 1.6, 1.8, 2.1, 2.4,
                                               2.7, 3.0 );
         TArrayW21 : tt1  = (0.6, 0.7, 0.8, 0.8, 1.0, 1.1,
                             1.3, 1.4, 1.6, 1.8, 2.0, 2.2,
                             2.6, 2.8, 3.2, 3.6, 4.0, 4.6,
                             5.2, 6.0, 6.5, 7.0, 8.0, 9.0,
                             10, 12, 13, 14, 16, 18, 0,0,0,
                             0,0,0,0,0,0,0,0,0,0,0,0);
           RoK02 : Array [1..30] of real = (0.2, 0.2, 0.2, 0.4, 0.4, 0.4,
                                            0.5, 0.5, 0.5, 0.8, 0.8, 0.8,
                                            1.1, 1.1, 1.1, 1.5, 1.5, 1.5,
                                            2.3, 2.3, 2.3, 2.5, 2.5, 2.5,
                                            4.2, 4.2, 4.2, 5.6, 5.6, 5.6);
                    {-----------------------------------}
         Type TT = Array [1..2] of real;
         Var invAlfa, invAlfat_Ae, RoK0, Epsia_1, Epsia_2, Epsia_c,Epsia,
             Betn_Ae,
             Betn_A, Betn_Ai, Alfat_e, Alfat_i, Alfat_a, invAlfat_e,
             invAlfat, invAlfat_a, invAlfat_i, invAlfat_Ai, CosBet_e,
             CosBet_i, H_tae, H_tai, C_te, C_ti, dvt, dvte, dvti, davte,
             H_Ai, davti, davt, Upr, e, Epsi_max  : real;
             IW2, Ixn : byte;
             H_Femax, H_Fe, Alfat_Ae, H_A, H_Ae,  Alfat_Ai,Tet_A,Alfat_pi,
             Alfat_le, Alfat_Li,St_e,St_i, Sn, Sn_Ae, Sn_Ai, H_Fimax,H_Fi,
             Alfat_pe, Alfa_pi, Alfa_pe, Zvt, delta, de, S_e,  Xte, Xti, xi,
             Alfa_li, Alfa_le, K_gam,H_HBp : TT; I: byte;
                        {----------------------}
        Begin
              Zvt [1] :=z1/ (Cos(delta1)*Exp(3*Ln(Cos(Betn))));
              Zvt [2] :=z2/ (Cos(delta2)*Exp(3*Ln(Cos(Betn))));
              Sn[1] := Sn1;
              Sn[2] := Sn2;
              H_Ae[1] := H_Ae1;
              H_Ae[2] := H_Ae2;
              H_Fe[1] := H_Fe1;
              H_Fe[2] := H_Fe2;
              H_Fi[1] := H_Fi1;
              H_Fi[2] := H_Fi2;
              H_a[1] := H_A1;
              H_a[2] := H_A2;
              H_HBp[1] := H_HBp1;
              H_HBp[2] := H_HBp2;
              Tet_A[1] := Tet_A1;
              Tet_A[2] := Tet_A2;
              delta[1] := delta1;
              delta[2] := delta2;
              de[1] := de1;
              S_e[1] := S_e1;
              de[2] := de2;
              S_e[2] := S_e2;
              xi[1] := x1;
              xi[2] := x2;
              PNomer (Mn,Ms, 1 , 23, IMn);
                   {---------------------------}
        If Betn = 0  then begin
                 {  Для прямозубых колес   }
            For I := 1 to 2 Do begin
                dvte := Zvt[i] * mte;
                dvti := dvte * (Re - B)/ Re;
                davte := dvte + 2 * H_Ae[i];
                H_Ai := H_Ae[i] - B * Tan(Tet_A[i]);
                davti := dvti + 2 * H_Ai;
                Alfat_Ae[i] := ArcCos(dvte * 0.9397/ davte);
                Alfat_Ai[i] := ArcCos(dvti * 0.9397/ davti);
 Alfat_Li[i]:=ArcTan(0.364-4*(1.2-xi[i]-0.1974*Re/(Re-B))/(Zvt[i]*0.6428));
                   {  Проверка заострения   }
             If Zvt[i] > 150 then  S_ae[i] := S_e[i] - 2 * H_Ae[i] * 0.364
               else begin
                    invAlfa := 0.364 - Pi /9 ;
                    invAlfat_Ae := Tan(Alfat_Ae[i])-Alfat_Ae[i];
                  S_ae[i] :=davte * (S_e[i]/dvte+invAlfa-invAlfat_Ae);
                    end;
                   {  Проверка подрезания  }
               RoK0 := RoK01 [IMn];
               H_Femax[i] := Re*Tan(delta[i])*Sqr(0.342)+RoK0*(1-0.342);
             End;    {   конец For i:=1 to 2 }
                     {-----------------------}
                    {      Проверка интерференции    }
        Alfat_pi[1] := ArcTan(0.364-Zvt[2]/Zvt[1]*(Tan(Alfat_Ai[2])-0.364));
        Alfat_pi[2] := ArcTan(0.364-Zvt[1]/Zvt[2]*(Tan(Alfat_Ai[1])-0.364));
                    {     Коэффициент перекрытия     }
 Epsia_1:=Sqrt(Sqr(Zvt[1]/2+H_Ae1/Mte)-Sqr(0.5*Zvt[1]*0.9397))/(Pi*0.9397);
 Epsia_2:=Sqrt(Sqr(Zvt[2]/2+H_Ae2/Mte)-Sqr(0.5*Zvt[2]*0.9397))/(Pi*0.9397);
     Epsia_c := (Zvt[1] + Zvt[2])*0.364 /(2 * Pi);
     Epsia := Epsia_1 + Epsia_2 - Epsia_c;
     Epsias :=Epsia;
     END;         {   Конец для Betg =0   }
                  {-----------------------}
                  {   Для круговых зубьев }
         If Betn > 0 then begin
              PNomer(W2,TArrayW21, 1, 30, IW2);
              RoK0 := RoK02 [IW2];
            For I:=1 to 2 Do Begin
                dvt := Zvt[i] * Mn /Cos(Betn);
                dvte := dvt * Re/Rs;
                dvti := dvt * (Re - B)/ Rs;
                H_ai :=H_ae[i] -B*Tan(Tet_A[i]);
                davt := dvt + 2 * H_A[i];
                davte := dvte + 2 * H_Ae[i];
                davti := dvti + 2 * H_Ai;
                Betn_e := ArcSin(Rs/Re*Sin(Betn)+(Re/Rs - Rs/Re)*Rs/d0);
               Betn_i := ArcSin(Rs/(Re-B)*Sin(Betn)+((Re-B)/Rs-Rs/(Re-B))*Rs/d0);
                Betn_ae :=ArcTan(davte*Tan(Betn_e)/dvte);
                Betn_a :=ArcTan(davt*Tan(Betn)/dvt);
                Betn_ai :=ArcTan(davti*Tan(Betn_i)/dvti);
                CosBet_e := Cos(Betn_e);
                CosBet_i := Cos(Betn_i);
                H_tae := Ha * CosBet_e;
                C_te := c_ * CosBet_e;
                Xte[1] := Xn1 *CosBet_e;
                Xte[2] := Xn2 * Cosbet_e;
                H_tai := Ha * CosBet_i;
                C_ti := c_ * CosBet_i;
                Xti[1] := Xn1 * CosBet_i;
                Xti[2] := Xn2 * CosBet_i;
                Alfat_e :=ArcTan(0.364/Cos(Betn_e));
                Alfat := ArcTan(0.364 / Cos(Betn));
                Alfat_i := ArcTan(0.364 /Cos(Betn_i));
                Alfat_Ae[i] := ArcCos(dvte * Cos(Alfat_e)/ davte);
                Alfat_a := ArcCos(dvt* Cos(Alfat)/davt);
                Alfat_Ai[i] := ArcCos(dvti * Cos(Alfat_i)/ davti);
Alfat_Li[i]:=ArcTan(0.364-4*(1.25 -Xti[i]-0.1645*Re/(Re-B))/(Zvt[i]*0.6428));
 Alfat_Le[i]:=ArcTan(0.364-4*(1.25 -Xte[i]-0.1645)/(Zvt[i]*0.6428));
                 {     Заострение     }
          If Forma = 1 then Begin
               St_e[1] := Sn[i]/ Cos(Betn)*Re/Rs;
               St_i[1] := Sn[i]/ Cos(Betn)*(Re-B)/Rs;
                            end
          else begin
               St_e[1] := (W2-2*H_Fe2*0.364)/Cos(Betn_e);
               St_i[1] := (W2-2*H_Fe2*0.364)/Cos(Betn_i);
               end;
           St_e[2] := Pi*Mn*Re/(Cos(Betn)*Rs)-St_e[1];
           St_i[2] := Pi*Mn*(Re-B)/(Cos(Betn)*Rs)-St_i[1];
             If  Zvt[i] > 150 then begin
                 Sn_ae[i] := St_e[i]*Cos(Betn_e) - 2*H_Ae[i]*0.364;
                 Sn_a[i] := Sn[i] - 2*H_a[i]*0.364;
                 Sn_ai[i] := St_i[i]*Cos(Betn_i) - 2*H_ai*0.364;
                                end
             else begin
                 invAlfat_e :=Tan(Alfat_e) - Alfat_e;
                 invAlfat_Ae :=Tan(Alfat_Ae[i]) - Alfat_Ae[i];
         Sn_ae[i] :=davte*(St_e[i]/dvte+invAlfat_e-invAlfat_Ae)*Cos(Betn_ae);
                invAlfat :=Tan(Alfat) - Alfat;
                 invAlfat_A :=Tan(Alfat_A) - Alfat_A;
     Sn_a[i] :=davt*(Sn[i]/(dvt*Cos(Betn))+invAlfat-invAlfat_A)*Cos(Betn_a);
                invAlfat_i :=Tan(Alfat_i) - Alfat_i;
                 invAlfat_Ai :=Tan(Alfat_Ai[i]) - Alfat_Ai[i];
     Sn_ai[i] :=davti*(St_i[i]/dvti+invAlfat_i-invAlfat_Ai)*Cos(Betn_ai);
                  end;
                 {  Коэффициент сужения  }
     K_gam[i] := Sn_ae[i] / Sn_ai[i];
     if ((K_gam[i] < 0.7 ) or (K_gam[i] > 1.3 )) then
     begin
             Error := 2;
             goto 1;
     End;
               {    Проверка подрезания зуба   }
     H_Femax[i] :=Re *Tan(delta[i])*Sqr(Alfat_e)+Rok0* (1 - 0.342);
     H_Fimax[i] := (Re-B)*Tan(delta[i])*0.342 + rok0*(1-0.342);
         END;    { Конец For i=1 to 2  }
              {       Проверка интерференции   }
     Upr:=  Zvt[2] / Zvt[1];
 Alfat_pe[1]:=ArcTan(Tan(Alfat_e)-Upr*(Tan(Alfat_Ae[2])-Tan(Alfat_e)));
 Alfat_pe[2]:=ArcTan(Tan(Alfat_e)-1/Upr*(Tan(Alfat_Ae[1])-Tan(Alfat_e)));
 Alfat_pi[1]:=ArcTan(Tan(Alfat_i)-Upr*(Tan(Alfat_Ai[2])-Tan(Alfat_i)));
 Alfat_pi[2]:=ArcTan(Tan(Alfat_i)-1/Upr*(Tan(Alfat_Ai[1])-Tan(Alfat_i)));
              {     Коэффициент перекрытия  }
 Epsia_1 := Sqrt(sqr(0.5*Zvt[1]+H_A1*Cos(Betn)/Mn)-sqr(0.5*Zvt[1]*Cos(Alfat)))/
 (Pi*Cos(Alfat));
  Epsia_2 := Sqrt(sqr(0.5*Zvt[2]+H_A2*Cos(Betn)/Mn)-sqr(0.5*Zvt[2]*Cos(Alfat)))/
 (Pi*Cos(Alfat));
  Epsia_c := (Zvt[1] + Zvt[2])*Tan(Alfat)/(2*Pi);
  Epsi_Bet := B *Sin(Betn)/(Pi * Mn);
  Epsia :=Epsia_1 +Epsia_2 - Epsia_c;
  Epsias := Sqrt(sqr(Epsia) + sqr(Epsi_Bet));
     END;      {    Конец  Bet > 0 }
               {----------------------------------}
      For i := 1 to 2 Do Begin
                    {  Проверка заострения  }
          If H_HBp[i] < 350 then e := 0.3 else e := 0.4;
          If Betn = 0 then begin
             If S_ae[i] < (e*Mte) {or Sn_ai[i] < (e*Mn)} then begin
                if i = 1 then begin
                    Error := 3;
                    Goto 1;
                              end
              else begin
                    Error := 4;
                    Goto 1;
                   end;
                  ISna := 0; goto 1;
                                                              end;
                           End
           else begin
             If Sn_ae[i] < (e*Mte)  then begin
                if i = 1 then begin
                     Error := 3;
                     Goto 1;
                              end
                else begin
                      Error := 4;
                      Goto 1;
                     end;
                  ISna := 0;
                   goto 1;
                                         end;
            if Sn_ai[i] < (e*Mn)  then begin
                if i = 1 then begin
                       Error := 5;
                       Goto 1;
                              end
                else begin
                       Error := 6;
                       Goto 1;
                     end;
                ISna := 0;
                goto 1;
                                        end;
                   End;
                    {    Проверка подрезания      }
      If H_Femax[i] < H_Fe[i] then begin
                If i = 1 Then begin
                       Error := 7;
                       Goto 1;
                               end
                 else begin
                       Error := 8;
                       goto 1;
                      end;
               ixx:= 0;
               Goto 1;
                                    end;
      If Betn > 0 then begin
            If H_Fimax[i] < H_Fi[i]  then begin
                  If i = 1 Then begin
                       Error := 9;
                       Goto 1;
                                end
                  else begin
                       Error := 10;
                       goto 1;
                       end;
               ixx:= 0;
               Goto 1;
                                    end;
                        end;
                 {  Проверка интерференции    }
       If Alfat_pi[i] <= Alfat_li[i] then begin
                 If i = 1 Then begin
                       Error := 11;
                       Goto 1;
                                end
                  else begin
                       Error := 12;
                       goto 1;
                       end;
                                            end;
      If Betn > 0 then
      Begin
         If Alfat_pe[i] <= Alfat_le[i] then begin
                If i = 1 Then begin
                       Error := 13;
                       Goto 1;
                                end
                  else begin
                       Error := 14;
                       goto 1;
                       end;
                                             end;
      End;
       END;
         If Betn =0 then Epsi_max := 1.3 else Epsi_max := 1.15;
         If Epsia < Epsi_max then
         begin
                        Error := 15;
                        Goto 1;
         End;

         If ((Betn > 0)  and (Epsi_Bet < 1.25)) then
         begin
                        Error := 16;
                        Goto 1;
          End;

   1 :  END; { Конец PzubKon4 }
   {--------------------------------------------------------------------}
           {          Расчет усилий в зацеплении               }
      PROCEDURE PzubC8;
                Var  Gam_A, Gam_R : real;
                Kfx : real;
          BEGIN
                   if Betn = 0 then begin
                       Gam_A:=0.364*Sin(Delta1);
                       Gam_R:=0.364*Cos(Delta1);
                       Kfx:=1;
                                   end
                   else begin
                       if NaprZub1 = 1 then Case Napr_Vr of
                         False: begin
                              Gam_A:=0.444*Sin(Delta1)+0.7*Cos(Delta1);
                              Gam_R:=0.444*Cos(Delta1)-0.7*Sin(Delta1);
                              Kfx := 1;
                            end;
                         True: begin
                              Gam_A:=0.444*Sin(Delta1)-0.7*Cos(Delta1);
                              Gam_R:=0.444*Cos(Delta1)+0.7*Sin(Delta1);
                              Kfx := -1;
                            end;
                                            end;
                       if NaprZub1 = 2 then Case Napr_Vr of
                         False: begin
                              Gam_A:=0.444*Sin(Delta1)-0.7*Cos(Delta1);
                              Gam_R:=0.444*Cos(Delta1)+0.7*Sin(Delta1);
                              Kfx := -1;
                            end;
                         True: begin
                              Gam_A:=0.444*Sin(Delta1)+0.7*Cos(Delta1);
                              Gam_R:=0.444*Cos(Delta1)-0.7*Sin(Delta1);
                              Kfx := 1;
                            end;
                                            end;
                        End;
                    Ft1:= 2*T2/(0.857*De2)*1E3;
                    Ft2:= Ft1;
                    Fr1:= Ft1*Gam_R;
                    Fr2:= Ft1*Gam_A;
                    Fx1:= Kfx*Ft1*Gam_A;
                    Fx2:= Kfx*Ft1*Gam_R;
                    Fv:= sqrt(sqr(Ft1)+Sqr(Fr1));
          END;    {     Конец    PzubC8     }
              {   Расчет контрольного комплекса    }
   PROCEDURE PzubKon5;
         {-----------------------------------------------------}
      Procedure PrSc (S,H : real; var Sce, hce :real);
          Begin
             Sce := S * 0.883;
             hce := H - 0.1607 * S;
          End;
      Procedure PrSe (Betn,S,H,delta,d : real; var Se,Hae : real);
          Var Psi_e : real;
          Begin
            Psi_e := S*Cos(delta)/d;
            If Betn = 0 then Se:=d*Sin(Psi_e)/Cos(delta)
            else Se:=S*(1-Sqr(Psi_e)/6);
            Hae := H + 0.25*S*Psi_e;
          End;
                    {-------------------------------}
         Begin
            If Betn=0 then begin
               if x2 > (-0.4) then begin
                  PrSc (S_e1,H_ae1,Sce1,hce1);
                  PrSc (S_e2,H_ae2,Sce2,hce2);
                  PrSe (Betn,S_e1,H_Ae1,delta1,de1,Se_1,Hae_1);
                  PrSe (Betn,S_e2,H_Ae2,delta2,de2,Se_2,Hae_2);
                                   end
               else begin
                  PrSc (S_e1,H_ae1,Sce1,hce1);
                  PrSe (Betn,S_e1,H_Ae1,delta1,de1,Se_1,Hae_1);
                  dey2:=de2 - Mte*Cos(delta2);
               Se_y2 :=de2*Sin(S_e2*Cos(delta2)/de2)/Cos(delta2)+0.364*Mte;
               hae_y2:=H_Ae2+0.25*S_e2*S_e2*Cos(delta2)/de2+0.5*Mte;
                    end;
                           end;
            If Betn>0 then begin
               if xn2 > (-0.4) then begin
                  PrSc (Sn1,H_ae1,Sce1,hce1);
                  PrSc (Sn2,H_ae2,Sce2,hce2);
                  PrSe (Betn,Sn1,H_A1,delta1,d1,Se_1,hae_1);
                  PrSe (Betn,Sn2,H_A2,delta2,d2,Se_2,hae_2);
                                   end
               else begin
                  PrSc (Sn1,H_ae1,Sce1,hce1);
                  PrSe (Betn,Sn1,H_A1,delta1,d1,Se_1,hae_1);
                  dey2:=d2 - Mn*Cos(delta2);
             Sn_y2 :=Sn2*(1-Sqr(Sn2*Cos(delta2)*Cos(Betn)/d2)/6)+0.364*Mn;
               Ha_y2:=H_A2+0.25*Sn2*Sn2*Cos(delta2)*Cos(Betn)/d2+0.25*Mn;
                    end;
                           end;
      End;    {   Конец PzubKon5   }
   {---------------------------------------------------------------------}
           BEGIN                    {Начало процедуры Expandata}
        {--------------------------------------------------------------}
           T1:=P1*30*1000 /(Pi*N1);
           T2:= T1 * U;
           Zw := 1;
     if TipZ = 1 then
       Betn:= 0
     else
       Betn:=35*Pi/180;
       if Napr_Vr then
         NaprZub1:=2
       else
         NaprZub1:=1;
                          {    Парметры исходного контура       }
           If Betn = 0 then begin
              Ha:=1;
              c_:=0.20;
              H_l:=2;
              Ro_f:=0.30;
              Alfa:=20;
                             end
           else begin
              Ha:=1;
              c_:=0.25;
              H_l:=2;
              Ro_f:=0.25;
              Alfa:=20;
                             end;
            delta1 := ArcTan(1/u);
            delta2 := ArcTan(u);
            Da1:=0;
            Da2:=0;
            Metka := 1;
              {  Предварительный расчет допускаемых напряжений   }
              PzubC2;
              {     Проектный расчет передачи     }
         1:    PzubKon1;
                     {-------------------------}
                   {  Расчет фактических напряжений  }
               If Error <> 0 then Exit;
         3:    PzubKon2;
                   {  Уточнение допускаемых напряжений  }
                    Da1 :=de1 + 2* Mte * Cos(delta1);
                    Da2 :=de2 + 2* Mte * Cos(delta2);
               PzubC2;
         {  Проверка условия: допускаемое напряжение больше фактического  }
                   {  Проверка по контактным напряжениям  }
          if Sigma_H > Sigma_Hp then begin
                  De2R:=de2*Exp(0.666*Ln(Sigma_H/Sigma_Hp));
                  Wibor (TArrayDe,1,31,De2r,de2,Ide);
                  z2:= Round(de2/Mte);
                  z1:= Round(z2/u);
                  Metka:=3;
                  Goto 1;
                                      End;
          if Sigma_Hmax > Sigma_Hpmax then begin
                 de2r:=de2*Exp(0.666*Ln(Sigma_H/Sigma_Hp));
                  Metka:=2;
                  Goto 1;
                                           end;

                         {----------------------------}
                   {  Проверка по изгибным напряжениям   }
          If ((Sigma_F1 > Sigma_Fp1) or (Sigma_F2 > Sigma_Fp2)) then
            Begin
                if Betn > 0 then begin
                       IMn:=IMn+1;
                       Mn:=ms[IMn];
                       Metka:= 4;
                       Goto 1;
                                 End
                else begin
   if ( Mte*Sqrt(Sigma_F1/Sigma_Fp1)) > (Mte*Sqrt(Sigma_F2/Sigma_Fp2))
   then Mte:=Mte*Sqrt(Sigma_F1/Sigma_Fp1)
   else Mte:= Mte*Sqrt(Sigma_F2/Sigma_Fp2);
                      if (de2/Mte > Z2min) and (de1/Mte > Z1min ) then
                      begin
                          z2:=Round(de2/Mte);
                          z1:=Round(de1/Mte);
                          Metka := 3;
                          Goto 1;
                      end
                      else begin
                         de2:= Mte* z2;
                         de1:= Mte* z1;
                         Metka := 5;
                         Goto 1;
                           end;
                       end;
            End;
     If ((Sigma_Fmax1 > Sigma_Fpmax1) or (Sigma_Fmax2 > Sigma_Fpmax2)) then
            Begin
               if Betn > 0 then begin
                       IMn:=IMn+1;
                       Mn:=ms[IMn];
                       Metka:= 4;
                       Goto 1;
                                 End
                else begin
     if ( Mte*Sqrt(Sigma_F1/Sigma_Fp1)) > (Mte*Sqrt(Sigma_F2/Sigma_Fp2))
      then Mte:=Mte*Sqrt(Sigma_F1/Sigma_Fp1)
      else Mte:= Mte*Sqrt(Sigma_F2/Sigma_Fp2);
                  if (de2/Mte > Z2min) and (de1/Mte > Z1min ) then
                      begin
                          z2:=Round(de2/Mte);
                          z1:=Round(de1/Mte);
                          Metka := 3;
                          Goto 1;
                      end
                      else begin
                         de2:= Mte* z2;
                         de1:= Mte* z1;
                         Metka := 5;
                         Goto 1;
                           end;
                       end;
            End;
                        {  Расчет усилий   }
             PzubC8;
                      {  Расчет размеров }
             PzubKon3;
                          {  Расчет качественных показателей  }

             PzubKon4;
             If Error <> 0 then Exit;
                      {  Расчет массы колес  }
                dv2:= Exp(0.333*Ln(T2/5))*10;
        Massa1:=Pi*0.25*(dm1*dm1*B+0.54*B*(dm2*dm2+dv2*dv2))*1.E-6*7.81;
        Massa2:=Pi*0.25*(dm1*dm1*B+B*(dm2*dm2+dv2*dv2))*1.E-6*7.81;
                Massa:= Min3(Massa1,Massa2,Massa2);
                  {  Расчет объема, занимаемого передачей}
               V_p:=Pi*sqr(dae2)*dae1/(4*1.E6);   {в  куб. дециметрах}

      END;   { Конец процедуры Expandata}
END.