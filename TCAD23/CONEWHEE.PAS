{$O+}
Unit ConeWheelTransmission;
INTERFACE
Uses
  Objects, Designers, CalConeWheel;

{-------------------------------------------------------------------------}
{-   Ошибки проектирования передачи                                      -}
{-------------------------------------------------------------------------}

Type
{-------------------------------------------------------------------------}
{-   Конструктор передачи                                  -}
{-------------------------------------------------------------------------}
  PConeWheelTransCAD = ^TConeWheelTransCAD;
  TConeWheelTransCAD = object(TDesigner)
{-------------------------------------------------------------------------}
{-  Буфер данных передачи                                                -}
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
    Ra2:real;         {Шероховатость боковой поверхности зуба колеса}
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
    Massa,                   {Суммарная масса зубчатых колес}
    V_p,                     {Объём занимаемый передачей}
    Re,
    Fv,
    Dae2: real;
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
    z1, z2 : byte;             {Числа зубьев}
    St : integer;              {Степень точности}
    Uf,                      {Фактическое передаточное число передачи}
    n2 : real;               {Частота вращения колеса}
    V : real;                 { Скорость, м/с}
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
    d2:real;                   {Средний делительный диаметр колеса}
    Delta2,                    {Угол делительного конуса колеса}
    Delta_A2,                   {Угол конуса вершин колеса}
    Delta_F2: real;             {Угол конуса впадин колеса}
    Sce2,                       {Врешняя постоянная хорда}
    Hce2,                       {Измерительная высота}
    Rs,                         {Среднее конусное расстояние по делительному
                                конусу}
    B,                         {Ширина венца}
    b1,                        {Расстояние от вершины конуса до базовой поверхности}
    b2 :real;
    H_e:real;                  {Высота зуба на внешнем торце}
    d0 : real;                 {Диаметр резцовой головки}
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
    NaprZub1: byte;

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
    procedure ReadMaterials (var TProcess: byte; const Material: string;
      AStrings: PCollection);
  end;

Const
  RConeWheelTransCAD: TStreamRec = (
    ObjType: 1121;
    VmtLink: Ofs(TypeOf(TConeWheelTransCAD)^);
    Load: @TConeWheelTransCAD.Load;
    Store: @TConeWheelTransCAD.Store
  );

IMPLEMENTATION
Uses
  Drivers, Views, App, Dialogs, MsgBox, OutLine, Common, obRead;

Type
  PTree = ^TTree;
  TTree = object(TDialogOutline)
    function Valid (Command: word): boolean; virtual;
  end;

FUNCTION TTree.Valid;
BEGIN
  Valid:=True;
  if (Command = cmOk) and (Foc = 0) then
    Valid:=False;
END;

PROCEDURE TConeWheelTransCAD.InitData;
BEGIN
  nagr:=False;
  Loading.GraphBar:=0;
  with Loading do
  begin
    x:=0.5; y:=0.3; z:=0.2;
    i:=0.2; j:=0.2; k:=0.2;
  end;
  P1:=10;        { 0.2..300  }
  N1:=750;       { 1 .. 5000 об/мин }
  U:=3.58;       { 1 .. 8 }
  DeltaU:=1;
  H_HBp1:=0;     {0..350 }
  H_HBp2:=0;     {0 .. 350}
  H_HBs1:=0;   {0 .. 350}
  H_HBs2:=0;   { 0 .. 350}
  H_HRcp1:=0;   {35 .. 68}
  H_HRcp2:=0;   {35 .. 68}
  H_HRcs1:=0;
  H_HRcs2:=0;
  mc1:='45 ГОСТ 1050-74';
  mc2:='45 ГОСТ 1050-74';
  Termobr1:=2;        {1 .. 8 }
  Termobr2:=2;        {1 .. 8 }
  Lh:=6300;           {10 ... 100000 ч}
  Ka:=1.0;
  Ra1:=2.5;
  Ra2:=2.5;
  TipZ:=0;
  Nagr:=False;
  Rewers:=False;
  Zagotowka[1]:=2;
  Zagotowka[2]:=2;
  Napr_Vr:=False;
  TipOpor:=False;
  Nom_Sx:=3;
  otw1 := True;
END;

PROCEDURE TConeWheelTransCAD.InitQuality;
BEGIN
  inherited InitQuality;
  QualityList^[0].Title:=NewStr('Масса передачи, кг');
  QualityList^[0].Value:=0.2;
  QualityList^[0].Minimize:=True;
  QualityList^[1].Title:=NewStr('Объем передачи, дм куб.');
  QualityList^[1].Value:=0.2;
  QualityList^[1].Minimize:=True;
  QualityList^[2].Title:=NewStr('Конусное расстояние, мм');
  QualityList^[2].Value:=0.2;
  QualityList^[2].Minimize:=True;
  QualityList^[3].Title:=NewStr('Давление на вал, Н');
  QualityList^[3].Value:=0.2;
  QualityList^[3].Minimize:=True;
  QualityList^[4].Title:=NewStr('Диаметр колеса, мм');
  QualityList^[4].Value:=0.2;
  QualityList^[4].Minimize:=True;
END;

PROCEDURE TConeWheelTransCAD.MakeVersionStrings;
Const
  SizeOfList = 53;

Var
  FmtStr: string;
  ValStr: array [0..SizeOfList] of string[23];
  Params: array [0..SizeOfList,0..1] of Pointer;
  ItemCount: byte;

Const
  PatternProcess: array [0..3] of string[9] =
  ('Поковка',
   'Штамповка',
   'Отливка',
   'Прокат');
  CogType: array [1..2] of string[9] =
  ('Прямой',
   'Круговой');
  CogPattern: array [1..2] of string[23] =
  ('Пропорц.-понижающийся',
   'С пост. шириной впадин');
  Rotation: array [boolean] of string [22] =
  ('По часовой стрелке',
   'Против часовой стрелки');
  Way: array [1..2] of string[6] =
  ('Левое',
   'Правое');
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
  'Тип зубьев',
  'Форма зуба',
  'Направление вращения',
  'Направление наклона зуба',
               {Кинематические параметры}
  'Фактическое передаточное число',
  'Частота вращения шестерни, об/мин',
  'Частота вращения колеса, об/мин',
  'Линейная скорость, м/с',
               { Параметры передачи }
  'Нормальный модуль, мм',
  'Торцевой модуль, мм',
  'Конусное расстояние передачи, мм',
  'Угол делительного конуса шестерни',
  'Угол делительного конуса колеса',
  'Угол выступов конуса шестерни',
  'Угол выступов конуса колеса',
  'Угол впадин конуса шестерни',
  'Угол впадин конуса колеса',
  'Суммарный коэфф. перекрытия',
  'Степень точности',
  'Число зубьев шестерни',
  'Число зубьев колеса',
  'Коэфф. смещения исх. контура шестерни',
  'Коэфф. смещения исх. контура колеса',
  'Коэфф. тангенц. смещения для шестерни',
  'Коэфф. тангенц. смещения для колеса',
               { Геометрические размеры колес  }
  'Диаметр конуса вершин шестерни, мм',
  'Делительный диаметр шестерни, мм',
  'Диаметр конуса впадин шестерни, мм',
  'Расст. до базовой поверх. шестерни, мм',
  'Диаметр конуса вершин колеса, мм',
  'Делительный диаметр колеса, мм',
  'Диаметр конуса впадин колеса, мм',
  'Расст. до базовой поверх. колеса, мм',
  'Ширина венца, мм',
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
  Str(Lh, ValStr[3]);
  ValStr[4]:=mc1;
  ValStr[5]:=HandleStr[Termobr1];
  ValStr[6]:=mc2;
  ValStr[7]:=HandleStr[Termobr2];
  ValStr[8]:=PatternProcess[Zagotowka[1]];
  ValStr[9]:=PatternProcess[Zagotowka[2]];
  ValStr[10]:=CogType[TipZ];
  ValStr[11]:=CogPattern[Forma];
  ValStr[12]:=Rotation[Napr_Vr];
  ValStr[13]:=Way[NaprZub1];

  Str(Uf:0:2, ValStr[14]);
  Str(N1:0:2, ValStr[15]);
  Str(N2:0:2, ValStr[16]);
  Str(V:0:2, ValStr[17]);

  Str(mn:0:2, ValStr[18]);
  Str(Mte:0:2, ValStr[19]);
  Str(Re:0:2, ValStr[20]);
  Str(Delta1:0:2, ValStr[21]);
  Str(Delta2:0:2, ValStr[22]);
  Str(Delta_A1:0:2, ValStr[23]);
  Str(Delta_A2:0:2, ValStr[24]);
  Str(Delta_F1:0:2, ValStr[25]);
  Str(Delta_F2:0:2, ValStr[26]);
  Str(epsias:0:2, ValStr[27]);
  Str(St, ValStr[28]);
  Str(Z1, ValStr[29]);
  Str(Z2, ValStr[30]);
  Str(x1:0:2, ValStr[31]);
  Str(x2:0:2, ValStr[32]);
  Str(xtau1:0:2, ValStr[33]);
  Str(xtau2:0:2, ValStr[34]);

  Str(Dae1:0:2, ValStr[35]);
  Str(De1:0:2, ValStr[36]);
  Str(Dfe1:0:2, ValStr[37]);
  Str(B1:0:2, ValStr[38]);
  Str(Dae2:0:2, ValStr[39]);
  Str(De2:0:2, ValStr[40]);
  Str(Dfe2:0:2, ValStr[41]);
  Str(B2:0:2, ValStr[42]);
  Str(B:0:2, ValStr[43]);

  Str(Sigma_H:0:2, ValStr[44]);
  Str(T1:0:2, ValStr[45]);
  Str(T2:0:2, ValStr[46]);
  Str(Fv:0:2, ValStr[47]);
  Str(Ft1:0:2, ValStr[48]);
  Str(Fr1:0:2, ValStr[49]);
  Str(Fx1:0:2, ValStr[50]);
  Str(Ft2:0:2, ValStr[51]);
  Str(Fr2:0:2, ValStr[52]);
  Str(Fx2:0:2, ValStr[53]);
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
  AStrings^.AtInsert(40, NewStr(' '));
  AStrings^.AtInsert(41, NewStr('4. Размеры колес'));
  AStrings^.AtInsert(51, NewStr(' '));
  AStrings^.AtInsert(52, NewStr('5. Прочностные и силовые параметры'));
END;

PROCEDURE TConeWheelTransCAD.MakeDataStrings;
Const
  SizeOfList = 18;

Var
  FmtStr: string;
  ValStr: array [0..SizeOfList] of string[23];
  Params: array [0..SizeOfList,0..1] of Pointer;
  ItemCount: byte;

Const
  PatternProcess: array [0..3] of string[9] =
  ('Поковка',
   'Штамповка',
   'Отливка',
   'Прокат');
  CogType: array [1..2] of string[8] =
  ('Прямой',
   'Круговой');
  BStrings: array [Boolean] of string[4] =
  ('Нет',
   'Есть');
  LoadGraph: array [boolean] of string [11] =
  ('Типовой',
   'Циклограмма');
  GraphStr: array [boolean] of string [12] =
  ('Режим',
   'Коэффициенты');
  DString: array [boolean] of string [13] =
  ('Нестандартный',
   'Стандартный');
  Support: array [boolean] of string [9] =
  ('Роликовые',
   'Шариковые');
  Rotation: array [boolean] of string [22] =
  ('По часовой стрелке',
   'Против часовой стрелки');
  LoadStr: array [0..5] of string [22] =
  ('Постоянная нагрузка',
   'Тяжелый',
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
  'Заготовка шестерни',
  'Заготовка колеса',
  'Тип зубьев',
  'Схема расположения колес',
  'Вращение ведущего вала',
  'Режим реверса',
  'График нагружения',
  '',
  'Коэф. внешней динамики',
  'Тип подшипников опор',
  'Делительный диаметер колеса');

BEGIN
  ParamsName[15]:=' нагружения';
  Str(P1:0:2, ValStr[0]);
  Str(N1:0:2, ValStr[1]);
  Str(U:0:2, ValStr[2]);
  Str(Lh, ValStr[3]);
  ValStr[4]:=mc1;
  ValStr[5]:=HandleStr[Termobr1];
  ValStr[6]:=mc2;
  ValStr[7]:=HandleStr[Termobr2];
  ValStr[8]:=PatternProcess[Zagotowka[1]];
  ValStr[9]:=PatternProcess[Zagotowka[2]];
  if TipZ = 0 then
    ValStr[10]:=AUTOMessage
  else
    ValStr[10]:=CogType[TipZ];
  Str(Nom_Sx, ValStr[11]);
  ValStr[12]:=Rotation[Napr_Vr];
  ValStr[13]:=BStrings[rewers];
  ValStr[14]:=LoadGraph[nagr];
  ParamsName[15]:=GraphStr[nagr]+ParamsName[15];
  if not nagr then
    ValStr[15]:=LoadStr[Loading.GraphBar]
  else
    ValStr[15]:='';
  Str(Ka:0:2, ValStr[16]);
  ValStr[17]:=Support[TipOpor];
  ValStr[18]:=DString[otw1];
  for ItemCount:=0 to SizeOfList do
  begin
    Params[ItemCount,0]:=@ParamsName[ItemCount];
    Params[ItemCount,1]:=@ValStr[ItemCount];
    FormatStr(FmtStr, BaseStr, Params[ItemCount]);
    AStrings^.Insert(NewStr(FmtStr));
  end;
END;

PROCEDURE TConeWheelTransCAD.ReadMaterials;
Var
  MaterialsDB: PDBFile;
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
  MaterialsDB:=New(PDBFile, Init('materials.dbf', 2048, False));
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
  Dispose(MaterialsDB, Done);
END;

PROCEDURE TConeWheelTransCAD.ChangeDataItem;
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
    Bruce:=New(PInputReal, Init(R, 5, 0.5, 20, 2,SizeOf(float)));
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
    Bruce:=New(PInputReal, Init(R, 7, 1, 3000, 2,SizeOf(float)));
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
    Bruce:=New(PInputReal, Init(R, 4, 1, 8, 2,SizeOf(float)));
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
    Bruce:=New(PInputInt, Init(R, 6, 100, 100000,4));
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
    Bruce^.HelpCtx:=hcCancel;
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
    Bruce^.HelpCtx:=hcCancel;
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
  R.Assign(1, 1, 50, 12);
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

PROCEDURE GetCogsOptions;
BEGIN
  R.Assign(1, 1, 40, 9);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 17, 6);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('AUTO',
      NewSItem('Прямой',
      NewSItem('Круговой',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2,2,17,3);
    Insert(New(PLabel, Init(R, 'Тип зуба', Bruce)));
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
  Application^.ExecuteDialog(Dialog, @TipZ);
END;

PROCEDURE GetWheelProcess;
BEGIN
  R.Assign(1, 1, 60, 11);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 38, 5);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Штамповка',
      NewSItem('Поковка',
      NewSItem('Литье',
      NewSItem('Прокат',
      nil))))
    ));
    Insert(Bruce);
    R.Assign(2,2,30,3);
    Insert(New(PLabel, Init(R, 'Способ получения заготовки', Bruce)));
    R.Assign(2, 7, 38, 8);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Ra0.8',
      NewSItem('Ra1.6',
      NewSItem('Ra3.2',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2,6,50,7);
    Insert(New(PLabel, Init(R, 'Шероховатость боковой поверхности', Bruce)));
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
  Application^.ExecuteDialog(Dialog, @P1);
END;

PROCEDURE GetSituation;
Var
  VScroll, HScroll: PScrollBar;

BEGIN
  R.Assign(1, 1, 66, 15);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(Size.X-18, 3, Size.X-17, Size.Y-2);
    New(VScroll, Init(R));
    Insert(VScroll);
    R.Assign(2, 3, Size.X-18, Size.Y-2);
    Bruce:=New(PTree, Init(R, nil, VScroll,
      NewNode('Расположение',
        NewNode('Консольное', nil,
        NewNode('Колесо-консольное', nil,
        NewNode('Шестерня-консольная, колесо симметрично', nil,
        NewNode('Между опорами несимметрично', nil,
        nil)))),
    nil)));
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
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  if Application^.ExecuteDialog(Dialog, @Nom_Sx) = cmOk then
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
    10: GetCogsOptions;
    11: GetSituation;
    12: Napr_Vr:=not Napr_Vr;
    13: Rewers:=not Rewers;
    14: nagr:=not nagr;
    15:
    if nagr then
      GetLoadTable
    else
      GetLoadGraph;
    16: GetExternalDynamic;
    17: TipOpor:=not TipOpor;
    18: otw1:=not otw1;
  end;
END;

PROCEDURE TConeWheelTransCAD.MakeVersions;
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
  BufRec: string[64];
  ConvChk: integer;
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
    FillChar(ValStr[1], 4, ' ');
    CTH[2]:=0;
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
      FillChar(ValStr[1], 4, ' ');
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
               If ((H_HRcs1 > 0) or (H_HRcs2 > 0 )) then begin
          If H_HRcs1 <= 30 then H_HBs1:=Round(220*Exp(0.665*Ln(H_HRcs1/20)))
          Else  H_HBs1:=Round(300*Exp(0.96*Ln(H_HRcs1/32.5)));
          If H_HRcs2 <= 30 then H_HBs2:=Round(220*Exp(0.665*Ln(H_HRcs2/20)))
          Else  H_HBs2:=Round(300*Exp(0.96*Ln(H_HRcs2/32.5)));
                                                          end;
               If ((H_HRcp1 > 0) or (H_HRcp2 > 0 )) then begin
          If H_HRcp1 <= 30 then H_HBp1:=Round(220*Exp(0.665*Ln(H_HRcp1/20)))
          Else  H_HBp1:=Round(300*Exp(0.96*Ln(H_HRcp1/32.5)));
          If H_HRcp2 <= 30 then H_HBp2:=Round(220*Exp(0.665*Ln(H_HRcp2/20)))
          Else  H_HBp2:=Round(300*Exp(0.96*Ln(H_HRcp2/32.5)));
                                                          End;
                    {    Из HB в HV         }
          If (( H_HBp1 > 0 ) or (H_HBp2 >0 )) then begin
              If ((H_HBp1<100) or (H_HBp2<100)) then begin
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
      TipZ:=CogTemp;
      repeat
        if CogTemp = 0 then
          Inc(TipZ);
        Forma:=0;
        repeat
          Inc(Forma);
          TransChk:=0;
          MakeVersion(TransChk);
          if TransChk = 0 then
            AddVersion;
        until ((Forma=1) and (TipZ=1)) or ((Forma=2) and (TipZ=2));
      until (CogTemp <> 0) or (TipZ = 2);
    until CTH[2] = THandles[2]^.Count;
  until CTH[1] = THandles[1]^.Count;
  Dispose(THandles[1], Done);
  Dispose(THandles[2], Done);
  inherited MakeVersions;
END;

PROCEDURE TConeWheelTransCAD.MakeVersion;
BEGIN
  CalculateConeWheel(
    Loading,
    P1,               {Мощность, передаваемая быстроходным валом}
    n1,               {Частота вращения быстроходного вала}
    U,                {Передаточное число передачи}
    DeltaU,
    Lh,               {Расчетный ресурс передачи}
    Tipz,             {тип зубьев колес: 1 - прямые
                                         2 - косые
                                         0 - автовыбор}
    Napr_Vr,
    TipOpor,
    Forma,
    mc1,              {марка стали для шестерни}   {????????????????}
    mc2,              {марка стали для колеса}     {??????????????????}
    Termobr1,         {термообработка зуба шестерни, номер}
    Termobr2,         {термообработка зуба колеса, номер}
    Zagotowka,
                      {Способ получения заготовки шестерни и колеса
                         = 1 для поковок
                         = 2 для штамповок
                         = 3 для проката
                         = 4 для отливок  }
    Ra1,              {Шероховатость боковой поверхности зуба шестерни}
    Ra2,              {Шероховатость боковой поверхности зуба колеса}
    Nom_sx,           {Номер схемы расположения колес}
    Nagr,             {=1 для типового режима,
                       = 0 для циклограммы}
    rewers,           {При реверсировании = 1;
                       без реверсирования = 0}
    Ka,               {Коэффициент внешней динамики}
    otw1,             {При стандартном межосевом расстоянии = 'Y',
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
    H_HVp2,           {Твердость поверхности зуба колеса по Виккерсу}
    S_f1,             { Коэффициент выносливости по изгибу для шестерни}
    S_f2,             { Коэффициент выносливости по изгибу для колеса}
    Sigma_t1,         {Предел текучести материала шестерни}
    Sigma_t2,         {Предел текучести материала колеса}
    Sigma_Flim01,     {Предел выносливости по изгибу для шестерни}
    Sigma_Flim02,     {Предел выносливости по изгибу для колеса}
    Sigma_Fst01,      {Предельное напряжение для шестерни}
    Sigma_Fst02,       {Предельное напряжение для колеса}
    {-------------------------------------------------------------------}
{--------------------- Критерии качества ---------------------------------}
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
    xn2,                 {Коэффициент смещения исходного контура
                                в нормальном сечении для колес с круговым
                                зубом}
    NaprZub1,
    z1, z2,                    {Числа зубьев}
    St,                        {Степень точности}
    Uf,                      {Фактическое передаточное число передачи}
    n2,                      {Частота вращения колеса}
    V,                        { Скорость, м/с}
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
    d2,                        {Средний делительный диаметр колеса}
    Delta2,                    {Угол делительного конуса колеса}
    Delta_A2,                   {Угол конуса вершин колеса}
    Delta_F2,                   {Угол конуса впадин колеса}
    Sce2,                       {Врешняя постоянная хорда}
    Hce2,                        {Измерительная высота}
    Rs,                         {Среднее конусное расстояние по делительному
                                конусу}
    B,                         {Ширина венца}
    b1,                        {Расстояние от вершины конуса до базовой поверхности}
    b2,
    H_e,                       {Высота зуба на внешнем торце}
    d0,                        {Диаметр резцовой головки}
    Sigma_H,                  {Контактное напряжение }
    T1,                     {Момент, передаваемый быстроходным валом}
    T2,                     {Момент, передаваемый тихоходным валом}
    Ft1,                      { Окружное усилие   }
    Fr1,                      {Радиальное усилие}
    Fx1,                      {Осевое усилие  }
    Ft2,                      { Окружное усилие}
    Fr2,                      { Радиальное усилие}
    Fx2,                      { Осевое усилие}
    Epsias,
    ErrorCode);
END;

FUNCTION TConeWheelTransCAD.DataEntryPoint;
BEGIN
  DataEntryPoint:=@Loading;
END;

FUNCTION TConeWheelTransCAD.QualityNumber;
BEGIN
  QualityNumber:=5;
END;

FUNCTION TConeWheelTransCAD.QualityEntryPoint;
BEGIN
  QualityEntryPoint:=@Massa;
END;
END.