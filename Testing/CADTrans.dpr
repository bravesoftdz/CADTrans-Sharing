program CADTrans;

uses
  Forms,
  MainFormUnit in 'MainFormUnit.pas' {MainForm},
  GearTypesUnit in 'GearTypesUnit.pas',
  GearClassesUnit in 'GearClassesUnit.pas',
  Gost in 'Gost.pas',
  DebugNarrowFormUnit in 'DebugNarrowFormUnit.pas' {DebugNarrowForm},
  Belts.Narrow in 'Belts.Narrow.pas',
  Belts.MultiGroove in 'Belts.MultiGroove.pas',
  DebugMultiGrooveFormUnit in 'DebugMultiGrooveFormUnit.pas' {DebugMultiGrooveForm},
  Belts.Vee in 'Belts.Vee.pas',
  DebugVeeFormUnit in 'DebugVeeFormUnit.pas' {DebugVeeForm},
  Belts.Film in 'Belts.Film.pas',
  DebugFilmFormUnit in 'DebugFilmFormUnit.pas' {DebugFilmForm},
  Belts.Flat in 'Belts.Flat.pas',
  DebugFlatFormUnit in 'DebugFlatFormUnit.pas' {DebugFlatForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
