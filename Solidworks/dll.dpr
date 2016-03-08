library dll;

uses
  SysUtils,
  ComObj,
  Dialogs,
  Classes,
  ActiveX,
  windows,
  Math,
  Klin_Skiv in 'Klin_Skiv.pas',
  Plosk_Shkiv in 'Plosk_Shkiv.pas',
  Poliklin_Shkiv in 'Poliklin_Shkiv.pas',
  Sw_HLP in 'Sw_HLP.pas',
  SldWorks_TLB in 'SldWorks_TLB.pas',
  ZubchZvUnit in 'ZubchZvUnit.pas',
  Kol_Zub in 'Kol_Zub.pas',
  Zub_shkiv in 'Zub_shkiv.pas',
  RolicZvUnit in 'RolicZvUnit.pas',
  Kos_Zub in 'Kos_Zub.pas';

var
  LastErrMsg: String= '';

type
  TSWSett= class
  protected
    FSW: ISldWorks;
    FMD: IModelDoc;
    FShowDim: Boolean;
    FInferenceMode: Boolean;
  public
    constructor Create(SW: ISldWorks; MD: IModelDoc);
    destructor Destroy; override;
  end;

constructor TSWSett.Create(SW: ISldWorks; MD: IModelDoc);
begin
  FSW:= sw;
  FMD:= md;
  FShowDim:= FSW.GetUserPreferenceToggle(10);
  FSW.SetUserPreferenceToggle(10, False);
  FInferenceMode:= FMD.GetInferenceMode;
  FMD.SetInferenceMode(False);
  FMD.Lock;
end;

destructor TSWSett.Destroy;
begin
  FMD.UnLock;
  FSW.SetUserPreferenceToggle(10, FShowDim);
  FMD.SetInferenceMode(FInferenceMode);
  inherited;
end;

function GetModelLastErrMsg(msg: PChar; strlen: UINT): UINT;
begin
  if msg = nil then
  begin
    Result:= length(LastErrMsg)+1;
  end
  else
  begin
    Result:= min(length(LastErrMsg), strlen-1);
    strlcopy(msg, PChar(LastErrMsg), Result);
  end;
end;

procedure CreateModel(cm: TCustom; SavePath: PChar);
var
  sw: ISldWorks;
  md: IModelDoc;
  sett: TSWSett;
begin
  sw:= CreateOleObject('SldWorks.Application') as ISldWorks;
  sw.Visible:= True;
  md:= sw.NewPart as IModelDoc;
  sett:= TSWSett.Create(sw, md);
  try
    cm.CreateSW(md);
  except
    sett.Free;
    raise;
  end;
  sett.Free;
  if StrLen(SavePath) > 0 then
    if md.SaveAs2(ChangeFileExt(SavePath, '.sldprt'), 0, false, false) <> 0 then
      raise Exception.Create('Документ "'+md.GetTitle+'" не сохранен!');
end;

// _d0- диаметр вала
// _d_sh- наружный диаметр
// _b- ширина венца
// _n- количество канавок
// _type_size- тип профиля канавки (а, б, в, г, д, е, о, уо, уа, уб)
function Klin_Skiv(_d0, _d_sh, _b: Real; _n: Byte; _type_size, SavePath: PChar): Boolean;
var
  c: TKlinSkiv;
begin
  Result:= False;
  try
    c:= TKlinSkiv.Create(_d0, _d_sh, _b, _n, _type_size);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      Exit;
    end;
  end;
  try
    CreateModel(c, SavePath);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      c.Free;
      Exit;
    end;
  end;
  c.Free;
  Result:= True;
end;

// _d0- диаметр вала
// _d_sh- наружный диаметр
// _b- ширина венца
function Plosk_Skiv(_d0, _d_sh, _b: Real; SavePath: PChar): Boolean;
var
  c: TPloskoSkiv;
begin
  Result:= False;
  try
    c:= TPloskoSkiv.Create(_d0, _d_sh, _b);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      Exit;
    end;
  end;
  try
    CreateModel(c, SavePath);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      c.Free;
      Exit;
    end;
  end;
  c.Free;
  Result:= True;
end;

// _d0- диаметр вала
// _d_sh- наружный диаметр
// _b- ширина венца
// _n- количество канавок
// _type_size- тип профиля канавки (к, л, м)
function PoliKlin_Skiv(_d0, _d_sh, _b: Real; _n: Byte; _type_size, SavePath: PChar): Boolean;
var
  c: TPoliKlinSkiv;
begin
  Result:= False;
  try
    c:= TPoliKlinSkiv.Create(_d0, _d_sh, _b, _n, _type_size);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      Exit;
    end;
  end;
  try
    CreateModel(c, SavePath);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      c.Free;
      Exit;
    end;
  end;
  c.Free;
  Result:= True;
end;

// _d_sh- наружный диаметр
// _z- количество зубьев
// _m- модуль
// _d0- диаметр вала
// _b- ширина венца
function Zub_Skiv(_d0, _d_sh, _b,_m: Real; _z: Byte; SavePath: PChar): Boolean;
var
  c: TZubSkiv;
begin
  Result:= False;
  try
    c:= TZubSkiv.Create(_d0, _d_sh, _b,_m, _z);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      Exit;
    end;
  end;
  try
    CreateModel(c, SavePath);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      c.Free;
      Exit;
    end;
  end;
  c.Free;
  Result:= True;
end;

// _z- количество зубьев
// _m- модуль
// _d0- диаметр вала
// _b- ширина венца
function KZub(_z, _m, _d0, _b:real; SavePath: PChar): Boolean;
var
  c: TKZub;
begin
  Result:= False;
  try
    c:= TKZub.Create(_z, _m, _d0, _b);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      Exit;
    end;
  end;
  try
    CreateModel(c, SavePath);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      c.Free;
      Exit;
    end;
  end;
  c.Free;
  Result:= True;
end;

function KosZub(_z: integer; _m, _d0, _b, _anz:real; SavePath: PChar): Boolean;
var
  c: TKosZub;
begin
  Result:= False;
  try
    c:= TKosZub.Create(_z, _m, _d0, _b,_anz);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      Exit;
    end;
  end;
  try
    CreateModel(c, SavePath);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      c.Free;
      Exit;
    end;
  end;
  c.Free;
  Result:= True;
end;
// звездочка для зубчатых цепей
// _z- количество зубьев
// _p- шаг цепи
// _d0- диаметр вала
// _n- число рядов цепи (всегда = 2)
function ZubchZv(_d0, _p: Real; _n, _z: integer; SavePath: PChar): Boolean;
var
  c: TZubchZv;
begin
  Result:= False;
  try
    c:= TZubchZv.Create(_d0, _p, _n, _z);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      Exit;
    end;
  end;
  try
    CreateModel(c, SavePath);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      c.Free;
      Exit;
    end;
  end;
  c.Free;
  Result:= True;
end;
// звездочка для зубчатых цепей
// _z- количество зубьев
// _p- шаг цепи
// _d0- диаметр вала
// _n- число рядов цепи (всегда = 2)
function RolicZv(_d0, _p: Real; _n, _z: integer; SavePath: PChar): Boolean;
var
  c: TRolicZv;
begin
  Result:= False;
  try
    c:= TRolicZv.Create(_d0, _p, _n, _z);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      Exit;
    end;
  end;
  try
    CreateModel(c, SavePath);
  except
    on e: Exception do
    begin
      LastErrMsg:= e.Message;
      c.Free;
      Exit;
    end;
  end;
  c.Free;
  Result:= True;
end;


exports
  GetModelLastErrMsg,
  Klin_Skiv,
  Plosk_Skiv,
  PoliKlin_Skiv,
  KZub,
  ZubchZv,
  Zub_Skiv,
  RolicZv,
  KosZub;
begin
  CoInitialize(nil);
end.
