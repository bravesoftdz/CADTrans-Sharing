{$O+}
{--------------------------------------------------------------}
{- �������                                                    -}
{--------------------------------------------------------------}
Uses
  Objects, Views, Drivers, Dialogs, Menus, App, StdDlg, Common, obRead,
  Designers, Overlay,
  FlatStrapTransmission,
  FilmStrapTransmission,
  WedgeStrapTransmission,
  NarrowWedgeStrapTransmission,
  PolyWedgeStrapTransmission,
  CogStrapTransmission,
  RollChainTransmission,
  CogChainTransmission,
  CogWheelTransmission,
  WormWheelTransmission,
  ConeCogWheelTransmission;

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

{- ��楤�� ����⮢����� ���� -}
procedure MakeMenuBar;
var
  R: TRect;
  M: PMenuBar;
begin
  R.Assign(0,0,80,1);
  M := New(PMenuBar, Init(R, NewMenu(
    NewSubMenu('���������', hcCAD, NewMenu(
      NewItem('����', 'F9', kbF9, cmNew, hcNew,
      NewItem('����㧨��', 'F3', kbF3, cmOpen, hcOpen,
      NewItem('���࠭���', 'F2', kbF2, cmSave, hcSave,
      NewItem('���࠭��� �...', '', kbNoKey, cmSaveAs, hcSaveAs,
      NewLine(
      NewItem('���', '', kbNoKey, cmDosShell, hcDosShell,
      NewItem('��室', 'Alt+X', kbAltX, cmQuit, hcExit,
    nil)))))))),
    NewSubMenu('�஥��஢����', hcData, NewMenu(
      NewItem('��室�� �����', 'Ctrl+F3', kbCtrlF3, cmInputData, hcInputData,
      NewItem('���ਨ ����⢠', 'Ctrl+F4', kbCtrlF4, cmInputQuality, hcInputQuality,
      NewLine(
      NewItem('�����', 'Ctrl+F9', kbCtrlF9, cmCalculate, hcCalculate,
      NewItem('���ଠ��', 'Alt+F4', kbAltF4, cmInfo, hcInfo,
    nil)))))),
    NewSubMenu('�������', hcRezult, NewMenu(
      NewItem('�������� ��', 'Alt+F9', kbAltF9, cmShowAll, hcShowAll,
      NewItem('�������� ���訩', '', kbNoKey, cmShowBest, hcShowBest,
      NewLine(
      NewItem('��।��� � AutoCAD', '', kbNoKey, cmPlot, hcPlot,
      NewItem('�����', 'Alt+P', kbAltP, cmPrint, hcPrint,
      NewItem('������� � ...', 'Alt+S', kbAltS, cmReport, hcReport,
      NewLine(
      NewItem('������/����', 'Ctrl+F5', kbCtrlF5, cmResize, hcResize,
      NewItem('����⠡', 'F5', kbF5, cmZoom, hcZoom,
      NewItem('�����饥', 'F6', kbF6, cmNext, hcNext,
      NewItem('�।��饥', 'Shift+F6', kbShiftF6, cmPrev, hcPrev,
      NewItem('�������', 'Alt+F3', kbAltF3, cmClose, hcClose,
    nil))))))))))))),
    NewSubMenu('���䨣����', hcConfig, NewMenu(
      NewItem('����� �஥��஢����', '', kbNoKey, cmMode, hcMode,
      NewItem('����� ��ᯫ��', '', kbNoKey, cmVideo, hcVideo,
    nil))),
    NewSubMenu('������', hcHelp, NewMenu(
      NewItem('���������� ��⥬�', '', kbNoKey, cmFeatures, hcFeatures,
      NewItem('����� � ��⥬��', '', kbNoKey, cmPerform, hcPerform,
      NewItem('���� ������', '', kbNoKey, cmDataHelp, hcDataHelp,
      NewItem('��⨬�����', '', kbNoKey, cmOptimize, hcOptimize,
      NewItem('�롮� ��ਠ�⮢', '', kbNoKey, cmSelect, hcSelect,
      NewItem('���� � AutoCAD', '', kbNoKey, cmHelpACAD, hcHelpACAD,
      NewLine(
      NewItem('���祭��', '', kbNoKey, cmBook, hcBook,
      NewLine(
      NewItem('����� ����', '', kbNoKey, cmAbout, hcAbout,
    nil))))))))))),
  nil))))))));
  RezFile.Put(M, '���� �ணࠬ��');
  Dispose(M, Done);
end;

{- ��楤�� ����⮢����� �ࠢ�筮�� ���⥪�� -}
procedure MakeStrings;
var
  P : PStrListMaker;
begin
  p := New(PStrListMaker, Init(32384,100));
  with p^ do
  begin
    { menu hint strings }
    Put(hcCAD, '����� � ��������ࠬ�');
    Put(hcNew, '������� ���� ���������');
    Put(hcOpen,'����㧨�� ���������');
    Put(hcSave,'���࠭��� ���������');
    Put(hcSaveAs,'���࠭��� ��������� � ��㣮� 䠩��');
    Put(hcDosShell,'�६���� ��室 � ���');
    Put(hcExit,'�����襭�� ࠡ��� � ����');
    Put(hcData, '�஥��஢���� ��।��');
    Put(hcInputData,'��������� ��室��� ������');
    Put(hcInputQuality,'��������� ���ਥ� ����⢠');
    Put(hcCalculate,'�������� �������� ��ਠ���');
    Put(hcInfo,'���ଠ�� � ����');
    Put(hcRezult,'�����㫨஢���� १���⠬�');
    Put(hcShowAll,'�������� �� ��ਠ���');
    Put(hcShowBest,'�������� ����訩 ��ਠ��');
    Put(hcPlot,'��।��� ����� ��� ��祭�� � AutoCAD');
    Put(hcPrint,'������ १���� �� �ਭ��');
    Put(hcReport, '���࠭��� १���� � ⥪�⮢�� 䠩��');
    Put(hcResize, '�������� ࠧ���� � ��������� ����');
    Put(hcZoom, '�������� ��� ����⠭����� ࠧ���� ����');
    Put(hcNext, '��३� � ��ᬮ��� ᫥���饣� ����');
    Put(hcPrev, '��३� � ��ᬮ��� �।��饣� ����');
    Put(hcClose, '������� ��ᬠ�ਢ����� ����');
    Put(hcConfig, '���䨣���� �।� ����');
    Put(hcACAD, '��।����� ࠡ���� ��४��� AutoCAD');
    Put(hcMode, '��४����� ०�� �஥��஢����');
    Put(hcVideo, '��४����� �����०�� (EGA � �����)');
    Put(hcColor, '�������� 梥�');
    Put(hcHelp, '������ ��� ���');
    Put(hcFeatures, '�� ����� �ணࠬ��');
    Put(hcPerform, '��� ࠡ���� � �ணࠬ���');
    Put(hcDataHelp, '��� ����� ����� ��� ����');
    Put(hcOptimize, '��� ������� ���襥 �襭��');
    Put(hcSelect, '��� ����� ���襥 �襭��');
    Put(hcHelpACAD, '��� ࠡ���� � AutoCAD');
    Put(hcBook, '��ࠢ�筨� �஥��஢騪�');
    Put(hcAbout, '���ଠ�� �� ����� ����');
    Put(hcDataList, '��६�饭�� - ������ �����, Enter - ��������');
    Put(hcQualityList, '��६�饭�� - ������ �����, Enter - ��������');
    Put(hcOk, '�ਭ��� ���祭�� � ���������� ����');
    Put(hcCancel, '������� ���������� ���� �� ����� ���������');
    Put(hcChange, '�������� ��࠭�� � ᯨ᪥ ��ࠬ���');
    Put(hcFlatStrap, '��।�� ���᪨� ��१������ ६���');
    Put(hcFilmStrap, '��।�� ������� ६���');
    Put(hcWedgeStrap, '��।�� ������� ६���');
    Put(hcNarrowWedgeStrap, '��।�� 㧪�� ������� ६���');
    Put(hcPolyWedgeStrap, '��।�� ����������� ६���');
    Put(hcCogStrap, '��।�� ����� ६���');
    Put(hcRollChain, '��।�� ஫������ 楯��');
    Put(hcCogChain, '��।�� ���⮩ 楯��');
    Put(hcCilinderWheels, '��।�� 樫�����᪨�� ����묨 ����ᠬ�');
    Put(hcConeWheels, '��।�� �����᪨�� ����묨 ����ᠬ�');
    Put(hcCherv, '����筠� ��।��');
    Put(hcDesignerName, '��� ��������� (�� ����� 20 ᨬ�����)');
    Put(hcErrorButton, '������ ENTER...');
    Put(hcCalcProcess, '������뢠� ��ਠ���...');
    Put(hcLoadProcess, '���� ��������� �� 䠩�� ...');
    Put(hcSaveProcess, '�����뢠� 䠩� ...');
    Put(hcPrintProcess, '����� १����� ...');
    Put(hcReadError, '���������� ������ %s');
    Put(hcWriteError, '���������� ������� %s');
    Put(hcPrintError, '���������� �������� %s');
  end;

  RezFile.Put(P, '�������� ���⥪��');
  Dispose(P, Done);
end;

{- ��������� ���� ��� ࠡ��� � ᯨ᪠�� -}
procedure MakeListDialogs;
Var
  Dialog: PDialog;
  UserListBox: PListUserData;
  ScrollBar: PScrollBar;
  Button: PButton;
  R, RLine, RLabel: TRect;
  Bruce: PView;
  C: byte;

Const
  TableText: array [1..18] of string[60] = (
    '    ',
    '    �   X*Tn',
    '    ���������͸',
    '    �        �  Tn',
    '    �    �    �������͸',
    '    �    �    �      �       Y*Tn',
    '    �    �    �   �   �����������������͸',
    '    �    �    �   �   �                �        Z*Tn',
    '    �    �    �   �   �        �        �����������������͸',
    '    �    �    �   �   �        �        �                �',
    '    �    �    �   �   �        �        �         �       �',
    '    �         �   �   �                 �                 �',
    '    �    �    �   �   �        �        �         �       �',
    '    �    �    �   �   �        �        �         �       �',
    '    �        �      �                �                �',
    '����������������������������������������������������������������',
    '    �       i         �        j        �         k       �',
    '    �����      ����������      �����������      �����');

BEGIN
  R.Assign(1, 1, 65, 15);
  Dialog:=New(PListDialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(Size.X-3, 1, Size.X-2, Size.Y-4);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 1, Size.X-3, Size.Y-4);
    New(UserListBox, Init(R, 1, ScrollBar));
    UserListBox^.HelpCtx:=hcDataList;
    Insert(UserListBox);
    R.Assign(Size.X-15, Size.Y-3, Size.X-2, Size.Y-1);
    New(Button, Init(R, '�⪠�', cmCancel, bfNormal));
    Button^.HelpCtx:=hcCancel;
    Insert(Button);
    R.Move(-15, 0);
    New(Button, Init(R, '�ਭ���', cmOk, bfNormal));
    Button^.HelpCtx:=hcOk;
    Insert(Button);
    R.Move(-15, 0);
    New(Button, Init(R, '��������', cmChangeItem, bfDefault));
    Button^.HelpCtx:=hcChange;
    Insert(Button);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, '���� ������');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 65, 15);
  Dialog:=New(PListDialog, Init(R, '���ਨ ����⢠'));
  with Dialog^ do
  begin
    R.Assign(1, 1, Size.X-1, 2);
    Insert(New(PStaticText, Init(R,
    '  ��ࠬ���                    �    ���.   �   ����.   �  ���')));
    R.Assign(Size.X-3, 2, Size.X-2, Size.Y-4);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 2, Size.X-3, Size.Y-4);
    New(UserListBox, Init(R, 1, ScrollBar));
    UserListBox^.HelpCtx:=hcQualityList;
    Insert(UserListBox);
    R.Assign(Size.X-15, Size.Y-3, Size.X-2, Size.Y-1);
    New(Button, Init(R, '�⪠�', cmCancel, bfNormal));
    Button^.HelpCtx:=hcCancel;
    Insert(Button);
    R.Move(-15, 0);
    New(Button, Init(R, '�ਭ���', cmOk, bfNormal));
    Button^.HelpCtx:=hcOk;
    Insert(Button);
    R.Move(-15, 0);
    New(Button, Init(R, '��������', cmChangeItem, bfDefault));
    Button^.HelpCtx:=hcChange;
    Insert(Button);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, '���� ���ਥ� ����⢠');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 55, 13);
  Dialog:=New(PDialog, Init(R, ''));
  with Dialog^ do
  begin
    RLine.Assign(Size.X-15, 2, Size.X-3, 3);
    Bruce:=New(PInputReal, Init(RLine,10,0,0,2,SizeOf(float)));
    Insert(Bruce);
    RLabel.Assign(1, 2, Size.X-15, 3);
    Insert(New(PLabel, Init(RLabel, '�������쭮� ���祭��', Bruce)));
    RLine.Move(0, 2);
    Bruce:=New(PInputReal, Init(RLine,10,0,0,2,SizeOf(float)));
    Insert(Bruce);
    RLabel.Move(0, 2);
    Insert(New(PLabel, Init(RLabel, '���ᨬ��쭮� ���祭��', Bruce)));
    RLine.Move(0, 2);
    Bruce:=New(PInputInt, Init(RLine,2,0,10,1));
    Insert(Bruce);
    RLabel.Move(0, 2);
    Insert(New(PLabel, Init(RLabel, '��ᮢ�� �����樥��', Bruce)));

    RLabel.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    New(Button, Init(RLabel, '�⪠�', cmCancel, bfNormal));
    Button^.HelpCtx:=hcCancel;
    Insert(Button);
    RLabel.Move(-18, 0);
    New(Button, Init(RLabel, '��', cmOk, bfDefault));
    Button^.HelpCtx:=hcOk;
    Insert(Button);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, '���� ���ਠ���� ��࠭��⥫��');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 55, 13);
  Dialog:=New(PDialog, Init(R, '����� ���� "CADTRANS"'));
  with Dialog^ do
  begin
    R.Assign(1,2,Size.X-1,Size.Y-3);
    Insert(New(PStaticText, Init(R,
        #3'�������� "���� ��堭��᪨� ��।��",'+#13+
        #3'�����, 660074, ��᭮���, ��७᪮�� 26,'+#13+
        #3'��᭮��᪨� ���㤠��⢥��� �孨�᪨�'+#13+
        #3'㭨������.'+#13+
        #13+
        #3'䠪�: 3912, 430692; ⥫.: 3912, 497555'
    )));
    R.Assign(0, Size.Y-3, 15, Size.Y-1);
    Button:=New(PButton, Init(R, '����⭮', cmOk, bfDefault));
    Button^.Options:=Button^.Options or ofCenterX;
    Insert(Button);
    Options:=Options or ofCentered;
  end;
  RezFile.Put(Dialog, '�����');
  Dispose(Dialog, Done);

  R.Assign(1,1,45,11);
  Dialog:=New(PDialog,Init(R,'CADTRANS'));
  with Dialog^ do
  begin
    R.Assign(1,2,Size.X-1,Size.Y-3);
    Insert(New(PStaticText, Init(R,
    #3'���⥬�'#13+
    #3'��⮬�⨧�஢������ �஥��஢����'#13+
    #3'��堭��᪨� ��।��')));
    R.Assign(1,Size.Y-3,15,Size.Y-1);
    Bruce:=New(PButton, Init(R,'����',cmOk,bfDefault));
    Bruce^.Options:=Bruce^.Options or ofCenterX;
    Insert(Bruce);
    Options:=Options or ofCentered;
  end;
  RezFile.Put(Dialog, '���⠢��');
  Dispose(Dialog, Done);

  Dialog:=New(PFileDialog, Init('*.CAD','���࠭���� ���������',
    '���� � �������஬:',fdOkButton+fdHelpButton, 1));
  Dialog^.HelpCtx:=hcFileDialog;
  RezFile.Put(Dialog, '���࠭���� ���������');
  Dispose(Dialog, Done);

  Dialog:=New(PFileDialog, Init('*.CAD','����㧪� ���������',
    '���� � �������஬:',fdOkButton+fdHelpButton, 1));
  Dialog^.HelpCtx:=hcFileDialog;
  RezFile.Put(Dialog, '����㧪� ���������');
  Dispose(Dialog, Done);

  Dialog:=New(PFileDialog, Init('*.RES','���࠭���� १����',
    '���� १����:',fdOkButton+fdHelpButton, 2));
  Dialog^.HelpCtx:=hcFileDialog;
  RezFile.Put(Dialog, '������ १����');
  Dispose(Dialog, Done);

  Dialog:=New(PFileDialog, Init('*.plt','��।�� ������',
    '���� ������:',fdOkButton+fdHelpButton, 3));
  Dialog^.HelpCtx:=hcFileDialog;
  RezFile.Put(Dialog, '��।�� ������');
  Dispose(Dialog, Done);

  R.Assign(1,1,79,22);
  Dialog:=New(PDialog, Init(R, '������ࠬ�� ����㦥���'));
  with Dialog^ do
  begin
    R.Assign(2,1,Size.X-1,2);
    for C:=1 to 18 do
    begin
      Insert(New(PStaticText, Init(R, TableText[C])));
      R.Move(0,1);
    end;
    R.Assign(8,12,15,13);
    Insert(New(PInputReal, Init(R,4,1,10,2,4)));
    R.Move(22,0);
    Insert(New(PInputReal, Init(R,4,0,1,2,4)));
    R.Move(19,0);
    Insert(New(PInputReal, Init(R,4,0,1,2,4)));
    R.Assign(12,18,18,19);
    Insert(New(PInputReal, Init(R,4,0,1,2,4)));
    R.Move(18,0);
    Insert(New(PInputReal, Init(R,4,0,1,2,4)));
    R.Move(19,0);
    Insert(New(PInputReal, Init(R,4,0,1,2,4)));

    R.Assign(Size.X-15, Size.Y-6, Size.X-3, Size.Y-4);
    Bruce:=New(PButton, Init(R, '��', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);
    R.Move(0,3);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, '������ࠬ��');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 41, 10);
  New(Dialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 38, 5);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('�������',
      NewSItem('�⠬�����',
      NewSItem('�ப��',
      NewSItem('����',
      nil))))
    ));
    Insert(Bruce);
    R.Assign(2,2,30,3);
    Insert(New(PLabel, Init(R, '���ᮡ ����祭�� ����⮢��', Bruce)));
    R.Assign(Size.X-15, Size.Y-3, Size.X-2, Size.Y-1);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-15, 0);
    Bruce:=New(PButton, Init(R, '�ਭ���', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, '���ᮡ ����祭�� ����⮢��');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 40, 9);
  New(Dialog, Init(R, '��室�� �����'));
  with Dialog^ do
  begin
    R.Assign(2, 3, Size.X-2, 4);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Ra1.6',
      NewSItem('Ra3.2',
      NewSItem('Ra6.3',
      nil)))
    ));
    Insert(Bruce);
    R.Assign(2,2,Size.X-2,3);
    Insert(New(PLabel, Init(R, '���客����� �����孮�� �㡠', Bruce)));
    R.Assign(Size.X-15, Size.Y-3, Size.X-2, Size.Y-1);
    Bruce:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-15, 0);
    Bruce:=New(PButton, Init(R, '�ਭ���', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, '���客����� �㡠');
  Dispose(Dialog, Done);
END;

{- ���������� ���� ��� ����� ⨯� ��������� -}
procedure MakeDesignerDialog;
Var
  Dialog: PDialog;
  Button: PButton;
  Bruce: PView;
  R: TRect;

BEGIN
  R.Assign(1, 1, 50, 21);
  New(Dialog, Init(R, '�������� ������ ���������'));
  with Dialog^ do
  begin
    R.Assign(2, 3, Size.X-2, 14);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('���᪨� ��१������ ६���',
      NewSItem('���᪨� ������� ६���',
      NewSItem('������� ६���',
      NewSItem('����� ������� ६���',
      NewSItem('����������� ६���',
      NewSItem('����� ६���',
      NewSItem('��������� 楯��',
      NewSItem('���⮩ 楯��',
      NewSItem('��������᪨�� ����묨 ����ᠬ�',
      NewSItem('�����᪨�� ����묨 ����ᠬ�',
      NewSItem('����筠� � 樫�����᪨� ��类�',
      nil)))))))))))
    ));
    Bruce^.HelpCtx:=hcFlatStrap;
    Insert(Bruce);
    R.Assign(1, 2, 40, 3);
    Insert(New(PLabel, Init(R, '�஥���㥬�� ��।��', Bruce)));
    R.Assign(Size.X-24, 15, Size.X-2, 16);
    Bruce:=New(PInputLine, Init(R, 13));
    Bruce^.HelpCtx:=hcDesignerName;
    Insert(Bruce);
    R.Assign(1, 15, Size.X-25, 16);
    Insert(New(PLabel, Init(R, '��� ���������', Bruce)));

    R.Assign(Size.X-15, Size.Y-3, Size.X-3, Size.Y-1);
    Button:=New(PButton, Init(R, '�⪠�', cmCancel, bfNormal));
    Button^.HelpCtx:=hcCancel;
    Insert(Button);
    R.Move(-15, 0);
    Button:=New(PButton, Init(R, '��', cmOk, bfDefault));
    Button^.HelpCtx:=hcOk;
    Insert(Button);
    R.Move(-15, 0);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, '���� ⨯� ���������');
  Dispose(Dialog, Done);
END;

PROCEDURE MakeDesigners;
Var
  Designer: PDesigner;

BEGIN
  Designer:=New(PFlatStrapTransCAD,Init);
  RezFile.Put(Designer, '��।�� ���᪨� ��१������ ६���');
  Dispose(Designer, Done);

  Designer:=New(PFilmStrapTransCAD,Init);
  RezFile.Put(Designer, '��।�� ������� ६���');
  Dispose(Designer, Done);

  Designer:=New(PWedgeStrapTransCAD,Init);
  RezFile.Put(Designer, '��।�� ������� ६���');
  Dispose(Designer, Done);

  Designer:=New(PNarrowWedgeStrapTransCAD,Init);
  RezFile.Put(Designer, '��।�� 㧪�� ������� ६���');
  Dispose(Designer, Done);

  Designer:=New(PPolyWedgeStrapTransCAD,Init);
  RezFile.Put(Designer, '��।�� ����������� ६���');
  Dispose(Designer, Done);

  Designer:=New(PCogStrapTransCAD,Init);
  RezFile.Put(Designer, '��।�� ����� ६���');
  Dispose(Designer, Done);

  Designer:=New(PRollChainTransCAD,Init);
  RezFile.Put(Designer, '��।�� ஫������ 楯��');
  Dispose(Designer, Done);

  Designer:=New(PCogChainTransCAD,Init);
  RezFile.Put(Designer, '��।�� ���⮩ 楯��');
  Dispose(Designer, Done);

  Designer:=New(PCogWheelTransCAD,Init);
  RezFile.Put(Designer, '��।�� 樫�����᪨�� ����묨 ����ᠬ�');
  RezFile.Put(Designer, '����筠� ��।��');
  Dispose(Designer, Done);

  Designer:=New(PConeCogWheelTransCAD,Init);
  RezFile.Put(Designer, '��।�� �����᪨�� ����묨 ����ᠬ�');
  Dispose(Designer, Done);

  Designer:=New(PWormWheelTransCAD,Init);
  RezFile.Put(Designer, '����筠� ��।��');
  Dispose(Designer, Done);
END;

PROCEDURE InitOvrManager;
BEGIN
  OvrInit('MAKERES.OVR');
  if OvrResult <> ovrOk then
  begin
    Writeln('Overlay manager initialization failed.');
    Halt(1);
  end;
  OvrInitEMS;
  case OvrResult of
    ovrIOError: Writeln('Overlay file I/O error.');
    ovrNoEMSDriver: Writeln('EMS driver not installed.');
    ovrNoEMSMemory: Writeln('Not enough EMS memory.');
  else
    writeln('Using EMS for faster overlay swapping.');
  end;
END;

BEGIN
  InitOvrManager;
  RezFile.Init(New(PBufStream, Init('v23.res', stCreate, 4096)));

  RegisterObjects;  { registers TStringCollection }
  RegisterViews;
  RegisterDialogs;
  RegisterMenus;
  RegisterObRead;
  RegisterStdDlg;
  RegisterType(RStrListMaker);
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

  MakeMenuBar;
  MakeStrings;
  MakeListDialogs;
  MakeDesignerDialog;
  MakeDesigners;

  RezFile.Done;
END.