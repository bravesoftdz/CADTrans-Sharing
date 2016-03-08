unit ZubchZvUnit;

interface
uses
  sysutils, windows, math, SldWorks_TLB, Sw_HLP;

type
  TZubchZv= class(TCustom)
  protected
    Cc,p,Di,Bt,Dc,Aa:real;
    Ube,Uga:real;
    z,n:byte;
    RevolveCutFeature, CircleCutFeature: IFeature;
    procedure Calc; override;
    procedure RevolveCut;
    procedure CircleCut;
    procedure CircleArray;
//  фаски и скругления
    procedure EdgesProc;
  public
    constructor Create(_d0, _p: Real; _n, _z: integer);
    procedure CreateSW(MD: IModelDoc); override;
    function ICreateLine2DS(ModelDoc:IModelDoc;x1,y1,x2,y2:double):ISketchSegment;
    procedure ICreateDimDS(ModelDoc:IModelDoc;Seg1,Seg2:ISketchSegment;x,y,Dim:Double);
  end;

implementation

{ TZubchZv }

procedure TZubchZv.Calc;
var pt:integer;
   h1,e,s,h2,dd,Bb,Si:real;
begin
 s:=0; h1:=0; e:=0; Bb:=0;
 pt:=abs(trunc(p*1000));
 case pt of
      0..12700: Pt:=12700;
  12701..15875: Pt:=15875;
  15876..19050: Pt:=19050;
  19051..25400: Pt:=25400;
  else Pt:=25400;
 end;
 case pt of
  12700:
   begin
    h1:=7; s:=1.5; Cc:=20.52; e:=1.3; Bb:=28.5;
   end;
  15875:
   begin
    h1:=8.7; s:=2; Cc:=25.65; e:=1.6; Bb:=38;
   end;
  19050:
   begin
    h1:=10.5; s:=3; Cc:=30.76; e:=1.9; Bb:=57;
   end;
  25400:
   begin
    h1:=14; s:=3; Cc:=41.03; e:=2.5; Bb:=69;
   end;
  end;

 dd:=p/sin(pi/z);
 D_sh:=p/tan(pi/z);
 h2:=h1+e;
 Di:=dd-2*h2*cos(pi/z);
 Dc:=D_sh-1.5*p;
 B:=Bb+2*s;
 Bt:=(B-(Aa*(n-1)))/n;
 Aa:=2*s;
 Si:=h2;
 C:=1.3*Si;
 d_old:=Di-2*h2-5;
end;

procedure TZubchZv.CircleArray;
begin
 MD.ClearSelection;
 CircleCutFeature.Select(true);

 md.ViewDispTempRefaxes;
 md.AndSelectByID('','AXIS', l_st/2000, 0, 0);

 md.FeatureCirPattern(trunc(z),pi*2/z,false,'NULL');
end;

procedure TZubchZv.CircleCut;
var
   Seg:array[0..5] of ISketchSegment;
    CP:ISketchPoint;
    CL:ISketchSegment;
     i:integer;
begin
 if not (yzPlane as IFeature).Select(False) then
  ex('Не выбрана плоскость YZ');
 MD.InsertSketch;
 MD.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0);
 CP:=SelMgr.GetSelectedObject(1) as ISketchPoint;
 if CP=nil then ex('Не выбрана ц.т.');

 MD.CreateCenterLineVB(0,0,0,0,D_sh/2000,0);
 CL:=SelMgr.IGetSelectedObject(1) as ISketchSegment;
 if CL=nil then Ex('Не создана осевая');

 Seg[1]:=MD.ICreateLine2(0,Di/2000,0,0.1*p/1000,Di/2000+0.01*p/1000,0);
 Seg[2]:=MD.ICreateLine2(0.1*p/1000,Di/2000+0.01*p/1000,0,0.4*p/1000,D_sh/2000,0);
 Seg[3]:=ICreateLine2DS(MD,0.4*p/1000,D_sh/2000,-0.4*p/1000,D_sh/2000);
 Seg[4]:=MD.ICreateLine2(-0.4*p/1000,D_sh/2000,0,-0.1*p/1000,Di/2000+0.01*p/1000,0);
 Seg[5]:=MD.ICreateLine2(-0.1*p/1000,Di/2000+0.01*p/1000,0,0,Di/2000,0);

 for i:=1 to 5 do
  if Seg[i]=nil then Ex('Line has not been created');

 CL.Select(False);
 Seg[1].Select(true);
 Seg[5].Select(true);
 MD.SketchAddConstraints('sgSYMMETRIC');

 CL.Select(False);
 Seg[2].Select(true);
 Seg[4].Select(true);
 MD.SketchAddConstraints('sgSYMMETRIC');

 Seg[1].Select(false);
 Seg[5].Select(true);
 MD.AddDimension(0,D_sh/1000,0);
 CheckDim(MD,Uga*180/pi);

 Seg[2].Select(false);
 Seg[4].Select(true);
 MD.AddDimension(0,Di/1000,0);
 CheckDim(MD,Ube*180/pi);

 CL.Select(false);
 CP.Select(true);
 MD.SketchAddConstraints('sgCOINCIDENT');

 CL.Select(false);
 MD.SketchAddConstraints('sgVERTICAL');

 (SegT as ISketchLine).IGetStartPoint2.Select(False);
 seg[3].Select(True);
 md.SketchAddConstraints('sgATMIDDLE');

 CL.Select(false);
 md.AddVerticalDimension(0.01,0.01,0);
 CheckDim(MD,D_sh/2-Cc);

 Seg[2].Select(false);
 ((CL as isketchline).IGetEndPoint2).Select(true);
 MD.SketchAddConstraints('sgCOINCIDENT');

 Seg[4].Select(false);
 ((CL as isketchline).IGetEndPoint2).Select(true);
 MD.SketchAddConstraints('sgCOINCIDENT');

 ((CL as isketchline).IGetStartPoint2).Select(false);
 CP.Select(true);
 MD.SketchAddConstraints('sgCOINCIDENT');

 ((Seg[1] as isketchline).IGetStartPoint2).Select(false);
 CP.Select(true);
 MD.AddVerticalDimension(0.02,0.03,0);

 md.FeatureCut(True, false, true, 1, 1, 0, 0, false, false, false, false, 0, 0, false, false);

 CircleCutFeature:= SelMgr.IGetSelectedObject(1) as IFeature;
 if CircleCutFeature=nil then Ex('Вырез не был создан');

end;

constructor TZubchZv.Create(_d0, _p: Real; _n, _z: integer);
begin
  d0:= _d0;
  p := _p;
  z := _z;
  n := _n;
  if d0 > 95 then
    ex('Посадочный диаметр слишком велик');
  if d_sh > 2000 then
    ex('Диаметр шкива слишком велик');
  if b > 400 then
    ex('Ширина шкива слишком велика');
   inherited Create;
end;

procedure TZubchZv.CreateSW(MD: IModelDoc);
var Ual:real;
begin
 inherited CreateSW(md);
 l_st:=1.6*d0+10;
 l_st:=StandardNumber(l_st);
 if l_st>60 then l_st:=60;
 d_st:=1.6*d0+10;
 d_st:=StandardNumber(d_st);
 Ual:=2*pi/z;
 Ube:=(pi/3-Ual)/2;
 Uga:=pi-Ual;
 f1:=(B-c)/2;

 if D_sh<250 then L_st:=B;
 if (abs(L_st-B)<5)or(L_st<B) then l_st:=B;
 if ((D_old-d_st)<=20) then C:=B;

 if C<>B then Revolve1;
 if (C=B) and (L_st<>B) then Revolve2;
 if (C=B) and (L_st=B) then Revolve3;

 EdgesProc;
 RevolveCut;
 Sponka;
 CircleCut;
 CircleArray;
end;

procedure TZubchZv.EdgesProc;
var
  edges: array[0..12] of IEdge;
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
      else if (v[0] > (l_st+f1+c)/2000) and (v[6] > (d_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[4]:= edge
      else if (v[0] > f1/2000) and (v[0] < f1/1000+c/2000) and (v[6] > (D_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[5]:= edge
      else if (v[0] > (f1+c/2)/1000) and (v[0] < (f1+c+l_st)/2000) and (v[6] > (D_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[6]:= edge
      else if (v[0] > f1/2000) and (v[0] < f1/1000+c/2000) and ( v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_sh)/4000) then
        edges[7]:= edge
      else if (v[0] > (f1+c/2)/1000) and (v[0] < (f1+c+f1+c/2+b/2)/2000) and ( v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_sh)/4000) then
        edges[8]:= edge
      else if (v[0] < f1/2000) and (v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_sh)/4000)  then
        edges[9]:= edge
      else if (v[0] > (f1+c/2+ b/2+f1+c)/2000) and (v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_sh)/4000) then
        edges[10]:= edge
      else if (v[0] <  f1/2000) and (v[6] > (d_sh+d_old)/4000) then
        edges[11]:= edge
      else if (v[0] > (f1+c/2)/1000) and (v[6] > (d_sh+d_old)/4000) then
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
  Param;
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
  md.FeatureChamferType(1,c2/1000, pi/4, true, 0, 0, 0, 0);
  md.ClearSelection;

  if edges[5] <> nil then
    (edges[5] as IEntity).Select(True);
  if edges[6] <> nil then
    (edges[6] as IEntity).Select(True);
  if edges[7] <> nil then
    (edges[7] as IEntity).Select(True);
  if edges[8] <> nil then
    (edges[8] as IEntity).Select(True);
  if SelMgr.GetSelectedObjectCount > 0 then
  md.featurefillet(r2/1000,false,false,false,0);
end;

procedure TZubchZv.ICreateDimDS(ModelDoc:IModelDoc;Seg1,Seg2:ISketchSegment;x,y,Dim:Double);
begin
 Seg1.Select(false);
 Seg2.Select(true);
 ModelDoc.AddDimension(x,y,0);
 CheckDim(ModelDoc,Dim*1000);
end;

function TZubchZv.ICreateLine2DS(ModelDoc: IModelDoc; x1, y1, x2,
  y2: double): ISketchSegment;
begin
 Result:=ModelDoc.ICreateLine2(x1,y1,0,x2,y2,0);
 if Result=nil then Exit;
 if x1=x2 then ModelDoc.SketchAddConstraints('sgVERTICAL');
 if y1=y2 then ModelDoc.SketchAddConstraints('sgHORIZONTAL');
end;

procedure TZubchZv.RevolveCut;
var
  Seg: array[1..4] of ISketchSegment;
   cp: ISketchPoint;
    i: integer;
  CL,CL1:ISketchSegment;
begin
  if not (xyPlane as IFeature).Select(False) then
    ex('Не выбрана плоскость XY');
  md.InsertSketch;
  md.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0);
  cp:= SelMgr.GetSelectedObject(1) as ISketchPoint;
  if cp = nil then
    ex('Не выбрана ц.т.');

  Seg[1]:=ICreateLine2DS(MD,bt/1000,Dc/2000,(bt-Aa/2)/1000,Dc/2000);
  Seg[2]:=ICreateLine2DS(MD,(bt-Aa/2)/1000,Dc/2000,(bt-Aa/2)/1000,D_sh/2000);
  Seg[3]:=ICreateLine2DS(MD,(bt-Aa/2)/1000,D_sh/2000,bt/1000,D_sh/2000);
  Seg[4]:=ICreateLine2DS(MD,bt/1000,D_sh/2000,bt/1000,Dc/2000);

//Проверка на существование

  for i:=1 to 4 do
   if Seg[i]=nil then Ex('line has not been created');

  CP.Select(false);
  Seg[1].Select(true);
  MD.AddVerticalDimension(0,Dc/4000,0);
  CheckDim(MD,Dc/2);

  Seg[4].Select(false);
  Seg[2].Select(true);
  MD.AddHorizontalDimension(0,Dc/2000,0);
  CheckDim(MD,Aa);

  Seg[3].Select(false);
  CP.Select(true);
  MD.AddVerticalDimension(0,D_sh/4000,0);
  CheckDim(MD,D_sh/2);

  md.ClearSelection;
  md.CreateCenterLineVB(0, 0, 0, 0, Di/2000, 0);
  CL1:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl1 = nil then ex('Нет осевой');

  SegL.Select(false);
  SegR.Select(true);
  CL1.Select(true);
  MD.SketchAddConstraints('sgSYMMETRIC');

  Seg[2].Select(false);
  Seg[4].Select(true);
  Cl1.Select(true);
  MD.SketchAddConstraints('sgSYMMETRIC');

  md.ClearSelection;
  md.CreateCenterLineVB(0, 0, 0, l_st/1000, 0, 0);
  cl:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl = nil then ex('Нет осевой');

  if MD.FeatureRevolveCut2(2*pi,false, 0, 0, 0) <> 0 then
    ex('Вырез не создан');

  RevolveCutFeature:=SelMgr.IGetSelectedObject(1) as IFeature;

  if RevolveCutFeature=nil then Ex('Revolving cut has not been created');
end;

end.
