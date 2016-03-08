{$O+}
{--------------------------------------------------------------}
{- Ресурсы                                                    -}
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

{- Процедура изготовления меню -}
procedure MakeMenuBar;
var
  R: TRect;
  M: PMenuBar;
begin
  R.Assign(0,0,80,1);
  M := New(PMenuBar, Init(R, NewMenu(
    NewSubMenu('Конструктор', hcCAD, NewMenu(
      NewItem('Новый', 'F9', kbF9, cmNew, hcNew,
      NewItem('Загрузить', 'F3', kbF3, cmOpen, hcOpen,
      NewItem('Сохранить', 'F2', kbF2, cmSave, hcSave,
      NewItem('Сохранить в...', '', kbNoKey, cmSaveAs, hcSaveAs,
      NewLine(
      NewItem('ДОС', '', kbNoKey, cmDosShell, hcDosShell,
      NewItem('Выход', 'Alt+X', kbAltX, cmQuit, hcExit,
    nil)))))))),
    NewSubMenu('Проектирование', hcData, NewMenu(
      NewItem('Исходные данные', 'Ctrl+F3', kbCtrlF3, cmInputData, hcInputData,
      NewItem('Критерии качества', 'Ctrl+F4', kbCtrlF4, cmInputQuality, hcInputQuality,
      NewLine(
      NewItem('Расчет', 'Ctrl+F9', kbCtrlF9, cmCalculate, hcCalculate,
      NewItem('Информация', 'Alt+F4', kbAltF4, cmInfo, hcInfo,
    nil)))))),
    NewSubMenu('Результат', hcRezult, NewMenu(
      NewItem('Показать все', 'Alt+F9', kbAltF9, cmShowAll, hcShowAll,
      NewItem('Показать лучший', '', kbNoKey, cmShowBest, hcShowBest,
      NewLine(
      NewItem('Передать в AutoCAD', '', kbNoKey, cmPlot, hcPlot,
      NewItem('Печать', 'Alt+P', kbAltP, cmPrint, hcPrint,
      NewItem('Записать в ...', 'Alt+S', kbAltS, cmReport, hcReport,
      NewLine(
      NewItem('Размер/место', 'Ctrl+F5', kbCtrlF5, cmResize, hcResize,
      NewItem('Масштаб', 'F5', kbF5, cmZoom, hcZoom,
      NewItem('Следущее', 'F6', kbF6, cmNext, hcNext,
      NewItem('Предыдущее', 'Shift+F6', kbShiftF6, cmPrev, hcPrev,
      NewItem('Закрыть', 'Alt+F3', kbAltF3, cmClose, hcClose,
    nil))))))))))))),
    NewSubMenu('Конфигурация', hcConfig, NewMenu(
      NewItem('Режим проектирования', '', kbNoKey, cmMode, hcMode,
      NewItem('Режим дисплея', '', kbNoKey, cmVideo, hcVideo,
    nil))),
    NewSubMenu('Помощь', hcHelp, NewMenu(
      NewItem('Возможности системы', '', kbNoKey, cmFeatures, hcFeatures,
      NewItem('Работа с системой', '', kbNoKey, cmPerform, hcPerform,
      NewItem('Ввод данных', '', kbNoKey, cmDataHelp, hcDataHelp,
      NewItem('Оптимизация', '', kbNoKey, cmOptimize, hcOptimize,
      NewItem('Выбор вариантов', '', kbNoKey, cmSelect, hcSelect,
      NewItem('Связь с AutoCAD', '', kbNoKey, cmHelpACAD, hcHelpACAD,
      NewLine(
      NewItem('Обучение', '', kbNoKey, cmBook, hcBook,
      NewLine(
      NewItem('Авторы САПР', '', kbNoKey, cmAbout, hcAbout,
    nil))))))))))),
  nil))))))));
  RezFile.Put(M, 'Меню программы');
  Dispose(M, Done);
end;

{- Процедура изготовления справочного контекста -}
procedure MakeStrings;
var
  P : PStrListMaker;
begin
  p := New(PStrListMaker, Init(32384,100));
  with p^ do
  begin
    { menu hint strings }
    Put(hcCAD, 'Работа с конструкторами');
    Put(hcNew, 'Создать новый конструктор');
    Put(hcOpen,'Загрузить конструктор');
    Put(hcSave,'Сохранить конструктор');
    Put(hcSaveAs,'Сохранить конструктор в другом файле');
    Put(hcDosShell,'Временный выход в ДОС');
    Put(hcExit,'Завершение работы с САПР');
    Put(hcData, 'Проектирование передачи');
    Put(hcInputData,'Изменение исходных данных');
    Put(hcInputQuality,'Изменение критериев качества');
    Put(hcCalculate,'Рассчитать возможные варианты');
    Put(hcInfo,'Информация о расчете');
    Put(hcRezult,'Манипулирование результатами');
    Put(hcShowAll,'Показать все варианты');
    Put(hcShowBest,'Показать лучьший вариант');
    Put(hcPlot,'Передать данные для черчения в AutoCAD');
    Put(hcPrint,'Печатать результат на принтере');
    Put(hcReport, 'Сохранить результат в текстовом файле');
    Put(hcResize, 'Изменить размеры и положение окна');
    Put(hcZoom, 'Увеличить или восстановить размеры окна');
    Put(hcNext, 'Перейти к просмотру следующего окна');
    Put(hcPrev, 'Перейти к просмотру предыдущего окна');
    Put(hcClose, 'Закрыть просматриваемое окно');
    Put(hcConfig, 'Конфигурация среды САПР');
    Put(hcACAD, 'Определить рабочую директорию AutoCAD');
    Put(hcMode, 'Переключить режим проектирования');
    Put(hcVideo, 'Переключить видеорежим (EGA и лучьше)');
    Put(hcColor, 'Изменить цвета');
    Put(hcHelp, 'Помощь для Вас');
    Put(hcFeatures, 'Что может программа');
    Put(hcPerform, 'Как работать с программой');
    Put(hcDataHelp, 'Как ввести данные для расчета');
    Put(hcOptimize, 'Как получить лучшее решение');
    Put(hcSelect, 'Как выбрать лучшее решение');
    Put(hcHelpACAD, 'Как работать с AutoCAD');
    Put(hcBook, 'Справочник проектировщика');
    Put(hcAbout, 'Информация об авторах САПР');
    Put(hcDataList, 'Перемещение - клавиши курсора, Enter - изменить');
    Put(hcQualityList, 'Перемещение - клавиши курсора, Enter - изменить');
    Put(hcOk, 'Принять значения в диалоговом окне');
    Put(hcCancel, 'Закрыть диалоговое окно не делая изменений');
    Put(hcChange, 'Изменить выбранный в списке параметр');
    Put(hcFlatStrap, 'Передача плоским прорезиненным ремнем');
    Put(hcFilmStrap, 'Передача пленочным ремнем');
    Put(hcWedgeStrap, 'Передача клиновым ремнем');
    Put(hcNarrowWedgeStrap, 'Передача узким клиновым ремнем');
    Put(hcPolyWedgeStrap, 'Передача поликлиновым ремнем');
    Put(hcCogStrap, 'Передача зубчатым ремнем');
    Put(hcRollChain, 'Передача роликовой цепью');
    Put(hcCogChain, 'Передача зубчатой цепью');
    Put(hcCilinderWheels, 'Передача цилиндрическими зубчатыми колесами');
    Put(hcConeWheels, 'Передача коническими зубчатыми колесами');
    Put(hcCherv, 'Червячная передача');
    Put(hcDesignerName, 'Имя конструктора (не более 20 символов)');
    Put(hcErrorButton, 'Нажмите ENTER...');
    Put(hcCalcProcess, 'Рассчитываю варианты...');
    Put(hcLoadProcess, 'Читаю конструктор из файла ...');
    Put(hcSaveProcess, 'Записываю файл ...');
    Put(hcPrintProcess, 'Печатаю результаты ...');
    Put(hcReadError, 'Невозможно прочитать %s');
    Put(hcWriteError, 'Невозможно записать %s');
    Put(hcPrintError, 'Невозможно напечатать %s');
  end;

  RezFile.Put(P, 'Глобальный контекст');
  Dispose(P, Done);
end;

{- Диалоговые окна для работы со списками -}
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
    '    │   X*Tn',
    '    ╞═════════╕',
    '    │        │  Tn',
    '    │    │    ╞═══════╕',
    '    │    │    │      │       Y*Tn',
    '    │    │    │   │   ╞═════════════════╕',
    '    │    │    │   │   │                │        Z*Tn',
    '    │    │    │   │   │        │        ╞═════════════════╕',
    '    │    │    │   │   │        │        │                │',
    '    │    │    │   │   │        │        │         │       │',
    '    │         │   │   │                 │                 │',
    '    │    │    │   │   │        │        │         │       │',
    '    │    │    │   │   │        │        │         │       │',
    '    │        │      │                │                │',
    '────┼─────────┴───────┼─────────────────┼─────────────────┼─────',
    '    │       i         │        j        │         k       │',
    '    │────      ─────│────      ─────│─────      ────│');

BEGIN
  R.Assign(1, 1, 65, 15);
  Dialog:=New(PListDialog, Init(R, 'Исходные данные'));
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
    New(Button, Init(R, 'Отказ', cmCancel, bfNormal));
    Button^.HelpCtx:=hcCancel;
    Insert(Button);
    R.Move(-15, 0);
    New(Button, Init(R, 'Принять', cmOk, bfNormal));
    Button^.HelpCtx:=hcOk;
    Insert(Button);
    R.Move(-15, 0);
    New(Button, Init(R, 'Изменить', cmChangeItem, bfDefault));
    Button^.HelpCtx:=hcChange;
    Insert(Button);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, 'Ввод данных');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 65, 15);
  Dialog:=New(PListDialog, Init(R, 'Критерии качества'));
  with Dialog^ do
  begin
    R.Assign(1, 1, Size.X-1, 2);
    Insert(New(PStaticText, Init(R,
    '  Параметр                    │    Мин.   │   Макс.   │  Вес')));
    R.Assign(Size.X-3, 2, Size.X-2, Size.Y-4);
    New(ScrollBar, Init(R));
    Insert(ScrollBar);
    R.Assign(2, 2, Size.X-3, Size.Y-4);
    New(UserListBox, Init(R, 1, ScrollBar));
    UserListBox^.HelpCtx:=hcQualityList;
    Insert(UserListBox);
    R.Assign(Size.X-15, Size.Y-3, Size.X-2, Size.Y-1);
    New(Button, Init(R, 'Отказ', cmCancel, bfNormal));
    Button^.HelpCtx:=hcCancel;
    Insert(Button);
    R.Move(-15, 0);
    New(Button, Init(R, 'Принять', cmOk, bfNormal));
    Button^.HelpCtx:=hcOk;
    Insert(Button);
    R.Move(-15, 0);
    New(Button, Init(R, 'Изменить', cmChangeItem, bfDefault));
    Button^.HelpCtx:=hcChange;
    Insert(Button);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, 'Ввод критериев качества');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 55, 13);
  Dialog:=New(PDialog, Init(R, ''));
  with Dialog^ do
  begin
    RLine.Assign(Size.X-15, 2, Size.X-3, 3);
    Bruce:=New(PInputReal, Init(RLine,10,0,0,2,SizeOf(float)));
    Insert(Bruce);
    RLabel.Assign(1, 2, Size.X-15, 3);
    Insert(New(PLabel, Init(RLabel, 'Минимальное значение', Bruce)));
    RLine.Move(0, 2);
    Bruce:=New(PInputReal, Init(RLine,10,0,0,2,SizeOf(float)));
    Insert(Bruce);
    RLabel.Move(0, 2);
    Insert(New(PLabel, Init(RLabel, 'Максимальное значение', Bruce)));
    RLine.Move(0, 2);
    Bruce:=New(PInputInt, Init(RLine,2,0,10,1));
    Insert(Bruce);
    RLabel.Move(0, 2);
    Insert(New(PLabel, Init(RLabel, 'Весовой коэффициент', Bruce)));

    RLabel.Assign(Size.X-18, Size.Y-3, Size.X-3, Size.Y-1);
    New(Button, Init(RLabel, 'Отказ', cmCancel, bfNormal));
    Button^.HelpCtx:=hcCancel;
    Insert(Button);
    RLabel.Move(-18, 0);
    New(Button, Init(RLabel, 'Да', cmOk, bfDefault));
    Button^.HelpCtx:=hcOk;
    Insert(Button);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, 'Ввод критериальных ограничителей');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 55, 13);
  Dialog:=New(PDialog, Init(R, 'Авторы САПР "CADTRANS"'));
  with Dialog^ do
  begin
    R.Assign(1,2,Size.X-1,Size.Y-3);
    Insert(New(PStaticText, Init(R,
        #3'Лаборатория "САПР механических передач",'+#13+
        #3'Россия, 660074, Красноярск, Киренского 26,'+#13+
        #3'Красноярский государственный технический'+#13+
        #3'университет.'+#13+
        #13+
        #3'факс: 3912, 430692; тел.: 3912, 497555'
    )));
    R.Assign(0, Size.Y-3, 15, Size.Y-1);
    Button:=New(PButton, Init(R, 'Понятно', cmOk, bfDefault));
    Button^.Options:=Button^.Options or ofCenterX;
    Insert(Button);
    Options:=Options or ofCentered;
  end;
  RezFile.Put(Dialog, 'Авторы');
  Dispose(Dialog, Done);

  R.Assign(1,1,45,11);
  Dialog:=New(PDialog,Init(R,'CADTRANS'));
  with Dialog^ do
  begin
    R.Assign(1,2,Size.X-1,Size.Y-3);
    Insert(New(PStaticText, Init(R,
    #3'Система'#13+
    #3'автоматизированного проектирования'#13+
    #3'механических передач')));
    R.Assign(1,Size.Y-3,15,Size.Y-1);
    Bruce:=New(PButton, Init(R,'Есть',cmOk,bfDefault));
    Bruce^.Options:=Bruce^.Options or ofCenterX;
    Insert(Bruce);
    Options:=Options or ofCentered;
  end;
  RezFile.Put(Dialog, 'Заставка');
  Dispose(Dialog, Done);

  Dialog:=New(PFileDialog, Init('*.CAD','Сохранение конструктора',
    'Файл с контруктором:',fdOkButton+fdHelpButton, 1));
  Dialog^.HelpCtx:=hcFileDialog;
  RezFile.Put(Dialog, 'Сохранение конструктора');
  Dispose(Dialog, Done);

  Dialog:=New(PFileDialog, Init('*.CAD','Загрузка конструктора',
    'Файл с контруктором:',fdOkButton+fdHelpButton, 1));
  Dialog^.HelpCtx:=hcFileDialog;
  RezFile.Put(Dialog, 'Загрузка конструктора');
  Dispose(Dialog, Done);

  Dialog:=New(PFileDialog, Init('*.RES','Сохранение результата',
    'Файл результата:',fdOkButton+fdHelpButton, 2));
  Dialog^.HelpCtx:=hcFileDialog;
  RezFile.Put(Dialog, 'Запись результата');
  Dispose(Dialog, Done);

  Dialog:=New(PFileDialog, Init('*.plt','Передача данных',
    'Файл данных:',fdOkButton+fdHelpButton, 3));
  Dialog^.HelpCtx:=hcFileDialog;
  RezFile.Put(Dialog, 'Передача данных');
  Dispose(Dialog, Done);

  R.Assign(1,1,79,22);
  Dialog:=New(PDialog, Init(R, 'Циклограмма нагружения'));
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
    Bruce:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);
    R.Move(0,3);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, 'Циклограмма');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 41, 10);
  New(Dialog, Init(R, 'Исходные данные'));
  with Dialog^ do
  begin
    R.Assign(2, 3, 38, 5);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Поковка',
      NewSItem('Штамповка',
      NewSItem('Прокат',
      NewSItem('Литье',
      nil))))
    ));
    Insert(Bruce);
    R.Assign(2,2,30,3);
    Insert(New(PLabel, Init(R, 'Способ получения заготовки', Bruce)));
    R.Assign(Size.X-15, Size.Y-3, Size.X-2, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-15, 0);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, 'Способ получения заготовки');
  Dispose(Dialog, Done);

  R.Assign(1, 1, 40, 9);
  New(Dialog, Init(R, 'Исходные данные'));
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
    Insert(New(PLabel, Init(R, 'Шероховатость поверхности зуба', Bruce)));
    R.Assign(Size.X-15, Size.Y-3, Size.X-2, Size.Y-1);
    Bruce:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Bruce^.HelpCtx:=hcCancel;
    Insert(Bruce);
    R.Move(-15, 0);
    Bruce:=New(PButton, Init(R, 'Принять', cmOk, bfDefault));
    Bruce^.HelpCtx:=hcOk;
    Insert(Bruce);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, 'Шероховатость зуба');
  Dispose(Dialog, Done);
END;

{- Диалоговое окно для ввода типа контсруктора -}
procedure MakeDesignerDialog;
Var
  Dialog: PDialog;
  Button: PButton;
  Bruce: PView;
  R: TRect;

BEGIN
  R.Assign(1, 1, 50, 21);
  New(Dialog, Init(R, 'Создание нового конструктора'));
  with Dialog^ do
  begin
    R.Assign(2, 3, Size.X-2, 14);
    Bruce:=New(PRadioButtons, Init(R,
      NewSItem('Плоским прорезинненым ремнем',
      NewSItem('Плоским пленочным ремнем',
      NewSItem('Клиновым ремнем',
      NewSItem('Узким клиновым ремнем',
      NewSItem('Поликлиновым ремнем',
      NewSItem('Зубчатым ремнем',
      NewSItem('Роликовой цепью',
      NewSItem('Зубчатой цепью',
      NewSItem('Цилиндрическими зубчатыми колесами',
      NewSItem('Коническими зубчатыми колесами',
      NewSItem('Червячная с цилиндрическим червяком',
      nil)))))))))))
    ));
    Bruce^.HelpCtx:=hcFlatStrap;
    Insert(Bruce);
    R.Assign(1, 2, 40, 3);
    Insert(New(PLabel, Init(R, 'Проектируемая передача', Bruce)));
    R.Assign(Size.X-24, 15, Size.X-2, 16);
    Bruce:=New(PInputLine, Init(R, 13));
    Bruce^.HelpCtx:=hcDesignerName;
    Insert(Bruce);
    R.Assign(1, 15, Size.X-25, 16);
    Insert(New(PLabel, Init(R, 'Имя конструктора', Bruce)));

    R.Assign(Size.X-15, Size.Y-3, Size.X-3, Size.Y-1);
    Button:=New(PButton, Init(R, 'Отказ', cmCancel, bfNormal));
    Button^.HelpCtx:=hcCancel;
    Insert(Button);
    R.Move(-15, 0);
    Button:=New(PButton, Init(R, 'Да', cmOk, bfDefault));
    Button^.HelpCtx:=hcOk;
    Insert(Button);
    R.Move(-15, 0);

    Options:=Options or ofCentered;
    SelectNext(False);
  end;
  RezFile.Put(Dialog, 'Ввод типа конструктора');
  Dispose(Dialog, Done);
END;

PROCEDURE MakeDesigners;
Var
  Designer: PDesigner;

BEGIN
  Designer:=New(PFlatStrapTransCAD,Init);
  RezFile.Put(Designer, 'Передача плоским прорезиненным ремнем');
  Dispose(Designer, Done);

  Designer:=New(PFilmStrapTransCAD,Init);
  RezFile.Put(Designer, 'Передача пленочным ремнем');
  Dispose(Designer, Done);

  Designer:=New(PWedgeStrapTransCAD,Init);
  RezFile.Put(Designer, 'Передача клиновым ремнем');
  Dispose(Designer, Done);

  Designer:=New(PNarrowWedgeStrapTransCAD,Init);
  RezFile.Put(Designer, 'Передача узким клиновым ремнем');
  Dispose(Designer, Done);

  Designer:=New(PPolyWedgeStrapTransCAD,Init);
  RezFile.Put(Designer, 'Передача поликлиновым ремнем');
  Dispose(Designer, Done);

  Designer:=New(PCogStrapTransCAD,Init);
  RezFile.Put(Designer, 'Передача зубчатым ремнем');
  Dispose(Designer, Done);

  Designer:=New(PRollChainTransCAD,Init);
  RezFile.Put(Designer, 'Передача роликовой цепью');
  Dispose(Designer, Done);

  Designer:=New(PCogChainTransCAD,Init);
  RezFile.Put(Designer, 'Передача зубчатой цепью');
  Dispose(Designer, Done);

  Designer:=New(PCogWheelTransCAD,Init);
  RezFile.Put(Designer, 'Передача цилиндрическими зубчатыми колесами');
  RezFile.Put(Designer, 'Червячная передача');
  Dispose(Designer, Done);

  Designer:=New(PConeCogWheelTransCAD,Init);
  RezFile.Put(Designer, 'Передача коническими зубчатыми колесами');
  Dispose(Designer, Done);

  Designer:=New(PWormWheelTransCAD,Init);
  RezFile.Put(Designer, 'Червячная передача');
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