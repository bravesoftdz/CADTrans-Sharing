Unit obRead;
{--------------------------------------------------------------------------}
{- ��� ����� ᮤ�ন� ��"���� �����                                     -}
{--------------------------------------------------------------------------}
INTERFACE
Uses
  Objects, Drivers, Dialogs, TextView, Views, Outline, DOS;

Type
  PInputInt = ^TInputInt;
  TInputInt = object(TInputLine)
    LoVal, HiVal: longint;
    VarSize: byte;
    constructor Init (R: TRect; Pos: byte; Lo, Hi: longint; ASize: byte);
    constructor Load (var S: TStream);
    function Valid (Command: Word) : boolean; virtual;
    procedure HandleEvent (var Event: TEvent); virtual;
    procedure SetLimits (const Lo, Hi: longint); virtual;
    procedure Store (var S: TStream); virtual;
    procedure SetData (var R); virtual;
    procedure GetData (var R); virtual;
    function  DataSize: word; virtual;
  end;

  PInputReal = ^TInputReal;
  TInputReal = object(TInputLine)
    LoVal, HiVal: extended;
    Places: byte;
    VarSize: byte;
    constructor Init (R: TRect; Pos: byte; const Lo, Hi: extended;
      APlaces, ASize: byte);
    constructor Load (var S: TStream);
    function Valid (Command: Word) : boolean; virtual;
    procedure HandleEvent (var Event: TEvent); virtual;
    procedure SetLimits (const Lo, Hi: extended); virtual;
    procedure Store (var S: TStream); virtual;
    procedure SetData (var R); virtual;
    procedure GetData (var R); virtual;
    function  DataSize: word; virtual;
  end;
{--------------------------------------------------------------------------}
{- ��"��� ����� �஡���� �᫠.                                           -}
{- �室�� �����: R     - �࠭��� ��"���                                -}
{-                 Lo    - ������ �।��                                  -}
{-                 Hi    - ���孨� �।��                                 -}
{-                 Pos   - ����� �᫠ (� ᨬ����� � ����⮩ � ������)    -}
{--------------------------------------------------------------------------}

  PInputAutoReal = ^TInputAutoReal;
  TInputAutoReal = object(TInputReal)
    procedure HandleEvent(var Event: TEvent); virtual;
    function Valid (Command: word): boolean; virtual;
    procedure SetData (var Rec); virtual;
    procedure GetData (var Rec); virtual;
  end;
{--------------------------------------------------------------------------}
{- ��"��� ����� �᫠ � ������������ ��⮢롮�.                          -}
{- �室�� �����: �. �।�� (TInputNumber)                              -}
{- ����砭��: �� ���祭�� AUTO GetData �����頥� 0                      -}
{-            �����祭�� ��⮢롮� - ����⨥ �ࠢ�� ������ ���          -}
{-            ��� ����⨥ Alt-A                                           -}
{--------------------------------------------------------------------------}

  PTextWindow = ^TTextWindow;
  TTextWindow = object(TWindow)
    constructor Init (const ATitle: TTitleStr);
    procedure HandleEvent (var Event: TEvent); virtual;
    procedure DetNumber; virtual;
  end;
{--------------------------------------------------------------------------}
{- ���� ��ᬮ�� � �㭪�ﬨ ����� � ���� ᮤ�ন����.                -}
{- �� ���樠����樨 ���� ������뢠���� �� ⥪�騩 ������ �������.       -}
{- ����� ���� ��।������ ���४⭮.                                     -}
{- �室�� �����: ATitle - ��������� ����.                               -}
{--------------------------------------------------------------------------}

  PTextCollection = ^TTextCollection;
  TTextCollection = object(TCollection)
    procedure FreeItem(Item: pointer); virtual;
  end;
{--------------------------------------------------------------------------}
{- �������� �����஢����� ��ப.                                       -}
{--------------------------------------------------------------------------}

Const
  cmChangeItem = 1501;
  cmCheckNumber = 1502;

Type
  PListDialog = ^TListDialog;
  TListDialog = object(TDialog)
    procedure HandleEvent (var Event: TEvent); virtual;
  end;
{--------------------------------------------------------------------------}
{- ���������� ����.                                                       -}
{- �����蠥� �����쭮� ���ﭨ� �� ������� cmChangeItem                  -}
{--------------------------------------------------------------------------}

  PListUserData = ^TListUserData;
  TListUserData = object(TListBox)
    procedure HandleEvent (var Event: TEvent); virtual;
  end;
{--------------------------------------------------------------------------}
{- ������ ᯨ᪠.                                                         -}
{- �� ������� ����⨨ �� ������ ��� �������� ������� cmChangeItem     -}
{--------------------------------------------------------------------------}

  PDBFile = ^TDBFile;
  TDBFile = object(TObject)
    Stream: PStream;
    HeaderLen: word;
    RecordLen: word;
    CurrentRec: longint;
    constructor Init (const DBFileName: FNameStr; Size: word;
                      EMSEnable: boolean);
    destructor Done; virtual;
    procedure Seek (NewRecord: longint);
    procedure GetRecord (var Dest);
    function GetPos: longint;
  end;
{--------------------------------------------------------------------------}
{- ��ꥪ� ��� ����㯠 � ����� ������.                                     -}
{- �� ���樠����樨 �������� ��� 䠩�� ��, ࠧ��� ����,                -}
{- ࠧ�襭�� �� �ᯮ�짮����� EMS.                                       -}
{- ����ন� ��⮤� ��� ����樮����� ����㯠 � ������,                    -}
{- ���뢠��� ����� � ����, ��।������ ⥪�饩 ����樨.                -}
{- ����樨 �������� ����஬ ����� ��稭�� � 0.                           -}
{- �᫨ EMS ������㯭�, ����� ������ �� 䠩��.                         -}
{--------------------------------------------------------------------------}

  PDialogOutline = ^TDialogOutline;
  TDialogOutline = object(TOutline)
    function GetPalette: PPalette; virtual;
    procedure SetData(var Source); virtual;
    procedure GetData(var Dest); virtual;
    function DataSize: word; virtual;
    procedure Selected(I: integer); virtual;
  end;
{--------------------------------------------------------------------------}
{- ������ ��ꥪ� ��� ������ ��ॢ�.                                      -}
{- ����뢠�� ���� �� ������� ����⨨ �� ���� ��� Enter.                  -}
{- GetData � SetData ������ ����� ��⢨ ��ॢ� (integer)                  -}
{--------------------------------------------------------------------------}

Const
  RInputReal: TStreamRec = (
    ObjType: 1101;
    VmtLink: Ofs(TypeOf(TInputReal)^);
    Load: @TInputReal.Load;
    Store: @TInputReal.Store
  );
  RInputAutoReal: TStreamRec = (
    ObjType: 1102;
    VmtLink: Ofs(TypeOf(TInputAutoReal)^);
    Load: @TInputAutoReal.Load;
    Store: @TInputAutoReal.Store
  );
  RInputInt: TStreamRec = (
    ObjType: 1103;
    VmtLink: Ofs(TypeOf(TInputInt)^);
    Load: @TInputInt.Load;
    Store: @TInputInt.Store
  );
  RListDialog: TStreamRec = (
    ObjType: 1104;
    VmtLink: Ofs(TypeOf(TListDialog)^);
    Load: @TListDialog.Load;
    Store: @TListDialog.Store
  );
  RListUserData: TStreamRec = (
    ObjType: 1105;
    VmtLink: Ofs(TypeOf(TListUserData)^);
    Load: @TListUserData.Load;
    Store: @TListUserData.Store
  );
  RTextWindow: TStreamRec = (
  ObjType: 1106;
  VmtLink: Ofs(TypeOf(TTextWindow)^);
  Load: @TTextWindow.Load;
  Store: @TTextWindow.Store
  );
  RTextCollection: TStreamRec = (
  ObjType: 1107;
  VmtLink: Ofs(TypeOf(TTextCollection)^);
  Load: @TTextCollection.Load;
  Store: @TTextCollection.Store
  );
  RDialogOutline: TStreamRec = (
  ObjType: 1108;
  VmtLink: Ofs(TypeOf(TDialogOutline)^);
  Load: @TDialogOutline.Load;
  Store: @TDialogOutline.Store
  );

procedure RegisterObRead;

IMPLEMENTATION

{$I obread.inc}

END. {Unit}
