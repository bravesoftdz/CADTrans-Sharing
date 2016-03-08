unit Belts.Vee;
{ {
  �������� ������� ��������
}

interface

uses System.Classes, GearTypesUnit, Vcl.Graphics, System.SysUtils, Vcl.Dialogs,
  GearClassesUnit, Gost;

type
  TVeeBelt = class(TBelt)
  private
    // 1 ���������, ������������ � ������������
    alfa_min, nyu_max, V_max, f_pr: extended;
    // 1 ����, �������� ������� ������ ��� ���������
    FInput: TVeeInput;
    // 1 ����, �������� ��������� �������� ������
    FGears: TVeeOutputs;
    // 1 ������� �������� �������� �� ����������������� True - ��������������
    function Check(Gear: TVeeOutput): Boolean;
    // 1 ������� ������� ����� ��������
    function Calculate(VarD1: extended; VarSection: integer): TVeeOutput;
    // 1 ������� ���������� �������� � ���������
    function Add(Gear: TVeeOutput): integer;
    function GetGears(Index: integer): TVeeOutput;
    procedure SetGears(Index: integer; const Value: TVeeOutput);
  protected
    procedure SetD1(const Value: extended); override;
    procedure SetA(const Value: extended); override;
    // 1 ��������� �������� ������������ ������� ������
    procedure Checking; override;
  public
    // 1 ������� ���������� ���. ������. ������� �������� ����� ��� ������� ����������
    function MinDiameter: extended; override;
    // 1 ������� ������� ��� ����� (����� ����� � SectionIndex)
    function Section(SectionIndex: integer): String; override;
    constructor Create(Input: TVeeInput); overload;
    constructor Create; overload;
    // 1 ����� ������� ������ ������� ���������
    function First: TVeeOutput;
    // 1  ����� ������� ��������� ������� ���������
    function Last: TVeeOutput;
    // 1 ����� ������� ���������
    procedure Clear; override;
    // 1  ����� ������� ���������� ��������� � ���������
    function Count: integer; override;
    // 1 �������� ��� ������ ������� ������ ��� ���������
    property Input: TVeeInput read FInput;
    // 1 ������� ��������� ��������� �������
    function Collect: integer;
    // 1 �������� ��� ������ � ����������
    property Gears[Index: integer]: TVeeOutput read GetGears
      write SetGears; default;
  end;

implementation

{
  ******************************** TVeeBelt *******************************
}
constructor TVeeBelt.Create(Input: TVeeInput);
begin
  // inherited Create;

  FFullName := '�������� ������� ��������';
  FBeltType := btVee;

  { � ������ ������� ����� ���������� �������������� ��������� � ����� ������ }
{$IFDEF Debug}
  try
{$ENDIF}
    P1 := Input.P1;
    n1 := Input.n1;
    SectionIndex := Input.SectionIndex;
    d1 := Input.d1;
    up := Input.up;
    a := Input.a;
    Cp := Input.Cp;
    Tension := Input.Tension;
{$IFDEF Debug}
  except
    on E: Exception do
      ShowMessage('[Input] ������� ������ ' + E.ClassName + ' � ���������� : ' +
        E.Message);
  end;
{$ENDIF}
  // ����������� ���������
  alfa_min := 120; { ���������� ���������� ���� ������� }
  nyu_max := 15; { ����������� ���������� ����� �������� }
  V_max := 25; { ����������� ���������� �������� ����� }
  f_pr := 0.73; { ����������� ����������� ������ }

  SetLength(FGears, 0);

{$IFDEF Debug}
  try
{$ENDIF}
    Collect;
{$IFDEF Debug}
  except
    on E: Exception do
      ShowMessage('[Collect] ������� ������ ' + E.ClassName + ' � ���������� : '
        + E.Message);
  end;
{$ENDIF}
end;

function TVeeBelt.First: TVeeOutput;
begin
  if Count > 0 then
    Result := Gears[0]
  else
    raise EListError.Create
      ('[TVeeBelt.First] ������� ������� ������ �������� � ������ ���������');
end;

function TVeeBelt.GetGears(Index: integer): TVeeOutput;
begin
  if Index < Count then
    Result := FGears[Index]
  else
    raise EListError.Create
      ('[TVeeBelt.GetGears] ������� ���������� � �������� � ������� ������ �������������');
end;

function TVeeBelt.Section(SectionIndex: integer): String;
begin
  inherited;

  if SectionIndex <= High(ClinT) then
    Result := ClinT[SectionIndex]
  else
    raise EAccessViolation.Create
      ('[TVeeBelt.GetSection] ����������� ����� ����� ������� (SectionIndex)');
end;

function TVeeBelt.Last: TVeeOutput;
begin
  if Count > 0 then
    Result := Gears[High(FGears)]
  else
    raise EListError.Create
      ('[TVeeBelt.Last] ������� ������� ��������� �������� � ������ ���������');
end;

function TVeeBelt.MinDiameter: extended;
var
  Tip_kl: integer;
  // ���� ������� ������ ��� ����, �� ���������� ���������� ��� �������
  // ������������ � ����� ��������� � ���� ����������
begin
  if n1 = 0 then
    raise EZeroDivide.CreateFmt
      ('[TVeeBelt.MinDiameter] ������ ������� �� ���� ��� ������� ���������� ����������� �������� ����� (D1). ������� �������� �������� ����� (n1) �� ����� ���� ����� ����',
      []);

  Tip_kl := 0;
  if SectionIndex = 0 then
  begin
    inc(Tip_kl);

    // ������� ����������� ������������� ������-�� ���� �����
    while 9550 * P1 / n1 > T3S[Tip_kl] do
      inc(Tip_kl);

    if Tip_kl <= High(ClinT) then
      Result := TArrayD[Round(Array_kl[Tip_kl, 10])]
    else
      raise ERangeError.CreateFmt
        ('[TVeeBelt.MinDiameter] ��� ������� ���������� ���������� ���������� ������� ����� (D1) ����������� ���������� ������� (Tip_kl=%d)',
        [Tip_kl]);
  end
  else
    // ���� ������� ������, �� ����������� ������� ��������� �� 10 �������
    // ������� Array_kl (��������� ����� ��������, � �� ���� ��������)
    Result := TArrayD[Round(Array_kl[SectionIndex, 10])];
end;

procedure TVeeBelt.SetA(const Value: extended);
begin
  inherited;

end;

procedure TVeeBelt.SetD1(const Value: extended);
var
  Tip_kl: integer;
  // ���� ���� ������� ������ ��� ����, �� ���������� ���������� ��� �������
  // ������������ � ����� ��������� � ���� ����������
begin
  if n1 = 0 then
    raise EZeroDivide.Create
      ('[TVeeBelt.SetD1] ������ ������� �� ���� ��� ������ �������� ����� (D1), ������� �������� (n1) �� ������ ���� ����� ����');

  Tip_kl := 0;
  if SectionIndex = 0 then
  begin
    inc(Tip_kl);
    // ������� ����������� ������������� ������-�� ���� �����
    while 9550 * P1 / n1 > T3S[Tip_kl] do
      inc(Tip_kl);
    if Tip_kl > High(ClinT) then
      raise ERangeError.CreateFmt
        ('[TVeeBelt.SetD1] ��� ������� ���������� ���������� ���������� ������� ����� (D1) ����������� ���������� ������� (Tip_kl=%d)',
        [Tip_kl]);
  end
  else
    Tip_kl := SectionIndex;

  { ����������� ������ �� TArrayD[Round(Array_kl[Section,10])], 10 ������� �
    ������� Array_kl ��� ����� (� ������� TArrayD) ���������� ����������� �������� ����� }

  { TODO : ��� ������� ���������, ���� ������������ ��������� ������ �������,
    ���� ������������ ��������� ������ ������� ������ ���� ������� ������ ������� }

  if (Value < MinDiameter) and (Value <> 0) then
    raise ERangeError.CreateFmt
      ('[TVeeBelt.SetD1] ������� ����� (D1) �� ����� ���� ����� %g, ���������� ���������� �������� ��� ����� %s ����� %g �� (���� 20889-88)',
      [Value, ClinT[Tip_kl], MinDiameter]);

  inherited;
end;

procedure TVeeBelt.SetGears(Index: integer; const Value: TVeeOutput);
begin
  if Index < Count then
    Gears[Index] := Value
  else
    raise EListError.Create
      ('[TVeeBelt.SetGears] ������� �������� ������ � �������� � ������� ������ �������������');
end;

function TVeeBelt.Add(Gear: TVeeOutput): integer;
begin
  SetLength(FGears, Length(FGears) + 1);
  FGears[High(FGears)] := Gear;
  Result := Length(FGears);
end;

function TVeeBelt.Calculate(VarD1: extended; VarSection: integer): TVeeOutput;
Var
  b0, Aa, he, hf, b, h, y0, C_alfa, C_v, Sigma_t, f1, t1, nol, deln: extended;
  Ft, p_dop, Ft_dop: extended;
  Output: TVeeOutput;
  id2: integer;
  l_max: extended;
  F2, alfa_c, m, qqq, qw: extended;
  { F1 - ��������� ������� �����;
    F2 - ��������� ������� �����;
    Fb - �������� �� ���� �����;
    F0 - ������ ���������������� ���������;
    Ft - �������� ������ � �������� }
Const
  f = 0.25;
  // C = 0.99; ���������� ����� ����������� ������ 1%
begin
  inherited;

  Output.a := a;
  Output.d1 := VarD1;
  Output.SectionIndex := VarSection;

  { ----------------------- ������ ��������� �������� -------------------------- }

  try
    if up > 1 then
      Output.d2 := Output.d1 * up
    else
      Output.d2 := Output.d1 / up;
  except
    on E: EZeroDivide do
      raise EZeroDivide.Create
        ('[TVeeBelt.Calculate] ������ ������� �� ���� ��� ������� �������� �������� ����� (d2), ������������ ��������� (up) �� ����� ���� ����� ����');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] ������ ��� ������� �������� �������� ����� (d2)');
  end;

  try
    RoundGOST(TArrayD, 1, 38, Output.d2, Output.d2, id2);
  except
    on E: Exception do
      raise Exception.Create
        ('[TVeeBelt.Calculate] �� ������� ��������� ������� �������� ����� (d2) �� ���������� �������� �� ���� �������� ��������');
  end;

  // ���� ��������� ���������� ������ ����, ������������ ��� �� ���������
  if a = 0 then
    Output.a := 1.5 * (Output.d1 + Output.d2);
  // ����� a ������� �� ������������, ������ Output.a

  Output.l := 2 * Output.a + Pi * (Output.d1 + Output.d2) / 2 +
    sqr(Output.d2 - Output.d1) / (4 * Output.a);

  try
    RoundGOST(TArrayL, 1, Round(Array_kl[Output.SectionIndex, 9]), Output.l,
      Output.l, id2);
  except
    on E: Exception do
      raise Exception.Create
        ('[TVeeBelt.Calculate] �� ������� ��������� ����� ����� (L) �� ���������� ����������� �������� �� ������� ���� �������� ������');
  end;

  try
    Output.a := (Output.l - Pi * (Output.d1 + Output.d2) / 2) / 4 +
      sqrt(sqr(Output.l - Pi * (Output.d1 + Output.d2) / 2) - 2 *
      sqr(Output.d1 - Output.d2)) / 4;
  except
    on E: Exception do
      raise Exception.Create
        ('[TVeeBelt.Calculate] ������ ��� ������� ���������� ���������� (a). ��������, ����������� ������������ ����� ����� (L)');
  end;

  try
    Output.alfa := 180 - (Output.d2 - Output.d1) * 57 / Output.a;
  except
    on E: EZeroDivide do
      raise EZeroDivide.Create
        ('[TVeeBelt.Calculate] ������ ������� �� ���� ��� ������� ���� ������� ����� (alfa), ��������� ��������� ���������� (a) ��������� ����� ����');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] ������ ��� ������� ���� ������� ����� (alfa)');
  end;

  { ----------------------- ������ �������������� ���������� �������� ---------- }


  // u := Output.d2 / (C * Output.d1);
  // n2 := n1 * Output.d1 * C / Output.d2;

  if up > 1 then
  begin
    Output.V := Pi * Output.d1 * n1 / 60000
  end
  else
  begin
    Output.V := Pi * Output.d2 * n1 / 60000;
  end;

  try
    Output.nyu := 1000 * Output.V / Output.l;
  except
    on E: EZeroDivide do
      raise EZeroDivide.Create
        ('[TVeeBelt.Calculate] ������ ������� �� ���� ��� ������� ������� ����� (nyu), ����� ����� (L) ��������� ����� ����');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] ������ ��� ������� ������� ����� (nyu)');
  end;

  { ----------------------- �������� ������ ���������� �������� ---------------- }

  try
    b0 := Array_kl[Output.SectionIndex, 1];
    b := Array_kl[Output.SectionIndex, 2];
    { h := Array_kl[Output.Section, 3];
      y0 := Array_kl[Output.Section, 4]; � ���� ������� �� ������������ }
    Aa := Array_kl[Output.SectionIndex, 5];

    f1 := Array_kl[Output.SectionIndex, 11];
    t1 := Array_kl[Output.SectionIndex, 12];
    he := Array_kl[Output.SectionIndex, 13];
    hf := Array_kl[Output.SectionIndex, 14];
  except
    on E: Exception do
      raise EAccessViolation.Create
        ('[TVeeBelt.Calculate] ������ �������� �� ������ ������ ������, ������� ����� ����� ������� (SectionIndex)');
  end;

  Output.d_e1 := Output.d1 + 2 * he;
  Output.d_e2 := Output.d2 + 2 * he;
  Output.d_f1 := Output.d1 - 2 * hf;
  Output.d_f2 := Output.d2 - 2 * hf;
  C_alfa := 1.24 * (1 - exp(-Output.alfa / 110));
  C_v := 1 - 0.05 * (0.01 * sqr(Output.V) - 1);

  try
    Ft := 1000 * P1 / Output.V;
  except
    on E: EZeroDivide do
      raise EZeroDivide.Create
        ('[TVeeBelt.Calculate] ������ ������� �� ���� ��� ������� ��������� ������ (Ft), �������� ����� (V) ��������� ����� ����');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] ������ ��� ������� ��������� ������ (Ft)');
  end;

  try
    Sigma_t := 9.05 / exp(0.09 * ln(Output.nyu)) - 6 * exp(1.57 * ln(b0)) /
      Output.d_e1 - sqr(Output.V) * 1E-3;
  except
    on E: Exception do
      raise Exception.Create
        ('[TVeeBelt.Calculate] ������ ��� ������� (Sigma_t)');
  end;

  try
    Output.z := Round(Ft * Cp / (1.2 * Sigma_t * Aa * 0.9 * C_alfa *
      C_v) + 0.5);
  except
    on E: EZeroDivide do
      raise EZeroDivide.Create
        ('[TVeeBelt.Calculate] ������ ������� �� ���� ��� ������� ����� ������ (z)');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] ������ ��� ������� ����� ������ (z)');
  end;

  Output.Bs := 2 * f1 + t1 * (Output.z - 1);

  { ----------------------- ������ ��� ----------------------------------------- }

  alfa_c := 0.7 * Output.alfa * Pi / 180;
  m := exp(f_pr * alfa_c);

  // ���� ��� �������� �� m, ������ ��� ��� �������������� ������ �������
  f1 := m / (m - 1) * Ft;
  F2 := f1 - Ft;
  Output.F0 := Ft / 2 * ((m + 1) / (m - 1));

  try
    Output.Fb := sqrt(sqr(f1) + sqr(F2) - 2 * f1 * F2 *
      cos((180 - Output.alfa) * Pi / 180));
  except
    on E: EInvalidOp do
      raise EInvalidOp.Create
        ('[TVeeBelt.Calculate] ���� ������ �� �������������� �������� ��� ������� �������� �� ���� ����� (Fb)');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] ������ ��� ������� �������� �� ���� ����� (Fb)');
  end;

  Output.Vol := (Output.Bs * (Pi * (sqr(Output.d1) + sqr(Output.d2)) + 4 *
    Output.a * (Output.d1 + Output.d2))) / 8 * 1E-6;

  alfa_c := 0.7 * Output.alfa * Pi / 180;
  qw := exp(f * alfa_c);

  try
    qqq := qw * Ft / ((qw - 1) * Aa) + 7.5 * exp(1.57 * ln(b0)) / Output.d_e1 +
      1.27E-3 * Output.V * Output.V;

    Output.Lh := 283 * Output.l / (Output.V * qqq) + 250;
    if Output.Lh > 6000 then
      Output.Lh := exp(0.8 * ln(Output.Lh));
  except
    on E: EZeroDivide do
      raise EZeroDivide.Create
        ('[TVeeBelt.Calculate] ������ ������� �� ���� ��� ������� ������������� (Lh)');
    on E: EInvalidOp do
      raise EInvalidOp.Create
        ('[TVeeBelt.Calculate] ��� ���������� ��������� ������������� ��� ������� �������� ��� ������� ������������� (Lh)');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] ������ ��� ������� ������������� (Lh)');
  end;

  p_dop := b0 * C_alfa * C_v * Cp;
  Ft_dop := Output.z * b * p_dop;
  Output.PMax := Ft_dop * Output.V / 1000;

  Result := Output;
end;

function TVeeBelt.Check(Gear: TVeeOutput): Boolean;
begin
  Result := True;

  if Gear.V > V_max then
    Result := False;

  if (Gear.z < 1) or (Gear.z > 11) then
    Result := False;

  if Gear.alfa < alfa_min then
    Result := False;

  if Gear.nyu > nyu_max then
    Result := False;
end;

procedure TVeeBelt.Checking;
begin
  inherited;
end;

procedure TVeeBelt.Clear;
begin
  if Count <> 0 then
    SetLength(FGears, 0);
end;

function TVeeBelt.Collect: integer;
var
  CurrGear: TVeeOutput;
  d1x: extended;
  SecIndex, id: integer;
begin

  Clear;
  Result := 0;

  if (SectionIndex <> 0) and (d1 <> 0) then
  begin
    if 9550 * P1 / n1 <= T3S[SectionIndex] then
    begin
      CurrGear := Calculate(d1, SectionIndex);
      if Check(CurrGear) then
        Result := Add(CurrGear);
    end
  end;

  if (SectionIndex = 0) and (d1 <> 0) then
  begin
    for SecIndex := Low(ClinT) + 1 to High(ClinT) do
    begin
      if 9550 * P1 / n1 <= T3S[SecIndex] then
      begin
        CurrGear := Calculate(d1, SecIndex);
        if Check(CurrGear) then
          Result := Add(CurrGear);
      end;
    end;
  end;

  if (SectionIndex <> 0) and (d1 = 0) then
  begin
    if 9550 * P1 / n1 <= T3S[SectionIndex] then
    begin
      d1x := TArrayD[Round(Array_kl[SectionIndex, 10])];
      repeat
        CurrGear := Calculate(d1x, SectionIndex);
        d1x := 1.25 * d1x;
        RoundGOST(TArrayD, 1, 38, d1x, d1x, id);
        if Check(CurrGear) then
        begin
          Result := Add(CurrGear);
        end;
      until CurrGear.l >= TArrayL[Round(Array_kl[SectionIndex, 9])];
    end;
  end;

  if (SectionIndex = 0) and (d1 = 0) then
  begin
    for SecIndex := Low(ClinT) + 1 to High(ClinT) do
    begin
      if 9550 * P1 / n1 <= T3S[SecIndex] then
      begin
        d1x := TArrayD[Round(Array_kl[SecIndex, 10])];
        repeat
          CurrGear := Calculate(d1x, SecIndex);
          d1x := 1.25 * d1x;
          RoundGOST(TArrayD, 1, 38, d1x, d1x, id);
          if Check(CurrGear) then
          begin
            Result := Add(CurrGear);
          end;
        until CurrGear.l >= TArrayL[Round(Array_kl[SecIndex, 9])];
      end;
    end;
  end;

end;

function TVeeBelt.Count: integer;
begin
  Result := Length(FGears);
end;

constructor TVeeBelt.Create;
var
  MB: TVeeInput;
begin
  MB.P1 := 50;
  MB.n1 := 1000;
  MB.up := 2;
  MB.d1 := 140;
  MB.a := 0;
  MB.q := 1;
  MB.Cp := 1;
  MB.Tension := ttAutomatic;
  MB.SectionIndex := 0;

  Create(MB);
end;

end.
