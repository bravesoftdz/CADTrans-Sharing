unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CALCULAT008;

type
  TForm4 = class(TForm)
    Label2: TLabel;
    EditU: TEdit;
    EditDeltaU: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure EditUChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  clas1: CalculateCWheel;

implementation

uses Unit1;
{$R *.dfm}

procedure TForm4.EditUChange(Sender: TObject);
var
  osh, i9: integer;
  ui: Extended;
  st: string;
begin
  st := EditU.Text;
  for i9 := 0 to Length(st) do
    if st[i] = '.' then
      st[i] := ',';
  EditU.Text := st;
  val(EditU.Text, ui, osh);
  clas.U := ui;
end;

procedure TForm4.FormShow(Sender: TObject);
var
  i: integer;
  str: string;
begin
  str := floattostr(Input.U);
  for i := 0 to Length(str) do
    if str[i] = ',' then
      str[i] := '.';
  EditU.Text := str;;
  EditDeltaU.Text := floattostr(Input.DeltaU);
end;

end.
