Uses
  CRT, App, MsgBox, StdDlg;

Const
  LimitMsg:string     = 'Пределы значения (%s .. %s)';
  NonNumberMsg:string = 'Не числовое значение';

PROCEDURE Bell;
BEGIN
  Sound (880);
  Delay (100);
  NoSound;
  Delay (50);
  Sound (880);
  Delay (100);
  NoSound;
END;

{ TInputInt }
CONSTRUCTOR TInputInt.Init;
BEGIN
  inherited Init (R, Pos);
  SetLimits(Lo, Hi);
  VarSize:=ASize;
END;

CONSTRUCTOR TInputInt.Load;
BEGIN
  inherited Load(S);
  S.Read(LoVal, 9);
END;

PROCEDURE TInputInt.HandleEvent;
Const
  CorrectCode = [#0..#32,'0'..'9'];

Var
  OnlyOne: char;

BEGIN
  if Event.What = evKeyDown then
  begin
    OnlyOne:='a';
    if LoVal < 0 then
      OnlyOne:='-';
    if (Event.CharCode in CorrectCode) or
       ((Event.CharCode = OnlyOne) and
        (Pos(Event.CharCode,Data^)=0)) then
    inherited HandleEvent(Event);
  end
  else
    inherited HandleEvent(Event);
END;

FUNCTION TInputInt.Valid;
Var
  ChkValue : longint;
  ChkError : integer;
  HiStr: PString;
  LoStr: PString;

BEGIN
  Valid:=True;
  if Command <> cmOk then
    Exit;
  Val(Data^,ChkValue,ChkError);
  if ChkError <> 0 then
  begin
    Bell;
    MessageBox(NonNumberMsg, Nil, mfError+mfOkButton);
    Valid:=False;
    Select;
  end
  else if (not((HiVal=0) and (LoVal=0))) and
          ((ChkValue<LoVal) or (ChkValue>HiVal)) then
  begin
    Bell;
    GetMem(HiStr, MaxLen+1);
    GetMem(LoStr, MaxLen+1);
    Str(LoVal:0, LoStr^);
    Str(HiVal:0, HiStr^);
    MessageBox(LimitMsg, @LoStr, mfError+mfOkButton);
    Valid:=False;
    FreeMem(HiStr, MaxLen+1);
    FreeMem(LoStr, MaxLen+1);
    Select;
  end;
END;

PROCEDURE TInputInt.SetLimits;
BEGIN
  LoVal:=Lo;
  HiVal:=Hi;
END;

PROCEDURE TInputInt.Store;
BEGIN
  inherited Store(S);
  S.Write(LoVal, 9);
END;

PROCEDURE TInputInt.GetData;
Var
  LB: longint;
  TC: integer;

BEGIN
  Val(Data^,LB,TC);
  Move(LB,R,VarSize);
END;

PROCEDURE TInputInt.SetData;
Var
  LB: longint;

BEGIN
  LB:=0;
  Move(R,LB,VarSize);
  Str(LB,Data^);
END;

FUNCTION TInputInt.DataSize;
BEGIN
  DataSize:=VarSize;
END;

{ TInputReal }
CONSTRUCTOR TInputReal.Init;
BEGIN
  inherited Init (R, Pos);
  SetLimits(Lo, Hi);
  Places:=APlaces;
  VarSize:=ASize;
END;

CONSTRUCTOR TInputReal.Load;
BEGIN
  inherited Load(S);
  S.Read(LoVal, 22);
END;

PROCEDURE TInputReal.HandleEvent;
Const
  CorrectCode = [#0..#32,'0'..'9'];

Var
  OnlyOne: set of char;

BEGIN
  if Event.What = evKeyDown then
  begin
    OnlyOne:=[];
    if Places <> 0 then
      OnlyOne:=OnlyOne+['.'];
    if LoVal < 0 then
      OnlyOne:=OnlyOne+['-'];
    if (Event.CharCode in CorrectCode) or
       ((Event.CharCode in OnlyOne) and
        (Pos(Event.CharCode,Data^)=0)) then
    inherited HandleEvent(Event);
  end
  else
    inherited HandleEvent(Event);
END;

FUNCTION TInputReal.Valid;
Var
  ChkValue : extended;
  ChkError : integer;
  HiStr: PString;
  LoStr: PString;

BEGIN
  Valid:=True;
  if Command <> cmOk then
    Exit;
  Val(Data^,ChkValue,ChkError);
  if ChkError <> 0 then
  begin
    Bell;
    MessageBox(NonNumberMsg, Nil, mfError+mfOkButton);
    Valid:=False;
    Select;
  end
  else if (not((HiVal=0) and (LoVal=0))) and
          ((ChkValue<LoVal) or (ChkValue>HiVal)) then
  begin
    Bell;
    GetMem(HiStr, MaxLen+1);
    GetMem(LoStr, MaxLen+1);
    Str(LoVal:0:Places, LoStr^);
    Str(HiVal:0:Places, HiStr^);
    MessageBox(LimitMsg, @LoStr, mfError+mfOkButton);
    Valid:=False;
    FreeMem(HiStr, MaxLen+1);
    FreeMem(LoStr, MaxLen+1);
    Select;
  end;
END;

PROCEDURE TInputReal.SetLimits;
BEGIN
  LoVal:=Lo;
  HiVal:=Hi;
END;

PROCEDURE TInputReal.Store;
BEGIN
  inherited Store(S);
  S.Write(LoVal, 22);
END;

PROCEDURE TInputReal.GetData;
Var
  SB: single absolute R;
  RB: real absolute R;
  DB: double absolute R;
  EB: extended absolute R;
  TC: integer;

BEGIN
  case VarSize of
    4: Val(Data^,SB,TC);
    6: Val(Data^,RB,TC);
    8: Val(Data^,DB,TC);
   10: Val(Data^,EB,TC);
  end;
END;

PROCEDURE TInputReal.SetData;
Var
  SB: single absolute R;
  RB: real absolute R;
  DB: double absolute R;
  EB: extended absolute R;

BEGIN
  case VarSize of
    4: Str(SB:0:Places,Data^);
    6: Str(RB:0:Places,Data^);
    8: Str(DB:0:Places,Data^);
   10: Str(EB:0:Places,Data^);
  end;
END;

FUNCTION TInputReal.DataSize;
BEGIN
  DataSize:=VarSize;
END;

{TInputAutoReal}
PROCEDURE TInputAutoReal.HandleEvent;
Const
  AutoMessage: string[4] = 'AUTO';
BEGIN
  if ((Event.What = evMouseDown) and (Event.Buttons = mbRightButton))
    or ((Event.What = evKeyDown) and (Event.KeyCode = kbAltA)) then
  begin
    TInputLine.SetData(AutoMessage);
    ClearEvent(Event);
  end
  else
    inherited HandleEvent(Event);
END;

FUNCTION TInputAutoReal.Valid;
BEGIN
  if (Command = cmOk) and (Data^ = 'AUTO') then
    Valid:=True
  else
    Valid:=inherited Valid(Command);
END;

PROCEDURE TInputAutoReal.GetData;
BEGIN
  if Data^ = 'AUTO' then
    Data^:='0';
  inherited GetData(Rec);
END;

PROCEDURE TInputAutoReal.SetData;
Var
  CN: extended;
  TC: integer;
BEGIN
  inherited SetData(Rec);
  Val(Data^,CN,TC);
  if CN = 0 then
    Data^:='AUTO';
END;

{TTextViewWindow}
CONSTRUCTOR TTextWindow.Init;
Var
  R: TRect;

BEGIN
  DeskTop^.GetExtent(R);
  inherited Init(R, ATitle, 1);
  DetNumber;
END;

PROCEDURE TTextWindow.HandleEvent (var Event: TEvent);
BEGIN
  inherited HandleEvent(Event);
  if (Event.What = evBroadcast) and
     (Event.Command = cmCheckNumber) and
     ((byte(Event.InfoPtr^) = Number) or
      (byte(Event.InfoPtr^) = 0)) then
    ClearEvent(Event)
END;

PROCEDURE TTextWindow.DetNumber;
Var
  R: TRect;
  Event: TEvent;
  WinCount: byte;

BEGIN
  if DeskTop^.Current <> nil then
  begin
    DeskTop^.Current^.GetBounds(R);
    if R.B.X-R.A.X > MinWinSize.X then
      Inc(R.A.X);
    if R.B.Y-R.A.Y > MinWinSize.Y then
      Inc(R.A.Y);
  end
  else
    DeskTop^.GetExtent(R);
  WinCount:=1;
  while Message(DeskTop, evBroadcast, cmCheckNumber, @WinCount) <> nil do
    Inc(WinCount);
  ChangeBounds(R);
  Number:=WinCount;
END;

{ TTextCollection }
procedure TTextCollection.FreeItem(Item: pointer);
begin
  DisposeStr(Item);
end;

PROCEDURE TListDialog.HandleEvent (var Event: TEvent);
BEGIN
  Inherited HandleEvent(Event);
  if (Event.What = evCommand) and (Event.Command = cmChangeItem) then
  begin
    ClearEvent(Event);
    EndModal(cmChangeItem);
  end;
END;

PROCEDURE TListUserData.HandleEvent (var Event: TEvent);
BEGIN
  if (Event.What = evMouseDown) and Event.Double then
  begin
    Event.What:=evCommand;
    Event.Command:=cmChangeItem;
    PutEvent(Event);
    ClearEvent(Event);
  end;
  Inherited HandleEvent(Event);
END;

{TDBFile}
CONSTRUCTOR TDBFile.Init;
Var
  EMSStream: PStream;

BEGIN
  Stream:=New(PBufStream, Init(DBFileName, stOpenRead, Size));
  if EMSEnable then
  begin
    EMSStream:=New(PEMSStream, Init(Stream^.GetSize, Stream^.GetSize));
    if EMSStream^.Status = stOk then
    begin
      Stream^.Seek(0);
      EMSStream^.CopyFrom(Stream^, Stream^.GetSize);
      Dispose(Stream, Done);
      Stream:=EMSStream;
    end
    else
      Dispose(EMSStream, Done);
  end;
  Stream^.Seek(8);
  Stream^.Read(HeaderLen, 4);
  Seek(0);
  CurrentRec:=0;
END;

DESTRUCTOR TDBFile.Done;
BEGIN
  Dispose(Stream, Done);
END;

PROCEDURE TDBFile.Seek;
BEGIN
  Stream^.Seek(HeaderLen+1+RecordLen*NewRecord);
  CurrentRec:=NewRecord;
END;

PROCEDURE TDBFile.GetRecord;
BEGIN
  Stream^.Read(Dest, RecordLen);
  Inc(CurrentRec);
END;

FUNCTION TDBFile.GetPos: longint;
BEGIN
  GetPos:=CurrentRec;
END;

{TDialogOutline}
FUNCTION TDialogOutline.GetPalette: PPalette;
Const
  CDialogOutline: string[length(COutlineViewer)] = #26#27#28#29;

BEGIN
  GetPalette:=@CDialogOutline;
END;

FUNCTION TDialogOutline.DataSize: word;
BEGIN
  DataSize:=SizeOf(word);
END;

PROCEDURE TDialogOutline.SetData;
BEGIN
  Focused(integer(Source));
  DrawView;
END;

PROCEDURE TDialogOutline.GetData;
BEGIN
  integer(Dest):=Foc;
END;

PROCEDURE TDialogOutline.Selected;
Var
  Event: TEvent;

BEGIN
  Event.What:=evCommand;
  Event.Command:=cmOk;
  PutEvent(Event);
  ClearEvent(Event);
END;

PROCEDURE RegisterObRead;
BEGIN
  RegisterType(RInputReal);
  RegisterType(RInputInt);
  RegisterType(RInputAutoReal);
  RegisterType(RListDialog);
  RegisterType(RListUserData);
  RegisterType(RTextWindow);
  RegisterType(RTextCollection);
  RegisterType(RDialogOutline);
END;