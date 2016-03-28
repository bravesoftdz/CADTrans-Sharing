program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  CALCULAT008 in 'CALCULAT008.pas',
  Materials in 'Materials.pas',
  Unit2 in 'Unit2.pas' {Form2},
  constants in 'constants.pas',
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
