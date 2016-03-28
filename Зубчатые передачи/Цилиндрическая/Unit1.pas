unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CALCULAT008, Vcl.Samples.Spin, Vcl.ComCtrls, Grids,
  Materials, Unit2, constants, unit4, unit6, unit5;

// type
// PDBFile = ^TDBFile;
// TDBFile = object(TObject)
// HeaderLen: word;
// RecordLen: word;
// CurrentRec: longint;
// end;
type
  // PCogWheelTransCAD = ^TCogWheelTransCAD;
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    EditP1: TEdit;
    Label2: TLabel;
    EditN1: TEdit;
    Label3: TLabel;
    EditU: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Label9: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    Label13: TLabel;
    Label14: TLabel;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    Label15: TLabel;
    Label16: TLabel;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    CheckBox1: TCheckBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    CheckBox3: TCheckBox;
    Label23: TLabel;
    CheckBox4: TCheckBox;
    Label24: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    CheckBox2: TCheckBox;
    PageControl1: TPageControl;
    StatusBar1: TStatusBar;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    ButtonTipz: TButton;
    ButtonNom_Sx: TButton;
    SpinEditZw: TSpinEdit;
    ComboBox5: TComboBox;
    Label26: TLabel;
    Edit5: TEdit;
    ComboBox6: TComboBox;
    ComboBox13: TComboBox;
    TabSheet1: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure ButtonTipzClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure EditP1Exit(Sender: TObject);
    procedure EditN1Exit(Sender: TObject);
    procedure EditUExit(Sender: TObject);
    procedure Editp1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SpinEditZwExit(Sender: TObject);
    procedure EditUKeyPress(Sender: TObject; var Key: Char);
    procedure EditUClick(Sender: TObject);
    procedure ButtonNom_SxClick(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Click(Sender: TObject);

  private
    { Private declarations }
  public
    // procedure  picat;
    { Public declarations }
  end;

var
  clas: CalculateCWheel;
  FChild: TForm2;
  FChild1: TForm4;
  FChild2: TForm5;
  mascount1, oo: integer;
  masOutput1: array of TMyOutput;
  masInput1: array of TMyInput;
  Form1: TForm1;
  FileName: string;
  i, k: integer;
  // MaterialsDB: PDBFile;
  Input, Input1: TMyInput;
  Output: TMyOutput;
  // Loading:TLoading;
  // P1,               {��������, ������������ ������������ �����}
  // n1,               {������� �������� ������������� ����}
  // U:real;           {������������ ����� ��������}
  // DeltaU: byte;
  // Lh:longint;          {��������� ������ ��������}
  // Tipz:word;        {��� ������ �����: 1 - ������
  // 2 - �����
  // 3 - ���������
  // 0 - ���������}
  // betg:byte;        {���� ������� ���� � ��������;
  // ��� Tipz= 0 ���������� �����������
  // ���������� �� ��������� 0, 10, 25 }
  // kanavka: word;    {��� ��������� ����� ��� ������� ������� = 1,
  // ��� ���������� ������� =0}
  // mc1:TSteelMark;   {����� ����� ��� ��������}   {????????????????}
  // mc2:TSteelMark;   {����� ����� ��� ������}     {??????????????????}
  // Termobr1,         {�������������� ���� ��������, �����}
  // Termobr2:byte;    {�������������� ���� ������, �����}
  // ImprovStrength: array [1..2] of boolean;
  // Zagotowka:TTwoWord;
  // {������ ��������� ��������� �������� � ������
  // = 1 ��� �������
  // = 2 ��� ���������
  // = 3 ��� �������
  // = 4 ��� �������  }
  // Ra1,              {������������� ������� ����������� ���� ��������}
  // Ra2:word;         {������������� ������� ����������� ���� ������}
  // Wikrugka:TTwoWord;
  // {�������� ��������� �������� ����
  // = 0 �������� ��������������� ��� ���������
  // = 1 ��� ����������� ��������}
  //
  // Nom_sx: byte;     {����� ����� ������������ �����}
  // Zw:byte;          {����� ����� ����������� � ����������-
  // ��� �������� � ���������}
  // Psi_ba:real;      {���������� ������ �����,
  // ��� ������������� �������� �������� �� ������������
  // ���� � ����������� �� ����� ��������;
  // ��� ����� ��������� ���������� �����������
  // ���������� ����� � ����������� �� ����� ��������}
  // Nagr,             {=1 ��� �������� ������,
  // = 0 ��� �����������}
  // rewers:boolean;   {��� �������������� = 1;
  // ��� �������������� = 0}
  // Ka:real;          {����������� ������� ��������}
  // otw1:boolean;     {��� ����������� ��������� ���������� = 'Y',
  // ��� ������������� ��������� ���������� ='n'}
  // BISTR:boolean;    { "0", ���� �������� �������� ���������� ��������}
  // { "1", ���� �������� �������� ������������ ��������}
  // motw:TTwoWord;
  // {����� �����������:
  // 1   ��� ��������� ��������
  // 0   ��� ��������� ������
  // 2   ��� ��������� ������ ���������}
  // H_HRcs1,          {��������� ���������� ���� �������� �� ��������}
  // H_HRcs2,          {��������� ���������� ���� ������ �� ��������}
  // H_HRcp1,          {��������� ����������� ���� �������� �� ��������}
  // H_HRcp2,          {��������� ����������� ���� ������ �� ��������}
  // H_HBs1,           {��������� ���������� ���� �������� �� �������}
  // H_HBs2,           {��������� ���������� ���� ������ �� �������}
  // H_HBp1,           {��������� ����������� ���� �������� �� �������}
  // H_HBp2,           {��������� ����������� ���� ������ �� �������}
  // H_HVs1,           {��������� ���������� ���� �������� �� ��������}
  // H_HVs2,           {��������� ���������� ���� ������ �� ��������}
  // H_HVp1,           {��������� ����������� ���� �������� �� ��������}
  // H_HVp2 : integer; {��������� ����������� ���� ������ �� ��������}
  // S_f1,             { ����������� ������������ �� ������ ��� ��������}
  // S_f2,             { ����������� ������������ �� ������ ��� ������}
  // Y_d1,             {����������� ��������������� ���������� ��� ��������}
  // Y_d2,             {����������� ��������������� ���������� ��� ������}
  // Y_g1,             {�����������, ����������� ����������  ��� ��������}
  // Y_g2 : real;      {�����������, ����������� ����������  ��� ������}
  // Sigma_t1,         {������ ��������� ��������� ��������}
  // Sigma_t2,         {������ ��������� ��������� ������}
  // Sigma_Flim01,     {������ ������������ �� ������ ��� ��������}
  // Sigma_Flim02,     {������ ������������ �� ������ ��� ������}
  // Sigma_Fst01,      {���������� ���������� ��� ��������}
  // Sigma_Fst02: real; {���������� ���������� ��� ������}
  // Mn: real;                {���������� ������ }
  // {-------------------------------------------------------------------}
  // {--------------------- �������� �������� ---------------------------------}
  // Massa,                   {��������� ����� �������� �����}
  // V_p,                     {����� ���������� ���������}
  // B1,
  // aw,                      {��������� ���������� ��������}
  // Da2: real;
  // {-------------------------------------------------------------------------}
  // b2: real;                {������ �����}
  // z1, z2 : word;           {����� ������}
  // St : integer;            {������� ��������}
  // Fv : real ;              {��������� �������� �� ���}
  // epsias:real;             {��������� �-� ����������}
  // alfatw:Real;             {���� ���������� �������� �����}
  // Uf,                      {����������� ������������ ����� ��������}
  // n2 : real;               {������� �������� ������}
  // V : real;                 { ��������, �/�}
  // Da1,                {������� ���������� ������ }
  // d1,  d2,                 {����������� �������}
  // x1,  x2:real;            {����������� �������� ��������� �������}
  // Dw1,                      {��������� ������� }
  // Df1,                      {������� ���������� ������ }
  // Dw2,                      {��������� ������� }
  // Df2,                      {������� ���������� ������ }
  // Bet: real;
  // Sigma_H,                  {���������� ���������� }
  // T1,                     {������, ������������ ������������ �����}
  // T2,                     {������, ������������ ���������� �����}
  // Ft1,                      { �������� ������   }
  // Fr1,                      {���������� ������}
  // Fx1,                      {������ ������  }
  // Ft2,                      { �������� ������}
  // Fr2,                      { ���������� ������}
  //
  //
  // Fx2 : real;
  // Sigma_F1,                 {���������� ������ � ���� ��������}
  // Sigma_F2,                 {���������� ������ � ���� ������}
  // Sigma_Fp1,
  // Sigma_Fp2,               {����������� ���������� ������ }
  // Sigma_Hp :real;          {����������� ���������� ����������}
  f: TextFile;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Error: byte;
  p, osh: integer;
begin
  while PageControl1.PageCount > 0 do
    PageControl1.Pages[0].Free;
  Input.TipZ := 1;
  val(EditP1.Text, Input.p1, osh);
  val(EditN1.Text, Input.N1, osh);
  val(EditU.Text, Input.U, osh);
  val(Edit4.Text, Input.Lh, osh);
  Input.mc1 := ComboBox1.Text;
  if ComboBox2.Text = 'AUTO' then
    Input.Termobr1 := 0; { 1 .. 8 }
  if ComboBox2.Text = '���������' then
    Input.Termobr1 := 1;
  if ComboBox2.Text = '������������' then
    Input.Termobr1 := 2;
  if ComboBox2.Text = '�������� �������' then
    Input.Termobr1 := 3;
  if ComboBox2.Text = '������� ���' then
    Input.Termobr1 := 4;
  if ComboBox2.Text = '����������' then
    Input.Termobr1 := 5;
  if ComboBox2.Text = '���������������' then
    Input.Termobr1 := 6;
  if ComboBox2.Text = '������������' then
    Input.Termobr1 := 7;
  if ComboBox2.Text = '�����' then
    Input.Termobr1 := 8;
  Input.mc2 := ComboBox3.Text;
  if ComboBox4.Text = 'AUTO' then
    Input.Termobr2 := 0; { 1 .. 8 }
  if ComboBox4.Text = '���������' then
    Input.Termobr2 := 1;
  if ComboBox4.Text = '������������' then
    Input.Termobr2 := 2;
  if ComboBox4.Text = '�������� �������' then
    Input.Termobr2 := 3;
  if ComboBox4.Text = '������� ���' then
    Input.Termobr2 := 4;
  if ComboBox4.Text = '����������' then
    Input.Termobr2 := 5;
  if ComboBox4.Text = '���������������' then
    Input.Termobr2 := 6;
  if ComboBox4.Text = '������������' then
    Input.Termobr2 := 7;
  if ComboBox4.Text = '�����' then
    Input.Termobr1 := 8;
  Input.ImprovStrength[1] := CheckBox5.Checked; { TODO : �������� � ������ }
  Input.ImprovStrength[2] := CheckBox6.Checked;
  if ComboBox7.Text = 'Ra1.6' then
    Input.Ra1 := 0;
  if ComboBox7.Text = 'Ra3.2' then
    Input.Ra1 := 1;
  if ComboBox7.Text = 'Ra6.3' then
    Input.Ra1 := 2;
  if ComboBox8.Text = 'Ra1.6' then
    Input.Ra2 := 0;
  if ComboBox8.Text = 'Ra3.2' then
    Input.Ra2 := 1;
  if ComboBox8.Text = 'Ra6.3' then
    Input.Ra2 := 2;
  if ComboBox9.Text = '�������' then
    Input.Zagotowka[1] := 1;
  if ComboBox9.Text = '���������' then
    Input.Zagotowka[1] := 2;
  if ComboBox9.Text = '������' then
    Input.Zagotowka[1] := 3;
  if ComboBox9.Text = '�������' then
    Input.Zagotowka[1] := 4;
  if ComboBox10.Text = '�������' then
    Input.Zagotowka[2] := 1;
  if ComboBox10.Text = '���������' then
    Input.Zagotowka[2] := 2;
  if ComboBox10.Text = '������' then
    Input.Zagotowka[2] := 3;
  if ComboBox10.Text = '�������' then
    Input.Zagotowka[2] := 4;
  if ComboBox11.Text = '������������' then
    Input.motw[1] := 0;
  if ComboBox11.Text = '����������' then
    Input.motw[1] := 1;
  if ComboBox11.Text = '�����������' then
    Input.motw[1] := 2;
  if ComboBox12.Text = '������������' then
    Input.motw[2] := 0;
  if ComboBox12.Text = '����������' then
    Input.motw[2] := 1;
  if ComboBox12.Text = '�����������' then
    Input.motw[2] := 2;
  Input.Bistr := CheckBox1.Checked;
  if oo = 1 then
  begin
    Input.TipZ := FChild.RadioGroup1.ItemIndex;
    val(FChild.EditBetg.Text, Input.Betg, osh);
    if FChild.CheckBox1.Checked then
      Input.Kanavka := 1
    else
      Input.Kanavka := 0;
  end
  else
    Input.TipZ := 1;
  Input.Zw := SpinEditZw.Value;
  Input.Rewers := CheckBox3.Checked;
  val(Edit5.Text, Input.Ka, osh);
  Input.otw1 := CheckBox2.Checked;
  if ((ComboBox6.Text = '�����') or (ComboBox6.Text = '������ ������')) then
    Input.Wikrugka[1] := 0
  else
    Input.Wikrugka[1] := 1;
  if ((ComboBox6.Text = '�����') or (ComboBox6.Text = '������ ������')) then
    Input.Wikrugka[2] := 0
  else
    Input.Wikrugka[2] := 1;

  Input.nagr := False;
  Input.Loading.GraphBar := 0;
  with Input.Loading do
  begin
    x := 2;
    y := 0.3;
    z := 0.2;
    i := 0.6;
    j := 0.2;
    k := 0.2;
  end;

  // Input.DeltaU:=2;
  Output.mn := 0;
  Input.Nom_Sx := strtoint(ButtonNom_Sx.Caption);
  // Input.p1:=10;    { 0.2..300  }
  // Input.N1:=750;       { 1 .. 5000 ��/��� }
  // Input.U:=3.58;       { 1 .. 8 }
  // Input.mc1:='45 ���� 1050-74';
  // Input.mc2:='45 ���� 1050-74';
  // Input.Termobr1:=2;        {1 .. 8 }
  // Input.Termobr2:=2;        {1 .. 8 }
  // ImprovStrength[1]:=False;
  // ImprovStrength[2]:=False;
  // Input.Lh:=6300;           {10 ... 100000 �}
  // Input.Betg:=0;            { 0 .. 45}
  // Input.Kanavka:=0;
  // Input.Ka:=1.0;
  // Input.Wikrugka[1]:=0;
  // Input.Wikrugka[2]:=0;
  // Input.Ra1:=2;
  // Input.Ra2:=2;
  // Input.Zw:=1;
  // Input.TipZ:=1;
  // Input.Rewers:=False;
  // Input.Bistr:=True;
  // Input.Zagotowka[1]:=1;
  // Input.Zagotowka[2]:=1;
  // val( edit5.Text,Input.Nom_Sx,osh);
  // Input.motw[1] := 0;
  // Input.motw[2] := 0;
  // Input.otw1 := True;
  // MaterialsDB:=nil;
  clas.MakeVersionss(Input);
  ShowMessage('����� ��������� =   ' + inttostr(mascount));
  SetLength(masOutput1, mascount);
  SetLength(masInput1, mascount);
  for i := 0 to mascount - 1 do
  begin
    CALCULAT008.MasOutputOnForm(i, Output, Input1);
    masOutput1[i] := Output;
    masInput1[i] := Input1;
    // ������� ������ �������� � ��������� �� � PageControl
    TabSheet1 := TTabSheet.Create(Self);
    TabSheet1.Caption := '�������' + inttostr(i + 1);
    TabSheet1.PageControl := PageControl1;
    // ������� ������ ��������
    with Tmemo.Create(Self) do
    begin
      width := 465;
      Height := 717;
      Parent := TabSheet1;
      ScrollBars := ssVertical;
      Lines.Append('         �������� ������');
      Lines.Append('�������� �� ������� ����, ���  ' + floattostr(Input1.p1));
      Lines.Append('������� �������� ��������, ��/���  ' +
        floattostr(Input1.N1));
      Lines.Append('��������� ������������ �����  ' + floattostr(Input1.U));
      Lines.Append('��������� ���� ������, ���  ' + floattostr(Input1.Lh));
      Lines.Append('�������� ��������  ' + (Input1.mc1));
      Lines.Append('�������������� �������� ' + (HandleStr[Input1.Termobr1]));
      Lines.Append('�������� ������  ' + (Input1.mc2));
      Lines.Append('�������������� ������  ' + (HandleStr[Input1.Termobr2]));
      Lines.Append('��������� ��������  ' + floattostr(Input1.Zagotowka[1]));
      Lines.Append('��������� ������  ' + floattostr(Input1.Zagotowka[2]));
      Lines.Append('��������� �������� ��������  ' +
        floattostr(Input1.Wikrugka[1]));
      Lines.Append('��������� �������� ������ ' +
        floattostr(Input1.Wikrugka[2]));
      Lines.Append('��� ������  ' + (CogType[Input1.TipZ]));
      Lines.Append('���������� ���������� ��������  ' +
        floattostr(Input1.motw[1]));
      Lines.Append('���������� ���������� ������ ' +
        floattostr(Input1.motw[2]));

      Lines.Append('   ');

      Lines.Append('         �������������� ���������');
      Lines.Append('����������� ������������ ����� ��������  ' +
        floattostr(Output.Uf));
      Lines.Append('������� �������� ������������� ����  ' +
        floattostr(Input.N1));
      Lines.Append('������� �������� ������  ' + floattostr(Output.n2));
      Lines.Append('��������, �/�}  ' + floattostr(Output.V));
      Lines.Append('   ');
      Lines.Append('         ��������� ��������');
      Lines.Append('���������� ������ ' + floattostr(Output.mn));
      Lines.Append('��������� ���������� ��������  ' + floattostr(Output.aw));
      Lines.Append('���� ������� ���� � ��������  ' + floattostr(Input.Betg));
      Lines.Append('������� ��������   ' + inttostr(Output.St));
      Lines.Append('��������� �-� ����������  ' + floattostr(Output.epsias));
      Lines.Append('���� ���������� �������� �����  ' +
        floattostr(Output.alfatw * 180 / Pi));
      Lines.Append('����� ������ ������  ' + inttostr(Output.z2));
      Lines.Append('����� ������ ��������  ' + inttostr(Output.z1));
      Lines.Append('����������� �������� ��������� ������� ������  ' +
        floattostr(Output.x2));
      Lines.Append('����������� �������� ��������� �������  �������� ' +
        floattostr(Output.x1));
      Lines.Append('    ');
      Lines.Append('          ������� �����');
      Lines.Append('������� ���������� ������ ��������  ' +
        floattostr(Output.Da1));
      Lines.Append('����������� ������� ��������  ' + floattostr(Output.d1));
      Lines.Append('��������� ������� ��������  ' + floattostr(Output.Dw1));
      Lines.Append('������� ���������� ������ �������� ' +
        floattostr(Output.Df1));
      Lines.Append('������ ����� �������� ' + floattostr(Output.B1));

      Lines.Append('������� ���������� ������  ������ ' +
        floattostr(Output.Da2));
      Lines.Append('����������� ������� ������  ' + floattostr(Output.d2));
      Lines.Append('��������� ������� ������  ' + floattostr(Output.Dw2));
      Lines.Append('������� ���������� ������ ������ ' +
        floattostr(Output.Df2));
      Lines.Append('������ ����� ������ ' + floattostr(Output.B2));

      Lines.Append('    ');
      Lines.Append('            ����������� � ������� ���������');
      Lines.Append('���������� ����������  ' + floattostr(Output.Sigma_H));
      Lines.Append('������, ������������ ������������ �����  ' +
        floattostr(Output.T1));
      Lines.Append('������, ������������ ���������� �����  ' +
        floattostr(Output.T2));
      Lines.Append('��������� �������� �� ���  ' + floattostr(Output.Fv));
      Lines.Append('�������� ������ �������� ' + floattostr(Output.Ft2));
      Lines.Append('���������� ������ �������� ' + floattostr(Output.Fr2));
      Lines.Append('������ ������ �������� ' + floattostr(Output.Fx2));
      Lines.Append('�������� ������ ������   ' + floattostr(Output.Ft1));
      Lines.Append('���������� ������ ������  ' + floattostr(Output.Fr1));
      Lines.Append('������ ������ ������  ' + floattostr(Output.Fx1));
    end;
  end;
{$REGION '��������'}
  // memo1.Lines.Append('         �������������� ���������');
  // memo1.Lines.Append('����������� ������������ ����� ��������  '+floattostr(Output.Uf));
  // memo1.Lines.Append('������� �������� ������������� ����  '+floattostr(Input.N1));
  // memo1.Lines.Append('������� �������� ������  '+floattostr(Output.n2));
  // memo1.Lines.Append('��������, �/�}  '+floattostr(Output.V));
  // memo1.Lines.Append('   ');
  // memo1.Lines.Append('         ��������� ��������');
  // memo1.Lines.Append('���������� ������ '+floattostr(Output.Mn));
  // memo1.Lines.Append('��������� ���������� ��������  '+floattostr(Output.aw));
  // memo1.Lines.Append('���� ������� ���� � ��������  '+floattostr(Input.betg));
  // memo1.Lines.Append('������� ��������   '+inttostr(Output.St));
  // memo1.Lines.Append('��������� �-� ����������  '+floattostr(Output.epsias));
  // memo1.Lines.Append('���� ���������� �������� �����  '+floattostr(Output.alfatw));
  // memo1.Lines.Append('����� ������ ������  '+inttostr(Output.z2));
  // memo1.Lines.Append('����� ������ ��������  '+inttostr(Output.z1));
  // memo1.Lines.Append('����������� �������� ��������� ������� ������  '+floattostr(Output.x2));
  // memo1.Lines.Append('����������� �������� ��������� �������  �������� '+floattostr(Output.x1));
  // memo1.Lines.Append('    ');
  // memo1.Lines.Append('          ������� �����');
  // memo1.Lines.Append('������� ���������� ������ ��������  '+floattostr(Output.Da1));
  // memo1.Lines.Append('����������� ������� ��������  '+floattostr(Output.d1));
  // memo1.Lines.Append('��������� ������� ��������  '+floattostr(Output.Dw1));
  // memo1.Lines.Append('������� ���������� ������ �������� '+floattostr(Output.Df1));
  // memo1.Lines.Append('������ ����� �������� '+floattostr(Output.B1));
  //
  // memo1.Lines.Append('������� ���������� ������  ������ '+floattostr(Output.Da2));
  // memo1.Lines.Append('����������� ������� ������  '+floattostr(Output.d2));
  // memo1.Lines.Append('��������� ������� ������  '+floattostr(Output.Dw2));
  // memo1.Lines.Append('������� ���������� ������ ������ '+floattostr(Output.Df2));
  // memo1.Lines.Append('������ ����� ������ '+floattostr(Output.B2));
  //
  // memo1.Lines.Append('    ');
  // memo1.Lines.Append('            ����������� � ������� ���������');
  // memo1.Lines.Append('���������� ����������  '+floattostr(Output.Sigma_H));
  // memo1.Lines.Append('������, ������������ ������������ �����  '+floattostr(Output.T1));
  // memo1.Lines.Append('������, ������������ ���������� �����  '+floattostr(Output.T2));
  // memo1.Lines.Append('��������� �������� �� ���  '+floattostr(Output.Fv));
  // memo1.Lines.Append('�������� ������ �������� '+floattostr(Output.Ft2));
  // memo1.Lines.Append('���������� ������ �������� '+floattostr(Output.Fr2));
  // memo1.Lines.Append('������ ������ �������� '+floattostr(Output.Fx2));
  // memo1.Lines.Append('�������� ������ ������   '+floattostr(Output.Ft1));
  // memo1.Lines.Append('���������� ������ ������  '+floattostr(Output.Fr1));
  // memo1.Lines.Append('������ ������ ������  '+floattostr(Output.Fx1));
{$ENDREGION }
end;

procedure TForm1.ButtonNom_SxClick(Sender: TObject);
begin
  FChild2 := TForm5.Create(Self);
  FChild2.Show;
end;

procedure TForm1.ButtonTipzClick(Sender: TObject);
var
  i9, osh: integer;
begin
  try
    FChild := TForm2.Create(Self);
    if FChild.ShowModal = mrOK then
    begin
      clas.TipZ := FChild.RadioGroup1.ItemIndex;
      if clas.TipZ = 0 then
        ButtonTipz.Caption := 'AUTO';
      if clas.TipZ = 1 then
        ButtonTipz.Caption := '������';
      if clas.TipZ = 2 then
      begin
        val(FChild.EditBetg.Text, Input.Betg, osh);
        Form1.ButtonTipz.Caption := '�����    ' + floattostr(Input.Betg);
      end;
      if clas.TipZ = 3 then
      begin
        if FChild.CheckBox1.Checked then
        begin
          ButtonTipz.Caption := '��������� � ��������';
          clas.Kanavka := 1;
        end
        else
        begin
          clas.Kanavka := 0;
          ButtonTipz.Caption := '���������';
        end;
      end;
    end;
  finally
    FChild1.Free;
    FChild1 := nil;
  end;

  oo := 1;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then
    CheckBox4.Caption := '�������'
  else
    CheckBox4.Caption := '�����������';
end;

procedure TForm1.Edit4Exit(Sender: TObject);
var
  osh: integer; // ��� ������
begin
  val(Edit4.Text, Input.Lh, osh);
  if osh <> 0 then
    ShowMessage('������� �� ������ ��������')
  else
    clas.Lh := Input.Lh;
end;

procedure TForm1.Edit5Click(Sender: TObject);
var
  FChild1: Tform6;
  ka1: Extended;
begin
  ka1 := 1;
  try
    FChild1 := Tform6.Create(Self);
    if FChild1.ShowModal = mrOK then
      case FChild1.RadioGroup1.ItemIndex of
        0:
          ka1 := 1;
        1:
          ka1 := 1.10;
        2:
          ka1 := 1.25;
        3:
          ka1 := 1.50;
      end;
    case FChild1.RadioGroup1.ItemIndex of
      0:
        ka1 := ka1 + 0;
      1:
        ka1 := ka1 + 0.25;
      2:
        ka1 := ka1 + 0.50;
      3:
        ka1 := ka1 + 0.75;
    end;
    Edit5.Text := floattostr(ka1);
    clas.Ka := ka1;
  finally
    FChild1.Free;
    FChild1 := nil;
  end;
end;

procedure TForm1.EditN1Exit(Sender: TObject);
var
  osh: integer; // ��� ������
begin
  val(EditN1.Text, Input.N1, osh);
  if osh <> 0 then
    ShowMessage('������� �� ������ ��������')
  else
    clas.N1 := Input.N1;
end;

procedure TForm1.EditP1Exit(Sender: TObject);
var
  osh: integer; // ��� ������
begin
  val(EditP1.Text, Input.p1, osh);
  if osh <> 0 then
    ShowMessage('������� �� ������ ��������')
  else
    clas.p1 := Input.p1;

end;

procedure TForm1.Editp1KeyPress(Sender: TObject; var Key: Char);
var
  i: integer;
begin
  if not(Key in ['0' .. '9', '.', #8]) then
    Key := #0;
  for i := 1 to Length((Sender as TEdit).Text) do
    if ((Key = '.') and ((Sender as TEdit).Text[i] = '.')) then
      Key := #0;
end;

procedure TForm1.EditUClick(Sender: TObject);
var
  FChild1: TForm4;
  i9: integer;
  St: string;
begin
  try
    FChild1 := TForm4.Create(Self);
    if FChild1.ShowModal = mrOK then
      St := FChild1.EditU.Text;
    for i9 := 0 to Length(St) do

      if St[i9] = '.' then
        St[i9] := ',';
    EditU.Text := St;
    clas.U := StrToFloat(St);
  finally
    FChild1.Free;
    FChild1 := nil;
  end;
end;

procedure TForm1.EditUExit(Sender: TObject);
var
  osh: integer; // ��� ������
begin
  val(EditU.Text, Input.U, osh);
  if osh <> 0 then
    ShowMessage('������� �� ������ ��������')
  else
    clas.U := Input.U;

end;

procedure TForm1.EditUKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i: integer;
begin
  Input.DeltaU := 2;
  Input.U := 3.58;
  clas := CalculateCWheel.Create;
  for i := Low(marca1) to High(marca1) do // ������� ���  �� ���
    ComboBox1.Items.Add(marca1[i]);
  ComboBox1.Text := '45 ���� 1050-74';
  for i := 0 to 8 do
    ComboBox2.Items.Add(HandleStr[i]);
  for i := 0 to 24 do
    ComboBox3.Items.Add(marca1[i]);
  ComboBox3.Text := '45 ���� 1050-74';
  for i := 0 to 8 do
    ComboBox4.Items.Add(HandleStr[i]);
  for i := 0 to 2 do
    ComboBox7.Items.Add(roughness[i]);
  for i := 0 to 2 do
    ComboBox8.Items.Add(roughness[i]);
  for i := 0 to 3 do
    ComboBox9.Items.Add(PatternProcess[i]);
  for i := 0 to 3 do
    ComboBox10.Items.Add(PatternProcess[i]);
  for i := 0 to 2 do
    ComboBox11.Items.Add(Finish[i]);
  for i := 0 to 2 do
    ComboBox12.Items.Add(Finish[i]);
  for i := 0 to 5 do
    ComboBox5.Items.Add(LoadStr[i]);
  for i := 0 to 2 do
    ComboBox6.Items.Add(ToolStr[i]);
  for i := 0 to 2 do
    ComboBox13.Items.Add(ToolStr[i]);
end;

procedure TForm1.SpinEditZwExit(Sender: TObject);
begin
  clas.Zw := SpinEditZw.Value;
end;

end.
