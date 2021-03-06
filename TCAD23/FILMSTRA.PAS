{$O+}
Unit FilmStrapTransmission;
{-------------------------------------------------------------------------}
{-   ����� �஥��஢���� ��।�� ���᪨� ������� ६���.                      -}
{-------------------------------------------------------------------------}
INTERFACE
Uses
  Objects, Views, Designers;

Const
{-------------------------------------------------------------------------}
{-   �訡�� �஥��஢���� ��।��                                      -}
{-------------------------------------------------------------------------}
  erDiam    = 1;  {- ���� ����� �ਭ� ६��     -}
  erAngle   = 2;  {- ��� 㣮� ��墠�            -}
  erSpeed   = 3;  {- ������ ᪮���� ६��       -}
  erRunway  = 4;  {- ������ �᫮ �஡���� ६�� -}
  erLength  = 5;  {- ������ ����� ६�� -}
  erWidthStrap = 6;

Type
{-------------------------------------------------------------------------}
{-   ��������� ��।�� ���᪨� ६���                                 -}
{-------------------------------------------------------------------------}
  PFilmStrapTransCAD = ^TFilmStrapTransCAD;
  TFilmStrapTransCAD = object(TDesigner)
{-------------------------------------------------------------------------}
{-  ���� ������ ��।��                                                -}
    P1: real;    { ��魮��� �� ����饬 誨�� }
    n1: real;    { ��᫮ ����⮢ ����饣� 誨�� }
    up: real;    { �஥�⭮� ��।��筮� �᫮ }
    d1: real;    { ������� ������ 誨�� }
    Q: word;     { ���� ������� ��।�� � ��ਧ���� }
    Tip_nat: boolean; { ���殮��� ६�� }
    Cp: real;    { �����樥�� ०��� ࠡ��� }
    Sdelta: real; { ���騭� ६�� }
    Tip_pl: word;
    alfa_min: real; { �������쭮 �����⨬� 㣮� ��墠� }
    nyu_max: real;  { ���ᨬ��쭮 �����⨬�� �᫮ �஡���� }
    V_max: real;    { ���ᨬ��쭮 �����⨬�� ᪮���� ६�� }
    f_pr: real;     { �ਢ������ �����樥�� �७�� }

    a: real;     { �����᪮� ����ᥢ�� ����ﭨ� ��।�� }
    d2: real;    { ������� ����讣� 誨�� }
    alfa: real;  { ���� �墠� ६��� ����襣� 誨�� }
    Vol: real;   { ��ꥬ ��।�� }
    Lh: real;  { �������筮��� }

    Fb: real;    { ����㧪� �� ��� �� ���殮��� ��⢥� ६�� }
    l: real;     { ����� ६�� }
    bs: real;    { ��ਭ� 誨�� }
    u: real;     { �����᪮� ��।��筮� �᫮ }
    n2: real;    { ��᫮ ����⮢ �������� 誨�� }
    V: real;     { �������� ᪮���� ६�� }
    nyu: real;   { ��᫮ �஡���� ६�� � ᥪ㭤� }
    Ft: real;    { ���㦭�� �ᨫ�� � ��।�� }
    F0: real;    { ���� �।���⥫쭮�� ���殮��� ६�� }
    z: byte;     { ��᫮ ᫮�� ���⪠�� }
    b: real;     { ��ਭ� ६�� }

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
  RFilmStrapTransCAD: TStreamRec = (
    ObjType: 1112;
    VmtLink: Ofs(TypeOf(TFilmStrapTransCAD)^);
    Load: @TFilmStrapTransCAD.Load;
    Store: @TFilmStrapTransCAD.Store
  );

IMPLEMENTATION
Uses
  Drivers, App, Dialogs, Common, obRead, GOST;

PROCEDURE TFilmStrapTransCAD.InitData;
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
  Sdelta:=0;
  alfa_min:=150;
  nyu_max:=50;
  V_max:=100;
  f_pr:=0.25;
END;

PROCEDURE TFilmStrapTransCAD.InitQuality;
BEGIN
  inherited InitQuality;
  QualityList^[0].Title:=NewStr('����ᥢ�� ����ﭨ�,��');
  QualityList^[0].Value:=2;
  QualityList^[0].Minimize:=True;
  QualityList^[1].Title:=NewStr('������� �����. 誨��, ��');
  QualityList^[1].Value:=0;
  QualityList^[1].Minimize:=True;
  QualityList^[2].Title:=NewStr('���� ��墠�, �ࠤ.');
  QualityList^[2].Value:=2;
  QualityList^[2].Minimize:=False;
  QualityList^[3].Title:=NewStr('��ꥬ ��।��, �� ��.');
  QualityList^[3].Value:=2;
  QualityList^[3].Minimize:=True;
  QualityList^[4].Title:=NewStr('�������筮��� ६��, ��');
  QualityList^[4].Value:=2;
  QualityList^[4].Minimize:=False;
  QualityList^[5].Title:=NewStr('�������� �� ���, �');
  QualityList^[5].Value:=2;
  QualityList^[5].Minimize:=True;
END;

PROCEDURE TFilmStrapTransCAD.MakeVersionStrings (AStrings: PCollection);
Var
  FmtStr: string;
  ValStr: array [0..15] of string[7];
  Params: array [0..15,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s %15s';
  Angle: array [0..2] of string[14] = (
  '����� 60�',
  '�� 60� �� 80�',
  '����� 80�');
  Travel: array[boolean] of string[15] = (
  '��⮬���᪮�',
  '��ਮ���᪮�');
  ParamsName: array [0..15] of string [40] = (
  '������ ������� ��ࢮ�� 誨��, ��',
  '������ ������� ��ண� 誨��, ��',
  '����ᥢ�� ����ﭨ�, ��',
  '����� ६��, ��',
  '��ਭ� 誨��, ��',
  '��ਭ� ६��, ��',
  '�ᨫ�� �।���⥫쭮�� ���殮���, �',
  '�������� �� ���� �� ���殮��� ६��, �',
  '�������筮��� ६��, ��',

  '��魮��� �� ����饬 ����, ���',
  '����� ��饭�� �����. 誨��, ��/���',
  '��।��筮� �᫮',
  '���� ������� ��।��',
  '�����樥�� ०��� ࠡ���',
  '���殮��� ६��',
  '���騭� ६��, ��');

BEGIN
  Str(d1:0:1,ValStr[0]);
  Str(d2:0:1,ValStr[1]);
  Str(a:0:2,ValStr[2]);
  Str(l:0:1,ValStr[3]);
  Str(bs:0:2,ValStr[4]);
  Str(b:0:1,ValStr[5]);
  Str(F0:0:1,ValStr[6]);
  Str(Fb:0:1,ValStr[7]);
  Str(Lh:0:1, ValStr[8]);

  Str(P1:0:2,ValStr[9]);
  Str(N1:0:2,ValStr[10]);
  Str(u:0:2,ValStr[11]);
  Str(Cp:0:2,ValStr[13]);
  Str(Sdelta:0:1,ValStr[15]);
  for ItemCount:=0 to 15 do
    Params[ItemCount, 1]:=@ValStr[ItemCount];
  Params[12,1]:=@Angle[Q];
  Params[14,1]:=@Travel[Tip_nat];
  for ItemCount:=0 to 15 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
  AStrings^.AtInsert(9, NewStr('    ��室�� �����'));
END;

PROCEDURE TFilmStrapTransCAD.MakeDataStrings (AStrings: PCollection);
Var
  FmtStr: string;
  ValStr: array [0..6] of string[7];
  Params: array [0..8,0..1] of Pointer;
  ItemCount: byte;

Const
  BaseStr = '%-40s %15s';
  Angle: array [0..2] of string[14] = (
  '����� 60�',
  '�� 60� �� 80�',
  '����� 80�');
  Travel: array[boolean] of string[15] = (
  '��⮬���᪮�',
  '��ਮ���᪮�');
  AUTOMessage: string[4] = 'AUTO';
  ParamsName: array [0..8] of string [40] = (
  '��魮��� �� ����饬 ����, ���',
  '����� ��饭�� ����饣� 誨��, ��/���',
  '�஥�⭮� ��।��筮� �᫮',
  '������� ����饣� 誨��, ��',
  '����ᥢ�� ����ﭨ�, ��',
  '���� ������� ��।��',
  '�����樥�� ०��� ࠡ���',
  '���殮��� ६��',
  '���騭� ६��, ��');

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
  if Sdelta = 0 then
    ValStr[6]:=AUTOMessage
  else
    Str(Sdelta:0:1,ValStr[6]);
  Str(Cp:0:2,ValStr[5]);
  Params[0,1]:=@ValStr[0];
  Params[1,1]:=@ValStr[1];
  Params[2,1]:=@ValStr[2];
  Params[3,1]:=@ValStr[3];
  Params[4,1]:=@ValStr[4];
  Params[5,1]:=@Angle[Q];
  Params[6,1]:=@ValStr[5];
  Params[7,1]:=@Travel[Tip_nat];
  Params[8,1]:=@ValStr[6];
  for ItemCount:=0 to 8 do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
END;

PROCEDURE TFilmStrapTransCAD.ChangeDataItem;
Var
  Dialog: PDialog;
  Bruce:  PView;
  R:      TRect;
  VS:     string[8];
  TC:     integer;

PROCEDURE GetPower;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(Size.X-13, 2, Size.X-3, 3);
    Bruce:=New(PInputReal, Init(R,6,0.1,100,2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(1, 2, Size.X-13, 3);
    Insert(New(PLabel, Init(R, '��魮��� �� ����饬 ����, ���', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, '��', cmOk, bfDefault));
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
  New(Dialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputReal, Init(R,8,10,10000,2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, '����� ��饭�� ����饣� 誨��, ��/���',
                                                                Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, '��', cmOk, bfDefault));
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
  New(Dialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputReal, Init(R,5,0.1,10,2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, '�஥�⭮� ��।��筮� �᫮', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, '��', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Up);
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
  if Tip_pl = 0 then
    Minimum:=TArrayD[Round(Array_plen[Tip_pl+1,2])]
  else
    Minimum:=TArrayD[Round(Array_plen[Tip_pl,2])];
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
  New(Dialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(36, 3, 37, 9);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 3, 36, 9);
    Bruce:=New(PListBox, Init(R, 5, ScrollBar));
    Insert(Bruce);
    R.Assign(2, 2, 36, 3);
    Insert(New(PLabel, Init(R, '������� ����饣� 誨��:', Bruce)));

    R.Assign(3, 10, 17, 12);
    Bruce:=New(PButton, Init(R, '��', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);
    R.Move(17, 0);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
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
  New(Dialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(47, 2, 57, 3);
    Bruce:=New(PInputAUTOReal, Init(R,7,Minimum,3000,2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, 47, 3);
    Insert(New(PLabel, Init(R, '����ᥢ�� ����ﭨ� (�� ����� '+
           VS+')', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, '��', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @a)
END;

PROCEDURE GetAngle;
BEGIN
  R.Assign(1, 1, 60, 9);
  New(Dialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 57, 4);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('����� 60�',
      NewSItem('�� 60� �� 80�',
      NewSItem('����� 80�',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2, 2, 57, 3);
    Insert(New(PLabel, Init(R, '���� ������� ��।��', Bruce)));
    R.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-18, 0);
    Bruce:=New(PButton, Init(R, '��', cmOk, bfDefault));
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
  New(Dialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 40, 7);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('���������, ��/�� 1.2',
      NewSItem('���७�� ���������, ��/�� 1.5',
      NewSItem('����⥫�� ���������, ��/�� 2',
      NewSItem('���ୠ�, ��/�� 3',
      nil))))
    ));
    Insert(Bruce);
    R.Assign(2, 2, 40, 3);
    Insert(New(PLabel, Init(R, '��ࠪ�� ����㧪� ��।��', Bruce)));
    R.Assign(Size.X-18, 2, Size.X-3, 4);
    Bruce:=New(PButton, Init(R, '��', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);
    R.Move(0, 2);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
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
  R.Assign(1,1,34,13);
  Dialog:=New(PDialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 18, 11);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('AUTO',
      NewSItem('0.4',
      NewSItem('0.6',
      NewSItem('0.8',
      NewSItem('1.0',
      NewSItem('1.2',
      nil))))))
    ));
    Insert(Bruce);
    R.Assign(1, 2, 18, 3);
    Insert(New(PLabel, Init(R, '���騭� ६��', Bruce)));

    R.Assign(19, 4, 31, 6);
    Bruce:=New(PButton, Init(R, '��', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);
    R.Move(0, 3);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Tip_pl);
  if Tip_pl = 0 then
    Sdelta:=0
  else
    Sdelta:=Array_plen[Tip_pl,1];
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
    7: Tip_nat:=not Tip_nat;
    8: GetStrapWidth;
  end;
END;

PROCEDURE TFilmStrapTransCAD.MakeVersions;
Var
  id, TransChk: byte;
  StartDiam, StartType, UserDist: real;

BEGIN
  StartDiam:=d1;
  StartType:=Tip_pl;
  if StartType = 0 then
    Inc(Tip_pl);
  UserDist:=a;
  repeat
    d1:=StartDiam;
    repeat
      TransChk:=0;
      a:=UserDist;
      SDelta:=Array_plen[Tip_pl,1];
      MakeVersion(TransChk);
      if TransChk = 0 then
        AddVersion;
      d1:=d1*1.25;
    until (TransChk = erDiam) or (StartDiam <> 0);
    Inc(Tip_pl);
  until (StartType <> 0) or (Tip_pl > 5);
  inherited MakeVersions;
END;

PROCEDURE TFilmStrapTransCAD.MakeVersion;

PROCEDURE Wheel;
{------------- ����� �ਭ� ६��, ������ਨ 誨�� ------------}
Var
  b_max, p0, C_alfa, C_V, C_Q: real;
  ib_max, ib_min: byte;

BEGIN
 b_max := Array_plen[Tip_pl,8];
 p0 := Array_plen[Tip_pl,5];
 Ib_max := Round(Array_plen[Tip_pl,4]);
 Ib_min := Round(Array_plen[Tip_pl,3]);
           { �����樥�� 㣫� ��墠� }
    C_alfa  := 1 - 0.003 * ( 180 - alfa ) ;
    C_V := 1.04 - 0.0004 * V * V ;
       if not Tip_nat then
         case Q of
           0: C_Q := 1;
           1: C_Q := 0.9;
           2: C_Q := 0.8;
         end
       else C_Q := 1;
              { ���� �ᨫ�� �� ��� �ਭ� ६�� }
    Ft := 1000 * P1 / V;
              { �ਭ� ६�� }
    b := Ft / (p0 * C_alfa * C_v * Cp * C_Q ) ;
  If b > b_max then
                   begin
                      ErrorCode := erWidthStrap;
                      Exit;
                   end
                else TruncGost(TArrayBP,Ib_min,Ib_max,b,b,ib_min);
    Bs := TArrayBP[ib_min+1];
{ ����� ��楤���  Shkiw  }
END;

PROCEDURE Diameter;
Var
  id: byte;

BEGIN
{----------------- ����� ������� ����饣� 誨�� -------------------}
  if d1 = 0 then
    d1:=TArrayD[Round(Array_plen[Tip_pl,2])]
  else
    TruncGOST( TArrayD, 1, 35, d1, d1, id) ;
END; {--------- ����� ���� d1 --------------------------------------}

PROCEDURE Geometric;
Var
  id2: byte;
  l_max: real;

BEGIN
{----------------------- ����� ������ਨ ��।�� ------------------------}
  l_max :=  TArrayLP[Round(Array_plen[Tip_pl, 7])];
  d2:=d1 * up;
  if d2 > TArrayD[38] then
  begin
    ErrorCode:=erDiam;
    Exit;
  end;
  RoundGOST(TArrayD, 1, 38, d2, d2, id2) ;
  if a = 0 then
    a:=1.5 * (d1 + d2);
  l:=2 * a + Pi * (d1 + d2) / 2 + sqr(d2 - d1) / (4 * a);
  if l > l_max then
  begin
    ErrorCode:= erLength;
    Exit;
  end;
  RoundGost(TArrayLP,1,Round(Array_plen[Tip_pl, 7]),l,l,id2);
    a := (l- pi * (d1 + d2) / 2) / 4 + sqrt(sqr(l - pi * (d1 + d2) / 2) -
          2 * sqr(d1 - d2)) / 4;
  alfa:=180 - (d2 - d1) * 57 / a;
  if alfa < alfa_min then
    ErrorCode:=erAngle;
END;{------------------------------------------------------}

PROCEDURE Kinematic;
{--------- ����� ��������᪨� ��ࠬ��஢ ��।�� -------}
Var
  C: real;

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
END; {-------- ����� ��楤��� Kinematic-----------------------}

PROCEDURE Forces;
{------------------ ����� ᨫ ------------------------}

Var  F1, F2, alfa_c, m, Sigma_E, q: real;
{     F1 - ���殮��� ����饩 ��⢨;
     F2 - ���殮��� ������� ��⢨;
     Fb - �������� �� ���� ६��;
     F0 - �ᨫ�� �।���⥫쭮�� ���殮���;
     Ft - ���㦭�� �ᨫ�� � ��।�� }
Const
  f = 0.25;

BEGIN
  alfa_c:=0.7 * alfa * pi / 180;
  m := exp(f_pr * alfa_c);
  F1 := m / (m-1) * Ft;
  F2 := F1 - Ft;
  F0 := Ft / 2 * ((m + 1) / (m - 1));
  Fb := sqrt(sqr(F1) + sqr(F2) - 2 * F1 * F2 * cos(alfa));
  Vol:=(b*(Pi*(sqr(d1)+sqr(d2))+4*a*(d1+d2)))/8*1E-6;
  alfa_c := 0.7 * alfa * pi / 180;
  q := exp(f * alfa_c);
  Sigma_e := 0.1 * q * Ft / (Sdelta * b * (q-1)) + 90 * Sdelta / d1 +
             1.2E-3 * sqr(V);
  Lh := 1.1E5 * l / (V * exp(4 * ln(Sigma_e)));
END; {------------- ����� ��楤��� Forces-------------------------}

BEGIN
  Diameter;
  Geometric;
  if ErrorCode <> 0 then
    Exit;
  Kinematic;
  if ErrorCode <> 0 then
    Exit;
  Wheel;
  if ErrorCode <> 0 then
    Exit;
  Forces;
END;

FUNCTION TFilmStrapTransCAD.DataEntryPoint;
BEGIN
  DataEntryPoint:=@P1;
END;

FUNCTION TFilmStrapTransCAD.QualityNumber;
BEGIN
  QualityNumber:=6;
END;

FUNCTION TFilmStrapTransCAD.QualityEntryPoint;
BEGIN
  QualityEntryPoint:=@a;
END;

PROCEDURE TFilmStrapTransCAD.PlotVersion;
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