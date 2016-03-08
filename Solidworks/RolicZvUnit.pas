unit RolicZvUnit;

interface
uses
  sysutils, windows, math, SldWorks_TLB, Sw_HLP;

type
  TRolicZv= class(TCustom)
  protected
    Bvn,A,d1,Dce,Cc,h,p,dd,Di,Rr,Bt,Dc,Bb,R,Aa,Se:real;
    Ube,Uga,Ual,Ufi:real;
    z,n:byte;
    RevolveCutFeature, CircleCutFeature: IFeature;
    procedure Calc; override;
    procedure RevolveCut;
    procedure CircleCut;
    procedure CircleArray;
    procedure RevolveArray;
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

procedure TRolicZv.Calc;
var pt:integer;
begin
 pt:=abs(trunc(p*1000));
 case pt of
      0..12700: Pt:=12700;
  12701..15875: Pt:=15875;
  15876..19050: Pt:=19050;
  19051..25400: Pt:=25400;
  else Pt:=25400;
 end;
 case pt of
  12700:begin
         Bvn:=5.4;A:=12.92;d1:=8.51;h:=11.8;
        end;
  15875:begin
         Bvn:=9.65;A:=16.59;d1:=10.16;h:=14.8;
        end;
  19050:begin
         Bvn:=12.7;A:=25.5;d1:=11.91;h:=18.2;
        end;
  25400:begin
         Bvn:=15.88;A:=29.29;d1:=15.88;h:=24.2;
        end;
  end;

 dd:=p/sin(pi/z);
 Rr:=0.5025*d1-0.05;
 Di:=dd-2*Rr;
 D_sh:=p*(0.5+cotan(pi/z));
 Dc:=(p*cotan(pi/z)-1.3*h);
 Aa:=A-Bvn;
 B:=Bvn+A*(n-1);
 R:=p;
 Se:=1.5*(D_sh-dd);
 C:=1.3*Se;
 d_old:=Di-6*(D_sh-dd);
 Dce:=1.5*Rr;
end;

procedure TRolicZv.CircleArray;
begin
 MD.ClearSelection;
 CircleCutFeature.Select(true);

 md.ViewDispTempRefaxes;
 md.AndSelectByID('','AXIS', l_st/2000, 0, 0);

 md.FeatureCirPattern(trunc(z),pi*2/z,false,'NULL');
end;

procedure TRolicZv.CircleCut;
var x1,y1,x2,y2,R1,FG:real;
   O1x,O1y,O2x,O2y,O3x,O3y,Ax,Ay,Bx,By,Cx,Cy,Dx,Dy,Fx,Fy:real;
              Seg:array[0..8] of ISketchSegment;
    CP,SP,PP1,PP2:ISketchPoint;
               PS:ISketchLine;
      CLR,CLL,CLC:ISketchSegment;
                i:byte;
begin
 if not (yzPlane as IFeature).Select(False) then
  ex('Не выбрана плоскость YZ');
 MD.InsertSketch;
 MD.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0);
 CP:=SelMgr.GetSelectedObject(1) as ISketchPoint;
 if CP=nil then Ex('Не выбрана ц.т.');

 MD.CreateCenterLineVB(0,0,0,l_st/1000,0.01,0);
 CLR:=SelMgr.IGetSelectedObject(1) as ISketchSegment;
 if CLR=nil then Ex('Axis kyrdyk');

 MD.CreateCenterLineVB(0,0,0,0,D_sh/2000,0);
 CLC:=SelMgr.IGetSelectedObject(1) as ISketchSegment;
 if CLC=nil then Ex('Axis kyrdyk');

 MD.CreateCenterLineVB(0,0,0,-l_st/2000,0.01,0);
 CLL:=SelMgr.IGetSelectedObject(1) as ISketchSegment;
 if CLL=nil then Ex('Axis kyrdyk');

 CLC.Select(false);
 MD.SketchAddConstraints('sgVERTICAL');

 CLL.Select(false);
 CLC.Select(true);
 MD.AddDimension(-l_st/2000,0.1,0);
 CheckDim(MD,180/z);

 SP:=(CLR as ISketchLine).IGetStartPoint2;
 SP.Select(false);
 CP.Select(true);
 MD.SketchAddConstraints('sgCOINCIDENT');

 CLR.Select(false);
 CLC.Select(true);
 MD.AddDimension(-l_st/2000,0.2,0);
 CheckDim(MD,180/z);

 Ual:=(55-60/z)*pi/180;
 Ube:=(18-56/z)*pi/180;
 Ufi:=(90-180/z-(Ual+Ube))*pi/180;

 x1:=0.8*Dce*sin(Ual);
 y1:=0.8*Dce*cos(Ual);
 x2:=1.24*Dce*cos(pi/z);
 y2:=1.24*Dce*sin(pi/z);
 Rr:=0.5025*Dce+0.05;
 R1:=1.3025*Dce+0.05;
 R2:=Dce*(1.24*cos(Ufi)+0.8*cos(Ube)-1.3025)-0.05;
 FG:=Dce*(1.24*sin(Ufi)-0.8*sin(Ube));

 O1x:=0;
 O1y:=dd/2000;
 O2x:=x1/1000;
 O2y:=dd/2000+y1/1000;
 O3x:=-X2/1000;
 O3y:=dd/2000-y2/1000;

 Ax:=0;
 Ay:=dd/2000-Rr/1000;
 Bx:=-Rr*sin(Ual)/1000;
 By:=dd/2000-Rr*cos(Ual)/1000;
 Cx:=(X1-R1*sin(Ual+Ube))/1000;
 Cy:=(dd/2+Y1-R1*cos(Ual+Ube))/1000;
 Dx:=Cx-FG*sin(pi/z+pi/2-Ufi)/1000;
 Dy:=Cy+FG*cos(pi/z+pi/2-Ufi)/1000;
 Fx:=-d_sh*sin(pi/z)/2000;
 Fy:=d_sh{*cos(pi/z)/2000};

 Seg[4]:=MD.ICreateArc2(O1x,O1y,0,Ax,Ay,0,Bx,By,0,1);
 Seg[3]:=MD.ICreateArc2(O2x,O2y,0,Bx,By,0,Cx,Cy,0,1);
// Seg[2]:=ICreateLine2DS(MD,Cx,Cy,Dx,Dy);
 Seg[1]:=MD.ICreateArc2(O3x,O3y,0,Cx,Cy,0,Fx,Fy,0,1);

 for i:=1 to 4 do
  if (Seg[i]=nil)and(Seg[2]<>nil) then Ex('Segment has not been created');

 PP1:=(Seg[3] as ISketchArc).IGetCenterPoint2;
 PP2:=(Seg[4] as ISketchArc).IGetCenterPoint2;
 PP1.Select(false);
 PP2.Select(true);
 MD.AddVerticalDimension(0.01,0.01,0);
// CheckDim(MD,Y1);

 PP1:=(Seg[3] as ISketchArc).IGetCenterPoint2;
 PP2:=(Seg[4] as ISketchArc).IGetCenterPoint2;
 PP1.Select(false);
 PP2.Select(true);
 MD.AddHorizontalDimension(0.02,0.02,0);
// CheckDim(MD,X1);

 PP2.Select(false);
 CP.Select(true);
 MD.AddVerticalDimension(0.05,0.05,0);
// CheckDim(MD,dd/2);

 Seg[4].Select(false);
 MD.AddDimension(0.03,0.03,0);
// CheckDim(MD,R);

 Seg[3].Select(false);
 MD.AddDimension(0.04,0.04,0);
// CheckDim(MD,R1);

 Seg[1].Select(false);
 MD.AddDimension(0.05,0.05,0);
// CheckDim(MD,R2);

 PP1:=(Seg[4] as ISketchArc).IGetCenterPoint2;
 PP2:=(Seg[1] as ISketchArc).IGetCenterPoint2;
 PP1.Select(false);
 PP2.Select(true);
 MD.AddVerticalDimension(0.07,0.07,0);
//CheckDim(Y2);

 PP1:=(Seg[4] as ISketchArc).IGetCenterPoint2;
 PP2:=(Seg[1] as ISketchArc).IGetCenterPoint2;
 PP1.Select(false);
 PP2.Select(true);
 MD.AddHorizontalDimension(0.08,0.08,0);
//CheckDim(X2);
{  Seg[2].Select(false);
 Seg[3].Select(true);
 MD.SketchAddConstraints('sgTANGENT');

 Seg[2].Select(false);
 Seg[1].Select(true);
 MD.SketchAddConstraints('sgTANGENT'); }

 PP1:=(Seg[4] as ISketchArc).IGetStartPoint2;
 PP1.Select(false);
 CLC.Select(true);
 MD.SketchAddConstraints('sgCOINCIDENT');

 PP1:=(Seg[4] as ISketchArc).IGetCenterPoint2;
 PP1.Select(false);
 CLC.Select(true);
 MD.SketchAddConstraints('sgCOINCIDENT');

 PP1:=(Seg[1] as ISketchArc).IGetEndPoint2;
 PP1.Select(false);
 CLL.Select(true);
 MD.SketchAddConstraints('sgCOINCIDENT');

 Seg[8]:=MD.ICreateArc2(-O1x,O1y,0,-Ax,Ay,0,-Bx,By,0,-1);
 Seg[7]:=MD.ICreateArc2(-O2x,O2y,0,-Bx,By,0,-Cx,Cy,0,-1);
// Seg[6]:=ICreateLine2DS(MD,-Cx,Cy,-Dx,Dy);
 Seg[5]:=MD.ICreateArc2(-O3x,O3y,0,-Cx,Cy,0,-Fx,Fy,0,-1);

 for i:=5 to 8 do
  if (Seg[i]=nil)and(Seg[6]<>nil) then Ex('Segment has not been created');

 Seg[8].Select(false);
 Seg[4].Select(true);
 CLC.Select(true);
 MD.SketchAddConstraints('sgSYMMETRIC');

 Seg[7].Select(false);
 Seg[3].Select(true);
 CLC.Select(true);
 MD.SketchAddConstraints('sgSYMMTRIC');

{ Seg[6].Select(false);
 Seg[2].Select(true);
 CLC.Select(true);
 MD.SketchAddConstraints('sgSYMMETRIC');  }

 Seg[5].Select(false);
 Seg[1].Select(true);
 CLC.Select(true);
 MD.SketchAddConstraints('sgSYMMETRIC');

 PP1:=(Seg[7] as ISketchArc).IGetCenterPoint2;
 PP1.Select(false);
 PP1:=(Seg[3] as ISketchArc).IGetCenterPoint2;
 PP1.Select(true);
 CLC.Select(true);
 MD.SketchAddConstraints('sgSYMMETRIC');

 PP1:=(Seg[5] as ISketchArc).IGetCenterPoint2;
 PP1.Select(false);
 PP1:=(Seg[1] as ISketchArc).IGetCenterPoint2;
 PP1.Select(true);
 CLC.Select(true);
 MD.SketchAddConstraints('sgSYMMETRIC');

 PP1:=(Seg[5] as ISketchArc).IGetEndPoint2;
 PP1.Select(false);
 CLR.Select(true);
 MD.SketchAddConstraints('sgCOINCIDENT');

{ Seg[6].Select(false);
 Seg[7].Select(true);
 MD.SketchAddConstraints('sgTANGENT');

 Seg[6].Select(false);
 Seg[5].Select(true);
 MD.SketchAddConstraints('sgTANGENT');}

 PP1:=(Seg[5] as ISketchArc).IGetEndPoint2;

 Seg[0]:=MD.ICreateLine2(-PP1.Get_x,PP1.Get_y,0,PP1.Get_x,PP1.Get_y,0);

 MD.FeatureCut(true, false, true, 1, 1, 0.1, 0.1, false, false, false, false, 0, 0, false, false);

 CircleCutFeature:= SelMgr.IGetSelectedObject(1) as IFeature;
end;

constructor TRolicZv.Create(_d0, _p: Real; _n, _z: integer);
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

procedure TRolicZv.CreateSW(MD: IModelDoc);
begin
 inherited CreateSW(md);
 {l_st:=1.6*d0+10;



 if D_sh<0.25 then L_st:=B;
 if abs(L_st-B)<0.005 then L_st:=B;
 if (D_old-d_st<=0.01)and(dd<=0.18) then C:=B;

 if C<>B then Revolve1;
 if (C=B) and (L_st<>B) then Revolve2;
 if (C=B) and (L_st=B) then Revolve3;  }

 f1:=(B-c)/2;

 l_st:= 1.35*d0;
 l_st:=StandardNumber(l_st);
 d_st:=1.6*d0+10;
 d_st:=StandardNumber(d_st);

 if l_st > b   then
  begin
   if d_sh > 3*d0 then Revolve1
    else
     begin
      c:=b;
      d_old:=(d_sh+d_st)/2;
      f1:=0;
      Revolve2;
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
 CircleCut;
 CircleArray;
 if n>2 then
  RevolveArray;
end;

procedure TRolicZv.EdgesProc;
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

procedure TRolicZv.ICreateDimDS(ModelDoc:IModelDoc;Seg1,Seg2:ISketchSegment;x,y,Dim:Double);
begin
 Seg1.Select(false);
 Seg2.Select(true);
 ModelDoc.AddDimension(x,y,0);
 CheckDim(ModelDoc,Dim*1000);
end;

function TRolicZv.ICreateLine2DS(ModelDoc: IModelDoc; x1, y1, x2,
  y2: double): ISketchSegment;
begin
 Result:=ModelDoc.ICreateLine2(x1,y1,0,x2,y2,0);
 if Result=nil then Exit;
 if x1=x2 then ModelDoc.SketchAddConstraints('sgVERTICAL');
 if y1=y2 then ModelDoc.SketchAddConstraints('sgHORIZONTAL');
end;

procedure TRolicZv.RevolveCut;
var
  Seg: array[1..4] of ISketchSegment;
   cp: ISketchPoint;
    i: integer;
   CL:ISketchSegment;
begin
  if not (xyPlane as IFeature).Select(False) then
    ex('Не выбрана плоскость XY');
  md.InsertSketch;
  md.SelectByID('', 'EXTSKETCHPOINT', 0, 0, 0);
  cp:= SelMgr.GetSelectedObject(1) as ISketchPoint;
  if cp = nil then
    ex('Не выбрана ц.т.');

  Seg[1]:=ICreateLine2DS(MD,Bvn/1000,Dc/2000,Bvn/1000,D_sh/2000);
  Seg[2]:=ICreateLine2DS(MD,Bvn/1000,D_sh/2000,(Bvn+Aa)/1000,D_sh/2000);
  Seg[3]:=ICreateLine2DS(MD,(Bvn+Aa)/1000,D_sh/2000,(Bvn+Aa)/1000,Dc/2000);
  Seg[4]:=ICreateLine2DS(MD,(Bvn+Aa)/1000,Dc/2000,Bvn/1000,Dc/2000);

//Проверка на существование

  for i:=1 to 4 do
   if Seg[i]=nil then Ex('Segment has not been created');

  CP.Select(false);
  Seg[1].Select(true);
  MD.AddVerticalDimension(0,Bvn/1000,0);
  CheckDim(MD,Bvn);

  Seg[4].Select(false);
  Seg[2].Select(true);
  MD.AddHorizontalDimension(0,(D_sh-Dc)/2000,0);
  CheckDim(MD,(D_sh-Dc)/2);

  Seg[3].Select(false);
  Seg[1].Select(true);
  MD.AddVerticalDimension(0,Aa/1000,0);
  CheckDim(MD,Aa);   

  Seg[2].Select(false);
  SegT.Select(true);
  MD.SketchAddConstraints('sgCOLINEAR');

  md.ClearSelection;
  md.CreateCenterLineVB(0, 0, 0, l_st/1000, 0, 0);
  cl:= SelMgr.IGetSelectedObject(1) as ISketchSegment;
  if cl = nil then ex('Нет осевой');

  CL.Select(False);
  MD.SketchAddConstraints('sgHORIZONTAL');

  if MD.FeatureRevolveCut2(2*pi,false, 0, 0, 0) <> 0 then
    ex('Вырез не создан');
  RevolveCutFeature:= SelMgr.IGetSelectedObject(1) as IFeature;
end;

procedure TRolicZv.RevolveArray;
begin
//  md.ViewDispTempRefaxes;
  if md.SelectByMark('', 'AXIS', l_st/2000, 0, 0, 1) and
    RevolveCutFeature.SelectByMark(true, 4) then
   md.FeatureLinearPattern(trunc(n-1), A/1000, 0 , 0, false, false, 'e', 'NULL');
end;


end.
