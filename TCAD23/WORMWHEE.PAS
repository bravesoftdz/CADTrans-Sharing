{$O+}
Unit WormWheelTransmission;
INTERFACE
Uses
  Objects, Views, obRead, Designers, Calculate;

{-------------------------------------------------------------------------}
{-   Ошибки проектирования передачи                                      -}
{-------------------------------------------------------------------------}

Type
{-------------------------------------------------------------------------}
{-   Конструктор передачи                                  -}
{-------------------------------------------------------------------------}
  PWormWheelTransCAD = ^TWormWheelTransCAD;
  TWormWheelTransCAD = object(TDesigner)
{-------------------------------------------------------------------------}
{-  Буфер данных передачи                                                -}
    WormDB: PDBFile;
    WheelDB: PDBFile;
    WheelMat: PCollection;
    WheelMatID: word;
    WheelProc: PCollection;
    Sposob: word;        {Способ отливки червячного колеса}
                         { Центробежный
                           В кокиль }

    Loading:TLoading;
    WormProcComp: byte;
    Nagr: boolean;
    P1,               {Мощность, передаваемая быстроходным валом}
    n1,               {Частота вращения быстроходного вала}
    U:real;           {Передаточное число передачи}
    DeltaU: byte;
    Lh:longint;          {Расчетный ресурс передачи}
    Ka: real;
    TipCh: word;         { Тип червяка : 1 - архимедов червяк
                                      2 - эвольвентный червяк
                                      3 - конволютный червяк}
             {---------------------------------------------------------}

           {-------------------------------------------------------------}
             {  Выводные параметры }
    WheelGroup: char;
    mc1, mc2: TSteelMark;
    H_HRcp1,              {Твердость боковой поверхности витков червяка }
    H_HBp1,
    Sigma_B2,             { Предел прочностм материала червячного колеса}
    Sigma_T2: word;       { Предел текучести материала червячного колеса}
    WormProc: PCollection;
    Termobr1: word;      {Вид термообработки червяка}
    otw1,
    Reverse: boolean;
              { Показатели качества   }
    Massa,                   {Суммарная масса колеса и червяка}
    Kpd,                     { КПД передачи}
    Vp,                     {Объём занимаемый передачей}
    Fb1,                    {Суммарное давление на вал}
    Aw,                        {межосевое расстояние передачи}
    d2,                    {Делительный диаметр колеса}

    P_1,                     { осевой шаг червяка}
    Pz1,                     { осевой ход червяка}
    Fb2,
         {           Параметры передачи}
    M: real;                   { модуль }

    z1,                   { Заходность червяка }
    z2 : byte;
    Q,                    {Коэффициент делительного диаметра червяка}
    x1 : real;            {Коэффициент смещения}
    St : byte;            { Степень точности }
                 {     Геометрические размеры     }
    d1,                    {Делительный диаметр}
    dw1,                   {Начальный диаметр червяка}
    da1,                   {Диаметр окружности вершин }
    df1,                   {Диаметр окружности впадин }
    B1,                     {Длина нарезанной части червяка}
    Gamma,                 {Угол подъема по делительному диаметру}
    GammaW,                {Угол подъема по начальному диаметру}

    Sna1,                  {Нормальная толщина витка на диаметре вершин червяка}
    Ha1,                   { Измерительная высота }
                 {----------------------------------}

    da2,                   {Диаметр окружности вершин колеса}
    dam2,                  {Наибольший диаметр колеса}
    df2 : real;            {Диаметр окружности впадин }
    B2: byte;               {ширина венца колеса}
    Ra,                    {Радиус выемки венца колеса}
    Rf,                    {Радиус по впадинам колеса}
    Rof1,                  {Радиус закругления зуба колеса}
    d_p,
    M1,
    Ha2,                   { Измерительная высота }
    Sna2: real;             {Нормальная толщина зуба на диаметре вершин колеса}
    DeltaO : real;          {Угол обхвата}
                   {Кинематические параметры}
    Uf,                      {Фактическое передаточное число передачи}
   { n1,                      Частота вращения шестерни}
    n2 : real;               {Частота вращения колеса}
    Vs : real;                 { Скорость, м/с}
    {---------------------------------------------------------------}
                  {  Силовые параметры  }
    T1,                     {Момент, передаваемый быстроходным валом}
    T2,                     {Момент, передаваемый тихоходным валом}
    Ft1,                      { Окружное усилие   }
    Fr1,                      {Радиальное усилие}
    Fx1,                      {Осевое усилие  }
    Ft2,                      { Окружное усилие}
    Fr2,                      { Радиальное усилие}
    Fx2 : real;               { Осевое усилие}
    Sigma_H,                  { контактное напряжение}
    Sigma_Hp :real;          { допускаемое контактное напряжение}

    procedure InitData; virtual;
    procedure InitQuality; virtual;
    constructor Load (var S: TStream);
    destructor Done; virtual;
    procedure MakeDataStrings (AStrings: PCollection); virtual;
    procedure ChangeDataItem (Item: byte); virtual;
    procedure MakeVersions; virtual;
    procedure MakeVersion (var ErrorCode: byte); virtual;
    procedure MakeVersionStrings (AStrings: PCollection); virtual;
    function  DataEntryPoint: pointer; virtual;
    function  QualityNumber: word; virtual;
    function  QualityEntryPoint: pointer; virtual;
    procedure PlotVersion (VersionID: PView; var Dest: text); virtual;
    procedure GetWheelParameters;
    procedure GetWormParameters;
    function  WheelCompatible: byte;
    procedure MakeWheelMaterials;
    procedure MakeWheelProcess;
    procedure MakeWormProcess;
  end;

Const
  RWormWheelTransCAD: TStreamRec = (
    ObjType: 1122;
    VmtLink: Ofs(TypeOf(TWormWheelTransCAD)^);
    Load: @TWormWheelTransCAD.Load;
    Store: @TWormWheelTransCAD.Store
  );

IMPLEMENTATION
Uses
  Drivers, App, Dialogs, MsgBox, Common, Math;

FUNCTION GetProcStr (TNumber: byte): string;
Const
  HandleStr: array [0..8] of string[16] =
    ('AUTO',
     'Улучшение',
     'Нормализация',
     'Объемная закалка',
     'Эакалка ТВЧ',
     'Цементация',
     'Нитроцементация',
     'Азотирование',
     'Отжиг');

BEGIN
  GetProcStr:=HandleStr[TNumber];
END;

FUNCTION GetProcVal (TStr: PString): byte;
BEGIN
  case TStr^[2] of
    'U': GetProcVal:=0;
    'л': GetProcVal:=1;
    'о': GetProcVal:=2;
    'б': GetProcVal:=3;
    'а': GetProcVal:=4;
    'е': GetProcVal:=5;
    'и': GetProcVal:=6;
    'з': GetProcVal:=7;
    'т': GetProcVal:=8;
  end;
END;

FUNCTION GetWheelStr (TNumber: byte): string;
Const
  HandleStr: array [0..3] of string[12] =
    ('AUTO',
     'Центробежный',
     'В кокиль',
     'В землю');

BEGIN
  GetWheelStr:=HandleStr[TNumber];
END;

FUNCTION GetWheelVal (TStr: PString): byte;
BEGIN
  case TStr^[3] of
    'T': GetWheelVal:=0;
    'н': GetWheelVal:=1;
    'к': GetWheelVal:=2;
    'з': GetWheelVal:=3;
  end;
END;

  function TrimTrail(S : string) : string;
    {-Return a string with trailing white space removed}
  var
    SLen : Byte absolute S;
  begin
    while (SLen > 0) and (S[SLen] <= ' ') do
      Dec(SLen);
    TrimTrail := S;
  end;

FUNCTION TWormWheelTransCAD.WheelCompatible: byte;
Var
  BufRec: PString;
  VStr: PString;
  VC: integer;
  Compatible: byte;

BEGIN
  WheelDB^.Stream^.Reset;
  WheelDB^.Seek(0);
  GetMem(BufRec, 38);
  WheelDB^.GetRecord(BufRec^[1]);
  while WheelDB^.Stream^.Status = stOk do
  begin
    BufRec^[33]:=#2;
    VStr:=@BufRec^[33];
    Val(VStr^,Compatible,VC);
    BufRec^[0]:=#23;
    BufRec^:=TrimTrail(BufRec^);
    if BufRec^ = mc2 then
      Break;
    WheelDB^.GetRecord(BufRec^[1]);
  end;
  WheelCompatible:=Compatible;
  FreeMem(BufRec, 38);
END;

PROCEDURE TWormWheelTransCAD.GetWheelParameters;
Var
  BufRec: PString;
  VStr: PString;
  VC: integer;

BEGIN
  WheelDB^.Stream^.Reset;
  WheelDB^.Seek(0);
  GetMem(BufRec, 38);
  WheelDB^.GetRecord(BufRec^[1]);
  while WheelDB^.Stream^.Status = stOk do
  begin
    BufRec^[0]:=#23;
    BufRec^:=TrimTrail(BufRec^);
    if (BufRec^ = mc2)
       and (chr(Sposob+48) = BufRec^[27]) then
    begin
      VStr:=@BufRec^[27];
      VStr^[0]:=#3;
      Val(VStr^,Sigma_B2,VC);
      VStr:=@BufRec^[30];
      VStr^[0]:=#3;
      Val(VStr^,Sigma_T2,VC);
      WheelGroup:=BufRec^[36]
    end;
    WheelDB^.GetRecord(BufRec^[1]);
  end;
  FreeMem(BufRec, 38);
END;

PROCEDURE TWormWheelTransCAD.GetWormParameters;
Var
  BufRec: PString;
  VStr: PString;
  VC: integer;

BEGIN
  WormDB^.Stream^.Reset;
  WormDB^.Seek(0);
  GetMem(BufRec, 65);
  WormDB^.GetRecord(BufRec^[1]);
  while WormDB^.Stream^.Status = stOk do
  begin
    VStr:=@BufRec^[40];
    VStr^[0]:=#23;
    VStr^:=TrimTrail(VStr^);
    if (VStr^ = mc1) and (chr(Termobr1+48) = BufRec^[1]) then
    begin
      VStr:=@BufRec^[2];
      VStr^[0]:=#3;
      Val(VStr^,H_HBp1,VC);
    end;
    WormDB^.GetRecord(BufRec^[1]);
  end;
  FreeMem(BufRec, 65);
END;

PROCEDURE TWormWheelTransCAD.MakeWheelMaterials;
Var
  BufRec: PString;
  MinVs, MaxVs, Compatible: byte;
  VStr: string[2];
  VC: integer;

BEGIN
  if WheelMat <> nil then
    Dispose(WheelMat, Done);
  WormProcComp:=0;
  WheelMatID:=0;
  WheelMat:=New(PStringCollection, Init(20,10));
  WheelMat^.Insert(NewStr('AUTO'));

  Vs:=Round(4.5*N1*Exp(1/3*Ln(P1*U*(1-U/200)*1000*30/(Pi*N1)))/10000);
  WheelDB^.Stream^.Reset;
  WheelDB^.Seek(0);
  GetMem(BufRec, 38);
  WheelDB^.GetRecord(BufRec^[1]);
  while WheelDB^.Stream^.Status = stOk do
  begin
    BufRec^[0]:=#36;
    VStr:=Copy(BufRec^,24,1);
    Val(VStr,MinVs,VC);
    VStr:=Copy(BufRec^,25,2);
    Val(VStr,MaxVs,VC);
    VStr:=Copy(BufRec^,34,2);
    Val(VStr,Compatible,VC);
    BufRec^[0]:=#23;
    BufRec^:=TrimTrail(BufRec^);
    if (BufRec^ <> '') and (MinVs <= Vs) and (Vs <= MaxVs) and (VC = 0) then
    begin
      WheelMat^.Insert(NewStr(BufRec^));
      WormProcComp:=WormProcComp or Compatible;
    end;
    WheelDB^.GetRecord(BufRec^[1]);
  end;
  FreeMem(BufRec, 38);
END;

PROCEDURE TWormWheelTransCAD.MakeWheelProcess;
Var
  BufRec: PString;
  PCode: byte;

BEGIN
  if WheelProc <> nil then
    Dispose(WheelProc, Done);

  WheelProc:=New(PStringCollection, Init(5,3));
  WheelDB^.Stream^.Reset;
  WheelDB^.Seek(0);
  GetMem(BufRec, 38);
  WheelDB^.GetRecord(BufRec^[1]);
  while WheelDB^.Stream^.Status = stOk do
  begin
    PCode:=ord(BufRec^[27])-48;
    BufRec^[0]:=#23;
    BufRec^:=TrimTrail(BufRec^);
    if BufRec^ = mc2 then
      WheelProc^.Insert(NewStr(GetWheelStr(PCode)));
    WheelDB^.GetRecord(BufRec^[1]);
  end;
  FreeMem(BufRec, 38);
  WheelProc^.Insert(NewStr('AUTO'));
END;

PROCEDURE TWormWheelTransCAD.MakeWormProcess;
Var
  BufRec: PString;
  Compatible: byte;
  TPCode: byte;

BEGIN
  if WormProc <> nil then
    Dispose(WormProc,Done);

  GetMem(BufRec, 65);
  WormProc:=New(PStringCollection, Init(5,2));
  WormDB^.Stream^.Reset;
  WormDB^.Seek(0);
  WormDB^.GetRecord(BufRec^[1]);
  while WormDB^.Stream^.Status = stOk do
  begin
    TPCode:=ord(BufRec^[1])-48;
    Compatible:=1 shl TPCode;
    BufRec^[0]:=#64;
    System.Delete(BufRec^,1,40);
    BufRec^:=TrimTrail(BufRec^);
    if (BufRec^ = mc1) and
       (WormProcComp and Compatible = Compatible) then
      WormProc^.Insert(NewStr(GetProcStr(TPCode)));
    WormDB^.GetRecord(BufRec^[1]);
  end;
  FreeMem(BufRec, 65);
  WormProc^.Insert(NewStr('AUTO'));
END;

PROCEDURE TWormWheelTransCAD.InitData;
BEGIN
  Loading.GraphBar:=0;
  WormProcComp:=48;
  with Loading do
  begin
    x:=2; y:=0.3; z:=0.2;
    i:=0.6; j:=0.2; k:=0.2;
  end;
  P1:=10;        { 0.2..300  }
  N1:=750;       { 1 .. 5000 об/мин }
  U:=36;       { 1 .. 8 }
  DeltaU:=2;
  H_HBp1:=0;     {0..350 }
  H_HRcp1:=48;   {35 .. 68}
  Sigma_t2:=800; {100 .. 2000 МПа}
  mc1:='18ХГТ ГОСТ 4543-71';
  mc2:='AUTO';
  Termobr1:=0;        {1 .. 8 }
  Lh:=6300;           {10 ... 100000 ч}
  Ka:=1.0;
  Nagr:=False;
  Sposob:=0;
  Reverse:=False;
  otw1:=True;
  WormDB:=nil;
  WheelDB:=nil;
  WheelMat:=nil;
  WheelProc:=nil;
  WormProc:=nil;
END;

PROCEDURE TWormWheelTransCAD.InitQuality;
BEGIN
  inherited InitQuality;
  QualityList^[0].Title:=NewStr('Масса передачи, кг');
  QualityList^[0].Value:=2;
  QualityList^[0].Minimize:=True;
  QualityList^[1].Title:=NewStr('К.П.Д. передачи');
  QualityList^[1].Value:=2;
  QualityList^[1].Minimize:=False;
  QualityList^[2].Title:=NewStr('Объем передачи, дм. куб.');
  QualityList^[2].Value:=0;
  QualityList^[2].Minimize:=True;
  QualityList^[3].Title:=NewStr('Суммарное давление на вал,Н');
  QualityList^[3].Value:=2;
  QualityList^[3].Minimize:=True;
  QualityList^[4].Title:=NewStr('Межосевое расстояние, мм');
  QualityList^[4].Value:=2;
  QualityList^[4].Minimize:=True;
  QualityList^[5].Title:=NewStr('Делит. диаметр колеса, мм');
  QualityList^[5].Value:=2;
  QualityList^[5].Minimize:=True;
END;

CONSTRUCTOR TWormWheelTransCAD.Load;
BEGIN
  inherited Load(S);
  WormDB:=New(PDBFile, Init(PathToProgram+'\DBF\materials.dbf', 2048,
    EMSAcess and useEms = useEMS));
  WheelDB:=New(PDBFile, Init(PathToProgram+'\DBF\cherv.dbf', 2048,
    EMSAcess and useEms = useEMS));
  WheelMat:=nil;
  WheelProc:=nil;
  WormProc:=nil;
END;

DESTRUCTOR TWormWheelTransCAD.Done;
BEGIN
  inherited Done;
  if WormDB <> nil then
    Dispose(WormDB, Done);
  if WheelDB <> nil then
    Dispose(WheelDB, Done);
  if WheelMat <> nil then
    Dispose(WheelMat, Done);
  if WheelProc <> nil then
    Dispose(WheelProc, Done);
  if WormProc <> nil then
    Dispose(WormProc, Done);
END;

PROCEDURE TWormWheelTransCAD.MakeVersionStrings;
Const
  SizeOfList = 50;

Var
  FmtStr: string;
  ValStr: array [0..SizeOfList] of string[23];
  Params: array [0..SizeOfList,0..1] of Pointer;
  ItemCount: byte;

Const
  WType: array [0..2] of string [12] =
  ('Архимедов',
   'Эвольвентный',
   'Конволютный');

  BaseStr = '  %-38s%24s';
  AUTOMessage: string[4] = 'AUTO';
  ParamsName: array [0..SizeOfList] of string [40] = (
               { Исходные данные }
  'Мощность на ведущем валу, кВт',
  'Частота вращения червяка, об/мин',
  'Проектное передаточное число, об/мин',
  'Расчетный срок службы, час',
  'Тип червяка',
  'Материал червяка',
  'Термообработка червяка',
  'Материал венца колеса',
  'Способ отливки венца колеса',
               {Кинематические параметры}
  'Фактическое передаточное число',
  'Частота вращения колеса, об/мин',
  'Линейная скорость, м/с',
  'К.П.Д. передачи, %',
               { Параметры передачи }
  'Нормальный модуль, мм',
  'Межосевое расстояние передачи, мм',
  'Число заходов червяка',
  'Число зубьев колеса',
  'Коэфф. делительного диаметра червяка',
  'Коэфф. смещения исх. контура колеса',
  'Степень точности',
               { Геометрические размеры колес  }
  'Делительный диаметр червяка, мм ',
  'Начальный диаметр червяка, мм',
  'Диаметр окружности впадин червяка,мм',
  'Диаметр окружности вершин червяка,мм',
  'Длина нарезаемой части червяка, мм',
  'Угол подъема по делит. диаметру',
  'Угол подъема по нач. диаметру',
  'Осевой шаг, мм',
  'Нормальная толщина витка, мм',
  'Измерительная высота для нее, мм',
  'Делительный диаметр колеса, мм ',
  'Диаметр окружности вершин колеса, мм',
  'Наибольший диаметр колеса, мм',
  'Диаметр окружности впадин колеса, мм',
  'Ширина венца колеса, мм',
  'Радиус выемки венца колеса, мм',
  'Радиус по впадинам колеса, мм',
  'Радиус закругления зуба колеса, мм',
  'Диаметр измерительного ролика, мм',
  'Размер по роликам, мм',
  'Нормальная толщина зуба, мм',
  'Измерительная высота для нее, мм',
               {  Прочностные и силовые параметры  }
  'Момент на быстроходном валу, Нм',
  'Момент на тихоходном валу, Нм',
  'Окружное усилие червяка, Н',
  'Радиальное усилие червяка, Н',
  'Осевое усилие червяка, Н',
  'Окружное усилие колеса, Н',
  'Радиальное усилие колеса, Н',
  'Осевое усилие колеса, Н',
  'Контактное напряжение, Мпа');

BEGIN
  Str(P1:0:2, ValStr[0]);
  Str(N1:0:2, ValStr[1]);
  Str(U:0:2, ValStr[2]);
  Str(Lh:0, ValStr[3]);
  ValStr[4]:=WType[TipCh];
  ValStr[5]:=mc1;
  ValStr[6]:=GetProcStr(Termobr1);
  ValStr[7]:=mc2;
  ValStr[8]:=GetWheelStr(Sposob);

  Str(Uf:0:2,ValStr[9]);
  Str(N2:0:2,ValStr[10]);
  Str(Vs:0:2,ValStr[11]);
  Str(KPD:0:2,ValStr[12]);

  Str(M:0:2, ValStr[13]);
  Str(aw:0:2, ValStr[14]);
  Str(z1, ValStr[15]);
  Str(z2, ValStr[16]);
  Str(Q:0:2, ValStr[17]);
  Str(x1:0:2, ValStr[18]);
  Str(St, ValStr[19]);

  Str(D1:0:3, ValStr[20]);
  Str(Dw1:0:3, ValStr[21]);
  Str(Df1:0:3, ValStr[22]);
  Str(Da1:0:3, ValStr[23]);
  Str(B1:0:2, ValStr[24]);
  Str(int(Gamma*180/Pi):0:0, ValStr[25]);
  ValStr[25]:=ValStr[25]+'°';
  Str(int(frac(Gamma*180/pi)*60):0:0, FmtStr);
  ValStr[25]:=ValStr[25]+FmtStr+'''';
  Str(int(frac(frac(Gamma*180/Pi)*60)*60):0:0, FmtStr);
  ValStr[25]:=ValStr[25]+FmtStr+'"';
  Str(int(GammaW*180/Pi):0:0, ValStr[26]);
  ValStr[26]:=ValStr[26]+'°';
  Str(int(frac(GammaW*180/pi)*60):0:0, FmtStr);
  ValStr[26]:=ValStr[26]+FmtStr+'''';
  Str(int(frac(frac(GammaW*180/Pi)*60)*60):0:0, FmtStr);
  ValStr[26]:=ValStr[26]+FmtStr+'"';
  Str(P_1:0:2,ValStr[27]);
  Str(Sna1:0:2,ValStr[28]);
  Str(Ha1:0:2,ValStr[29]);
  Str(D2:0:3, ValStr[30]);
  Str(Da2:0:3, ValStr[31]);
  Str(Dam2:0:3, ValStr[32]);
  Str(Df2:0:3, ValStr[33]);
  Str(B2, ValStr[34]);
  Str(Ra:0:2,ValStr[35]);
  Str(Rf:0:2,ValStr[36]);
  Str(Rof1:0:2,ValStr[37]);
  Str(D_p:0:2,ValStr[38]);
  Str(M1:0:2,ValStr[39]);
  Str(Sna2:0:2,ValStr[40]);
  Str(Ha2:0:2,ValStr[41]);

  Str(T1:0:2, ValStr[42]);
  Str(T2:0:2, ValStr[43]);
  Str(Ft1:0:2, ValStr[44]);
  Str(Fr1:0:2, ValStr[45]);
  Str(Fx1:0:2, ValStr[46]);
  Str(Ft2:0:2, ValStr[47]);
  Str(Fr2:0:2, ValStr[48]);
  Str(Fx2:0:2, ValStr[49]);
  Str(Sigma_H:0:2, ValStr[50]);
  for ItemCount:=0 to SizeOfList do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
  AStrings^.AtInsert( 0, NewStr('1. Исходные данные'));
  AStrings^.AtInsert(10, NewStr(' '));
  AStrings^.AtInsert(11, NewStr('2. Кинематические параметры'));
  AStrings^.AtInsert(16, NewStr(' '));
  AStrings^.AtInsert(17, NewStr('3. Параметры передачи'));
  AStrings^.AtInsert(25, NewStr(' '));
  AStrings^.AtInsert(26, NewStr('4. Размеры червяка'));
  AStrings^.AtInsert(37, NewStr(' '));
  AStrings^.AtInsert(38, NewStr('4. Размеры колеса'));
  AStrings^.AtInsert(51, NewStr(' '));
  AStrings^.AtInsert(52, NewStr('5. Прочностные и силовые параметры'));
END;

PROCEDURE TWormWheelTransCAD.MakeDataStrings;
Const
  SizeOfList = 13;

Var
  FmtStr: string;
  ValStr: array [0..SizeOfList] of string[23];
  Params: array [0..SizeOfList,0..1] of Pointer;
  ItemCount: byte;

Const
  LoadGraph: array [boolean] of string [11] =
  ('Типовой',
   'Циклограмма');
  GraphStr: array [boolean] of string [12] =
  ('Режим',
   'Коэффициенты');
  WType: array [0..2] of string [12] =
  ('Архимедов',
   'Эвольвентный',
   'Конволютный');
  LoadStr: array [0..5] of string [22] =
  ('Постоянная нагрузка',
   'Тяжелый ',
   'Средний равновероятный',
   'Средний нормальный',
   'Легкий',
   'Особолегкий');

  BaseStr = '%-33s%24s';
  AUTOMessage: string[4] = 'AUTO';
  ParamsName: array [0..SizeOfList] of string [33] = (
  'Мощность на ведущем валу, кВт',
  'Частота вращения червяка, об/мин',
  'Проектное передаточное число',
  'Расчетный срок службы, час',
  'Материал венца колеса',
  'Способ отливки венца колеса',
  'Материал червяка',
  'Термообработка витков червяка',
  'Тип червяка',
  'График нагружения',
  '',
  'Коэф. внешней динамики',
  'Режим реверса',
  'Межосевое расстояние');

BEGIN
  ParamsName[10]:=' нагружения';
  Str(P1:0:2, ValStr[0]);
  Str(N1:0:2, ValStr[1]);
  Str(U:0:2, ValStr[2]);
  Str(Lh:0, ValStr[3]);
  ValStr[4]:=mc2;
  ValStr[5]:=GetWheelStr(Sposob);
  ValStr[6]:=mc1;
  ValStr[7]:=GetProcStr(Termobr1);
  ValStr[8]:=WType[TipCh];
  ValStr[9]:=LoadGraph[nagr];
  ParamsName[10]:=GraphStr[nagr]+ParamsName[10];
  if not nagr then
    ValStr[10]:=LoadStr[Loading.GraphBar]
  else
    ValStr[10]:='';
  Str(Ka:0:2, ValStr[11]);
  if Reverse then
    ValStr[12]:='Есть'
  else
    ValStr[12]:='Нет';
  if otw1 then
    ValStr[13]:='Стандартное'
  else
    ValStr[13]:='Нестандартное';
  for ItemCount:=0 to SizeOfList do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
END;

PROCEDURE TWormWheelTransCAD.ChangeDataItem;
Var
  Dialog:   PDialog;
  Bruce:    PView;
  R:        TRect;

PROCEDURE GetPower;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-17, 2, Size.X-7, 3);
    Bruce:=New(PInputReal, Init(R, 6, 0.1, 200, 2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(1, 2, Size.X-17, 3);
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
    R.Assign(Size.X-17, 2, Size.X-7, 3);
    Bruce:=New(PInputReal, Init(R, 8, 10, 10000, 2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, Size.X-17, 3);
    Insert(New(PLabel, Init(R, 'Частота вращения шестерни, об/мин', Bruce)));
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
  R.Assign(1, 1, 60, 10);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-17, 2, Size.X-7, 3);
    Bruce:=New(PInputReal, Init(R, 5, 8, 80, 2,SizeOf(float)));
    Insert(Bruce);
    R.Assign(2, 2, Size.X-17, 3);
    Insert(New(PLabel, Init(R, 'Проектное передаточное число', Bruce)));
    R.Assign(Size.X-17, 4, Size.X-7, 5);
    Bruce:=New(PInputInt, Init(R, 2, 2, 10,1));
    Insert(Bruce);
    R.Assign(2, 4, Size.X-17, 5);
    Insert(New(PLabel, Init(R, 'Допуск на передаточное число, %', Bruce)));
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
  Application^.ExecuteDialog(Dialog, @U);
END;

PROCEDURE GetLifeTime;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-17, 2, Size.X-7, 3);
    Bruce:=New(PInputInt, Init(R, 5, 100, 64000,4));
    Insert(Bruce);
    R.Assign(2, 2, Size.X-17, 3);
    Insert(New(PLabel, Init(R, 'Проектный срок службы, ч', Bruce)));
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
  Application^.ExecuteDialog(Dialog, @Lh);
END;

PROCEDURE GetWheelMaterial;
Var
  ScrollBar: PScrollBar;

BEGIN
  MakeWheelMaterials;

  R.Assign(1, 1, 55, 15);
  Dialog:=New(PListDialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-20, 2, Size.X-19, Size.Y-2);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 2, Size.X-20, Size.Y-2);
    Bruce:=New(PListUserData, Init(R, 1, ScrollBar));
    Insert(Bruce);
    R.Assign(2,1, Size.X-20, 2);
    Insert(New(PLabel, Init(R, 'Материал колеса', Bruce)));
    R.Assign(Size.X-15, 3, Size.X-2, 5);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 3);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @WheelMat) = cmOk then
  begin
    Sposob:=0;
    mc2:=PString(WheelMat^.At(WheelMatID))^;
  end;
  if WheelMatID <> 0 then
    WormProcComp:=WheelCompatible;
END;

PROCEDURE GetWormMaterial;
Var
  ScrollBar: PScrollBar;
  Item: word;
  MatNames: PCollection;
  BufRec: PString;
  TPCode: byte;

BEGIN
  GetMem(BufRec, 65);
  MatNames:=New(PStringCollection, Init(50,10));
  WormDB^.Stream^.Reset;
  WormDB^.Seek(0);
  WormDB^.GetRecord(BufRec^[1]);
  while WormDB^.Stream^.Status = stOk do
  begin
    TPCode:=ord(BufRec^[1])-48;
    TPCode:=1 shl TPCode;
    BufRec^[0]:=#64;
    System.Delete(BufRec^,1,40);
    BufRec^:=TrimTrail(BufRec^);
    if (BufRec^ <> '') and (WormProcComp and TPCode = TPCode) then
      MatNames^.Insert(NewStr(BufRec^));
    WormDB^.GetRecord(BufRec^[1]);
  end;
  FreeMem(BufRec, 65);

  R.Assign(1, 1, 55, 15);
  Dialog:=New(PListDialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-20, 2, Size.X-19, Size.Y-2);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 2, Size.X-20, Size.Y-2);
    Bruce:=New(PListUserData, Init(R, 1, ScrollBar));
    Insert(Bruce);
    R.Assign(2,1, Size.X-20, 2);
    Insert(New(PLabel, Init(R, 'Материал червяка', Bruce)));
    R.Assign(Size.X-15, 3, Size.X-2, 5);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 3);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Item:=0;
  if Application^.ExecuteDialog(Dialog, @MatNames) = cmOk then
  begin
    mc1:=string(MatNames^.At(Item)^);
    Termobr1:=0;
  end;
  Dispose(MatNames,Done);
END;

PROCEDURE GetThermalHandle;
Var
  ScrollBar: PScrollBar;

BEGIN
  MakeWormProcess;

  R.Assign(1, 1, 50, 13);
  Dialog:=New(PListDialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-20, 2, Size.X-19, Size.Y-2);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 2, Size.X-20, Size.Y-2);
    Bruce:=New(PListUserData, Init(R, 1, ScrollBar));
    Insert(Bruce);
    R.Assign(2,1, Size.X-20, 2);
    Insert(New(PLabel, Init(R, 'Термообработка', Bruce)));
    R.Assign(Size.X-15, 3, Size.X-2, 5);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 3);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @WormProc) = cmOk then
    Termobr1:=GetProcVal(WormProc^.At(Termobr1));
END;

PROCEDURE GetWheelHandle;
Var
  ScrollBar: PScrollBar;

BEGIN
  if WheelMatID = 0 then
    Exit;
  MakeWheelProcess;

  R.Assign(1, 1, 50, 13);
  Dialog:=New(PListDialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-20, 2, Size.X-19, Size.Y-2);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 2, Size.X-20, Size.Y-2);
    Bruce:=New(PListUserData, Init(R, 1, ScrollBar));
    Insert(Bruce);
    R.Assign(2,1, Size.X-20, 2);
    Insert(New(PLabel, Init(R, 'Способ отливки колеса', Bruce)));
    R.Assign(Size.X-15, 3, Size.X-2, 5);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 3);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @WheelProc) = cmOk then
    Sposob:=GetWheelVal(WheelProc^.At(Sposob));
END;

PROCEDURE GetExternalDynamic;
Const
  Coefficient: array [0..3,0..3] of single =
    ((1.00, 1.25, 1.50, 1.75),
     (1.10, 1.35, 1.60, 1.85),
     (1.25, 1.50, 1.75, 2.00),
     (1.50, 1.75, 2.00, 2.25));

  LoadEngine: word = 0;
  LoadMachin: word = 0;

BEGIN
  R.Assign(1, 1, 55, 15);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 35, 7);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Равномерный',
      NewSItem('С малой неравномерностью',
      NewSItem('Со средней неравномерностью',
      NewSItem('Со значительной нерав-стью',
      nil))))
    ));
    Insert(Bruce);
    R.Assign(2,2,35,3);
    Insert(New(PLabel, Init(R, 'Режим нагружения двигателя', Bruce)));
    R.Assign(2, 9, 35, 13);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Равномерный',
      NewSItem('С малой неравномерностью',
      NewSItem('Со средней неравномерностью',
      NewSItem('Со значительной нерав-стью',
      nil))))
    ));
    Insert(Bruce);
    R.Assign(2,8,35,9);
    Insert(New(PLabel, Init(R, 'Режим нагружения ведомой машины', Bruce)));
    R.Assign(Size.X-15, 3, Size.X-2, 5);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 3);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @LoadEngine) = cmOk then
    Ka:=Coefficient[LoadEngine, LoadMachin];
END;

PROCEDURE GetLoadTable;
Var
  Temp: Pointer;
  EState: word;

BEGIN
  with Loading do
  begin
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
  end;
END;

PROCEDURE GetLoadGraph;
BEGIN
  R.Assign(1, 1, 50, 14);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 30, 9);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Постоянная нагрузка',
      NewSItem('Тяжелый ',
      NewSItem('Средний равновероятный',
      NewSItem('Средний нормальный',
      NewSItem('Легкий',
      NewSItem('Особолегкий',
      nil))))))
    ));
    Insert(Bruce);
    R.Assign(2,2,30,3);
    Insert(New(PLabel, Init(R, 'Режим нагружения', Bruce)));
    R.Assign(Size.X-8,10,Size.X-2,11);
    Bruce:=New(PInputReal, Init(R, 4, 1, 10, 2, SizeOf(Single)));
    Insert(Bruce);
    R.Assign(2,10,Size.X-8,11);
    Insert(New(Plabel,Init(R,'Отношение пуск. момента к номин.',Bruce)));
    R.Assign(Size.X-15, 3, Size.X-2, 5);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 2);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Loading.GraphBar);
END;

PROCEDURE GetWormType;
BEGIN
  R.Assign(1, 1, 40, 10);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 21, 6);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Архимедов',
      NewSItem('Эвольвентный',
      NewSItem('Конволютный',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2,2,21,3);
    Insert(New(PLabel, Init(R, 'Тип червяка', Bruce)));
    R.Assign(Size.X-15, 2, Size.X-2, 4);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 2);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @TipCh);
END;

BEGIN
  case Item of
    0 : GetPower;
    1 : GetFreqency;
    2 : GetReduction;
    3 : GetLifeTime;
    4 : GetWheelMaterial;
    5 : GetWheelHandle;
    6 : GetWormMaterial;
    7 : GetThermalHandle;
    8 : GetWormType;
    9 : nagr:=not nagr;
    10:
    if nagr then
      GetLoadTable
    else
      GetLoadGraph;
    11: GetExternalDynamic;
    12: Reverse:=not Reverse;
    13: otw1:=not otw1;
  end;
END;

PROCEDURE TWormWheelTransCAD.MakeVersions;
Var
  TransChk: byte;
  WCV: byte;

  CP: array [1..3] of integer;
  Quit: array [1..3] of boolean;

BEGIN
  CP[1]:=WheelMatID; CP[2]:=Termobr1; CP[3]:=Sposob;
  for WCV:=1 to 3 do
  begin
    Quit[WCV]:=True;
    if CP[WCV] = 0 then
      Quit[WCV]:=False;
  end;

  CP[1]:=1;
  MakeWheelMaterials;
  repeat
    if not Quit[1] then
      mc2:=PString(WheelMat^.At(CP[1]))^;
    Cp[2]:=1;
    MakeWormProcess;
    repeat
      if not Quit[2] then
        Termobr1:=GetProcVal(PString(WormProc^.At(CP[2])));
      GetWormParameters;
      CP[3]:=1;
      MakeWheelProcess;
      repeat
        if not Quit[3] then
          Sposob:=GetWheelVal(PString(WheelProc^.At(CP[3])));
        GetWheelParameters;
        TransChk:=0;
        MakeVersion(TransChk);
        if TransChk in [0,4] then
          AddVersion;
        Inc(CP[3]);
      until Quit[3] or (CP[3] > WheelProc^.Count-1);
      Inc(CP[2]);
    until Quit[2] or (CP[2] > WormProc^.Count-1);
    Inc(CP[1]);
  until Quit[1] or (CP[1] > WheelMat^.Count-1);
  inherited MakeVersions;
END;

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

FUNCTION TWormWheelTransCAD.DataEntryPoint;
BEGIN
  DataEntryPoint:=@Loading;
END;

FUNCTION TWormWheelTransCAD.QualityNumber;
BEGIN
  QualityNumber:=6;
END;

FUNCTION TWormWheelTransCAD.QualityEntryPoint;
BEGIN
  QualityEntryPoint:=@Massa;
END;

PROCEDURE TWormWheelTransCAD.PlotVersion;
BEGIN
  inherited PlotVersion(VersionID,Dest);
  writeln(Dest,'9');
  writeln(Dest,m:0:2);
  writeln(Dest,z1);
  writeln(Dest,z2);
  writeln(Dest,Q:0:2);
  writeln(Dest,b1:0:2);
  writeln(Dest,b2);
  writeln(Dest,d2:0:2);
  writeln(Dest,da2:0:2);
  writeln(Dest,dam2:0:2);
  writeln(Dest,df2:0:2);
  writeln(Dest,mc1);
  writeln(Dest,mc2);
  writeln(Dest,x1:0:2);
  writeln(Dest,st);
  writeln(Dest,Aw:0:2);
  writeln(Dest,T1:0:2);
  writeln(Dest,T2:0:2);
END;
END.