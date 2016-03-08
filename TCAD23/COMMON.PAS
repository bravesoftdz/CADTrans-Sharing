{************************************************}
{                                                }
{   Turbo Vision File Manager Demo               }
{   Copyright (c) 1992 by Borland International  }
{                                                }
{************************************************}
unit Common;

interface

uses
 Objects, HelpFile;

Const
  hcEmptyScreen  = 1000;
  hcWindow       = 1001;
  hcInputData    = 1101;
  hcInputQuality = 1102;
  hcCalculate    = 1103;
  hcInfo         = 1104;
  hcShowAll      = 1105;
  hcShowBest     = 1106;
  hcPlot         = 1107;
  hcPrint        = 1108;
  hcReport       = 1109;
  hcACAD         = 1110;
  hcMode         = 1111;
  hcVideo        = 1112;
  hcColor        = 1113;
  hcCAD          = 1114;
  hcData         = 1115;
  hcRezult       = 1116;
  hcConfig       = 1117;
  hcFeatures     = 1118;
  hcPerform      = 1119;
  hcDataHelp     = 1120;
  hcOptimize     = 1121;
  hcSelect       = 1122;
  hcHelpACAD     = 1123;
  hcBook         = 1124;
  hcAbout        = 1125;
  hcHelp         = 1126;

  hcCalcProcess      = 2100;
  hcLoadProcess      = 2101;
  hcSaveProcess      = 2102;
  hcPrintProcess     = 2103;

  hcOk           = 3100;
  hcCancel       = 3101;
  hcChange       = 3102;
  hcDataList     = 3103;
  hcQualityList  = 3104;
  hcDesignerName = 3105;
  hcFlatStrap    = 3106;
  hcFilmStrap    = 3107;
  hcWedgeStrap   = 3108;
  hcNarrowWedgeStrap = 3109;
  hcPolyWedgeStrap   = 3110;
  hcCogStrap         = 3111;
  hcRollChain        = 3112;
  hcCogChain         = 3113;
  hcCilinderWheels   = 3114;
  hcConeWheels       = 3115;
  hcCherv            = 3116;
  hcErrorButton      = 3117;
  hcFileDialog       = 3118;

  hcReadError        = 4100;
  hcWriteError       = 4101;
  hcPrintError       = 4102;

  cmInputData    = 101;
  cmInputQuality = 102;
  cmCalculate    = 103;
  cmInfo         = 104;
  cmShowAll      = 105;
  cmShowBest     = 106;
  cmPlot         = 107;
  cmPrint        = 108;
  cmReport       = 109;
  cmACAD         = 2110;
  cmMode         = 2111;
  cmVideo        = 2112;
  cmFeatures     = 110;
  cmPerform      = 111;
  cmDataHelp     = 112;
  cmOptimize     = 113;
  cmSelect       = 114;
  cmHelpACAD     = 115;
  cmBook         = 116;
  cmAbout        = 2113;

  BadCopy = $0004;
  useACAD = $0002;
  useEMS  = $0001;

  fn_EGA  = 'ega.fon';
  fn_VGA  = 'vga.fon';
  fn_8x8  = '8x8.fon';

Var
  RezFile: TResourceFile;
  HFile: PHelpFile;

Const
  DesignerFile: FNameStr = '';
  DesignerName: string[13] = 'TCAD';
  DesFilePtr: pointer = @DesignerFile;
  ProjectMode : boolean = True;
  ProjectModeStr : string[11] = '';
  EMSAcess: word = 0;
  PathToProgram: FNameStr = '';

  procedure InitHelp;
  procedure InitResource;

implementation
Uses
  App, Views, MsgBox;
{ ----------- General Purpose Routines -------------------- }

PROCEDURE InitHelp;
Var
  EMSStream:PStream;
  HStream: PStream;

BEGIN
{$IFDEF Debug}
  HStream:=New(PBufStream, Init('tcad.hlp',
    stOpenRead,2048));
{$ELSE}
  HStream:=New(PBufStream, Init(PathToProgram+'\CALC\tcad.hlp',
    stOpenRead,2048));
{$ENDIF}
  if HStream^.Status <> stOk then
  begin
    MessageBox(#3'Файл помощи не найден.',nil,mfOkButton+mfWarning);
    Application^.DisableCommands([cmFeatures..cmBook,cmHelp]);
    Dispose(HStream,Done);
    Exit;
  end;
  if EMSAcess and useEMS = useEMS then
  begin
    EMSStream:=New(PEMSStream, Init(HStream^.GetSize, HStream^.GetSize));
    if EMSStream^.Status = stOk then
    begin
      HStream^.Seek(0);
      EMSStream^.CopyFrom(HStream^, HStream^.GetSize);
      Dispose(HStream, Done);
      HStream:=EMSStream;
    end
    else
      Dispose(EMSStream, Done);
  end;
  HFile:=New(PHelpFile, Init(HStream));
END;

PROCEDURE InitResource;
Var
  EMSStream:PStream;

BEGIN
{$IFDEF Debug}
  RezFile.Init(New(PBufStream, Init('v23.res',stOpenRead,2048)));
{$ELSE}
  RezFile.Init(New(PBufStream, Init(ParamStr(0),stOpenRead,2048)));
{$ENDIF}
  if RezFile.Stream^.Status <> stOk then
  begin
    writeln('А где ресурс?');
    Halt(1);
  end;
  if EMSAcess and useEMS = useEMS then
  begin
    EMSStream:=New(PEMSStream, Init(RezFile.Stream^.GetSize,
      RezFile.Stream^.GetSize));
    if EMSStream^.Status = stOk then
      RezFile.SwitchTo(EMSStream,False)
    else
      Dispose(EMSStream, Done);
  end;
END;

end. { unit }
