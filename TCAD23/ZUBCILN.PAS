
      PROGRAM ZubCilprov;
              { Проверка работоспособности цилиндрических зубчатых передач   }
         Uses CRT,   Math;
                     { Описание переменных  }
                     {----------------------}
    Var

                     { Исходные  данные     }
    P1,                      {Мощность, передаваемая быстроходным валом}
    n1,                      {Частота вращения быстроходного вала}
    Lh:integer;              {Расчетный ресурс передачи}
                    {Параметры передачи и колес }
    Mn ,                     { модуль зацепления}
    aw : real;               { межосевое расстояние}
    B1,
    b2:byte;                 {ширина венца}
    kanavka: byte;    {Для шевронных колес при наличии канавки = 1,
                                           при отсутствии канавки = 0 }
    Tipz:byte;        {тип зубьев колес: 1 - прямые
                                         2 - косые
                                         2 - шевронные
                                         0 - автовыбор}
    betg:real;        {угол наклона зуба в градусах;
                                    при Tipz= 0 становится варьируемым
                                    параметром со знчениями 0, 10, 25 }
    x1,  x2:real;            {Коэффициент смещения исходного контура}
    z1, z2 : byte;           {Числа зубьев}
    St : integer;            {Степень точности}
    Zw : byte;               {Число потоков мощности}
                     {   Материалы колес   }
    mc1:string[40];   {марка стали для шестерни}   {????????????????}
    mc2:string[40];   {марка стали для колеса}     {??????????????????}
    Sigma_t1,         {Предел текучести материала шестерни}
    Sigma_t2,         {Предел текучести материала колеса}
    Sigma_Flim01,     {Предел выносливости по изгибу для шестерни}
    Sigma_Flim02,     {Предел выносливости по изгибу для колеса}
    Sigma_Fst01,      {Предельное напряжение для шестерни}
    Sigma_Fst02: real; {Предельное напряжение для колеса}
    Termobr1,         {термообработка зуба шестерни, номер}
    Termobr2:byte;    {термообработка зуба колеса, номер}
                      { Termobr = 1
                                = 2
                                = 3
                                = 4
                                = 5
                                = 6}
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
                     {  Особые требования   }
    Zagotowka:array[1..2] of byte;
                      {Способ получения заготовки шестерни и колеса
                         = 1 для поковок
                         = 2 для штамповок
                         = 3 для проката
                         = 4 для отливок  }
    Ra1,              {Шероховатость боковой поверхности зуба шестерни}
    Ra2:real;         {Шероховатость боковой поверхности зуба колеса
                        = при полировании зубьев
                          при шлифовании зубьев
                          при чистовом зубофрезеровании}
    Wikrugka:array[1..2] of byte;
                      {Финишная обработка выкружки зуба
                        = 0 выкружка зубофрезерована или шлифована
                        = 1 при полировании выкружки}

    Ra:real;          {Шероховатость рабочих поверхностей зубьев}
    motw :Array [1..2] of char; {Выбор инструмента: при нарезании долбяком = "Y",
                                         при нарезании фрезой  = "N" }
    nowizna: byte;    {ПРи motw= "Y" -  степень изношенности долбяка
                             = 0 - нулЁвый
                             = 1 -  изношенный}

                   {   Условия работы и нагружения  }
    Nom_sx,           {Номер схемы расположения колес}
    Nagr,             {=1 для типового режима,
                       = 0 для циклограммы}
    rewers:byte;      {При реверсировании = 1;
                       без реверсирования = 0}
    Xp,               {Отношение пускового момента к номинальному}
                {--------------------------------------------------}
    Mu_H1,            {Нагрузочный к-т при расчете по контактным напряжениям}
    Mu_H2,            {Нагрузочный к-т при расчете по контактным напряжениям}
    Mu_F1,            {Нагрузочный к-т при расчете по изгибным напряжениям}
    Mu_F2,            {Нагрузочный к-т при расчете по изгибным напряжениям}
    Ka:real;          {Коэффициент внешней динамики}

    {--------------------------------------------------------------------------}


   Type tt1=array [1..45] of real; {rkc}

  Var           {Переменные б.д.материалов}
    fbd:file;
    Termobr,                 {термообработка, номер}
    K_ugler,                 {контроль углерода на поверхности, номер}
    H_HRCp,                  {средняя твердость поверхности}
    H_HRCS,                  {средняя твердость сердцевины}
    Sigma_b,                 {предел временного сопротивления}
    Sigma_t,                 {предел текучести}
    Sigma_Flim0,             {предел изгибной выносливости}
    Sigma_Fst0:integer;      {базовое предельное напряжение при изгибе}
    S_F,                     {козффициент запаса прочности}
    Y_g,                     {козффициент шлифовки выкружки}
    Y_ds,                    {козффициент деформационного упрочнения}
    Y_d:real;                {козффициент злектрохимической обработки}
    mc:string[40];               {марка стали}
                    {-----------------}
                 {Переменные б.д.долбяков}

    m:real;                          {модуль}
    da0,
    db0,
    d0,
    x0 : array [1..2] of real;
    fail:text;
    alfat:real;              {угол профиля зуба в торцевом сечении}
    d:array[1..2] of real;    {массив делительных диаметров}
                   {---------------------}
    i,
    q_f,                     {Показатель наклона кривой усталости}
    TipZp :byte;             { Тип зубчатой передачи:
                              = 1 - передача с цилиндрическими колесами
                              = 2 - передача с коническими крлесами }
    bet ,                     {Угол наклона зуба в радианах}
    betb,                     {угол наклона зуба на основной окружности}
    Epsia:real;               {К-т торцевого перекрытия}
    Epsias,                   {Суммарный коэффициент смещения }
    Eps_bet: real;            {Коэффициент осевого перекрытия  }
    San,                      {Нормальная толщина зуба по диаметру вершин}
    San_dop,                  {Допустиме значение для ширины Sna }
    da,                       {массив диаметров вершин}
    df:array [1..2] of real;  {диаметры окружностей впадин}
 {=====переменные модулей расчета допускаемых и фактических напряжений ========}

    Sigma_Hmax,               {Максимальное контактное напряжение }
    Sigma_F,                  {Напряжения изгиба }
    Sigma_Fmax1,Sigma_Fmax2,  {Максимальные напряжения изгиба }
    Sigma_Hp1,Sigma_Hp2,      {Допускаемые контактные напряжения }
    Sigma_Fp,                 {Допускаемые напряжения изгиба }
    Sigma_Fpmax1,Sigma_Fpmax2,{Допускаемые пиковые напряжения изгиба }
    Sigma_Hpmax,              {Допускаемое пиковое контактное напряжение }
    Sigma_Hpmax1,Sigma_Hpmax2,
    Sigma_Hlim1,              {Пределы контактной выносливости }
    Sigma_Hlim2 :real;
                            {----------------}
    Type stro = string[13];
    Var
    xs,                       {Суммарный коэффициент смещения}
    Xsmin,                    {Минимальное значение суммарного
                               коэффициента смещения}
    x1min,x2min,              {минимальные значения к-тов смещения
                               шестерни и колеса}
    xmax,                     {наибольший возможный к-т смещения}
    tet1,tet2,                {удельное скольжение на шестерни и колесе}
    f,                        {Обобщенный критерий оптимизации}
    a: real;                  {делительное межосевое расстояние}
    xmin,                     {минимально возможный к-т смещения
                               по условию подрезания}
    sa:array[1..2] of real;   {относительная толщина вершины зуба}
    zs,                       {суммарное число зубьев}
    z1min,
    zmin: byte;               {Минимальные значения чисел
                               зубьев шестерни}
                          {-------------------}
             {  Выводные параметры минимальный набор}
    { Марки сталей для шестерни и колеса Mc1, Mc2 }
    {Твердости боковых поверхностей зубьев шестерни и колеса }
    {Твердости сердцевины зубьев шестерни и колеса}

    Da1, Da2,                {Диаметр окружности вершин }
    d1,  d2,                 {Делительный диаметр}
    Izn,                     {Показатель износостойкости}

               {Дополнительно при полном  выводном протоколе}
    alfatw:Real;             {угол зацепления зубчатых колес}
               {Кинематические параметры}
    Uf,                      {Фактическое передаточное число передачи}
   { n1,                      Частота вращения шестерни}
    n2 : real;               {Частота вращения колеса}
    V : real;                 { Скорость, м/с}
               { Геометрические размеры колес  }
    Dw1,                      {Начальный диаметр }
    Df1,                      {Диаметр окружности впадин }
    Db1,                      {Основной диаметр }
    Dw2,                      {Начальный диаметр }
    Df2,                      {Диаметр окружности впадин }
    Db2 : real;               { Основной диаметр}
               {Прочностные параметры     }
    Sigma_H,                  {Контактное напряжение }
    Sigma_F1,                 {Напряжения изгиба в зубе шестерни}
    Sigma_F2,                 {Напряжения изгиба в зубе колеса}
    Sigma_Fp1,
    Sigma_Fp2,               {Допускаемые напряжения изгиба }
    Sigma_Hp :real;          {Допускаемое контактное напряжение}
               {  Силовые параметры  }
    T1,                     {Момент, передаваемый быстроходным валом}
    T2,                     {Момент, передаваемый тихоходным валом}
    Ft1,                      { Окружное усилие   }
    Fr1,                      {Радиальное усилие}
    Fx1,                      {Осевое усилие  }
    Ft2,                      { Окружное усилие}
    Fr2,                      { Радиальное усилие}
    Fx2 : real;               { Осевое усилие}
              { Показатели качества   }
    Sna1,                     {Нормальная толщина зуба на диаметре вершин}
    Sna2: real;               {Нормальная толщина зуба на диаметре вершин}
    rol,                      {радиус кривизны профиля зуба в граничной
                               точке}
    rop:Array [1..2]of real;  {массив радиусов кривизны профиля зуба
                              в начале активного участка}
    flagError,
    J : word;
    Error : Array [1..18] of word;
    X_s,
    U : real;
    {-------------------------------------------------------------------}
               {   Процедура проверки работоспособности передачи }
     PROCEDURE ExpanData ;
                 {                                            }
           Var   I,  Tipp  : byte;
              H_l, dv2, Ro_f, Alfa, Epsia1, Epsia2, Za, K_HB,
              Sigma_Hlimb1, Sigma_Hlimb2,
              inwAt,inwAtw , bw,
                     {Параметры исходного контура}
              ha, hl, rof, c_ : real;
                       {--------------------------}
              Z_min, Z1_ : byte;
              xx:Array [1..2] of real;

                     { Параметры долбяка }
             aw0, betaa0, roa0, sn0, alfatw0, alfaa0 : real;
             { Переменные для расчета коэффициентов смещения}
             z0,
             z:array[1..2] of integer;
             x, alfaa, dww, db, roa, alfaat, x11, x22:array[1..2] of real;
     {---------------------------------------------------------------------}
          {     Расчет допускаемых напряжений          }
       PROCEDURE PzubC2;
              Var c1 : real;
          { Процедура расчета допускаемых контактных напряжений }
  PROCEDURE PrSigHp (Da,Mn,N,Mu_H,H_HBp,H_HRcp,H_HVp,Ra:real; Lh:integer;
                    Termobr,Zw: byte; var Sigma_Hlimb,Sigma_Hp :real);

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
              Sigma_Hp := Sigma_Hlim * Zn * Zr * 0.9/ Sh
      else begin
            if Da <= 700 then Zx := 1 else Zx := Sqrt(1.07 - 0.0001 * Da);
            v := Pi * ( Da - 2 * Mn) * N / 60000 ;
            if H_HBp <= 350 then Zv := 0.85 *Exp(0.1*Ln(v))
            else Zv := 0.925 * Exp(0.05*Ln(v));
           Sigma_Hp := Sigma_Hlim * Zn * Zr * Zv * Zx / Sh
           End;
      END;
            {   Расчет допускаемых изгибных напряжений       }
     PROCEDURE PrSigFp (DA,Mn,Mu_f,N,S_f,Yd,Yg:real; Lh:integer;
                       H_HBp,Sigma_Flim0:real; Rewers,Termobr,Zagotowka,
                       Wikrugka,Zw:byte; var Sigma_Fp:real );
     var  Yx,Yr,Yn,Y_delta,Yz,N_sum,N_Fe,Sigma_Flim,Ya,q_F : real;
         BEGIN
            Case Wikrugka of
                 0 : Yr := 1;
                 1 : Yr := 1.05;
                 2 : Yr := 1.2;
            end;
            N_sum := 60 * N * Lh * Zw;
            N_Fe := Mu_F * N_sum;
              if (Wikrugka =0) and ( H_HBp > 350 )  then q_F := 9
              else   q_F := 6;
            If  N_Fe > 4E6 then Yn := 1
            else Yn := Exp(q_f*Ln(4E6 / N_Fe ));
            if ((q_F = 6) and (Yn > 4)) then Yn := 4;
            if ((q_f = 9) and (Yn > 2.5)) then Yn := 2.5;
            If Rewers = 0 then Ya := 1
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
                     1,2 : Yz := 1;
                       3 : Yz := 0.9;
                       4 : Yz := 0.8
               end;
               S_Fst := Yz * 1.75;
               Yx := 1.05 - 0.000125 * Da;
               Sigma_FPmax := Sigma_Fst0 * Yx / S_Fst
            END;
        BEGIN
        If TipZp = 1  then c1:=1.23 else c1:=1.15;
 PrSigHp (Da1,Mn,N1,Mu_H1,H_HBp1,H_HRcp1,H_HVp1,Ra1,Lh,Termobr1,Zw,
          Sigma_Hlimb1,Sigma_Hp1);
            N2 := N1 /U;
 PrSigHp (Da2,Mn,N2,Mu_H2,H_HBp2,H_HRcp2,H_HVp2,Ra2,lh,Termobr2,Zw,
          Sigma_Hlimb2,Sigma_Hp2);
          If Bet = 0 then Sigma_Hp:= Min3(Sigma_Hp1,Sigma_Hp2,Sigma_Hp2)
          else begin
 if 0.45*(Sigma_Hp1 + Sigma_Hp2) > c1*Min3(Sigma_Hp1,Sigma_Hp2,Sigma_Hp2)
      then Sigma_Hp := c1*Min3(Sigma_Hp1,Sigma_Hp2,Sigma_Hp2)
else Sigma_Hp := 0.45 * ( Sigma_Hp1 + Sigma_Hp2);
               end;
     PrSigFp (Da1,Mn,Mu_f1,N1,S_f1,Y_d1,Y_g1,Lh,H_HBp1,Sigma_Flim01,Rewers,
             Termobr1,Zagotowka[1],Wikrugka[1],Zw,Sigma_Fp1);
     PrSigFp (Da2,Mn,Mu_f2,N2,S_f2,Y_d2,Y_g2,Lh,H_HBp2,Sigma_Flim02,Rewers,
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
             {   Процедура определения угла по инволюте  }
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
              {                                                    }
           Procedure Ppe6;
            Var v0,d,xmind,t, vat :real;
            Begin
              if ((motw[i]='N') or (motw[i]='y')) Then
              Begin
                 z0[i]:=0; da0[i]:=0; x0[i]:=0; db0[i]:=0;
                 d:=m*z[i]/Cos(bet);
                rol[i]:=0.5*d*Sin(alfat)/Cos(bet)-(1-xx[i])*m/Sin(alfat);
                 xmin[i]:=1-0.5*z[i]*Sqr(Sin(alfat))/Cos(bet);
              End;
              if ((motw[i]='Y') or (motw[i]='y')) then
              Begin
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

           {---------------------------------------------------------}
            {             Расчет коэффициентов смещения   Х1 и Х2     }
       PROCEDURE PzubC4p;
            {                                                        }
               var Alfaa0,Alfatw0,InwAtw,invAtw0,inwAt,xx1,xx2: real;
                   Alfaat1:Array [1..2] of real;
                   xx:Array [1..2] of real;
                   k : byte;
                   cm : real;
            {========Проверка осуществимости передачи=============================}
        Function Ppe2:boolean;
                Var hg,xsmin,vaat,beta, Alfat,vat, betb, dely,x1min,
                    x2min, Epsia, Epsias :real;
                    i : byte;
                    H_HBp:array [1..2] of integer;
                    d, da,db,rop,rol, xmin:array[1..2] of real;
      {========Определение радиуса кривизны переходной поверхности=========}

                Begin
                    Alfat:=ArcTan(0.364/Cos(bet));
                  vat:=Tan(alfat)-Alfat;
                  Betb:=ArcSin(0.9397*Sin(bet));
                  hg:=0.45;
                  dely:=xs-(aw-a)/Mn;
                  xx[1]:=x1;
                  xx[2]:=x2;
                  z[1]:=z1;
                  z[2]:=z2;
                  H_HBp[1] := H_HBp1;
                  H_HBp[2] := H_HBp2;
                  {проверка величины к-та суммарного смещения}
                 xsmin:=-vat*(z1+z2)/0.728;
                if xs-xsmin < 0 Then
                Begin
                   Ppe2:=False;
                   Exit;
                End;
            For i:=1 To 2 Do
            Begin
                    {проверка заострения зуба на диаметре вершин}
               d[i]:= Mn*z[i]/Cos(bet);
               da[i]:=d[i]+2*Mn*(ha+xx[i]-dely);
               beta:=ArcTan(da[i]*Tan(bet)/d[i]);
               db[i]:=d[i]*Cos(alfat);
             if da[i] < db[i] Then
             Begin
                  Ppe2:=False;
                  Exit;
             End;
              alfaat1[i]:=ArcCos(db[i]/da[i]);
              vaat:=Tan(alfaat1[i])-alfaat1[i];
              sa[i]:=da[i]*((Pi/2+0.728*xx[i])/z[i]+vat-vaat)/Mn*Cos(beta);
            if H_HBp[i] < 350 Then
            Begin
              if sa[i] < 0.4 Then
              Begin
                Ppe2:=False;
                Exit;
              End;
            End
            Else
              if sa[i] < 0.25 Then
              Begin
                Ppe2:=False;
                Exit;
              End;
                     {проверка подрезания ножки зуба}
              Ppe6;
             if xx[i]-xmin[i] < 0 Then
             Begin
               Ppe2:=False;
               Exit;
             End;
                     {проверка соотношения da и db}
             if (da[i]-db[i])/(2*Mn) < 0 Then
             Begin
               Ppe2:=False;
               Exit;
             End;
          {проверка черезмерного срезания головки зуба ножкой  долбяка}
            if z0[i] <> 0 Then
            Begin
               Beta:=ArcTan(da[i]*Sin(bet)/(d[i]*Cos(bet)));
      if (Sqrt(Sqr(db[i]) + Sqr(2*aw0*Sin(alfatw0)))+hg*Mn/Cos(beta)-da[i])
          < 0 Then
      Begin
          Ppe2:=False;
          Exit;
      End;
             End;
            End;
          {Проверка к-та перекрытия}
  epsia:=(z1*(Tan(alfaat1[1])-Tan(alfatw))+z2*(Tan(alfaat1[2])-Tan(alfatw)))
   /(2*Pi);
          epsias:=epsia;
           if bet > 0 Then epsias:=epsia+bw*Sin(bet)/Pi/Mn;
           if epsias < 1.2 Then
           Begin
              Ppe2:=False;
              Exit;
           End;
                       {проверка интерференции}
          rop[1]:=aw*Sin(alfatw)-0.5*Sqrt(da[2]*da[2]-db[2]*db[2]);
          rop[2]:=aw*Sin(alfatw)-0.5*Sqrt(da[1]*da[1]-db[1]*db[1]);
         if rop[1]-rol[1] < 0 Then
         Begin
           Ppe2:=False;
           Exit;
         End;
         if rop[2]-rol[2] < 0 Then
         Begin
              Ppe2:=False;
              Exit;
         End;
          x1min:=xmin[1];
          x2min:=xmin[2];
                    {удельное скольжение}
          tet2:=Tan(alfatw);
tet1:=-(z2/z1+1)*(Tan(alfaat1[2])-tet2)/(tet2-z2*(Tan(alfaat1[1])-tet2)/z1);
tet2:=-(z2/z1+1)*(Tan(alfaat1[1])-tet2)/(z2*tet2/z1-(Tan(alfaat1[1])-tet2));
 End;

{  ==============Расчет обобщенного критерия оптимизации====================}
     Procedure Ppe14;
             Var cr:array [1..3] of real;
                j:integer;
                   {------------------------------}
             Begin
                cr[1]:=-epsias;
                cr[2]:=-alfatw;
                cr[3]:=Abs(tet2-tet1);

               f:=0;
             For j:=1 To 3 Do f:=f+cr[j];
            End;
                {------------------------------------------------------}
         BEGIN

{                Alfat:= ArcTan(0.364 /Cos(Bet));
                if Bet=0 then Zmin:=17
                else Zmin:= Round (2*cos(Bet)/sqr(sin(alfat)));
                AlfatW:=Alfat;
                  { Проверка межосевого расстояния  }
{                A:= Mn*(z1+z2)/(2*Cos(Bet));}
{          if not (abs(Aw-A) > 1.E-5) then
           begin     }
                     {      Проверка подрезания         }
     {          If z1 < Zmin then
                Begin
                      If ((motw[1]='N') or (motw[1]='n')) then
                       if Bet=0 then
                          x1min:=1-z1*sqr(0.342)/2
                       else
                          x1min:=1-z1/(2*cos(Bet))*(sqr(cos(Bet)/0.364)+1);
                end;
                    If ((motw[1]='Y') or (motw[1]='y')) then
                    begin
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
                  begin
                            Error := 6;
                            Exit;
                  end
                  else
                  begin
                     x1:=0;
                     x2:=0;
                     Alfatw := Alfat;
                   end;
             end
             Else
             begin
                if A < Aw*1.024 then
                begin
                    Alfatw:=ArcCos(0.5*Mn*(z1+z2)*cos(Alfat)/Aw);
                    inwAtw:=Tan(Alfatw)-Alfatw;
                    inwAt:=Tan(Alfat)-Alfat;
                    Xs:=(inwAtw-inwAt)*(z1+z2)/0.728;
                end;
             end;   }
                    x1:=-1;
                    xx1:=-2;
                    Cm := 1.E10;
              For k:=1 to 101 Do
              BEGIN
                    x2:=Xs-x1;
                    if  PPe2 then
                    begin
                       PPe14;
                       if xx1=-2 then
                       begin
                          xx1:=x1;
                          xx2:=x2;
                          Cm := f;
                       end;
                       if cm > f then
                       begin
                              xx1:=x1;
                              xx2:=x2;
                              Cm:=f;
                       end;
                    End;
                    x1:=x1 + 0.03;
              End;
                   if xx1 >-2 then
                   begin
                      x1:=xx1;
                      x2:=xx2;
                      f:=Cm;
                   end;
         END;    {     Конец PzubC4p      }
       {--------------------------------------------------------------}
                 { Проверка осуществимости передачи }
        FUNCTION PzubC9 : boolean;
            {                                                        }
               var Alfaa0,Alfatw0,InwAtw,invAtw0,inwAt,inwAta1,xx1,xx2: real;
                   Alfaat1:Array [1..2] of real;
                   hg,xsmin,vaat,beta, Alfat,vat, betb, dely,x1min,
                    x2min, Epsia, Epsias :real;
                    i : byte;
                    H_HBp:array [1..2] of integer;
                    d, da,db,rop,rol, xmin:array[1..2] of real;
      Begin
                  xx[1]:=x1;
                  xx[2]:=x2;
                  z[1]:=z1;
                  z[2]:=z2;
                  H_HBp[1] := H_HBp1;
                  H_HBp[2] := H_HBp2;
                  {проверка величины к-та суммарного смещения}
                 xsmin:=-inwAt*(z1+z2)/0.728;
                if xs-xsmin < 0 Then Error [16] := 1;
            For i:=1 To 2 Do
            Begin
                    {проверка заострения зуба на диаметре вершин}
               d[i]:= Mn*z[i]/Cos(bet);
               da[i]:=d[i]+2*Mn*(ha+xx[i]-dely);
               beta:=ArcTan(da[i]*Tan(bet)/d[i]);
               db[i]:=d[i]*Cos(alfat);
             if da[i] < db[i] Then
               case I of
                 1 : Error [14] := 1;
                 2 : Error [15] := 1;
               End;
              alfaat1[i]:=ArcCos(db[i]/da[i]);
              inwAta1:=Tan(alfaat1[i])-alfaat1[i];
              san[i]:=da[i]*((Pi/2+0.728*xx[i])/z[i]+inwAt-inwAta1)/Cos(beta);
            if H_HBp[i] < 350 Then San_dop [i] := 0.4*Mn
            else
                San_dop [i] := 0.25*Mn;
              if san[i] < San_dop[i] then
              case i of
                1 : Error [12] := 1;
                2 : Error [13] := 1;
              End;
                     {проверка подрезания ножки зуба}
              Ppe6;
             if xx[i]-xmin[i] < 0 Then
             case i of
               1 : Error [7] := 1;
               2 : Error [8] := 1;
             End;
          {проверка черезмерного срезания головки зуба ножкой  долбяка}
            if z0[i] <> 0 Then
            Begin
               Beta:=ArcTan(da[i]*Sin(bet)/(d[i]*Cos(bet)));
      if (Sqrt(Sqr(db[i]) + Sqr(2*aw0*Sin(alfatw0)))+hg*Mn/Cos(beta)-da[i])
          < 0 Then   case i of
                 1 : Error [17] := 1;
                 2 : Error [18] := 1;
                     End;
             End;
            End;
                {Проверка к-та перекрытия}
  epsia:=(z1*(Tan(alfaat1[1])-Tan(alfatw))+z2*(Tan(alfaat1[2])-Tan(alfatw)))
   /(2*Pi);
          epsias:=epsia;
           if bet > 0 Then epsias:=epsia+bw*Sin(bet)/Pi/Mn;
           if epsias < 1.2 Then
                Error [11] := 1;
                       {проверка интерференции}
          rop[1]:=aw*Sin(alfatw)-0.5*Sqrt(da[2]*da[2]-db[2]*db[2]);
          rop[2]:=aw*Sin(alfatw)-0.5*Sqrt(da[1]*da[1]-db[1]*db[1]);
         if rop[1]-rol[1] < 0 Then
                Error [10] := 1;
         if rop[2]-rol[2] < 0 Then
                Error [9] := 1;
          x1min:=xmin[1];
          x2min:=xmin[2];
                    {удельное скольжение}
          tet2:=Tan(alfatw);
tet1:=-(z2/z1+1)*(Tan(alfaat1[2])-tet2)/(tet2-z2*(Tan(alfaat1[1])-tet2)/z1);
tet2:=-(z2/z1+1)*(Tan(alfaat1[1])-tet2)/(z2*tet2/z1-(Tan(alfaat1[1])-tet2));
         END;    {     Конец PzubC9      }

{-------------------------- РАСЧЕТ НАПРЯЖЕНИЙ В ЗУБЬЯХ----------------------}
     PROCEDURE PzubC5;

          Type TT1=array[1..5,1..7] of real;
          Var C_gama, C_prim,  f_pb, K_Hv, K_Hbeta, K_Halfa, g0,
              Epsia1, Epsia2,Z_v1,Z_v2, n_alfa, n_beta, y_alfa : real;
              kanavka : byte;


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

       Var Delta_H, W_Hv, F_beta, Bk, a_beta, f_ky, f_kz, K_Hw, Y_a,
           f_pb_1, f_pb_2, a_alfa,  K_H, Z_eps, Z_H, Sigma_H0,
            Alfaa1, Alfaa2, Gamma_sig, Bwl, eps_betbet, y_betb,
            y_alfa1, y_alfa2, y_alfamax, Y_betb1,
            Y_betb2, Y_betbmax, psi_lm, l_k, K_epsi, epsilon,  a_n,
            K_epsbet, K_Hbeta1, K_Hbeta2,Ft  :real;
           I,I1,I_pb_v,I_pb_g:integer;

       BEGIN
       {расчет K_Hv}
        if betg = 0 Then
        Begin
            Z_v1:=z1;
            Z_v2:=z2;
        End
        Else
        Begin
            Z_v1:=Z1/Exp(3*Ln(Cos(bet)));
            Z_v2:=Z2/Exp(3*Ln(Cos(bet)));
        End;
        d1:=z1*Mn/Cos(Bet);
        d2:=z2*Mn/Cos(Bet);
        bw:=B2;
        if TipZ = 3 then Bw := B2 - Bk;
        Ft:=2000*T1/d1;
        V:=pi*d1*n1/60000;
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
            if d1<=f_pb_g[i] then
            begin
                I_pb_v:=i;
                goto 2
            end;
      2: for i:=1 to 5 do
            if Mn<=f_pb_v[i] then
            begin
                I_pb_g:=i;
                goto 3
            end;
      3: case St of
          6: f_pb_1:=f_pb_6[I_pb_g,I_pb_v];
          7: f_pb_1:=f_pb_7[I_pb_g,I_pb_v];
          8: f_pb_1:=f_pb_8[I_pb_g,I_pb_v];
          9: f_pb_1:=f_pb_9[I_pb_g,I_pb_v];
         end;
         for i:=1 to 7 do
           if d2 <= f_pb_g[i] then
           begin
                I_pb_v:=i;
                goto 4
           end;
       4:case St of
          6: f_pb_2:=f_pb_6[I_pb_g,I_pb_v];
          7: f_pb_2:=f_pb_7[I_pb_g,I_pb_v];
          8: f_pb_2:=f_pb_8[I_pb_g,I_pb_v];
          9: f_pb_2:=f_pb_9[I_pb_g,I_pb_v];
         end;
        if (H_HVp1>350) and (H_HVp2>350) then a_alfa:=0.3 else a_alfa:=0.2;
         f_pb:=a_alfa*sqrt(sqr(f_pb_1)+sqr(f_pb_2));
         C_gama:=C_prim*(0.75*epsia+0.25);
         Alfaa1:=ArcCos(Mn*z1/Cos(Bet)*Cos(Alfat)/Da1);
         Alfaa2:=ArcCos(Mn*z2/Cos(Bet)*Cos(Alfat)/Da2);
         Epsia1:=z1*(Tan(Alfaa1)-Tan(Alfatw))/(2*Pi);
         Epsia2:=z2*(Tan(Alfaa2)-Tan(Alfatw))/(2*Pi);
         Epsia:= Epsia1 + Epsia2;
         Case TipZ of
            1 : Eps_Bet := 0;
            2 : Eps_bet:=B2*Sin(bet)/(Pi*Mn);
            3 : Eps_Bet:=0.5 *B2*Sin(Bet)/(Pi*Mn);
         End;
          EpsIas:=Epsia + Eps_Bet ;
                   if Bet > 0 then
                   begin
                     if Eps_bet <1 then
                       Z_eps:=sqrt((4-epsia)*(1-Eps_bet)/3+Eps_bet/(epsia))
                     else Z_eps:=sqrt(1/epsia);
                   end
                   else  Z_eps:=Exp(0.5*Ln((4-epsia)/3));
 C_prim:=1/(0.05139+0.1425/Z_v1+0.186/Z_v2-0.1027*X1/Z_v1-0.01*x1+0.00455*X2+
  0.3762*X2/Z_v2+0.00734*sqr(X1)-0.00054*sqr(X2));
         if Betg=0 then K_Halfa:=1
         else
         begin
           n_alfa := Epsia - Trunc(Epsia);
           n_beta :=  Eps_bet - Trunc(Eps_bet);
             if H_HVp1>350  then
             begin
                 Y_alfa1:=0.075*f_pb_1;
                 if Y_alfa1 > 3 then Y_alfa1 := 3;
             end
             else
             begin
                 Y_alfa1 := 160*f_pb_1 / Sigma_Hlimb1;
                 if v >= 5 then Y_alfamax := 12800 / Sigma_Hlimb1;
                 if v >= 10 then Y_alfamax := 6400 / Sigma_Hlimb1;
                 if v >= 5 then
                 if Y_alfa1 > Y_alfamax then Y_alfa1 := Y_alfamax;
              end;
         if H_HVp2>350  then
         begin
                 Y_alfa2:=0.075*f_pb_2;
                 if Y_alfa2 > 3 then Y_alfa2 := 3;
         end
         else
         begin
                Y_alfa2 := 160*f_pb_2 / Sigma_Hlimb2;
                if v >= 5 then Y_alfamax := 12800 / Sigma_Hlimb2;
                if v >= 10 then Y_alfamax := 6400 / Sigma_Hlimb2;
                if v >= 5 then
                  if Y_alfa2 > Y_alfamax then Y_alfa2 := Y_alfamax;
         end;
           Y_alfa := (Y_alfa1 + Y_alfa2 )/ 2;
             if (n_alfa + n_beta) <= 1 then
                  K_epsi:= 1-  n_alfa*n_beta/(Epsia*Eps_bet)
             else K_epsi := 1 - (1 -n_alfa)*(1 - n_beta)/(Epsia*Eps_bet);
           if Eps_bet <= Epsia then
 K_Halfa:=(0.9+Cos(Alfat)*Cos(bet)*C_prim*bw*(f_pb- y_alfa)/
 (Ft*Ka*K_Hv)*(K_epsi*Epsia-1))/(K_epsi*Epsia)
          else
  K_Halfa:=(0.9+Cos(Alfat)*Cos(bet)*C_prim*bw*(f_pb- y_alfa)/(Ft*Ka*K_Hv)*
(Epsia-Epsia/Eps_bet))/Eps_bet;
           End;
          If K_Halfa > 1 then K_Halfa := 1;
                     {--------------------------}
                      {    расчет K_Hbeta        }
        K_Hbeta := K_HB;
            {--------------------------------------------}
         K_H:=K_Hv*K_Hbeta*K_Halfa;
         Z_H:=1/cos(Alfatw)*sqrt(2*cos(Betb)/tan(Alfatw));
         bw:=B2;
         Sigma_H0:=190*Z_H*Z_eps*sqrt(2000*T1*(U+1)/(bw*sqr(d1)*U));
         Sigma_H:=Sigma_H0*sqrt(K_H) ;
         Sigma_Hmax:=Sigma_H*Sqrt(Ka);

         {конец процедуры расчета контактных напряжений}
    END;
{------------------ Расчет изгибных напряжений -----------------------------}
   Procedure PrSigF( z :integer; x:real; var Sigma_F,Sigma_Fmax:real);
         Var Y_epsilon,Y_beta,Y_Fs,K_Falfa,h,N_F,K_Fbeta,Delta_F,W_Fv,
             K_epsbet, K_F,K_Fv, Z_v,l_k,Psi_lm,Ft :real;
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
      else
      begin
            n_alfa := Epsia - Trunc(Epsia);
            n_beta := Eps_bet - Trunc(Eps_bet);
           if Eps_bet <= Epsia then
           begin
               if n_alfa < n_beta then
                    K_epsbet:= ( n_alfa- n_alfa*n_beta)/Eps_bet
               else K_epsbet:= ( n_beta- n_alfa*n_beta)/Eps_bet;
 K_Falfa:=(0.9+Cos(Alfat)*Cos(bet)*C_prim*bw*(f_pb-y_alfa)/(Ft*Ka*K_Hv*K_Hbeta)*
 (Epsia -1+K_epsbet))/(Epsia + K_epsbet);
           End
           else  K_Falfa:=K_Halfa;
       End;
                    {---------------------}
     If Eps_bet <= Epsia then l_k := bw/Cos(betb)
     else l_k := bw*Epsia/(Eps_bet*Cos(betb));
     Psi_lm := l_k /Mn;
     K_Fbeta:=0.95 + (1 -1.4/Psi_lm)/(1+1.4/Psi_lm)*(K_Hbeta -1);
                     {-----------------------}
    if Betg=0 then Delta_F:=0.16 else Delta_F:=0.06;
    W_Fv:=Delta_F*g0*v*sqrt(Aw/u);
    K_Fv:=1+W_Fv*bw/(Ft*Ka);
                    {-------------------------}
    K_F:=K_Fv*K_Fbeta*K_Falfa;
    Sigma_F:=Ft*K_F*Y_Fs*Y_beta*Y_epsilon/(bw*Mn);
    Sigma_Fmax:=Sigma_F*Ka;
   END;

     {---------------------------------------------------------------}
       Begin
          PrSigH;
          PrSigF(Z1,x1,Sigma_F1,Sigma_Fmax1);
          PrSigF(Z2,x2,Sigma_F2,Sigma_Fmax2);
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
            dw1:=2*Aw/(u+1);
            dw2:=2*Aw-dw1;
            A:=0.5*(d1+d2);
            dely:=(x1+x2)-(Aw-A)/Mn;
            da1:= d1+2*Mn*(1+x1-dely);
            da2:= d2+2*Mn*(1+x2-dely);
            db1:=d1*Cos(Alfat);
            db2:=d2*Cos(Alfat);
            x[1]:=x1;
            x[2]:=x2;
            z[1]:=z1;
            z[2]:=z2;
          For i:=1 to 2 Do
          begin
             If ((motw[i]='N') or (motw[i]='n')) then
             begin
                df1:=d1-2*Mn*(1+c_-x1);
                df2:=d2-2*Mn*(1+c_-x2);
             End;
             If ((motw[i] ='Y') or (motw='y')) then
             begin
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
                Var  Gam_A, Gam_R : real;
          BEGIN

             If TipZp = 1 then
             begin
                   Ft1:= 2*T2*1000 / Dw2;
                   Ft2:= Ft1;
                   Fr1:= Ft2*Tan(Alfat);
                   Fr2:= Fr1;
                   Fx1:= Ft2*Tan(Bet);
             end;
          END;    {     Конец    PzubC8     }
      {------------------------------------------------------------------}
               {-------------------------------------}
          BEGIN
                {   Начало процедуры Expandata  }
                   {--------------------------}
                          {   Перевод твердостей      }
                    {   Из  HRc  в  HB      }
               If ((H_HRcs1 > 0) or (H_HRcs2 > 0 )) then
               begin
          If H_HRcs1 <= 30 then H_HBs1:=Round(220*Exp(0.665*Ln(H_HRcs1/20)))
          Else  H_HBs1:=Round(300*Exp(0.96*Ln(H_HRcs1/32.5)));
          If H_HRcs2 <= 30 then H_HBs2:=Round(220*Exp(0.665*Ln(H_HRcs2/20)))
          Else  H_HBs2:=Round(300*Exp(0.96*Ln(H_HRcs2/32.5)));
               end;
               If ((H_HRcp1 > 0) or (H_HRcp2 > 0 )) then
               begin
          If H_HRcp1 <= 30 then H_HBp1:=Round(220*Exp(0.665*Ln(H_HRcp1/20)))
          Else  H_HBp1:=Round(300*Exp(0.96*Ln(H_HRcp1/32.5)));
          If H_HRcp2 <= 30 then H_HBp2:=Round(220*Exp(0.665*Ln(H_HRcp2/20)))
          Else  H_HBp2:=Round(300*Exp(0.96*Ln(H_HRcp2/32.5)));
               End;
                    {    Из HB в HV         }
          If (( H_HBp1 > 0 ) or (H_HBp2 >0 )) then
          begin
              If ((H_HBp1<100) or (H_HBp2<100)) then
              begin
                 H_HVp1:=Round(0.13*sqr(H_HBp1));
                 H_HVp2:=Round(0.13*sqr(H_HBp2));
              end;
              if ((H_HBp1 > 100) and (H_HBp1 < 350 )) then H_HVp1:=H_HBp1;
              if ((H_HBp2 > 100) and (H_HBp2 < 350 )) then H_HVp2:=H_HBp2;
              if ((H_HBp1 >=350) and (H_HBp1 < 450 )) then
                 H_HVp1:=Round(350+(H_HBp1-350)*1.4);
              if ((H_HBp2 >=350) and (H_HBp2 < 450 )) then
                 H_HVp2:=Round(350+(H_HBp2-350)*1.4);
              if H_HBp1 > 450  then H_HVp1:=Round(450+(H_HBp1-450)*1.6);
              if H_HBp2 > 450  then H_HVp2:=Round(450+(H_HBp2-450)*1.6);
          End;
             {    Парметры исходного контура       }
              Ha:=1;
              c_:=0.25;
              H_l:=2;
              Ro_f:=0.38;
              Alfa:=Pi*20/180;

       {---------------------------------------------------------------}
             TipZp:=1;
                   {-------------------------------------------}
           Bet := Betg*Pi/180;
           Uf := z2 /z1;
           A := 0.5*Mn*(z1+z2)/Cos (Bet);
           T1 := P1 *30*1000/ (Pi*N1);
           T2 := T1 * Uf * 0.97;
             {   Проверка осуществимости передачи}
          Xs := x1+ x2;
          Alfat:= ArcTan(0.364/Cos(Bet));
          inwAt := Tan(Alfat) - Alfat;
          If aw <> 0 then
          begin
            Alfatw := ArcCos(A*Cos(Alfat)/Aw);
            inwAtw := Tan(Alfatw)- Alfatw;
            x_s := (inwAtw - inwAt)*(z1+z2)/0.728;
            if abs(x_s - Xs) > 0.001 then
            begin
              PzubC4p;
            end;
          end
          else
          begin
            inwAtw := 2*Xs*0.364/(z1+z2) + inwAt;
            Involuta (inwAtw, Alfatw);
            Aw := (z1+z2)*Mn*Cos(Alfat)/(2*Cos(Bet)*Cos(Alfatw));
          end;
          J:= 1;
      If PzubC9 then
      Begin
           { Размеры колес  }
              PzubC6;
           {  Расчет допускаемых напряжений  }
              PzubC2;
                 {  Расчет фактических напряжений  }
              PzubC5;
       {  Проверка условия: допускаемое напряжение больше фактического  }
                   {  Проверка по контактным напряжениям  }
             if Sigma_H > (1.03*Sigma_Hp) then
                     Error [1] := 1;
                        {---------------------------------------}
            if Sigma_Hmax > Sigma_Hpmax then
                     Error [2] := 1 ;
                         {----------------------------}
                   {  Проверка по изгибным напряжениям   }
           If Sigma_F1 > Sigma_Fp1 then
                     Error [3] :=1;
           If Sigma_F2 >  Sigma_Fp2 then
                     Error [4] :=1;
           If Sigma_Fmax1 > Sigma_Fpmax1 then
                     Error [5] := 1;
           If Sigma_Fmax2 > Sigma_Fpmax2 then
                     Error [6] := 1;
                      {  Расчет усилий   }
             PzubC8;
      End;
                  {   Вывод результатов счета     }
            Writeln
('----------------------------------------------------------------------------');
 Writeln
('  M  :  Aw  :  Bet : z :  x :   D    :   Da   : B :St:  P1   :Alfalw:Epsia');
 Writeln
('-----------------------------------------------------------------------------');
Writeln (Mn:5:2,'':1,Aw:6:1,'':1,Bet:6:3,'':1,z1:3,'':1,x1:4:2,'':1,dw1:8:3,
'':1,da1:8:3,'':1,Round(B1):3,'':1,St:2,'':1,Round(P1):7,'':1,Alfatw:6:3,'':1,
Epsia:5:3);
Writeln ('':19,z2:3,'':1,x2:4:2,'':1,dw2:8:3,'':1,da2:8:3,'':1,Round(B2):3);
    {-------------------------------------------------------------------}

                {-----------------------------------------}
    END;    {  Конец процедуры  ExpanData      }
              {-----------------------------------}
      Label 7;
                {   Начало основной программы  }
          BEGIN
             clrscr;
                          {    ВВод исходных данных      }
              P1 := 3;
              N1:=750;       { 1 .. 5000 об/мин }
              Mn := 4;
              Aw := 200;
              B1 := 65;
              B2 := 60;
              kanavka := 0;
              TipZ := 1;
              Betg := 0;
              x1 := 0;
              x2 := 0;
              z1 := 20;
              z2 := 40;
              zw := 1;
              H_HBp1:=0;     {0..350 }
              H_HBp2:=0;     {0 .. 350}
              H_HBs1:=300;   {0 .. 350}
              H_HBs2:=300;   { 0 .. 350}
              H_HRcp1:=48;   {35 .. 68}
              H_HRcp2:=45;   {35 .. 68}
              H_HRcs1:=0;
              H_HRcs2:=0;
              Sigma_t1:=800; {100 .. 2000 MПa}
              Sigma_t2:=800; {100 .. 2000 ЬПа}
              Sigma_Flim01:=460;  { 100 .. 1500 МПа}
              Sigma_Flim02:=381;  { 100 .. 1500 МПа}
              Sigma_Fst01:=1228;  { 100 .. 1500 МПа}
              Sigma_Fst02:=1017;  { 100 .. 1500 МПа}
              Termobr1:=3;        {1 .. 8 }
              Termobr2:=3;        {1 .. 8 }
              Lh:=6300;           {10 ... 100000 ч}
              Mu_H1:=1;
              Mu_H2:=1;
              Mu_F1:=1;
              Mu_F2:=1;
              Ka:=1.0;
              Xp:=2;
              Wikrugka[1]:=0;
              Wikrugka[2]:=0;
              Ra1:=2.5;
              Ra2:=2.5;
              TipZp:=1;
              Nagr:=0;
              Rewers:=0;
      {        Bistr:=1;}
              Zagotowka[1]:=2;
              Zagotowka[2]:=2;
              Nom_Sx:=3;
              S_f1:=1.75;
              S_f2:=1.75;
              Y_d1:=1;
              Y_d2:=1;
              Y_g1:=1;
              Y_g2:=1;
             {  Конец  ввода исходных данных      }
             For i:= 1 to 18 do
                 Error [i] := 0;
             flagError := 0;
                 {---------------------------------}
                  ExpanData ;
              {---------------------------------------------------}
              {    Вывести исходные данные            }
               For i :=1 to 18 do
                  If Error[i] <> 0 then
                  flagError := 1;
              If flagError = 1 then
              BEGIN
                 Writeln (' Передача не работоспособна по следующим причинам');
                 Case i of
   1 : Writeln ('Контактные напряжения больше допустимого значения');
   2 : Writeln ('Максимальные контактные напряжения больше допустимого значения');
   3 : Writeln ('Напряжения изгиба для зуба шестерни больше допустимого значения');
   4 : Writeln ('Напряжения изгиба для зуба колеса больше допустимого значения');
   5 : Writeln ('Максимальные напряжения изгиба для зуба шестерни больше допустимого значения');
   6 : Writeln ('Максимальные напряжения изгиба для зуба колеса больше допустимого значения');
   7 : Writeln ('Коэффициент смещения у шестерни меньше допустимого по условию непдрезания зуба');
   8 : Writeln ('Коэффициент смещения у колеса меньше допустимого по условию непдрезания зуба');
   9 : Writeln ('Имеет место интерферения зуба шестерни в зуб колеса');
  10 : Writeln ('Имеет место интерферения зуба колеса в зуб шестерни');
  11 : Writeln ('Торцевой коэффициент перекрытия меньше 1.2');
  12 : Writeln ('Ширина зуба шестерни по диаметру вершин меньше допустимой');
  13 : Writeln ('Ширина зуба колеса по диаметру вершин меньше допустимой');
  14 : Writeln ('Диаметр основной окружности шестерни больше диаметра окружности выступов');
  15 : Writeln ('Диаметр основной окружности колеса больше диаметра окружности выступов');
  16 : Writeln ('Суммарный коэффициент смещения меньше допустимого значения');
  17 : Writeln ('Ножка зуба долбяка срезает головку зуба шестерни');
  18 : Writeln ('Ножка зуба долбяка срезает головку зуба колеса');
                 end;
              end
          Else
               Writeln ( 'Передача работоспособна по всем показателям');
               {дальше вывод протокола}

           END.        {Конц программы }