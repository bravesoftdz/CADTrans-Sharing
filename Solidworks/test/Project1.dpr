program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  dll_in in '..\dll_in.pas';



{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
