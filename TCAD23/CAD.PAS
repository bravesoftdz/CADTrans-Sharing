{$N+,O+,X+,E+,I-}
{$M 16384,50000,655360}
Uses
  Objects, App, Drivers, Menus, Dialogs, MsgBox, Views, StdDlg, DOS,
{$IFDEF MSDOS}
  Overlay,
{$ENDIF}
  HelpFile, obRead, Designers, Common,
  FlatStrapTransmission,
  FilmStrapTransmission,
  WedgeStrapTransmission,
  NarrowWedgeStrapTransmission,
  PolyWedgeStrapTransmission,
  CogStrapTransmission,
  RollChainTransmission,
  CogChainTransmission,
  CogWheelTransmission,
  ConeCogWheelTransmission,
  WormWheelTransmission;

{$IFDEF MSDOS}
{$O FlatStrapTransmission}
{$O FilmStrapTransmission}
{$O WedgeStrapTransmission}
{$O NarrowWedgeStrapTransmission}
{$O PolyWedgeStrapTransmission}
{$O CogStrapTransmission}
{$O RollChainTransmission}
{$O CogChainTransmission}
{$O CogWheelTransmission}
{$O ConeCogWheelTransmission}
{$O WormWheelTransmission}
{$O CalConeWheel}
{$O Calculate}
{$ENDIF}

Type
  PHCStatusLine = ^THCStatusLine;
  THCStatusLine = object(TStatusLine)
    function Hint(AHelpCtx: Word): String; virtual;
  end;

  PDNameView = ^TDNameView;
  TDNameView = object(TView)
    procedure Draw; virtual;
  end;

  PCAD = ^TCAD;
  TCAD = object(TApplication)
    Designer: PDesigner;
    NameView: PView;

    constructor Init;
    destructor Done; virtual;
    procedure InitMenuBar; virtual;
    procedure InitStatusLine; virtual;
    procedure HandleEvent(var Event: TEvent); virtual;
    procedure OutOfMemory; virtual;
    procedure WriteShellMsg; virtual;
    function  GetPalette: PPalette; virtual;
    procedure InputDesignType;
    procedure SaveDesigner;
    procedure SaveAsDesigner;
    procedure LoadDesigner;
    procedure UpdateProjectMode;
    procedure TogleVideo;
    procedure Calculate;
    procedure SaveVersion;
    procedure PrintVersion;
    procedure About;
    procedure GetEvent (var Event:TEvent); virtual;
    procedure DisplayHelp(Context: word);
    procedure Plot;
    procedure InitScreen; virtual;
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
  HandleSystemError:=IOResult;
  TestRetry:=MessageBox(MsgString, @Params, BoxOptions);
  if TestRetry = cmYes then
    HandleSystemError:=0
  else
    HandleSystemError:=1;
END;

Var
  HintStrings: PStringList;

FUNCTION THCStatusLine.Hint;
BEGIN
  Hint:=HintStrings^.Get(AHelpCtx);
END;

PROCEDURE TDNameView.Draw;
Var
  B: TDrawBuffer;
  C: Byte;
  DName:string[24];

Const
  PDName: PString = @DesignerName;
BEGIN
  FormatStr(DName, '│ %13s │',PDName);
  C:=GetColor(4);
  MoveChar(B, ' ', C, Size.X);
  MoveStr(B, DName, C);
  WriteLine(0, 0, Size.X, 1, B);
END;

CONSTRUCTOR TCAD.Init;
Var
  R: TRect;

BEGIN
  inherited Init;
  SysErrorFunc:=HandleSystemError;
  DisableCommands([cmPrint, cmReport, cmPlot, cmSave, cmShowAll,
    cmShowBest, cmSaveAs, cmCalculate, cmInfo, cmInputData,
    cmInputQuality]);
  Designer:=nil;
  UpdateProjectMode;
  ExecuteDialog(PDialog(RezFile.Get('Заставка')),nil);
  R.Assign(63, 0, 80, 1);
  NameView:=New(PDNameView, Init(R));
  Insert(NameView);
  HelpCtx:=hcEmptyScreen;
END;

PROCEDURE TCAD.InitMenuBar;
BEGIN
  MenuBar:=PMenuBar(RezFile.Get('Меню программы'));
  MenuBar^.Menu^.Items^.Next^.Next^.Next^.
    SubMenu^.Items^.Param:=@ProjectModeStr;
END;

PROCEDURE TCAD.InitStatusLine;
Var
  R: TRect;
BEGIN
  GetExtent(R);
  R.A.Y:=R.B.Y-1;
  StatusLine:=New(PHCStatusLine, Init(R,
    NewStatusDef(hcEmptyScreen, hcEmptyScreen,
      NewStatusKey('~F1~ Помощь', kbF1, cmHelp,
      NewStatusKey('~F9~ Конструктор', kbF9, cmNew,
      NewStatusKey('~Ctrl+F3~ Данные', kbCtrlF3, cmInputData,
      NewStatusKey('~Ctrl+F9~ Расчет', kbCtrlF9, cmCalculate,
      NewStatusKey('~Alt+F9~ Результаты', kbAltF9, cmShowAll,
      NewStatusKey('', kbF10, cmMenu,
      nil)))))),
    NewStatusDef(hcDragging, hcDragging,
      NewStatusKey('~'#24#25#26#27'~ Место', kbNoKey, 0,
      NewStatusKey('~Shift+'#24#25#26#27'~ Размер', kbNoKey, 0,
      NewStatusKey('~'#17'─┘~ Принять', kbNoKey, 0,
      NewStatusKey('~Esc~ Отказ', kbNoKey, 0,
      nil)))),
    NewStatusDef(hcNoContext, hcNoContext,
      nil,
    NewStatusDef(2000, 3000,
      nil,
    NewStatusDef(hcWindow, hcWindow,
      NewStatusKey('~F1~ Помощь', kbF1, cmHelp,
      NewStatusKey('~F2~ Сохранить', kbF2, cmSave,
      NewStatusKey('~Alt+P~ Печать', kbAltP, cmPrint,
      NewStatusKey('~F5~ Масштаб', kbF5, cmZoom,
      NewStatusKey('~F6~ Следующее', kbF6, cmNext,
      NewStatusKey('~Alt+F3~ Убрать', kbAltF3, cmClose,
      NewStatusKey('', kbF10, cmMenu,
      NewStatusKey('',kbCtrlF5, cmResize,
      nil)))))))),
    NewStatusDef(1100, 2000,
      NewStatusKey('~F1~ Помощь', kbF1, cmHelp,
      nil),
    NewStatusDef(3000, 4000,
      NewStatusKey('~F1~ Помощь', kbF1, cmHelp,
      NewStatusKey('', kbCtrlF5, cmResize,
      nil)),
    NewStatusDef(4000, $FFFF,
      NewStatusKey('~F1~ Помощь', kbF1, cmHelp,
      nil),
    nil))))))))
  ));
END;

PROCEDURE TCAD.HandleEvent (var Event: TEvent);
Var
  OldCommands, NewCommands: TCommandSet;

BEGIN
  inherited HandleEvent(Event);
  if (Event.What = evBroadcast) and
    (Event.Command = cmCommandSetChanged) then
  begin
    GetCommands(OldCommands);
    if CommandEnabled(cmZoom) then
      EnableCommands([cmPrint, cmReport, cmPlot])
    else
      DisableCommands([cmPrint, cmReport, cmPlot]);
    GetCommands(NewCommands);
    if NewCommands <> OldCommands then
    begin
      PutEvent(Event);
      ClearEvent(Event);
    end;
  end;
  if Event.What = evCommand then
  begin
    case Event.Command of
      cmNew: InputDesignType;
      cmInputData: Designer^.DataFromScreen;
      cmCalculate: Calculate;
      cmInputQuality: Designer^.QualityFromScreen;
      cmShowAll: Designer^.ShowVersions;
      cmInfo: Designer^.DisplayStatus;
      cmShowBest: Designer^.ShowVersion(Designer^.Count-1);
      cmSave: SaveDesigner;
      cmSaveAs: SaveAsDesigner;
      cmOpen: LoadDesigner;
      cmMode:
      begin
        ProjectMode:=not ProjectMode;
        UpdateProjectMode;
      end;
      cmVideo: TogleVideo;
      cmReport: SaveVersion;
      cmPrint: PrintVersion;
      cmAbout: About;
      cmFeatures: DisplayHelp(hcFeatures);
      cmPerform : DisplayHelp(hcPerform);
      cmDataHelp: DisplayHelp(hcDataHelp);
      cmOptimize: DisplayHelp(hcOptimize);
      cmSelect  : DisplayHelp(hcSelect);
      cmBook    : DisplayHelp(hcBook);
      cmPlot    : Plot;
    else
      Exit;
    end;
    ClearEvent(Event);
  end;
END;

PROCEDURE TCAD.OutOfMemory;
BEGIN
  MessageBox(#3+'Недостаточно памяти для выполнения операции!'+
                #13+#3+'Выхожу в ДОС...', nil,
                mfWarning+mfOkButton);
  Halt(1);
END;

PROCEDURE TCAD.WriteShellMsg;
BEGIN
  PrintStr('Наберите EXIT для возврата...');
END;

DESTRUCTOR TCAD.Done;
BEGIN
  MenuBar^.Menu^.Items^.Next^.Next^.Next^.
    SubMenu^.Items^.Param:=nil;
  if Designer <> nil then
    Dispose(Designer,Done);
  inherited Done;
END;

FUNCTION TCAD.GetPalette;
const
  CNewColor = CAppColor + CHelpColor;
  CNewBlackWhite = CAppBlackWhite + CHelpBlackWhite;
  CNewMonochrome = CAppMonochrome + CHelpMonochrome;
  P: array[apColor..apMonochrome] of string[Length(CNewColor)] =
    (CNewColor, CNewBlackWhite, CNewMonochrome);
begin
  GetPalette := @P[AppPalette];
end;

PROCEDURE TCAD.InputDesignType;
Var
  Dialog: PDialog;
  Event: TEvent;

Const
  DD: record
    DesignerType: word;
    TempName: string[20];
  end = (DesignerType:0;TempName:'');

BEGIN
  Dialog:=PDialog(RezFile.Get('Ввод типа конструктора'));
  if ExecuteDialog(Dialog, @DD) = cmOk then
  begin
    if Designer <> nil then
      Dispose(Designer, Done);
    Designer:=PDesigner(RezFile.Get(
      HintStrings^.Get(hcFlatStrap+DD.DesignerType)));
    DesignerName:=DD.TempName;
    EnableCommands([cmCalculate, cmInputData, cmSave, cmSaveAs]);
    DisableCommands([cmInfo, cmInputQuality, cmShowAll, cmShowBest]);
    NameView^.DrawView;
  end;
END;

PROCEDURE TCAD.SaveAsDesigner;
Var
  Dialog: PDialog;
  Stream: PStream;

BEGIN
  Dialog:=PDialog(RezFile.Get('Сохранение конструктора'));
  if ExecuteDialog(Dialog, @DesignerFile) <> cmCancel then
    SaveDesigner;
END;

PROCEDURE TCAD.SaveDesigner;
Var
  Dialog: PDialog;
  Stream: PStream;

BEGIN
  if DesignerFile = '' then
    SaveAsDesigner
  else begin
    HelpCtx:=hcSaveProcess;
    Idle;
    Stream:=New(PBufStream, Init(DesignerFile, stCreate, 1024));
    Stream^.Write(DesignerName, SizeOf(DesignerName));
    Stream^.Put(Designer);
    if Stream^.Status <> stOk then
      MessageBox(HintStrings^.Get(hcWriteError),@DesFilePtr,
      mfError+mfOkButton);
    Dispose(Stream, Done);
    HelpCtx:=hcEmptyScreen;
  end;
END;

PROCEDURE TCAD.LoadDesigner;
Var
  Dialog: PDialog;
  Stream: PStream;
  Temp: PDesigner;

BEGIN
  Dialog:=PDialog(RezFile.Get('Загрузка конструктора'));
  if ExecuteDialog(Dialog, @DesignerFile) <> cmCancel then
  begin
    HelpCtx:=hcLoadProcess;
    Idle;
    Stream:=New(PBufStream, Init(DesignerFile, stOpenRead, 1024));
    Stream^.Read(DesignerName, SizeOf(DesignerName));
    Temp:=PDesigner(Stream^.Get);
    if Stream^.Status = stOk then
    begin
      EnableCommands([cmCalculate, cmInputData, cmSave, cmSaveAs]);
      DisableCommands([cmInfo, cmInputQuality, cmShowAll, cmShowBest]);
      if Designer <> nil then
        Dispose(Designer, Done);
      Designer:=Temp;
    end
    else begin
      MessageBox(HintStrings^.Get(hcReadError),@DesFilePtr,
        mfError+mfOkButton);
      DisableCommands([cmPrint, cmReport, cmPlot, cmSave, cmShowAll,
        cmShowBest, cmSaveAs, cmCalculate, cmInfo, cmInputData,
        cmInputQuality]);
    end;
    Dispose(Stream, Done);
    HelpCtx:=hcEmptyScreen;
    NameView^.DrawView;
  end;
END;

PROCEDURE TCAD.UpdateProjectMode;
BEGIN
  if ProjectMode then
    ProjectModeStr:='Непрерывный'
  else
    ProjectModeStr:='Дискретный'
END;

PROCEDURE TCAD.TogleVideo;
BEGIN
  if (ScreenMode and smFont8x8) = smFont8x8 then
    SetScreenMode(ScreenMode and not smFont8x8)
  else
    SetScreenMode(ScreenMode or smFont8x8)
END;

PROCEDURE TCAD.Calculate;
BEGIN
  if ProjectMode and (Designer^.DataFromScreen = cmCancel) then
    Exit;
  HelpCtx:=hcCalcProcess;
  Idle;
{$IFNDEF Debug}
{----------------
  if EMSAcess and BadCopy = BadCopy then
    Exit;
    __________________}
{$ENDIF}
  Designer^.MakeVersions;
  HelpCtx:=hcEmptyScreen;
  if Designer^.Count = 0 then
    Exit;
  EnableCommands([cmInputQuality, cmInfo, cmShowAll, cmShowBest]);
  DisableCommands([cmCalculate, cmInputData]);
  if ProjectMode and (Designer^.QualityFromScreen = cmOk) then
    Designer^.ShowVersions;
END;

PROCEDURE TCAD.SaveVersion;
Var
  Dialog: PDialog;
  DestFile: text;
  ResName: ^FNameStr;

BEGIN
  New(ResName);
  ResName^:='';
  Dialog:=PDialog(RezFile.Get('Запись результата'));
  if ExecuteDialog(Dialog, ResName) = cmCancel then
    Exit;
  Assign(DestFile, ResName^);
  HelpCtx:=hcSaveProcess;
  Idle;
  Rewrite(DestFile);
  writeln(DestFile, PVersion(DeskTop^.Current)^.Title^);
  Designer^.PrintVersion(DeskTop^.Current, DestFile);
  Close(DestFile);
  if IOResult <> 0 then
    MessageBox(HintStrings^.Get(hcWriteError),@ResName,mfError+mfOkButton);
  HelpCtx:=hcEmptyScreen;
  Dispose(ResName);
END;

PROCEDURE TCAD.PrintVersion;
Var
  DestFile: text;
  VersTitle: PString;

BEGIN
  HelpCtx:=hcPrintProcess;
  Idle;
  VersTitle:=PVersion(DeskTop^.Current)^.Title;
  Assign(DestFile, 'prn');
  Rewrite(DestFile);
  writeln(DestFile, VersTitle^);
  Designer^.PrintVersion(DeskTop^.Current, DestFile);
  Close(DestFile);
  if IOResult <> 0 then
    MessageBox(HintStrings^.Get(hcPrintError),@VersTitle,mfError+mfOkButton);
  HelpCtx:=hcEmptyScreen;
END;

PROCEDURE TCAD.About;
Var
  Dialog: PDialog;

BEGIN
  Dialog:=PDialog(RezFile.Get('Авторы'));
  ExecuteDialog(Dialog,nil);
END;

PROCEDURE TCAD.GetEvent;
begin
  TApplication.GetEvent(Event);
  if (Event.What=evCommand) and (Event.Command = cmHelp) then
  begin
    DisplayHelp(GetHelpCtx);
    ClearEvent(Event);
  end;
end;

PROCEDURE TCAD.DisplayHelp;
Var
  W: PWindow;

begin
  W := New(PHelpWindow,Init(HFile, Context));
  W^.HelpCtx:=hcWindow;
  if ValidView(W) <> nil then
  begin
    ExecView(W);
    Dispose(W, Done);
  end;
end;

PROCEDURE TCAD.Plot;
Var
  DATFile: text;
Const
  DATName: FNameStr = '';
begin
  if ExecuteDialog(PDialog(RezFile.Get('Передача данных')),@DATName)
    <> cmCancel then
  begin
    Assign(DATFile,DATName);
    Rewrite(DATFile);
    Designer^.PlotVersion(DeskTop^.Current,DATFile);
    Close(DATFile);
    if IOResult <> 0 then
      MessageBox(HintStrings^.Get(hcWriteError),@DATFile,mfError+mfOkButton);
  end;
end;

PROCEDURE TCAD.InitScreen;

PROCEDURE SetVideoFont;
Var
  CharTable: pointer;
  CharTableFile: file;
  TableSize: longint;
  CharHeight: byte;
  FontFile: FNameStr;

BEGIN
  CharHeight:=Mem[$40:$85];
  FontFile:=PathToProgram+'\CALC\';
  case CharHeight of
    8 : FontFile:=FontFile+fn_8x8;
    14: FontFile:=FontFile+fn_EGA;
    16: FontFile:=FontFile+fn_VGA;
  end;
  Assign(CharTableFile,FontFile);
  Reset(CharTableFile,1);
  TableSize:=FileSize(CharTableFile);
  if (IOResult <> 0) or (TableSize <> CharHeight*256) then
    Exit;
  GetMem(CharTable,TableSize);
  BlockRead(CharTableFile,CharTable^,TableSize);
  Close(CharTableFile);
  asm
              PUSHA
              MOV   AX,$1103
              SUB   BX,BX
              INT   $10
              MOV   CX,$FF
              SUB   DX,DX
              MOV   BH,CharHeight
              SUB   AX,AX
              MOV   AH,$11
              LES   BP,[CharTable]
              INT   $10
              POPA
  end;
  FreeMem(CharTable,TableSize);
END;

BEGIN
  inherited InitScreen;
  SetVideoFont;
END;

PROCEDURE InitOvrManager;
BEGIN
{$IFDEF MSDOS}
{$IFDEF Debug}
  OvrInit('CAD.ovr');
{$ELSE}
  OvrInit(ParamStr(0));
{$ENDIF}
  if OvrResult <> ovrOk then
  begin
    Writeln('Overlay manager initialization failed.');
    Halt(1);
  end;
  if EMSAcess and useEMS = useEMS then
  begin
    OvrInitEMS;
    case OvrResult of
      ovrIOError: Writeln('Overlay file I/O error.');
      ovrNoEMSDriver: Writeln('EMS driver not installed.');
      ovrNoEMSMemory: Writeln('Not enough EMS memory.');
    else
      writeln('Using EMS for faster overlay swapping.');
    end;
  end;
{$ENDIF}
END;

PROCEDURE CheckEnv;

Var
  CFGFile: file;
  ChS: longint;

Const
{$I credits.inc}

BEGIN
  Assign(CFGFile,'tcad.cfg');
  Reset(CFGFile,1);
  BlockRead(CFGFile,EMSAcess,2);
  BlockRead(CFGFile,ChS,4);
  BlockRead(CFGFile,PathToProgram,1);
  BlockRead(CFGFile,PathToProgram[1],ord(PathToProgram[0]));

{$IFDEF Debug}
  PathToProgram:='F:\TCAD';
{$ENDIF}

  Close(CFGFile);
  if ChS <> DiskSize(0) then
    EMSAcess:=EMSAcess or BadCopy;
  if (ParamCount > 0) and (ParamStr(1) = '/ver') then
  begin
    writeln('CADTRANS V2.3 (R) CoLoR - ',Serial);
    Halt(1);
  end;
END;

Var
  CAD: TCAD;

BEGIN
  InitOvrManager;
  RegisterMenus;
  RegisterDialogs;
  RegisterViews;
  RegisterObRead;
  RegisterStdDlg;
  RegisterHelpFile;
  RegisterType(RStringList);
  RegisterType(RDesigner);
  RegisterType(RFlatStrapTransCAD);
  RegisterType(RFilmStrapTransCAD);
  RegisterType(RWedgeStrapTransCAD);
  RegisterType(RNarrowWedgeStrapTransCAD);
  RegisterType(RPolyWedgeStrapTransCAD);
  RegisterType(RCogStrapTransCAD);
  RegisterType(RRollChainTransCAD);
  RegisterType(RCogChainTransCAD);
  RegisterType(RCogWheelTransCAD);
  RegisterType(RConeCogWheelTransCAD);
  RegisterType(RWormWheelTransCAD);
  CheckEnv;
  InitResource;
  InitHelp;
  HintStrings:=PStringList(RezFile.Get('Глобальный контекст'));
  CAD.Init;
  CAD.Run;
  CAD.Done;
  RezFile.Done;
  Dispose(HFile,Done);
END.