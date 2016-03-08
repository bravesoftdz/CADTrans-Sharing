{$A+,B-,D-,E-,F-,G+,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V-,X+,Y-}
{$M 16384,20000,655360}
Uses
  Objects, Menus, Views, Dialogs, App, Drivers, DOS, MsgBox;

Const
  MaxInstall = 3;

Type
  PTitle = ^TTitle;
  TTitle = object(TView)
    procedure Draw; virtual;
  end;

  PUCLine = ^TUCLine;
  TUCLine = object(TInputLine)
    procedure HandleEvent(var Event:TEvent); virtual;
  end;

  PGround = ^TGround;
  TGround = object(TView)
    procedure Draw; virtual;
  end;

  PConfigDialog = ^TConfigDialog;
  TConfigDialog = object(TDialog)
    constructor Init;
  end;

  PInstall = ^TInstall;
  TInstall = object(TApplication)
    constructor Init;
    procedure InitStatusLine; virtual;
    procedure Run; virtual;
    function  CheckConfig: boolean;
  end;

FUNCTION HandleSystemError (ErrorCode: integer; Drive: byte): integer; far;
{--------------------------------------------------------------------------}
{- Функция обработки системных ошибок                                     -}
{- Входные данные:                                                        -}
{- ErrorCode - код ошибки                                                 -}
{- Drive - номер устройства (0-A, 1-B, и т.д.)                            -}
{- Возвращаемое значение 0-повторять, 1-не повторять                      -}
{--------------------------------------------------------------------------}
Const
  BoxOptions: word = mfError+mfYesButton+mfNoButton;
  MsgString = #3' %s %c.'#13#13#3'Повторить?';

  ErrorMessage: array [0..15] of string[35] = (
  'Защита от записи диска',
  'Критическая ошибка диска',
  'Нет готовности диска',
  'Критическая ошибка диска',
  'Ошибка интеграции данных диска',
  'Критическая ошибка диска',
  'Ошибка поиска на диске',
  'Неизвестный формат диска',
  'Сектор не найден на диске',
  'В принтере нет бумаги',
  'Ошибка вывода на диск',
  'Ошибка чтения диска',
  'Аппаратный сбой диска',
  'Плохая FAT',
  'Ошибка доступа к устройству',
  'Вставте диск в дисковод');

Var
  TestRetry: word;
  DriveLetter: char;
  Params: array [0..1] of LongInt;

BEGIN
  Params[0]:=LongInt(@ErrorMessage[ErrorCode]);
  if ErrorCode in [0..12, 15] then
    DriveLetter:=chr(ord('A')+Drive)
  else
    DriveLetter:=' ';
  Params[1]:=LongInt(ord(DriveLetter));
  TestRetry:=MessageBox(MsgString, @Params, BoxOptions);
  if TestRetry = cmYes then
    HandleSystemError:=0
  else
    HandleSystemError:=1;
END;

Const
  BadCopy = $0004;
  useACAD = $0002;
  useEMS  = $0001;

Var
  InstallPath: DirStr;
  UserPath: DirStr;
  Apple: word;

PROCEDURE TTitle.Draw;
Var
  B: TDrawBuffer;
  C: Byte;

Const
  DName = '▌ CADTRANS | Утилита установки и конфигурации ▐';

BEGIN
  C:=GetColor(7);
  MoveChar(B, ' ', C, Size.X);
  MoveStr(B, DName, C);
  WriteLine(0, 0, Size.X, 1, B);
END;

PROCEDURE TUCLine.HandleEvent;
BEGIN
  if (Event.What = evKeyDown) and (Event.CharCode in ['a'..'z']) then
    Event.CharCode:=UpCase(Event.CharCode);
  inherited HandleEvent(Event);
END;

PROCEDURE TGround.Draw;
Var
  B: TDrawBuffer;
  C: Byte;

Const
  DName =
'CADTRANSCADTRANSCADTRANSCADTRANSCADTRANSCADTRANSCADTRANSCADTRANSCADTRANSCADTRANS';

BEGIN
  C:=GetColor(11);
  MoveChar(B, ' ', C, Size.X);
  MoveStr(B, DName, C);
  WriteLine(0, 0, Size.X, Size.Y, B);
END;

CONSTRUCTOR TConfigDialog.Init;
Var
  R: TRect;
  Bruce: PView;
BEGIN
  R.Assign(1,1,50,15);
  inherited Init(R, 'Конфигурация системы');
  Options:=Options or ofCentered;

  R.Assign(1,3,Size.X-1,4);
  Bruce:=New(PUCLine, Init(R,SizeOf(InstallPath)-1));
  Insert(Bruce);
  R.Move(0,-1);
  Insert(New(PLabel,Init(R,'Каталог для установки CADTRANS',Bruce)));
  R.Move(0,4);
  Bruce:=New(PUCLine, Init(R,SizeOf(UserPath)-1));
  Insert(Bruce);
  R.Move(0,-1);
  Insert(New(PLabel,Init(R,'Пользовательский каталог',Bruce)));

  R.Assign(1,8,Size.X-1,10);
  Bruce:=New(PCheckBoxes, Init(R,
    NewSItem('Использовать расширенную (EMS) память',
    NewSItem('Использовать систему AutoCAD',
    nil))
  ));
  Insert(Bruce);

  R.Assign(Size.X-15,Size.Y-3,Size.X-3,Size.Y-1);
  Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
  Insert(Bruce);
  R.Move(-15,0);
  Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
  Insert(Bruce);
  SelectNext(False);
END;

CONSTRUCTOR TInstall.Init;
Var
  R: TRect;
  Title: PView;
BEGIN
  inherited Init;
  SysErrorFunc:=HandleSystemError;
  DeskTop^.GetExtent(R);
  Title:=New(PGround, Init(R));
  DeskTop^.Insert(Title);
  R.Assign(0,0,47,1);
  Title:=New(PTitle,Init(R));
  Title^.Options:=Title^.Options or ofCenterX;
  Insert(Title);
  InstallPath:='E:\TCAD';
  UserPath:='E:\TCAD\USER';
  Apple:=useEMS+useACAD;
END;

PROCEDURE TInstall.InitStatusLine;
Var
  R: TRect;
  Status: PStatusLine;
BEGIN
  GetExtent(R);
  R.A.Y:=R.B.Y+1;
  StatusLine:=New(PStatusLine, Init(R,
    NewStatusDef(0, $FFFF, nil, nil)));
END;

PROCEDURE TInstall.Run;
Var
  Dialog: PDialog;
BEGIN
  repeat
    Dialog:=New(PConfigDialog, Init);
  until (ExecuteDialog(Dialog,@InstallPath)=cmCancel) or CheckConfig;
END;

FUNCTION TInstall.CheckConfig;
FUNCTION ExistDir (const SDir: DirStr): boolean;
Var
  TempDir: DirStr;
BEGIN
  GetDir(0,TempDir);
  ChDir(SDir);
  if IOResult = 0 then
    ExistDir:=True
  else
    ExistDir:=False;
  ChDir(TempDir);
END;

FUNCTION MakeDir (const NewDir:DirStr): byte;
Var
  TempDir: DirStr;
  ECount: byte;
BEGIN
  GetDir(0,TempDir);
  MkDir(NewDir);
  MakeDir:=IOResult;
  ChDir(TempDir);
END;

PROCEDURE DelDir (var DDir:DirStr);
Var
  TempDir: DirStr;

PROCEDURE DeleteAll;
Var
  DF: file;
  DFRec: SearchRec;
BEGIN
  FindFirst('*.*',AnyFile,DFRec);
  while DosError = 0 do
  begin
    if (DFRec.Attr = Directory) and (DFRec.Name[1] <> '.') then
    begin
      ChDir(DFRec.Name);
      DeleteAll;
      ChDir('..');
      RmDir(DFRec.Name);
    end
    else if (DFRec.Attr <> Directory) and (DFRec.Attr <> VolumeID) then
    begin
      Assign(DF,DFRec.Name);
      Erase(DF);
    end;
    FindNext(DFRec);
  end;
END;

BEGIN
  GetDir(0,TempDir);
  ChDir(DDir);
  DeleteAll;
  ChDir(TempDir);
END;

FUNCTION DisplayProcess(ProcessID: string): PDialog; far;
Var
  R: TRect;
  Info: PDialog;
BEGIN
  R.Assign(1,1,40,6);
  Info:=New(PDialog, Init(R,'Процесс...'));
  with Info^ do
  begin
    R.Assign(1,2,Size.X-1,3);
    Insert(New(PStaticText,Init(R,#3+ProcessID)));
    Options:=Options or ofCentered;
    Flags:=Flags and not wfClose;
  end;
  DisplayProcess:=Info;
END;

FUNCTION CopyCalc: boolean;
Var
  ProcessBox: PDialog;
  CopyStream: PStream;
  Source: PStream;
BEGIN
  CopyCalc:=True;
  MakeDir(InstallPath+'\CALC');
  CopyStream:=New(PBufStream, Init(InstallPath+'\CALC\tcad.exe',
    stCreate, 4096));
  ProcessBox:=DisplayProcess('Устанавливаю загрузчик...');
  InsertWindow(ProcessBox);
  Source:=New(PBufStream, Init('\DATA\cad.exe', stOpenRead, 4096));
  CopyStream^.CopyFrom(Source^,Source^.GetSize);
  Dispose(ProcessBox,Done);
  if (Source^.Status <> stOk) or (CopyStream^.Status <> stOk) then
  begin
    CopyCalc:=False;
    Exit;
  end;
  Dispose(Source, Done);
  ProcessBox:=DisplayProcess('Формирую оверлеи...');
  InsertWindow(ProcessBox);
  Source:=New(PBufStream, Init('\DATA\cad.ovr', stOpenRead, 4096));
  CopyStream^.CopyFrom(Source^,Source^.GetSize);
  Dispose(ProcessBox,Done);
  if (Source^.Status <> stOk) or (CopyStream^.Status <> stOk) then
  begin
    CopyCalc:=False;
    Exit;
  end;
  Dispose(Source, Done);
  ProcessBox:=DisplayProcess('Формирую ресурсы...');
  InsertWindow(ProcessBox);
  Source:=New(PBufStream, Init('\DATA\v23.res', stOpenRead, 4096));
  CopyStream^.CopyFrom(Source^,Source^.GetSize);
  Dispose(ProcessBox,Done);
  if (Source^.Status <> stOk) or (CopyStream^.Status <> stOk) then
  begin
    CopyCalc:=False;
    Exit;
  end;
  Dispose(Source, Done);
  Dispose(CopyStream, Done);
  CopyStream:=New(PBufStream, Init(InstallPath+'\CALC\tcad.hlp',
    stCreate, 4096));
  ProcessBox:=DisplayProcess('Устанавливаю систему помощи...');
  InsertWindow(ProcessBox);
  Source:=New(PBufStream, Init('\DATA\tcad.hlp', stOpenRead, 4096));
  CopyStream^.CopyFrom(Source^,Source^.GetSize);
  Dispose(ProcessBox,Done);
  if (Source^.Status <> stOk) or (CopyStream^.Status <> stOk) then
  begin
    CopyCalc:=False;
    Exit;
  end;
  Dispose(Source, Done);
  Dispose(CopyStream, Done);
END;

FUNCTION CopyDataBases: boolean;
Var
  ProcessBox: PDialog;
  DestStream: PStream;
  Source: PStream;
  SR: SearchRec;
  FName: PathStr;
BEGIN
  CopyDataBases:=True;
  MakeDir(InstallPath+'\DBF');
  ProcessBox:=DisplayProcess('Устанавливаю базы данных...');
  InsertWindow(ProcessBox);
  ChDir('DATA');
  FindFirst('*.dbf',Archive,SR);
  while DosError = 0 do
  begin
    FName:=FExpand(SR.Name);
    DestStream:=New(PBufStream, Init(InstallPath+'\DBF\'+SR.Name,
      stCreate, 4096));
    Source:=New(PBufStream, Init(FName, stOpenRead, 4096));
    DestStream^.CopyFrom(Source^,Source^.GetSize);
    if (Source^.Status <> stOk) or (DestStream^.Status <> stOk) then
    begin
      CopyDataBases:=False;
      Break;
    end;
    Dispose(Source, Done);
    Dispose(DestStream, Done);
    FindNext(SR);
  end;
  ChDir('..');
  Dispose(ProcessBox,Done);
END;

FUNCTION FindACAD: PathStr;
Var
  Status: PDialog;
  FindPath: PathStr;
  CD: char;
  Temp: DirStr;

PROCEDURE Find;
Type
  TSign = string[7];
Var
  DF: file;
  DFRec: SearchRec;
BEGIN
  FindFirst('*.*',AnyFile,DFRec);
  while (DosError = 0) and (FindPath = '') do
  begin
    if (DFRec.Attr = Directory) and (DFRec.Name[1] <> '.') then
    begin
      ChDir(DFRec.Name);
      Find;
      ChDir('..');
    end
    else if (DFRec.Attr = Archive) and
            (DFRec.Name = 'ACAD.EXE') and
            (DFRec.Size > 1800000) then
      FindPath:=FExpand(DFRec.Name);
    FindNext(DFRec);
  end;
END;
BEGIN
  GetDir(0,Temp);
  Status:=DisplayProcess('Поиск системы AutoCAD...');
  InsertWindow(Status);
  FindPath:='';
  for CD:='C' to 'Z' do
  begin
    ChDir(CD+':\');
    if IOResult = 0 then
      Find;
  end;
  FindACAD:=FindPath;
  Dispose(Status,Done);
  ChDir(Temp);
END;

FUNCTION WritingCFG: boolean;

FUNCTION CheckEnv: boolean;

function Sector (Drive, Head, Track, SSec, NSec: byte; var Buf;
                  Writing: byte): byte; near; assembler;
asm
  les BX, Buf
  mov DL, Drive
  mov DH, Head
  mov CH, Track
  mov CL, SSec
  mov AL, NSec
  mov AH, Writing
  int $13
  mov AH, Writing
  int $13
  mov AH, Writing
  int $13
END;

Const
  SectorSize = 512;
  RecSector = $3;
  ReadSector = $2;

Type
  TBPB = array [0..$18] of byte;

Var
  Buf: pointer;
  BPB: ^TBPB absolute Buf;
  SDrv: string[20];
  Drv: byte;

BEGIN
  CheckEnv:=True;
  GetDir(0, SDrv);
  Drv:=Ord(SDrv[1]);
  Dec(Drv,Ord('A'));
  GetMem(Buf, 2*SectorSize);
  Sector(Drv,0,0,1,1,Buf^,ReadSector);
  BPB^[$15]:=$FB;
  CheckEnv:=boolean(Sector(Drv,0,0,1,1,Buf^,RecSector));
  BPB^[$15]:=100;
  Sector(Drv,0,80,1,1,Buf^,ReadSector);
  if BPB^[$15] > MaxInstall-1 then
    CheckEnv:=False;
  Inc(BPB^[$15]);
  Sector(Drv,0,80,1,1,Buf^,RecSector);
  BPB^[$15]:=$F0;
  Sector(Drv,0,0,1,1,Buf^,RecSector);
  FreeMem(Buf, 2*SectorSize);
END;

Var
  ProcessBox: PDialog;
  ConfigFile: file;
  StartFile: text;
  ChS: longint;
  NewDir, TempDir: DirStr;

BEGIN
  WritingCFG:=True;
  ProcessBox:=DisplayProcess('Конфигурирую систему...');
  InsertWindow(ProcessBox);
  GetDir(0, TempDir);
  NewDir:=Copy(InstallPath,1,3);
  ChDir(NewDir);
  ChS:=DiskSize(0);
  ChDir(TempDir);
  {-----------------------------
  if not CheckEnv then
    Apple:=Apple+BadCopy;
   -----------------------------}
  Assign(ConfigFile,UserPath+'\tcad.cfg');
  Rewrite(ConfigFile,1);
  BlockWrite(ConfigFile,Apple,2);
  BlockWrite(ConfigFile,ChS,4);
  BlockWrite(ConfigFile,InstallPath,Length(InstallPath)+1);
  Close(ConfigFile);
  Assign(StartFile,UserPath+'\tcad.bat');
  Rewrite(StartFile);
  writeln(StartFile,'@ECHO OFF');
  writeln(StartFile,InstallPath+'\CALC\tcad.exe');
  Close(StartFile);
  Dispose(ProcessBox,Done);
  if IOResult <> 0 then
    WritingCFG:=False;
END;

FUNCTION CopyStartUp: boolean;
Var
  ProcessBox: PDialog;
  DestStream: PStream;
  Source: PStream;
  SR: SearchRec;
  FName: PathStr;
BEGIN
  CopyStartUp:=True;
  if Apple and useACAD <> useACAD then
    Exit;
  ProcessBox:=DisplayProcess('Создаю поддержку AutoCAD...');
  InsertWindow(ProcessBox);
  ChDir('SUPPORT');
  FindFirst('*.*',Archive,SR);
  while DosError = 0 do
    if SR.Attr = Archive then
    begin
      FName:=FExpand(SR.Name);
      DestStream:=New(PBufStream, Init(UserPath+'\'+SR.Name,
        stCreate, 4096));
      Source:=New(PBufStream, Init(FName, stOpenRead, 4096));
      DestStream^.CopyFrom(Source^,Source^.GetSize);
      if (Source^.Status <> stOk) or (DestStream^.Status <> stOk) then
      begin
        CopyStartUp:=False;
        Break;
      end;
      Dispose(Source, Done);
      Dispose(DestStream, Done);
      FindNext(SR);
    end;
  ChDir('..');
  Dispose(ProcessBox,Done);
END;

FUNCTION CopyDrawTools: boolean;
Var
  ProcessBox: PDialog;
  DestStream: PStream;
  Source: PStream;
  SR: SearchRec;
  FName: PathStr;
  DC: byte;
BEGIN
  CopyDrawTools:=True;
  if Apple and useACAD <> useACAD then
    Exit;
  MakeDir(InstallPath+'\SUPPORT');
  ProcessBox:=DisplayProcess('Формирую систему черчения...');
  InsertWindow(ProcessBox);
  ChDir('LSP');
  for DC:= 2 to 3 do
  begin
    FindFirst('*.*',Archive,SR);
    while DosError = 0 do
      if SR.Attr = Archive then
      begin
        FName:=FExpand(SR.Name);
        DestStream:=New(PBufStream, Init(InstallPath+'\SUPPORT\'+SR.Name,
          stCreate, 4096));
        Source:=New(PBufStream, Init(FName, stOpenRead, 4096));
        DestStream^.CopyFrom(Source^,Source^.GetSize);
        if (Source^.Status <> stOk) or (DestStream^.Status <> stOk) then
        begin
          CopyDrawTools:=False;
          Break;
        end;
        Dispose(Source, Done);
        Dispose(DestStream, Done);
        FindNext(SR);
      end;
    if DC = 2 then
      MessageBox(#3'Вставьте в дисковод диск 3...',nil,
        mfOkButton);
  end;
  ChDir('..');
  Dispose(ProcessBox,Done);
END;

FUNCTION MakeLoader: boolean;
Var
  ProcessBox: PDialog;
  StartFile: text;
  ACAD: PathStr;
  ACADDir: DirStr;
  ACADName: NameStr;
  ACADExt: ExtStr;
BEGIN
  MakeLoader:=True;
  ACAD:=FindACAD;
  if ACAD = '' then
  begin
    MessageBox('Не могу найти AutoCAD R11',nil,mfError+mfOkButton);
    MakeLoader:=False;
    Exit;
  end;
  ProcessBox:=DisplayProcess('Конфигурирую систему...');
  InsertWindow(ProcessBox);
  Assign(StartFile,UserPath+'\tcad.bat');
  Rewrite(StartFile);
  writeln(StartFile,'@ECHO OFF');
  writeln(StartFile,'SET ACAD='+InstallPath+'\SUPPORT;%ACAD%');
  FSplit(ACAD,ACADDir,ACADName,ACADExt);
  writeln(StartFile,'SET ACADCFG='+ACADDir);
  writeln(StartFile,'ECHO Загружаю AutoCAD...');
  writeln(StartFile,ACAD+' 111 tcad.scr');
  writeln(StartFile,'ECHO End CADTRANS');
  Close(StartFile);
  Dispose(ProcessBox,Done);
  if IOResult <> 0 then
    MakeLoader:=False;
END;

PROCEDURE AllDone;
BEGIN
  MessageBox(#3'Установка системы CADTRANS полностью закончена!'+
    #13#3'Введите "TCAD" для запуска системы.',nil,mfInformation+mfOkButton);
  ChDir(UserPath);
END;

PROCEDURE CheckEMS;
Var
  TS: PStream;
BEGIN
  TS:=New(PEMSStream, Init(200000,200000));
  if (TS^.Status <> stOk) and (TS^.ErrorInfo = $88) then
    MessageBox(#3'Нет достаточного количества EMS памяти!',nil,
      mfWarning+mfOkButton)
  else if (TS^.Status <> stOk) and (TS^.ErrorInfo = -1) then
    MessageBox(#3'Драйвер EMS памяти не загружен!',nil,
      mfWarning+mfOkButton);
  Dispose(TS,Done);
END;

FUNCTION CheckSpace: boolean;
Var
  Temp: DirStr;
BEGIN
  CheckSpace:=True;
  GetDir(0,Temp);
  ChDir(InstallPath);
  if ((DiskFree(0) < 2000000) and (Apple and useACAD = useACAD)) or
     ((DiskFree(0) < 800000) and (Apple and useACAD <> useACAD)) then
  begin
    MessageBox(#3'Недостаточно дисковой памяти для установки системы',nil,
      mfError+mfOkButton);
    CheckSpace:=False;
  end;
  ChDir(UserPath);
  if (DiskFree(0) < 500000) and (Apple and useACAD = useACAD) then
  begin
    MessageBox(#3'Недостаточно дисковой памяти для'+
                 ' создания поддержки AutoCAD',nil,
      mfError+mfOkButton);
    CheckSpace:=False;
  end;
  ChDir(Temp);
END;

BEGIN
{  ChDir('B:\');}
  CheckConfig:=False;
  CheckEMS;
  if ExistDir(InstallPath) then
  begin
    if MessageBox('Директория '+InstallPath+' уже существует!'+
      #13#3'Переписать?',nil,
      mfWarning+mfYesButton+mfNoButton) = cmYes then
    DelDir(InstallPath);
  end;
  if not ExistDir(InstallPath) and (MakeDir(InstallPath) <> 0) then
  begin
    MessageBox('Не могу создать директорию'#13#3+InstallPath,nil,
      mfError+mfOkButton);
    Exit;
  end;
  if MakeDir(UserPath) <> 0 then
  begin
    MessageBox('Не могу создать директорию'#13#3+UserPath,nil,
      mfError+mfOkButton);
    Exit;
  end;
  if not CopyCalc then
  begin
    MessageBox(#3'Не могу установить модуль расчета!',nil,
      mfError+mfOkButton);
    Exit;
  end;
  if not CopyDataBases then
  begin
    MessageBox(#3'Не могу установить базы данных!',nil,
      mfError+mfOkButton);
    Exit;
  end;
  if not WritingCFG then
  begin
    MessageBox(#3'Не могу сконфигурировать систему!',nil,
      mfError+mfOkButton);
    Exit;
  end;

  if Apple and useACAD <> useACAD then
  begin
    CheckConfig:=True;
    AllDone;
    Exit;
  end
  else
    MessageBox(#3'Вставьте в дисковод диск 2...',nil,
      mfOkButton);
  if not MakeLoader then
  begin
    MessageBox(#3'Не могу сделать загрузчик AutoCAD!',nil,
      mfError+mfOkButton);
    Exit;
  end;
  if not CopyStartUp then
  begin
    MessageBox(#3'Не могу установить поддержку AutoCAD!',nil,
      mfError+mfOkButton);
    Exit;
  end;
  if not CopyDrawTools then
  begin
    MessageBox(#3'Не могу установить систему черчения!',nil,
      mfError+mfOkButton);
    Exit;
  end;
  CheckConfig:=True;
  AllDone;
END;

Var
  Install : TInstall;

Begin
  Install.Init;
  Install.Run;
  Install.Done;
End.
