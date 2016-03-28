unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Unit2,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, materials, constants, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    EditP1: TEdit;
    Editn1: TEdit;
    EditU: TEdit;
    EditLh: TEdit;
    CheckBox1_Revers: TCheckBox;
    CheckBox2_Nagr: TCheckBox;
    CheckBox3_Otw1: TCheckBox;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Edit_H_HRcp1: TEdit;
    ComboBoxTipCh: TComboBox;
    ComboBox_Termobr1: TComboBox;
    ComboBox_mc1: TComboBox;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ComboBox_Mc2: TComboBox;
    ComboBox_Sposob: TComboBox;
    Edit_H_HBp1: TEdit;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    ComboBox_Sigma_t2: TComboBox;
    ComboBox_Sigma_B2: TComboBox;
    TabSheet1: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EditP1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Editn1Exit(Sender: TObject);
    procedure EditUExit(Sender: TObject);
    procedure Edit_H_HRcp1Exit(Sender: TObject);
    procedure CheckBox2_NagrClick(Sender: TObject);
    procedure CheckBox3_Otw1Click(Sender: TObject);
    procedure EditP1KeyPress(Sender: TObject; var Key: Char);
    procedure EditLhExit(Sender: TObject);
    procedure Edit_H_HBp1Exit(Sender: TObject);

  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
  a:TPer;
  i: integer;
  Input,Input1:TparInput;
  Output: TParoutput;
  mascount1:integer;
  masOutput1:array of TParOutput;
  masinput1: array of Tparinput;
implementation

  const
    // Максимально допустимое значение мощности на ведущем валу, кВт
  P1Max: extended = 300;
  // Минимально допустимое значение мощности на ведущем валу, кВт
  P1Min: extended = 0.2;
  // Максимально допустимое значение передаточного числа
  UMax: extended = 8;
  // Минимально допустимое значение передаточного числа
  UMin: extended = 1;
  // Максимально допустимое значение частоты вращения ведущего шкива, об/мин
  N1Max: extended = 5000;
  // Минимально допустимое значение частоты вращения ведущего шкива, об/мин
  N1Min: extended = 1;
  // Расчетный ресурс передачи
  LhMax: integer = 100000;
  LhMin: integer = 10;
  // Твердость боковой поверхности витков червяка
  H_HRcp1max: real = 68;
  H_HRcp1min: real = 35;
  // Предел прочностм материала червячного колеса
  Sigma_B2max: real = 2000;
  Sigma_B2min: real = 100;
{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var I: Integer;
cnt: Integer;
begin
 cnt := 0;
 Input.P1 := 0.2;
 Input.N1 := 1;
 Input.U := 1;
 Input.Lh := 10;
 Input.H_HRcp1:= 35 ;
 Input.H_HBp1:= 0 ;
 Input.Sigma_B2 := 100;
 while Input.P1 <= 300 - 1 do
 begin
   Input.N1 := 1;
   Input.U := 1;
   Input.lh := 10;
   Input.H_HRcp1 := 35 ;
   Input.H_HBp1:=  0 ;
   Input.Sigma_B2 := 100;
   while Input.N1 <= 5000 - 10 do
   begin
   Input.U := 1;
   Input.lh := 10;
   H_HRcp1 := 35 ;
   H_HBp1:=  0 ;
   Sigma_B2 := 100;
     while Input.U <= 8 - 0.1 do
     begin
     Input.lh := 10;
   Input.H_HRcp1 := 35 ;
   Input.H_HBp1:=  0 ;
   Input.Sigma_B2 := 100;
     while Input.Lh <= 100000 - 1000 do
     begin
     Input.H_HRcp1 := 35 ;
   Input.H_HBp1:=  0 ;
   Input.Sigma_B2 := 100;
     while Input.H_HRcp1 <= 68 - 2 do
     begin
      Input.H_HBp1:=  0 ;
   Input.Sigma_B2 := 100;
   while Input.H_HBp1 <= 350 - 5 do
     begin
    Input.Sigma_B2 := 100;
    while Input.Sigma_B2 <= 2000 - 50 do
     begin
      // Makeversion;
      inc(cnt);
       statusbar1.Panels[0].Text := 'Количество рассчитанных передач: ' + IntToStr(Cnt);
          Refresh;
       end;
       Input.U := Input.U + 0.1;
     end;
     Input.N1 := Input.N1 + 10;
   end;
   Input.P1 := Input.P1 + 1;
 end;
Input.Lh := Input.Lh + 1000;
 end;
 Input.H_HRcp1 := Input.H_HRcp1 +2
 end;
 Input.H_HBp1 := Input.H_HBp1 + 5
 end;
  Input.Sigma_B2 := Input.Sigma_B2 + 50
end;


procedure TForm1.CheckBox2_NagrClick(Sender: TObject);
begin
if CheckBox2_Nagr.Checked then
CheckBox2_Nagr.Caption:='Типовой'
else CheckBox2_Nagr.Caption:='Циклограмма';
end;

procedure TForm1.CheckBox3_Otw1Click(Sender: TObject);
begin
if CheckBox3_Otw1.Checked then
CheckBox3_Otw1.Caption:='Стандартное'
else CheckBox3_Otw1.Caption:='Нестандартное';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
p,osh:integer;
begin
while PageControl1.PageCount>0 do PageControl1.Pages[0].Free;
Input.TipCh:=1;
val( editP1.Text,Input.p1,osh);
val( editN1.Text,Input.N1,osh);
val( editU.Text,Input.U,osh);
val( editLh.Text,Input.Lh,osh);
val( Edit_H_HRcp1.Text,Input.H_HRcp1,osh);
val( Edit_H_HBp1.Text,Input.H_HBp1,osh);
Input.mc1:=ComboBox_mc1.Text;
Input.mc2:=ComboBox_mc2.Text;
Input.Sigma_t2 := StrToFloat(ComboBox_Sigma_t2.Text);
Input.Sigma_b2 := StrToFloat(ComboBox_Sigma_b2.Text);
if ComboBox_Termobr1.Text='AUTO' then
Input.Termobr1:=0;        {1 .. 8 }
if ComboBox_Termobr1.Text='Улучшение' then
Input.Termobr1:=1;
if ComboBox_Termobr1.Text='Нормализация' then
Input.Termobr1:=2;
if ComboBox_Termobr1.Text='Объемная закалка' then
Input.Termobr1:=3;
if ComboBox_Termobr1.Text='Эакалка ТВЧ' then
Input.Termobr1:=4;
if ComboBox_Termobr1.Text='Цементация' then
Input.Termobr1:=5;
if ComboBox_Termobr1.Text='Нитроцементация' then
Input.Termobr1:=6;
if ComboBox_Termobr1.Text='Азотирование' then
Input.Termobr1:=7;
if ComboBox_Termobr1.Text='Отжиг' then
Input.Termobr1:=8;
if ComboBoxTipCh.Text='Архимедов червяк' then
input.TipCh:=1;
if ComboBoxTipCh.Text='Эвольвентный червяк' then
input.TipCh:=2;
if ComboBoxTipCh.Text='Конволютный червяк' then
input.TipCh:=3;
Input.Reverse:=CheckBox1_Revers.Checked;
if CheckBox2_Nagr.Checked then
Input.nagr:=False;
if CheckBox3_Otw1.Checked then
Input.otw1:=true;
if ComboBox_Sposob.Text = 'Центробежный' then
Input.Sposob:=1;
if ComboBox_Sposob.Text = 'В кокиль' then
Input.Sposob:=2;
Input.DeltaU:=2;
Input.Ka:=1;
Input.WheelGroup:='2';
  Input.Loading.GraphBar := 0;
 // Input.WormProcComp := 48;
  with Input.Loading do
  begin
    x := 2;
    y := 0.3;
    z := 0.2;
    i := 0.6;
    j := 0.2;
    k := 0.2;
  end;
//  Input.P1 := 10; { 0.2..300 }
// Input.n1 := 750; { 1 .. 5000 об/мин }
//  Input.U := 3; { 1 .. 8 }
//  Input.DeltaU := 2;
//  Input.H_HBp1 := 200; { 0..350 }
//  Input.H_HRcp1 := 48; { 35 .. 68 }
//  Input.Sigma_B2 := 200; { 100 .. 2000 МПа }
//  Input.Sigma_T2 := 800; { 100 .. 2000 МПа }
//  Input.mc1 := '18ХГТ ГОСТ 4543-71';
//  Input.mc2 := 'AUTO';
// Input.Termobr1 := 3; { 1 .. 8 }
//  Input.Lh := 6300; { 10 ... 100000 ч }
//  Input.Ka := 1.0;
//  Input.Nagr := False;
//  Input.Sposob := 1;
//  Input.Reverse := False;
//  Input.otw1 := True;
//  Input.WheelGroup := '2';


a.MakeVersionss(Input);

 ShowMessage('Всего вариантов =   '+inttostr(mascount));
 SetLength(masOutput1,mascount);
 SetLength(masInput1,mascount);
 for I := 0 to mascount-1 do
 begin
 Unit2.MasOutputOnForm(i,output,input1);
  masOutput1[i]:=output;
   masInput1[i]:=Input1;
  // Создаем первую страницу и связываем ее с PageControl
  TabSheet1 := TTabSheet.Create(Self);
  TabSheet1.Caption := 'Вариант'+inttostr(i+1);
  TabSheet1.PageControl := PageControl1;
  // Создаем первую страницу
  with Tmemo.Create(Self) do
  begin
    width:=465;
    Height:=717;
    Parent := TabSheet1;
    ScrollBars:=ssVertical;

   Lines.Append('       1. Исходные данные');
   Lines.Append('Мощность на ведущем валу, кВт                  '+ FloatToStr(input.P1));
   Lines.Append('Частота вращения шестерни, об/мин           '+ FloatToStr(Input.N1));
   Lines.Append('Проектное передаточное число                    '+ FloatToStr(Input.u));
   Lines.Append('Расчетный срок службы, час                         '+ FloatToStr(Input.Lh));
   Lines.Append('Тип червяка                                                     '+ FloatToStr(Input.TipCh));
   Lines.Append('Материал червяка                                          '+ (Input.mc1));
   Lines.Append('Термообработка червяка                               '+ FloatToStr(Input.Termobr1));
   Lines.Append('Материал венца колеса                                 '+ (Input.mc2));
   Lines.Append('Способ отливки венца колеса                       '+ FloatToStr(Input.Sposob));
   Lines.Append('');
   Lines.Append('       2.Кинематические параметры');
   Lines.Append('Фактическое передаточное число                '+ FloatToStr(Output.Uf));
   Lines.Append('Частота вращения колеса, об/мин                '+ FloatToStr(Output.n2));
   Lines.Append('Линейная скорость, м/с                                  '+ FloatToStr(Output.Vs));
   Lines.Append('К.П.Д. передачи, %                                       '+ FloatToStr(Output.Kpd));
   Lines.Append('');
   Lines.Append('       3.Параметры передачи');
   Lines.Append('Нормальный модуль, мм                                 '+ FloatToStr(Output.M));
   Lines.Append('Межосевое расстояние передачи, мм          '+ FloatToStr(Output.Aw));
   Lines.Append('Число заходов червяка                                 '+ FloatToStr(Output.z1));
   Lines.Append('Число зубьев колеса                                     '+ FloatToStr(Output.z2));
   Lines.Append('Коэфф. делительного диаметра червяка   '+ FloatToStr(Output.Q)) ;
   Lines.Append('Коэфф. смещения исх. контура колеса       '+ FloatToStr(Output.x1));
   Lines.Append('Степень точности                                          '+ FloatToStr(Output.St));
   Lines.Append('');
   Lines.Append('       4.Геометрические размеры');
   Lines.Append('Делительный диаметр червяка, мм                '+ FloatToStr(Output.d1));
   Lines.Append('Начальный диаметр червяка, мм                    '+ FloatToStr(Output.dw1));
   Lines.Append('Диаметр окружности впадин червяка,мм      '+ FloatToStr(Output.df1));
   Lines.Append('Диаметр окружности вершин червяка,мм      '+ FloatToStr(Output.da1));
   Lines.Append('Длина нарезаемой части червяка, мм            '+ FloatToStr(Output.B1));
   Lines.Append('Угол подъема по делит. диаметру                 '+ FloatToStr(Output.Gamma));
   Lines.Append('Угол подъема по нач. диаметру                     '+ FloatToStr(Output.GammaW));
   Lines.Append('Осевой шаг, мм                                                 '+ FloatToStr(Output.P_1));
   Lines.Append('Нормальная толщина витка, мм                     '+ FloatToStr(Output.Sna1));
   Lines.Append('Измерительная высота для нее, мм               '+ FloatToStr(Output.Ha1));
   Lines.Append('Делительный диаметр колеса, мм                 '+ FloatToStr(Output.d2));
   Lines.Append('Диаметр окружности вершин колеса, мм      '+ FloatToStr(Output.da2));
   Lines.Append('Наибольший диаметр колеса, мм                  '+ FloatToStr(Output.dam2));
   Lines.Append('Диаметр окружности впадин колеса, мм      '+ FloatToStr(Output.df2));
   Lines.Append('Ширина венца колеса, мм                               '+ FloatToStr(Output.B2));
   Lines.Append('Радиус выемки венца колеса, мм                  '+ FloatToStr(Output.Ra));
   Lines.Append('Радиус по впадинам колеса, мм                     '+ FloatToStr(Output.Rf));
   Lines.Append('Радиус закругления зуба колеса, мм             '+ FloatToStr(Output.Rof1));
   Lines.Append('Диаметр измерительного ролика, мм            '+ FloatToStr(Output.d_p));
   Lines.Append('Размер по роликам, мм                                    '+ FloatToStr(Output.M1));
   Lines.Append('Нормальная толщина зуба, мм                    '+ FloatToStr(Output.Sna2));
   Lines.Append('Измерительная высота для нее, мм               '+ FloatToStr(Output.Ha2));
   Lines.Append('');
   Lines.Append('       6.Прочностные и силовые параметры ');
   Lines.Append('Момент на быстроходном валу, Нм                '+ FloatToStr(Output.T1));
   Lines.Append('Момент на тихоходном валу, Нм                  '+ Floattostr(Output.T2));
   Lines.Append('Окружное усилие червяка, Н                     '+ FloatToStr(Output.Ft1));
   Lines.Append('Радиальное усилие червяка, Н                   '+ FloatToStr(Output.Fr1));
   Lines.Append('Осевое усилие червяка, Н                       '+ FloatToStr(Output.Fx1));
   Lines.Append('Окружное усилие колеса, Н                      '+ FloatToStr(Output.Ft2));
   Lines.Append('Радиальное усилие колеса,                      '+ FloatToStr(Output.Fr2));
   Lines.Append('Осевое усилие колеса, Н                        '+ FloatToStr(Output.Fx2));
   Lines.Append('Контактное напряжение, Мпа                     '+ FloatToStr(Output.Sigma_H));
   Lines.Append('Допускаемое контактное напряжение              '+ FloatToStr(Output.Sigma_Hp));
end;
end;
end;


procedure TForm1.EditLhExit(Sender: TObject);
var osh:integer;//код ошибки
begin
val( editlh.Text,Input.lh,osh);
if osh<>0 then
 ShowMessage('Введено не верное значение')
 else a.Lh:=Input.Lh;
end;

procedure TForm1.Editn1Exit(Sender: TObject);
var osh:integer;//код ошибки
begin
val( editn1.Text,Input.n1,osh);
if osh<>0 then
 ShowMessage('Введено не верное значение')
 else a.N1:=Input.n1;
end;

procedure TForm1.EditP1Exit(Sender: TObject);
var osh:integer;//код ошибки
begin
val( editP1.Text,Input.p1,osh);
if osh<>0 then
 ShowMessage('Введено не верное значение')
 else a.P1:=Input.P1;
end;
procedure TForm1.EditP1KeyPress(Sender: TObject; var Key: Char);
var I: Integer;
begin
  if not (key in ['0'..'9','.',#8]) then key:=#0;
  for I := 1 to Length((Sender as TEdit).Text) do
    if ((key='.') and ((Sender as TEdit).Text[i]='.')) then key:=#0;
end;

procedure TForm1.EditUExit(Sender: TObject);
var osh:integer;//код ошибки
begin
val( editU.Text,Input.u,osh);
if osh<>0 then
 ShowMessage('Введено не верное значение')
 else a.u:=Input.u;
end;

procedure TForm1.Edit_H_HBp1Exit(Sender: TObject);
var osh:integer;//код ошибки
begin
val( edit_H_Hbp1.Text,Input.H_Hbp1,osh);
if osh<>0 then
ShowMessage('Введено не верное значение')
else a.H_Hbp1:=Input.H_Hbp1;
end;

procedure TForm1.Edit_H_HRcp1Exit(Sender: TObject);
var osh:integer;//код ошибки
begin
val( edit_H_Hrcp1.Text,Input.H_Hrcp1,osh);
if osh<>0 then
 ShowMessage('Введено не верное значение')
 else a.H_Hrcp1:=Input.H_Hrcp1;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
Repaint;
end;

procedure TForm1.FormShow(Sender: TObject);
var i: integer;
begin
a := Tper.create;
for I := 1 to 24 do
ComboBox_mc1.Items.Add(marka[i]);
ComboBox_mc1.Text:='45 ГОСТ 1050-74';
for I := 1 to 24 do
ComboBox_mc2.Items.Add(marka[i]);
ComboBox_mc2.Text:='45 ГОСТ 1050-74';
for I := 0 to 3 do
ComboBox_Termobr1.Items.Add(HandleStr[i]);
ComboBox_Termobr1.Text:='Цементация';
for I := 0 to 2 do
ComboBoxTipCh.Items.Add(TipsCh[i]);
ComboBoxTipCh.Text:='Архимедов червяк';
for I := 0 to 1 do
ComboBox_Sposob.Items.Add(Sposobs[i]);
ComboBox_Sposob.Text:='Центробежный';
for i := low(Sigma_ta) to High(Sigma_ta) do
  begin
    ComboBox_Sigma_b2.Items.Add(FloatToStr(Sigma_ta[i]));
    ComboBox_Sigma_t2.Items.Add(FloatToStr(Sigma_ta[i]));
  end;
  ComboBox_Sigma_b2.ItemIndex:=Low(Sigma_ta)+3;
  ComboBox_Sigma_t2.ItemIndex:=Low(Sigma_ta)+3;
end;

end.



