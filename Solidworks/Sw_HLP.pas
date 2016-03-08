unit Sw_HLP;

interface

uses
  sysutils, SldWorks_TLB;

type
{=======================================================
TCustom - базовый класс для всех деталей
Использование:
Создать Constructor, который принимает необходимые
параметры для расчета дополнительных параметров детали
(Передача параметров только через конструктор).
В производный класс добавить дополнительные поля,
не пересекающиеся по смыслу с уже имеющимися в этом
классе.
Переопределить Calc вызвать метод предка
и внести в него все необходимые
мат. расчеты.
Переопределить CreateSW и перед вашим кодом вызвать
метод базового класса.


========================================================}
  TCustom= class
  private
    procedure FindPlanes;

  protected
    // Диамерт вала
    d0: Real;
    // Длина ступицы
    l_st: Real;
    // Диаметр ступицы
    d_st: Real;
    //
    f1: Real;
    //
    d_old: Real;
    // Ширина диска
    c: Real;
    //
    b: Real;
    // Внешний диаметр
    d_sh: Real;
    // Фаска в ступице
    c2: real;
    // Фаска на диске
    c1: real;
    // Скругление
    r1: real;
    r2: real;
    // Левый сегмент
    SegL: ISketchSegment;
    // Верхний сегмент
    SegT: ISketchSegment;
    // Правый сегмент
    SegR: ISketchSegment;
    // Документ
    md: IModelDoc;
    // Главная плоскость XY
    xyPlane: IRefPlane;
    // Главная плоскость XZ
    xzPlane: IRefPlane;
    // Главная плоскость YZ
    yzPlane: IRefPlane;
    // Менеджер выделений
    SelMgr: ISelectionMgr;
    // Общий расчет параметров детали
    procedure Calc; virtual;
    // Расчет параметров шпонки на ступице
    procedure SponkaCalc(out bs, t: Real);
    procedure Sponka;
    procedure Ex(const msg: string);
    // создание основного тела вращения 1
    procedure Revolve1;
    procedure Revolve2;
    procedure Revolve3;
    procedure Param;
  public
    procedure CreateSW(md: IModelDoc); virtual;
    constructor Create;
  end;

function CheckDim(Doc:Imodeldoc; Value:double): Boolean;
function StandardNumber(d: Real): Real;

implementation

function CheckDim (Doc:Imodeldoc; Value:double):boolean;
var
  sm: ISelectionMgr;
  unk: IUnknown;
  dim: IDimension;
begin
  Result:= false;
  sm:= doc.ISelectionManager;
  if sm = nil then
    exit;
  if sm.GetSelectedObjectCount <= 0 then
    exit;
  if sm.GetSelectedObjectType(1) <> 14 then
    exit;
  unk:= sm.IGetSelectedObject(1);
  if unk = nil then
    exit;
  unk.QueryInterface(IID_IDimension, dim);
  if dim = nil then
    exit;
  dim.SetValue2(value, 0);
  Result:= true;
end;

function StandardNumber(d: Real): Real;
var
  i: Integer;
  StNum: array[0..107] of Real;
begin
   StNum[0]:= 3.2;         StNum[54]:= 56;
   StNum[1]:= 3.4;         StNum[55]:= 60;
   StNum[2]:= 3.6;         StNum[56]:= 62;
   StNum[3]:= 3.8;         StNum[57]:= 63;
   StNum[4]:= 4;           StNum[58]:= 65;
   StNum[5]:= 4.2;         StNum[59]:= 67;
   StNum[6]:= 4.5;         StNum[60]:= 70;
   StNum[7]:= 4.8;         StNum[61]:= 71;
   StNum[8]:= 5;           StNum[62]:= 72;
   StNum[9]:= 5.3;         StNum[63]:= 75;
   StNum[10]:= 5.6;        StNum[64]:= 80;
   StNum[11]:= 6;          StNum[65]:= 85;
   StNum[12]:= 6.3;        StNum[66]:= 90;
   StNum[13]:= 6.7;        StNum[67]:= 95;
   StNum[14]:= 7.1;        StNum[68]:= 100;
   StNum[15]:= 7.5;        StNum[69]:= 105;
   StNum[16]:= 8;          StNum[70]:= 110;
   StNum[17]:= 8.5;        StNum[71]:= 120;
   StNum[18]:= 9;          StNum[72]:= 125;
   StNum[19]:= 9.5;        StNum[73]:= 130;
   StNum[20]:= 10;         StNum[74]:= 140;
   StNum[21]:= 10.5;       StNum[75]:= 150;
   StNum[22]:= 11;         StNum[76]:= 160;
   StNum[23]:= 11.5;       StNum[77]:= 170;
   StNum[24]:= 12;         StNum[78]:= 180;
   StNum[25]:= 13;         StNum[79]:= 190;
   StNum[26]:= 14;         StNum[80]:= 200;
   StNum[27]:= 15;         StNum[81]:= 210;
   StNum[28]:= 16;         StNum[82]:= 220;
   StNum[29]:= 17;         StNum[83]:= 240;
   StNum[30]:= 18;         StNum[84]:= 250;
   StNum[31]:= 19;         StNum[85]:= 260;
   StNum[32]:= 20;         StNum[86]:= 280;
   StNum[33]:= 21;         StNum[87]:= 300;
   StNum[34]:= 22;         StNum[88]:= 320;
   StNum[35]:= 24;         StNum[89]:= 340;
   StNum[36]:= 25;         StNum[90]:= 360;
   StNum[37]:= 26;         StNum[91]:= 380;
   StNum[38]:= 28;         StNum[92]:= 400;
   StNum[39]:= 30;         StNum[93]:= 420;
   StNum[40]:= 32;         StNum[94]:= 450;
   StNum[41]:= 34;         StNum[95]:= 480;
   StNum[42]:= 35;         StNum[96]:= 500;
   StNum[43]:= 36;         StNum[97]:= 530;
   StNum[44]:= 38;         StNum[98]:= 560;
   StNum[45]:= 40;         StNum[99]:= 600;
   StNum[46]:= 42;         StNum[100]:= 630;
   StNum[47]:= 45;         StNum[101]:= 670;
   StNum[48]:= 47;         StNum[102]:= 710;
   StNum[49]:= 48;         StNum[103]:= 750;
   StNum[50]:= 50;         StNum[104]:= 800;
   StNum[51]:= 52;         StNum[105]:= 850;
   StNum[52]:= 53;         StNum[106]:= 900;
   StNum[53]:= 55;         StNum[107]:= 950;

  Result:= 0;
  for i:= 0 to 107 do
    if StNum[i] >= d then
    begin
      Result:= StNum[i];
      Break;
    end;
end;

{ TCustom }

procedure TCustom.Calc;
begin

end;

procedure TCustom.CreateSW(md: IModelDoc);
begin
  Self.md:= md;
  SelMgr:= Self.md.ISelectionManager;
  FindPlanes;
end;

procedure TCustom.Ex(const msg: string);
begin
  raise Exception.Create(msg);
end;

procedure TCustom.Sponka;
var
   Seg: array[0..3] of ISketchSegment;
   CP:ISketchPoint;
  // cl:ISketchSegment;
  // l: ISketchLine;
   // Ширина шпонки
   bs: Real;
   // Глубина шпоночного паза
   t: Real;
begin
  SponkaCalc(bs, t);
  (yzPlane as IFeature).Select(False);
  md.InsertSketch;
  if not md.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0) then
    ex('');
  cp:= SelMgr.IGetSelectedObject(1) as ISketchPoint;
  if cp = nil then
    ex('');
  md.ClearSelection;
  Seg[0]:= md.ICreateLine2(-bs/2000, 0, 0, -bs/2000, (d0/2000 + t/1000), 0 ) ;
  if seg[0]<> nil then
  md.SketchAddConstraints ('sgVERTICAL')
  else ex('');
  Seg[1]:= md.ICreateLine2 ( -bs/2000, (d0/2000 + t/1000), 0,bs/2000, (d0/2000 + t/1000), 0 ) ;
   if seg[1]<> nil then
  md.SketchAddConstraints ('sgHORIZONTAL')
  else ex('');
  Seg[2]:= md.ICreateLine2 (bs/2000, (d0/2000 + t/1000), 0, bs/2000, 0, 0 ) ;
   if seg[2]<> nil then
  md.SketchAddConstraints ('sgVERTICAL')
  else ex('');
  Seg[3]:= md.ICreateLine2 ( bs/2000, 0, 0,-bs/2000, 0, 0 ) ;
   if seg[3]<> nil then
  md.SketchAddConstraints ('sgHORIZONTAL')
  else ex('');

  Seg[3].Select (false);
  cp.Select(true);
  md.SketchAddConstraints ('sgCOINCIDENT');
  Seg[0].Select(false);
  Seg[2].Select (true);
  md.AddHorizontalDimension (l_st/2000, -0.0004*d0, 0);
  CheckDim(md, bs);

  Seg[0].Select(false);
  cp.Select(true);
  md.AddHorizontalDimension (l_st/2000, -0.0006*d0, 0);
  CheckDim(md, bs/2);

  Seg[1].Select(false);
  Seg[3].Select (true);
  md.AddVerticalDimension (0, 0.0004*d0, -0.0004*d0);
  CheckDim(md, d0/2 + t);
  md.featurecut(true, false, true, 0, 0, l_st/1000, 0.01, false, false, false,false, 0.01745329251994, 0.01745329251994, false, false);
end;

procedure TCustom.Revolve1;
var
  Seg: array[0..11] of ISketchSegment;
  cp: ISketchPoint;
  cl: ISketchSegment;
begin
  if not (xyPlane as IFeature).Select(False) then
    ex('Не выбрана плоскость XY');
  md.InsertSketch;
  if not md.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0) then
    ex('Не выбрана СP');
  cp:= SelMgr.IGetSelectedObject(1) as ISketchPoint;
  if cp = nil then
    ex('Не выбрана СP');
  md.ClearSelection;
  md.CreateCenterLineVB(0, 0, 0, l_st/1000, 0, 0);
  cl:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl = nil then
    ex('Не создана СL');
  md.SketchAddConstraints('sgHORIZONTAL');
  if (cl as ISketchLine).IGetStartPoint2.Select(False) and
    cp.Select(true) then
    md.SketchAddConstraints('sgCOINCIDENT')
  else
    ex('Не создана взаимосвязь');
  Seg[0]:= md.ICreateLine2(0, d0/2000, 0, 0, d_st/2000, 0);
   if seg[0]<> nil then
  md.SketchAddConstraints('sgVERTICAL')
  else ex('');
  Seg[1]:= md.ICreateLine2(0, d_st/2000, 0, f1/1000, d_st/2000, 0);
   if seg[1]<> nil then
  md.SketchAddConstraints('sgHORIZONTAL')
  else ex('');
  Seg[2]:= md.ICreateLine2(f1/1000, d_st/2000, 0, f1/1000, d_old/2000, 0);
   if seg[2]<> nil then
  md.SketchAddConstraints('sgVERTICAL')
  else ex('');
  Seg[3]:= md.ICreateLine2(f1/1000, d_old/2000, 0, (f1+c/2-b/2)/1000, d_old/2000, 0);
   if seg[3]<> nil then
  md.SketchAddConstraints('sgHORIZONTAL')
  else ex('');
  Seg[4]:= md.ICreateLine2((f1+c/2-b/2)/1000, d_old/2000, 0, (f1+c/2-b/2)/1000, d_sh/2000, 0);
   if seg[4]<> nil then
  md.SketchAddConstraints('sgVERTICAL')
  else ex('');
  Seg[5]:= md.ICreateLine2((f1+c/2-b/2)/1000, d_sh/2000, 0, (f1+c/2+b/2)/1000, d_sh/2000, 0);
   if seg[5]<> nil then
  md.SketchAddConstraints ('sgHORIZONTAL')
 else ex('');
  Seg[6]:= md.ICreateLine2((f1+c/2+b/2)/1000, d_sh/2000, 0, (f1+c/2+b/2)/1000, d_old/2000, 0);
   if seg[6]<> nil then
  md.SketchAddConstraints('sgVERTICAL')
  else ex('');
  Seg[7]:= md.ICreateLine2((f1+c/2+b/2)/1000, d_old/2000, 0, (f1+c)/1000, d_old/2000, 0);
 if seg[7]<> nil then
  md.SketchAddConstraints('sgHORIZONTAL')
  else ex('');
  Seg[8]:= md.ICreateLine2((f1+c)/1000, d_old/2000, 0, (f1+c)/1000, d_st/2000, 0);
   if seg[8]<> nil then
  md.SketchAddConstraints('sgVERTICAL')
  else ex('');
  Seg[9]:= md.ICreateLine2((f1+c)/1000, d_st/2000, 0, l_st/1000, d_st/2000, 0);
  if seg[9]<> nil then
  md.SketchAddConstraints('sgHORIZONTAL')
  else ex('');
  Seg[10]:= md.ICreateLine2(l_st/1000, d_st/2000, 0, l_st/1000, d0/2000, 0);
   if seg[10]<> nil then
  md.SketchAddConstraints('sgVERTICAL')
  else ex('');
  Seg[11]:= md.ICreateLine2(l_st/1000, d0/2000, 0, 0, d0/2000, 0);
  if seg[11]<> nil then
  md.SketchAddConstraints('sgHORIZONTAL')
  else ex('');
  // Простановка размеров
  if (Seg[1].Select(false)) and (Seg[9].Select(true)) then
  md.SketchAddConstraints('sgCOLINEAR')
  else ex('');
  if (Seg[3].Select(false)) and (Seg[7].Select(true)) then
  md.SketchAddConstraints('sgCOLINEAR')
  else ex('');
  if (cp.Select(false)) and (Seg[5].Select(true)) then
  begin
  md.AddVerticalDimension(-l_st/3000, -0.0005*d0, 0);
  CheckDim(md, d_sh/2);
  end
  else ex('');
  if (Seg[1].Select(false)) and (cp.Select(true)) then
  begin
  md.AddVerticalDimension(-l_st/2000, -0.00025*d0, 0);
  CheckDim(md, d_st/2);
  end
  else ex('');
   if (cp.Select(false)) and (Seg[3].Select(true)) then
   begin
  md.AddVerticalDimension(-l_st/2000, -0.00025*d0, 0);
  CheckDim(md, d_old/2);
  end
  else ex('');
 if (Seg[4].Select(false)) and (Seg[6].Select(true)) then
 begin
  md.AddHorizontalDimension((l_st/1000+0.005), 0.0003*d_sh, 0);
  CheckDim(md, b);
 end
 else ex('');
  if (Seg[0].Select(false)) and (Seg[10].Select(true)) then
  begin
  md.AddHorizontalDimension(l_st/2000, -0.0002*d_st, 0);
  CheckDim(md, l_st);
  end
  else ex('');
  if (Seg[2].Select(false)) and (Seg[8].Select(true)) then
  begin
  md.AddHorizontalDimension(l_st/2000, -0.0002*d_st, 0);
  CheckDim(md, c);
  end
  else ex('');
   if (cp.Select(false)) and (Seg[11].Select(true)) then
   begin
  md.AddDimension((l_st/1000+0.005), 0.0002*d_sh, 0);
  CheckDim(md, d0/2);
  end
  else ex('');
   if (cp.Select(false)) and (Seg[0].Select(true)) then
  md.SketchAddConstraints('sgCOINCIDENT')
  else ex('');
   if (Seg[2].Select(false)) and (Seg[4].Select(true)) then
   begin
  md.AddHorizontalDimension(l_st/2000, -0.0002*d_st, 0);
  CheckDim(md, b/2-c/2);
  end
  else ex('');

 Seg[0].Select(false);
  Seg[2].Select(true);
  md.AddVerticalDimension(-l_st/2000, -0.00025*d0, 0);
  CheckDim(md, f1);

  // вращение
  if md.FeatureRevolve2(2*pi, false, 0, 0, 0) <> 0 then
    ex('Не создано тело вращения');
  SegL:= Seg[4];
  SegT:= Seg[5];
  SegR:= Seg[6]
end;


procedure TCustom.Revolve2;
var
  Seg: array[0..5] of ISketchSegment;
  cp: ISketchPoint;
  cl: ISketchSegment;
begin
  if not (xyPlane as IFeature).Select(False) then
    ex('Не выбрана плоскость XY');
  md.InsertSketch;
  if not md.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0) then
    ex('Не выбрана СP');
  cp:= SelMgr.IGetSelectedObject(1) as ISketchPoint;
  if cp = nil then
    ex('Не выбрана СP');
  md.ClearSelection;
  md.CreateCenterLineVB(0, 0, 0, l_st/1000, 0, 0);
  cl:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl = nil then
    ex('Не создана СL');
  md.SketchAddConstraints('sgHORIZONTAL');
  if (cl as ISketchLine).IGetStartPoint2.Select(False) and
    cp.Select(true) then
    md.SketchAddConstraints('sgCOINCIDENT')
  else
    ex('Не создана взаимосвязь');

    Seg[0]:= md.ICreateLine2 (0, d0/2000 , 0, 0, d_sh/2000, 0 ) ;
     if seg[0]<> nil then
  md.SketchAddConstraints ('sgVERTICAL')
  else ex('');
  Seg[1]:= md.ICreateLine2 (0,  d_sh/2000, 0, b/1000, d_sh/2000, 0 ) ;
   if seg[1]<> nil then
  md.SketchAddConstraints ('sgHORIZONTAL')
  else ex('');
  Seg[2]:= md.ICreateLine2 (b/1000, d_sh/2000, 0, b/1000, d_st/2000, 0 ) ;
   if seg[2]<> nil then
  md.SketchAddConstraints ('sgVERTICAL')
  else ex('');
  Seg[3]:= md.ICreateLine2 ( b/1000, d_st/2000, 0, l_st/1000, d_st/2000, 0 ) ;
   if seg[3]<> nil then
  md.SketchAddConstraints ('sgHORIZONTAL')
  else ex('');
  Seg[4]:= md.ICreateLine2 (l_st/1000, d_st/2000, 0, l_st/1000, d0/2000, 0 ) ;
   if seg[4]<> nil then
  md.SketchAddConstraints ('sgVERTICAL')
    else ex('');
  Seg[5]:= md.ICreateLine2 (l_st/1000, d0/2000, 0, 0, d0/2000, 0 ) ;
   if seg[5]<> nil then
   md.SketchAddConstraints ('sgHORIZONTAL')
  else ex('');
  // Простановка размеров
  if (cp.Select(false)) and (Seg[5].Select(true)) then
  begin
  md.AddDimension (-l_st/3000, 0.00025*d0, 0);
  CheckDim(md, d0/2);
  end
  else ex('');
  if (cp.Select(false)) and (Seg[1].Select(true)) then
  begin
  md.AddDimension (-l_st/2000, 0.00025*d0, 0);
  CheckDim(md, d_sh/2);
  end
  else ex('');
  if (Seg[0].Select(false)) and (Seg[2].Select(true)) then
  begin
  md.AddHorizontalDimension ((l_st/1000+0.005), 0.0003*d_sh, 0);
  CheckDim(md, b);
  end
  else ex('');
   if (Seg[0].Select(false)) and (Seg[4].Select(true)) then
   begin
  md.AddHorizontalDimension (l_st/2000, -0.0002*d_st, 0);
  CheckDim(md, l_st);
   end
   else ex('');
   
  cp.Select(false);
  Seg[3].Select (true);
  md.AddVerticalDimension ((l_st/1000+0.005), 0.0002*d_sh, 0);
  CheckDim(md, d_st/2);

  Seg[0].Select (false);
  cp.Select(true);
  md.SketchAddConstraints ('sgCOINCIDENT');
 // вращение
  if md.FeatureRevolve2(2*pi, false, 0, 0, 0) <> 0 then
    ex('Не создано тело вращения');
  SegL:= Seg[0];
  SegT:= Seg[1];
  SegR:= Seg[2]

end;

procedure TCustom.Revolve3;
var
  Seg: array[0..3] of ISketchSegment;
  cp: ISketchPoint;
  cl: ISketchSegment;
begin
  if not (xyPlane as IFeature).Select(False) then
    ex('Не выбрана плоскость XY');
  md.InsertSketch;
  if not md.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0) then
    ex('Не выбрана СP');
  cp:= SelMgr.IGetSelectedObject(1) as ISketchPoint;
  if cp = nil then
    ex('Не выбрана СP');
  md.ClearSelection;
  md.CreateCenterLineVB(0, 0, 0, l_st/1000, 0, 0);
  cl:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl = nil then
    ex('Не создана СL');
  md.SketchAddConstraints('sgHORIZONTAL');
  if (cl as ISketchLine).IGetStartPoint2.Select(False) and
    cp.Select(true) then
    md.SketchAddConstraints('sgCOINCIDENT')
  else
    ex('Не создана взаимосвязь');

  Seg[0]:= md.ICreateLine2 (0, d0/2000 , 0, 0, d_sh/2000, 0 ) ;
   if seg[0]<> nil then
  md.SketchAddConstraints ('sgVERTICAL')
  else ex('');
  Seg[1]:= md.ICreateLine2 (0,  d_sh/2000, 0, b/1000, d_sh/2000, 0 ) ;
   if seg[1]<> nil then
  md.SketchAddConstraints ('sgHORIZONTAL')
  else ex('');
  Seg[2]:= md.ICreateLine2 (b/1000, d_sh/2000, 0, b/1000, d0/2000, 0 ) ;
   if seg[2]<> nil then
  md.SketchAddConstraints ('sgVERTICAL')
  else ex('');
  Seg[3]:= md.ICreateLine2 ( b/1000, d0/2000, 0, 0, d0/2000, 0 ) ;
   if seg[3]<> nil then
  md.SketchAddConstraints ('sgHORIZONTAL')
   else ex('');

  // Простановка размеров
  cp.Select(false);
  Seg[3].Select (true);
  md.AddVerticalDimension (-l_st/3000, 0.00025*d0, 0);
  CheckDim(md, d0/2);

  cl.Select(false);
  Seg[1].Select (true);
  md.AddVerticalDimension (-l_st/2000, 0.00025*d0, 0);
  CheckDim(md, d_sh/2);

  Seg[0].Select(false);
  Seg[2].Select (true);
  md.AddHorizontalDimension ((l_st/1000+0.005), 0.0003*d_sh, 0);
  CheckDim(md, b);
  

  Seg[0].Select (false);
  cp.Select(true);
  md.SketchAddConstraints ('sgCOINCIDENT');
 // вращение
  if md.FeatureRevolve2(2*pi, false, 0, 0, 0) <> 0 then
    ex('Не создано тело вращения');
  SegL:= Seg[0];
  SegT:= Seg[1];
  SegR:= Seg[2]

end;

procedure TCustom.SponkaCalc(out bs, t: Real);
begin
  if (d0 > 12) and (d0 <= 17) then
  begin
    bs:=5;
    t:=2.3;
  end
  else if (d0 > 17) and (d0 <= 22) then
  begin
    bs:=6;
    t:=2.8;
  end
  else if (d0 > 22) and (d0 <= 30) then
  begin
    bs:=8;
    t:=3.3;
  end
  else if (d0 > 30) and (d0 <= 38) then
  begin
    bs:=10;
    t:=3.3;
  end
  else if (d0 > 38) and (d0 <= 44) then
  begin
    bs:=12;
    t:=3.3;
  end
  else if (d0 > 44) and (d0 <= 50) then
  begin
    bs:=14;
    t:=3.8;
  end
  else if (d0 > 50) and (d0 <= 58) then
  begin
    bs:=16;
    t:=4.3;
  end
  else if (d0 > 58) and (d0 <= 65) then
  begin
    bs:=18;
    t:=4.4;
  end
  else if (d0 > 65) and (d0 <= 75) then
  begin
    bs:=20;
    t:=4.9;
  end
  else if (d0 > 75) and (d0 <= 85) then
  begin
    bs:=22;
    t:=5.4;
  end
  else if (d0 > 85) and (d0 <= 95) then
  begin
    bs:=25;
    t:=5.4;
  end
  else
    Ex('Невозможно подобрать параметры шпоночного паза');
end;

procedure TCustom.FindPlanes;
var
  f: IFeature;
  rp: IRefPlane;
  i: Byte;
  v: Variant;
begin
  f:= md.IFirstFeature;
  i:= 0;
  while (f <> nil) and (i <= 3) do
  begin
    if f.GetTypeName = 'RefPlane' then
    begin
      rp:= f.GetSpecificFeature as IRefPlane;
      v:= rp.GetRefPlaneParams;
      if (v[0] = 0) and (v[1] = 0) and (v[2] = 0) then
      begin
        Inc(i);
        if (v[6] = 0) and (v[7] = 0) and (v[8] <> 0) then
          xyPlane:= rp
        else if (v[6] <> 0) and (v[7] = 0) and (v[8] = 0) then
          yzPlane:= rp
        else if (v[6] = 0) and (v[7] <> 0) and (v[8] = 0) then
          xzPlane:= rp;
       end;
    end;
    f:= f.IGetNextFeature;
  end;
  if (xyPlane = nil) or (yzPlane = nil) or (xzPlane = nil) then
    ex('Найдены не все главные плоскости');
end;

procedure TCustom.Param;
begin
  // Фаска на венце
  if (d_sh > 12)   and (d_sh <= 40)   then  c1:=0.6
  else
  if (d_sh > 40)   and (d_sh <= 100)  then  c1:=1
  else
  if (d_sh > 100)  and (d_sh <= 250)  then  c1:=1.6
  else
  if (d_sh > 250)  and (d_sh <= 400)  then  c1:=2
  else
  if (d_sh > 400)  and (d_sh <= 630)  then  c1:=3
  else
  if (d_sh > 630)  and (d_sh <= 1000) then  c1:=4
  else
  if (d_sh > 1000) and (d_sh <= 1600) then  c1:=5
  else
  if (d_sh > 1600) and (d_sh <= 2000) then  c1:=6
  else     Ex('Невозможно подобрать параметры фаски');
  // Фаска и скругления на ступице
  if (d_st > 10) and (d_st <= 18) then
  begin
    c2:=1;
    r2:=1.6;
  end
  else
  if (d_st > 18) and (d_st <= 28) then
  begin
    c2:=1.6;
    r2:=2;
  end
  else
  if (d_st > 28) and (d_st <= 46) then
  begin
    c2:=2;
    r2:=2.5;
  end
  else
  if (d_st > 46) and (d_st <= 68) then
  begin
    c2:=2.5;
    r2:=3;
  end
  else
  if (d_st > 68) and (d_st <= 100) then
  begin
    c2:=3;
    r2:=4;
  end
  else
  if (d_st > 100) and (d_st <= 150) then
  begin
    c2:=4;
    r2:=5;
  end
  else
  if (d_st > 150) and (d_st <= 200) then
  begin
    c2:=5;
    r2:=6;
  end
  else
  if (d_st > 200) and (d_st <= 250) then
  begin
    c2:=6;
    r2:=8;
  end
  else
  if (d_st > 250) and (d_st <= 300) then
  begin
    c2:=8;
    r2:=10;
  end
  else
      Ex('Невозможно подобрать параметры фаски и скругления на ступице');
end;

constructor TCustom.Create;
begin
  Calc;
end;

end.
