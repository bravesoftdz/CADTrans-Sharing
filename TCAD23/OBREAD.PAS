Unit obRead;
{--------------------------------------------------------------------------}
{- Этот модуль содержит об"екты ввода                                     -}
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
{- Об"ект ввода дробного числа.                                           -}
{- Входные данные: R     - границы об"екта                                -}
{-                 Lo    - нижний предел                                  -}
{-                 Hi    - верхний предел                                 -}
{-                 Pos   - длина числа (в символах с запятой и знаком)    -}
{--------------------------------------------------------------------------}

  PInputAutoReal = ^TInputAutoReal;
  TInputAutoReal = object(TInputReal)
    procedure HandleEvent(var Event: TEvent); virtual;
    function Valid (Command: word): boolean; virtual;
    procedure SetData (var Rec); virtual;
    procedure GetData (var Rec); virtual;
  end;
{--------------------------------------------------------------------------}
{- Об"ект ввода числа с возможностью автовыбора.                          -}
{- Входные данные: см. предка (TInputNumber)                              -}
{- Замечание: при значении AUTO GetData возвращает 0                      -}
{-            назначение автовыбора - нажатие правой кнопки мыши          -}
{-            или нажатие Alt-A                                           -}
{--------------------------------------------------------------------------}

  PTextWindow = ^TTextWindow;
  TTextWindow = object(TWindow)
    constructor Init (const ATitle: TTitleStr);
    procedure HandleEvent (var Event: TEvent); virtual;
    procedure DetNumber; virtual;
  end;
{--------------------------------------------------------------------------}
{- Окно просмотра с функциями записи и печати содержимого.                -}
{- При инициализации окно накладывается на текущий видимый элемент.       -}
{- Номер окна определяется корректно.                                     -}
{- Входные данные: ATitle - заголовок окна.                               -}
{--------------------------------------------------------------------------}

  PTextCollection = ^TTextCollection;
  TTextCollection = object(TCollection)
    procedure FreeItem(Item: pointer); virtual;
  end;
{--------------------------------------------------------------------------}
{- Коллекция несортированных строк.                                       -}
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
{- Диалоговое окно.                                                       -}
{- Завершает модальное состояние по команде cmChangeItem                  -}
{--------------------------------------------------------------------------}

  PListUserData = ^TListUserData;
  TListUserData = object(TListBox)
    procedure HandleEvent (var Event: TEvent); virtual;
  end;
{--------------------------------------------------------------------------}
{- Панель списка.                                                         -}
{- При двойном нажатии на кнопку мыши генерирует команду cmChangeItem     -}
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
{- Объект для доступа к базам данных.                                     -}
{- При инициализации задается имя файла БД, размер буфера,                -}
{- разрешение на использование EMS.                                       -}
{- Содержит методы для позиционного доступа к записям,                    -}
{- считывания записи в буфер, определения текущей позиции.                -}
{- Позиции задаются номером записи начиная с 0.                           -}
{- Если EMS недоступна, записи читаются из файла.                         -}
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
{- Видимый объект для показа дерева.                                      -}
{- Закрывает окно при двойном нажатии на мышь или Enter.                  -}
{- GetData и SetData задают номер ветви дерева (integer)                  -}
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
