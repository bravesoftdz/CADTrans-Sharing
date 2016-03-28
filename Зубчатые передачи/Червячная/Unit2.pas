unit Unit2;

interface

uses  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
System.Classes,Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
Vcl.ExtCtrls, Vcl.ComCtrls, TCAD.Math,constants,Materials;

Type
   TLoading = record
   GraphBar: word;
   x, y, z, i, j, k: single;
   end;
   tt1 = array [1 .. 45] of real;
   TSteelMark = string[23];
   TTwoWord = array [1 .. 2] of word;
   ArrayTermobr = array [1 .. 4] of byte;

  TParInput = record
//   Mu_H, Mu_f, c_, Ro, Alfa, dv1, dv2, Massa1, Massa2: real;
//  Metka, Imat1, Iq, IAw, IM, IVs: byte;
//  dp, Mr, K_Hbeta, K_Hbet: real;
  WheelMatID: word;
  Sposob: word; { Способ отливки червячного колеса }{ Центробежный В кокиль }
  Loading: TLoading;
  WormProcComp: byte;
  Nagr: boolean;
  P1, { Мощность, передаваемая быстроходным валом }
  n1, { Частота вращения быстроходного вала }
  U: real; { Передаточное число передачи }
  DeltaU: byte;
  Lh: real; { Расчетный ресурс передачи }
  Ka: real;
  TipCh: word; { Тип червяка : 1 - архимедов червяк
    2 - эвольвентный червяк
    3 - конволютный червяк }
   { Выводные параметры }
  WheelGroup: char;
  mc1, mc2: TSteelMark;
  H_HRcp1, { Твердость боковой поверхности витков червяка }
  H_HBp1, Sigma_B2: real; { Предел прочностм материала червячного колеса }
  Sigma_T2: real; { Предел текучести материала червячного колеса }
  // WormProc: PCollection;
  Termobr1: word; { Вид термообработки червяка }
  otw1, Reverse: boolean;
  { --------------------------------------------------------------- }
//  Sigma_Hmax, { Максимальное контактное напряжение }
//  Sigma_F, { Напряжения изгиба }
//  Sigma_Fmax, { Максимальные напряжения изгиба }
//  Sigma_Fp, { Допускаемые напряжения изгиба }
//  Sigma_Fpmax, { Допускаемые пиковые напряжения изгиба }
//  Sigma_Hpmax, { Допускаемое пиковое контактное напряжение }
//  Sigma_Hpmax1, Sigma_Hpmax2: real;

  { --------------------------------------------------------- }
   end;
  { ------------------------------------------------------------- }
  TParOutput = record

  { Показатели качества }
  Massa, { Суммарная масса колеса и червяка }
  Kpd, { КПД передачи }
  Vp, { Объём занимаемый передачей }
  Fb1, { Суммарное давление на вал }
  Aw, { межосевое расстояние передачи }
  d2, { Делительный диаметр колеса }
  P_1, { осевой шаг червяка }
  Pz1, { осевой ход червяка }
  Fb2, { Суммарное давление на вал }
    { ---------------------------------- }

  { Параметры передачи }
  M: real; { модуль }
  z1, { Заходность червяка }
  z2: byte; {Чилсо зубьев колеса}
  Q, { Коэффициент делительного диаметра червяка }
  x1: real; { Коэффициент смещения }
  St: byte; { Степень точности }
    { ---------------------------------- }

  { Геометрические размеры }
  d1, { Делительный диаметр }
  dw1, { Начальный диаметр червяка }
  da1, { Диаметр окружности вершин }
  df1, { Диаметр окружности впадин }
  B1, { Длина нарезанной части червяка }
  Gamma, { Угол подъема по делительному диаметру }
  GammaW, { Угол подъема по начальному диаметру }
  Sna1, { Нормальная толщина витка на диаметре вершин червяка }
  Ha1, { Измерительная высота }
  da2, { Диаметр окружности вершин колеса }
  dam2, { Наибольший диаметр колеса }
  df2: real; { Диаметр окружности впадин }
  B2: byte; { ширина венца колеса }
  Ra, { Радиус выемки венца колеса }
  Rf, { Радиус по впадинам колеса }
  Rof1, { Радиус закругления зуба колеса }
  d_p, M1, Ha2, { Измерительная высота }
  Sna2: real; { Нормальная толщина зуба на диаметре вершин колеса }
  DeltaO: real; { Угол обхвата }
  { ---------------------------------- }

  { Кинематические параметры }
  Uf, { Фактическое передаточное число передачи }
  { n1,                      Частота вращения шестерни }
  n2: real; { Частота вращения колеса }
  Vs: real; { Скорость, м/с }
  { ---------------------------------- }
  { Силовые параметры }
  T1, { Момент, передаваемый быстроходным валом }
  T2, { Момент, передаваемый тихоходным валом }
  Ft1, { Окружное усилие }
  Fr1, { Радиальное усилие }
  Fx1, { Осевое усилие }
  Ft2, { Окружное усилие }
  Fr2, { Радиальное усилие }
  Fx2: real; { Осевое усилие }
  Sigma_H, { контактное напряжение }
  Sigma_Hp: real; { допускаемое контактное напряжение }
   end;
  { --------------------------------------------------------- }
  type
  TPer = class(TObject)

  private  Loading: TLoading;
  WormProcComp: byte;
  Nagr: boolean;

  DeltaU: byte;
  //Lh: extended; { Расчетный ресурс передачи }
  Ka: real;
  TipCh: word; { Тип червяка : 1 - архимедов червяк
    2 - эвольвентный червяк
    3 - конволютный червяк }
   { Выводные параметры }
     WheelGroup: char;
  mc1, mc2: TSteelMark;
 // H_HRcp1, { Твердость боковой поверхности витков червяка }
 //H_HBp1: real; { Предел прочностм материала червячного колеса }
 //Sigma_T2: word; { Предел текучести материала червячного колеса }
  // WormProc: PCollection;
  Termobr1: word; { Вид термообработки червяка }
  otw1, Reverse: boolean;
  { --------------------------------------------------------------- }
  Sigma_Hmax, { Максимальное контактное напряжение }
  Sigma_F, { Напряжения изгиба }
  Sigma_Fmax, { Максимальные напряжения изгиба }
  Sigma_Fp, { Допускаемые напряжения изгиба }
  Sigma_Fpmax, { Допускаемые пиковые напряжения изгиба }
  Sigma_Hpmax, { Допускаемое пиковое контактное напряжение }
  Sigma_Hpmax1, Sigma_Hpmax2: real;
  Awr, M_r, Q_r, Qz: real;
  Massa, { Суммарная масса колеса и червяка }
  Kpd, { КПД передачи }
  Vp, { Объём занимаемый передачей }
  Fb1, { Суммарное давление на вал }
  Aw, { межосевое расстояние передачи }
  d2, { Делительный диаметр колеса }
  P_1, { осевой шаг червяка }
  Pz1, { осевой ход червяка }
  Fb2, { Суммарное давление на вал }
    { ---------------------------------- }

  { Параметры передачи }
  M: real; { модуль }
    Error: integer;
  z1, { Заходность червяка }
  z2: byte; {Чилсо зубьев колеса}
  Q, { Коэффициент делительного диаметра червяка }
  x1: real; { Коэффициент смещения }
  St: byte; { Степень точности }
    { ---------------------------------- }

  { Геометрические размеры }
  d1, { Делительный диаметр }
  dw1, { Начальный диаметр червяка }
  da1, { Диаметр окружности вершин }
  df1, { Диаметр окружности впадин }
  B1, { Длина нарезанной части червяка }
  Gamma, { Угол подъема по делительному диаметру }
  GammaW, { Угол подъема по начальному диаметру }
  Sna1, { Нормальная толщина витка на диаметре вершин червяка }
  Ha1, { Измерительная высота }
  da2, { Диаметр окружности вершин колеса }
  dam2, { Наибольший диаметр колеса }
  df2: real; { Диаметр окружности впадин }
  B2: byte; { ширина венца колеса }
  Ra, { Радиус выемки венца колеса }
  Rf, { Радиус по впадинам колеса }
  Rof1, { Радиус закругления зуба колеса }
  d_p, M1, Ha2, { Измерительная высота }
  Sna2: real; { Нормальная толщина зуба на диаметре вершин колеса }
  DeltaO: real; { Угол обхвата }
  { ---------------------------------- }

  { Кинематические параметры }
  Uf, { Фактическое передаточное число передачи }
  { n1,                      Частота вращения шестерни }
  n2: real; { Частота вращения колеса }
  Vs: real; { Скорость, м/с }
  { ---------------------------------- }
  { Силовые параметры }
  T1, { Момент, передаваемый быстроходным валом }
  T2, { Момент, передаваемый тихоходным валом }
  Ft1, { Окружное усилие }
  Fr1, { Радиальное усилие }
  Fx1, { Осевое усилие }
  Ft2, { Окружное усилие }
  Fr2, { Радиальное усилие }
  Fx2: real; { Осевое усилие }
  Sigma_H, { контактное напряжение }
  Sigma_Hp: real; { допускаемое контактное напряжение }

  FP1: real;
  FU: real;
  FN1: real;
  FH_HRcp1: real;
  FLh: real;
  FH_Hbp1: real;
  FSigma_B2: real;
  FSigma_t2: real;
   ArTermobr1, ArTermobr2: ArrayTermobr;
  {$REGION 'Методы Tper'}
  procedure SetP1(const Value: real);
  procedure SetN1(const Value: real);
  procedure SetU(const Value: real);
  procedure SetH_HRcp1 (const Value: real);
  procedure SetSigma_B2 (const Value: real);
  procedure SetSigma_t2 (const Value: real);
  procedure SetLh (const Value: real);
  Procedure SetH_Hbp1 (const Value: real);
  procedure ParamToRec(Input:TParInput);
  PROCEDURE PrCH1;
  PROCEDURE PrCH2;
  PROCEDURE PrCH3;
  PROCEDURE PrCH4;
  PROCEDURE PrCH5;
  PROCEDURE PrCH6;
  PROCEDURE PrCH21;
  PROCEDURE PrCH22;
  PROCEDURE PrCH23;
  PROCEDURE PrCH24;
  PROCEDURE ras4et;
   procedure Wibor1(a: real; b: TT1; N: byte; var Iw: byte);
  PROCEDURE PR_KL(N, Mu_H, Mu_f: real; Lh: real; VAR K_Hl, K_Fl: real);
  PROCEDURE VIBOR(As1: tt1; i_min, i_max: byte; Ar: real; var A1r: real; var Id: byte);
  procedure PNomer(a: real; b: tt1; i, N: byte; var ia: byte);
  PROCEDURE Wibor(Ac: tt1; i_min, i_max: byte; Ap: real; Var a: real;Var ia: byte);
   procedure wiborTerm(mc: String; var ArTermobr: ArrayTermobr);
{$endREGION 'Методы Tper'}

   public

 PROCEDURE MakeVersion;
 procedure MakeVersionss(Input: TParInput);
 procedure recordOutput;
 constructor create;overload;

  //  constructor create; overload;
   // PROCEDURE CalculateConeWheel;
//    PROCEDURE PNomer(a: real; b: tt1; i, N: byte; var ia: byte);
//   PROCEDURE Wibor(Ac: tt1; i_min, i_max: byte; Ap: real; Var a: real;
//  Var ia: byte);
//  PROCEDURE PrCH1();
   // procedure zapisal;
    // Мощность на ведущем валу, кВт
    property P1: real read FP1 write SetP1;
    // Частота вращения ведущего шкива, об/мин
    property N1: real read FN1 write SetN1;
    // Передаточное число
    property U: real read FU write SetU;
    // Твердость боковой поверхности витков червяка
    property Sigma_B2: real read FSigma_B2 write SetSigma_B2;

    property Lh: real read FLh write SetLh;

    property Sigma_T2: real read FSigma_t2 write SetSigma_t2;

    property H_Hrcp1: real read FH_Hrcp1 write SetH_Hrcp1;

    property H_Hbp1: real read FH_Hbp1 write SetH_Hbp1;
end;
procedure MasOutputOnForm(mascount1:integer;  var Output: TParOutput; var input1: Tparinput);
var
WheelMatID: word;
  // WheelProc: PCollection;
  Sposob: word; { Способ отливки червячного колеса }
  { Центробежный В кокиль }
   var Output:TparOutput;
   input:Tparinput;
  masOutput:array of TparOutput;
           mascount:integer;
           masinput:array of Tparinput;
    H_HRcp1, { Твердость боковой поверхности витков червяка }
  H_HBp1, Sigma_B2: real; { Предел прочностм материала червячного колеса }
    Mu_H, Mu_f, c_, Ro, Alfa, dv1, dv2, Massa1, Massa2: real;
  Metka, Imat1, Iq, IAw, IM, IVs: byte;
  dp, Mr, K_Hbeta, K_Hbet: real;
  Const
  ms: tt1 = (1.0, 1.125, 1.25, 1.375, 1.5, 1.75, 2.0, 2.25, 2.5, 2.75, 3.0, 3.5,
    4.0, 4.5, 5.0, 5.5, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 14.0, 16.0, 18.0,
    20.0, 22.0, 25.0, 28.0, 32.0, 36.0, 40.0, 45.0, 50.0, 55.0, 60.0, 70.0,
    80.0, 90.0, 100.0, 0, 0, 0, 0);

  Aws: tt1 = (40, 50, 63, 80, 100, 125, 140, 160, 180, 200, 225, 250, 280, 315,
    355, 400, 450, 500, 560, 630, 710, 800, 900, 1000, 1120, 1250, 1400, 1600,
    1800, 2000, 2240, 2500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  Qs: tt1 = (7.1, 8., 9., 10, 11.2, 12.5, 14, 16, 18, 20, 22.4, 25, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0);
  Vss: tt1 = (1, 2, 3, 4, 5, 6, 8, 12, 15, 25, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
 
   implementation





constructor Tper.create ;
begin
 Loading.GraphBar := 0;
  WormProcComp := 48;
  with Loading do
  begin
    x := 2;
    y := 0.3;
    z := 0.2;
    i := 0.6;
    j := 0.2;
    k := 0.2;
  end;
  P1 := 10; { 0.2..300 }
  n1 := 750; { 1 .. 5000 об/мин }
  U := 3; { 1 .. 8 }
  DeltaU := 2;
  H_HBp1 := 200; { 0..350 }
  H_HRcp1 := 48; { 35 .. 68 }
  Sigma_B2 := 200; { 100 .. 2000 МПа }
  Sigma_T2 := 800; { 100 .. 2000 МПа }
  mc1 := '18ХГТ ГОСТ 4543-71';
  mc2 := 'AUTO';
  Termobr1 := 5; { 1 .. 8 }
  Lh := 6300; { 10 ... 100000 ч }
  Ka := 1.0;
  Nagr := False;
  Sposob := 1;
  Reverse := False;
  otw1 := True;
  WheelGroup := '2';
end;
procedure MasOutputOnForm(mascount1:integer;  var Output: TParOutput;var Input1:TParInput);
begin
 Output:= masOutput[mascount1];
// Input1:=masInput[mascount1];
end;
procedure Tper.recordOutput;
begin
 Output.Massa:=Massa;{ Суммарная масса колеса и червяка }
    Output.M:=M;  {Модуль M}
    Output.Vs:=Vs;
    Output.Kpd:=Kpd;
    Output.Aw:=Aw;
    Output.Q:=Q;
    Output.St:=St;
    Output.dw1:=dw1;
    Output.df1:=df1;
    Output.da1:=da1;
    Output.B1:=b1;
    Output.Gamma:=gamma;
    Output.GammaW:=gammaW;
    Output.P_1:=P_1;
    Output.Sna1:=Sna1;
    Output.Ha1:=Ha1;
    Output.d2:=d2;
    Output.da2:=da2;
    Output.dam2:=dam2;
    Output.df2:=df2;
    Output.B2:=B2;
    Output.Ra:=Ra;
    Output.Rf:=rf;
    Output.Rof1:=Rof1;
    Output.d_p:=d_p;
    Output.M1:=M1;
    Output.Sna2:=Sna2;
    Output.Ha2:=Ha2;
    Output.x1:=x1;
    Output.z1:=z1; { Число зубьев шестерни }
    Output.z2:=z2; { Числа зубьев колеса }

    Output.Uf:=uf;{ Фактическое передаточное число передачи }
    Output.n2:=n2;{ Частота вращения колеса }
    Output.d1:=d1;{ Делительный диаметр }


    Output.Sigma_Hp:=Sigma_Hp; {Допускаемое контактное напряжение}
    Output.Sigma_H:=Sigma_H;{ Контактное напряжение }
    Output.T1:=T1;{ Момент, передаваемый быстроходным валом }
    Output.T2:=T2;{ Момент, передаваемый тихоходным валом }
    Output.Ft1:=Ft1;{ Окружное усилие }
    Output.Fr1:=Fr1;{ Радиальное усилие }
    Output.Fx1:=Fx1;{ Осевое усилие }
    Output.Ft2:=Ft2;{ Окружное усилие  }
    Output.Fr2:=Fr2;{ Радиальное усилие }
    Output.Fx2:=Fx2;{ Осевое усилие }
   Input.P1:=P1;
   Input.n1:=n1;
   Input.U:=U;
   Input.mc1:=mc1;
   Input.mc2:=mc2;
   Input.Lh:=Lh;
   Input.Sposob:=Sposob;
   Input.Termobr1:=Termobr1;
   Input.TipCh:=TipCh;





end;
procedure Tper.ParamToRec(Input:TParInput);
begin
  P1:= Input.P1;
  n1:=Input.n1   ;
  u:=Input.U  ;
  deltau:=Input.DeltaU ;
  h_hbp1:=Input.H_HBp1 ;
  H_HRcp1:=Input.H_HRcp1 ;
  Sigma_B2:=Input.Sigma_B2;
  Sigma_T2:=Input.Sigma_T2 ;
  mc1:=Input.mc1  ;
  mc2:=Input.mc2  ;
  Termobr1:=Input.Termobr1;
  lh:=Input.Lh  ;
  ka:=Input.Ka   ;
  Nagr:=Input.Nagr    ;
  Sposob:=Input.Sposob  ;
  Reverse:=Input.Reverse ;
  otw1:=Input.otw1          ;
  WheelGroup:=Input.WheelGroup ;
  TipCh:=Input.TipCh;
end;
  { Выбор по переменной ее порядкового номера из массива }
  PROCEDURE Tper.PNomer(a: real; b: tt1; i, N: byte; var ia: byte);
var
  j: byte;
Begin
  For j := i to N do
    if a <= b[j] then
    begin
      ia := j;
      Exit;
    end;
End;
 procedure Tper.Wibor1(a: real; b: TT1; N: byte; var Iw: byte);
  //       label 1;
           var I: integer;
       BEGIN
         for I:=1 to N do
          if a <= b[I] then
             begin
               Iw:=I;
               exit;//goto 1
             end;
       END;
{ Процедура округления до ближайшего большего стандартного значения }
PROCEDURE Tper.Wibor(Ac: tt1; i_min, i_max: byte; Ap: real; Var a: real;
  Var ia: byte);
Var
  i: integer;
Begin
  { Начало процедуры Wibor }
  For i := i_min to i_max do
  begin
    if Ac[i] >= Ap then
    begin
      a := Ac[i];
      ia := i;
      Exit;
    end;
    if i = i_max then
    begin
      a := Ac[i_max];
      ia := i_max;
      Exit;
    end;
  end;
End;

{ Процедура выбора ближайшего из стандартного ряда }
PROCEDURE Tper.VIBOR(As1: tt1; i_min, i_max: byte; Ar: real; var A1r: real;
  var Id: byte);
Var
  del, del1: real;
  A0, I1: byte;
Begin
  del := Abs(Ar - As1[1]);
  Id := i_min;
  A0 := 0;
  For I1 := 2 to i_max DO
  begin
    del1 := Abs(Ar - As1[I1]);
    If del < del1 then
    begin
      A1r := As1[Id];
      A0 := A0 + 1;
    end
    else
    begin
      del := del1;
      Id := I1;
    end;
  end;
END;

PROCEDURE Tper.PR_KL(N, Mu_H, Mu_f: real; Lh: real; VAR K_Hl, K_Fl: real);
VAR
  N_sum, N_He, N_Fe: real;
BEGIN
  N_sum := 60 * N * Lh;
  N_He := N_sum * Mu_H;
  IF N_He > 25E7 then
    N_He := 25E7;
  IF N_He < 1E6 then
    N_He := 1E6;
  K_Hl := Exp(0.125 * Ln(1E7 / N_He));
  N_Fe := N_sum * Mu_f;
  IF N_Fe > 25E7 then
    N_Fe := 25E7;
  IF N_Fe < 1E6 then
    N_Fe := 1E6;
  K_Fl := Exp(0.111 * Ln(1E6 / N_Fe));
END;

{ Расчет допускаемых напряжений }
PROCEDURE Tper.PrCH1;
VAR
  Cv, K_Hl, K_Fl: real;

BEGIN
  IF Sigma_B2 <> 0 then
  begin
    PR_KL(n2, Mu_H, Mu_f, Lh, K_Hl, K_Fl);
    IF Vs < 1 then
      Cv := 1.33
    else
    begin
      if Vs < 8 then
        Cv := 1.4 - 0.076 * Vs
      else
        Cv := 0.8;
    END;
    If Termobr1 = 5 then
      CASE WheelGroup of
        '1' .. '2':
          Sigma_Hp := 0.9 * Cv * Sigma_B2 * K_Hl;
        '3' .. '4':
          Sigma_Hp := 300 - 25 * Vs;
        '5':
          Sigma_Hp := 275 - 25 * Vs;
      End;
    If Termobr1 = 4 then
      CASE WheelGroup of
        '2':
          Sigma_Hp := 0.7 * Cv * Sigma_B2 * K_Hl;
        '3':
          Sigma_Hp := 275 - 25 * Vs;
        '4':
          Sigma_Hp := 250 - 25 * Vs;
        '5':
          Sigma_Hp := 200 - 35 * Vs;
      END;
    If (Termobr1 = 1) and (WheelGroup = '2') then
      Sigma_Hp := 275 - 25 * Vs;
    CASE WheelGroup of
      '1' .. '4':
        Sigma_Fp := (0.25 * Sigma_T2 + 0.08 * Sigma_B2) * K_Fl;
      '5':
        Sigma_Fp := 0.22 * Sigma_B2 * K_Fl;
    END;
    If Reverse then
      Sigma_Fp := 0.8 * Sigma_Fp;
    CASE WheelGroup OF
      '1' .. '2':
        Sigma_Hpmax := 4 * Sigma_T2;
      '3' .. '4':
        Sigma_Hpmax := 2 * Sigma_T2;
      '5':
        Sigma_Hpmax := 1.65 * Sigma_B2;
    END;
    CASE WheelGroup of
      '1' .. '4':
        Sigma_Fpmax := 0.8 * Sigma_T2;
      '5':
        Sigma_Fpmax := 0.75 * Sigma_B2;
    END;
  END;
END;

{ Расчет всех фактических  напряжений }
PROCEDURE Tper.PrCH3;
Var
  Tet, K_Hbeta, K_Hv, KH, CosGam, Zv, YF, Ft: real;
Begin
  Case z1 of
    1:
      Tet := 18 * Q - 70;
    2:
      Tet := 13.6 * Q - 70;
    3:
      Tet := 12.5 * Q - 70;
    4:
      Tet :=  11.8 * Q - 70;
  END;
  { K_Hbeta }
  with Loading do
    K_Hbeta := 1 + Exp(3 * Ln(z2 / Tet)) * (1 - (i + y * j + z * k));
  { K_HV }
  K_Hv := 1.01 + 0.01 * Vs;
  KH := K_Hbeta * K_Hv;
  Sigma_H := 15000 * sqrt(T2 * KH / dw1) / d2;
  Sigma_Hmax := Sigma_H * sqrt(Loading.x);
  CosGam := Cos(GammaW);
  Zv := z2 / Exp(3 * Ln(CosGam));
  YF := 3.55 / (Exp(0.22 * Ln(Zv))) + 0.01;
  dw1 := M * (Q + 2 * x1);
  Ft := 2 * T2 * 1000 / (M * z2);
  Sigma_F := Ft * KH * CosGam * YF / (1.3 * M * dw1);
  Sigma_Fmax := Sigma_F * Loading.x;
END;

{ Рачет геометрических размеров }
PROCEDURE tper.PrCH4;
Const
  Xs: tt1 = (-1.0, -0.5, 0, 0.5, 1.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0);
Var
  i, Ix: byte;
  H_f1, H_A1, H_1: real;
Begin
  d1 := M * Q;
  dw1 := M * (Q + 2 * x1);
  d2 := M * z2;
  da1 := d1 + 2 * M;
  da2 := d2 + 2 * (1 + x1) * M;
  H_A1 := M;
  Gamma := ArcTan(z1 / Q);
  CASE TipCh of
    0:
      H_f1 := 1.2 * M;
    1:
      H_f1 := (2.2 * Cos(Gamma) - 1) * M;
    2:
      H_f1 := 1.2 * M;
  END;
  df1 := d1 - 2 * H_f1;
  df2 := d2 - 2 * (1.2 - x1) * M;
  dam2 := da2 + 6 * M / (z1 + 2);
  Rf := 0.5 * d1 + 1.2 * M;
  Ra := 0.5 * d1 - M;
  GammaW := ArcTan(z1 * M / dw1);
  PNomer(x1, Xs, 1, 5, Ix);
  If z1 < 4 then
  Begin
    B2 := Round(0.75 * da1);
    CASE Ix of
      1:
        B1 := Round((10.5 + 0.06 * z2) * M);
      2:
        B1 := Round((8 + 0.06 * z2) * M);
      3:
        B1 := Round((11 + 0.06 * z2) * M);
      4:
        B1 := Round((11 + 0.1 * z2) * M);
      5:
        B1 := Round((12 + 0.1 * z2) * M);
    END;
  END
  else
  Begin
    B2 := Round(0.67 * da1);
    CASE Ix of
      1:
        B1 := Round((10.5 + 0.06 * z2) * M);
      2:
        B1 := Round((9.5 + 0.09 * z2) * M);
      3:
        B1 := Round((12.5 + 0.09 * z2) * M);
      4:
        B1 := Round((12.5 + 0.1 * z2) * M);
      5:
        B1 := Round((13 + 0.1 * z2) * M);
    END;
  END;
  IF H_HBp1 > 350 then
    B1 := Round(B1 + 4 * M);
  DeltaO := 2 * ArcSin(B2 / (da1 - 0.5 * M));
  H_1 := 2 * M;
  Rof1 := 0.3 * M;
END;

{ Расчет контрольного комплекса }
PROCEDURE Tper.PrCH5;

Const
  DpS: tt1 = (1.591, 1.732, 1.838, 2.020, 2.071, 2.217, 2.311, 2.595, 2.866,
    3.106, 3.177, 3.287, 3.310, 3.468, 3.580, 3.666, 4.091, 4.141, 4.211, 4.400,
    4.773, 5.175, 5.493, 6.212, 6.585, 8.262, 8.767, 10.353, 10.95, 12.423,
    13.133, 16.565, 17.362, 20.706, 21.863, 24.287, 26.231, 0, 0, 0, 0,
    0, 0, 0, 0);
Var
  k, Alfa_, Gamma, S2: real;
  Idp: byte;
  { ------------------ }
BEGIN
  P_1 := Pi * M;
  Pz1 := P_1 * z1;
  Gamma := ArcTan(z1 / Q);
  Sna1 := 0.5 * Pi * M * Cos(Gamma);
  Ha1 := M + 0.5 * Sna1 * Tan(0.5 * ArcSin(Sna1 * sqr(Sin(Gamma)) / d1));
  S2 := Pi * M / 2 + 2 * x1 * M * 0.364;
  k := M * z2 / sqr(Gamma);
  Sna2 := k * Sin(S2 / k);
  Ha2 := da2 / 2 - M * z2 / 2 + 0.5 * k * (1 - Cos(S2 / k));
  { ----------------- }
  d_p := 1.67 * M;
  If d_p > 47.231 then    // Значение 26.231 !!! ошибка
    begin
    Error := 4;
    exit;
    end;
  VIBOR(DpS, 1, 37, d_p, dp, Idp);
  CASE TipCh OF
    0:
      Alfa_ := ArcTan(0.364 / Cos(Gamma));
    1 .. 2:
      Alfa_ := 20 * Pi / 180;
  END;
  M1 := d1 - (P_1 - 0.5 * Pi * M) * Cos(Gamma) / Tan(Alfa_) + dp *
    (1 / Sin(Alfa_) + 1);
END;

{ Расчет качественных показателей }
PROCEDURE Tper.PrCH6;
Var
  Alfaa2, Alfa_X, db2, AWpodr, Awzaostr, Alfat: real;
Begin
  If TipCh = 0 then
    Alfa_X := 20 * Pi / 180
  else
    Alfa_X := ArcTan(0.364 / Cos(Gamma));
  { Проверка подрезания }
  AWpodr := 0.5 * (da1 + M * z2 * sqr(Cos(Alfa_X)));
  If Aw < AWpodr then
    begin
    Error := 5;
    exit;
    end;
  { Проверка заострения }
  Awzaostr := M * (0.55 * z2 - 0.64 - 0.024 * Alfa_X * 180 / Pi) + 0.5 * da1;
  If Aw >= Awzaostr then
     begin
    Error := 6;
    exit;
    end;
  { Коэффициент перекрытия }
  Alfat := ArcTan(Cos(Alfa) / Cos(Gamma));
  db2 := M * z2 * Cos(Alfat) / Cos(Gamma);
  Alfaa2 := ArcCos(db2 / da2);
  { Epsia:=z2*(Tan(Alfaa2)-Tan(Alfa))/(2*Pi)-2*(Ha1-X1-0.1)/(Pi*Sin(2*Alfa));
    If Epsia < 1.2 then
    raise Exception.Create('Вызвана ошибка номер 7'); }
END;

PROCEDURE Tper.PrCH24;
begin
  x1 := (Aw - 0.5 * M * (Q + z2)) / M;
  If x1 > 1 then
  { 1 } Begin
    If (x1 - 1) <= Round(0.03 * z2) / 2 then
    { 3 } Begin
      z2 := z2 + Round(0.03 * z2);
      x1 := (Aw - 0.5 * M * (Q + z2)) / M;
      { 3 } END
    else
    { 4 } Begin
      If (Iq + 1) <= 12 then
      begin
        IF (x1 - 1) <= (Qs[Iq + 1] - Q) / 2 then
        { 5 } Begin
          Q := Qs[Iq + 1];
          x1 := (Aw - 0.5 * M * (Q + z2)) / M;
          { 5 } END
        else
        { 6 } Begin
          if (x1 - 1) <= (Round(0.03 * z2) + (Qs[Iq + 1] - Q)) / 2 then
          begin
            Q := Qs[Iq + 1];
            z2 := z2 + Round(0.03 * z2);
            x1 := (Aw - 0.5 * M * (Q + z2)) / M;
          end
          else
          begin
            x1 := 0;
            Aw := 0.5 * M * (Q + z2);
            { 7 } END
        end
      end
      else
      begin
        x1 := 0;
        Aw := 0.5 * M * (Q + z2);
      end
    end
  end
  else If x1 < -1 then
  { 9 } Begin
    If Abs(x1 + 1) <= Round(0.03 * z2) / 2 then
    { 10 } Begin
      z2 := z2 - Round(0.03 * z2);
      x1 := (Aw - 0.5 * M * (Q + z2)) / M;
      { 10 } END
    else
    { 11 } Begin
      if (Iq - 1) >= 1 then
      begin
        if Abs(x1 + 1) <= (Q - Qs[Iq - 1]) / 2 then
        { 12 } Begin
          Q := Qs[Iq - 1];
          x1 := (Aw - 0.5 * M * (Q + z2)) / M;
          { 12 } END
        else
        Begin
          if Abs(x1 + 1) <= (Round(0.03 * z1) + (Q - Qs[Iq - 1])) / 2 then
          begin
            z2 := z2 - Round(0.03 * z2);
            Q := Qs[Iq - 1];
            x1 := (Aw - 0.5 * M * (Q + z2)) / M;
            { 14 } END
          else
          { 15 } Begin
            x1 := 0;
            Aw := 0.5 * M * (Q + z2);
            { 15 } END;
          { 13 } END;
        { 11 } END
      else
      begin
        x1 := 0;
        Aw := 0.5 * M * (Q + z2);
        { 9 } END;
      { 1 } End;
  end;
  GammaW := ArcTan(z1 / (Q + 2 * x1));
  Vs := Pi * n1 * M * (Q + 2 * x1) / (Cos(GammaW) * 60000);
  If Vs > 8 then
    St := 7
  else if Vs < 2 then
    St := 9
  else
    St := 8;
  d1 := Q * M;
  d2 := M * z2;
  dw1 := M * (Q + 2 * x1);
END;

PROCEDURE Tper.PrCH23;
BEGIN
  Q_r := 2 * Aw / M - z2;
  If Q_r > 25 then
     begin
    Error := 3;
    exit;
    end;
  VIBOR(Qs, 1, 12, Q_r, Q, Iq);
  If not otw1 then
    Aw := 0.5 * M * (Q + z2);

  PrCH24;
END;

PROCEDURE Tper.PrCH22;
BEGIN
  If Metka = 2 then
    M_r := 2 * Aw / (Q + z2);
  IF Metka = 1 then
    M_r := 1.6 * Aw / z2;
  If M_r > 100 then
    begin
    Error := 2;
    exit;
    end;
   if m=0 then
   begin

  VIBOR(ms, 1, 40, M_r, M, IM);
    end;
  PrCH23;
END;

PROCEDURE Tper.PrCH21;
BEGIN
  CASE z1 of
    1:
      K_Hbet := 1.06;
    2:
      K_Hbet := 1.15;
    4:
      K_Hbet := 1.25;
  End;
  Awr := 610 * Exp(0.333 * Ln(T2 * K_Hbet / sqr(Sigma_Hp)));
  If Awr > 2500 then
     begin
    Error := 1;
    exit;
    end;
  If otw1 then
    Wibor(Aws, 1, 32, Awr, Aw, IAw)
  else
    Aw := Awr;

  PrCH22;
END;

{ Проектный расчет }
PROCEDURE Tper.PrCH2;
BEGIN
  If U < 16 then
    z1 := 4
  else
  Begin
    If U > 32 then
      z1 := 1
    else
      z1 := 2;
  End;
  z2 := Round(z1 * U);
  CASE Metka of
    1:
      PrCH21;
    2:
      PrCH22;
    3:
      PrCH23;
    4:
      PrCH24;
  END;
END;

Procedure TPer.MakeVersion;
Var
  TransChk: byte;

  FUNCTION Process(ProcessID: char): byte;
  BEGIN
    case ProcessID of
      'U':
        Process := 0;
      'л':
        Process := 1;
      'о':
        Process := 2;
      'б':
        Process := 3;
      'а':
        Process := 4;
      'е':
        Process := 5;
      'и':
        Process := 6;
      'з':
        Process := 7;
      'т':
        Process := 8;
    end;
    end;
    Var
  BufRec: string[64];
  ConvChk: Integer;
  CWC: byte;
  CTH: array [1 .. 2] of Integer;
  // THandles: array [1..2] of PCollection;
  TPTemp: array [1 .. 2] of byte;
  CogTemp: word;
   i:integer;
Const
  ValStr: string[4] = '    ';
  begin
    begin
       if H_HRcp1 > 100 then
  begin
    H_HBp1 := H_HRcp1;
    H_HRcp1 := 0;
  end;
end;

  { Перевод твердостей }
  { Из  HRc  в  HB }
  If (H_HRcp1 <= 30) and (H_HRcp1 > 0) then
  H_HBp1 := round(220 * Exp(0.665 * Ln(H_HRcp1 / 20)))
 else if H_HRcp1 < 30 then
   H_HBp1 := round(300 * Exp(0.96 * Ln(H_HRcp1 / 32.5)));
// if input.Termobr1=0 then
// termobr1:=0;

 CogTemp := Termobr1;
  if Termobr1 = 0 then

   repeat
     inc(Termobr1);

    begin
     if Termobr1 = 1 then
      begin
      Error := 0;
      ras4et;
      // vivod;
      if Error = 0 then
      begin
    SetLength(masOutput, Length(masOutput) + 1);
    SetLength(masinput, Length(masinput) + 1);
          recordOutput;
          // записываем в последний элемент masOutput результаты
          masOutput[High(masOutput)] := Output;
          masinput[High(masinput)] := input;
           inc(mascount);
      end;
      end;
      if Termobr1=4 then


     begin


      Error := 0;
      ras4et;
      // vivod;
      if Error = 0 then
      begin
   SetLength(masOutput, Length(masOutput) + 1);
    SetLength(masinput, Length(masinput) + 1);
          recordOutput;
          // записываем в последний элемент masOutput результаты
          masOutput[High(masOutput)] := Output;
          masinput[High(masinput)] := input;
           inc(mascount);
      end;
     if termobr1=5 then

      begin


      Error := 0;
      ras4et;
      // vivod;
      if Error = 0 then
      begin
   SetLength(masOutput, Length(masOutput) + 1);
    SetLength(masinput, Length(masinput) + 1);
          recordOutput;
          // записываем в последний элемент masOutput результаты
          masOutput[High(masOutput)] := Output;
          masinput[High(masinput)] := input;
           inc(mascount);

          end;
      end;


     end;
    end;


   until (termobr1 > 5);



//


        if Termobr1 = 1 then
 begin
 repeat
        m:=m*1.12;
        m:=round(m);
      Error := 0;
      ras4et;
      // vivod;
      if Error = 0 then
      begin
       SetLength(masOutput,mascount+1);
            SetLength(masInput,mascount+1);
            recordOutput;
            masOutput[mascount]:=Output;
            masInput[mascount]:=input;
           inc(mascount);
      end;
 until aw>500 ;
      end;
      if Termobr1 = 4 then
      begin
        repeat
        m:=m*1.12;
        m:=round(m);
        Error := 0;
        ras4et;
        // vivod;
        if Error = 0 then
        begin

           SetLength(masOutput,mascount+1);
            SetLength(masInput,mascount+1);
            recordOutput;
            masOutput[mascount]:=Output;
            masInput[mascount]:=input;
           inc(mascount);
        END;

        until aw>500;
        end;
         if Termobr1 = 5 then
      begin
      repeat
      m:=m*1.12;
      m:= round(m);
        Error := 0;
        ras4et;
        // vivod;
        if Error = 0 then
        begin
           SetLength(masOutput,mascount+1);
            SetLength(masInput,mascount+1);
            recordOutput;
            masOutput[mascount]:=Output;
            masInput[mascount]:=input;
             inc(mascount);

        end;

      until aw>500;
       end;




  m:=0;
end;

//
//    TipCh := CogTemp;
//  repeat
//    if CogTemp = 0 then
//      Inc(TipCh);
//
//
//    Error := 0;
//    ras4et;
//    if Error = 0 then
//    begin
//      // добавляем к массиву masOutput один элемент
//      SetLength(masOutput, Length(masOutput) + 1);
//      recordOutput;
//      // записываем в последний элемент masOutput результаты
//      masOutput[High(masOutput)] := Output;
//    end;
//
//    if Tipz = 2 then
//    begin
//      Forma := 2;
//      Error := 0;
//      CalculateConeWheel;
//      vivod;
//      if Error = 0 then
//      begin
//        // добавляем к массиву masOutput один элемент
//        SetLength(masOutput, Length(masOutput) + 1);
//        recordOutput;
//        // записываем в последний элемент masOutput результаты
//        masOutput[High(masOutput)] := Output;
//      end;
//    end;
//  until (CogTemp <> 0) or (Tipz = 2);







PROCEDURE TPer.ras4et;

var
  i: integer;
Begin

//  Loading.GraphBar := 0;
//  WormProcComp := 48;
//  with Loading do
//  begin
//    x := 2;
//    y := 0.3;
//    z := 0.2;
//    i := 0.6;
//    j := 0.2;
//    k := 0.2;
//  end;
//  P1 := 10; { 0.2..300 }
//  n1 := 750; { 1 .. 5000 об/мин }
//  U := 3; { 1 .. 8 }
//  DeltaU := 2;
//  H_HBp1 := 200; { 0..350 }
//  H_HRcp1 := 48; { 35 .. 68 }
//  Sigma_B2 := 800; { 100 .. 2000 МПа }
//  Sigma_T2 := 800; { 100 .. 2000 МПа }
//  mc1 := '18ХГТ ГОСТ 4543-71';
//  mc2 := 'AUTO';
//  Termobr1 := 4; { 1 .. 8 }
//  Lh := 6300; { 10 ... 100000 ч }
//  Ka := 1.0;
//  Nagr := False;
//  Sposob := 1;
//  Reverse := False;
//  otw1 := True;
//  WheelGroup := '2';

  { Начало процедуры Expandata }
  Alfa := 20 * Pi / 180;
  T1 := P1 * 1000 * 30 / (Pi * n1);
  with Loading do
    IF not Nagr then
      Case GraphBar of
        1:
          BEGIN
            i := 1;
            j := 0;
            k := 0;
            y := 0;
            z := 0;
          END;
        2:
          BEGIN
            i := 0.3;
            j := 0.4;
            k := 0.3;
            y := 0.8;
            z := 0.4;
          END;
        3:
          BEGIN
            i := 0.15;
            j := 0.45;
            k := 0.4;
            y := 0.6;
            z := 0.2;
          END;
        4:
          BEGIN
            i := 0.1;
            j := 0.4;
            k := 0.5;
            y := 0.6;
            z := 0.2;
          END;
        5:
          BEGIN
            i := 0.1;
            j := 0.2;
            k := 0.7;
            y := 0.5;
            z := 0.1;
          END;
        6:
          BEGIN
            i := 0.05;
            j := 0.2;
            k := 0.75;
            y := 0.4;
            z := 0.1;
          END;
        7:
          BEGIN
            i := 0.025;
            j := 0.125;
            k := 0.8;
            y := 0.35;
            z := 0.1;
          END;
      END;
  with Loading do
  begin
    Mu_H := Exp(0.25 * Ln(i + y * y * y * y * j + z * z * z * z * k));
    T2 := T1 * U * (1 - U / 200);
    Mu_f := Exp(0.11 * Ln(i + j * y * y * y * y * y * y * y * y * y + k * z * z
      * z * z * z * z * z * z * z));
  end;
  n2 := n1 / U;
  Vs := 4.5 * n1 * Exp(0.333 * Ln(T2)) / 10000;

  { Расчет допускаемых нпряжений }
  PrCH1;
  { Проектный расчет передачи }
  Metka := 1;
  PrCH2;
  { Расчет фактических напряжений }
  PrCH3;
  Vs := Pi * n1 * dw1 / (Cos(GammaW) * 60000);
  PNomer(Vs, Vss, 1, 10, IVs);
  { Уточнение допускаемых нпряжений }
  PrCH1;
  { Проверка условия фактическое напряжение < допускаемого напряжения }
  { Проверка по контактным напряжениям }

  IF (Sigma_H > 1.03 * Sigma_Hp) or (Sigma_Hmax > Sigma_Hpmax) THEN
  BEGIN
    for i := 1 to 32 do
    begin
      Metka := 2;
      PrCH2;
      { Расчет фактических напряжений }
      PrCH3;
      Vs := Pi * n1 * dw1 / (Cos(GammaW) * 60000);
      PNomer(Vs, Vss, 1, 10, IVs);
      { Уточнение допускаемых нпряжений }
      PrCH1;
      { Проверка условия фактическое напряжение < допускаемого напряжения }
      { Проверка по контактным напряжениям }

      if otw1 then
        Aw := Aws[i]
      else
        Aw := Aw * Exp(0.333 * Ln(Sigma_H / Sigma_Hp));

      IF (Sigma_H <= 1.03 * Sigma_Hp) and (Sigma_Hmax <= Sigma_Hpmax) THEN
        Break;
    end;
     begin
    Error := 1;
    exit;
    end;
  END;

  { Проверка изгибных напряжений }
  IF (Sigma_F > 1.03 * Sigma_Fp) or (Sigma_Fmax > Sigma_Fpmax) THEN
  BEGIN
    while Q <= 25 do
    begin
      M := M * sqrt(Sigma_F / Sigma_Fp);
      Wibor(ms, 1, 40, M, M, IM);

      If Iq > 1 then
      begin
        Q := 2 * Aw / M - 2 * x1 - z2;

        VIBOR(Qs, 1, 12, Q, Q, Iq);
        Metka := 4;
        PrCH2;
        { Расчет фактических напряжений }
        PrCH3;
        Vs := Pi * n1 * dw1 / (Cos(GammaW) * 60000);
        PNomer(Vs, Vss, 1, 10, IVs);
        { Уточнение допускаемых нпряжений }
        PrCH1;
        { Проверка условия фактическое напряжение < допускаемого напряжения }
        { Проверка по контактным напряжениям }
      End
      else
      begin
        Aw := 0.5 * M * (Q + z2) + 2 * x1;
        Wibor(Aws, 1, 32, Aw, Aw, IAw);
        Metka := 3;
        PrCH2;
        { Расчет фактических напряжений }
        PrCH3;
        Vs := Pi * n1 * dw1 / (Cos(GammaW) * 60000);
        PNomer(Vs, Vss, 1, 10, IVs);
        { Уточнение допускаемых нпряжений }
        PrCH1;
        { Проверка условия фактическое напряжение < допускаемого напряжения }
        { Проверка по контактным напряжениям }
      End;

      IF (Sigma_F <= 1.03 * Sigma_Fp) and (Sigma_Fmax <= Sigma_Fpmax) THEN
        Break;
    end;
     begin
    Error := 1;
    exit;
    end;
  END;

  { Геометрический расчет }
  PrCH4;
  { Расчет   КПД }
  Ro := 2.97 * Pi / (Exp(0.45 * Ln(Vs)) * 180);
  Kpd := Tan(GammaW) / Tan(GammaW + Ro);
  Uf := z2 / z1;
  { Расчет усилий в зацеплении }
  Ft1 := 2 * T1 * 1E3 / d1;
  Ft2 := 2 * T1 * Uf * Kpd * 1E3 / d2;
  Fr1 := Ft2 * Tan(Alfa);
  Fr2 := Fr1;
  Fx1 := Ft2;
  Fx2 := Ft1;
  Fb1 := sqrt(sqr(Ft1) + sqr(Fr1));
  Fb2 := sqrt(sqr(Ft2) + sqr(Fr2));
  { Контрольный комплекс }
  PrCH5;
  { Расчет показателей качества }
   {PrCH6;} // ошибка №5 и №6 !!!!!
  { Расчет массы и обьема }
  dv1 := Exp(0.333 * Ln(T1 * 1000 / 5));
  n2 := n1 / Uf;
  T2 := T1 * Uf * Kpd;
  dv2 := Exp(0.333 * Ln(T2 * 1000 / 10));
  Massa1 := Pi * 0.25 * (d1 * d1 * B1 + dv1 * dv1 * (d2 - B1) + 0.54 * B2 *
    (d2 * d2 + dv2 * dv2)) / 1E6;
  Massa1 := Massa1 * 7.81;

  Massa2 := Pi * 0.25 * ((d1 * d1 * B1) + dv1 * dv1 * (d2 - B1) + B2 *
    (d2 * d2 - dv2 * dv2)) / 1E6;
  Massa2 := Massa2 * 7.81;
  Massa := Min3(Massa1, Massa1, Massa2);
  Vp := (Pi * d1 * d1 * B1 / 4 + Pi * dam2 * dam2 * B2 / 4) * 1E-6;


     end;
     procedure TPer.wiborTerm(mc: String; var ArTermobr: ArrayTermobr);
begin
  if mc = '12ХН2 ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '12ХН3А ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '12Х2Н4А ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '15ХГНТА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '18ХГТ ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '18Х2Н4ВА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20Х ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20ХН ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20ХН2М ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20ХН3А ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20Х2Н4А ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20ХГР ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '25ХГТМА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '30ХГТ ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '25ХГМ ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 6;
  end;
  if mc = '20ХН3А ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 6;
  end;
  if mc = '35ХМ ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 4;
  end;
  if mc = '40 ГОСТ 1050-74' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
  end;
  if mc = '40Х ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
    ArTermobr[3] := 3;
    ArTermobr[4] := 4;
  end;
  if mc = '40ХН ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
    ArTermobr[3] := 3;
    ArTermobr[4] := 4;
  end;
  if mc = '40ХФА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
    ArTermobr[3] := 3;
  end;
  if mc = '40ХН2МА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
    ArTermobr[3] := 3;
    ArTermobr[4] := 4;
  end;
  if mc = '45 ГОСТ 1050-74' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
  end;
  if mc = '50ХН ГОСТ 1050-74' then
  begin
    ArTermobr[1] := 3;
  end;
end;

     procedure TPer.MakeVersionss(Input: TParInput);
var
  i4, i3: Integer;
begin
  i3 := 1;
  mascount:=0;
  ParamToRec(Input);
  if Termobr1 = 0 then
  begin
    wiborTerm(mc1, ArTermobr1);

  end
  else
    ArTermobr1[1] := Termobr1;

  repeat
    if ArTermobr1[i3] <> 0 then
    begin
      i4 := 1;
      Termobr1 := ArTermobr1[i3];
    MakeVersion;
    end;
    Inc(i3);
  until i3 = 5;
end;

procedure TPer.SetP1(const Value: real);
begin
  if (Value < P1Min) or (Value > P1Max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetP1] Мощность на ведущем валу (P1) не может быть равна %g, допустимый диапазон от %g до %g кВт',
      [Value, P1Min, P1Max]);

  FP1 := Value;
end;

procedure TPer.SetN1(const Value: real);
begin
  if (Value < N1Min) or (Value > N1Max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetN1] Частота вращения(N1) ведущего колеса (шкива) не может быть равна %g, допустимый диапазон от %g до %g об/мин',
      [Value, N1Min, N1Max]);

  Fn1 := Value;
end;

procedure TPer.SetU(const Value: real);
begin
  if (Value < UMin) or (Value > UMax) then
    raise ERangeError.CreateFmt
      ('[TPer.SetU] Передаточное число (U) не может быть равно %g, допустимый диапазон от %g до %g',
      [Value, UMin, UMax]);

  FU := Value;
end;
procedure TPer.SetH_HRcp1 (const Value: real);
begin
if (Value < H_HRcp1Min) or (Value > H_HRcp1Max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetH_HRcp1] Твердость боковой поверхности витков червяка (H_HRcp1) не может быть равно %g, допустимый диапазон от %g до %g',
      [Value, H_HRcp1Min, H_HRcp1Max]);

  FH_HRcp1 := Value;
end;

procedure TPer.SetSigma_B2 (const Value: real);
begin
if (Value < Sigma_B2Min) or (Value > Sigma_B2Max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetSigma_B2] Предел прочностм материала червячного колеса (Sigma_B2) не может быть равно %g, допустимый диапазон от %g до %g',
      [Value, Sigma_B2Min, Sigma_B2Max]);

  FSigma_B2 := Value;
end;

procedure TPer.SetSigma_t2 (const Value: real);
begin
if (Value < Sigma_t2Min) or (Value > Sigma_t2Max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetSigma_t2] Предел прочностм материала червячного колеса (Sigma_t2) не может быть равно %g, допустимый диапазон от %g до %g',
      [Value, Sigma_t2Min, Sigma_t2Max]);

  FSigma_t2 := Value;
end;

procedure Tper.SetLh (const Value: real);
begin
if (Value < Lhmin) or (Value > Lhmax) then
    raise ERangeError.CreateFmt
      ('[TPer.SetLh] Предел прочностм материала червячного колеса (Lh) не может быть равно %g, допустимый диапазон от %g до %g',
      [Value, LhMin, LhMax]);

  FLh := Value;
end;

Procedure Tper.SetH_Hbp1 (const Value: real);
begin
if (Value < H_Hbp1min) or (Value > H_Hbp1max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetH_Hbp1] Предел прочностм материала червячного колеса (H_Hbp1) не может быть равно %g, допустимый диапазон от %g до %g',
      [Value, H_Hbp1Min, H_Hbp1Max]);

  FH_Hbp1 := Value;
end;
end.
