{$O+}
Unit CogStrapTransmission;
{-------------------------------------------------------------------------}
{-   Модуль проектирования передачи зубчатым ремнем.                     -}
{-------------------------------------------------------------------------}
INTERFACE
Uses
  Objects, Views, Designers;

Const
{-------------------------------------------------------------------------}
{-   Ошибки проектирования передачи                                      -}
{-------------------------------------------------------------------------}
  erWidth   = 1;  {- Флаг малой ширины ремня     -}
  erAngle   = 2;  {- Мал угол обхвата            -}
  erSpeed   = 3;  {- Велика скорость ремня       -}
  erRunway  = 4;  {- Велико число пробегов ремня -}
  erLength  = 5;  {- Велика длина ремня -}

Type
{-------------------------------------------------------------------------}
{-   Конструктор передачи плоским ремнем                                 -}
{-------------------------------------------------------------------------}
  PCogStrapTransCAD = ^TCogStrapTransCAD;
  TCogStrapTransCAD = object(TDesigner)
{-------------------------------------------------------------------------}
{-  Буфер данных передачи                                                -}
{-------------------------------------------------------------------------}
    P1: real;    { Мощность на ведущем шкиве }
    n1: real;    { Число оборотов ведущего шкива }
    up: real;    { Проектное передаточное число }
    DUD: real;
    m:  real;
    z1: byte;
    Lh_0: word;  { Относительная долговечность }
    cpo: real;
    Change: word;
    Tip_P: boolean;
    {-  Кр. ограничители -}
    a:  real;
    d2: real;    { Диаметр большого шкива }
    alfa: real;  { Угол охвата ремнем меньшего шкива }
    Vol: real;   { Объем передачи }
    Lh: real;
    {- Выходные данные -}
    d1: real;
    da1: real;
    da2: real;
    z2: byte;
    l: real;
    b: real;
    bs: real;
    Fb: real;
    Uf: real;

    procedure InitData; virtual;
    procedure InitQuality; virtual;
    procedure MakeDataStrings (AStrings: PCollection); virtual;
    procedure ChangeDataItem (Item: byte); virtual;
    procedure MakeVersions; virtual;
    procedure MakeVersion (var ErrorCode: byte); virtual;
    procedure MakeVersionStrings (AStrings: PCollection); virtual;
    function  DataEntryPoint: pointer; virtual;
    function  QualityNumber: word; virtual;
    function  QualityEntryPoint: pointer; virtual;
    procedure PlotVersion (VersionID: PView; var Dest: text); virtual;
  end;

Const
  RCogStrapTransCAD: TStreamRec = (
    ObjType: 1116;
    VmtLink: Ofs(TypeOf(TCogStrapTransCAD)^);
    Load: @TCogStrapTransCAD.Load;
    Store: @TCogStrapTransCAD.Store
  );

IMPLEMENTATION
Uses
  Drivers, App, Dialogs, Common, obRead, Memodul;

PROCEDURE TCogStrapTransCAD.InitData;
BEGIN
  N1:=720;
  P1:=2;
  up:=3;
  DUD:=0.03;
  a:=0;
  cpo:=1.24;
  Tip_P:=False;
  Lh_0:=5000;
  Change:=2;
  m:=0;
  z1:=0;
END;

PROCEDURE TCogStrapTransCAD.InitQuality;
BEGIN
  inherited InitQuality;
  QualityList^[0].Title:=NewStr('Межосевое расстояние, мм');
  QualityList^[0].Value:=2;
  QualityList^[0].Minimize:=True;
  QualityList^[1].Title:=NewStr('Диаметр ведомого шкива, мм');
  QualityList^[1].Value:=2;
  QualityList^[1].Minimize:=True;
  QualityList^[2].Title:=NewStr('Угол обхвата, град');
  QualityList^[2].Value:=2;
  QualityList^[2].Minimize:=False;
  QualityList^[3].Title:=NewStr('Объем передачи, дм. куб.');
  QualityList^[3].Value:=2;
  QualityList^[3].Minimize:=True;
  QualityList^[4].Title:=NewStr('Долговечность ремня, ч');
  QualityList^[4].Value:=2;
  QualityList^[4].Minimize:=False;
END;

PROCEDURE TCogStrapTransCAD.MakeVersionStrings;
Var
  FmtStr: string;
  ValStr: array [0..17] of string[7];
  Params: array [0..17,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s %15s';
  ParamsName: array [0..17] of string [40] = (
  'Делительный диаметр ведущ. шкива, мм',
  'Делительный диаметр ведом. шкива, мм',
  'Диаметр вершин ведущего шкива, мм',
  'Диаметр вершин ведомого шкива, мм',
  'Число зубьев ведущего шкива',
  'Число зубьев ведомого шкива',
  'Межосевое расстояние, мм',
  'Длина ремня, мм',
  'Ширина ремня, мм',
  'Ширина шкива, мм',
  'Давление на вал, Н',
  'Расчетный срок службы, час',

  'Мощность на ведущем валу, кВт',
  'Частота вращения ведущ. шкива, об/мин',
  'Модуль зуба, мм',
  'Проектный срок службы, час',
  'Коэффициент внешней динамики',
  'Передаточное число');

BEGIN
  Str(d1:0:2,ValStr[0]);
  Str(d2:0:2,ValStr[1]);
  Str(Da1:0:2,ValStr[2]);
  Str(Da2:0:2,ValStr[3]);
  Str(z1,ValStr[4]);
  Str(z2,ValStr[5]);
  Str(a:0:2,ValStr[6]);
  Str(L:0:2,ValStr[7]);
  Str(B:0:2, ValStr[8]);
  Str(Bs:0:2, ValStr[9]);
  Str(Fb:0:2,ValStr[10]);
  Str(Lh:0:0,ValStr[11]);

  Str(P1:0:2,ValStr[12]);
  Str(N1:0:2,ValStr[13]);
  Str(m:0:2,ValStr[14]);
  Str(Lh_0:0,ValStr[15]);
  Str(cpo:0:1,ValStr[16]);
  Str(Uf:0:2,ValStr[17]);

  for ItemCount:=0 to 17 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
  AStrings^.AtInsert(12, NewStr('    Исходные данные'));
END;

PROCEDURE TCogStrapTransCAD.MakeDataStrings;
Var
  FmtStr: string;
  ValStr: array [0..10] of string[10];
  Params: array [0..10,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s %15s';
  FillType: array[boolean] of string[15] = (
  'Резина',
  'Вулколан');
  ChangeType: array[1..3] of string[15] = (
  '1 смена',
  '2 смены',
  '3 смены');
  AUTOMessage: string[4] = 'AUTO';
  ParamsName: array [0..10] of string [40] = (
  'Мощность на ведущем валу, кВт',
  'Частота вращения ведущ. шкива, об/мин',
  'Проектное передаточное число',
  'Погрешность передаточного числа, %',
  'Модуль зуба, мм',
  'Число зубьев ведущего шкива',
  'Межосевое расстояние, мм',
  'Срок службы, час',
  'Коэффициент внешней динамики',
  'Сменность работы',
  'Тип наполнителя в ремне');

BEGIN
  Str(P1:0:2,ValStr[0]);
  Str(N1:0:2,ValStr[1]);
  Str(up:0:2,ValStr[2]);
  Str(DUD*100:0:0, ValStr[3]);
  if m = 0 then
    ValStr[4]:=AUTOMessage
  else
    Str(m:0:1,ValStr[4]);
  if z1 = 0 then
    ValStr[5]:=AUTOMessage
  else
    Str(z1,ValStr[5]);
  if a = 0 then
    ValStr[6]:=AUTOMessage
  else
    Str(a:0:2,ValStr[6]);
  Str(Lh_0:0, ValStr[7]);
  Str(cpo:0:2, ValStr[8]);
  ValStr[9]:=ChangeType[Change];
  ValStr[10]:=FillType[Tip_P];
  for ItemCount:=0 to 10 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
END;

PROCEDURE TCogStrapTransCAD.ChangeDataItem;
Var
  Dialog: PDialog;
  Bruce:  PView;
  R:      TRect;
  VS:     string[8];
  TC:     integer;

PROCEDURE GetPower;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-13, 2, Size.X-3, 3);
    Bruce:=New(PInputReal, Init(R,6,0.1,100,2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(1, 2, Size.X-13, 3);
    Insert(New(PLabel, Init(R, 'Мощность на ведущем валу, кВт', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @P1);
END;

PROCEDURE GetFreqency;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputReal, Init(R,8,10,10000,2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Частота вращения ведущего шкива, об/мин',
                                                                Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @N1);
END;

PROCEDURE GetReduction;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputReal, Init(R,5,0.1,10,2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Проектное передаточное число', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Up);
END;

PROCEDURE GetReductionTolerance;
Var
  Percents: byte;

BEGIN
  Percents:=trunc(DUD*100);
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputInt, Init(R,2,1,10,1));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Погрешность передаточного числа, %', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @Percents) = cmOk then
    DUD:=Percents/100;
END;

PROCEDURE GetCogsHeigth;
Const
  CogsHeigth: array [0..8] of real =
  (0, 1, 1.5, 2, 3, 4, 5, 7, 10);
  CurrentHeigth: word = 0;

BEGIN
  R.Assign(1, 1, 60, 10);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, Size.X-2, 5);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('AUTO',
      NewSItem('1 мм',
      NewSItem('1.5 мм',
      NewSItem('2 мм',
      NewSItem('3 мм',
      NewSItem('4 мм',
      NewSItem('5 мм',
      NewSItem('7 мм',
      NewSItem('10 мм',
    nil)))))))))));
    Insert(Bruce);
    R.Assign(2, 2, Size.X-2, 3);
    Insert(New(PLabel, Init(R, 'Модуль зуба:', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @CurrentHeigth) = cmOk then
    m:=CogsHeigth[CurrentHeigth];
END;

PROCEDURE GetCogs;
Var
  Temp: float;

BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputAUTOReal, Init(R,3,10,100,0,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Число зубьев ведущего шкива', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Temp:=z1;
  if Application^.ExecuteDialog(Dialog, @Temp) = cmOk then
    z1:=trunc(Temp);
END;

PROCEDURE GetWheelDistance;
Var
  Minimum: real;

BEGIN
  if (m=0) or (z1=0) then
    Minimum:=0
  else
    Minimum:= 0.5*m*z1*(up+1);
  Str(Minimum:7:2, VS);

  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputAUTOReal, Init(R,7,Minimum,3000,2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Межосевое расстояние (не менее '+
           VS+')', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @a);
END;

PROCEDURE GetLifeTime;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputInt, Init(R,5,1000,25000,2));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Проектный срок службы, ч', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Lh_0);
END;

PROCEDURE GetWorkMode;
Const
  Coefficients: array [0..2,0..2] of real =
  ((1.24, 1.34, 1.54),
   (1.38, 1.50, 1.74),
   (1.52, 1.65, 1.95));
  CurrentModes: array [1..2] of word = (0, 0);

BEGIN
  R.Assign(1, 1, 60, 14);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 40, 6);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('С малой неравномерностью',
      NewSItem('Со средней неравномерностью',
      NewSItem('Со значительной неравномерностью',
    nil)))));
    Insert(Bruce);
    R.Assign(2, 2, 40, 3);
    Insert(New(PLabel, Init(R, 'Режим работы двигателя:', Bruce)));
    R.Assign(2, 8, 40, 11);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('С малой неравномерностью',
      NewSItem('Со средней неравномерностью',
      NewSItem('Со значительной неравномерностью',
    nil)))));
    Insert(Bruce);
    R.Assign(2, 7, 40, 8);
    Insert(New(PLabel, Init(R, 'Режим работы машины:', Bruce)));
    R.Assign(Size.X-18, 3, Size.X-3, 5);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);
    R.Move(0, 3);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @CurrentModes) = cmOk then
    cpo:=Coefficients[CurrentModes[1], CurrentModes[2]];
END;

PROCEDURE GetChange;
BEGIN
  Dec(Change);
  R.Assign(1, 1, 60, 9);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, Size.X-2, 4);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('1 смена',
      NewSItem('2 смены',
      NewSItem('3 смены',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2, 2, Size.X-2, 3);
    Insert(New(PLabel, Init(R, 'Сменность работы', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @Change) = cmOk then
    Inc(Change);
END;

BEGIN
  case Item of
    0: GetPower;
    1: GetFreqency;
    2: GetReduction;
    3: GetReductionTolerance;
    4: GetCogsHeigth;
    5: GetCogs;
    6: GetWheelDistance;
    7: GetLifeTime;
    8: GetWorkMode;
    9: GetChange;
    10: Tip_P:=not Tip_P;
  end;
END;

PROCEDURE TCogStrapTransCAD.MakeVersions;
Var
  TransChk: byte;
  StartCogs: byte;
  StartModul, UserDist: real;
  FirstLoop: boolean;

BEGIN
  StartCogs:=z1;
  StartModul:=m;
  UserDist:=a;
  repeat
    z1:=StartCogs;
    FirstLoop:=True;
    repeat
      a:=UserDist;
      TransChk:=0;
      MakeVersion(TransChk);
      if FirstLoop and (TransChk = 10) then
        TransChk:=11;
      if TransChk = 0 then
        AddVersion;
      FirstLoop:=False;
      Inc(z1, 2);
    until (TransChk in [2,10,11]) or (StartCogs <> 0);
    if m<=8 then m := m * 1.25 else Exit;
  until (StartModul <> 0) or (TransChk = 11);
  inherited MakeVersions;
END;

PROCEDURE TCogStrapTransCAD.MakeVersion;
 {Пpогpамма для pасчета механизмов с зубчатыми pеменными пеpедачами}
 Const
   g=9.81;{ускоpение свободного падения,мм/с2}
   KPD=0.97;{коеффициент полезного действия механизма}
   KH1=0.3;{коеффициент неpавномеpности нагpужения каpкаса pемня}
   FKD1=2.5E+6;{допустимое контактное давление для pемня
                pезинового многослойного}
   FKD2=2E+6;{допустимое контактное давление для pемня из вулколана}
   {массив для выбора cpo}

 Var
     T1,
     cp{коэффициент pежима pаботы пpивода},

pp1,c,r,Lp,
     Du{отклонение фактического передаточного отношения от заданного},
     E{полусумма длин окружностей шкивов},
     DR{полуразность диаметров},
rc,

     Gam{угол полунаклона ветвей ремня,град},
     Alf1{угол обхвата ремнем ведущего шкива,град},
     Alf2{угол обхвата ремнем ведомого шкива,град},
     FT{окружное усилие,Н},
     ch{коеффициент,учитывающий влияние натяжного ролика},
     FTp{расчетное окружное усилие,Н},
     FTpmax{максимальное расчетное окружное усилие,Н},
     V{линейная скорость ремня,м/с},B1,B2,
     FKD{допустимое контактное давление,Па},
     FRD{расчетное крнтактное давление,Па},
     GT{удельная центробежная сила,Н/м},
     H{высота зуба ремня,мм},
     Bmax{максимальная ширина ремня,мм},
     Lamp{приведенная податлтвость каркаса ремня},
     Lam{податливость каркаса ремня},
     FO{усилие предварительного натяжения ремня,Н},
     FV{коеффициент распределения усилия по зубьям шкива},
     DELD1{поправка к диаметру ведущего шкива,мм},
     DELD2{поправка к диаметру ведомого шкива,мм},
     DEL{расстояние до нейтрального слоя(от впадины зуба)}
                  :real;
     Kr{количество натяжных pоликов},I,Y,Im,
     IMM{флаг ошибки в процедуре поиска модуля},
     ILL{флаг ошибки в процедуре выбора числа зубьев},
     IBB{флаг ошибки в процедуре выбора ширины ремня},

     K:byte;

     Zmax,Zmin,
     Z01{число зубьев,находящихся в зацеплении на ведущем шкиве},
     Z02{число зубьев,находящихся в зацеплении на ведомом шкиве},
     Q{удельная масса ремня,Н/м},
     FOD{допустимое окружное усилие,Н/мм},
     Lpct{стандартное количество зубъев ремня}:integer;
 BEGIN
   {Начинаем непосредственно расчет}
   if Change=1 then rc:=0;
   if Change=2 then rc:=0.1;
   if Change=3 then rc:=0.2;
   cp := cpo + rc;
   PP1 := P1 * cp;
   if n1 < 700 then K := 1 else
   if n1 < 900 then K := 2 else
   if n1 < 1250 then K := 3 else
   if n1 < 1800 then K := 4 else
   if n1 < 3600 then K := 5 else K := 6;
   T1 := 9550 * PP1 / n1;
   if m = 0 then MODUL(K,T1,Im,IMM,m)
            else
              begin
                 IMM := 0;
                 for i := 1 to 8 do
                      if m <= o1[I] then
                        begin
                          m := o1[I];
                          Im := I;
                          Imm := 1;
                          Break;
                        end;
               end;
   if IMM=0 then begin
                 ErrorCode:=1;
                 Exit;
                 end;
   Zmin := o2[Im];
   Zmax := o3[Im];
   if z1 = 0 then z1 := Zmin;
   D1 := z1 * m;
   if a = 0 then  a := D1 * 0.55 * (Up + 1);
   z2 := Round(z1 * Up);
   if z2 > Zmax then begin
                     ErrorCode:=2;
                     Exit;
                     end;
   D2 := z2 * m;
   Uf := z2 / z1;
   Du := Uf - Up;
   if DU > DUD then
                begin
                ErrorCode:=3;
                Exit;
                end;
   l := 2 * a + Pi * (d1 + d2) / 2 + sqr(d2 - d1) / (4 * a);
   lp := Round(l / (pi * m));
   PLpct(Im,Lp,Lpct,ILL);
   if ILL = 0 then begin
                 ErrorCode := 1;
                 Exit;
                 end;
   L := Lpct * pi * m;
   a := (L- pi * (d1 + d2) / 2) / 4 + sqrt(sqr(L - pi * (d1 + d2) / 2) -
          2 * sqr(d2 - d1)) / 4;
   Gam := pi * (d2 - d1) / a;
   alf1 := 180 - Gam;
   Alf2 := 180 + Gam;
   alfa := alf1;
   Z01 := Round(Z1 * Alf1 / 360);
   Z02 := Round(Z2 * Alf2 / 360);
   FT := 2000 * T1 / (m * Z1);
   FTpmax := FT * cp * 1.3;
   V := pi * m * z1 * n1 / 60000;
   Q := o7[Im];
   GT := Q * V * V / g;
   FOD := o8[Im];
   B1 := FTpmax / (FOD - (GT * 1E-3));
   if Tip_p then FKD := FKD1 else FKD := FKD2;
   FRD := 6 * Lp / (z1 * pi * n1 * Lh_0);
   H := o5[Im];
      B2 := (FT * 1E+3  * (1 + 1 / z02)) /
            (2.04E-3 * FKD * FRD * H * z01 - 2 * GT);
   if B1 > B2 then B := B1 else B := B2;
   Bmax := o4[Im];
   if a4[1, Im] > B then begin
                         ErrorCode := 10;
                         EXIT;
                         end;
   if B > Bmax then begin
                    ErrorCode := 5;
                    EXIT;
                    end
               else  PBct(Im,B,B, IBB);

   if IBB = 0 then begin
                 ErrorCode := 1;
                 Exit;
                 end;
   if B = 0 then begin
                 ErrorCode := 4;
                 Exit;
                 end;
   Lamp := o6[Im];
   Lam := Lamp / B;
   {FO := FT * (1 + 1/z02) + 2E-3 * B * GT;}
   FV := 1 + (exp((0.1 * z01) + 1) * exp(0.1 * (z01 - 1) + 1))/
         (exp((0.1 * z01) - 1) * exp(0.1 * (z01 - 1) - 1));
   Fb:=1.1*Ft;
{   DELD1 := (1E-3 * m * z1 + (Lam * z1 / 2) * FO * FV) / pi;
   DELD2 := (1E-3 * m * z2 + (Lam * z2 / 2) * FO) / pi;}
   DEL := o9[Im];
   Da1 := m * z1 - 2 * DEL;
   Da2 := m * z2 - 2 * DEL;
   Bs := round(B + m);
   Vol:=(Bs*(Pi*(sqr(d1)+sqr(d2))+4*a*(d1+d2)))/8*1E-6;
   Lh := Lh_0 * (0.7 + 0.1*random(3) + 0.01*random(9));
   end;

FUNCTION TCogStrapTransCAD.DataEntryPoint;
BEGIN
  DataEntryPoint:=@P1;
END;

FUNCTION TCogStrapTransCAD.QualityNumber;
BEGIN
  QualityNumber:=5;
END;

FUNCTION TCogStrapTransCAD.QualityEntryPoint;
BEGIN
  QualityEntryPoint:=@a;
END;

PROCEDURE TCogStrapTransCAD.PlotVersion;
BEGIN
  inherited PlotVersion(VersionID,Dest);
  writeln(Dest,'4');
  writeln(Dest,Da1:0:2);
  writeln(Dest,Da2:0:2);
  writeln(Dest,m:0:2);
  writeln(Dest,z1);
  writeln(Dest,z2);
  writeln(Dest,bs:0:2);
  writeln(Dest,9550*P1/N1:0:2);
  writeln(Dest,9550*P1/N1*Up:0:2);
END;
END.