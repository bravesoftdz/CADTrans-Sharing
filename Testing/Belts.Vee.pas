unit Belts.Vee;
{ {
  Клиновая ремённая передача
}

interface

uses System.Classes, GearTypesUnit, Vcl.Graphics, System.SysUtils, Vcl.Dialogs,
  GearClassesUnit, Gost;

type
  TVeeBelt = class(TBelt)
  private
    // 1 Константы, определяются в конструкторе
    alfa_min, nyu_max, V_max, f_pr: extended;
    // 1 Поле, хранящее входные данные для коллекции
    FInput: TVeeInput;
    // 1 Поле, хранящее коллекцию выходных данных
    FGears: TVeeOutputs;
    // 1 Функция проверки передачи на работоспособность True - работоспособна
    function Check(Gear: TVeeOutput): Boolean;
    // 1 Функция расчёта одной передачи
    function Calculate(VarD1: extended; VarSection: integer): TVeeOutput;
    // 1 Функция добавления передачи в коллекцию
    function Add(Gear: TVeeOutput): integer;
    function GetGears(Index: integer): TVeeOutput;
    procedure SetGears(Index: integer; const Value: TVeeOutput);
  protected
    procedure SetD1(const Value: extended); override;
    procedure SetA(const Value: extended); override;
    // 1 Процедура проверки корректности входных данных
    procedure Checking; override;
  public
    // 1 Функция возвращает мин. допуст. диаметр ведущего шкива для текущих параметров
    function MinDiameter: extended; override;
    // 1 Функция выводит тип ремня (номер задан в SectionIndex)
    function Section(SectionIndex: integer): String; override;
    constructor Create(Input: TVeeInput); overload;
    constructor Create; overload;
    // 1 Метод выводит первый элемент коллекции
    function First: TVeeOutput;
    // 1  Метод выводит последний элемент коллекции
    function Last: TVeeOutput;
    // 1 Метод очистки коллекции
    procedure Clear; override;
    // 1  Метод выводит количество элементов в коллекции
    function Count: integer; override;
    // 1 Свойство для вывода входных данных для коллекции
    property Input: TVeeInput read FInput;
    // 1 Функция генерации коллекции передач
    function Collect: integer;
    // 1 Свойство для работы с коллекцией
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

  FFullName := 'Клиновая ремённая передача';
  FBeltType := btVee;

  { В режиме отладки будет выводиться дополнительное сообщение с типом ошибки }
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
      ShowMessage('[Input] Вызвана ошибка ' + E.ClassName + ' с сообщением : ' +
        E.Message);
  end;
{$ENDIF}
  // проверочные константы
  alfa_min := 120; { Минимально допустимый угол обхвата }
  nyu_max := 15; { Максимально допустимое число пробегов }
  V_max := 25; { Максимально допустимая скорость ремня }
  f_pr := 0.73; { Приведенный коэффициент трения }

  SetLength(FGears, 0);

{$IFDEF Debug}
  try
{$ENDIF}
    Collect;
{$IFDEF Debug}
  except
    on E: Exception do
      ShowMessage('[Collect] Вызвана ошибка ' + E.ClassName + ' с сообщением : '
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
      ('[TVeeBelt.First] Попытка выбрать первую передачу в пустой коллекции');
end;

function TVeeBelt.GetGears(Index: integer): TVeeOutput;
begin
  if Index < Count then
    Result := FGears[Index]
  else
    raise EListError.Create
      ('[TVeeBelt.GetGears] Попытка обратиться к передаче с номером больше максимального');
end;

function TVeeBelt.Section(SectionIndex: integer): String;
begin
  inherited;

  if SectionIndex <= High(ClinT) then
    Result := ClinT[SectionIndex]
  else
    raise EAccessViolation.Create
      ('[TVeeBelt.GetSection] Некорректно задан номер сечения (SectionIndex)');
end;

function TVeeBelt.Last: TVeeOutput;
begin
  if Count > 0 then
    Result := Gears[High(FGears)]
  else
    raise EListError.Create
      ('[TVeeBelt.Last] Попытка выбрать последнюю передачу в пустой коллекции');
end;

function TVeeBelt.MinDiameter: extended;
var
  Tip_kl: integer;
  // если сечение задано как АВТО, то минимально допустимый тип сечения
  // рассчитается и будет храниться в этой переменной
begin
  if n1 = 0 then
    raise EZeroDivide.CreateFmt
      ('[TVeeBelt.MinDiameter] Ошибка деления на ноль при расчете минимально допустимого диаметра шкива (D1). Частота вращения ведущего шкива (n1) не может быть равна нулю',
      []);

  Tip_kl := 0;
  if SectionIndex = 0 then
  begin
    inc(Tip_kl);

    // условие возможности использования какого-то типа ремня
    while 9550 * P1 / n1 > T3S[Tip_kl] do
      inc(Tip_kl);

    if Tip_kl <= High(ClinT) then
      Result := TArrayD[Round(Array_kl[Tip_kl, 10])]
    else
      raise ERangeError.CreateFmt
        ('[TVeeBelt.MinDiameter] При попытке рассчитать минимально допустимый диаметр шкива (D1) неправильно выбирается сечение (Tip_kl=%d)',
        [Tip_kl]);
  end
  else
    // если сечение задано, то минимальный диаметр возьмется из 10 столбца
    // массива Array_kl (возьмется номер диаметра, а не само значение)
    Result := TArrayD[Round(Array_kl[SectionIndex, 10])];
end;

procedure TVeeBelt.SetA(const Value: extended);
begin
  inherited;

end;

procedure TVeeBelt.SetD1(const Value: extended);
var
  Tip_kl: integer;
  // даже если сечение задано как АВТО, то минимально допустимый тип сечения
  // рассчитается и будет храниться в этой переменной
begin
  if n1 = 0 then
    raise EZeroDivide.Create
      ('[TVeeBelt.SetD1] Ошибка деления на ноль при записи диаметра шкива (D1), частота вращения (n1) не должна быть равна нулю');

  Tip_kl := 0;
  if SectionIndex = 0 then
  begin
    inc(Tip_kl);
    // условие возможности использования какого-то типа ремня
    while 9550 * P1 / n1 > T3S[Tip_kl] do
      inc(Tip_kl);
    if Tip_kl > High(ClinT) then
      raise ERangeError.CreateFmt
        ('[TVeeBelt.SetD1] При попытке рассчитать минимально допустимый диаметр шкива (D1) неправильно выбирается сечение (Tip_kl=%d)',
        [Tip_kl]);
  end
  else
    Tip_kl := SectionIndex;

  { Ограничение берётся из TArrayD[Round(Array_kl[Section,10])], 10 столбец в
    массиве Array_kl это номер (в массиве TArrayD) минимально допустимого диаметра шкива }

  { TODO : Это условие актуально, если передаточное отношение больше единицы,
    если передаточное отношение меньше единицы должно быть немного другое условие }

  if (Value < MinDiameter) and (Value <> 0) then
    raise ERangeError.CreateFmt
      ('[TVeeBelt.SetD1] Диаметр шкива (D1) не может быть равен %g, минимально допустимое значение для ремня %s равно %g мм (ГОСТ 20889-88)',
      [Value, ClinT[Tip_kl], MinDiameter]);

  inherited;
end;

procedure TVeeBelt.SetGears(Index: integer; const Value: TVeeOutput);
begin
  if Index < Count then
    Gears[Index] := Value
  else
    raise EListError.Create
      ('[TVeeBelt.SetGears] Попытка записать данные в передачу с номером больше максимального');
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
  { F1 - натяжение ведущей ветви;
    F2 - натяжение ведомой ветви;
    Fb - давление на валы ремня;
    F0 - усилие предварительного натяжения;
    Ft - окружное усилие в передаче }
Const
  f = 0.25;
  // C = 0.99; Скольжение ремня принимается равным 1%
begin
  inherited;

  Output.a := a;
  Output.d1 := VarD1;
  Output.SectionIndex := VarSection;

  { ----------------------- Расчет геометрии передачи -------------------------- }

  try
    if up > 1 then
      Output.d2 := Output.d1 * up
    else
      Output.d2 := Output.d1 / up;
  except
    on E: EZeroDivide do
      raise EZeroDivide.Create
        ('[TVeeBelt.Calculate] Ошибка деления на ноль при расчёте диаметра ведомого шкива (d2), передаточное отношение (up) не может быть равно нулю');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] Ошибка при расчёте диаметра ведомого шкива (d2)');
  end;

  try
    RoundGOST(TArrayD, 1, 38, Output.d2, Output.d2, id2);
  except
    on E: Exception do
      raise Exception.Create
        ('[TVeeBelt.Calculate] Не удалось округлить диаметр ведомого шкива (d2) до ближайшего значения из ряда линейных размеров');
  end;

  // Если межосевое расстояние задано Авто, рассчитываем его по диаметрам
  if a = 0 then
    Output.a := 1.5 * (Output.d1 + Output.d2);
  // Далее a никогда не используется, только Output.a

  Output.l := 2 * Output.a + Pi * (Output.d1 + Output.d2) / 2 +
    sqr(Output.d2 - Output.d1) / (4 * Output.a);

  try
    RoundGOST(TArrayL, 1, Round(Array_kl[Output.SectionIndex, 9]), Output.l,
      Output.l, id2);
  except
    on E: Exception do
      raise Exception.Create
        ('[TVeeBelt.Calculate] Не удалось округлить длину ремня (L) до ближайшего допустимого значения из массива длин клиновых ремней');
  end;

  try
    Output.a := (Output.l - Pi * (Output.d1 + Output.d2) / 2) / 4 +
      sqrt(sqr(Output.l - Pi * (Output.d1 + Output.d2) / 2) - 2 *
      sqr(Output.d1 - Output.d2)) / 4;
  except
    on E: Exception do
      raise Exception.Create
        ('[TVeeBelt.Calculate] Ошибка при расчёте межосевого расстояния (a). Возможно, неправильно рассчиталась длина ремня (L)');
  end;

  try
    Output.alfa := 180 - (Output.d2 - Output.d1) * 57 / Output.a;
  except
    on E: EZeroDivide do
      raise EZeroDivide.Create
        ('[TVeeBelt.Calculate] Ошибка деления на ноль при расчёте угла обхвата ремня (alfa), уточнённое межосевое расстояние (a) оказалось равно нулю');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] Ошибка при расчёте угла обхвата ремня (alfa)');
  end;

  { ----------------------- Расчет кинематических параметров передачи ---------- }


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
        ('[TVeeBelt.Calculate] Ошибка деления на ноль при расчёте пробега ремня (nyu), длина ремня (L) оказалась равна нулю');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] Ошибка при расчёте пробега ремня (nyu)');
  end;

  { ----------------------- Основной расчёт параметров передачи ---------------- }

  try
    b0 := Array_kl[Output.SectionIndex, 1];
    b := Array_kl[Output.SectionIndex, 2];
    { h := Array_kl[Output.Section, 3];
      y0 := Array_kl[Output.Section, 4]; в этом расчета не используются }
    Aa := Array_kl[Output.SectionIndex, 5];

    f1 := Array_kl[Output.SectionIndex, 11];
    t1 := Array_kl[Output.SectionIndex, 12];
    he := Array_kl[Output.SectionIndex, 13];
    hf := Array_kl[Output.SectionIndex, 14];
  except
    on E: Exception do
      raise EAccessViolation.Create
        ('[TVeeBelt.Calculate] Подбор значений из таблиц вызвал ошибку, неверно задан номер сечения (SectionIndex)');
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
        ('[TVeeBelt.Calculate] Ошибка деления на ноль при расчёте окружного усилия (Ft), скорость ремня (V) оказалась равна нулю');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] Ошибка при расчёте окружного усилия (Ft)');
  end;

  try
    Sigma_t := 9.05 / exp(0.09 * ln(Output.nyu)) - 6 * exp(1.57 * ln(b0)) /
      Output.d_e1 - sqr(Output.V) * 1E-3;
  except
    on E: Exception do
      raise Exception.Create
        ('[TVeeBelt.Calculate] Ошибка при расчёте (Sigma_t)');
  end;

  try
    Output.z := Round(Ft * Cp / (1.2 * Sigma_t * Aa * 0.9 * C_alfa *
      C_v) + 0.5);
  except
    on E: EZeroDivide do
      raise EZeroDivide.Create
        ('[TVeeBelt.Calculate] Ошибка деления на ноль при расчёте числа ремней (z)');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] Ошибка при расчёте числа ремней (z)');
  end;

  Output.Bs := 2 * f1 + t1 * (Output.z - 1);

  { ----------------------- Расчет сил ----------------------------------------- }

  alfa_c := 0.7 * Output.alfa * Pi / 180;
  m := exp(f_pr * alfa_c);

  // ниже нет проверок по m, потому что она гарантированно больше единицы
  f1 := m / (m - 1) * Ft;
  F2 := f1 - Ft;
  Output.F0 := Ft / 2 * ((m + 1) / (m - 1));

  try
    Output.Fb := sqrt(sqr(f1) + sqr(F2) - 2 * f1 * F2 *
      cos((180 - Output.alfa) * Pi / 180));
  except
    on E: EInvalidOp do
      raise EInvalidOp.Create
        ('[TVeeBelt.Calculate] Взят корень из отрицательного значения при расчёте давления на валы ремня (Fb)');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] Ошибка при расчёте давления на валы ремня (Fb)');
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
        ('[TVeeBelt.Calculate] Ошибка деления на ноль при расчёте долговечности (Lh)');
    on E: EInvalidOp do
      raise EInvalidOp.Create
        ('[TVeeBelt.Calculate] Под логарифмом оказалось отрицательное или нулевое значение при расчёте долговечности (Lh)');
    else
      raise Exception.Create
        ('[TVeeBelt.Calculate] Ошибка при расчёте долговечности (Lh)');
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
