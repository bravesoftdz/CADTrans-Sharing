unit Plosk_Shkiv;

interface
uses
  sysutils, windows, math, SldWorks_TLB, Sw_HLP, Dialogs;

type
  TPloskoSkiv= class(TCustom)
  protected
    b1,h: Real;

    RevolveCutFeature, Feat1: IFeature;
    procedure Calc; override;
     procedure RevolveCut;
    // фаски и скругления
    procedure EdgesProc;
  public
    constructor Create(_d0, _d_sh, _b: Real);
    procedure CreateSW(md: IModelDoc); override;
  end;

implementation

{ TPloskoSkiv }

procedure TPloskoSkiv.Calc;
var
 w: Real;
begin
 d0:= StandardNumber(d0);
  d_st:=1.6*d0 + 10;
  d_st:= StandardNumber(d_st);
   L_st:= StandardNumber(L_st);
   b:= StandardNumber(b);
  w:=0.02*(d_sh +2*b);

  c:= 1.5*w ;
  c:= StandardNumber(c);
  b1:= 0.4*b;
   param;
  r1:= r2;
  f1:= r2+c2+5;
   d_old:= d_sh -2*w;
          //Величина выпуклости
  if b<=125 then
     begin
      if (d_sh>40)  and(d_sh<=125)   then h:=0.3
      else
      if (d_sh>125) and(d_sh<=160)   then h:=0.4
      else
      if (d_sh>160) and(d_sh<=190)   then h:=0.5
      else
      if (d_sh>190) and(d_sh<=240)   then h:=0.6
      else
      if (d_sh>240) and(d_sh<=280)   then h:=0.8
      else
      if (d_sh>280) and(d_sh<=1000)  then h:=1
      else
      if (d_sh>1000) and(d_sh<=1350) then h:=1.2
      else
      if (d_sh>1350) and(d_sh<=1600) then h:=1.5
      else
      if (d_sh>1600) and(d_sh<=2000) then h:=2;
    end
   else
   if (b<=160) and (b>125) then
     begin
      if (d_sh>400)  and(d_sh<=500)  then h:=1.2
      else
      if (d_sh>500) and(d_sh<=600)   then h:=1.5
      else
      if (d_sh>600) and(d_sh<=1350)  then h:=1.5
      else
      if (d_sh>1350) and(d_sh<=1700) then h:=2
      else
      if (d_sh>1700) and(d_sh<=2000) then h:=2.5;
     end
    else

  if (b<=200) and (b>160) then
     begin
      if (d_sh>400)  and(d_sh<=500)  then h:=1.2
      else
      if (d_sh>500) and(d_sh<=600)   then h:=1.5
      else
      if (d_sh>600) and(d_sh<=1350)  then h:=2
      else
      if (d_sh>1350) and(d_sh<=1700) then h:=2.5
      else
      if (d_sh>1700) and(d_sh<=2000) then h:=3;
     end
  else
  if (b<=250) and (b>200) then
     begin
      if (d_sh>400)  and(d_sh<=500)  then h:=1.2
      else
      if (d_sh>500) and(d_sh<=600)   then h:=1.5
      else
      if (d_sh>600) and(d_sh<=750)   then h:=2
      else
      if (d_sh>750) and(d_sh<=1350)  then h:=2.5
      else
      if (d_sh>1350) and(d_sh<=1700) then h:=3
      else
      if (d_sh>1700) and(d_sh<=2000) then h:=3.5;
     end
   else
  if (b<=350) and (b>250) then
     begin
      if (d_sh>400)  and(d_sh<=500)  then h:=1.2
      else
      if (d_sh>500) and(d_sh<=600)   then h:=1.5
      else
      if (d_sh>600) and(d_sh<=750)   then h:=2
      else
      if (d_sh>750) and(d_sh<=950)   then h:=2.5
      else
      if (d_sh>950) and(d_sh<=1350)  then h:=3
      else
      if (d_sh>1350) and(d_sh<=1700) then h:=3.5
      else
      if (d_sh>1700) and(d_sh<=2000) then h:=4;
     end
    else

  if b=355 then
     begin
      if (d_sh>400)  and(d_sh<=500)  then h:=1.2
      else
      if (d_sh>500) and(d_sh<=600)   then h:=1.5
      else
      if (d_sh>600) and(d_sh<=750)   then h:=2
      else
      if (d_sh>750) and(d_sh<=950)   then h:=2.5
      else
      if (d_sh>950) and(d_sh<=1350)  then h:=3
      else
      if (d_sh>1350) and(d_sh<=1700) then h:=4
      else
      if (d_sh>1700) and(d_sh<=2000) then h:=5;
     end
   else

  if b=400 then
     begin
      if (d_sh>400)  and(d_sh<=500)  then h:=1.2
      else
      if (d_sh>500) and(d_sh<=600)   then h:=1.5
      else
      if (d_sh>600) and(d_sh<=750)   then h:=2
      else
      if (d_sh>750) and(d_sh<=950)   then h:=2.5
      else
      if d_sh=1000                   then h:=3
      else
      if (d_sh>1000) and(d_sh<=1200) then h:=3.5
      else
      if (d_sh>1200) and(d_sh<=1250) then h:=4
      else
      if (d_sh>1350) and(d_sh<=1700) then h:=5
      else
      if (d_sh>1700) and(d_sh<=2000) then h:=6;
     end;
   end;



constructor TPloskoSkiv.Create(_d0, _d_sh, _b: Real);
begin
  d0:= _d0;
  d_sh:= _d_sh;
  b:= _b;
  if d0 > 95 then
    ex('Посадочный диаметр слишком велик');
  if d_sh > 2000 then
    ex('Диаметр шкива слишком велик');
  if b > 400 then
    ex('Ширина шкива слишком велика');
    if (b<=400) and (b>125) and  (d_sh<400)
    then   ex('Ширина b соответствует большему диаметру шкива');
  inherited Create;
end;



procedure TPloskoSkiv.CreateSW(md: IModelDoc);
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
   Sponka;
end;

procedure TPloskoSkiv.EdgesProc;
var
  edges: array[1..12] of IEdge;
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

end;


procedure TPloskoSkiv.RevolveCut;
var
  Seg: array[0..5] of ISketchSegment;
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
  md.CreateCenterLineVB(x0+b/2000, y0, 0, x0+b/2000, d_old/2000, 0);
  cl:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl = nil then
    ex('Нет осевой');
  md.SketchAddConstraints('sgVERTICAL');
   Seg[0]:= md.ICreateLine2 (x0,y0-h/1000, 0, x0, y0, 0 ) ;
   md.SketchAddConstraints('sgVERTICAL');
   Seg[1]:= md.ICreateLine2 (x0, y0, 0, (x0+b/2000-b1/2000), y0, 0 ) ;
   md.SketchAddConstraints ('sgHORIZONTAL');
   Seg[2]:= md.ICreateLine2 ((x0+b/2000-b1/2000), y0, 0, x0,(y0-h/1000), 0 ) ;

   Seg[3]:= md.ICreateLine2 (((x0+b/2000+ b1/2000)),y0, 0, (x0+ b/1000),y0, 0 ) ;
   md.SketchAddConstraints ('sgHORIZONTAL');

   Seg[4]:= md.ICreateLine2 ((x0+ b/1000),y0, 0, (x0+ b/1000),y0- h/1000, 0 ) ;
   md.SketchAddConstraints('sgVERTICAL');

   Seg[5]:= md.ICreateLine2 ((x0+ b/1000),y0- h/1000, 0, ((x0+b/2000+ b1/2000)),y0, 0 ) ;

 // Простановка размеров

  Seg[1].Select(false);
  SegT.Select(true);
  md.SketchAddConstraints('sgCOLINEAR');

  Seg[0].Select(false);
  SegL.Select(true);
  md.SketchAddConstraints('sgCOLINEAR');

  Seg[3].Select(false);
  SegT.Select(true);
  md.SketchAddConstraints('sgCOLINEAR');

  Seg[4].Select(false);
  SegR.Select(true);
  md.SketchAddConstraints('sgCOLINEAR');

   cl.Select(false);
  Seg[2].Select(true);
  seg[5].Select(true);
  md.SketchAddConstraints('sgSYMMETRIC');

   cl.Select(false);
  Seg[0].Select(true);
  seg[4].Select(true);
  md.SketchAddConstraints('sgSYMMETRIC');

   Seg[0].Select(false);
   md.AddVerticalDimension ((l_st/1000+0.005), 0.0003*d_sh, 0);
   CheckDim(md,h);

  (Seg[2] as ISketchLine).IGetStartPoint2.Select(false);
  (Seg[5] as ISketchLine).IGetEndPoint2.Select(true);
   md.AddHorizontalDimension ((b/2000), 0.0003*d_sh, 0);
   CheckDim(md,b1);

    //осевая 1
  md.ClearSelection;
  md.CreateCenterLineVB(0, 0, 0, (b)/1000, 0, 0);
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
end;

end.
 