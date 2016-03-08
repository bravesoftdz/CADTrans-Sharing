{$O+}
Unit FlatStrapTransmission;
{-------------------------------------------------------------------------}
{-   Модуль проектирования передачи плоским ремнем.                      -}
{-------------------------------------------------------------------------}
INTERFACE
Uses
  Objects, Views, Designers;

Const
  erDiam   = 1;
  erAngle  = 2;
  erSpeed  = 3;
  erRunway = 4;

Type
{-------------------------------------------------------------------------}
{-   Конструктор передачи плоским ремнем                                 -}
{-------------------------------------------------------------------------}
  PFlatStrapTransCAD = ^TFlatStrapTransCAD;
  TFlatStrapTransCAD = object(TDesigner)
{-------------------------------------------------------------------------}
{-  Буфер данных передачи                                                -}
    P1: float;    { Мощность на ведущем шкиве }
    n1: float;    { Число оборотов ведущего шкива }
    up: float;    { Проектное передаточное число }
    d1: float;    { Диаметр малого шкива }
    Q: word;     { Угол наклона передачи к горизонту }
    Tip_nat: boolean; { Натяжение ремня }
    Cp: float;    { Коэффициент режима работы }
    Fdelta: float; { Толщина ремня }
    Tip_pl: word;
    alfa_min: float; { Минимально допустимый угол обхвата }
    nyu_max: float;  { Максимально допустимое число пробегов }
    V_max: float;    { Максимально допустимая скорость ремня }
    f_pr: float;     { Приведенный коэффициент трения }
{---------------------------------------------------------------}
    a: float;     { Фактическое межосевое расстояние передачи }
    d2: float;    { Диаметр большого шкива }
    alfa: float;  { Угол охвата ремнем меньшего шкива }
    Vol: float;   { Объем передачи }
    Lh : float;  { долговечность }
    Fb: float;    { Нагрузка на вал от натяжения ветвей ремня }
{---------------------------------------------------------------}
    l: float;     { Длина ремня }
    bs: float;    { Ширина шкива }
    u: float;     { Фактическое передаточное число }
    n2: float;    { Число оборотов ведомого шкива }
    V: float;     { Линейная скорость ремня }
    nyu: float;   { Число пробегов ремня в секунду }
    Ft: float;    { Окружное усилие в передаче }
    F0: float;    { Сила предварительного натяжения ремня }
    z: byte;     { Число слоев кордткани }
    b: float;     { Ширина ремня }
{-------------------------------------------------------------------------}

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
  RFlatStrapTransCAD: TStreamRec = (
    ObjType: 1111;
    VmtLink: Ofs(TypeOf(TFlatStrapTransCAD)^);
    Load: @TFlatStrapTransCAD.Load;
    Store: @TFlatStrapTransCAD.Store
  );

IMPLEMENTATION
Uses
  Drivers, App, Dialogs, Common, obRead, GOST;

PROCEDURE TFlatStrapTransCAD.InitData;
BEGIN
  N1:=720;
  P1:=2;
  up:=3;
  d1:=0;
  a:=0;
  Q:=0;
  Tip_nat:=True;
  Cp:=1;
  Tip_pl:=0;
  Fdelta:=0;
  alfa_min:=150;
  nyu_max:=5;
  V_max:=20;
  f_pr:=0.25;
END;

PROCEDURE TFlatStrapTransCAD.InitQuality;
BEGIN
  inherited InitQuality;
  QualityList^[0].Title:=NewStr('Межосевое расстояние, мм');
  QualityList^[0].Value:=2;
  QualityList^[0].Minimize:=True;
  QualityList^[1].Title:=NewStr('Диаметр ведомого шкива,мм');
  QualityList^[1].Value:=0;
  QualityList^[1].Minimize:=True;
  QualityList^[2].Title:=NewStr('Угол обхвата, град');
  QualityList^[2].Value:=2;
  QualityList^[2].Minimize:=False;
  QualityList^[3].Title:=NewStr('Объем передачи, дм куб.');
  QualityList^[3].Value:=2;
  QualityList^[3].Minimize:=True;
  QualityList^[4].Title:=NewStr('Долговечность ремня, час');
  QualityList^[4].Value:=2;
  QualityList^[4].Minimize:=False;
  QualityList^[5].Title:=NewStr('Давление на вал, Н');
  QualityList^[5].Value:=2;
  QualityList^[5].Minimize:=True;
END;

PROCEDURE TFlatStrapTransCAD.MakeVersionStrings (AStrings: PCollection);
Var
  FmtStr: string;
  ValStr: array [0..14] of string[7];
  Params: array [0..16,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s %15s';
  Angle: array [0..2] of string[14] = (
  'Менее 60°',
  'От 60° до 80°',
  'Более 80°');
  Travel: array[boolean] of string[15] = (
  'Автоматическое',
  'Периодическое');
  CordType: array[0..6] of string[8] = (
  'Б-800',
  'БКНЛ-65',
  'ТА-150',
  'ТК-150',
  'ТК-200-2',
  'ТА-300',
  'ТК-300');
  ParamsName: array [0..16] of string [40] = (
  'Расчетный диаметр первого шкива, мм',
  'Расчетный диаметр второго шкива, мм',
  'Межосевое расстояние, мм',
  'Длина ремня, мм',
  'Толщина ремня, мм',
  'Ширина шкива, мм',
  'Ширина ремня, мм',
  'Усилие предварительного нятяжения, Н',
  'Давление на валы от натяжения ремня, Н',
  'Долговечность ремня, час',

  'Мощность на ведущем валу, кВт',
  'Частота оборотов ведущего шкива, об/мин',
  'Передаточное число',
  'Угол наклона передачи',
  'Коэффициент режима работы',
  'Натяжение ремня',
  'Тип кордной ткани');

BEGIN
  Str(d1:0:1,ValStr[0]);
  Str(d2:0:1,ValStr[1]);
  Str(a:0:2,ValStr[2]);
  Str(l:0:1,ValStr[3]);
  Str(Fdelta:0:2,ValStr[4]);
  Str(bs:0:1,ValStr[5]);
  Str(b:0:1,ValStr[6]);
  Str(F0:0:1,ValStr[7]);
  Str(Fb:0:1,ValStr[8]);
  Str(Lh:0:1, ValStr[9]);

  Str(P1:0:2,ValStr[10]);
  Str(N1:0:2,ValStr[11]);
  Str(u:0:2,ValStr[12]);
  Str(Cp:0:2,ValStr[14]);

  for ItemCount:=0 to 14 do
    Params[ItemCount,1]:=@ValStr[ItemCount];
  Params[13,1]:=@Angle[Q];
  Params[15,1]:=@Travel[Tip_nat];
  Params[16,1]:=@CordType[Tip_pl];
  for ItemCount:=0 to 16 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
  AStrings^.AtInsert(10, NewStr('    Исходные данные'));
END;

PROCEDURE TFlatStrapTransCAD.MakeDataStrings (AStrings: PCollection);
Var
  FmtStr: string;
  ValStr: array [0..6] of string[7];
  Params: array [0..9,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s %15s';
  Angle: array [0..2] of string[14] = (
  'Менее 60°',
  'От 60° до 80°',
  'Более 80°');
  Travel: array[boolean] of string[15] = (
  'Автоматическое',
  'Периодическое');
  CordType: array[0..6] of string[8] = (
  'Б-800',
  'БКНЛ-65',
  'ТА-150',
  'ТК-150',
  'ТК-200-2',
  'ТА-300',
  'ТК-300');
  AUTOMessage: string[4] = 'AUTO';
  ParamsName: array [0..9] of string [40] = (
  'Мощность на ведущем валу, кВт',
  'Частота вращения ведущего шкива, об/мин',
  'Проектное передаточное число',
  'Диаметр ведущего шкива, мм',
  'Межосевое расстояние, мм',
  'Угол наклона передачи',
  'Коэффициент режима работы',
  'Натяжение ремня',
  'Толщина ремня, мм',
  'Тип кордной ткани');

BEGIN
  Str(P1:0:2,ValStr[0]);
  Str(N1:0:2,ValStr[1]);
  Str(up:0:2,ValStr[2]);
  if d1 = 0 then
    ValStr[3]:=AUTOMessage
  else
    Str(d1:0:2,ValStr[3]);
  if a = 0 then
    ValStr[4]:=AUTOMessage
  else
    Str(a:0:2,ValStr[4]);
  Str(Cp:0:2,ValStr[5]);
  if Fdelta = 0 then
    ValStr[6]:=AUTOMessage
  else
    Str(Fdelta:0:1,ValStr[6]);
  Params[0,1]:=@ValStr[0];
  Params[1,1]:=@ValStr[1];
  Params[2,1]:=@ValStr[2];
  Params[3,1]:=@ValStr[3];
  Params[4,1]:=@ValStr[4];
  Params[5,1]:=@Angle[Q];
  Params[6,1]:=@ValStr[5];
  Params[7,1]:=@Travel[Tip_nat];
  Params[8,1]:=@ValStr[6];
  Params[9,1]:=@CordType[Tip_pl];
  for ItemCount:=0 to 9 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
END;

PROCEDURE TFlatStrapTransCAD.ChangeDataItem;
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
    Bruce:=New(PInputReal, Init(R,6,0.1,200,2,SizeOf(float)));
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
  Application^.ExecuteDialog(Dialog, @Up)
END;

PROCEDURE GetFirstDiameter;
Type
  TBoxData = record
    List: PCollection;
    Item: integer;
  end;

Var
  Diameters: PTextCollection;
  ScrollBar: PScrollBar;
  Minimum: float;
  BoxData: TBoxData;
  NumberDiameter: byte;

BEGIN
  Minimum:=1100 * exp(1/3 * ln(P1/N1));

  New(Diameters, Init(10, 3));
  Diameters^.Insert(NewStr('AUTO'));
  for NumberDiameter:=1 to 34 do
    if TArrayD[NumberDiameter] >= Minimum then
    begin
       Str(TArrayD[NumberDiameter]:4:0, VS);
       Diameters^.Insert(NewStr(VS));
    end;
  with BoxData do
  begin
    List:=Diameters;
    Item:=0;
  end;

  R.Assign(1, 1, 40, 14);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(36, 3, 37, 9);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 3, 36, 9);
    Bruce:=New(PListBox, Init(R, 5, ScrollBar));
    Insert(Bruce);
    R.Assign(2, 2, 36, 3);
    Insert(New(PLabel, Init(R, 'Диаметр ведущего шкива:', Bruce)));

    R.Assign(3, 10, 17, 12);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);
    R.Move(17, 0);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @BoxData);
  Val(PString(Diameters^.At(BoxData.Item))^, d1, TC);
  Dispose(Diameters, Done);
END;

PROCEDURE GetWheelDistance;
Var
  Minimum: float;

BEGIN
  if d1=0 then
    Minimum:= 0.6* 1100 * exp(1/3 * ln(P1/N1))*(up+1)
  else
    Minimum:= 0.6*d1*(up+1);
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

PROCEDURE GetAngle;
BEGIN
  R.Assign(1, 1, 60, 9);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 57, 4);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Менее 60°',
      NewSItem('От 60° до 80°',
      NewSItem('Более 80°',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2, 2, 57, 3);
    Insert(New(PLabel, Init(R, 'Угол наклона передачи', Bruce)));
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
  Application^.ExecuteDialog(Dialog, @Q);
END;

PROCEDURE GetWorkMode;
Const
  WorkMode: word = 0;

BEGIN
  R.Assign(1, 1, 60, 10);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 40, 7);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Спокойная, Тп/Тн 1.2',
      NewSItem('Умеренные колебания, Тп/Тн 1.5',
      NewSItem('Значительные колебания, Тп/Тн 2',
      NewSItem('Ударная, Тп/Тн 3',
      nil))))
    ));
    Insert(Bruce);
    R.Assign(2, 2, 40, 3);
    Insert(New(PLabel, Init(R, 'Характер нагрузки передачи', Bruce)));
    R.Assign(Size.X-18, 2, Size.X-3, 4);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);
    R.Move(0, 2);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @WorkMode) = cmOk then
    case WorkMode of
      0: Cp:=1;
      1: Cp:=1.15;
      2: Cp:=1.25;
      3: Cp:=1.55;
    end;
END;

PROCEDURE GetStrapWidth;
BEGIN
  Str(Fdelta:0:1, VS);
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputAUTOReal, Init(R,4,3.9,9,1,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Толщина ремня (3.9 - 9.0), мм', Bruce)));
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
  Application^.ExecuteDialog(Dialog, @Fdelta);
END;

PROCEDURE GetStrapType;
BEGIN
  R.Assign(1, 1, 50, 11);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, Size.X-2, 6);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Б-800',
      NewSItem('БКНЛ-65',
      NewSItem('ТА-150',
      NewSItem('ТК-150',
      NewSItem('ТК-200-2',
      NewSItem('ТА-300',
      NewSItem('ТК-300',
      nil)))))))
    ));
    Insert(Bruce);
    R.Assign(1, 2, Size.X-2, 3);
    Insert(New(PLabel, Init(R, 'Тип кордной ткани', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);
    R.Move(-17, 0);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Tip_pl);
END;

BEGIN
  case Item of
    0: GetPower;
    1: GetFreqency;
    2: GetReduction;
    3: GetFirstDiameter;
    4: GetWheelDistance;
    5: GetAngle;
    6: GetWorkMode;
    7: Tip_Nat:=not Tip_nat;
    8: GetStrapWidth;
    9: GetStrapType;
  end;
END;

PROCEDURE TFlatStrapTransCAD.MakeVersions;
Var
  id, TransChk: byte;
  h: float;
  StartDiam, StartDelta, UserDist: float;

BEGIN
  case Tip_pl of
    0: h:=1.5;
    1: h:=1.5;
    2: h:=1.5;
    3: h:=1.3;
    4: h:=1.4;
    5: h:=1.5;
    6: h:=1.5;
  end;
  StartDiam:=d1;
  StartDelta:=Fdelta;
  UserDist:=a;
  if StartDelta = 0 then
  begin
    z:=3;
    Fdelta:=h * z;
  end;
  repeat
    d1:=StartDiam;
    repeat
      TransChk:=0;
      a:=UserDist;
      MakeVersion(TransChk);
      if TransChk = 0 then
        AddVersion;
      d1:=d1*1.25;
    until (TransChk = erDiam) or (StartDiam <> 0);
    if StartDelta = 0 then
    begin
      Inc(z);
      Fdelta:=h * z;
    end;
  until (StartDelta <> 0) or (z > 6.1);
  inherited MakeVersions;
END;

PROCEDURE TFlatStrapTransCAD.MakeVersion;

PROCEDURE Thickness;
Var
  h : float;

BEGIN
{----------------- Расчет толщины ремня ----------------------}
  case Tip_pl of
    0: h:=1.5;
    1: h:=1.5;
    2: h:=1.5;
    3: h:=1.3;
    4: h:=1.4;
    5: h:=1.5;
    6: h:=1.5;
  end;
  z:=round(Fdelta/h);
  if z < 3 then
    z:=3;
  if z > 6 then
    z:=6 ;
  Fdelta:=z*h;
END;  {---------Конец расчета  толщины ремня-----------------}

PROCEDURE Wheel;
{------------- Расчет ширины ремня, геометрии шкива ------------}
Var
  p0,
  C_alfa,
  C_V,
  C_Q: float;
  ib: byte;

BEGIN
  case Tip_pl of
    0: p0:=3;
    1: p0:=3;
    2: p0:=10;
    3: p0:=10;
    4: p0:=13;
    5: p0:=20;
    6: p0:=20;
  end;
           { коэффициент угла обхвата }
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
  Ft:=19.1E6 * P1 / (n1 * d1);
              { ширина ремня }
  b := Ft / ( z * p0 * C_alfa * C_v * Cp * C_Q ) ;
  TruncGOST (  TArrayB, 1, 32, b, b, ib );
  bs := TArrayB[ ib + 1 ] ;
END; {------------------------------------------------}

PROCEDURE Diameter;
Var
  id: byte;

BEGIN
{----------------- Расчет диаметра ведущего шкива -------------------}
  if d1 <> 0 then
    Exit;
  d1:=1100 * exp(1/3 * ln(P1 / n1));
  TruncGOST( TArrayD, 1, 35, d1, d1, id) ;
END; {--------- Конец расчета d1 --------------------------------------}

PROCEDURE Geometric;
Var
  id2: byte;

BEGIN
{----------------------- Расчет геометрии передачи ------------------------}
  d2:=d1 * up;
  if d2 > TArrayD[38] then
    ErrorCode:=erDiam;
  RoundGOST( TArrayD, 1, 38, d2, d2, id2) ;
  if a = 0 then
    a:=1.5 * (d1 + d2);
  l:=2 * a + Pi * (d1 + d2) / 2 + sqr(d2 - d1) / (4 * a);
  alfa:=180 - (d2 - d1) * 57 / a;
  if alfa < alfa_min then
    ErrorCode:=erAngle;
END;{------------------------------------------------------}

PROCEDURE Kinematic;
{--------- Расчет кинематических параметров передачи -------}
Var
  C: float;

BEGIN
  C:=0.99;
  u:=d2/(C * d1);
  n2:=n1 * d1 * C / d2;
  V:=Pi * d1 * n1 / 60000;
  if V > V_max then
    ErrorCode:=erSpeed;
  nyu:=1000 * V/l;
  if nyu > nyu_max then
    ErrorCode:=erRunway;
END; {-------- Конец процедуры Kinematic-----------------------}

PROCEDURE Forces;
{------------------ Расчет сил ------------------------}

Var  F1, F2, alfa_c, m, Sigma_E, q: float;
{     F1 - натяжение ведущей ветви;
     F2 - натяжение ведомой ветви;
     Fb - давление на валы ремня;
     F0 - усилие предварительного натяжения;
     Ft - окружное усилие в передаче }
Const
  f = 0.25;

BEGIN
  alfa_c:=0.7 * alfa * pi / 180;
  m := exp(f_pr * alfa_c);
  F1 := m / (m-1) * Ft;
  F2 := F1 - Ft;
  F0 := Ft / 2 * ((m + 1) / (m - 1));
  Fb := sqrt(sqr(F1) + sqr(F2) + 2 * F1 * F2 * cos(alfa));
  Vol:=(b*(Pi*(sqr(d1)+sqr(d2))+4*a*(d1+d2)))/8*1E-6;
  alfa_c := 0.7 * alfa * pi / 180;
  q := exp(f * alfa_c);
  Sigma_e := q * Ft / (Fdelta * b * (q-1)) + 90 * Fdelta / d1 +
             1.2E-3 * sqr(V);
  Lh := 1.1E6 * l / (V * exp(6 * ln(Sigma_e)));
{  Lh_0 := 60/Sigma_e;}
END; {------------- Конец процедуры Forces-------------------------}

BEGIN
  Thickness;
  Diameter;
  Geometric;
  if ErrorCode <> 0 then
    Exit;
  Kinematic;
  Wheel;
  Forces;
END;

FUNCTION TFlatStrapTransCAD.DataEntryPoint;
BEGIN
  DataEntryPoint:=@P1;
END;

FUNCTION TFlatStrapTransCAD.QualityNumber;
BEGIN
  QualityNumber:=6;
END;

FUNCTION TFlatStrapTransCAD.QualityEntryPoint;
BEGIN
  QualityEntryPoint:=@a;
END;

PROCEDURE TFlatStrapTransCAD.PlotVersion;
BEGIN
  inherited PlotVersion(VersionID,Dest);
  writeln(Dest,'0');
  writeln(Dest,d1:0:2);
  writeln(Dest,d2:0:2);
  writeln(Dest,bs:0:2);
  writeln(Dest,9550*P1/N1:0:2);
  writeln(Dest,9550*P1/N1*Up:0:2);
END;
END.