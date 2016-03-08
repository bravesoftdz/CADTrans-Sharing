unit Poliklin_Shkiv;

interface
uses
  sysutils, windows, math, SldWorks_TLB, Sw_HLP;

type
  TPoliKlinSkiv= class(TCustom)
  protected
    n: Byte;
    type_size: string;
    r_1,r_2, e, alfa, f, d_a: Real;
    pp1, pp2: ISketchPoint;
    RevolveCutFeature, Feat1,Feat2: IFeature;
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
 
{ TPoliKlinSkiv }

procedure TPoliKlinSkiv.Calc;
var
h,w: real;
begin
 d_st:= 1.6*d0 + 10;

  L_st:= StandardNumber(L_st);
  d0:= StandardNumber(d0);
  d_st:= StandardNumber(d_st);


   if (type_size='к')
  then
   begin
     h:=2.5;
     e:=2.4;
     f:=3.5;
     r_1:=0.25;
     r_2:= 0.25;
   end;
   if (type_size='л')
  then
   begin
     h:=4.68;

     e:=4.8;
     f:=5.5;
     r_1:=0.45;
     r_2:= 0.45;
   end;
    if (type_size='м')
  then
   begin
     h:=9.6;

     e:=9.5;
     f:=10;
     r_1:=0.9;
     r_2:= 0.7;
   end;
  w:= 1.6*h;
  c:=1.25* w;
  c:= StandardNumber(c);
  param;
   r1:=r2;
  f1:= r2+c2+5;
  d_a:= d_sh - 2*h;
  d_old:= d_sh -2*(h+w);
  alfa:=35;
end;

constructor TPoliKlinSkiv.Create(_d0, _d_sh, _b: Real; _n: Byte;
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
  inherited Create;
end;

procedure TPoliKlinSkiv.CreateArray;
begin
 md.ViewDispTempRefaxes;
  if md.SelectByMark('', 'AXIS', l_st/2000, 0, 0, 1) and
    RevolveCutFeature.SelectByMark(true, 4) and Feat1.SelectByMark(true, 4)
    and Feat2.SelectByMark(true, 4) then
    md.FeatureLinearPattern(n, e/1000, 0 , 0, false, false, 'e', 'NULL')
  else
    ex('Не создан массив');
end;

procedure TPoliKlinSkiv.CreateSW(md: IModelDoc);
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

procedure TPoliKlinSkiv.EdgesProc;
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
        edges[14]:= edge
      else if (v[0] > pp1.x+(pp2.x-pp1.x)/4) and (v[0] < pp2.x-(pp2.x-pp1.x)/4) and (v[6] < (d_sh+d_a)/4000)and (v[6] > (d_old+d_a)/4000) then
        edges[15]:= edge;
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
  if edges[15] <> nil then
   (edges[15] as IEntity).Select(True);
  if SelMgr.GetSelectedObjectCount > 0 then
  md.featurefillet(r_2/1000,false,false,false,0);
  Feat2:= SelMgr.IGetSelectedObject(1) as IFeature;
  if Feat1 = nil then
    ex('Не выбрано скругление');
end;




procedure TPoliKlinSkiv.RevolveCut;
var
  Seg: array[0..2] of ISketchSegment;
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
  Seg[0]:= md.ICreateLine2(x0+(f-e/2)/1000, y0, 0, x0+f/1000, d_a/2000, 0);
  Seg[1]:= md.ICreateLine2(x0+f/1000, d_a/2000, 0, x0+(f+e)/1000, y0, 0);
  Seg[2]:= md.ICreateLine2(x0+(f+e)/1000, y0, 0, x0+(f-e/2)/1000, y0, 0);
  md.SketchAddConstraints('sgHORIZONTAL');

  // Простановка размеров и взаимосвязей
  cl.Select(false);
  Seg[0].Select(true);
  seg[1].SelectByMark(true, 3);
  md.SketchAddConstraints('sgSYMMETRIC');
  Seg[2].Select(false);
  SegT.Select(true);
  md.SketchAddConstraints('sgCOLINEAR');
  cl.Select(false);
  SegL.Select(true);
  md.AddhorizontalDimension(x0+f/2000, y0+0.015, 0);
  CheckDim(md, f);
  if cp.Select(false) and
    (Seg[0] as ISketchLine).IGetEndPoint2.Select(true) then
  begin
    md.AddVerticalDimension(-b/4000, d_a/2000, 0);
    CheckDim(md, d_a/2);
  end
  else
    ex('Ошибка');

  (seg[0] as ISketchLine).IGetStartPoint2.SetCoords(-1, 0, 0);
  Seg[0].Select(false);
  Seg[1].Select(true);
  md.AddDimension(f/1000, d_sh/2000+0.015, 0);
  CheckDim(md, Alfa);
   //осевая 1
  md.ClearSelection;
  md.CreateCenterLineVB(0, 0, 0, (f+b)/1000, 0, 0);
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
  pp1:= (Seg[0] as ISketchLine).IGetStartPoint2;
  pp2:= (Seg[1] as ISketchLine).IGetEndPoint2;
end;



end.
