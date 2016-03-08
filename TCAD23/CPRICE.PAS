{$N+}
Var
  CurPrice: single;
  NumCopy: byte;
  CCopy: byte;
  NumStr: string;
  VC: integer;

Const
  SumPrice: single = 0;

PROCEDURE PrintHelp;
BEGIN
  writeln('    Синтаксис:',#10#13,
          '      CPRICE Price Copies',#10#10#13,
          '      Price - цена первой копии',#10#13,
          '      Copies - количество копий');
  Halt;
END;

BEGIN
  if ParamCount <> 2 then
    PrintHelp;
  Val(ParamStr(1),CurPrice,VC);
  Val(ParamStr(2),NumCopy,VC);
  if VC <> 0 then
    PrintHelp;
  for CCopy:=1 to NumCopy do
  begin
    writeln('   ',CCopy:3,'-ая копия - $',CurPrice:7:2);
    SumPrice:=SumPrice+CurPrice;
    CurPrice:=CurPrice-CurPrice/5;
  end;
  writeln('      Итого: $',SumPrice:10:2);
END.