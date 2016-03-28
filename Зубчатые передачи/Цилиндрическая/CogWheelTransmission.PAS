{$O+}
Unit CogWheelTransmission;
{-------------------------------------------------------------------------}
{-   Модуль проектирования передачи цилиндрическими зубчатыми колесами.  -}
{-------------------------------------------------------------------------}
INTERFACE
Uses
  Objects, Views, obRead, Designers, CALCULAT008;

{-------------------------------------------------------------------------}
{-   Ошибки проектирования передачи                                      -}
{-------------------------------------------------------------------------}

Type
{-------------------------------------------------------------------------}
{-   Конструктор передачи                                  -}
{-------------------------------------------------------------------------}
  PCogWheelTransCAD = ^TCogWheelTransCAD;
  TCogWheelTransCAD = object(TDesigner)
{-------------------------------------------------------------------------}
{-  Буфер данных передачи                                                -}
    MaterialsDB: PDBFile;

    Loading:TLoading;
    P1,               {Мощность, передаваемая быстроходным валом}
    n1,               {Частота вращения быстроходного вала}
    U:real;           {Передаточное число передачи}
    DeltaU: byte;
    Lh:longint;          {Расчетный ресурс передачи}
    Tipz:word;        {тип зубьев колес: 1 - прямые
                                         2 - косые
                                         3 - шевронные
                                         0 - автовыбор}
    betg:byte;        {угол наклона зуба в градусах;
                                    при Tipz= 0 становится варьируемым
                                    параметром со знчениями 0, 10, 25 }
    kanavka: word;    {Для шевронных колес при наличии канавки = 1,
                                           при отсутствии канавки =0}
    mc1:TSteelMark;   {марка стали для шестерни}   {????????????????}
    mc2:TSteelMark;   {марка стали для колеса}     {??????????????????}
    Termobr1,         {термообработка зуба шестерни, номер}
    Termobr2:byte;    {термообработка зуба колеса, номер}
    ImprovStrength: array [1..2] of boolean;
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

    Nom_sx: byte;     {Номер схемы расположения колес}
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
    Mn: real;                {Нормальный модуль }
    {-------------------------------------------------------------------}
{--------------------- Критерии качества ---------------------------------}
    Massa,                   {Суммарная масса зубчатых колес}
    V_p,                     {Объём занимаемый передачей}
    B1,
    aw,                      {межосевое расстояние передачи}
    Da2: real;
{-------------------------------------------------------------------------}
    b2: real;                {ширина венца}
    z1, z2 : word;           {Числа зубьев}
    St : integer;            {Степень точности}
    Fv : real ;              {Суммарное давление на вал}
    epsias:real;             {суммарный к-т перекрытия}
    alfatw:Real;             {угол зацепления зубчатых колес}
    Uf,                      {Фактическое передаточное число передачи}
    n2 : real;               {Частота вращения колеса}
    V : real;                 { Скорость, м/с}
    Da1,                {Диаметр окружности вершин }
    d1,  d2,                 {Делительный диаметр}
    x1,  x2:real;            {Коэффициент смещения исходного контура}
    Dw1,                      {Начальный диаметр }
    Df1,                      {Диаметр окружности впадин }
    Dw2,                      {Начальный диаметр }
    Df2,                      {Диаметр окружности впадин }
    Bet: real;
    Sigma_H,                  {Контактное напряжение }
    T1,                     {Момент, передаваемый быстроходным валом}
    T2,                     {Момент, передаваемый тихоходным валом}
    Ft1,                      { Окружное усилие   }
    Fr1,                      {Радиальное усилие}
    Fx1,                      {Осевое усилие  }
    Ft2,                      { Окружное усилие}
    Fr2,                      { Радиальное усилие}
    Fx2 : real;

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
    procedure ReadMaterials (var TProcess: byte; const Material: string;
      AStrings: PCollection);
    procedure PlotVersion (VersionID: PView; var Dest: text); virtual;
  end;

Const
  RCogWheelTransCAD: TStreamRec = (
    ObjType: 1120;
    VmtLink: Ofs(TypeOf(TCogWheelTransCAD)^);
    Load: @TCogWheelTransCAD.Load;
    Store: @TCogWheelTransCAD.Store
  );

IMPLEMENTATION
Uses
  Drivers, App, Dialogs, MsgBox, OutLine, Common;

Type
  PTree = ^TTree;
  TTree = object(TDialogOutline)
    function Valid (Command: word): boolean; virtual;
  end;

FUNCTION TTree.Valid;
BEGIN
  Valid:=True;
  if (Command = cmOk) and (Foc in [0,1,4,6,7,11]) then
    Valid:=False;
END;

PROCEDURE TCogWheelTransCAD.InitData;
BEGIN
  nagr:=False;
  Loading.GraphBar:=0;
  with Loading do
  begin
    x:=2; y:=0.3; z:=0.2;
    i:=0.6; j:=0.2; k:=0.2;
  end;
  P1:=10;        { 0.2..300  }
  N1:=750;       { 1 .. 5000 об/мин }
  U:=3.58;       { 1 .. 8 }
  DeltaU:=2;
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
  mc1:='45 ГОСТ 1050-74';
  mc2:='45 ГОСТ 1050-74';
  Termobr1:=2;        {1 .. 8 }
  Termobr2:=2;        {1 .. 8 }
  ImprovStrength[1]:=False;
  ImprovStrength[2]:=False;
  Lh:=6300;           {10 ... 100000 ч}
  Betg:=0;            { 0 .. 45}
  Kanavka:=1;
  Ka:=1.0;
  Wikrugka[1]:=0;
  Wikrugka[2]:=0;
  Ra1:=2;
  Ra2:=2;
  Zw:=1;
  TipZ:=0;
  Nagr:=False;
  Rewers:=False;
  Bistr:=True;
  Zagotowka[1]:=1;
  Zagotowka[2]:=1;
  Nom_Sx:=3;
  S_f1:=1.75;
  S_f2:=1.75;
  Y_d1:=1;
  Y_d2:=1;
  Y_g1:=1;
  Y_g2:=1;
  motw[1] := 0;
  motw[2] := 0;
  otw1 := True;
  MaterialsDB:=nil;
END;

PROCEDURE TCogWheelTransCAD.InitQuality;
BEGIN
  inherited InitQuality;
  QualityList^[0].Title:=NewStr('Масса передачи, кг');
  QualityList^[0].Value:=2;
  QualityList^[0].Minimize:=True;
  QualityList^[1].Title:=NewStr('Объем передачи, дм куб.');
  QualityList^[1].Value:=2;
  QualityList^[1].Minimize:=True;
  QualityList^[2].Title:=NewStr('Ширина венца, мм');
  QualityList^[2].Value:=2;
  QualityList^[2].Minimize:=True;
  QualityList^[3].Title:=NewStr('Межосевое расстояние, мм');
  QualityList^[3].Value:=2;
  QualityList^[3].Minimize:=True;
  QualityList^[4].Title:=NewStr('Диаметр колеса, мм');
  QualityList^[4].Value:=2;
  QualityList^[4].Minimize:=True;
END;

CONSTRUCTOR TCogWheelTransCAD.Load;
BEGIN
  inherited Load(S);
  MaterialsDB:=New(PDBFile, Init(PathToProgram+'\DBF\materials.dbf', 2048,
    EMSAcess and useEms = useEMS));
END;

DESTRUCTOR TCogWheelTransCAD.Done;
BEGIN
  inherited Done;
  if MaterialsDB <> nil then
    Dispose(MaterialsDB, Done);
END;

FUNCTION GetRaStr (Ra: word): string;
BEGIN
  case Ra of
    0: GetRaStr:='1.6';
    1: GetRaStr:='3.2';
    2: GetRaStr:='6.3';
  end;
END;

PROCEDURE TCogWheelTransCAD.MakeVersionStrings;
Const
  SizeOfList = 48;

Var
  FmtStr: string;
  ValStr: array [0..SizeOfList] of string[23];
  Params: array [0..SizeOfList,0..1] of Pointer;
  ItemCount: byte;

Const
  PatternProcess: array [0..3] of string[9] =
  ('Поковка',
   'Штамповка',
   'Прокат',
   'Отливка');
  CogType: array [1..3] of string[9] =
  ('Прямой',
   'Косой',
   'Шевронный');
  Finish: array [0..2] of string [12] =
  ('Фрезерование',
   'Шлифование',
   'Полирование');
  ToolStr: array [0..2] of string [13] =
  ('Фреза',
   'Долбяк новый',
   'Долбяк старый');
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

  BaseStr = '  %-38s%24s';
  AUTOMessage: string[4] = 'AUTO';
  ParamsName: array [0..SizeOfList] of string [40] = (
               { Исходные данные }
  'Мощность на ведущем валу, кВт',
  'Частота вращения шестерни, об/мин',
  'Проектное передаточное число',
  'Расчетный срок службы, час',
  'Материал шестерни',
  'Термообработка шестерни',
  'Материал колеса',
  'Термообработка колеса',
  'Заготовка шестерни',
  'Заготовка колеса',
  'Обработка выкружки шестерни',
  'Обработка выкружки колеса',
  'Тип зубьев',
  'Зуборезный инструмент шестерни',
  'Зуборезный инструмент колеса',
               {Кинематические параметры}
  'Фактическое передаточное число',
  'Частота вращения шестерни, об/мин',
  'Частота вращения колеса, об/мин',
  'Линейная скорость, м/с',
               { Параметры передачи }
  'Нормальный модуль, мм',
  'Межосевое расстояние передачи, мм',
  'Угол наклона зубьев',
  'Степень точности',
  'Суммарный к-т перекрытия',
  'Угол зацепления зубчатых колес',
  'Число зубьев шестерни',
  'Число зубьев колеса',
  'Коэфф. смещения исх. контура шестерни',
  'Коэфф. смещения исх. контура колеса',
               { Геометрические размеры колес  }
  'Диаметр окружности вершин шестерни, мм',
  'Делительный диаметр шестерни, мм ',
  'Начальный диаметр шестерни, мм',
  'Диаметр окружности впадин шестерни, мм',
  'Ширина венца шестерни, мм',
  'Диаметр окружности вершин колеса, мм',
  'Делительный диаметр колеса, мм',
  'Начальный диаметр колеса, мм',
  'Диаметр окружности впадин колеса, мм',
  'Ширина венца колеса, мм',
               {  Прочностные и силовые параметры  }
  'Контактное напряжение, Мпа',
  'Момент на быстроходном валу, Нм',
  'Момент на тихоходном валу, Нм',
  'Суммарное давление на вал, Н',
  'Окружное усилие шестерни, Н',
  'Радиальное усилие шестерни, Н',
  'Осевое усилие шестерни, Н',
  'Окружное усилие колеса, Н',
  'Радиальное усилие колеса, Н',
  'Осевое усилие колеса, Н');

BEGIN
  Str(P1:0:2, ValStr[0]);
  Str(N1:0:2, ValStr[1]);
  Str(U:0:2, ValStr[2]);
  Str(Lh:0, ValStr[3]);
  ValStr[4]:=mc1;
  ValStr[5]:=HandleStr[Termobr1];
  ValStr[6]:=mc2;
  ValStr[7]:=HandleStr[Termobr2];
  ValStr[8]:=PatternProcess[Zagotowka[1]];
  ValStr[9]:=PatternProcess[Zagotowka[2]];
  ValStr[10]:=Finish[Wikrugka[1]];
  ValStr[11]:=Finish[Wikrugka[2]];
  ValStr[12]:=CogType[TipZ];
  if (TipZ = 3) and (Kanavka=1) then
    ValStr[12]:=ValStr[12]+' c канавкой';
  ValStr[13]:=ToolStr[motw[1]];
  ValStr[14]:=ToolStr[motw[2]];

  Str(Uf:0:2, ValStr[15]);
  Str(N1:0:2, ValStr[16]);
  Str(N2:0:2, ValStr[17]);
  Str(V:0:2, ValStr[18]);

  Str(mn:0:2, ValStr[19]);
  Str(aw:0:2, ValStr[20]);
  Str(int(bet*180/Pi):0:0, ValStr[21]);
  ValStr[21]:=ValStr[21]+'°';
  Str(int(frac(bet*180/pi)*60):0:0, FmtStr);
  ValStr[21]:=ValStr[21]+FmtStr+'''';
  Str(int(frac(frac(bet*180/Pi)*60)*60):0:0, FmtStr);
  ValStr[21]:=ValStr[21]+FmtStr+'"';
  Str(St, ValStr[22]);
  Str(epsias:0:2, ValStr[23]);
  Str((alfatw*180/Pi):0:2, ValStr[24]);
  ValStr[24]:=ValStr[24]+'°';
  Str(Z1, ValStr[25]);
  Str(Z2, ValStr[26]);
  Str(x1:0:4, ValStr[27]);
  Str(x2:0:4, ValStr[28]);

  Str(Da1:0:3, ValStr[29]);
  Str(d1:0:3, ValStr[30]);
  Str(Dw1:0:3, ValStr[31]);
  Str(Df1:0:3, ValStr[32]);
  Str(B1:0:2, ValStr[33]);
  Str(Da2:0:3, ValStr[34]);
  Str(d2:0:3, ValStr[35]);
  Str(Dw2:0:3, ValStr[36]);
  Str(Df2:0:3, ValStr[37]);
  Str(B2:0:2, ValStr[38]);

  Str(Sigma_H:0:2, ValStr[39]);
  Str(T1:0:2, ValStr[40]);
  Str(T2:0:2, ValStr[41]);
  Str(Fv:0:2, ValStr[42]);
  Str(Ft1:0:2, ValStr[43]);
  Str(Fr1:0:2, ValStr[44]);
  Str(Fx1:0:2, ValStr[45]);
  Str(Ft2:0:2, ValStr[46]);
  Str(Fr2:0:2, ValStr[47]);
  Str(Fx2:0:2, ValStr[48]);
  for ItemCount:=0 to SizeOfList do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
  AStrings^.AtInsert( 0, NewStr('1. Исходные данные'));
  AStrings^.AtInsert(16, NewStr(' '));
  AStrings^.AtInsert(17, NewStr('2. Кинематические параметры'));
  AStrings^.AtInsert(22, NewStr(' '));
  AStrings^.AtInsert(23, NewStr('3. Параметры передачи'));
  AStrings^.AtInsert(34, NewStr(' '));
  AStrings^.AtInsert(35, NewStr('4. Размеры колес'));
  AStrings^.AtInsert(46, NewStr(' '));
  AStrings^.AtInsert(47, NewStr('5. Прочностные и силовые параметры'));
END;

PROCEDURE TCogWheelTransCAD.MakeDataStrings;
Const
  SizeOfList = 26;

Var
  FmtStr: string;
  ValStr: array [0..SizeOfList] of string[23];
  Params: array [0..SizeOfList,0..1] of Pointer;
  ItemCount: byte;

Const
  PatternProcess: array [0..3] of string[9] =
  ('Поковка',
   'Штамповка',
   'Прокат',
   'Отливка');
  CogType: array [2..3] of string[9] =
  ('Косой',
   'Шевронный');
  BStrings: array [Boolean] of string[4] =
  ('Нет',
   'Есть');
  Finish: array [0..2] of string [12] =
  ('Фрезерование',
   'Шлифование',
   'Полирование');
  LoadGraph: array [boolean] of string [11] =
  ('Типовой',
   'Циклограмма');
  GraphStr: array [boolean] of string [12] =
  ('Режим',
   'Коэффициенты');
  ToolStr: array [0..2] of string [13] =
  ('Фреза',
   'Долбяк новый',
   'Долбяк старый');
  DistStr: array [boolean] of string [13] =
  ('Нестандартное',
   'Стандартное');
  LoadStr: array [0..5] of string [22] =
  ('Постоянная нагрузка',
   'Тяжелый ',
   'Средний равновероятный',
   'Средний нормальный',
   'Легкий',
   'Особолегкий');
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

  BaseStr = '%-33s%24s';
  AUTOMessage: string[4] = 'AUTO';
  ParamsName: array [0..SizeOfList] of string [33] = (
  'Мощность на ведущем валу, кВт',
  'Частота вращения шестерни, об/мин',
  'Проектное передаточное число',
  'Расчетный срок службы, час',
  'Материал шестерни',
  'Термообработка шестерни',
  'Материал колеса',
  'Термообработка колеса',
  'Деформационное упроч. шестерни',
  'Деформационное упроч. колеса',
  'Шероховатость зуба шестерни',
  'Шероховатость зуба колеса',
  'Заготовка шестерни',
  'Заготовка колеса',
  'Обработка выкружки шестерни',
  'Обработка выкружки колеса',
  'Тип зубьев',
  'Схема расположения колес',
  'Быстроходность передачи',
  'Число колес в контакте',
  'Режим реверса',
  'График нагружения',
  '',
  'Коэф. внешней динамики',
  'Межосевое расстояние',
  'Зуборезный инструмент шестерни',
  'Зуборезный инструмент колеса');

BEGIN
  ParamsName[22]:=' нагружения';
  Str(P1:0:2, ValStr[0]);
  Str(N1:0:2, ValStr[1]);
  Str(U:0:2, ValStr[2]);
  Str(Lh:0, ValStr[3]);
  ValStr[4]:=mc1;
  ValStr[5]:=HandleStr[Termobr1];
  ValStr[6]:=mc2;
  ValStr[7]:=HandleStr[Termobr2];
  ValStr[8]:=BStrings[ImprovStrength[1]];
  ValStr[9]:=BStrings[ImprovStrength[2]];
  ValStr[10]:='Ra'+GetRaStr(Ra1);
  ValStr[11]:='Ra'+GetRaStr(Ra2);
  ValStr[12]:=PatternProcess[Zagotowka[1]];
  ValStr[13]:=PatternProcess[Zagotowka[2]];
  ValStr[14]:=Finish[Wikrugka[1]];
  ValStr[15]:=Finish[Wikrugka[2]];
  Str(betg:3, ValStr[16]);
  if TipZ = 0 then
    ValStr[16]:=AUTOMessage
  else if (betg = 0) or (TipZ = 1) then
  begin
    ValStr[16]:='Прямой';
    TipZ:=1;
    betg:=0;
  end
  else
    ValStr[16]:=CogType[TipZ]+ValStr[16]+'°';
  if (TipZ = 3) and (Kanavka=1) then
    ValStr[16]:=ValStr[16]+' канавка';
  Str(Nom_Sx, ValStr[17]);
  ValStr[18]:=BStrings[Bistr];
  Str(Zw, ValStr[19]);
  ValStr[20]:=BStrings[rewers];
  ValStr[21]:=LoadGraph[nagr];
  ParamsName[22]:=GraphStr[nagr]+ParamsName[22];
  if not nagr then
    ValStr[22]:=LoadStr[Loading.GraphBar]
  else
    ValStr[22]:='';
  Str(Ka:0:2, ValStr[23]);
  ValStr[24]:=DistStr[otw1];
  ValStr[25]:=ToolStr[motw[1]];
  ValStr[26]:=ToolStr[motw[2]];
  for ItemCount:=0 to SizeOfList do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
END;

PROCEDURE TCogWheelTransCAD.ReadMaterials;
Var
  BufRec: PString;

  function TrimTrail(S : string) : string;
    {-Return a string with trailing white space removed}
  var
    SLen : Byte absolute S;
  begin
    while (SLen > 0) and (S[SLen] <= ' ') do
      Dec(SLen);
    TrimTrail := S;
  end;

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
  MaterialsDB^.Stream^.Reset;
  MaterialsDB^.Seek(0);
  GetMem(BufRec, 65);
  MaterialsDB^.GetRecord(BufRec^[1]);
  while MaterialsDB^.Stream^.Status = stOk do
  begin
    BufRec^[0]:=#64;
    BufRec^:=TrimTrail(BufRec^);
    if Material = '' then
    begin
      System.Delete(BufRec^,1,40);
      AStrings^.Insert(NewStr(BufRec^));
    end
    else if (TProcess = 0) and (Material <> '') then
    begin
      TProcess:=ord(BufRec^[1])-48;
      System.Delete(BufRec^,1,40);
      if BufRec^ = Material then
        AStrings^.Insert(NewStr(HandleStr[TProcess]));
      TProcess:=0;
    end
    else if (Material <> '') and (TProcess = ord(BufRec^[1])-48) then
    begin
      PString(AStrings)^:=BufRec^;
      System.Delete(BufRec^,1,40);
      if (BufRec^ = Material) and
        (TProcess = ord(PString(AStrings)^[1])-48) then
        Break;
    end;
    MaterialsDB^.GetRecord(BufRec^[1]);
  end;
  FreeMem(BufRec, 65);
END;

PROCEDURE TCogWheelTransCAD.ChangeDataItem;
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
    Bruce^.HelpCtx:=hcOk;
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
    Bruce:=New(PInputReal, Init(R, 5, 1, 15, 2,SizeOf(float)));
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
    Bruce^.HelpCtx:=hcOk;
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
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Lh);
END;

PROCEDURE GetMaterial (var TProcess:byte; Dest:PString);
Var
  ScrollBar: PScrollBar;
  Item: word;
  MatNames: PCollection;

BEGIN
  MatNames:=New(PStringCollection, Init(50, 10));
  ReadMaterials(TProcess, '', MatNames);
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
    Insert(New(PLabel, Init(R, 'Материал', Bruce)));
    R.Assign(Size.X-15, 3, Size.X-2, 5);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 3);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Item:=0;
  if Application^.ExecuteDialog(Dialog, @MatNames) = cmOk then
  begin
    Dest^:=string(MatNames^.At(Item)^);
    TProcess:=0;
  end;
  Dispose(MatNames,Done);
END;

PROCEDURE GetThermalHandle (var Dest: byte; Material: PString);
Var
  ScrollBar: PScrollBar;
  Item: word;
  Handles: PCollection;
  BufRec: PString;
  Process: char;

BEGIN
  Dest:=0;
  GetMem(BufRec, 65);
  Handles:=New(PStringCollection, Init(50, 10));
  Handles^.Insert(NewStr('AUTO'));
  ReadMaterials(Dest, Material^, Handles);
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
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Item:=0;
  if Application^.ExecuteDialog(Dialog, @Handles) = cmOk then
    case string(Handles^.At(Item)^)[2] of
      'U': Dest:=0;
      'л': Dest:=1;
      'о': Dest:=2;
      'б': Dest:=3;
      'а': Dest:=4;
      'е': Dest:=5;
      'и': Dest:=6;
      'з': Dest:=7;
      'т': Dest:=8;
    end;
  Dispose(Handles, Done);
  FreeMem(BufRec, 65);
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
    Bruce^.HelpCtx:=hcOk;
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
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Loading.GraphBar);
END;

PROCEDURE GetCogsOptions;
BEGIN
  R.Assign(1, 1, 60, 12);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 17, 7);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('AUTO',
      NewSItem('Прямой',
      NewSItem('Косой',
      NewSItem('Шевронный',
      nil))))
    ));
    Insert(Bruce);
    R.Assign(2,2,17,3);
    Insert(New(PLabel, Init(R, 'Тип зуба', Bruce)));
    R.Assign(Size.X-12, 3, Size.X-2, 4);
    Bruce:=New(PInputInt, Init(R, 2, 0, 45,1));
    Insert(Bruce);
    R.Assign(20, 3, Size.X-12, 4);
    Insert(New(PLabel, Init(R, 'Угол наклона зуба, град.', Bruce)));
    R.Assign(20, 6, Size.X-2, 7);
    Bruce:=New(PCheckBoxes, Init(R,
      NewSItem('Разделительная канавка на венце', nil)));
    Insert(Bruce);
    R.Assign(20, 5, Size.X-2, 6);
    Insert(New(PLabel, Init(R, 'Для шевронных', Bruce)));
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
  Application^.ExecuteDialog(Dialog, @TipZ);
END;

PROCEDURE GetWheelProcess (var Process: word);
BEGIN
  Application^.ExecuteDialog(
    PDialog(RezFile.Get('Способ получения заготовки')), @Process);
END;

PROCEDURE GetTools (var Dest: word);
BEGIN
  R.Assign(1, 1, 40, 10);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 21, 6);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Фреза',
      NewSItem('Долбяк новый',
      NewSItem('Долбяк старый',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2,2,21,3);
    Insert(New(PLabel, Init(R, 'Инструмент', Bruce)));
    R.Assign(Size.X-15, 2, Size.X-2, 4);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 2);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Dest);
END;

PROCEDURE GetFinish (var Dest: word);
BEGIN
  R.Assign(1, 1, 40, 10);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 21, 6);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Фрезерование',
      NewSItem('Шлифование',
      NewSItem('Полирование',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2,2,21,3);
    Insert(New(PLabel, Init(R, 'Обработка выкружки', Bruce)));
    R.Assign(Size.X-15, 2, Size.X-2, 4);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 2);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  Application^.ExecuteDialog(Dialog, @Dest);
END;

PROCEDURE GetSituation;
Var
  VScroll, HScroll: PScrollBar;

Const
  ValidValue: array [0..14] of byte =
    (0,0,1,2,0,7,0,0,3,8,5,0,5,6,4);
  Index: word = 8;

BEGIN
  R.Assign(1, 1, 66, 20);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-18, 3, Size.X-17, Size.Y-2);
    New(VScroll, Init(R));
    Insert(VScroll);
    R.Assign(2, 3, Size.X-18, Size.Y-2);
    Bruce:=New(PTree, Init(R, nil, VScroll,
      NewNode('РАСПОЛОЖЕНИЕ',
        NewNode('КОНСОЛЬНОЕ',
          NewNode('На шарикоподшипниках',nil,
          NewNode('На роликоподшипниках',nil,
          nil)),
        NewNode('МЕЖДУ ОПОРАМИ',
          NewNode('Одноступенчатый редуктор',nil,
          NewNode('МНОГОСТУПЕНЧАТЫЙ РЕДУКТОР',
            NewNode('ПЕРВАЯ СТУПЕНЬ РЕДУКТОРА',
              NewNode('Редуктор по развернутой схеме',nil,
              NewNode('Редуктор с раздвоенной ступенью',nil,
              NewNode('Соосный редуктор',nil,
              nil))),
            NewNode('ПОСЛЕДУЮЩИЕ СТУПЕНИ РЕДУКТОРА',
              NewNode('Редуктор по развернутой схеме',nil,
              NewNode('Редуктор с раздвоенной ступенью',nil,
              NewNode('Соосный редуктор',nil,
              nil))),
            nil)),
          nil)),
        nil)),
      nil)
    ));
    Insert(Bruce);
    R.Assign(2, 2, Size.X-2, 3);
    Insert(New(PLabel, Init(R, 'Расположение колес относительно опор',
                            Bruce)));
    R.Assign(Size.X-15, 3, Size.X-2, 5);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(0, 3);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @Index) = cmOk then
    Nom_Sx:=ValidValue[Index];
END;

PROCEDURE GetWheelsContact;
BEGIN
  R.Assign(1, 1, 60, 8);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-17, 2, Size.X-7, 3);
    Bruce:=New(PInputInt, Init(R, 1, 1, 4,1));
    Insert(Bruce);
    R.Assign(2, 2, Size.X-17, 3);
    Insert(New(PLabel, Init(R, 'Число колес в контакте', Bruce)));
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
  Application^.ExecuteDialog(Dialog, @Zw);
END;

PROCEDURE GetRa (var Target: word);
BEGIN
  Application^.ExecuteDialog(
    PDialog(RezFile.Get('Шероховатость зуба')), @Target);
END;

BEGIN
  case Item of
    0 : GetPower;
    1 : GetFreqency;
    2 : GetReduction;
    3 : GetLifeTime;
    4 : GetMaterial(Termobr1, @mc1);
    5 : GetThermalHandle(Termobr1, @mc1);
    6 : GetMaterial(Termobr2, @mc2);
    7 : GetThermalHandle(Termobr2, @mc2);
    8 : ImprovStrength[1]:=not ImprovStrength[1];
    9 : ImprovStrength[2]:=not ImprovStrength[2];
    10: GetRa(Ra1);
    11: GetRa(Ra2);
    12: GetWheelProcess(Zagotowka[1]);
    13: GetWheelProcess(Zagotowka[2]);
    14: GetFinish(Wikrugka[1]);
    15: GetFinish(Wikrugka[2]);
    16: GetCogsOptions;
    17: GetSituation;
    18: Bistr:=not Bistr;
    19: GetWheelsContact;
    20: Rewers:=not Rewers;
    21: nagr:=not nagr;
    22:
    if nagr then
      GetLoadTable
    else
      GetLoadGraph;
    23: GetExternalDynamic;
    24: otw1:=not otw1;
{    25: GetTools (motw[1]);
    26: GetTools (motw[2]);}
  end;
END;

PROCEDURE TCogWheelTransCAD.MakeVersions;
Var
  TransChk: byte;

FUNCTION Process (ProcessID: char): byte;
BEGIN
  case ProcessID of
    'U': Process:=0;
    'л': Process:=1;
    'о': Process:=2;
    'б': Process:=3;
    'а': Process:=4;
    'е': Process:=5;
    'и': Process:=6;
    'з': Process:=7;
    'т': Process:=8;
  end;
END;

Var
  BufRec: string[65];
  ConvChk: integer;
  Possible: array [1..3] of single;
  CWC: byte;
  CTH: array [1..2] of integer;
  THandles: array [1..2] of PCollection;
  TPTemp: array [1..2] of byte;
  CogTemp: word;

Const
  ValStr: string[4] = '    ';

BEGIN
  CogTemp:=TipZ;
  TPTemp[1]:=Termobr1; TPTemp[2]:=Termobr2;
  THandles[1]:=New(PStringCollection, Init(5, 5));
  THandles[2]:=New(PStringCollection, Init(5, 5));
  if Termobr1 = 0 then
    ReadMaterials(Termobr1, mc1, THandles[1]);
  if Termobr2 = 0 then
    ReadMaterials(Termobr2, mc2, THandles[2]);
  CTH[1]:=0;
  repeat
    if TPTemp[1] = 0 then
    begin
      Termobr1:=Process(string(THandles[1]^.At(CTH[1])^)[2]);
      Inc(CTH[1]);
    end;
    ReadMaterials(Termobr1, mc1, @BufRec);
    Move(BufRec[3], ValStr[2], 3);
    Val(ValStr, H_HRcp1, ConvChk);
    Move(BufRec[6], ValStr[2], 3);
    Val(ValStr, H_HRcs1, ConvChk);
    Move(BufRec[13], ValStr[1], 4);
    Val(ValStr, Sigma_t1, ConvChk);
    Move(BufRec[17], ValStr[1], 4);
    Val(ValStr, Sigma_Flim01, ConvChk);
    Move(BufRec[21], ValStr[1], 4);
    Val(ValStr, Sigma_Fst01, ConvChk);
    Move(BufRec[25], ValStr[1], 4);
    Val(ValStr, S_F1, ConvChk);
    Move(BufRec[29], ValStr[1], 4);
    Val(ValStr, Y_g1, ConvChk);
    Move(BufRec[37], ValStr[1], 4);
    Val(ValStr, Y_d1, ConvChk);
    FillChar(ValStr[1], 4, ' ');
    CTH[2]:=0;
    if not ImprovStrength[1] then
      Y_d1:=1;
    repeat
      if TPTemp[2] = 0 then
      begin
        Termobr2:=Process(string(THandles[2]^.At(CTH[2])^)[2]);
        Inc(CTH[2]);
      end;
      ReadMaterials(Termobr2, mc2, @BufRec);
      Move(BufRec[3], ValStr[2], 3);
      Val(ValStr, H_HRcp2, ConvChk);
      Move(BufRec[6], ValStr[2], 3);
      Val(ValStr, H_HRcs2, ConvChk);
      Move(BufRec[13], ValStr[1], 4);
      Val(ValStr, Sigma_t2, ConvChk);
      Move(BufRec[17], ValStr[1], 4);
      Val(ValStr, Sigma_Flim02, ConvChk);
      Move(BufRec[21], ValStr[1], 4);
      Val(ValStr, Sigma_Fst02, ConvChk);
      Move(BufRec[25], ValStr[1], 4);
      Val(ValStr, S_F2, ConvChk);
      Move(BufRec[29], ValStr[1], 4);
      Val(ValStr, Y_g2, ConvChk);
      Move(BufRec[37], ValStr[1], 4);
      Val(ValStr, Y_d2, ConvChk);
      FillChar(ValStr[1], 4, ' ');
      if not ImprovStrength[2] then
        Y_d2:=1;
      if H_HRcp1 > 100 then
      begin
        H_HBp1:=H_HRcp1;
        H_HRcp1:=0;
      end;
      if H_HRcp2 > 100 then
      begin
        H_HBp2:=H_HRcp2;
        H_HRcp2:=0;
      end;
      if H_HRcs1 > 100 then
      begin
        H_HBs1:=H_HRcs1;
        H_HRcs1:=0;
      end;
      if H_HRcs2 > 100 then
      begin
        H_HBs2:=H_HRcs2;
        H_HRcs2:=0;
      end;
                          {   Перевод твердостей      }
                    {   Из  HRc  в  HB      }
          If (H_HRcs1 <= 30) and (H_HRcs1 > 0) then
            H_HBs1:=Round(220*Exp(0.665*Ln(H_HRcs1/20)))
          else if H_HRcs1 > 30 then
            H_HBs1:=Round(300*Exp(0.96*Ln(H_HRcs1/32.5)));
          If (H_HRcs2 <= 30) and (H_HRcs2 > 0) then
            H_HBs2:=Round(220*Exp(0.665*Ln(H_HRcs2/20)))
          else if H_HRcs2 > 30 then
            H_HBs2:=Round(300*Exp(0.96*Ln(H_HRcs2/32.5)));

          If (H_HRcp1 <= 30) and (H_HRcp1 > 0) then
            H_HBp1:=Round(220*Exp(0.665*Ln(H_HRcp1/20)))
          else if H_HRcp1 > 30 then
            H_HBp1:=Round(300*Exp(0.96*Ln(H_HRcp1/32.5)));
          If (H_HRcp2 <= 30) and (H_HRcp2 > 0) then
            H_HBp2:=Round(220*Exp(0.665*Ln(H_HRcp2/20)))
          else if H_HRcp2 > 30 then
            H_HBp2:=Round(300*Exp(0.96*Ln(H_HRcp2/32.5)));

                    {    Из HB в HV         }
              If H_HBp1 < 100 then
                 H_HVp1:=Round(0.13*sqr(H_HBp1));
              If H_HBp2 < 100 then
                 H_HVp2:=Round(0.13*sqr(H_HBp2));
              if (H_HBp1 > 100) and (H_HBp1 < 350) then
                H_HVp1:=H_HBp1;
              if (H_HBp2 > 100) and (H_HBp2 < 350) then
                H_HVp2:=H_HBp2;
              if (H_HBp1 >=350) and (H_HBp1 < 450) then
                 H_HVp1:=Round(350+(H_HBp1-350)*1.4);
              if (H_HBp2 >=350) and (H_HBp2 < 450) then
                 H_HVp2:=Round(350+(H_HBp2-350)*1.4);
              if H_HBp1 > 450  then
                H_HVp1:=Round(450+(H_HBp1-450)*1.6);
              if H_HBp2 > 450  then
                H_HVp2:=Round(450+(H_HBp2-450)*1.6);

      TipZ:=CogTemp;
      repeat
        if CogTemp = 0 then
        begin
          Inc(TipZ);
          if TipZ = 1 then
            Betg:=0
          else if TipZ = 3 then
            Betg:=35
          else if Nom_Sx = 8 then
            Betg:=25
          else
            Betg:=10;
        end;
        Possible[3]:=-1;
        if Bistr then
          if H_HBp2 <= 350 then
            if TipZ = 3 then
            begin
              Possible[1]:=0.63;
              Possible[2]:=0.8;
              if Nom_Sx = 7 then
                Possible[3]:=1;
            end
            else
              case Nom_Sx of
                1,2:
                begin
                  Possible[1]:=0.2;
                  Possible[2]:=0.25;
                end;
                3,5,8:
                begin
                  Possible[1]:=0.315;
                  Possible[2]:=0.4;
                end;
                7:
                begin
                  Possible[1]:=0.4;
                  Possible[2]:=0.5;
                  Possible[3]:=0.63;
                end;
              end
          else
            if TipZ = 3 then
            begin
              Possible[1]:=0.5;
              Possible[2]:=0.63;
              if Nom_Sx = 7 then
                Possible[3]:=0.8;
            end
            else
              case Nom_Sx of
                1,2:
                begin
                  Possible[1]:=0.16;
                  Possible[2]:=0.2;
                end;
                3,5,8:
                begin
                  Possible[1]:=0.25;
                  Possible[2]:=0.315;
                end;
              end
        else
          if H_Hbp2 <= 350 then
            if TipZ = 3 then
              case Nom_Sx of
                4,5:
                begin
                  Possible[1]:=0.63;
                  Possible[2]:=0.8;
                  Possible[3]:=1;
                end;
                6:
                begin
                  Possible[1]:=0.63;
                  Possible[2]:=0.8;
                end;
                7:
                begin
                  Possible[1]:=0.8;
                  Possible[2]:=1;
                  Possible[3]:=1.25;
                end;
              end
            else
              case Nom_Sx of
                1,2:
                begin
                  Possible[1]:=0.2;
                  Possible[2]:=0.315;
                end;
                4,5,8:
                begin
                  Possible[1]:=0.5;
                  Possible[2]:=0.68;
                  Possible[3]:=0.8;
                end;
                6:
                begin
                  Possible[1]:=0.4;
                  Possible[2]:=0.5;
                  Possible[3]:=0.63;
                end;
                7:
                begin
                  Possible[1]:=0.63;
                  Possible[2]:=0.8;
                  Possible[3]:=1;
                end;
              end
          else
            if TipZ = 3 then
              case Nom_Sx of
                4,5:
                begin
                  Possible[1]:=0.5;
                  Possible[2]:=0.63;
                  Possible[3]:=0.8;
                end;
                6:
                begin
                  Possible[1]:=0.5;
                  Possible[2]:=0.63;
                end;
                7:
                begin
                  Possible[1]:=0.63;
                  Possible[2]:=0.8;
                  Possible[3]:=1;
                end;
              end
            else
              case Nom_Sx of
                1,2:
                begin
                  Possible[1]:=0.16;
                  Possible[2]:=0.2;
                  Possible[3]:=0.25;
                end;
                4,5,8:
                begin
                  Possible[1]:=0.4;
                  Possible[2]:=0.5;
                end;
                6:
                begin
                  Possible[1]:=0.315;
                  Possible[2]:=0.4;
                  Possible[3]:=0.5;
                end;
                7:
                begin
                  Possible[1]:=0.5;
                  Possible[2]:=0.63;
                  Possible[3]:=0.8;
                end;
              end;
        for CWC:=1 to 3 do
          if Possible[CWC] > 0 then
          begin
            Psi_ba:=Possible[CWC];
            mn:=0;
            repeat
              TransChk:=0;
              MakeVersion(TransChk);
              if TransChk = 0 then
                AddVersion;
              mn:=mn*1.12;
            until (z1 < 13);
          end;
      until (CogTemp <> 0) or ((TipZ = 2) and (Nom_Sx = 8)) or (TipZ = 3);
    until CTH[2] = THandles[2]^.Count;
  until CTH[1] = THandles[1]^.Count;
  Dispose(THandles[1], Done);
  Dispose(THandles[2], Done);
  inherited MakeVersions;
END;

PROCEDURE TCogWheelTransCAD.MakeVersion;
BEGIN
  CalculateCWheel(
    Loading,
    P1,               {Мощность, передаваемая быстроходным валом}
    n1,               {Частота вращения быстроходного вала}
    U,           {Передаточное число передачи}
    DeltaU,
    Lh,          {Расчетный ресурс передачи}
    Tipz,        {тип зубьев колес: 1 - прямые
                                         2 - косые
                                         3 - шевронные
                                         0 - автовыбор}
    betg,        {угол наклона зуба в градусах;
                                    при Tipz= 0 становится варьируемым
                                    параметром со знчениями 0, 10, 25 }
    kanavka,    {Для шевронных колес при наличии канавки = 1,
                                           при отсутствии канавки =0}
    mc1,   {марка стали для шестерни}   {????????????????}
    mc2,   {марка стали для колеса}     {??????????????????}
    Termobr1,         {термообработка зуба шестерни, номер}
    Termobr2,    {термообработка зуба колеса, номер}
    Zagotowka,
                      {Способ получения заготовки шестерни и колеса
                         = 1 для поковок
                         = 2 для штамповок
                         = 3 для проката
                         = 4 для отливок  }
    Ra1,              {Шероховатость боковой поверхности зуба шестерни}
    Ra2,        {Шероховатость боковой поверхности зуба колеса}
    Wikrugka,
                      {Финишная обработка выкружки зуба
                        = 0 выкружка зубофрезерована или шлифована
                        = 1 при полировании выкружки}

    Nom_sx,    {Номер схемы расположения колес}
    Zw,          {Число колес находящихся в одновремен-
                       ном контакте с шестерней}
    Psi_ba,      {Коффициент ширины венца,
                       при фиксированном значении вводится из стандартного
                       ряда в зависимости от схемы передачи;
                       при вводе АВТОВЫБОР становится варьируемым
                       параметром также в зависимости от схемы передачи}
    Nagr,             {=1 для типового режима,
                       = 0 для циклограммы}
    rewers,   {При реверсировании = 1;
                       без реверсирования = 0}
    Ka,          {Коэффициент внешней динамики}
    otw1,    {При стандартном межосевом расстоянии = 'Y',
                       при нестандартном межосевом расстоянии ='n'}
    BISTR,    { "0", если передача является тихоходной ступенью}
                      { "1", если передача является быстроходной ступенью}
    motw,                    {Выбор инструмента:
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
    H_HVp2, {Твердость поверхности зуба колеса по Виккерсу}
    S_f1,             { Коэффициент выносливости по изгибу для шестерни}
    S_f2,             { Коэффициент выносливости по изгибу для колеса}
    Y_d1,             {Коэффициент деформационного упрочнения для шестерни}
    Y_d2,             {Коэффициент деформационного упрочнения для колеса}
    Y_g1,             {Коэффициент, учитывающий шлифование  для шестерни}
    Y_g2,      {Коэффициент, учитывающий шлифование  для колеса}
    Sigma_t1,         {Предел текучести материала шестерни}
    Sigma_t2,         {Предел текучести материала колеса}
    Sigma_Flim01,     {Предел выносливости по изгибу для шестерни}
    Sigma_Flim02,     {Предел выносливости по изгибу для колеса}
    Sigma_Fst01,      {Предельное напряжение для шестерни}
    Sigma_Fst02, {Предельное напряжение для колеса}
    {-------------------------------------------------------------------}
{--------------------- Критерии качества ---------------------------------}
    Massa,                   {Суммарная масса зубчатых колес}
    V_p,                     {Объём занимаемый передачей}
    B1,
{-------------------------------------------------------------------------}
    b2,                       {ширина венца}
    Mn,                      {Нормальный модуль }
    aw,                 {межосевое расстояние передачи}
    z1, z2,           {Числа зубьев}
    St,            {Степень точности}
    Fv,              {Суммарное давление на вал}
    epsias,             {суммарный к-т перекрытия}
    alfatw,             {угол зацепления зубчатых колес}
    Uf,                      {Фактическое передаточное число передачи}
    n2,               {Частота вращения колеса}
    V,                 { Скорость, м/с}
    Da1, Da2,                {Диаметр окружности вершин }
    d1,  d2,                 {Делительный диаметр}
    x1,  x2,           {Коэффициент смещения исходного контура}
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
    Fx2,               { Осевое усилие}
    ErrorCode);
END;

FUNCTION TCogWheelTransCAD.DataEntryPoint;
BEGIN
  DataEntryPoint:=@Loading;
END;

FUNCTION TCogWheelTransCAD.QualityNumber;
BEGIN
  QualityNumber:=5;
END;

FUNCTION TCogWheelTransCAD.QualityEntryPoint;
BEGIN
  QualityEntryPoint:=@Massa;
END;

PROCEDURE TCogWheelTransCAD.PlotVersion;
BEGIN
  inherited PlotVersion(VersionID,Dest);
  writeln(Dest,'7');
  writeln(Dest,mc1);
  writeln(Dest,Termobr1);
  writeln(Dest,H_HRcp1);
  writeln(Dest,H_HBs1);
  writeln(Dest,d1:0:2);
  writeln(Dest,da1:0:2);
  writeln(Dest,df1:0:2);
  writeln(Dest,B1:0:2);
  writeln(Dest,x1:0:2);
  writeln(Dest,z1);
  writeln(Dest,Ra1);
  writeln(Dest,mc2);
  writeln(Dest,Termobr2);
  writeln(Dest,H_HRcp2);
  writeln(Dest,H_HBs2);
  writeln(Dest,d2:0:2);
  writeln(Dest,da2:0:2);
  writeln(Dest,df2:0:2);
  writeln(Dest,B2:0:2);
  writeln(Dest,x2:0:2);
  writeln(Dest,z2);
  writeln(Dest,Ra2);
  writeln(Dest,Mn:0:2);
  writeln(Dest,Bet:0:2);
  writeln(Dest,TipZ);
  writeln(Dest,Nom_Sx);
  writeln(Dest,St);
  writeln(Dest,aw:0:2);
  writeln(Dest,T1:0:2);
  writeln(Dest,T2:0:2);
END;
END.

