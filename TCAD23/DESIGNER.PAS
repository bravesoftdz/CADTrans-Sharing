Unit Designers;
INTERFACE

Uses
  Objects, obRead, Views;

Const
  QTYQualityIndex = 15;
  {- Максимальное кол-во критериев качества -}

Type

{$IFDEF Single}
  float = single;
{$ELSE}
  float = real;
{$ENDIF}

{-------------------------------------------------------------------------}
{-   Критериальный ограничитель                                          -}
{-------------------------------------------------------------------------}
  TQualityIndex = record
    Title:    PString;   {-  Имя ограничителя        -}
    MinLimit: float;     {-  Минимальный предел      -}
    MaxLimit: float;     {-  Максимальный предел     -}
    Value:    byte;      {-  Весовой коэффициент     -}
    Minimize: boolean;   {-  Минимизировать ?        -}
  end;

  TQualityList = array [0..QTYQualityIndex] of TQualityIndex;
  PQualityList = ^TQualityList;

  PDesigner = ^TDesigner;
  TDesigner = object(TSortedCollection)

    QualityList: PQualityList;
    {- Список критериев качества -}

    constructor Init;
    {- Конструктор объекта.                                        -}
    {- Внутренне вызывает InitData and InitQuality.                -}
    {- Применяется при постороении ресурсов.                       -}
    procedure InitData; virtual;
    {- Инициализация данных.                                       -}
    {- Присваивает исходным данным начальные значения.             -}
    {- Метод обязательно должен перекрываться наследником и        -}
    {- используется при построении ресурсов.                       -}
    procedure InitQuality; virtual;
    {- Инициализация критериев качества.                           -}
    {- Распределяет память под QualityNumber критериев качества и  -}
    {- устанавливает начальные граничные значения.                 -}
    {- Должен дополняться наследником для определения названий     -}
    {- критериев и присвоения начальных значений весовым           -}
    {- коэффициентам. Используется при построении ресурсов.        -}
    constructor Load (var S: TStream);
    {- Основной конструктор объекта.                               -}
    {- Рапределяет память под критерии качества.                   -}
    {- Загружает из ресурса исходные данные и критерии качества    -}
    {- сохраненные методом Store.                                  -}
    {- Иногда дополняется наследником.                             -}
    destructor Done; virtual;
    {- Деструктор объекта.                                         -}
    {- Внутренне вызывает DoneQuality.                             -}
    {- Иногда дополняется наследником.                             -}
    procedure DoneQuality; virtual;
    {- Разрушает список критериев качества и освобождает память.   -}
    {- Никогда не перекрывается.                                   -}
    procedure Store (var S: TStream); virtual;
    {- Сохраняет в ресурсе исходные данные и критерии качества.    -}
    {- Применяется при постороении ресурсов.                       -}
    {- Никокда не перекрывается.                                   -}
    procedure MakeDataStrings (AStrings: PCollection); virtual;
    {- Создает коллекцию строк для исходных данных.                -}
    {- Должен перекруваться наследником.                           -}
    procedure ChangeDataItem (Item: byte); virtual;
    {- Реализет действие при выборе Изменить.                      -}
    {- Номер изменяемого параметра передается в Item.              -}
    {- Должен перекрываться наследником.                           -}
    procedure MakeVersions; virtual;
    {- Циклически вызывает MakeVersion для расчета варианта        -}
    {- и AddVersion для его сохраненния.                           -}
    {- При пустой коллекции (нет работоспособных вариантов)        -}
    {- вызывает DisplayErrorMsg (0).                               -}
    {- Должен дополнятся наследником.                              -}
    procedure MakeVersion (var ErrorCode: byte); virtual;
    {- По исходным данным производит расчет варианта.              -}
    {- Устанавливает ErrorCode для проверки варианта в             -}
    {- MakeVersions.                                               -}
    {- Должен перекрываться наследником.                           -}
    procedure AddVersion; virtual;
    {- Добавляет вариант в коллекцию и изменяет значения полей     -}
    {- MinLimit и MaxLimit в списке критериев качества.            -}
    {- Никогда не перекрывается наследником.                       -}
    function  ErrorMsg (ErrorCode: byte): string; virtual;
    {- Возвращает сообщение для ошибки ErrorCode.                  -}
    {- При ErrorCode = 0 возвращает сообщение о некорректности     -}
    {- исходных данных.                                            -}
    {- Должен дополнятся наследником.                              -}
    {- Для улучшения работы этого метода следует ввести механизм   -}
    {- загрузки сообщений из ресурса.                              -}
    procedure DisplayErrorMsg (ErrorCode: byte); virtual;
    {- Формирует окно с сообщением об ошибке возвращаемом          -}
    {- ErrorMsg (ErrorCode).                                       -}
    {- Иногда может перекрываться.                                 -}
    procedure DisplayStatus; virtual;
    {- Формирует окно с сообщением о количестве всех и             -}
    {- удовлетворяющих пользователя вариантов.                     -}
    {- Иногда может перекрываться.                                 -}
    function  ValidVersion (VersionID: word): boolean; virtual;
    procedure MakeQualityStrings (AStrings: PCollection); virtual;
    procedure ChangeQualityItem (Item: byte); virtual;
    procedure ShowVersions; virtual;
    procedure ShowVersion (VersionID: word); virtual;
    procedure PrintVersion (VersionID: PView; var Dest: text); virtual;
    procedure PlotVersion (VersionID: PView; var Dest: text); virtual;
    procedure MakeVersionStrings (AStrings: PCollection); virtual;
    procedure ReOrder; virtual;
    procedure DataFromVersion (VersionID: word); virtual;
    function  DataEntryPoint: pointer; virtual;
    function  DataSize: word; virtual;
    function  QualityEntryPoint: pointer; virtual;
    function  QualitySize: word; virtual;
    function  QualityNumber: word; virtual;
    function  Compare (Key1, Key2: Pointer): integer; virtual;
    procedure FreeItem (Item: Pointer); virtual;
    function  DataFromScreen: word;
    function  QualityFromScreen: word;
  end;

  PVersion = ^TVersion;
  TVersion = object(TTextWindow)
    DQSize: word;
    DataQuality: Pointer;

    constructor Init (const ATitle: TTitleStr; ADataSize: word);
    constructor Load (var S: TStream);
    procedure Store (var S:TStream); virtual;
    destructor Done; virtual;
    procedure GetData (var R); virtual;
    procedure SetData (var R); virtual;
  end;

Const
  RDesigner: TStreamRec = (
    ObjType: 1110;
    VmtLink: Ofs(TypeOf(TDesigner)^);
    Load: @TDesigner.Load;
    Store: @TDesigner.Store
  );
  RVersion: TStreamRec = (
    ObjType: 1099;
    VmtLink: Ofs(TypeOf(TVersion)^);
    Load: @TVersion.Load;
    Store: @TVersion.Store
  );

IMPLEMENTATION
Uses
  App, Drivers, Dialogs, TextView, MsgBox, Common;

CONSTRUCTOR TDesigner.Init;
BEGIN
  inherited Init (20,10);
  InitData;
  InitQuality;
END;

PROCEDURE TDesigner.InitData;
BEGIN
END;

PROCEDURE TDesigner.InitQuality;
Var
  CQ: byte;

BEGIN
  GetMem(QualityList, SizeOf(TQualityIndex)*QualityNumber);
  for CQ:=0 to QualityNumber-1 do
  begin
    QualityList^[CQ].MinLimit:=9999999;
    QualityList^[CQ].MaxLimit:=-9999999;
  end;
END;

CONSTRUCTOR TDesigner.Load;
Var
  CQ: byte;

BEGIN
  inherited Init(20,10);
  GetMem(QualityList, SizeOf(TQualityIndex)*QualityNumber);
  S.Read(DataEntryPoint^, DataSize+QualitySize);
  for CQ:=0 to QualityNumber-1 do
    with QualityList^[CQ] do
    begin
      S.Read(MinLimit, SizeOf(MinLimit));
      S.Read(MaxLimit, SizeOf(MaxLimit));
      S.Read(Value, SizeOf(Value));
      S.Read(Minimize, SizeOf(Minimize));
      Title:=S.ReadStr;
    end;
END;

DESTRUCTOR TDesigner.Done;
BEGIN

  inherited Done;
  DoneQuality;
END;

PROCEDURE TDesigner.DoneQuality;
Var
  CQ: byte;

BEGIN
  for CQ:=0 to QualityNumber-1 do
    DisposeStr(QualityList^[CQ].Title);
  FreeMem(QualityList, SizeOf(TQualityIndex)*QualityNumber);
END;

PROCEDURE TDesigner.Store;
Var
  CQ: byte;

BEGIN
  S.Write(DataEntryPoint^, DataSize+QualitySize);
  for CQ:=0 to QualityNumber-1 do
    with QualityList^[CQ] do
    begin
      S.Write(MinLimit, SizeOf(MinLimit));
      S.Write(MaxLimit, SizeOf(MaxLimit));
      S.Write(Value, SizeOf(Value));
      S.Write(Minimize, SizeOf(Minimize));
      S.WriteStr(Title);
    end;
END;

PROCEDURE TDesigner.MakeDataStrings;
BEGIN
END;

PROCEDURE TDesigner.ChangeDataItem;
BEGIN
END;

PROCEDURE TDesigner.MakeVersions;
BEGIN
  if Count = 0 then
  begin
    InitData;
    DisplayErrorMsg(0);
  end
  else
    ReOrder;
END;

PROCEDURE TDesigner.MakeVersion;
BEGIN
END;

PROCEDURE TDesigner.AddVersion;
Var
  NewVersion: Pointer;
  QOffset: word;
  QC: byte;

BEGIN
  QOffset:=Ofs(DataEntryPoint^)+DataSize;
  for QC:=0 to QualityNumber-1 do
  begin
    if QualityList^[QC].MinLimit >
      float(Ptr(Seg(DataEntryPoint^), QOffset)^) then
      QualityList^[QC].MinLimit:=
        float(Ptr(Seg(DataEntryPoint^), QOffset)^);
    if QualityList^[QC].MaxLimit <
      float(Ptr(Seg(DataEntryPoint^), QOffset)^) then
      QualityList^[QC].MaxLimit:=
        float(Ptr(Seg(DataEntryPoint^), QOffset)^);
    Inc(QOffset, SizeOf(float));
  end;
  GetMem(NewVersion, DataSize+QualitySize);
  Move(DataEntryPoint^,NewVersion^,DataSize+QualitySize);
  Insert(NewVersion);
END;

FUNCTION TDesigner.ErrorMsg;
BEGIN
  if ErrorCode = 0 then
    ErrorMsg:=#3'Некорректны исходные данные!'+
    #13+
    #3'Варианты не расчитанны!';
END;

PROCEDURE TDesigner.DisplayErrorMsg;
BEGIN
  MessageBox(ErrorMsg(ErrorCode),nil,mfError+mfOkButton);
END;

PROCEDURE TDesigner.DisplayStatus;
Const
  MsgStr = #3'Всего вариантов       -%4d'#13+
           #13+
           #3'Подходящих вариантов  -%4d';
Var
  VC: word;
  AVC: Longint;
  TV: Longint;

BEGIN
  if Count < 1 then
    Exit;
  AVC:=0;
  TV:=Count;
  for VC:=0 to Count-1 do
    if ValidVersion(VC) then
      Inc(AVC);
  MessageBox(MsgStr, @TV, mfInformation+mfOkButton);
END;

FUNCTION TDesigner.ValidVersion;
Var
  QC: byte;
  QOffset: word;

BEGIN
  ValidVersion:=True;
  QOffset:=Ofs(At(VersionID)^)+DataSize;
  for QC:=0 to QualityNumber-1 do
  begin
    if (QualityList^[QC].MinLimit - 1 >
      float(Ptr(Seg(At(VersionID)^), QOffset)^)) or
      (QualityList^[QC].MaxLimit + 1 <
      float(Ptr(Seg(At(VersionID)^), QOffset)^)) then
      begin
        ValidVersion:=False;
        Exit;
      end;
    Inc(QOffset, SizeOf(float));
  end;
END;

PROCEDURE TDesigner.MakeQualityStrings;
Var
  WghStr: PString;
  MaxStr: PString;
  MinStr: PString;
  Name  : PString;
  General: PString;
  QC: byte;

Const
  StdStr = '%-28s│%10s │%10s │%4s';

BEGIN
  GetMem(MinStr, 11);
  GetMem(MaxStr, 11);
  GetMem(WghStr, 4);
  GetMem(General, 80);
  for QC:=0 to QualityNumber-1 do
  begin
    Str(QualityList^[QC].MinLimit:0:2,MinStr^);
    Str(QualityList^[QC].MaxLimit:0:2,MaxStr^);
    Str(QualityList^[QC].Value,WghStr^);
    Name:=QualityList^[QC].Title;
    FormatStr(General^,StdStr,Name);
    AStrings^.Insert(NewStr(General^));
  end;
  FreeMem(MinStr, 11);
  FreeMem(MaxStr, 11);
  FreeMem(WghStr, 4);
  FreeMem(General, 80);
END;

PROCEDURE TDesigner.ChangeQualityItem;
Var
  Dialog: PDialog;

BEGIN
  Dialog:=PDialog(RezFile.Get('Ввод критериальных ограничителей'));
  Dialog^.Title:=NewStr(QualityList^[Item].Title^);
  PInputReal(Dialog^.Current)^.SetLimits
    (-1E5, QualityList^[Item].MaxLimit);
  Dialog^.SelectNext(False);
  PInputReal(Dialog^.Current)^.SetLimits
    (QualityList^[Item].MinLimit, 1E5);
  Dialog^.SelectNext(True);
  Application^.ExecuteDialog(Dialog, @QualityList^[Item].MinLimit);
END;

PROCEDURE TDesigner.ShowVersions;
Var
  CV: word;

BEGIN
  if Count < 1 then
    Exit;
  for CV:=0 to Count-1 do
    if ValidVersion(CV) then
      ShowVersion(CV);
END;

PROCEDURE TDesigner.ShowVersion;
Var
  fe: byte;
  VerReport: PCollection;
  Window: PWindow;
  TTY: PTerminal;
  R: TRect;
  TextDevice: text;
  VerNum: string[12];

procedure Print (What: PString); far;
BEGIN
  writeln(TextDevice, What^);
END;

BEGIN
  if VersionID > Count-1 then
    Exit;
  DataFromVersion(VersionID);
  fe:=0;
  MakeVersion(fe);
  VerReport:=New(PTextCollection, Init(30,10));
  MakeVersionStrings(VerReport);
  Str(VersionID:3, VerNum);
  Window:=New(PVersion, Init(DesignerName+':'+VerNum,
    DataSize+QualitySize));
  Window^.SetData(DataEntryPoint^);
  with Window^ do
  begin
    R.Assign(2,1,Size.X-1, Size.Y-1);
    New(TTY, Init(R,
      StandardScrollBar(sbHorizontal+sbHandleKeyboard),
      StandardScrollBar(sbVertical+sbHandleKeyboard),
      VerReport^.Count*80));
    TTY^.HideCursor;
    Insert(TTY);
    HelpCtx:=hcWindow;
  end;
  AssignDevice(TextDevice, TTY);
  Rewrite(TextDevice);
  VerReport^.ForEach(@Print);
  Close(TextDevice);
  Dispose(VerReport, Done);
  Application^.InsertWindow(Window);
END;

PROCEDURE TDesigner.PrintVersion;
Var
  fe: byte;
  VerReport: PCollection;

procedure Print (What: PString); far;
BEGIN
  writeln(Dest, What^);
END;

BEGIN
  if PVersion(VersionID)^.DQSize <> DataSize+QualitySize then
  begin
    MessageBox('Результат не принадлежит текущему конструктору',nil,
      mfError+mfOkButton);
    Exit;
  end;
  VersionID^.GetData(DataEntryPoint^);
  fe:=0;
  MakeVersion(fe);
  VerReport:=New(PTextCollection, Init(30,10));
  MakeVersionStrings(VerReport);
  VerReport^.ForEach(@Print);
  Dispose(VerReport, Done);
END;

PROCEDURE TDesigner.PlotVersion;
Var
  fe: byte;

BEGIN
  if PVersion(VersionID)^.DQSize <> DataSize+QualitySize then
  begin
    MessageBox('Результат не принадлежит текущему конструктору',nil,
      mfError+mfOkButton);
    Exit;
  end;
  VersionID^.GetData(DataEntryPoint^);
  fe:=0;
  MakeVersion(fe);
END;

PROCEDURE TDesigner.MakeVersionStrings;
BEGIN
END;

PROCEDURE TDesigner.ReOrder;

procedure Sort(l, r: Integer);
var
  i, j: Integer;
  x, p: Pointer;
begin
  repeat
    i := l; j := r;
    x := KeyOf(Items^[(l + r) div 2]);
    repeat
      while Compare(KeyOf(Items^[i]), x) = -1 do Inc(i);
      while Compare(x, KeyOf(Items^[j])) = -1 do Dec(j);
      if i <= j then
      begin
	if i < j then
	begin
	  p := Items^[i];
	  Items^[i] := Items^[j];
	  Items^[j] := p;
	end;
	Inc(i); Dec(j);
      end;
    until i > j;
    if l < j then Sort(l, j);
    l := i;
  until l >= r;
end;

begin
  if Count > 1 then Sort(0, Count - 1);
end;

PROCEDURE TDesigner.DataFromVersion;
BEGIN
  Move(At(VersionID)^,DataEntryPoint^,DataSize+QualitySize);
END;

FUNCTION TDesigner.DataEntryPoint;
BEGIN
END;

FUNCTION TDesigner.DataSize;
BEGIN
  DataSize:=Ofs(QualityEntryPoint^)-Ofs(DataEntryPoint^);
END;

FUNCTION TDesigner.QualityEntryPoint;
BEGIN
END;

FUNCTION TDesigner.QualitySize;
BEGIN
  QualitySize:=QualityNumber*SizeOf(float);
END;

FUNCTION TDesigner.QualityNumber;
BEGIN
END;

FUNCTION TDesigner.Compare;

FUNCTION QStatus(QualityData: Pointer): single;
Var
  QC: byte;
  QOffset: word;
  QS: single;
  Poor: single;

BEGIN
  QS:=0;
  QOffset:=Ofs(QualityData^)+DataSize-SizeOf(float);
  for QC:=0 to QualityNumber-1 do
  begin
    Inc(QOffset, SizeOf(float));
    if QualityList^[QC].Minimize then
      Poor:=QualityList^[QC].MaxLimit
    else
      Poor:=QualityList^[QC].MinLimit;
    if QualityList^[QC].MaxLimit-QualityList^[QC].MinLimit = 0 then
      Continue;
    QS:=QS+QualityList^[QC].Value*
      Sqr(float(Ptr(Seg(QualityData^),QOffset)^)-Poor)/
      Sqr(QualityList^[QC].MaxLimit-QualityList^[QC].MinLimit);
  end;
  QStatus:=QS;
END;

BEGIN
  if QStatus(Key1) < QStatus(Key2) then
    Compare:=-1
  else if QStatus(Key1) > QStatus(Key2) then
    Compare:=1
  else
    Compare:=0;
END;

PROCEDURE TDesigner.FreeItem;
BEGIN
  FreeMem(Item, DataSize+QualitySize);
END;

FUNCTION TDesigner.DataFromScreen;
Var
  Item: word;
  DataList: PCollection;
  Dialog: PDialog;
  Ctrl: word;

BEGIN
  Item:=0;
  repeat
    Dialog:=PDialog(RezFile.Get('Ввод данных'));
    DataList:=New(PTextCollection, Init(10, 5));
    MakeDataStrings(DataList);
    Ctrl:=Application^.ExecuteDialog(Dialog, @DataList);
    if Ctrl = cmChangeItem then
      ChangeDataItem(Item);
  until (Ctrl = cmCancel) or (Ctrl = cmOk);
  Dispose(DataList, Done);
  DataFromScreen:=Ctrl;
END;

FUNCTION TDesigner.QualityFromScreen;
Var
  Item: word;
  DataList: PCollection;
  Dialog: PDialog;
  Ctrl: word;

BEGIN
  Item:=0;
  repeat
    Dialog:=PDialog(RezFile.Get('Ввод критериев качества'));
    DataList:=New(PTextCollection, Init(10, 5));
    MakeQualityStrings(DataList);
    Ctrl:=Application^.ExecuteDialog(Dialog, @DataList);
    if Ctrl = cmChangeItem then
      ChangeQualityItem(Item);
    DisplayStatus;
  until (Ctrl = cmCancel) or (Ctrl = cmOk);
  Dispose(DataList, Done);
  if Ctrl = cmOk then
    ReOrder;
  QualityFromScreen:=Ctrl;
END;

{TVersion}
CONSTRUCTOR TVersion.Init;
BEGIN
  inherited Init(ATitle);
  GetMem(DataQuality, ADataSize);
  DQSize:=ADataSize;
END;

CONSTRUCTOR TVersion.Load;
BEGIN
  inherited Load(S);
  S.Read(DQSize, SizeOf(DQSize));
  S.Read(DataQuality^, DQSize);
END;

PROCEDURE TVersion.Store;
BEGIN
  inherited Store(S);
  S.Write(DQSize, SizeOf(DQSize));
  S.Write(DataQuality^, DQSize);
END;

DESTRUCTOR TVersion.Done;
BEGIN
  inherited Done;
  FreeMem(DataQuality, DQSize);
END;

PROCEDURE TVersion.GetData;
BEGIN
  Move(DataQuality^, R, DQSize);
END;

PROCEDURE TVersion.SetData;
BEGIN
  Move(R, DataQuality^, DQSize);
END;
END.