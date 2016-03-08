unit Klin_Skiv;

interface
uses
  sysutils, windows, math, SldWorks_TLB, Sw_HLP;

type
  TKlinSkiv= class(TCustom)
  protected
    n: Byte;
    type_size: string;
    r_1, e, alfa, f, B_min, d_a: Real;
    pp1, pp2: ISketchPoint;
    RevolveCutFeature, Feat1: IFeature;
    procedure Calc; override;
     procedure RevolveCut;
    // фаски и скругления
    procedure EdgesProc;
    procedure CreateArray;
  public
    constructor Create(_d0, _d_sh, _b: Real; _n: Byte; _type_size: string);
    procedure CreateSW(md: IModelDoc); override;
  end;

implementation

{ TKlinSkiv }

procedure TKlinSkiv.Calc;
var
 b_1,h,w,lr: Real;
begin
  d_st:= 1.6*d0+10;
   L_st:= StandardNumber(L_st);
  d0:= StandardNumber(d0);
  d_st:= StandardNumber(d_st);
  if type_size = 'о' then
  begin
    b_1:= 2.5;
    h:= 7;
    e:= 12;
    f:= 8;
    r_1:= 0.5;
    Lr:= 8.5;
    if (d_sh >= 63) and (d_sh < 71) then
    begin
      alfa:= 0.5931;
    end;
    if (d_sh >= 80) and (d_sh < 100) then
    begin
      alfa:= 0.628;
    end;
    if (d_sh >= 112) and (d_sh < 160)  then
    begin
      alfa:= 0.6629;
    end;
    if d_sh >=180 then
    begin
      alfa:= 0.6977;
    end;

  end else
  if (type_size = 'а') then
  begin
    b_1:=3.3;
    h:=8.7;
    e:=15;
    f:=10;
    r_1:=1;
    Lr:= 11;
    if (d_sh >= 90) and (d_sh < 112) then
    begin
      alfa:= 0.5931;
    end;
    if (d_sh >= 125) and(d_sh < 160) then
    begin
      alfa:= 0.628;
    end;
    if (d_sh >= 180) and (d_sh < 400) then
    begin
       alfa:= 0.6629;
    end;
     if d_sh >=450 then
    begin
      alfa:= 0.6977;
    end;

  end else
  if (type_size = 'б') then
  begin
    b_1:=4.2;
    h:=10.2;
    e:=19;
    f:=12.5;
    r_1:=1;
    Lr:= 14;
    if (d_sh >= 125) and (d_sh < 160) then
    begin
      alfa:= 0.5931;
    end;
    if (d_sh >= 180) and (d_sh < 224) then
    begin
      alfa:= 0.628;
    end;
    if (d_sh >= 250) and (d_sh < 500) then
    begin
      alfa:= 0.6629;
    end;
     if d_sh >=560 then
    begin
      alfa:= 0.6977;
    end;

  end else

  if (type_size = 'в') then
  begin
    b_1:=5.7;
    h:=13.5;
    e:=25.5;
    f:=17;
    r_1:=1.5;
    Lr:= 19;
    if (d_sh >= 200) and (d_sh < 315) then
    begin
      alfa:= 0.628;
    end;
    if (d_sh >= 355) and (d_sh < 630) then
    begin
      alfa:= 0.6629;
    end;
    if d_sh >=710 then
    begin
      alfa:= 0.6977;
    end;

  end else

  if (type_size = 'г') then
  begin
    b_1:=8.1;
    h:=19;
    e:=37;
    f:=24;
    r_1:=2;
    Lr:= 27;
    if (d_sh >= 315) and (d_sh < 450) then
    begin
      alfa:= 0.628;
    end;
    if (d_sh >= 500) and (d_sh < 900) then
    begin
      alfa:= 0.6629;
    end;
     if d_sh >=1000 then
    begin
      alfa:= 0.6977;
    end;

  end else

  if (type_size = 'д') then
  begin
    b_1:=9.6;
    h:=23.5;
    e:=44.5;
    f:=29;
    r_1:=2;
    Lr:= 32;
    if (d_sh >= 500) and (d_sh < 560) then
    begin
      alfa:= 0.628;
    end;
    if (d_sh >= 630) and (d_sh < 1120) then
    begin
      alfa:= 0.6629;
    end;
     if d_sh >=1250 then
    begin
      alfa:= 0.6977;
    end;

  end else

  if (type_size = 'е') then
  begin
    b_1:=12.5;
    h:=30;
    e:=58;
    f:=38;
    r_1:=2.5;
    Lr:= 42;
    if (d_sh >= 800) and (d_sh < 1400) then
    begin
      alfa:= 0.6629;
    end;
   if d_sh >=1600 then
    begin
      alfa:= 0.6977;
    end;

  end else
  if (type_size='уо') then
  begin
    b_1:=2.5;
    h:=9;
    e:=12;
    f:=8;
    r_1:=0.5;
    Lr:= 8.5;
    if (d_sh >= 63) and (d_sh < 80) then
    begin
      alfa:= 0.5931;
    end;
    if d_sh >= 80 then
    begin
      alfa:= 0.6629;
    end;
  end else
  if (type_size = 'уа') then
  begin
    b_1:=3;
    h:=12;
    e:=15;
    f:=10;
    r_1:=1;
    Lr:= 11;
    if (d_sh >= 90) and (d_sh < 112) then
    begin
      alfa:= 0.5931;
    end;
    if d_sh >= 112 then
    begin
      alfa:= 0.6629;
    end;
  end else
  if (type_size = 'уб') then
  begin
    b_1:=4;
    h:=16;
    e:=19;
    f:=12.5;
    r_1:=1;
    Lr:= 14;
    if (d_sh >= 140) and (d_sh < 180) then
    begin
      alfa:= 0.5931;
    end;
    if d_sh >= 180 then
    begin
      alfa:= 0.6629;
    end;
  end else
    ex('Нет типа');
  w:= 1.2*h;
  c:=1.25*w;
  c:= StandardNumber(c);
  param;
  r1:=r2;
  f1:= r2+c2+5;

  B_min:= lr-2*tan(alfa/2)*h;
  d_a:= d_sh - 2*(b_1+h);
  d_old:= d_sh -2*(b_1+h+w);

end;

constructor TKlinSkiv.Create(_d0, _d_sh, _b: Real; _n: Byte;
  _type_size: string);
begin
  d0:= _d0;
  d_sh:= _d_sh;
  b:= _b;
  n:= _n;
  type_size:= _type_size;
  if d0 > 95 then
    ex('Посадочный диаметр слишком велик');
  if d_sh > 2000 then
    ex('Диаметр шкива слишком велик');
  if b > 400 then
    ex('Ширина шкива слишком велика');
  if (type_size='о') and (d_sh>160) then
  ex('Для данного типоразмера ремня велик диаметр шкива');
  if (type_size='а') and (d_sh>400) then
  ex('Для данного типоразмера ремня велик диаметр шкива');
   if (type_size='б') and (d_sh>500) then
  ex('Для данного типоразмера ремня велик диаметр шкива');
  inherited Create;
end;

procedure TKlinSkiv.CreateArray;
begin
  md.ViewDispTempRefaxes;
  if md.SelectByMark('', 'AXIS', l_st/2000, 0, 0, 1) and
    RevolveCutFeature.SelectByMark(true, 4) and Feat1.SelectByMark(true, 4) then
    md.FeatureLinearPattern(n, e/1000,0 , 0, false, false, 'e', 'NULL')
  else
    ex('Не создан массив');
end;

procedure TKlinSkiv.CreateSW(md: IModelDoc);
begin
  inherited CreateSW(md);
  l_st:= 1.35*d0;
 if l_st > b   then
 begin
  if d_sh > 3*d0 then
    Revolve1
  else
  begin
  c:=b;
  d_old:= (d_sh+ d_st)/2;
  f1:=0;
    Revolve2 ;
  end
 end
 else
  begin
  f1:=0;
  c:=b;
  d_st:=d_sh;
  l_st:=b;
  d_old:=d_sh/2;
  Revolve3;
  end;
  RevolveCut;
  EdgesProc;
  if n>1 then
  CreateArray;
  Sponka;
end;

procedure TKlinSkiv.EdgesProc;
var
  edges: array[1..15] of IEdge;
  cyl_face: IFace;

  procedure Edgeproc(var Edge: IEdge); stdcall;
  var
    curve: ICurve;
    v: Variant;
  begin
    curve:= Edge.IGetCurve;
    if curve.Identity = 3002 then
    begin
      v:= curve.Get_CircleParams;
      if (v[0] < l_st/2000) and (v[6] < (d0+d_st)/4000) then
        edges[1]:= edge
      else if (v[0] > l_st/2000) and (v[6] < (d0+d_st)/4000) then
        edges[2]:= edge
      else if (v[0] < f1/2000) and (v[6] > (d_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[3]:= edge
      else if (v[0] > (l_st-f1)/1000) and (v[6] > (d_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[4]:= edge
      else if (v[0] > f1/2000) and (v[0] < f1/1000+c/2000) and (v[6] > (D_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[5]:= edge
      else if (v[0] > (f1+c/2)/1000) and (v[0] < (f1+c+l_st)/2000) and (v[6] > (D_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[6]:= edge
      else if (v[0] > f1/2000) and (v[0] < f1/1000+c/2000) and ( v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_a)/4000) then
        edges[7]:= edge
       else if (v[0] > (f1+c/2)/1000) and (v[0] < (f1+c+f1+c/2+b/2)/2000) and ( v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_sh)/4000) then
        edges[8]:= edge
      else if (v[0] < f1/2000) and (v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_a)/4000)  then
        edges[9]:= edge
      else if (v[0] > (f1+c/2+b/2+f1+c)/2000) and (v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_a)/4000) then
        edges[10]:= edge
      else if (v[0] < ((SegL as ISketchLine).IGetEndPoint2.x+pp1.x)/2) and (v[6] > (d_sh+d_a)/4000) then
        edges[11]:= edge
      else if (v[0] > ((f1+c/2+b/2)/1000+pp2.x)/2) and (v[6] > (d_sh+d_a)/4000) then
        edges[12]:= edge
      else if (v[0] > ((SegL as ISketchLine).IGetEndPoint2.x+pp1.x)/2) and (v[0] < (f1+c/2-b/2+f)/1000) and (v[6] > (d_sh+d_a)/4000) then
        edges[13]:= edge
      else if (v[0] > (f1+c/2-b/2+f)/1000) and (v[0] < (pp2.x+(f1+c/2+b/2)/1000)/2) and (v[6] > (d_sh+d_a)/4000) then
        edges[14]:= edge;
    end;
  end;

  procedure faceproc(var Face: IFace); stdcall;
  var
    surface: ISurface;
  begin
    surface:= face.IGetSurface;
    if surface.IsCylinder then
      cyl_face:= Face;
  end;

  procedure EnumEdgesFaces;
  var
    face: IFace;
    i, j: Integer;
    enum_faces: IEnumFaces;
    enum_edges: IEnumEdges;
    Part: IPartDoc;
    edge: IEdge;
    hres: HRESULT;
  begin
    Part:= md as IPartDoc;
    if Part = nil then
      exit;
        enum_faces:= part.IBodyObject.EnumFaces;
        if enum_faces <> nil then
        begin
          i:= 0;
          hres:= enum_faces.Next(1, face, i);
          while (hres = S_OK) and (face <> nil) and (i > 0) do
          begin
            FaceProc(face);
            enum_edges:= face.EnumEdges;
            if enum_edges <> nil then
            begin
              j:= 0;
              hres:= enum_edges.Next(1, edge, j);
              while (hres = S_OK) and (edge <> nil) and (j > 0) do
              begin
                EdgeProc(edge);
                j:= 0;
                hres:= enum_edges.Next(1, edge, j);
              end;
            end;
            i:= 0;
            hres:= enum_faces.Next(1, face, i);
          end;
        end;
  end;
begin
  // Фаски и скругления
  EnumEdgesFaces;
  md.ClearSelection;
  if edges[1] <> nil then
    (edges[1] as IEntity).Select(True);
  if edges[2] <> nil then
    (edges[2] as IEntity).Select(True);
  if edges[3] <> nil then
    (edges[3] as IEntity).Select(True);
  if edges[4] <> nil then
    (edges[4] as IEntity).Select(True);
  if SelMgr.GetSelectedObjectCount > 0 then
  md.FeatureChamferType(1,c2/1000, 0.7853981633975, true, 0, 0, 0, 0);
  md.ClearSelection;
  if edges[9] <> nil then
    (edges[9] as IEntity).Select(True);
  if edges[10] <> nil then
    (edges[10] as IEntity).Select(True);
  if SelMgr.GetSelectedObjectCount > 0 then
  md.FeatureChamferType(1,c1/1000, 0.7853981633975, true, 0, 0, 0, 0);
  md.ClearSelection;
  if edges[5] <> nil then
    (edges[5] as IEntity).Select(True);
  if edges[6] <> nil then
    (edges[6] as IEntity).Select(True);
  if SelMgr.GetSelectedObjectCount > 0 then
  md.featurefillet(r2/1000,false,false,false,0);
  md.ClearSelection;
  if edges[7] <> nil then
    (edges[7] as IEntity).Select(True);
  if edges[8] <> nil then
    (edges[8] as IEntity).Select(True);
  if SelMgr.GetSelectedObjectCount > 0 then
  md.featurefillet(r1/1000,false,false,false,0);
  md.ClearSelection;
  if edges[13] <> nil then
    (edges[13] as IEntity).Select(True);
  if edges[14] <> nil then
    (edges[14] as IEntity).Select(True);
  if SelMgr.GetSelectedObjectCount > 0 then  
  md.featurefillet(r_1/1000,false,false,false,0);
  Feat1:= SelMgr.IGetSelectedObject(1) as IFeature;
  if Feat1 = nil then
    ex('Не выбрано скругление');
end;




procedure TKlinSkiv.RevolveCut;
var
  Seg: array[0..3] of ISketchSegment;
  cl, cl1: ISketchSegment;
  cp: ISketchPoint;
  x0, y0: Real;
begin
  if not (xyPlane as IFeature).Select(False) then
    ex('Не выбрана плоскость XY');
  md.InsertSketch;
  md.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0);
  cp:= SelMgr.GetSelectedObject(1) as ISketchPoint;
  if cp = nil then
    ex('Не выбрана ц.т.');
  x0:= (SegT as ISketchLine).IGetStartPoint2.x;
  y0:= (SegT as ISketchLine).IGetStartPoint2.y;
  //осевая
  md.ClearSelection;
  md.CreateCenterLineVB(x0+f/1000, y0, 0, x0+f/1000, d_a/2000, 0);
  cl:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl = nil then
    ex('Нет осевой');
  md.SketchAddConstraints('sgVERTICAL');
  Seg[0]:= md.ICreateLine2(x0+(f+b_min/2)/1000, d_a/2000, 0, x0+(f-b_min/2)/1000, d_a/2000, 0);
  md.SketchAddConstraints ('sgHORIZONTAL');
  Seg[1]:= md.ICreateLine2(x0+(f-b_min/2)/1000, d_a/2000, 0, x0+(f-b_min)/1000, y0, 0);
  Seg[2]:= md.ICreateLine2(x0+(f-b_min)/1000, y0, 0, x0+(f+b_min)/1000, y0, 0);
  md.SketchAddConstraints('sgHORIZONTAL');
  Seg[3]:= md.ICreateLine2(x0+(f+b_min)/1000, y0, 0, x0+(f+b_min/2)/1000, d_a/2000, 0);
  // Простановка размеров и взаимосвязей
  cl.Select(false);
  Seg[1].Select(true);
  seg[3].SelectByMark(true, 3);
  md.SketchAddConstraints('sgSYMMETRIC');
  Seg[2].Select(false);
  SegT.Select(true);
  md.SketchAddConstraints('sgCOLINEAR');
  cl.Select(false);
  SegL.Select(true);
  md.AddhorizontalDimension(x0+f/2000, y0+0.015, 0);
  CheckDim(md, f);
  if cp.Select(false) and
    Seg[0].Select(true) then
  begin
    md.AddVerticalDimension(-b_min/2000, d_a/2000, 0);
    CheckDim(md, d_a/2);
  end
  else
    ex('Ошибка');
  Seg[0].Select(false);
  md.AddhorizontalDimension(x0+f/1000, d_a/2000-0.015, 0);
  CheckDim(md, b_min);
  (seg[1] as ISketchLine).IGetEndPoint2.SetCoords(-1, 0, 0);
  Seg[1].Select(false);
  Seg[3].Select(true);
  md.AddDimension(f/1000, y0+0.015, 0);
  CheckDim(md, RadToDeg(Alfa));
   //осевая 1
  md.ClearSelection;
  md.CreateCenterLineVB(0, 0, 0, (f+b_min)/1000, 0, 0);
  cl1:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl1 = nil then
    ex('Нет осевой');
  md.SketchAddConstraints('sgHORIZONTAL');
  cp.Select(false);
  (cl1 as ISketchLine).IGetStartPoint2.Select(true);
  md.SketchAddConstraints('sgCOINCIDENT');
  cl1.Select(false);
  if md.FeatureRevolveCut2(2*pi,false, 0, 0, 0) <> 0 then
    ex('Вырез не создан');
  RevolveCutFeature:= SelMgr.IGetSelectedObject(1) as IFeature;
  pp1:= (Seg[1] as ISketchLine).IGetEndPoint2;
  pp2:= (Seg[2] as ISketchLine).IGetEndPoint2;
end;

end.
