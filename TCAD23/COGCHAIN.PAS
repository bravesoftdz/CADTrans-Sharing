{$O+}
Unit CogChainTransmission;
{-------------------------------------------------------------------------}
{-   Модуль проектирования передачи зубчатой цепью.                      -}
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
  PCogChainTransCAD = ^TCogChainTransCAD;
  TCogChainTransCAD = object(TDesigner)
{-------------------------------------------------------------------------}
{-  Буфер данных передачи                                                -}
    P1: real;    { Мощность на ведущем шкиве }
    n1: real;    { Число оборотов ведущего шкива }
    up: real;    { Проектное передаточное число }
    Mark: byte;
    z1: byte;
    Ka: word;
    a:  real;
    x, y, z, i, j, k: single;
    bet: byte;
    Kd: real;
    Ke: real;

    Step: real;
    d2: real;
    Vol:real;
    Fb: real;
    Weigth: real;

    z2: byte;
    d1: real;
    da1: real;
    da2: real;
    u: real;
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
  RCogChainTransCAD: TStreamRec = (
    ObjType: 1118;
    VmtLink: Ofs(TypeOf(TCogChainTransCAD)^);
    Load: @TCogChainTransCAD.Load;
    Store: @TCogChainTransCAD.Store
  );

IMPLEMENTATION
Uses
  Drivers, App, Dialogs, MsgBox, Common, obRead, GOST, ProcCep;

PROCEDURE TCogChainTransCAD.InitData;
BEGIN
  N1:=500;
  P1:=7.5;
  up:=3;
  Mark:=0;
  z1:=0;
  a:=0;
  Ka:=50;
  Kd:=1;
  Bet:=0;
  X:=1.7;
  Y:=0.5;
  Z:=0.3;
  i:=0.1;
  j:=0.5;
  k:=0.4;
  Ke:=Kd*1*1*1.15*1.5*1.25;
END;

PROCEDURE TCogChainTransCAD.InitQuality;
BEGIN
  inherited InitQuality;
  QualityList^[0].Title:=NewStr('Шаг цепи, мм');
  QualityList^[0].Value:=2;
  QualityList^[0].Minimize:=True;
  QualityList^[1].Title:=NewStr('Диам. ведом. звездочки,мм');
  QualityList^[1].Value:=2;
  QualityList^[1].Minimize:=True;
  QualityList^[2].Title:=NewStr('Объем передачи, дм куб.');
  QualityList^[2].Value:=2;
  QualityList^[2].Minimize:=True;
  QualityList^[3].Title:=NewStr('Сила давления на валы, Н');
  QualityList^[3].Value:=2;
  QualityList^[3].Minimize:=True;
  QualityList^[4].Title:=NewStr('Масса передачи, кг');
  QualityList^[4].Value:=2;
  QualityList^[4].Minimize:=True;
END;

PROCEDURE TCogChainTransCAD.MakeVersionStrings;
Var
  FmtStr: string;
  ValStr: array [0..15] of string[17];
  Params: array [0..15,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s%17s';
  ParamsName: array [0..15] of string [43] = (
  'Мощность на ведущем валу, кВт',
  'Частота вращ. ведущ. звездочки, об/мин',
  'Проектное передаточное число',
  'Межосевое расстояние, мм',
  'Коэффициент эксплуатации',
  'Марка цепи',
  'Длина цепи, мм',
  'Количество звеньев',
  'Давление на вал, Н',
  'Передаточное число',
  'Число зубьев ведущей звездочки',
  'Число зубьев ведомой звездочки',
  'Делительный диам. ведущ. звездочки, мм',
  'Делительный диам. ведомой звездочки, мм',
  'Диаметр вершин ведущей звездочки, мм',
  'Диаметр вершин ведомой звездочки, мм');


BEGIN
  Str(P1:0:1,ValStr[0]);
  Str(N1:0:1,ValStr[1]);
  Str(Up:0:2,ValStr[2]);
  Str(a:0:2,ValStr[3]);
  Str(Ke:0:1,ValStr[4]);
  ValStr[5]:=TipZc[Mark];
  Str(L:0:1,ValStr[6]);
  Str(Lp, ValStr[7]);
  Str(Fb:0:1,ValStr[8]);
  Str(U:0:2,ValStr[9]);
  Str(z1,ValStr[10]);
  Str(z2,ValStr[11]);
  Str(d1:0:2,ValStr[12]);
  Str(d2:0:2,ValStr[13]);
  Str(Da1:0:2,ValStr[14]);
  Str(Da2:0:2,ValStr[15]);

  for ItemCount:=0 to 15 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
END;

PROCEDURE TCogChainTransCAD.MakeDataStrings;
Var
  FmtStr: string;
  ValStr: array [0..6] of string[17];
  Params: array [0..6,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s%17s';
  AUTOMessage: string[4] = 'AUTO';
  ParamsName: array [0..6] of string [40] = (
  'Мощность на ведущем валу, кВт',
  'Частота вращ. ведущ. звездочки, об/мин',
  'Проектное передаточное число',
  'Марка цепи',
  'Число зубьев ведущей звездочки',
  'Межосевое расстояние, ',
  'Коэффициент эксплуатации');

BEGIN
  ParamsName[5]:='Межосевое расстояние, ';
  Str(P1:0:2,ValStr[0]);
  Str(N1:0:2,ValStr[1]);
  Str(up:0:2,ValStr[2]);
  if Mark = 0 then
    ValStr[3]:=AUTOMessage
  else
    ValStr[3]:=TipZC[Mark];
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
  Str(Ke:0:2,ValStr[6]);

  for ItemCount:=0 to 6 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
  FmtStr:='Коэффициенты нагружения';
  AStrings^.AtInsert(7, NewStr(FmtStr));
END;

PROCEDURE TCogChainTransCAD.ChangeDataItem;
Var
  Dialog: PDialog;
  Bruce:  PView;
  R:      TRect;

PROCEDURE GetPower;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-13, 2, Size.X-3, 3);
    Bruce:=New(PInputReal, Init(R, 6, 0.5, 200, 2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(1, 2, Size.X-13, 3);
    Insert(New(PLabel, Init(R, 'Мощность на ведущем валу, кВт', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
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
    Bruce:=New(PInputReal, Init(R, 8, 10, 10000, 2,SizeOf(float)));
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
    Bruce^.HelpCtx:=hcCancel;
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
    Bruce:=New(PInputReal, Init(R, 5, 1, 15, 2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Проектное передаточное число', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Up);
END;

PROCEDURE GetMark;
Type
  TBoxData = record
    List: PCollection;
    Item: integer;
  end;

Var
  Marks: PTextCollection;
  ScCogBar: PScrollBar;
  BoxData: TBoxData;
  NumberMark: byte;
  StrNum: string[4];
  ValNum: real;
  ValidConvert: integer;

BEGIN
  New(Marks, Init(25, 3));
  Marks^.Insert(NewStr('AUTO'));
  for NumberMark:=1 to 25 do
    Marks^.Insert(NewStr(TipZc[NumberMark]));
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
    New(ScCogBar, Init(R));
    Insert(ScCogBar);
    R.Assign(2, 3, Size.X-3, Size.Y-4);
    Bruce:=New(PListBox, Init(R, 3, ScCogBar));
    Insert(Bruce);
    R.Assign(2, 2, 36, 3);
    Insert(New(PLabel, Init(R, 'Марка цепи:', Bruce)));

    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @BoxData) = cmOk then
    Mark:=BoxData.Item;
  Dispose(Marks, Done);
END;

PROCEDURE GetWheelDistance;
Var
  TempKa: word;

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
    Bruce:=New(PInputAUTOReal, Init(R, 7, 0, 0, 2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 5, 48, 6);
    Insert(New(PLabel, Init(R, 'Межосевое расстояние, мм', Bruce)));

    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  TempKa:=Ka;
  if Ka <> 0 then
    Ka:=trunc((Ka-20)/10);
  if Application^.ExecuteDialog(Dialog, @Ka) = cmOk then
  begin
    if a = 0 then
      Ka:=Ka*10+20
    else
      Ka:=0;
  end
  else
    Ka:=TempKa;
  if Ka < 40 then
    Ke:=Ke*1.25
  else if Ka > 60 then
    Ke:=Ke*0.8;
END;

PROCEDURE GetCogs;
Var
  Temp: float;

BEGIN
  Temp:=z1;
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputAUTOReal, Init(R, 3, 7, 150, 0,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, 'Число зубьев ведущей звездочки', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @Temp) = cmOk then
    z1:=Trunc(Temp);
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
    Bruce:=New(PInputInt, Init(R, 2, 0, 90,1));
    Insert(Bruce);
    R.Assign(2, 13, 27, 14);
    Insert(New(PLabel, Init(R, 'Угол наклона передачи', Bruce)));


    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog,@DlgData) = cmOk then
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
    6: GetExploitation;
    7: GetCycleTable;
  end;
END;

PROCEDURE TCogChainTransCAD.MakeVersions;
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
          z1:= Round((31 - 2*Up));
          if not odd(z1) then z1:=z1 + 1;
        end;
    CountCogs:=0;
    repeat
      TransChk:=0;
      a:=UserDist;
      MakeVersion(TransChk);
      if TransChk = 0 then
        AddVersion;
      Inc(z1, 2);
      Inc(CountCogs);
    until (StartCog <> 0) or (CountCogs = 3);
    Inc(Mark);
  until (StartMark <> 0) or (Mark > 25);
  inherited MakeVersions;
END;

PROCEDURE TCogChainTransCAD.MakeVersion;
            { Главная процедура синтеза цепной передачи с зубчатой цепью}
          Var
          P,
          V,
          Ft,
          Da,
          Khe,
          Khp,
          Frazr,
          Amin1,
          Amin,
          u1,
          n2,
          Lpp,
          Lpmin1,
          Lpmin: Real;
          IW,
          Z1min,
          IA,
          IS,
          IB,
          IPP,
          IWmax,
          INs,
          IZmin,
          IZmax,
          IT,
          IAmin,
          I1,
          IJ,
          IP1: byte;
          Ip: byte absolute Mark;
          Otw: char;
          G : Word;
          Tip: real;
BEGIN
  Tip := 1.3;
  p := PstZ[IP,1];  B := PstZ[IP, 3];

  {  Подбор чисел зубьев }
  PP3(Up, Tip, Kd, N1, z1, z2, U, N2, IZmin, IZmax );
    if IZmin = 0 Then
      Begin
        ErrorCode := 1;
        Exit;
      End;
    if IZmax = 0 Then
      Begin
        ErrorCode := 2;
        Exit;
      End;

{  Проверка применимости передачи по моменту  }
  PP2 (P1, N1, U, Ke, Tip, z1, IT);
    If IT=0 Then
      Begin
        ErrorCode := 3;
        Exit;
      End;
    Khe:=i+j * y + k * z;
{  Проверка собираемости передачи по межосевому рассоянию }
    Da1 := P * (0.5 + Cos(Pi / z1) / (sin(Pi / z1)));
    if U < 4 then Amin := 0.6 * Da1 * (U + 1)
             else Amin := Da1 * ( U + 1);
    if a = 0 then a := Ka * P;
    if a < Amin  then
                   begin
                     ErrorCode := 4;
                     Exit;
                   end;
    if Ka = 0 then
                begin
                  Ka:=Round( A / P);
                  if Ka > 60  then  Ke := Ke * 0.8 / 1.25;
                end
              else  Ka:=Round( A / P);
    If Ka > 80 then  ErrorCode := 5;

{   Проверка быстроходности передачи    }
  PP4 (P, Tip, N1, z1, INS);
    if INS=0  then
        Begin
           ErrorCode := 6;
           Exit;
        End;

{      Проверка прочности цепи       }
  PP6B (P1, x, n1, Kd, PstR[Mark,6],
        z1, Ka, bet,
        P,
        B,
        IP,
        Fb,
        Is);
    If Is=0  Then
       Begin
         ErrorCode := 7;
         Exit;
       end;
{      Расчет размеров цепи    }
     A := A / 0.993;
  PP5 (P, Tip, bet, z1, z2, Ka, A, L, d1, d2, Da1, Da2, Lp, Ia);
    if IA=0 then
       Begin
          ErrorCode := 8;
          Exit;
       End;

{       Проверка долгoвечности по числу ударов     }
  PP7 (z1, N1, P, Tip, Lp, IWmax);
     If IWmax = 0 then
        begin
          ErrorCode :=9;
          Exit;
        end;
    Weigth := PstZ[IP, 4] * L * 1E-3 +
              1E-6 * 7.81 *((sqr(Da1) * 0.25 * Pi * 1.1 * B) +
              sqr(Da2) * 0.25 * Pi * 1.1 * B);
    Vol := 1E-6 * (1.1 * B) * (Pi * (sqr(Da1) + sqr(Da2)) +
                               4 * a * (Da1 + Da2)) / 8;
    Step:=PstZ[Mark,1];
END;

FUNCTION TCogChainTransCAD.DataEntryPoint;
BEGIN
  DataEntryPoint:=@P1;
END;

FUNCTION TCogChainTransCAD.QualityNumber;
BEGIN
  QualityNumber:=5;
END;

FUNCTION TCogChainTransCAD.QualityEntryPoint;
BEGIN
  QualityEntryPoint:=@Step;
END;

PROCEDURE TCogChainTransCAD.PlotVersion;
BEGIN
  inherited PlotVersion(VersionID,Dest);
  writeln(Dest,'6');
  writeln(Dest,Mark);
  writeln(Dest,TipZc[Mark]);
  writeln(Dest,z1);
  writeln(Dest,z2);
  writeln(Dest,9550*P1/N1:0:2);
  writeln(Dest,9550*P1/N1*Up:0:2);
END;
END.