unit Kos_Zub;

interface
uses
  sysutils, windows, math, SldWorks_TLB, Sw_HLP;

type
  TKosZub = class (TCustom)
  protected
    z: integer;
    m, f, s, vz, bz, az, df, anz :real;
    edges: array[0..15] of IEdge;
    edges1,edges3:IEdge;
       pp1, pp2: ISketchPoint;
    RevolveCutFeature, Feat1,Feat2: IFeature;
    procedure Calc; override;
    procedure RevolveCut;
    // фаски и скругления
    procedure EdgesProc;
   // procedure CreateArray;
  public
    constructor Create( _z: integer; _m, _d0, _b, _anz:real);
    procedure CreateSW(md: IModelDoc); override;
  end;

implementation
 {TKZub}


// перевод мм в м
function Raz(a: real):real;
begin
  result:=a/1000;
end;

procedure TKosZub.Calc;
var
  d1: real;

begin
 //Result:= False;
  d0:= StandardNumber(d0);
  d_st:=1.5*d0+10;
  d_st:=StandardNumber(d_st);
  L_st:=1.4*d0;
  if L_st < b then
    L_st:= 1.5*b;
  L_st:=StandardNumber(L_st);


  d1:=z*m;
  s:= 2.5*m+2;
  c:=b/2;
  d_sh:=d1+ 2*m;
  vz:=d_sh-d1;
  bz:= 0.8 * m;
  az:= 40;
  f1:=(b-c)/2;
  d_old:=d_sh-2*(vz+s);
  f:=0.7*m ;
  df:=d_sh - 2*vz;
  param;
  if d_sh < 80 then
  begin
    L_st:=b;
    c:=0;
    f1:=0;
    d_old:=0;
    d_st:=D_sh;
  end;
end;

constructor TKosZub.Create(_z: integer; _m, _d0, _b, _anz:real);
begin
  z:=_z;
  m:=_m;
  d0:=_d0;
  b:=_b;
  anz:=_anz;
  { if d0 > 95 then
    ex('Посадочный диаметр слишком велик');
   if d_sh > 2000 then
    ex('Диаметр шкива слишком велик');
   if b > 400 then
    ex('Ширина шкива слишком велика');  }
  inherited Create;
end;

procedure TKosZub.CreateSW(md: IModelDoc);
begin
inherited CreateSW(md);
  if d_sh > 3*d0 then
  Revolve1 else
  if d_sh < 80 then
    Revolve3
  else Revolve2 ;
  EdgesProc;
  Sponka;
  RevolveCut;
end;

procedure TKosZub.EdgesProc;
var
  edges: array[0..15] of IEdge;
  cyl_face: IFace;
  Part:IPartDoc;

 procedure Edgeproc(var Edge: IEdge); stdcall;
  var

    curve: ICurve;
    v: Variant;
  begin
    curve:= Edge.IGetCurve;

    if curve.Identity = 3002 then
    begin
     (Edge as IEntity).Select(false);
      v:= curve.Get_CircleParams;
      if (v[0] < l_st/2000) and (v[6] < (d0+d_st)/4000) then
        edges[0]:= edge
      else if (v[0] > l_st/2000) and (v[6] < (d0+d_st)/4000) then
        edges[1]:= edge
      else if (v[0] < f1/2000) and (v[6] > (d_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[2]:= edge
      else if (v[0] > (l_st-f1)/1000) and (v[6] > (d_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[3]:= edge
      else if (v[0] > f1/2000) and (v[0] < f1/1000+c/2000) and (v[6] > (D_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
        edges[4]:= edge
      else if (v[0] > (f1+c/2)/1000) and (v[0] < (f1+c+l_st)/2000) and (v[6] > (D_st+d0)/4000) and (v[6] < (d_st+d_old)/4000) then
         edges[5]:= edge
      else if (v[0] > f1/2000) and (v[0] < f1/1000+c/2000) and ( v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_sh)/4000) then
        edges[6]:= edge
       else if (v[0] > (f1+c/2)/1000) and (v[0] < (f1+c+f1+c/2+b/2)/2000) and ( v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_sh)/4000) then
        edges[7]:= edge
      else if (v[0] < f1/2000) and (v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_sh)/4000)  then
        edges[8]:= edge
      else if (v[0] > (f1+c/2+b/2+f1+c)/2000) and (v[6] > (d_st+d_old)/4000) and (v[6] < (d_old+d_sh)/4000) then
        edges[9]:= edge
      else if (v[0]< raz((b-c)/2))  and ((v[6] > raz((d_sh+d_old)/4))) then
        edges[10]:= edge
      else if (v[0]>raz((b+c)/2)) and ((v[6] > raz((d_sh+d_old)/4)))  then
        edges[11]:= edge;
      Edges3:=Edges[10];
      Edges1:=Edges[11];
      end;
end;

  procedure EnumEdgesFaces();
  var
    face: IFace;
    edge: IEdge;
    i, j : Integer;
    enum_faces: IEnumFaces;
    enum_edges: IEnumEdges;
    enum_bodies: IEnumBodies;
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
            enum_edges:= face.EnumEdges;
            if enum_edges <> nil then
            begin
              j:= 0;
              hres:= enum_edges.Next(1, edge, j);
              while (hres = S_OK) and (edge <> nil) and (j > 0) do
              begin
                (edge as IEntity).Select(false);
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
 if c<>b then
 begin
  if edges[0] <> nil then
  ((Edges[0] as Ientity).Select(false)) ;
  if edges[1] <> nil then
  ((Edges[1] as Ientity).Select(true)) ;
  if edges[2] <> nil then
  ((Edges[2] as Ientity).Select(true)) ;

  if edges[3] <> nil then
  ((Edges[3] as Ientity).Select(true)) ;
  if SelMgr.GetSelectedObjectCount > 0 then
   md.FeatureChamferType(1,raz(c2),0.7853981633975, true, 0, 0, 0, 0)
    else exit;
   md.ClearSelection;

  if edges[8] <> nil then
  ((Edges[8] as Ientity).Select(false)) ;
  if edges[9] <> nil then
  ((Edges[9] as Ientity).Select(true)) ;
  if SelMgr.GetSelectedObjectCount > 0 then
   md.FeatureChamferType(1,raz(c1),0.7853981633975, true, 0, 0, 0, 0)
    else exit;
  md.ClearSelection;
  if edges[10] <> nil then
  ((Edges[10] as Ientity).Select(false)) ;
 { if edges[11] <> nil then
  ((Edges[11] as Ientity).Select(true)); }
  if SelMgr.GetSelectedObjectCount > 0 then

  md.FeatureChamferType(1,raz(f),0.7853981633975, true, 0, 0, 0, 0)
    else exit;
  md.ClearSelection;

  if edges[4] <> nil then
   ((edges[4] as IEntity).Select(false));
  if edges[5] <> nil then
   ((edges[5] as IEntity).Select(true));
  if edges[6] <> nil then
   ((edges[6] as IEntity).Select(true));
  if edges[7] <> nil then
   ((edges[7] as IEntity).Select(true));
  if SelMgr.GetSelectedObjectCount > 0 then

   md.featurefillet(raz(r2),false,false,false,0)
   else exit;
    md.ClearSelection;

 end;
end;

procedure TKosZub.RevolveCut;
var
   Seg: array[0..4] of ISketchSegment;
   CP,Pp, pp1, pp2:ISketchPoint;
   CL, CL1, CL2, CLL1:ISketchSegment;
   cf:IFeature;
   L:ISketchLine;
   pl:refPlane;
   Sket, Sket1:IFeature;//IDispatch;
   Segm, Segm1: ISketchpoint;
begin
  if not (yzPlane as IFeature).Select(False) then
    ex('Не выбрана плоскость YZ');
  md.InsertSketch;

  md.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0);
  cp:= SelMgr.GetSelectedObject(1) as ISketchPoint;
  if cp = nil then
    ex('Не выбрана ц.т.');

  if d_sh < 80 then
     seg[0]:= md.ICreateLine2( raz(-bz/2), raz(d_sh/2 - vz ), 0,raz(bz/2), raz(d_sh/2 - vz ), 0)
  else
  seg[0]:= md.ICreateLine2( raz(-bz/2), raz(d_old/2 + s ), 0,raz(bz/2), raz(d_old/2 + s ), 0);
  md.SketchAddConstraints ('sgHORIZONTAL');

  md.AddDimension (0,raz(d_sh-vz-10), 0);
  CheckDim(md, bz);
  CP.Select(false);
  seg[0].Select(true);
  md.AddVerticalDimension (raz(10),raz(d_sh-vz-10), 0);
  CheckDim(md, df/2);

  if d_sh < 80 then
    begin
     seg[1]:= md.ICreateLine2(raz(bz/2), raz(d_sh/2 - vz ), 0,raz( bz/2 + 100), raz(d_sh/2),0) ;
     seg[2]:= md.ICreateLine2(raz( bz/2 + 100),raz(d_sh/2),0 ,raz(-bz/2 - 100) , raz(d_sh/2 ),0) ;
     seg[3]:= md.ICreateLine2(raz( -bz/2 - 100), raz(d_sh/2), 0,raz(-bz/2), raz(d_sh/2 - vz ), 0) ;
     md.CreateCenterLineVB(0,0,0,0,raz(d_sh/2+20),0);
    end
  else
   begin
    seg[1]:= md.ICreateLine2(raz(bz/2), raz(d_old/2 + s ), 0,raz( bz/2 + 100), raz(d_old/2 + s + vz),0) ;
    seg[2]:= md.ICreateLine2(raz( bz/2 + 100),raz(d_old/2 + s + vz),0 ,raz(-bz/2 - 100) , raz(d_old/2 + s + vz),0) ;
    seg[3]:= md.ICreateLine2(raz( -bz/2 - 100), raz(d_old/2 + s + vz), 0,raz(-bz/2), raz(d_old/2 + s ), 0) ;
    md.CreateCenterLineVB(0,0,0,0,raz(d_sh/2+20),0);
   end;
  segm:=(seg[1] as isketchline).IGetendPoint2;

  CL:=SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if CL=nil then
    Exit;

  pp:=(CL as isketchline).IGetendPoint2;

  md.SketchAddConstraints ('sgVERTICAL');
  CP.Select(true);
  md.SketchAddConstraints ('sgCOINCIDENT');

  pp.Select(False);
  Seg[2].Select(true);
  md.SketchAddConstraints ('sgATMIDDLE');

  seg[0].Select(false);
  seg[2].Select(true);
  md.SketchAddConstraints ('sgPARALLEL');

  seg[1].Select(false);
  seg[3].Select(true);
  CL.Select(true);
  md.SketchAddConstraints ('sgSYMMETRIC');

  seg[1].Select(false);
  seg[3].Select(true);
  md.AddDimension (0,raz(d_sh+10), 0);
  CheckDim(md, az);

  pp:=(CL as isketchline).IGetstartPoint2;
  pp.Select(false);
  cp.Select(true);
  md.SketchAddConstraints ('sgCOINCIDENT');

  CL.Select(false);
  md.AddDimension (raz(10),raz(d_sh-vz-10), 0);
  CheckDim(md, (d_sh/2)+20);
//  Sket:=md.iGetActiveSketch2;
  ///эскиз противоположного проыиля зуба
  md.InsertSketch;

  md.ClearSelection;
   (yzPlane as IFeature).Select(False);
  md.CreatePlaneAtOffset(raz(b),false);
  md.InsertSketch;
  md.CreateCenterLineVB(0,0,0,0,raz(d_sh/2+20),0);

  CL1:=SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if CL1=nil then
    Exit;

  CL1.Select(false);
  md.SketchAddConstraints ('sgVERTICAL');
  pp1:=(Cl1 as isketchline).IGetStartPoint2;
  CP.Select(false);
  pp1.Select(true);
  md.SketchAddConstraints ('sgCOINCIDENT');

  pp1:=(Cl1 as isketchline).IGetendPoint2;
 { pp1.Select(false);
  (edges1 as Ientity).Select(true);
  md.SketchAddConstraints ('sgCOINCIDENT');  }
  md.ClearSelection;

  md.CreateCenterLineVB(0,0,0,(raz(d_sh/2+20))*sin(20),(raz(d_sh/2+20))*cos(20),0);
  CL2:=SelMgr.IGetSelectedObject(1) as ISketchSegment;
   if CL2=nil then
    Exit;
  CL2.Select(false);
  md.AddDimension (raz(10),raz(d_sh-vz-10), 0);
  CheckDim(md, (d_sh/2)+20);


  pp1:=(Cl1 as isketchline).IGetstartPoint2;
  pp2:=(Cl2 as isketchline).IGetStartPoint2;
  pp1.Select(false);
  pp2.Select(true);
  md.SketchAddConstraints ('sgCOINCIDENT');
  md.ClearSelection;

  pp2:=(Cl2 as isketchline).IGetendPoint2;

  md.SketchAddConstraints ('sgCOINCIDENT');

  CL1.Select(false);
  pp2.Select(true);
  md.AddDimension (0,raz(d_sh+10), 0);
  CheckDim(md, b*tan(anz*pi/180));

  md.ClearSelection;

  seg[0]:= md.ICreateLine2( raz(-bz/2), raz(d_old/2 + s ), 0,raz(bz/2), raz(d_old/2 + s ), 0);
  seg[1]:= md.ICreateLine2(raz(bz/2), raz(d_old/2 + s ), 0,raz( bz/2 + 100), raz(d_old/2 + s + vz),0) ;
  seg[2]:= md.ICreateLine2(raz( bz/2 + 100),raz(d_old/2 + s + vz),0 ,raz(-bz/2 - 100) , raz(d_old/2 + s + vz),0) ;
  seg[3]:= md.ICreateLine2(raz( -bz/2 - 100), raz(d_old/2 + s + vz), 0,raz(-bz/2), raz(d_old/2 + s ), 0) ;
  md.CreateCenterLineVB(0,0,0,0,raz(d_sh/2+20),0);
  segm1:=(seg[3] as isketchline).IGetstartPoint2;
  CL1:=SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if CL1=nil then
    Exit;

  md.SketchAddConstraints ('sgVERTICAL');
  CP.Select(true);
  md.SketchAddConstraints ('sgCOINCIDENT');

  seg[0].Select(False);
  md.AddDimension (0,raz(d_sh-vz-10), 0);
  CheckDim(md, bz);

  seg[0].Select(false);
  seg[2].Select(true);
  md.SketchAddConstraints ('sgPARALLEL');

  cp.Select(False);
  seg[0].Select(true);
  md.AddDimension (raz(10),raz(d_sh-vz-10), 0);
  CheckDim(md, df/2);

  seg[2].Select(False);
  CL2.Select(true);
  md.SketchAddConstraints ('sgPERPENDICULAR');

  seg[1].Select(false);
  seg[3].Select(true);
  CL2.Select(true);
  md.SketchAddConstraints ('sgSYMMETRIC');

  seg[1].Select(false);
  seg[3].Select(true);
  md.AddDimension (0,raz(d_sh+10), 0);
  CheckDim(md, az);

  seg[2].Select(False);
  pp2.Select(true);
  md.SketchAddConstraints ('sgATMIDDLE');
//  Sket1:=md.iGetActiveSketch2;
/////////////////////////
 md.ClearSelection;

 if d_sh < 80 then
 begin
  if edges1 <> nil then
   ((Edges1 as Ientity).Select(false));
  if edges3 <> nil then
   ((Edges3 as Ientity).Select(true));
  if SelMgr.GetSelectedObjectCount > 0 then
 end  else


  if edges1 <> nil then
   ((Edges1 as Ientity).Select(false));
  if SelMgr.GetSelectedObjectCount > 0 then
  md.FeatureChamferType(1,raz(f),0.7853981633975, true, 0, 0, 0, 0)
    else exit;
  md.ClearSelection;
////////////////////

  md.InsertSketch;

  Segm.Select(false);
  Segm1.Select(true);


  md.InsertCutBlend4( false, true, False, 1, 0, 0, False, 0, 0, 0);


  md.featurecut(true, false, true, 0, 0, raz(b), 0.01, false, false, false,false, 0.01745329251994, 0.01745329251994, false, false);

  cf:=SelMgr.IGetSelectedObject(1) as ifeature;
  if Cf=nil then
    Ex('Вырез небыл создан');
  md.ViewDispTempRefaxes;
  cf.Select(false);

  md.AndSelectByID('','AXIS', l_st/2000, 0, 0);


  md.FeatureCirPattern(trunc(z),pi*2/z,false,'NULL');

  end;

end.
