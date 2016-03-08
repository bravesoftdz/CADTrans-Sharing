unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, math, ExtCtrls, Spin, dll_in;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ComboBox1: TComboBox;
    SpinEdit2: TSpinEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    ComboBox2: TComboBox;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit4: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Button3: TButton;
    GroupBox4: TGroupBox;
    z: TEdit;
    Label14: TLabel;
    m: TEdit;
    Label15: TLabel;
    b: TEdit;
    Label16: TLabel;
    Button4: TButton;
    d0: TEdit;
    Label17: TLabel;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Button5: TButton;
    Edit13: TEdit;
    GroupBox6: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Button6: TButton;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Button7: TButton;
    Edit22: TEdit;
    GroupBox8: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    z1: TEdit;
    m1: TEdit;
    b1: TEdit;
    Button8: TButton;
    d01: TEdit;
    anz: TEdit;
    Label35: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
 d0,d_sh,b: real;
 n: byte;
 Type_size: string;
begin
 d0:= StrToFloat(Edit1.Text);
 d_sh:= StrToFloat(Edit2.Text);
 b:= StrToFloat(Edit3.Text);
 n:= SpinEdit1.Value;
 Type_size:=ComboBox2.Text;
 Klin_Skiv(d0, d_sh, b, n, PChar(type_size), 'c:\Klin_Skiv.sldprt');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 d0,d_sh,b: real;
 n: byte;
 Type_size: string;
begin
 d0:= StrToFloat(Edit5.Text);
 d_sh:= StrToFloat(Edit7.Text);
 b:= StrToFloat(Edit6.Text);
 n:= SpinEdit2.Value;
 Type_size:=ComboBox1.Text;
 PoliKlin_Skiv(d0, d_sh, b, n, PChar(type_size), 'c:\PoliKlin_Skiv.sldprt');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 d0,d_sh,b: real;
begin
 d0:= StrToFloat(Edit4.Text);
 d_sh:= StrToFloat(Edit9.Text);
 b:= StrToFloat(Edit8.Text);
 Plosk_Skiv(d0, d_sh, b, 'c:\Plosk_Skiv.sldprt');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  s: PChar;
begin
  if not KZub(StrToInt(z.text), StrToFloat(m.text), StrToFloat(d0.text), StrToFloat(b.text), 'c:\KZub.sldprt') then
  begin
    s:= AllocMem(1024);
    GetModelLastErrMsg(s, 1024);
    ShowMessage(s);
    FreeMem(s, 1024);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ZubchZv(StrToFloat(Edit13.text), StrToFloat(Edit11.text), StrToInt(Edit12.text), StrToInt(Edit10.text), 'c:\ZubchZv.sldprt');
end;



procedure TForm1.Button6Click(Sender: TObject);
var
 d0,d_sh,b,m: real;
 z: byte;
begin
 d0:= StrToFloat(Edit17.Text);
 d_sh:= StrToFloat(Edit18.Text);
 b:= StrToFloat(Edit16.Text);
 m:= StrToFloat(Edit15.Text);
 z:= StrToInt(Edit14.Text);
 Zub_Skiv(d0, d_sh, b,m,z,'c:\Zub_Skiv.sldprt') ;

end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 RolicZv(StrToFloat(Edit22.text), StrToFloat(Edit20.text), StrToInt(Edit21.text), StrToInt(Edit19.text), 'c:\RolicZv.sldprt');
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  s: PChar;
begin
  if not KosZub(StrToInt(z1.text), StrToFloat(m1.text), StrToFloat(d01.text), StrToFloat(b1.text),StrToFloat(anz.text), 'c:\KZub.sldprt') then
  begin
    s:= AllocMem(1024);
    GetModelLastErrMsg(s, 1024);
    ShowMessage(s);
    FreeMem(s, 1024);
  end;
end;

end.
