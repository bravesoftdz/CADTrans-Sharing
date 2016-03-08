{$O+}
Unit RollChainTransmission;
{-------------------------------------------------------------------------}
{-   Модуль проектирования передачи роликовой цепью                      -}
{-------------------------------------------------------------------------}
INTERFACE
Uses
  Objects, Views, Designers;

{-------------------------------------------------------------------------}
{-   Ошибки проектирования передачи                                      -}
{-------------------------------------------------------------------------}

Type
{-------------------------------------------------------------------------}
{-   Конструктор передачи                                  -}
{-------------------------------------------------------------------------}
  PRollChainTransCAD = ^TRollChainTransCAD;
  TRollChainTransCAD = object(TDesigner)
{-------------------------------------------------------------------------}
{-  Буфер данных передачи                                                -}
    P1: real;    { Мощность на ведущем шкиве }
    n1: real;    { Число оборотов ведущего шкива }
    up: real;    { Проектное передаточное число }
    Mark: byte;
    z1: byte;
    Ka: word;
    a:  real;
    Lh: word;
    x, y, z, i, j, k: single;
    bet: byte;
    Kd: real;
    Ke: real;

    Step: real;
    d2: real;
    Vol:real;
    Lhe: float;
    Fb: real;
    Weigth: real;

    z2: byte;
    d1: real;
    da1: real;
    da2: real;
    u: real;
    Ft: real;
    B: real;
    L: real;
    Lp: integer;
    W: real;
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
  RRollChainTransCAD: TStreamRec = (
    ObjType: 1117;
    VmtLink: Ofs(TypeOf(TRollChainTransCAD)^);
    Load: @TRollChainTransCAD.Load;
    Store: @TRollChainTransCAD.Store
  );

IMPLEMENTATION
Uses
  Drivers, App, Dialogs, MsgBox, Common, obRead, GOST, ProcCep;

PROCEDURE TRollChainTransCAD.InitData;
BEGIN
  N1:=500;
  P1:=7.5;
  up:=3;
  Mark:=0;
  z1:=0;
  Lh:=5000;
  a:=0;
  Ka:=40;
  Kd:=1;
  Bet:=0;
  X:=1.7;
  Y:=0.5;
  Z:=0.3;
  i:=0.2;
  j:=0.4;
  k:=0.4;
  Ke:=Kd*1*1*1.15*1.5*1.25;
END;

PROCEDURE TRollChainTransCAD.InitQuality;
BEGIN
  inherited InitQuality;
  QualityList^[0].Title:=NewStr('Шаг цепи, мм');
  QualityList^[0].Value:=2;
  QualityList^[0].Minimize:=True;
  QualityList^[1].Title:=NewStr('Диам. ведом. звездочки,мм');
  QualityList^[1].Value:=2;
  QualityList^[1].Minimize:=True;
  QualityList^[2].Title:=NewStr('Объем передачи, дм куб.');
  QualityList^[2].Value:=0;
  QualityList^[2].Minimize:=True;
  QualityList^[3].Title:=NewStr('Долговечность цепи, час');
  QualityList^[3].Value:=2;
  QualityList^[3].Minimize:=False;
  QualityList^[4].Title:=NewStr('Сила давления на валы, Н');
  QualityList^[4].Value:=2;
  QualityList^[4].Minimize:=True;
  QualityList^[5].Title:=NewStr('Масса передачи, кг');
  QualityList^[5].Value:=2;
  QualityList^[5].Minimize:=True;
END;

PROCEDURE TRollChainTransCAD.MakeVersionStrings;
Var
  FmtStr: string;
  ValStr: array [0..16] of string[16];
  Params: array [0..16,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s %15s';
  ParamsName: array [0..16] of string [45] = (
  'Делительный диаметр ведущ. звездочки, мм',
  'Делительный диаметр ведом. звездочки, мм',
  'Диаметр вершин ведущей звездочки, мм',
  'Диаметр вершин ведомой звездочки, мм',
  'Число зубьев ведущей звездочки',
  'Число зубьев ведомой звездочки',
  'Межосевое расстояние, мм',
  'Длина цепи, мм',
  'Количество звеньев',
  'Давление на вал, Н',
  'Расчетный срок службы, час',

  'Мощность на ведущем валу, кВт',
  'Частота вращен. ведущ. звездочки, об/мин',
  'Марка цепи',
  'Срок службы, час',
  'Коэффициент эксплуатации',
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
  Str(Lp, ValStr[8]);
  Str(Fb:0:2,ValStr[9]);
  Str(Lhe:0:0,ValStr[10]);

  Str(P1:0:2,ValStr[11]);
  Str(N1:0:2,ValStr[12]);
  ValStr[13]:=TipRc[Mark];
  Str(Lh:0,ValStr[14]);
  Str(Ke:0:1,ValStr[15]);
  Str(U:0:2,ValStr[16]);

  for ItemCount:=0 to 16 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
  AStrings^.AtInsert(11, NewStr('    Исходные данные'));
END;

PROCEDURE TRollChainTransCAD.MakeDataStrings;
Var
  FmtStr: string;
  ValStr: array [0..7] of string[17];
  Params: array [0..7,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s%17s';
  AUTOMessage: string[4] = 'AUTO';
  ParamsName: array [0..7] of string [45] = (
  'Мощность на ведущем валу, кВт',
  'Частота вращ. ведущ. звездочки, об/мин',
  'Проектное передаточное число',
  'Марка цепи',
  'Число зубьев ведущей звездочки',
  'Межосевое расстояние, ',
  'Срок службы, ч',
  'Коэффициент эксплуатации');

BEGIN
  ParamsName[5]:='Межосевое расстояние, ';
  Str(P1:0:2,ValStr[0]);
  Str(N1:0:2,ValStr[1]);
  Str(up:0:2,ValStr[2]);
  if Mark = 0 then
    ValStr[3]:=AUTOMessage
  else
    ValStr[3]:=TipRC[Mark];
  if z1 = 0 then
    ValStr[4]:=AUTOMessage
  else
    Str(z1,ValStr[4]);
  if a=0 then
  begin
    Str(Ka,ValStr[5]);
    ParamsName[5]:=ParamsName[5]+'шагов';
  end
  else
  begin
    Str(a:0:2,ValStr[5]);
    ParamsName[5]:=ParamsName[5]+'мм';
  end;
  Str(Lh:0,ValStr[6]);
  Str(Ke:0:2,ValStr[7]);

  for ItemCount:=0 to 7 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
  FmtStr:='Коэффициенты нагружения';
  AStrings^.AtInsert(7, NewStr(FmtStr));
END;

PROCEDURE TRollChainTransCAD.ChangeDataItem;
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
    Insert(New(PLabel, Init(R, 'Частота вращения ведущей звездочки, об/мин',
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
    Bruce:=New(PInputReal, Init(R,5,1,10,2,SizeOf(float)));
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

PROCEDURE GetLifeTime;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputInt, Init(R,5,100,64000,2));
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
  Application^.ExecuteDialog(Dialog, @Lh);
END;

PROCEDURE GetMark;
Type
  TBoxData = record
    List: PCollection;
    Item: integer;
  end;

Var
  Marks: PTextCollection;
  ScrollBar: PScrollBar;
  BoxData: TBoxData;
  NumberMark: byte;

BEGIN
  New(Marks, Init(41, 3));
  Marks^.Insert(NewStr('AUTO'));
  for NumberMark:=1 to 41 do
    Marks^.Insert(NewStr(TipRc[NumberMark]));
  with BoxData do
  begin
    List:=Marks;
    Item:=Mark;
  end;

  R.Assign(1, 1, 63, 15);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-3, 3, Size.X-2, Size.Y-4);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 3, Size.X-3, Size.Y-4);
    Bruce:=New(PListBox, Init(R, 3, ScrollBar));
    Insert(Bruce);
    R.Assign(2, 2, 36, 3);
    Insert(New(PLabel, Init(R, 'Марка цепи:', Bruce)));

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
  if Application^.ExecuteDialog(Dialog,@BoxData) = cmOk then
    Mark:=BoxData.Item;
  Dispose(Marks, Done);
END;

PROCEDURE GetWheelDistance;
Var
  TKa: word;

BEGIN
  R.Assign(1, 1, 61, 11);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 58, 4);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('20',
      NewSItem('30',
      NewSItem('40',
      NewSItem('50',
      NewSItem('60',
      NewSItem('70',
      NewSItem('80',
      nil)))))))
    ));
    Insert(Bruce);
    R.Assign(2, 2, 58, 3);
    Insert(New(PLabel, Init(R, 'Межосевое расстояние, шагов', Bruce)));
    R.Assign(48, 5, 58, 6);
    Bruce:=New(PInputAUTOReal, Init(R,7,0,0,2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 5, 48, 6);
    Insert(New(PLabel, Init(R, 'Межосевое расстояние, мм', Bruce)));

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
  TKa:=Ka;
  if Ka <> 0 then
    Ka:=trunc((Ka-20)/10);
  if Application^.ExecuteDialog(Dialog,@Ka) = cmOk then
  begin
    if a = 0 then
      Ka:=Ka*10+20
    else
      Ka:=0;
  end
  else
    Ka:=TKa;
  if Ka < 40 then
    Ke:=Ke*1.25
  else if Ka > 60 then
    Ke:=Ke*0.8;
END;

PROCEDURE GetCogs;
Var
  FC: float;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputAUTOReal, Init(R,3,7,150,0,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Число зубьев ведущей звездочки', Bruce)));
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
  FC:=z1;
  if Application^.ExecuteDialog(Dialog, @FC) = cmOk then
    z1:=trunc(FC);
END;

PROCEDURE GetCycleTable;
Var
  Temp: Pointer;
  EState: word;

BEGIN
  GetMem(Temp, SizeOf(single)*6);
  Move(X, Temp^, SizeOf(single)*6);
  repeat
    Dialog:=PDialog(RezFile.Get('Циклограмма'));
    EState:=Application^.ExecuteDialog(Dialog,@X);
    if EState = cmOk then
    begin
      if not((i+j+k < 1.01) and (i+j+k > 0.99)) then
        MessageBox(#3+'i+j+k должно быть равно 1',nil,
                      mfError+mfOkButton);
    end
    else
      Move(Temp^,X,SizeOf(single)*6);
  until ((i+j+k < 1.01) and (i+j+k > 0.99)) or (EState = cmCancel);
  FreeMem(Temp, SizeOf(single)*6);
END;

PROCEDURE GetExploitation;
Const
  DlgData: record
    Travel: word;
    Change: word;
    Oil: word;
    Load: word;
    Rotation: byte;
  end = (Travel:1; Change:1; Oil:3; Load:0; Rotation:0);

  TravelData: array [0..2] of real = (1, 1.15, 1.25);
  ChangeData: array [0..2] of real = (1, 1.25, 1.45);
  OilData:    array [0..3] of real = (0.8, 0.8, 1, 1.5);
  LoadData:   array [0..2] of real = (1, 1.4, 1.8);

BEGIN
  R.Assign(1, 1, 60, 20);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 32, 6);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Передвижные опоры',
      NewSItem('Нажимной ролик',
      NewSItem('Нерегулируемое натяжение',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2, 2, 30, 3);
    Insert(New(PLabel, Init(R, 'Способ натяжения цепи', Bruce)));
    R.Assign(35, 3, Size.X-2, 6);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('1 сменные',
      NewSItem('2 сменные',
      NewSItem('3 сменные',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(35, 2, Size.X-2, 3);
    Insert(New(PLabel, Init(R, 'Сменность', Bruce)));
    R.Assign(2, 8, 32, 12);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Картерная',
      NewSItem('Циркуляционная',
      NewSItem('Капеллярная',
      NewSItem('Периодическая',
      nil))))
    ));
    Insert(Bruce);
    R.Assign(2, 7, 32, 8);
    Insert(New(PLabel, Init(R, 'Способ смазки', Bruce)));
    R.Assign(35, 8, Size.X-2, 11);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Спокойная',
      NewSItem('С толчками',
      NewSItem('Сильные удары',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(35, 7, Size.X-2, 8);
    Insert(New(PLabel, Init(R, 'Характер нагрузки', Bruce)));
    R.Assign(27, 13, 32, 14);
    Bruce:=New(PInputInt, Init(R,2,0,90,1));
    Insert(Bruce);
    R.Assign(2, 13, 27, 14);
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
  if Application^.ExecuteDialog(Dialog, @DlgData) = cmOk then
  begin
    with DlgData do
    begin
      Ke:=TravelData[Travel]*OilData[Oil]*ChangeData[Change]*LoadData[Load];
      Kd:=LoadData[Load];
      Bet:=Rotation;
    end;
    if Bet > 60 then
      Ke:=Ke*1.25;
  end;
END;

BEGIN
  case Item of
    0: GetPower;
    1: GetFreqency;
    2: GetReduction;
    3: GetMark;
    4: GetCogs;
    5: GetWheelDistance;
    6: GetLifeTime;
    7: GetCycleTable;
    8: GetExploitation;
  end;
END;

PROCEDURE TRollChainTransCAD.MakeVersions;
Var
  TransChk: byte;
  CountCogs, StartMark, StartCog: byte;
  UserDist: real;

BEGIN
  StartMark:=Mark;
  StartCog:=z1;
  UserDist:=a;
  if StartMark = 0 then
    Mark:=1;
  repeat
     if StartCog = 0 then
        begin
          z1:= Round((29 - 2*Up));
          if not odd(z1) then z1:=z1 + 1;
        end;
    CountCogs:=0;
    repeat
      TransChk:=0;
      a:=UserDist;
      MakeVersion(TransChk);
      if (TransChk = 0) or (TransChk = 8) then
        AddVersion;
      Inc(z1, 2);
      Inc(CountCogs);
    until (StartCog <> 0) or (CountCogs = 3) or (TransChk = 8);
    Inc(Mark);
  until (StartMark <> 0) or (Mark > 41);
  inherited MakeVersions;
END;

PROCEDURE TRollChainTransCAD.MakeVersion;

Var
  Z1min: byte;
  IZmin: byte;
  IZmax: byte;
  IT: byte;
  Ip: byte absolute Mark;
  INS: byte;
  IB: byte;
  IS: byte;
  Ia: byte;
  IWmax: byte;
  Khp: real;
  IPP: byte;
  Da: real;
  Amin: real;
  Amin1: real;
  Nmax: real;
  Frazr: real;
  Wmax: real;
  Khe: real;
  N2: real;
  Nrad : byte;
  P: real;
  V: real;
  Tip : real;


BEGIN
       Tip := 1;
       p := PstR[IP,1];  Nrad :=trunc(PstR[IP, 2]);
             {   Подбор чисел зубьев  }
       PP3(Up, Tip, Kd, N1, z1, z2, U, N2, IZmin, IZmax);
          if IZmin = 0 Then
              begin
                ErrorCode := 1;
                Exit;
              end;
          if IZmax = 0 Then
              begin
                ErrorCode := 2;
                Exit;
              end;
          Khe:=i+j * x + k * y * z;
          Case  Nrad of
                1: Khp:= 1;
                2: Khp:= 1.15;
                3: Khp:= 1.25;
                4: Khp:= 1.35;
             End;
          {  Проверка собираемости передачи по межосевому рассоянию }
          Da1 := P*(0.5+Cos(Pi/z1)/(sin(Pi/z1)));
          if U < 4 then Amin := 0.6 * Da1 * (U + 1)
                   else Amin := Da1 * ( U + 1);
          if a = 0 then a := Ka * P;
          if a < Amin  then
                begin
                  ErrorCode := 3;
                  Exit;
                end;
          if Ka = 0 then
              begin
                Ka:=Round( A / P);
                if Ka > 60  then  Ke := Ke * 0.8 / 1.25;
              end
                     else  Ka:=Round( A / P);
          Ft:= P1* 1000 * 60000 / ( z1*P*N1 );
          Lhe:=510000*Exp(0.167*Ln(z1))/
               (Ft*Ke*Khp)*0.28*Nrad*P*Exp(0.33*Ln(U*A*P/N1))/Khe;
          if Lhe < Lh then
            begin
              ErrorCode := 4;
              Exit;
            end;
          If Ka > 80 then  ErrorCode := 5;
           {   Проверка быстроходности передачи    }
       PP4 ( P, N1, Tip, z1, INS);
          If INS = 0 then
             begin
               ErrorCode := 6;
               Exit;
             end;
       {   Проверка износостойкости цепи по среднему давлению в шарнире}
       PP10 (P, P1, N1, U, Ke, Khe, z1, Ka, Nrad, IP, Lh, V, Ft, IPP, IS);
          if IPP=0 then
                Begin
                  ErrorCode := 7;
                  Exit;
                End;
          If IS = 0 Then ErrorCode := 8;
        {      Проверка прочности цепи       }
          B:=0;  IB:=0;
       PP6 (P1, x, N1, Kd, IP, z1, Ka, Nrad, bet, P, B, Fb, IPP, IS);
          if IPP=0 then
                Begin
                  ErrorCode := 7;
                  Exit;
                End;
          If IS = 0 Then ErrorCode := 8;
                {      Расчет размеров цепи          }
       PP5 (P, Tip, bet, z1, z2, Ka, A, L, d1, d2, Da1, Da2, Lp, Ia);
          if IA = 0 then
             begin
               ErrorCode := 9;
               Exit
             end;
         {       Проверка долглвечности по числу ударов     }
       PP7 (z1, N1, P, Tip, Lp, IWmax);
          If IWmax = 0 then
             begin
               ErrorCode := 10;
               Exit;
             end;

        Weigth := PstR[IP,6] * L * 1E-3 +
                 1E-6 * 7.81 * (sqr(Da1) * 0.25 * Pi * PstR[IP,7]*(1.1+Nrad)+
                 sqr(Da2) * 0.25 * Pi * PstR[IP,7] * (1.1 + Nrad));
        Vol := (PstR[IP,7] * (1.1 + Nrad) *
               (Pi * (sqr(Da1) + sqr(Da2)) + 4 * a * (Da1 + Da2))) / 8 * 1E-6;
        Step:=PstR[Mark,1];
END;

FUNCTION TRollChainTransCAD.DataEntryPoint;
BEGIN
  DataEntryPoint:=@P1;
END;

FUNCTION TRollChainTransCAD.QualityNumber;
BEGIN
  QualityNumber:=6;
END;

FUNCTION TRollChainTransCAD.QualityEntryPoint;
BEGIN
  QualityEntryPoint:=@Step;
END;

PROCEDURE TRollChainTransCAD.PlotVersion;
BEGIN
  inherited PlotVersion(VersionID,Dest);
  writeln(Dest,'5');
  writeln(Dest,Mark);
  writeln(Dest,TipRc[Mark]);
  writeln(Dest,z1);
  writeln(Dest,z2);
  writeln(Dest,9550*P1/N1:0:2);
  writeln(Dest,9550*P1/N1*Up:0:2);
END;
END.