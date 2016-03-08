unit Zub_shkiv;

interface
uses
  sysutils, windows, math, SldWorks_TLB, Sw_HLP,
   Messages,  Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  ExtCtrls, Spin, dll_in;
type
  TZubSkiv= class(TCustom)
  protected
    z: Byte;
    type_size: string;
     alfa, B_z, d_a,m,r_1,r_2: Real;
     b_z_max: real;
      edges: array[1..15] of IEdge;
    CutFeature,Feat1,Feat2: IFeature;
    procedure Calc; override;
     procedure RevolveCut;
    // фаски и скругления
    procedure EdgesProc;
    procedure EdgesProc2;
    procedure CreateArray;
  public
    constructor Create(_d0, _d_sh, _b, _m: Real; _z: Byte);
    procedure CreateSW(md: IModelDoc); override;
  end;
implementation

{ TZubSkiv }

procedure TZubSkiv.Calc;
var h,w: real;
begin
d_st:= 1.6*d0+10;

L_st:= StandardNumber(L_st);
d0:= StandardNumber(d0);
d_st:= StandardNumber(d_st);

 if (z>48) and (z<250) and (m=3) then
begin
 b_z:= 3.2;
 h:= 3;
end
else  if (z>48) and (z<250) and (m=4) then
begin
 b_z:= 4;
 h:= 4;
end
else if (z>48) and (z<200) and (m=5) then
begin
 b_z:= 4.8;
 h:= 5;
end
else  if (z>56) and (z<140) and (m=7) then
begin
 b_z:= 7.5;
 h:= 8.5;
end
else  if (z>56) and (z<100) and (m=10) then
begin
 b_z:= 11.5;
 h:= 12.5;
end ;

r_1 := 0.35*m;
r_2 := 0.4*m;

b:= b+m;
alfa:=50;
w:= 1.5*m+2;
c:=1.25*w;
c:= StandardNumber(c);
param;
r1:=r2;

f1:= r2+c2+5;
d_old:= d_sh -2*(h+w);
d_a:= d_sh - 2*h;
b_z_max:= 2*h*tan(25*pi/180)+b_z;
end;

constructor TZubSkiv.Create(_d0, _d_sh, _b, _m: Real; _z: Byte) ;
begin
 d0:= _d0;
  d_sh:= _d_sh;
  b:= _b;
  z:= _z;
  m:=_m;
   if d0 > 95 then
    ex('Посадочный диаметр слишком велик');
  if d_sh > 2000 then
    ex('Диаметр шкива слишком велик');
  if b > 400 then
    ex('Ширина шкива слишком велика');
   inherited Create;
end;

procedure TZubSkiv.CreateArray;
begin
 md.ViewDispTempRefaxes;
  if md.SelectByMark('', 'AXIS', l_st/2000, 0, 0, 1) and
   CutFeature.SelectByMark(true, 4) and
   Feat1.SelectByMark(true, 4)and
   Feat2.SelectByMark(true, 4) then
    md.FeatureCirPattern (z, 2*pi/z, false, 'NULL')
  else
    ex('Не создан массив');
end;

procedure TZubSkiv.CreateSW(md: IModelDoc);
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
   EdgesProc ;
  RevolveCut;
    EdgesProc2 ;
  if z>1 then
  CreateArray;
  Sponka;
end;

procedure TZubSkiv.EdgesProc;
var

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
      else if (v[0] < b/2) and (v[6] > (d_sh+d_a)/4000) then
        edges[11]:= edge
      else if (v[0] > b/2) and (v[6] > (d_sh+d_a)/4000) then
        edges[12]:= edge

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
   edges[1]:=nil;
      edges[2]:=nil;
      edges[3]:=nil;
      edges[4]:=nil;

end;

procedure TZubSkiv.EdgesProc2;
var

  cyl_face: IFace;

  procedure Edgeproc(var Edge: IEdge); stdcall;
  var
    curve: ICurve;
    v: Variant;
  begin
    curve:= Edge.IGetCurve;
    if curve.Identity = 3001 then
    begin
      v:= curve.Get_LineParams;

      if (v[3] <>0) and (v[4]=0) and (v[5]=0)
      then
      begin
         if (v[1]>(d_sh+d_a)/4000) then
          begin
          if (v[2]>0) then
          edges[1]:= edge
          else
          edges[2]:= edge;
          end;
         if (v[1]>(d_old +d_a)/4000)and (v[1]<(d_sh+d_a)/4000)  then
          begin
          if (v[2]>0) then
          edges[3]:= edge
          else
          edges[4]:= edge;
          end;
     end;
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
   if SelMgr.GetSelectedObjectCount > 0 then
  md.featurefillet(r_1/1000,false,false,false,0);
   Feat1:= SelMgr.IGetSelectedObject(1) as IFeature;
  if Feat1 = nil then
    ex('Не выбрано скругление');
  md.ClearSelection;
   if edges[3] <> nil then
    (edges[3] as IEntity).Select(True);
  if edges[4] <> nil then
    (edges[4] as IEntity).Select(True);
   if SelMgr.GetSelectedObjectCount > 0 then
  md.featurefillet(r_2/1000,false,false,false,0);
   Feat2:= SelMgr.IGetSelectedObject(1) as IFeature;
  if Feat2 = nil then
    ex('Не выбрано скругление');
  md.ClearSelection;
end;


procedure TZubSkiv.RevolveCut;
var
  Seg: array[0..3] of ISketchSegment;
  cl, cl1: ISketchSegment;
  cp: ISketchPoint;
  x0, y0: Real;
begin
  if not (yzPlane as IFeature).Select(False) then
    ex('Не выбрана плоскость zy');
  md.InsertSketch;
  md.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0);
  cp:= SelMgr.GetSelectedObject(1) as ISketchPoint;
  if cp = nil then
    ex('Не выбрана ц.т.');
   md.ClearSelection;
  md.CreateCenterLineVB(0, d_old/2000, 0, 0, d_sh/2000, 0);
  cl:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl = nil then
    ex('Нет осевой');
  md.SketchAddConstraints('sgVERTICAL');
  Seg[0]:= md.ICreateLine2(-b_z/2000,d_a/2000,0,-b_z_max/2000,d_sh/2000,0);
  if Seg[0] = nil then
   ex('');
  Seg[1]:= md.ICreateArc2(0,0,0,-b_z_max/2000,d_sh/2000,0,b_z_max/2000, D_sh/2000,0,0);
  Seg[2]:= md.ICreateLine2(b_z_max/2000, D_sh/2000,0,b_z/2000,d_a/2000,0 );
  Seg[3]:= md.ICreateLine2(b_z/2000,d_a/2000,0 ,-b_z/2000,d_a/2000,0);
  if Seg[3] <> nil then
  md.SketchAddConstraints ('sgHORIZONTAL')
  else ex('');
  cl.Select(false);
  Seg[0].Select(true);
  seg[2].SelectByMark(true, 3);
  md.SketchAddConstraints('sgSYMMETRIC');
   Seg[3].Select(false);
  md.AddhorizontalDimension(0, d_old/4000, 0);
  CheckDim(md, b_z);
  Seg[3].Select(false);
  cp.Select(true);
  md.AddVerticalDimension(-b/2000, d_a/4000, 0);
  CheckDim(md, d_a/2);
  cl.Select(false);
  cp.Select(true);
  md.SketchAddConstraints('sgCOINCIDENT');

  (edges[11] as IEntity).Select(false);
  Seg[1].Select(true);
  md.SketchAddConstraints('sgCORADIAL');

 (Seg[1] as ISketchArc).IGetStartPoint2.Select(false);
 (Seg[1] as ISketchArc).IGetEndPoint2.Select(true);
  md.AddhorizontalDimension(0, d_old/4000, 0);
  CheckDim(md, b_z_max);

   md.FeatureCut4(false,false,false,1,1,0.01,0.01,false,false,false,false,b/1000,b/1000,false,false,0,false)  ;
  CutFeature:= SelMgr.IGetSelectedObject(1) as IFeature;
   end;

end.
