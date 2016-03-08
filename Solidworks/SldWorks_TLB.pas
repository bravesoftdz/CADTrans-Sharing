unit SldWorks_TLB;

// ************************************************************************ //
// WARNING                                                                  //
// -------                                                                  //
// The types declared in this file were generated from data read from a     //
// Type Library. If this type library is explicitly or indirectly (via      //
// another type library referring to this type library) re-imported, or the //
// 'Refresh' command of the Type Library Editor activated while editing the //
// Type Library, the contents of this file will be regenerated and all      //
// manual modifications will be lost.                                       //
// ************************************************************************ //

// PASTLWTR : $Revision:   1.11.1.62  $
// File generated on 14.09.2002 8:15:45 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\Program Files\SolidWorks\sldworks.tlb
// IID\LCID: {83A33D31-27C5-11CE-BFD4-00400513BB57}\409
// Helpfile: 
// HelpString: SldWorks 2001 Type Library
// Version:    9.0
// ************************************************************************ //

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLASS_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
const
  LIBID_SldWorks: TGUID = '{83A33D31-27C5-11CE-BFD4-00400513BB57}';
  IID_ISldWorks: TGUID = '{83A33D22-27C5-11CE-BFD4-00400513BB57}';
  IID_IModelDoc: TGUID = '{83A33D46-27C5-11CE-BFD4-00400513BB57}';
  IID_ISelectionMgr: TGUID = '{83A33D59-27C5-11CE-BFD4-00400513BB57}';
  IID_IComponent: TGUID = '{83A33D9A-27C5-11CE-BFD4-00400513BB57}';
  IID_IBody: TGUID = '{83A33D3C-27C5-11CE-BFD4-00400513BB57}';
  IID_IFace: TGUID = '{83A33D3E-27C5-11CE-BFD4-00400513BB57}';
  IID_ISurface: TGUID = '{83A33D40-27C5-11CE-BFD4-00400513BB57}';
  IID_ICurve: TGUID = '{83A33D44-27C5-11CE-BFD4-00400513BB57}';
  IID_IEdge: TGUID = '{83A33D42-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumCoEdges: TGUID = '{83A33D61-27C5-11CE-BFD4-00400513BB57}';
  IID_ICoEdge: TGUID = '{83A33D57-27C5-11CE-BFD4-00400513BB57}';
  IID_ILoop: TGUID = '{83A33D53-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumEdges: TGUID = '{83A33D5F-27C5-11CE-BFD4-00400513BB57}';
  IID_IVertex: TGUID = '{83A33D63-27C5-11CE-BFD4-00400513BB57}';
  IID_IFeature: TGUID = '{83A33D38-27C5-11CE-BFD4-00400513BB57}';
  IID_IDimension: TGUID = '{83A33D3A-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumDisplayDimensions: TGUID = '{83A33DAB-27C5-11CE-BFD4-00400513BB57}';
  IID_IDisplayDimension: TGUID = '{83A33DA1-27C5-11CE-BFD4-00400513BB57}';
  IID_IDisplayData: TGUID = '{83A33D9C-27C5-11CE-BFD4-00400513BB57}';
  IID_ITextFormat: TGUID = '{83A33DB9-27C5-11CE-BFD4-00400513BB57}';
  IID_IAnnotation: TGUID = '{83A33DA9-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumLoops: TGUID = '{83A33D5D-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumFaces: TGUID = '{83A33D5B-27C5-11CE-BFD4-00400513BB57}';
  IID_IPartDoc: TGUID = '{83A33D32-27C5-11CE-BFD4-00400513BB57}';
  IID_IEntity: TGUID = '{83A33D65-27C5-11CE-BFD4-00400513BB57}';
  IID_IAttributeDef: TGUID = '{83A33D67-27C5-11CE-BFD4-00400513BB57}';
  IID_IAttribute: TGUID = '{83A33D71-27C5-11CE-BFD4-00400513BB57}';
  IID_IParameter: TGUID = '{83A33D69-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumBodies: TGUID = '{83A33D96-27C5-11CE-BFD4-00400513BB57}';
  IID_IModelView: TGUID = '{83A33D4C-27C5-11CE-BFD4-00400513BB57}';
  IID_ITessellation: TGUID = '{699C7492-DB56-4CC2-B7A2-9FFD56698434}';
  IID_ISketch: TGUID = '{83A33D51-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumSketchPoints: TGUID = '{83A33DCD-27C5-11CE-BFD4-00400513BB57}';
  IID_ISketchPoint: TGUID = '{83A33DBD-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumSketchSegments: TGUID = '{83A33DCF-27C5-11CE-BFD4-00400513BB57}';
  IID_ISketchSegment: TGUID = '{83A33DBF-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumSketchHatches: TGUID = '{54729B8E-4086-11D3-AE9B-00C04F683CBA}';
  IID_ISketchHatch: TGUID = '{C3D00926-4068-11D3-AE9B-00C04F683CBA}';
  IID_IMidSurface: TGUID = '{83A33D88-27C5-11CE-BFD4-00400513BB57}';
  IID_IFeatMgrView: TGUID = '{83A33D75-27C5-11CE-BFD4-00400513BB57}';
  IID_IConfiguration: TGUID = '{83A33D98-27C5-11CE-BFD4-00400513BB57}';
  IID_IExplodeStep: TGUID = '{7241680B-0BC6-11D4-AEEE-00C04F61025C}';
  IID_IReferenceCurve: TGUID = '{83A33DA3-27C5-11CE-BFD4-00400513BB57}';
  IID_IColorTable: TGUID = '{83A33DA5-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumModelViews: TGUID = '{83A33DB1-27C5-11CE-BFD4-00400513BB57}';
  IID_IDetailingDefaults: TGUID = '{83A33DB7-27C5-11CE-BFD4-00400513BB57}';
  IID_ILayerMgr: TGUID = '{75173E30-F19E-11D2-B8E9-00C04F8EF738}';
  IID_ILayer: TGUID = '{04B7287C-F19D-11D2-B8E9-00C04F8EF738}';
  IID_IDesignTable: TGUID = '{CE1EAA88-25AD-11D3-AE91-00C04F683CBA}';
  IID_IRefPlane: TGUID = '{83A33D84-27C5-11CE-BFD4-00400513BB57}';
  IID_IDatumTag: TGUID = '{83A33D90-27C5-11CE-BFD4-00400513BB57}';
  IID_IGtol: TGUID = '{83A33D4A-27C5-11CE-BFD4-00400513BB57}';
  IID_INote: TGUID = '{83A33D55-27C5-11CE-BFD4-00400513BB57}';
  IID_IPropertyManagerPage: TGUID = '{E981B4FA-7E86-11D4-AEF2-00C04F603FAF}';
  IID_IUserUnit: TGUID = '{82071121-8B32-4F51-8983-9304756503E7}';
  IID_IFrame: TGUID = '{83A33D48-27C5-11CE-BFD4-00400513BB57}';
  IID_IAssemblyDoc: TGUID = '{83A33D35-27C5-11CE-BFD4-00400513BB57}';
  IID_IMember: TGUID = '{83A33D4E-27C5-11CE-BFD4-00400513BB57}';
  IID_IDrawingDoc: TGUID = '{83A33D33-27C5-11CE-BFD4-00400513BB57}';
  IID_IView: TGUID = '{83A33D50-27C5-11CE-BFD4-00400513BB57}';
  IID_ISFSymbol: TGUID = '{83A33D8E-27C5-11CE-BFD4-00400513BB57}';
  IID_IDatumTargetSym: TGUID = '{83A33D92-27C5-11CE-BFD4-00400513BB57}';
  IID_IWeldSymbol: TGUID = '{83A33D94-27C5-11CE-BFD4-00400513BB57}';
  IID_ICThread: TGUID = '{83A33D9E-27C5-11CE-BFD4-00400513BB57}';
  IID_IBomTable: TGUID = '{83A33D82-27C5-11CE-BFD4-00400513BB57}';
  IID_ICustomSymbol: TGUID = '{83A33DB5-27C5-11CE-BFD4-00400513BB57}';
  IID_IDrSection: TGUID = '{F183A33F-D4DB-11D3-AEB2-00C04F603FAF}';
  IID_IEnumComponents: TGUID = '{51EFB944-D449-11D3-AEBE-00C04F683CBA}';
  IID_IEnumDrSections: TGUID = '{585A6A15-E95B-11D3-AEBC-00C04F603FAF}';
  IID_IDetailCircle: TGUID = '{4B65A34A-4C44-11D4-AEF6-00C04F683CBA}';
  IID_IProjectionArrow: TGUID = '{A2227E65-A3A7-11D4-AEFF-00C04F603FAF}';
  IID_ISheet: TGUID = '{83A33D80-27C5-11CE-BFD4-00400513BB57}';
  IID_IModeler: TGUID = '{83A33D73-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnvironment: TGUID = '{83A33D78-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumDocuments: TGUID = '{83A33DB3-27C5-11CE-BFD4-00400513BB57}';
  IID_IMathUtility: TGUID = '{F7D97F80-162E-11D4-AEAB-00C04FA0AC51}';
  IID_IMathTransform: TGUID = '{F7D97F82-162E-11D4-AEAB-00C04FA0AC51}';
  IID_IMathVector: TGUID = '{F7D97F86-162E-11D4-AEAB-00C04FA0AC51}';
  IID_IMathPoint: TGUID = '{F7D97F84-162E-11D4-AEAB-00C04FA0AC51}';
  IID_IRefAxis: TGUID = '{83A33D86-27C5-11CE-BFD4-00400513BB57}';
  IID_IMate: TGUID = '{83A33D8A-27C5-11CE-BFD4-00400513BB57}';
  IID_IMateEntity: TGUID = '{83A33D8C-27C5-11CE-BFD4-00400513BB57}';
  IID_ISWPropertySheet: TGUID = '{83A33DA7-27C5-11CE-BFD4-00400513BB57}';
  IID_IRibFeatureData: TGUID = '{83A33DAD-27C5-11CE-BFD4-00400513BB57}';
  IID_IDomeFeatureData: TGUID = '{83A33DAF-27C5-11CE-BFD4-00400513BB57}';
  IID_ISketchLine: TGUID = '{83A33DC1-27C5-11CE-BFD4-00400513BB57}';
  IID_ISketchArc: TGUID = '{83A33DC3-27C5-11CE-BFD4-00400513BB57}';
  IID_ISketchText: TGUID = '{83A33DC5-27C5-11CE-BFD4-00400513BB57}';
  IID_ISketchEllipse: TGUID = '{83A33DC7-27C5-11CE-BFD4-00400513BB57}';
  IID_ISketchParabola: TGUID = '{83A33DC9-27C5-11CE-BFD4-00400513BB57}';
  IID_ISketchSpline: TGUID = '{83A33DCB-27C5-11CE-BFD4-00400513BB57}';
  IID_ILightDialog: TGUID = '{83A33DF1-27C5-11CE-BFD4-00400513BB57}';
  IID_IEnumCurves: TGUID = '{5B57E3BC-7139-11D3-AEA2-00C04F683CBA}';
  IID_ISimpleHoleFeatureData: TGUID = '{1D06FD54-96DD-11D3-AEAA-00C04F683CBA}';
  IID_IWizardHoleFeatureData: TGUID = '{887AB457-A739-11D3-B97F-001083029A97}';
  IID_IChamferFeatureData: TGUID = '{7271D7C7-ACC9-11D3-B97F-001083029A97}';
  IID_IDraftFeatureData: TGUID = '{BC633CE1-B367-11D3-B981-001083029A97}';
  IID_ISimpleFilletFeatureData: TGUID = '{CC929F0B-B404-11D3-B981-001083029A97}';
  IID_IVariableFilletFeatureData: TGUID = '{CC929F0D-B404-11D3-B981-001083029A97}';
  IID_IExtrudeFeatureData: TGUID = '{908A7175-B72C-11D3-B981-001083029A97}';
  IID_IRevolveFeatureData: TGUID = '{B7FFF613-B735-11D3-B981-001083029A97}';
  IID_IMirrorPatternFeatureData: TGUID = '{414F4F1E-30EC-11D4-AEEB-00C04F683CBA}';
  IID_ICircularPatternFeatureData: TGUID = '{DBBF39DE-7AB5-11D4-AEB6-00C04FA0AC51}';
  IID_ILinearPatternFeatureData: TGUID = '{F86D1E94-7DE8-11D4-AEB7-00C04FA0AC51}';
  IID_ITablePatternFeatureData: TGUID = '{E5D1AF7C-7F5D-11D4-AEB7-00C04FA0AC51}';
  IID_ISketchPatternFeatureData: TGUID = '{AE998464-8050-11D4-AEB7-00C04FA0AC51}';
  IID_IMirrorSolidFeatureData: TGUID = '{E9172718-836B-11D4-AEB7-00C04FA0AC51}';
  DIID_DSldWorksEvents: TGUID = '{83A33D22-37C5-11CE-BFD4-00400513BB57}';
  CLASS_SldWorks_: TGUID = '{7DF753FA-574E-496E-8DBB-8199136A6048}';
  DIID_DPartDocEvents: TGUID = '{83A33D32-37C5-11CE-BFD4-00400513BB57}';
  CLASS_PartDoc: TGUID = '{83A33D30-27C5-11CE-BFD4-00400513BB57}';
  DIID_DDrawingDocEvents: TGUID = '{83A33D34-37C5-11CE-BFD4-00400513BB57}';
  CLASS_DrawingDoc: TGUID = '{83A33D34-27C5-11CE-BFD4-00400513BB57}';
  DIID_DAssemblyDocEvents: TGUID = '{83A33D35-37C5-11CE-BFD4-00400513BB57}';
  CLASS_AssemblyDoc: TGUID = '{83A33D36-27C5-11CE-BFD4-00400513BB57}';
  CLASS_feature: TGUID = '{83A33D37-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Dimension: TGUID = '{83A33D39-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Body: TGUID = '{83A33D3B-27C5-11CE-BFD4-00400513BB57}';
  CLASS_face: TGUID = '{83A33D3D-27C5-11CE-BFD4-00400513BB57}';
  CLASS_surface: TGUID = '{83A33D3F-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Edge: TGUID = '{83A33D41-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Curve: TGUID = '{83A33D43-27C5-11CE-BFD4-00400513BB57}';
  CLASS_ModelDoc: TGUID = '{83A33D45-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Frame: TGUID = '{83A33D47-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Gtol: TGUID = '{83A33D49-27C5-11CE-BFD4-00400513BB57}';
  DIID_DModelViewEvents: TGUID = '{83A33D4C-37C5-11CE-BFD4-00400513BB57}';
  CLASS_ModelView: TGUID = '{83A33D4B-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Member: TGUID = '{83A33D4D-27C5-11CE-BFD4-00400513BB57}';
  CLASS_view: TGUID = '{83A33D4F-27C5-11CE-BFD4-00400513BB57}';
  CLASS_sketch: TGUID = '{83A33D52-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Loop: TGUID = '{83A33D54-27C5-11CE-BFD4-00400513BB57}';
  CLASS_note: TGUID = '{83A33D56-27C5-11CE-BFD4-00400513BB57}';
  CLASS_CoEdge: TGUID = '{83A33D58-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Vertex: TGUID = '{83A33D64-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SelectionMgr: TGUID = '{83A33D5A-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumFaces: TGUID = '{83A33D5C-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumLoops: TGUID = '{83A33D5E-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumEdges: TGUID = '{83A33D60-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumCoEdges: TGUID = '{83A33D62-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumBodies: TGUID = '{83A33D97-27C5-11CE-BFD4-00400513BB57}';
  CLASS_entity: TGUID = '{83A33D66-27C5-11CE-BFD4-00400513BB57}';
  CLASS_attributeDef: TGUID = '{83A33D68-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Parameter: TGUID = '{83A33D70-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Attribute: TGUID = '{83A33D72-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Modeler: TGUID = '{83A33D74-27C5-11CE-BFD4-00400513BB57}';
  DIID_DFeatMgrViewEvents: TGUID = '{83A33D76-27C5-11CE-BFD4-00400513BB57}';
  CLASS_FeatMgrView: TGUID = '{83A33D77-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Environment: TGUID = '{83A33D79-27C5-11CE-BFD4-00400513BB57}';
  CLASS_sheet: TGUID = '{83A33D81-27C5-11CE-BFD4-00400513BB57}';
  CLASS_BomTable: TGUID = '{83A33D83-27C5-11CE-BFD4-00400513BB57}';
  CLASS_refPlane: TGUID = '{83A33D85-27C5-11CE-BFD4-00400513BB57}';
  CLASS_refAxis: TGUID = '{83A33D87-27C5-11CE-BFD4-00400513BB57}';
  CLASS_MidSurface: TGUID = '{83A33D89-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Mate: TGUID = '{83A33D8B-27C5-11CE-BFD4-00400513BB57}';
  CLASS_MateEntity: TGUID = '{83A33D8D-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SFSymbol: TGUID = '{83A33D8F-27C5-11CE-BFD4-00400513BB57}';
  CLASS_DatumTag: TGUID = '{83A33D91-27C5-11CE-BFD4-00400513BB57}';
  CLASS_DatumTargetSym: TGUID = '{83A33D93-27C5-11CE-BFD4-00400513BB57}';
  CLASS_WeldSymbol: TGUID = '{83A33D95-27C5-11CE-BFD4-00400513BB57}';
  CLASS_configuration: TGUID = '{83A33D99-27C5-11CE-BFD4-00400513BB57}';
  CLASS_component: TGUID = '{83A33D9B-27C5-11CE-BFD4-00400513BB57}';
  CLASS_DisplayData: TGUID = '{83A33D9D-27C5-11CE-BFD4-00400513BB57}';
  CLASS_CThread: TGUID = '{83A33D9F-27C5-11CE-BFD4-00400513BB57}';
  CLASS_DisplayDimension: TGUID = '{83A33DA2-27C5-11CE-BFD4-00400513BB57}';
  CLASS_ReferenceCurve: TGUID = '{83A33DA4-27C5-11CE-BFD4-00400513BB57}';
  CLASS_ColorTable: TGUID = '{83A33DA6-27C5-11CE-BFD4-00400513BB57}';
  DIID_DSWPropertySheetEvents: TGUID = '{E05FF9E0-FC82-11D2-9395-00C04F79BFFE}';
  CLASS_SWPropertySheet: TGUID = '{83A33DA8-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Annotation: TGUID = '{83A33DAA-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumDisplayDimensions: TGUID = '{83A33DAC-27C5-11CE-BFD4-00400513BB57}';
  CLASS_RibFeatureData: TGUID = '{83A33DAE-27C5-11CE-BFD4-00400513BB57}';
  CLASS_DomeFeatureData: TGUID = '{83A33DB0-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumModelViews: TGUID = '{83A33DB2-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumDocuments: TGUID = '{83A33DB4-27C5-11CE-BFD4-00400513BB57}';
  CLASS_CustomSymbol: TGUID = '{83A33DB6-27C5-11CE-BFD4-00400513BB57}';
  CLASS_DetailingDefaults: TGUID = '{83A33DB8-27C5-11CE-BFD4-00400513BB57}';
  CLASS_textFormat: TGUID = '{83A33DBA-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SketchPoint: TGUID = '{83A33DBE-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SketchSegment: TGUID = '{83A33DC0-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SketchLine: TGUID = '{83A33DC2-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SketchArc: TGUID = '{83A33DC4-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SketchText: TGUID = '{83A33DC6-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SketchEllipse: TGUID = '{83A33DC8-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SketchParabola: TGUID = '{83A33DCA-27C5-11CE-BFD4-00400513BB57}';
  CLASS_SketchSpline: TGUID = '{83A33DCC-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumSketchPoints: TGUID = '{83A33DCE-27C5-11CE-BFD4-00400513BB57}';
  CLASS_EnumSketchSegments: TGUID = '{83A33DF0-27C5-11CE-BFD4-00400513BB57}';
  CLASS_LightDialog: TGUID = '{83A33DF2-27C5-11CE-BFD4-00400513BB57}';
  CLASS_Layer: TGUID = '{04B7287D-F19D-11D2-B8E9-00C04F8EF738}';
  CLASS_LayerMgr: TGUID = '{75173E31-F19E-11D2-B8E9-00C04F8EF738}';
  CLASS_DesignTable: TGUID = '{CE1EAA89-25AD-11D3-AE91-00C04F683CBA}';
  CLASS_SketchHatch: TGUID = '{C3D00927-4068-11D3-AE9B-00C04F683CBA}';
  CLASS_EnumSketchHatches: TGUID = '{54729B8F-4086-11D3-AE9B-00C04F683CBA}';
  CLASS_EnumCurves: TGUID = '{5B57E3BD-7139-11D3-AEA2-00C04F683CBA}';
  CLASS_SimpleHoleFeatureData: TGUID = '{1D06FD55-96DD-11D3-AEAA-00C04F683CBA}';
  CLASS_WizardHoleFeatureData: TGUID = '{887AB458-A739-11D3-B97F-001083029A97}';
  CLASS_ChamferFeatureData: TGUID = '{7271D7C8-ACC9-11D3-B97F-001083029A97}';
  CLASS_DraftFeatureData: TGUID = '{BC633CE2-B367-11D3-B981-001083029A97}';
  CLASS_SimpleFilletFeatureData: TGUID = '{CC929F0C-B404-11D3-B981-001083029A97}';
  CLASS_VariableFilletFeatureData: TGUID = '{CC929F0E-B404-11D3-B981-001083029A97}';
  CLASS_ExtrudeFeatureData: TGUID = '{908A7176-B72C-11D3-B981-001083029A97}';
  CLASS_RevolveFeatureData: TGUID = '{B7FFF614-B735-11D3-B981-001083029A97}';
  DIID_ISdmDoc: TGUID = '{AC048CEA-AE93-11D3-AEA7-00C04F60F02A}';
  CLASS_SdmDoc: TGUID = '{AC048CE8-AE93-11D3-AEA7-00C04F60F02A}';
  CLASS_DrSection: TGUID = '{F183A340-D4DB-11D3-AEB2-00C04F603FAF}';
  CLASS_EnumComponents: TGUID = '{51EFB945-D449-11D3-AEBE-00C04F683CBA}';
  CLASS_EnumDrSections: TGUID = '{585A6A16-E95B-11D3-AEBC-00C04F603FAF}';
  CLASS_ExplodeStep: TGUID = '{7241680C-0BC6-11D4-AEEE-00C04F61025C}';
  CLASS_MathUtility: TGUID = '{F7D97F81-162E-11D4-AEAB-00C04FA0AC51}';
  CLASS_MathTransform: TGUID = '{F7D97F83-162E-11D4-AEAB-00C04FA0AC51}';
  CLASS_MathPoint: TGUID = '{F7D97F85-162E-11D4-AEAB-00C04FA0AC51}';
  CLASS_MathVector: TGUID = '{F7D97F87-162E-11D4-AEAB-00C04FA0AC51}';
  CLASS_MirrorPatternFeatureData: TGUID = '{414F4F1F-30EC-11D4-AEEB-00C04F683CBA}';
  CLASS_DetailCircle: TGUID = '{4B65A34B-4C44-11D4-AEF6-00C04F683CBA}';
  CLASS_CircularPatternFeatureData: TGUID = '{DBBF39DF-7AB5-11D4-AEB6-00C04FA0AC51}';
  CLASS_LinearPatternFeatureData: TGUID = '{F86D1E95-7DE8-11D4-AEB7-00C04FA0AC51}';
  CLASS_TablePatternFeatureData: TGUID = '{E5D1AF7D-7F5D-11D4-AEB7-00C04FA0AC51}';
  CLASS_SketchPatternFeatureData: TGUID = '{AE998465-8050-11D4-AEB7-00C04FA0AC51}';
  CLASS_MirrorSolidFeatureData: TGUID = '{E9172719-836B-11D4-AEB7-00C04FA0AC51}';
  CLASS_PropertyManagerPage: TGUID = '{E981B4FB-7E86-11D4-AEF2-00C04F603FAF}';
  CLASS_ProjectionArrow: TGUID = '{A2227E66-A3A7-11D4-AEFF-00C04F603FAF}';
  CLASS_Tessellation: TGUID = '{699C7493-DB56-4CC2-B7A2-9FFD56698434}';
  CLASS_UserUnit: TGUID = '{3CC0BC03-541F-40C3-866B-8BAC502DB4EB}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  ISldWorks = interface;
  ISldWorksDisp = dispinterface;
  IModelDoc = interface;
  IModelDocDisp = dispinterface;
  ISelectionMgr = interface;
  ISelectionMgrDisp = dispinterface;
  IComponent = interface;
  IComponentDisp = dispinterface;
  IBody = interface;
  IBodyDisp = dispinterface;
  IFace = interface;
  IFaceDisp = dispinterface;
  ISurface = interface;
  ISurfaceDisp = dispinterface;
  ICurve = interface;
  ICurveDisp = dispinterface;
  IEdge = interface;
  IEdgeDisp = dispinterface;
  IEnumCoEdges = interface;
  ICoEdge = interface;
  ICoEdgeDisp = dispinterface;
  ILoop = interface;
  ILoopDisp = dispinterface;
  IEnumEdges = interface;
  IVertex = interface;
  IVertexDisp = dispinterface;
  IFeature = interface;
  IFeatureDisp = dispinterface;
  IDimension = interface;
  IDimensionDisp = dispinterface;
  IEnumDisplayDimensions = interface;
  IDisplayDimension = interface;
  IDisplayDimensionDisp = dispinterface;
  IDisplayData = interface;
  IDisplayDataDisp = dispinterface;
  ITextFormat = interface;
  ITextFormatDisp = dispinterface;
  IAnnotation = interface;
  IAnnotationDisp = dispinterface;
  IEnumLoops = interface;
  IEnumFaces = interface;
  IPartDoc = interface;
  IPartDocDisp = dispinterface;
  IEntity = interface;
  IEntityDisp = dispinterface;
  IAttributeDef = interface;
  IAttributeDefDisp = dispinterface;
  IAttribute = interface;
  IAttributeDisp = dispinterface;
  IParameter = interface;
  IParameterDisp = dispinterface;
  IEnumBodies = interface;
  IModelView = interface;
  IModelViewDisp = dispinterface;
  ITessellation = interface;
  ITessellationDisp = dispinterface;
  ISketch = interface;
  ISketchDisp = dispinterface;
  IEnumSketchPoints = interface;
  ISketchPoint = interface;
  ISketchPointDisp = dispinterface;
  IEnumSketchSegments = interface;
  ISketchSegment = interface;
  ISketchSegmentDisp = dispinterface;
  IEnumSketchHatches = interface;
  ISketchHatch = interface;
  ISketchHatchDisp = dispinterface;
  IMidSurface = interface;
  IMidSurfaceDisp = dispinterface;
  IFeatMgrView = interface;
  IFeatMgrViewDisp = dispinterface;
  IConfiguration = interface;
  IConfigurationDisp = dispinterface;
  IExplodeStep = interface;
  IExplodeStepDisp = dispinterface;
  IReferenceCurve = interface;
  IReferenceCurveDisp = dispinterface;
  IColorTable = interface;
  IColorTableDisp = dispinterface;
  IEnumModelViews = interface;
  IDetailingDefaults = interface;
  IDetailingDefaultsDisp = dispinterface;
  ILayerMgr = interface;
  ILayerMgrDisp = dispinterface;
  ILayer = interface;
  ILayerDisp = dispinterface;
  IDesignTable = interface;
  IDesignTableDisp = dispinterface;
  IRefPlane = interface;
  IRefPlaneDisp = dispinterface;
  IDatumTag = interface;
  IDatumTagDisp = dispinterface;
  IGtol = interface;
  IGtolDisp = dispinterface;
  INote = interface;
  INoteDisp = dispinterface;
  IPropertyManagerPage = interface;
  IPropertyManagerPageDisp = dispinterface;
  IUserUnit = interface;
  IUserUnitDisp = dispinterface;
  IFrame = interface;
  IFrameDisp = dispinterface;
  IAssemblyDoc = interface;
  IAssemblyDocDisp = dispinterface;
  IMember = interface;
  IMemberDisp = dispinterface;
  IDrawingDoc = interface;
  IDrawingDocDisp = dispinterface;
  IView = interface;
  IViewDisp = dispinterface;
  ISFSymbol = interface;
  ISFSymbolDisp = dispinterface;
  IDatumTargetSym = interface;
  IDatumTargetSymDisp = dispinterface;
  IWeldSymbol = interface;
  IWeldSymbolDisp = dispinterface;
  ICThread = interface;
  ICThreadDisp = dispinterface;
  IBomTable = interface;
  IBomTableDisp = dispinterface;
  ICustomSymbol = interface;
  ICustomSymbolDisp = dispinterface;
  IDrSection = interface;
  IDrSectionDisp = dispinterface;
  IEnumComponents = interface;
  IEnumDrSections = interface;
  IDetailCircle = interface;
  IDetailCircleDisp = dispinterface;
  IProjectionArrow = interface;
  IProjectionArrowDisp = dispinterface;
  ISheet = interface;
  ISheetDisp = dispinterface;
  IModeler = interface;
  IModelerDisp = dispinterface;
  IEnvironment = interface;
  IEnvironmentDisp = dispinterface;
  IEnumDocuments = interface;
  IMathUtility = interface;
  IMathUtilityDisp = dispinterface;
  IMathTransform = interface;
  IMathTransformDisp = dispinterface;
  IMathVector = interface;
  IMathVectorDisp = dispinterface;
  IMathPoint = interface;
  IMathPointDisp = dispinterface;
  IRefAxis = interface;
  IRefAxisDisp = dispinterface;
  IMate = interface;
  IMateDisp = dispinterface;
  IMateEntity = interface;
  IMateEntityDisp = dispinterface;
  ISWPropertySheet = interface;
  ISWPropertySheetDisp = dispinterface;
  IRibFeatureData = interface;
  IRibFeatureDataDisp = dispinterface;
  IDomeFeatureData = interface;
  IDomeFeatureDataDisp = dispinterface;
  ISketchLine = interface;
  ISketchLineDisp = dispinterface;
  ISketchArc = interface;
  ISketchArcDisp = dispinterface;
  ISketchText = interface;
  ISketchTextDisp = dispinterface;
  ISketchEllipse = interface;
  ISketchEllipseDisp = dispinterface;
  ISketchParabola = interface;
  ISketchParabolaDisp = dispinterface;
  ISketchSpline = interface;
  ISketchSplineDisp = dispinterface;
  ILightDialog = interface;
  ILightDialogDisp = dispinterface;
  IEnumCurves = interface;
  ISimpleHoleFeatureData = interface;
  ISimpleHoleFeatureDataDisp = dispinterface;
  IWizardHoleFeatureData = interface;
  IWizardHoleFeatureDataDisp = dispinterface;
  IChamferFeatureData = interface;
  IChamferFeatureDataDisp = dispinterface;
  IDraftFeatureData = interface;
  IDraftFeatureDataDisp = dispinterface;
  ISimpleFilletFeatureData = interface;
  ISimpleFilletFeatureDataDisp = dispinterface;
  IVariableFilletFeatureData = interface;
  IVariableFilletFeatureDataDisp = dispinterface;
  IExtrudeFeatureData = interface;
  IExtrudeFeatureDataDisp = dispinterface;
  IRevolveFeatureData = interface;
  IRevolveFeatureDataDisp = dispinterface;
  IMirrorPatternFeatureData = interface;
  IMirrorPatternFeatureDataDisp = dispinterface;
  ICircularPatternFeatureData = interface;
  ICircularPatternFeatureDataDisp = dispinterface;
  ILinearPatternFeatureData = interface;
  ILinearPatternFeatureDataDisp = dispinterface;
  ITablePatternFeatureData = interface;
  ITablePatternFeatureDataDisp = dispinterface;
  ISketchPatternFeatureData = interface;
  ISketchPatternFeatureDataDisp = dispinterface;
  IMirrorSolidFeatureData = interface;
  IMirrorSolidFeatureDataDisp = dispinterface;
  DSldWorksEvents = dispinterface;
  DPartDocEvents = dispinterface;
  DDrawingDocEvents = dispinterface;
  DAssemblyDocEvents = dispinterface;
  DModelViewEvents = dispinterface;
  DFeatMgrViewEvents = dispinterface;
  DSWPropertySheetEvents = dispinterface;
  ISdmDoc = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  SldWorks_ = ISldWorks;
  PartDoc = IPartDoc;
  DrawingDoc = IDrawingDoc;
  AssemblyDoc = IAssemblyDoc;
  feature = IFeature;
  Dimension = IDimension;
  Body = IBody;
  face = IFace;
  surface = ISurface;
  Edge = IEdge;
  Curve = ICurve;
  ModelDoc = IModelDoc;
  Frame = IFrame;
  Gtol = IGtol;
  ModelView = IModelView;
  Member = IMember;
  view = IView;
  sketch = ISketch;
  Loop = ILoop;
  note = INote;
  CoEdge = ICoEdge;
  Vertex = IVertex;
  SelectionMgr = ISelectionMgr;
  EnumFaces = IEnumFaces;
  EnumLoops = IEnumLoops;
  EnumEdges = IEnumEdges;
  EnumCoEdges = IEnumCoEdges;
  EnumBodies = IEnumBodies;
  entity = IEntity;
  attributeDef = IAttributeDef;
  Parameter = IParameter;
  Attribute = IAttribute;
  Modeler = IModeler;
  FeatMgrView = IFeatMgrView;
  Environment = IEnvironment;
  sheet = ISheet;
  BomTable = IBomTable;
  refPlane = IRefPlane;
  refAxis = IRefAxis;
  MidSurface = IMidSurface;
  Mate = IMate;
  MateEntity = IMateEntity;
  SFSymbol = ISFSymbol;
  DatumTag = IDatumTag;
  DatumTargetSym = IDatumTargetSym;
  WeldSymbol = IWeldSymbol;
  configuration = IConfiguration;
  component = IComponent;
  DisplayData = IDisplayData;
  CThread = ICThread;
  DisplayDimension = IDisplayDimension;
  ReferenceCurve = IReferenceCurve;
  ColorTable = IColorTable;
  SWPropertySheet = ISWPropertySheet;
  Annotation = IAnnotation;
  EnumDisplayDimensions = IEnumDisplayDimensions;
  RibFeatureData = IRibFeatureData;
  DomeFeatureData = IDomeFeatureData;
  EnumModelViews = IEnumModelViews;
  EnumDocuments = IEnumDocuments;
  CustomSymbol = ICustomSymbol;
  DetailingDefaults = IDetailingDefaults;
  textFormat = ITextFormat;
  SketchPoint = ISketchPoint;
  SketchSegment = ISketchSegment;
  SketchLine = ISketchLine;
  SketchArc = ISketchArc;
  SketchText = ISketchText;
  SketchEllipse = ISketchEllipse;
  SketchParabola = ISketchParabola;
  SketchSpline = ISketchSpline;
  EnumSketchPoints = IEnumSketchPoints;
  EnumSketchSegments = IEnumSketchSegments;
  LightDialog = ILightDialog;
  Layer = ILayer;
  LayerMgr = ILayerMgr;
  DesignTable = IDesignTable;
  SketchHatch = ISketchHatch;
  EnumSketchHatches = IEnumSketchHatches;
  EnumCurves = IEnumCurves;
  SimpleHoleFeatureData = ISimpleHoleFeatureData;
  WizardHoleFeatureData = IWizardHoleFeatureData;
  ChamferFeatureData = IChamferFeatureData;
  DraftFeatureData = IDraftFeatureData;
  SimpleFilletFeatureData = ISimpleFilletFeatureData;
  VariableFilletFeatureData = IVariableFilletFeatureData;
  ExtrudeFeatureData = IExtrudeFeatureData;
  RevolveFeatureData = IRevolveFeatureData;
  SdmDoc = ISdmDoc;
  DrSection = IDrSection;
  EnumComponents = IEnumComponents;
  EnumDrSections = IEnumDrSections;
  ExplodeStep = IExplodeStep;
  MathUtility = IMathUtility;
  MathTransform = IMathTransform;
  MathPoint = IMathPoint;
  MathVector = IMathVector;
  MirrorPatternFeatureData = IMirrorPatternFeatureData;
  DetailCircle = IDetailCircle;
  CircularPatternFeatureData = ICircularPatternFeatureData;
  LinearPatternFeatureData = ILinearPatternFeatureData;
  TablePatternFeatureData = ITablePatternFeatureData;
  SketchPatternFeatureData = ISketchPatternFeatureData;
  MirrorSolidFeatureData = IMirrorSolidFeatureData;
  PropertyManagerPage = IPropertyManagerPage;
  ProjectionArrow = IProjectionArrow;
  Tessellation = ITessellation;
  UserUnit = IUserUnit;


// *********************************************************************//
// Declaration of structures, unions and aliases.                       //
// *********************************************************************//
  PInteger1 = ^Integer; {*}
  PDouble1 = ^Double; {*}
  PPUserType1 = ^ICurve; {*}
  PPPUserType1 = ^PPUserType1; {*}
  PSYSINT1 = ^SYSINT; {*}
  PPUserType2 = ^IBody; {*}
  PWordBool1 = ^WordBool; {*}
  PPUserType3 = ^IComponent; {*}
  PPUserType4 = ^IEdge; {*}
  PPUserType5 = ^IFace; {*}
  PPPUserType2 = ^PPUserType5; {*}
  PIDispatch1 = ^IDispatch; {*}
  PPUserType6 = ^ILoop; {*}
  PPSYSINT1 = ^PSYSINT1; {*}
  PSingle1 = ^Single; {*}
  PPSingle1 = ^PSingle1; {*}
  PWideString1 = ^WideString; {*}
  PByte1 = ^Byte; {*}
  PPUserType7 = ^ISurface; {*}
  PIUnknown1 = ^IUnknown; {*}
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// Interface: ISldWorks
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D22-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISldWorks = interface(IDispatch)
    ['{83A33D22-27C5-11CE-BFD4-00400513BB57}']
    function Get_ActiveDoc: IDispatch; safecall;
    function Get_IActiveDoc: IModelDoc; safecall;
    function OpenDoc(const Name: WideString; type_: Integer): IDispatch; safecall;
    function IOpenDoc(const Name: WideString; type_: Integer): IModelDoc; safecall;
    function ActivateDoc(const Name: WideString): IDispatch; safecall;
    function IActivateDoc(const Name: WideString): IModelDoc; safecall;
    procedure SendMsgToUser(const Message: WideString); safecall;
    function Frame: IDispatch; safecall;
    function IFrameObject: IFrame; safecall;
    procedure ExitApp; safecall;
    procedure CloseDoc(const Name: WideString); safecall;
    function NewPart: IDispatch; safecall;
    function INewPart: IPartDoc; safecall;
    function NewAssembly: IDispatch; safecall;
    function INewAssembly: IAssemblyDoc; safecall;
    function NewDrawing(templateToUse: Integer): IDispatch; safecall;
    function INewDrawing(templateToUse: Integer): IDrawingDoc; safecall;
    function DateCode: Integer; safecall;
    function RevisionNumber: WideString; safecall;
    function LoadFile(const fileName: WideString): WordBool; safecall;
    function AddFileOpenItem(const CallbackFcnAndModule: WideString; const Description: WideString): WordBool; safecall;
    function AddFileSaveAsItem(const CallbackFcnAndModule: WideString; 
                               const Description: WideString; type_: Integer): WordBool; safecall;
    procedure PreSelectDwgTemplateSize(templateToUse: Integer; const templateName: WideString); safecall;
    procedure DocumentVisible(Visible: WordBool; type_: Integer); safecall;
    function DefineAttribute(const Name: WideString): IDispatch; safecall;
    function IDefineAttribute(const Name: WideString): IAttributeDef; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(retval: WordBool); safecall;
    function Get_UserControl: WordBool; safecall;
    procedure Set_UserControl(retval: WordBool); safecall;
    procedure DisplayStatusBar(onOff: WordBool); safecall;
    procedure CreateNewWindow; safecall;
    procedure ArrangeIcons; safecall;
    procedure ArrangeWindows(Style: Integer); safecall;
    procedure QuitDoc(const Name: WideString); safecall;
    function GetModeler: IDispatch; safecall;
    function IGetModeler: IModeler; safecall;
    function GetEnvironment: IDispatch; safecall;
    function IGetEnvironment: IEnvironment; safecall;
    function NewDrawing2(templateToUse: Integer; const templateName: WideString; 
                         paperSize: Integer; Width: Double; height: Double): IDispatch; safecall;
    function INewDrawing2(templateToUse: Integer; const templateName: WideString; 
                          paperSize: Integer; Width: Double; height: Double): IDrawingDoc; safecall;
    function SetOptions(const Message: WideString): WordBool; safecall;
    function PreviewDoc(var hWnd: Integer; const FullName: WideString): WordBool; safecall;
    function GetSearchFolders(folderType: Integer): WideString; safecall;
    function SetSearchFolders(folderType: Integer; const folders: WideString): WordBool; safecall;
    function GetUserPreferenceToggle(userPreferenceToggle: Integer): WordBool; safecall;
    procedure SetUserPreferenceToggle(userPreferenceValue: Integer; onFlag: WordBool); safecall;
    function GetUserPreferenceDoubleValue(userPreferenceValue: Integer): Double; safecall;
    function SetUserPreferenceDoubleValue(userPreferenceValue: Integer; Value: Double): WordBool; safecall;
    function Get_ActivePrinter: WideString; safecall;
    procedure Set_ActivePrinter(const retval: WideString); safecall;
    function LoadFile2(const fileName: WideString; const ArgString: WideString): WordBool; safecall;
    function GetUserPreferenceIntegerValue(userPreferenceValue: Integer): Integer; safecall;
    function SetUserPreferenceIntegerValue(userPreferenceValue: Integer; Value: Integer): WordBool; safecall;
    function RemoveMenuPopupItem(DocType: Integer; SelectType: Integer; const Item: WideString; 
                                 const CallbackFcnAndModule: WideString; 
                                 const CustomNames: WideString; Unused: Integer): WordBool; safecall;
    function RemoveMenu(DocType: Integer; const MenuItemString: WideString; 
                        const CallbackFcnAndModule: WideString): WordBool; safecall;
    function RemoveFileOpenItem(const CallbackFcnAndModule: WideString; 
                                const Description: WideString): WordBool; safecall;
    function RemoveFileSaveAsItem(const CallbackFcnAndModule: WideString; 
                                  const Description: WideString; type_: Integer): WordBool; safecall;
    function ReplaceReferencedDocument(const referencingDocument: WideString; 
                                       const referencedDocument: WideString; 
                                       const newReference: WideString): WordBool; safecall;
    function AddMenuItem(DocType: Integer; const Menu: WideString; Postion: Integer; 
                         const CallbackModuleAndFcn: WideString): Integer; safecall;
    function AddMenuPopupItem(DocType: Integer; selType: Integer; const Item: WideString; 
                              const CallbackFcnAndModule: WideString; const CustomNames: WideString): Integer; safecall;
    function RemoveUserMenu(DocType: Integer; menuIdIn: Integer; const moduleName: WideString): WordBool; safecall;
    function AddToolbar(const moduleName: WideString; const title: WideString; 
                        smallBitmapHandle: Integer; largeBitmapHandle: Integer): Integer; safecall;
    function AddToolbarCommand(const moduleName: WideString; toolbarId: Integer; 
                               toolbarIndex: SYSINT; const commandString: WideString): WordBool; safecall;
    function ShowToolbar(const moduleName: WideString; toolbarId: Integer): WordBool; safecall;
    function HideToolbar(const moduleName: WideString; toolbarId: Integer): WordBool; safecall;
    function RemoveToolbar(const Module: WideString; toolbarId: Integer): WordBool; safecall;
    function GetToolbarState(const Module: WideString; toolbarId: Integer; toolbarState: Integer): WordBool; safecall;
    function GetUserPreferenceStringListValue(userPreference: Integer): WideString; safecall;
    procedure SetUserPreferenceStringListValue(userPreference: Integer; const Value: WideString); safecall;
    function EnableStereoDisplay(bEnable: WordBool): WordBool; safecall;
    function IEnableStereoDisplay(bEnable: WordBool): WordBool; safecall;
    function GetDocumentDependencies(const document: WideString; traverseflag: Integer; 
                                     searchflag: Integer): OleVariant; safecall;
    function IGetDocumentDependencies(const document: WideString; traverseflag: Integer; 
                                      searchflag: Integer): WideString; safecall;
    function GetDocumentDependenciesCount(const document: WideString; traverseflag: Integer; 
                                          searchflag: Integer): Integer; safecall;
    function OpenDocSilent(const fileName: WideString; type_: Integer; var errors: Integer): IDispatch; safecall;
    function IOpenDocSilent(const fileName: WideString; type_: Integer; var errors: Integer): IModelDoc; safecall;
    function CallBack(const callBackFunc: WideString; defaultRetVal: Integer; 
                      const callBackArgs: WideString): Integer; safecall;
    function SendMsgToUser2(const Message: WideString; icon: Integer; buttons: Integer): Integer; safecall;
    function EnumDocuments: IEnumDocuments; safecall;
    function LoadAddIn(const fileName: WideString): Integer; safecall;
    function UnloadAddIn(const fileName: WideString): Integer; safecall;
    function RecordLine(const text: WideString): WordBool; safecall;
    function VersionHistory(const fileName: WideString): OleVariant; safecall;
    function IVersionHistory(const fileName: WideString): WideString; safecall;
    function IGetVersionHistoryCount(const fileName: WideString): SYSINT; safecall;
    function AllowFailedFeatureCreation(yesNo: WordBool): WordBool; safecall;
    function GetFirstDocument: IDispatch; safecall;
    function GetCurrentWorkingDirectory: WideString; safecall;
    function SetCurrentWorkingDirectory(const currentWorkingDirectory: WideString): WordBool; safecall;
    function GetDataFolder(bShowErrorMsg: WordBool): WideString; safecall;
    function GetSelectionFilter(selType: Integer): WordBool; safecall;
    procedure SetSelectionFilter(selType: Integer; state: WordBool); safecall;
    function ActivateDoc2(const Name: WideString; silent: WordBool; var errors: Integer): IDispatch; safecall;
    function IActivateDoc2(const Name: WideString; silent: WordBool; var errors: Integer): IModelDoc; safecall;
    function GetMouseDragMode(command: Integer): WordBool; safecall;
    function GetCurrentLanguage: WideString; safecall;
    function IGetFirstDocument: IModelDoc; safecall;
    function SanityCheck(swItemToCheck: Integer; var P1: Integer; var P2: Integer): WordBool; safecall;
    function AddMenu(DocType: Integer; const Menu: WideString; position: Integer): Integer; safecall;
    function CheckpointConvertedDocument(const docName: WideString): Integer; safecall;
    function OpenDoc2(const fileName: WideString; type_: Integer; ReadOnly: WordBool; 
                      viewOnly: WordBool; silent: WordBool; var errors: Integer): IDispatch; safecall;
    function IOpenDoc2(const fileName: WideString; type_: Integer; ReadOnly: WordBool; 
                       viewOnly: WordBool; silent: WordBool; var errors: Integer): IModelDoc; safecall;
    function GetMassProperties(const filePathName: WideString; const configurationName: WideString): OleVariant; safecall;
    function IGetMassProperties(const filePathName: WideString; 
                                const configurationName: WideString; var mPropsData: Double): WordBool; safecall;
    function GetLocalizedMenuName(menuId: Integer): WideString; safecall;
    function GetDocumentDependencies2(const document: WideString; traverseflag: WordBool; 
                                      searchflag: WordBool; addReadOnlyInfo: WordBool): OleVariant; safecall;
    function IGetDocumentDependencies2(const document: WideString; traverseflag: WordBool; 
                                       searchflag: WordBool; addReadOnlyInfo: WordBool): WideString; safecall;
    function IGetDocumentDependenciesCount2(const document: WideString; traverseflag: WordBool; 
                                            searchflag: WordBool; addReadOnlyInfo: WordBool): Integer; safecall;
    function GetSelectionFilters: OleVariant; safecall;
    procedure SetSelectionFilters(selType: OleVariant; state: WordBool); safecall;
    function GetApplySelectionFilter: WordBool; safecall;
    procedure SetApplySelectionFilter(state: WordBool); safecall;
    function NewDocument(const templateName: WideString; paperSize: Integer; Width: Double; 
                         height: Double): IDispatch; safecall;
    function INewDocument(const templateName: WideString; paperSize: Integer; Width: Double; 
                          height: Double): IModelDoc; safecall;
    function GetDocumentTemplate(mode: Integer; const templateName: WideString; paperSize: Integer; 
                                 Width: Double; height: Double): WideString; safecall;
    function IGetSelectionFiltersCount: Integer; safecall;
    function IGetSelectionFilters: Integer; safecall;
    procedure ISetSelectionFilters(count: Integer; var selType: Integer; state: WordBool); safecall;
    function GetCurrSolidWorksRegSubKey: WideString; safecall;
    procedure SolidWorksExplorer; safecall;
    function GetUserPreferenceStringValue(userPreference: Integer): WideString; safecall;
    function SetUserPreferenceStringValue(userPreference: Integer; const Value: WideString): WordBool; safecall;
    function GetCurrentMacroPathName: WideString; safecall;
    function GetOpenDocumentByName(const documentName: WideString): IDispatch; safecall;
    function IGetOpenDocumentByName(const documentName: WideString): IModelDoc; safecall;
    procedure GetCurrentKernelVersions(out version1: WideString; out version2: WideString; 
                                       out version3: WideString); safecall;
    function CreatePrunedModelArchive(const pathname: WideString; const zipPathName: WideString): WideString; safecall;
    function OpenDoc3(const fileName: WideString; type_: Integer; ReadOnly: WordBool; 
                      viewOnly: WordBool; RapidDraft: WordBool; silent: WordBool; 
                      var errors: Integer): IDispatch; safecall;
    function IOpenDoc3(const fileName: WideString; type_: Integer; ReadOnly: WordBool; 
                       viewOnly: WordBool; RapidDraft: WordBool; silent: WordBool; 
                       var errors: Integer): IModelDoc; safecall;
    function AddToolbar2(const moduleNameIn: WideString; const titleIn: WideString; 
                         smallBitmapHandleIn: Integer; largeBitmapHandleIn: Integer; 
                         menuPosIn: Integer; decTemplateTypeIn: Integer): Integer; safecall;
    function OpenModelConfiguration(const pathname: WideString; const configName: WideString): IDispatch; safecall;
    function GetToolbarDock(const ModuleIn: WideString; toolbarIDIn: Integer): Integer; safecall;
    procedure SetToolbarDock(const ModuleIn: WideString; toolbarIDIn: Integer; 
                             docStatePosIn: Integer); safecall;
    function GetMathUtility: IDispatch; safecall;
    function IGetMathUtility: IMathUtility; safecall;
    function OpenDoc4(const fileName: WideString; type_: Integer; options: Integer; 
                      const configuration: WideString; var errors: Integer): IDispatch; safecall;
    function IOpenDoc4(const fileName: WideString; type_: Integer; options: Integer; 
                       const configuration: WideString; var errors: Integer): IModelDoc; safecall;
    function IsRapidDraft(const fileName: WideString): WordBool; safecall;
    function GetTemplateSizes(const fileName: WideString): OleVariant; safecall;
    function IGetTemplateSizes(const fileName: WideString; out paperSize: Integer; 
                               out Width: Double; out height: Double): WordBool; safecall;
    function GetColorTable: IDispatch; safecall;
    function IGetColorTable: IColorTable; safecall;
    procedure SetMissingReferencePathName(const fileName: WideString); safecall;
    property ActiveDoc: IDispatch read Get_ActiveDoc;
    property IActiveDoc: IModelDoc read Get_IActiveDoc;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property UserControl: WordBool read Get_UserControl write Set_UserControl;
    property ActivePrinter: WideString read Get_ActivePrinter write Set_ActivePrinter;
  end;

// *********************************************************************//
// DispIntf:  ISldWorksDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D22-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISldWorksDisp = dispinterface
    ['{83A33D22-27C5-11CE-BFD4-00400513BB57}']
    property ActiveDoc: IDispatch readonly dispid 1;
    property IActiveDoc: IModelDoc readonly dispid 16;
    function OpenDoc(const Name: WideString; type_: Integer): IDispatch; dispid 2;
    function IOpenDoc(const Name: WideString; type_: Integer): IModelDoc; dispid 17;
    function ActivateDoc(const Name: WideString): IDispatch; dispid 3;
    function IActivateDoc(const Name: WideString): IModelDoc; dispid 18;
    procedure SendMsgToUser(const Message: WideString); dispid 4;
    function Frame: IDispatch; dispid 5;
    function IFrameObject: IFrame; dispid 19;
    procedure ExitApp; dispid 6;
    procedure CloseDoc(const Name: WideString); dispid 7;
    function NewPart: IDispatch; dispid 8;
    function INewPart: IPartDoc; dispid 20;
    function NewAssembly: IDispatch; dispid 9;
    function INewAssembly: IAssemblyDoc; dispid 21;
    function NewDrawing(templateToUse: Integer): IDispatch; dispid 10;
    function INewDrawing(templateToUse: Integer): IDrawingDoc; dispid 22;
    function DateCode: Integer; dispid 11;
    function RevisionNumber: WideString; dispid 12;
    function LoadFile(const fileName: WideString): WordBool; dispid 13;
    function AddFileOpenItem(const CallbackFcnAndModule: WideString; const Description: WideString): WordBool; dispid 14;
    function AddFileSaveAsItem(const CallbackFcnAndModule: WideString; 
                               const Description: WideString; type_: Integer): WordBool; dispid 15;
    procedure PreSelectDwgTemplateSize(templateToUse: Integer; const templateName: WideString); dispid 23;
    procedure DocumentVisible(Visible: WordBool; type_: Integer); dispid 24;
    function DefineAttribute(const Name: WideString): IDispatch; dispid 25;
    function IDefineAttribute(const Name: WideString): IAttributeDef; dispid 26;
    property Visible: WordBool dispid 27;
    property UserControl: WordBool dispid 28;
    procedure DisplayStatusBar(onOff: WordBool); dispid 29;
    procedure CreateNewWindow; dispid 30;
    procedure ArrangeIcons; dispid 31;
    procedure ArrangeWindows(Style: Integer); dispid 32;
    procedure QuitDoc(const Name: WideString); dispid 33;
    function GetModeler: IDispatch; dispid 34;
    function IGetModeler: IModeler; dispid 35;
    function GetEnvironment: IDispatch; dispid 36;
    function IGetEnvironment: IEnvironment; dispid 37;
    function NewDrawing2(templateToUse: Integer; const templateName: WideString; 
                         paperSize: Integer; Width: Double; height: Double): IDispatch; dispid 38;
    function INewDrawing2(templateToUse: Integer; const templateName: WideString; 
                          paperSize: Integer; Width: Double; height: Double): IDrawingDoc; dispid 39;
    function SetOptions(const Message: WideString): WordBool; dispid 40;
    function PreviewDoc(var hWnd: Integer; const FullName: WideString): WordBool; dispid 41;
    function GetSearchFolders(folderType: Integer): WideString; dispid 42;
    function SetSearchFolders(folderType: Integer; const folders: WideString): WordBool; dispid 43;
    function GetUserPreferenceToggle(userPreferenceToggle: Integer): WordBool; dispid 44;
    procedure SetUserPreferenceToggle(userPreferenceValue: Integer; onFlag: WordBool); dispid 45;
    function GetUserPreferenceDoubleValue(userPreferenceValue: Integer): Double; dispid 46;
    function SetUserPreferenceDoubleValue(userPreferenceValue: Integer; Value: Double): WordBool; dispid 47;
    property ActivePrinter: WideString dispid 48;
    function LoadFile2(const fileName: WideString; const ArgString: WideString): WordBool; dispid 49;
    function GetUserPreferenceIntegerValue(userPreferenceValue: Integer): Integer; dispid 50;
    function SetUserPreferenceIntegerValue(userPreferenceValue: Integer; Value: Integer): WordBool; dispid 51;
    function RemoveMenuPopupItem(DocType: Integer; SelectType: Integer; const Item: WideString; 
                                 const CallbackFcnAndModule: WideString; 
                                 const CustomNames: WideString; Unused: Integer): WordBool; dispid 52;
    function RemoveMenu(DocType: Integer; const MenuItemString: WideString; 
                        const CallbackFcnAndModule: WideString): WordBool; dispid 53;
    function RemoveFileOpenItem(const CallbackFcnAndModule: WideString; 
                                const Description: WideString): WordBool; dispid 54;
    function RemoveFileSaveAsItem(const CallbackFcnAndModule: WideString; 
                                  const Description: WideString; type_: Integer): WordBool; dispid 55;
    function ReplaceReferencedDocument(const referencingDocument: WideString; 
                                       const referencedDocument: WideString; 
                                       const newReference: WideString): WordBool; dispid 56;
    function AddMenuItem(DocType: Integer; const Menu: WideString; Postion: Integer; 
                         const CallbackModuleAndFcn: WideString): Integer; dispid 57;
    function AddMenuPopupItem(DocType: Integer; selType: Integer; const Item: WideString; 
                              const CallbackFcnAndModule: WideString; const CustomNames: WideString): Integer; dispid 58;
    function RemoveUserMenu(DocType: Integer; menuIdIn: Integer; const moduleName: WideString): WordBool; dispid 59;
    function AddToolbar(const moduleName: WideString; const title: WideString; 
                        smallBitmapHandle: Integer; largeBitmapHandle: Integer): Integer; dispid 60;
    function AddToolbarCommand(const moduleName: WideString; toolbarId: Integer; 
                               toolbarIndex: SYSINT; const commandString: WideString): WordBool; dispid 61;
    function ShowToolbar(const moduleName: WideString; toolbarId: Integer): WordBool; dispid 62;
    function HideToolbar(const moduleName: WideString; toolbarId: Integer): WordBool; dispid 63;
    function RemoveToolbar(const Module: WideString; toolbarId: Integer): WordBool; dispid 64;
    function GetToolbarState(const Module: WideString; toolbarId: Integer; toolbarState: Integer): WordBool; dispid 65;
    function GetUserPreferenceStringListValue(userPreference: Integer): WideString; dispid 66;
    procedure SetUserPreferenceStringListValue(userPreference: Integer; const Value: WideString); dispid 67;
    function EnableStereoDisplay(bEnable: WordBool): WordBool; dispid 68;
    function IEnableStereoDisplay(bEnable: WordBool): WordBool; dispid 69;
    function GetDocumentDependencies(const document: WideString; traverseflag: Integer; 
                                     searchflag: Integer): OleVariant; dispid 70;
    function IGetDocumentDependencies(const document: WideString; traverseflag: Integer; 
                                      searchflag: Integer): WideString; dispid 71;
    function GetDocumentDependenciesCount(const document: WideString; traverseflag: Integer; 
                                          searchflag: Integer): Integer; dispid 72;
    function OpenDocSilent(const fileName: WideString; type_: Integer; var errors: Integer): IDispatch; dispid 73;
    function IOpenDocSilent(const fileName: WideString; type_: Integer; var errors: Integer): IModelDoc; dispid 74;
    function CallBack(const callBackFunc: WideString; defaultRetVal: Integer; 
                      const callBackArgs: WideString): Integer; dispid 75;
    function SendMsgToUser2(const Message: WideString; icon: Integer; buttons: Integer): Integer; dispid 76;
    function EnumDocuments: IEnumDocuments; dispid 77;
    function LoadAddIn(const fileName: WideString): Integer; dispid 78;
    function UnloadAddIn(const fileName: WideString): Integer; dispid 79;
    function RecordLine(const text: WideString): WordBool; dispid 80;
    function VersionHistory(const fileName: WideString): OleVariant; dispid 81;
    function IVersionHistory(const fileName: WideString): WideString; dispid 82;
    function IGetVersionHistoryCount(const fileName: WideString): SYSINT; dispid 83;
    function AllowFailedFeatureCreation(yesNo: WordBool): WordBool; dispid 84;
    function GetFirstDocument: IDispatch; dispid 85;
    function GetCurrentWorkingDirectory: WideString; dispid 86;
    function SetCurrentWorkingDirectory(const currentWorkingDirectory: WideString): WordBool; dispid 87;
    function GetDataFolder(bShowErrorMsg: WordBool): WideString; dispid 88;
    function GetSelectionFilter(selType: Integer): WordBool; dispid 89;
    procedure SetSelectionFilter(selType: Integer; state: WordBool); dispid 90;
    function ActivateDoc2(const Name: WideString; silent: WordBool; var errors: Integer): IDispatch; dispid 91;
    function IActivateDoc2(const Name: WideString; silent: WordBool; var errors: Integer): IModelDoc; dispid 92;
    function GetMouseDragMode(command: Integer): WordBool; dispid 93;
    function GetCurrentLanguage: WideString; dispid 94;
    function IGetFirstDocument: IModelDoc; dispid 95;
    function SanityCheck(swItemToCheck: Integer; var P1: Integer; var P2: Integer): WordBool; dispid 96;
    function AddMenu(DocType: Integer; const Menu: WideString; position: Integer): Integer; dispid 97;
    function CheckpointConvertedDocument(const docName: WideString): Integer; dispid 98;
    function OpenDoc2(const fileName: WideString; type_: Integer; ReadOnly: WordBool; 
                      viewOnly: WordBool; silent: WordBool; var errors: Integer): IDispatch; dispid 99;
    function IOpenDoc2(const fileName: WideString; type_: Integer; ReadOnly: WordBool; 
                       viewOnly: WordBool; silent: WordBool; var errors: Integer): IModelDoc; dispid 100;
    function GetMassProperties(const filePathName: WideString; const configurationName: WideString): OleVariant; dispid 101;
    function IGetMassProperties(const filePathName: WideString; 
                                const configurationName: WideString; var mPropsData: Double): WordBool; dispid 102;
    function GetLocalizedMenuName(menuId: Integer): WideString; dispid 103;
    function GetDocumentDependencies2(const document: WideString; traverseflag: WordBool; 
                                      searchflag: WordBool; addReadOnlyInfo: WordBool): OleVariant; dispid 104;
    function IGetDocumentDependencies2(const document: WideString; traverseflag: WordBool; 
                                       searchflag: WordBool; addReadOnlyInfo: WordBool): WideString; dispid 105;
    function IGetDocumentDependenciesCount2(const document: WideString; traverseflag: WordBool; 
                                            searchflag: WordBool; addReadOnlyInfo: WordBool): Integer; dispid 106;
    function GetSelectionFilters: OleVariant; dispid 107;
    procedure SetSelectionFilters(selType: OleVariant; state: WordBool); dispid 108;
    function GetApplySelectionFilter: WordBool; dispid 109;
    procedure SetApplySelectionFilter(state: WordBool); dispid 110;
    function NewDocument(const templateName: WideString; paperSize: Integer; Width: Double; 
                         height: Double): IDispatch; dispid 111;
    function INewDocument(const templateName: WideString; paperSize: Integer; Width: Double; 
                          height: Double): IModelDoc; dispid 112;
    function GetDocumentTemplate(mode: Integer; const templateName: WideString; paperSize: Integer; 
                                 Width: Double; height: Double): WideString; dispid 113;
    function IGetSelectionFiltersCount: Integer; dispid 114;
    function IGetSelectionFilters: Integer; dispid 115;
    procedure ISetSelectionFilters(count: Integer; var selType: Integer; state: WordBool); dispid 116;
    function GetCurrSolidWorksRegSubKey: WideString; dispid 117;
    procedure SolidWorksExplorer; dispid 118;
    function GetUserPreferenceStringValue(userPreference: Integer): WideString; dispid 119;
    function SetUserPreferenceStringValue(userPreference: Integer; const Value: WideString): WordBool; dispid 120;
    function GetCurrentMacroPathName: WideString; dispid 121;
    function GetOpenDocumentByName(const documentName: WideString): IDispatch; dispid 122;
    function IGetOpenDocumentByName(const documentName: WideString): IModelDoc; dispid 123;
    procedure GetCurrentKernelVersions(out version1: WideString; out version2: WideString; 
                                       out version3: WideString); dispid 124;
    function CreatePrunedModelArchive(const pathname: WideString; const zipPathName: WideString): WideString; dispid 125;
    function OpenDoc3(const fileName: WideString; type_: Integer; ReadOnly: WordBool; 
                      viewOnly: WordBool; RapidDraft: WordBool; silent: WordBool; 
                      var errors: Integer): IDispatch; dispid 126;
    function IOpenDoc3(const fileName: WideString; type_: Integer; ReadOnly: WordBool; 
                       viewOnly: WordBool; RapidDraft: WordBool; silent: WordBool; 
                       var errors: Integer): IModelDoc; dispid 127;
    function AddToolbar2(const moduleNameIn: WideString; const titleIn: WideString; 
                         smallBitmapHandleIn: Integer; largeBitmapHandleIn: Integer; 
                         menuPosIn: Integer; decTemplateTypeIn: Integer): Integer; dispid 128;
    function OpenModelConfiguration(const pathname: WideString; const configName: WideString): IDispatch; dispid 129;
    function GetToolbarDock(const ModuleIn: WideString; toolbarIDIn: Integer): Integer; dispid 130;
    procedure SetToolbarDock(const ModuleIn: WideString; toolbarIDIn: Integer; 
                             docStatePosIn: Integer); dispid 131;
    function GetMathUtility: IDispatch; dispid 132;
    function IGetMathUtility: IMathUtility; dispid 133;
    function OpenDoc4(const fileName: WideString; type_: Integer; options: Integer; 
                      const configuration: WideString; var errors: Integer): IDispatch; dispid 134;
    function IOpenDoc4(const fileName: WideString; type_: Integer; options: Integer; 
                       const configuration: WideString; var errors: Integer): IModelDoc; dispid 135;
    function IsRapidDraft(const fileName: WideString): WordBool; dispid 136;
    function GetTemplateSizes(const fileName: WideString): OleVariant; dispid 137;
    function IGetTemplateSizes(const fileName: WideString; out paperSize: Integer; 
                               out Width: Double; out height: Double): WordBool; dispid 138;
    function GetColorTable: IDispatch; dispid 139;
    function IGetColorTable: IColorTable; dispid 140;
    procedure SetMissingReferencePathName(const fileName: WideString); dispid 141;
  end;

// *********************************************************************//
// Interface: IModelDoc
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D46-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IModelDoc = interface(IDispatch)
    ['{83A33D46-27C5-11CE-BFD4-00400513BB57}']
    function Get_SelectionManager: IDispatch; safecall;
    function Get_ISelectionManager: ISelectionMgr; safecall;
    procedure Set_SelectionManager(const retval: IDispatch); safecall;
    function Get_ActiveView: IDispatch; safecall;
    function Get_IActiveView: IModelView; safecall;
    procedure Set_ActiveView(const retval: IDispatch); safecall;
    function Get_LengthUnit: Integer; safecall;
    procedure Set_LengthUnit(retval: Integer); safecall;
    function Get_LightSourceUserName(Id: Integer): WideString; safecall;
    procedure Set_LightSourceUserName(Id: Integer; const retval: WideString); safecall;
    function Get_LightSourcePropertyValues(Id: Integer): OleVariant; safecall;
    procedure Set_LightSourcePropertyValues(Id: Integer; retval: OleVariant); safecall;
    function Get_SceneName: WideString; safecall;
    procedure Set_SceneName(const retval: WideString); safecall;
    function Get_SceneUserName: WideString; safecall;
    procedure Set_SceneUserName(const retval: WideString); safecall;
    procedure FeatureFillet(r1: Double; propagate: WordBool; ftyp: WordBool; varRadTyp: WordBool; 
                            overFlowType: Integer); safecall;
    procedure GridOptions(dispGrid: WordBool; gridSpacing: Double; snap: WordBool; 
                          dotStyle: WordBool; nMajor: Smallint; nMinor: Smallint; 
                          align2edge: WordBool; angleSnap: WordBool; angleUnit: Double; 
                          minorAuto: WordBool); safecall;
    procedure SetUnits(uType: Smallint; fractBase: Smallint; fractDenom: Smallint; 
                       sigDigits: Smallint; roundToFraction: WordBool); safecall;
    procedure LBDownAt(flags: Integer; x: Double; y: Double; z: Double); safecall;
    procedure LBUpAt(flags: Integer; x: Double; y: Double; z: Double); safecall;
    procedure DragTo(flags: Integer; x: Double; y: Double; z: Double); safecall;
    procedure SelectAt(flags: Integer; x: Double; y: Double; z: Double); safecall;
    procedure CreateLineVB(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; z2: Double); safecall;
    function CreateLine(P1: OleVariant; P2: OleVariant): WordBool; safecall;
    procedure CreateCenterLineVB(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; 
                                 z2: Double); safecall;
    function CreateCenterLine(P1: OleVariant; P2: OleVariant): WordBool; safecall;
    procedure CreateArcVB(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                          p2z: Double; p3x: Double; p3y: Double; p3z: Double; dir: Smallint); safecall;
    function CreateArc(P1: OleVariant; P2: OleVariant; P3: OleVariant; dir: Smallint): WordBool; safecall;
    procedure CreateCircleVB(p1x: Double; p1y: Double; p1z: Double; radius: Double); safecall;
    function CreateCircleByRadius(P1: OleVariant; radius: Double): WordBool; safecall;
    function GetLines: OleVariant; safecall;
    procedure SketchTrim(op: Integer; selEnd: Integer; x: Double; y: Double); safecall;
    procedure SketchOffsetEdges(val: Double); safecall;
    procedure SketchRectangle(val1: Double; val2: Double; z1: Double; val3: Double; val4: Double; 
                              z2: Double; val5: WordBool); safecall;
    procedure SketchPoint(x: Double; y: Double; z: Double); safecall;
    procedure FeatureCut(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                         d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; ddir1: WordBool; 
                         ddir2: WordBool; dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                         offsetReverse2: WordBool); safecall;
    procedure FeatureBoss(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                          d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool); safecall;
    procedure SimpleHole(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                         d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; ddir1: WordBool; 
                         ddir2: WordBool; dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                         offsetReverse2: WordBool); safecall;
    procedure FeatureLinearPattern(num1: Integer; spacing1: Double; num2: Integer; 
                                   spacing2: Double; flipDir1: WordBool; flipDir2: WordBool; 
                                   const dName1: WideString; const dName2: WideString); safecall;
    procedure NameView(const vName: WideString); safecall;
    procedure ShowNamedView(const vName: WideString); safecall;
    procedure CreatePlaneAtOffset(val: Double; flipDir: WordBool); safecall;
    procedure Toolbars(m: WordBool; vw: WordBool; skMain: WordBool; sk: WordBool; feat: WordBool; 
                       constr: WordBool; macro: WordBool); safecall;
    procedure CreatePlaneAtAngle(val: Double; flipDir: WordBool); safecall;
    procedure SetParamValue(val: Double); safecall;
    procedure AddRelation(const relStr: WideString); safecall;
    procedure DeleteAllRelations; safecall;
    procedure HoleWizard(depth: Double; endType: Smallint; flip: WordBool; dir: WordBool; 
                         hType: Integer; d1: Double; d2: Double; d3: Double; d4: Double; 
                         d5: Double; d6: Double; d7: Double; d8: Double; d9: Double; d10: Double; 
                         d11: Double; d12: Double); safecall;
    function SaveAs(const newName: WideString): WordBool; safecall;
    procedure ActivateSelectedFeature; safecall;
    procedure SelectByName(flags: Integer; const idStr: WideString); safecall;
    procedure SketchAddConstraints(const idStr: WideString); safecall;
    procedure SketchConstraintsDel(constrInd: Integer; const idStr: WideString); safecall;
    procedure SketchConstraintsDelAll; safecall;
    procedure Lock; safecall;
    procedure UnLock; safecall;
    procedure InsertFeatureShell(thickness: Double; outward: WordBool); safecall;
    procedure SketchFillet(rad: Double); safecall;
    procedure FeatureChamfer(Width: Double; angle: Double; flip: WordBool); safecall;
    procedure InsertMfDraft(angle: Double; flipDir: WordBool; isEdgeDraft: WordBool; 
                            propType: Integer); safecall;
    procedure ParentChildRelationship; safecall;
    procedure SketchSpline(morePts: Integer; x: Double; y: Double; z: Double); safecall;
    procedure SelectSketchPoint(x: Double; y: Double; incidence: Integer); safecall;
    procedure SelectSketchLine(x0: Double; y0: Double; inc0: Integer; x1: Double; y1: Double; 
                               inc1: Integer); safecall;
    procedure SelectSketchArc(x0: Double; y0: Double; inc0: Integer; x1: Double; y1: Double; 
                              inc1: Integer; xC: Double; yC: Double; incC: Integer; rotDir: Integer); safecall;
    procedure SelectSketchSpline(size: Integer; x0: Double; y0: Double; inc0: Integer; x1: Double; 
                                 y1: Double; inc1: Integer; xC: Double; yC: Double; incC: Integer); safecall;
    function CreateTangentArc(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                              p2z: Double): WordBool; safecall;
    function Create3PointArc(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                             p2z: Double; p3x: Double; p3y: Double; p3z: Double): WordBool; safecall;
    function CreateArcByCenter(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                               p2z: Double; p3x: Double; p3y: Double; p3z: Double): WordBool; safecall;
    function CreateCircle(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                          p2z: Double): WordBool; safecall;
    function AddDimension(x: Double; y: Double; z: Double): WordBool; safecall;
    function AddHorizontalDimension(x: Double; y: Double; z: Double): WordBool; safecall;
    function AddVerticalDimension(x: Double; y: Double; z: Double): WordBool; safecall;
    function SelectSketchItem(selOpt: Integer; const Name: WideString; x: Double; y: Double; 
                              z: Double): WordBool; safecall;
    procedure ClearSelection; safecall;
    procedure Select(const selID: WideString; const selParams: WideString; x: Double; y: Double; 
                     z: Double); safecall;
    procedure AndSelect(const selID: WideString; const selParams: WideString; x: Double; y: Double; 
                        z: Double); safecall;
    function CreatePoint(pointX: Double; pointY: Double; pointZ: Double): WordBool; safecall;
    function CreateLineDB(sx: Double; sy: Double; sz: Double; ex: Double; ey: Double; ez: Double): WordBool; safecall;
    function CreateArcDB(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; z2: Double; 
                         x3: Double; y3: Double; z3: Double; dir: Smallint): WordBool; safecall;
    function CreateCircleDB(cx: Double; cy: Double; cz: Double; radius: Double): WordBool; safecall;
    function CreatePointDB(x: Double; y: Double; z: Double): WordBool; safecall;
    function GetTitle: WideString; safecall;
    function GetPathName: WideString; safecall;
    function GetType: Integer; safecall;
    procedure InsertObject; safecall;
    procedure EditClearAll; safecall;
    procedure EditCopy; safecall;
    procedure EditCut; safecall;
    procedure ObjectDisplayContent; safecall;
    procedure ObjectDisplayAsIcon; safecall;
    procedure ObjectResetsize; safecall;
    procedure WindowRedraw; safecall;
    procedure Dummy3; safecall;
    procedure SetPickMode; safecall;
    procedure ViewRotateminusx; safecall;
    procedure ViewRotateminusy; safecall;
    procedure ViewRotateminusz; safecall;
    procedure ViewRotateplusx; safecall;
    procedure ViewRotateplusy; safecall;
    procedure ViewRotateplusz; safecall;
    procedure ViewTranslateminusx; safecall;
    procedure ViewTranslateminusy; safecall;
    procedure ViewTranslateplusx; safecall;
    procedure ViewTranslateplusy; safecall;
    procedure ViewRotXMinusNinety; safecall;
    procedure ViewRotYMinusNinety; safecall;
    procedure ViewRotYPlusNinety; safecall;
    procedure ViewZoomin; safecall;
    procedure ViewZoomout; safecall;
    procedure ViewDisplayHiddenremoved; safecall;
    procedure ViewDisplayWireframe; safecall;
    procedure ViewDisplayShaded; safecall;
    procedure ViewRwShading; safecall;
    procedure ViewOglShading; safecall;
    procedure ViewZoomtofit; safecall;
    procedure ViewRotate; safecall;
    procedure ViewTranslate; safecall;
    procedure ViewZoomto; safecall;
    procedure ViewDisplayHiddengreyed; safecall;
    procedure ViewDisplayFaceted; safecall;
    procedure ViewConstraint; safecall;
    procedure UserFavors; safecall;
    procedure FeatureCirPattern(num: Integer; spacing: Double; flipDir: WordBool; 
                                const dName: WideString); safecall;
    procedure EditSketch; safecall;
    procedure FeatEdit; safecall;
    procedure FeatEditDef; safecall;
    procedure InsertPoint; safecall;
    procedure InsertFamilyTableNew; safecall;
    procedure Dummy1; safecall;
    procedure InsertFamilyTableEdit; safecall;
    procedure Dummy2; safecall;
    procedure ToolsMacro; safecall;
    procedure ToolsGrid; safecall;
    procedure SketchCenterline; safecall;
    procedure SketchAlign; safecall;
    procedure SketchArc; safecall;
    procedure SketchTangentArc; safecall;
    procedure SketchCircle; safecall;
    procedure SketchUndo; safecall;
    procedure UserPreferences; safecall;
    procedure Lights; safecall;
    procedure SketchConstrainCoincident; safecall;
    procedure SketchConstrainConcentric; safecall;
    procedure SketchConstrainPerp; safecall;
    procedure SketchConstrainTangent; safecall;
    procedure SketchConstrainParallel; safecall;
    procedure SketchUseEdge; safecall;
    procedure SketchUseEdgeCtrline; safecall;
    procedure SketchMirror; safecall;
    procedure Save; safecall;
    procedure Close; safecall;
    procedure ViewDispRefaxes; safecall;
    procedure ViewDispRefplanes; safecall;
    procedure InsertSketch; safecall;
    procedure InsertProtrusionSwept(propagate: WordBool; alignment: WordBool; 
                                    keepNormalConstant: WordBool); safecall;
    procedure InsertProtrusionBlend(closed: WordBool); safecall;
    procedure ToolsMassProps; safecall;
    procedure PropertySheet; safecall;
    procedure BlankRefGeom; safecall;
    procedure UnBlankRefGeom; safecall;
    procedure EditDelete; safecall;
    procedure InsertProjectedSketch; safecall;
    function CreatePlaneFixed(P1: OleVariant; P2: OleVariant; P3: OleVariant; useGlobal: WordBool): WordBool; safecall;
    procedure Dummy5; safecall;
    procedure Dummy6; safecall;
    procedure DebugCheckBody; safecall;
    procedure Dummy8; safecall;
    procedure DimPreferences; safecall;
    procedure UnblankSketch; safecall;
    procedure EditSketchOrSingleSketchFeature; safecall;
    procedure DebugCheckIgesGeom; safecall;
    procedure BlankSketch; safecall;
    function GetDefaultTextHeight: Double; safecall;
    function IsActive(const compStr: WideString): WordBool; safecall;
    function CreateEllipse(center: OleVariant; major: OleVariant; minor: OleVariant): WordBool; safecall;
    function CreateEllipseVB(centerX: Double; centerY: Double; centerZ: Double; majorX: Double; 
                             majorY: Double; majorZ: Double; minorX: Double; minorY: Double; 
                             minorZ: Double): WordBool; safecall;
    function CreateEllipticalArcByCenter(center: OleVariant; major: OleVariant; minor: OleVariant; 
                                         start: OleVariant; end_: OleVariant): WordBool; safecall;
    function CreateEllipticalArcByCenterVB(centerX: Double; centerY: Double; centerZ: Double; 
                                           majorX: Double; majorY: Double; majorZ: Double; 
                                           minorX: Double; minorY: Double; minorZ: Double; 
                                           startX: Double; startY: Double; startZ: Double; 
                                           endX: Double; endY: Double; endZ: Double): WordBool; safecall;
    function GetActiveSketch: IDispatch; safecall;
    function IGetActiveSketch: ISketch; safecall;
    function GetTessellationQuality: Integer; safecall;
    procedure SetTessellationQuality(qualityNum: Integer); safecall;
    function Parameter(const stringIn: WideString): IDispatch; safecall;
    function IParameter(const stringIn: WideString): IDimension; safecall;
    function SelectByID(const selID: WideString; const selParams: WideString; x: Double; y: Double; 
                        z: Double): WordBool; safecall;
    function AndSelectByID(const selID: WideString; const selParams: WideString; x: Double; 
                           y: Double; z: Double): WordBool; safecall;
    procedure Insert3DSketch; safecall;
    function GetLightSourceName(Id: Integer): WideString; safecall;
    function AddLightSource(const idName: WideString; lTyp: SYSINT; const userName: WideString): WordBool; safecall;
    function AddLightSourceExtProperty(Id: Integer; PropertyExtension: OleVariant): Integer; safecall;
    procedure ResetLightSourceExtProperty(Id: Integer); safecall;
    procedure DeleteLightSource(Id: Integer); safecall;
    function GetLightSourceExtProperty(Id: Integer; PropertyId: Integer): OleVariant; safecall;
    function AddLightToScene(const lpszNewValue: WideString): Integer; safecall;
    function AddSceneExtProperty(PropertyExtension: OleVariant): Integer; safecall;
    procedure ResetSceneExtProperty; safecall;
    function GetSceneExtProperty(PropertyId: Integer): OleVariant; safecall;
    procedure FileSummaryInfo; safecall;
    function GetGridSettings: OleVariant; safecall;
    procedure ToolsSketchTranslate; safecall;
    procedure ToolsDistance; safecall;
    procedure SkToolsAutoConstr; safecall;
    procedure ToolsSketchScale; safecall;
    procedure Paste; safecall;
    procedure ToolsConfiguration; safecall;
    procedure EntityProperties; safecall;
    function GetArcCentersDisplayed: WordBool; safecall;
    procedure SetArcCentersDisplayed(setting: WordBool); safecall;
    procedure AutoSolveToggle; safecall;
    procedure Dummy7; safecall;
    function IGetLines: Double; safecall;
    function GetLineCount: Integer; safecall;
    procedure ICreateEllipse(var center: Double; var major: Double; var minor: Double); safecall;
    procedure ICreateEllipticalArcByCenter(var center: Double; var major: Double; 
                                           var minor: Double; var start: Double; var end_: Double); safecall;
    function Get_ILightSourcePropertyValues(Id: Integer): Double; safecall;
    procedure Set_ILightSourcePropertyValues(Id: Integer; var retval: Double); safecall;
    procedure InsertCutSwept(propagate: WordBool; alignment: WordBool; keepNormalConstant: WordBool); safecall;
    procedure InsertCutBlend(closed: WordBool); safecall;
    procedure InsertHelix(reversed: WordBool; clockwised: WordBool; tapered: WordBool; 
                          outward: WordBool; helixdef: Integer; height: Double; pitch: Double; 
                          revolution: Double; taperangle: Double; startangle: Double); safecall;
    procedure ICreateLine(var P1: Double; var P2: Double); safecall;
    procedure ICreateCenterLine(var P1: Double; var P2: Double); safecall;
    procedure ICreateArc(var P1: Double; var P2: Double; var P3: Double; dir: Smallint); safecall;
    procedure ICreateCircleByRadius(var P1: Double; radius: Double); safecall;
    procedure GraphicsRedraw; safecall;
    function GetVisibilityOfConstructPlanes: WordBool; safecall;
    function GetDisplayWhenAdded: WordBool; safecall;
    procedure SetDisplayWhenAdded(setting: WordBool); safecall;
    function GetAddToDB: WordBool; safecall;
    procedure SetAddToDB(setting: WordBool); safecall;
    function DeSelectByID(const selID: WideString; const selParams: WideString; x: Double; 
                          y: Double; z: Double): WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(retval: WordBool); safecall;
    procedure PrintDirect; safecall;
    procedure PrintPreview; safecall;
    procedure Quit; safecall;
    procedure CreatePlaneThru3Points; safecall;
    procedure ViewRotXPlusNinety; safecall;
    function GetUnits: OleVariant; safecall;
    procedure SetAngularUnits(uType: Smallint; fractBase: Smallint; fractDenom: Smallint; 
                              sigDigits: Smallint); safecall;
    function GetAngularUnits: OleVariant; safecall;
    function IGetUnits: Smallint; safecall;
    procedure ISetAngularUnits(uType: Smallint; fractBase: Smallint; fractDenom: Smallint; 
                               sigDigits: Smallint); safecall;
    function IGetAngularUnits: Smallint; safecall;
    procedure ShowConfiguration(const configurationName: WideString); safecall;
    procedure ResetConfiguration; safecall;
    procedure AddConfiguration(const Name: WideString; const comment: WideString; 
                               const alternateName: WideString; suppressByDefault: WordBool; 
                               hideByDefault: WordBool; minFeatureManager: WordBool; 
                               inheritProperties: WordBool; flags: UINT); safecall;
    procedure DeleteConfiguration(const configurationName: WideString); safecall;
    procedure EditConfiguration(const Name: WideString; const newName: WideString; 
                                const comment: WideString; const alternateName: WideString; 
                                suppressByDefault: WordBool; hideByDefault: WordBool; 
                                minFeatureManager: WordBool; inheritProperties: WordBool; 
                                flags: UINT); safecall;
    procedure CreatePlanePerCurveAndPassPoint(origAtCurve: WordBool); safecall;
    function CreateFeatureMgrView(var bitmap: Integer): IDispatch; safecall;
    function AddFeatureMgrView(var bitmap: Integer; var appView: Integer): WordBool; safecall;
    function GetStandardViewRotation(viewId: Integer): OleVariant; safecall;
    function IGetStandardViewRotation(viewId: Integer): Double; safecall;
    procedure FeatureExtruRefSurface(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                                     t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                                     dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; 
                                     dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                                     offsetReverse2: WordBool); safecall;
    function IGet3rdPartyStorage(const stringIn: WideString; isStoring: WordBool): IUnknown; safecall;
    procedure DeleteFeatureMgrView(var appView: Integer); safecall;
    function GetMassProperties: OleVariant; safecall;
    function IGetMassProperties(var mPropsData: Double): WordBool; safecall;
    function GetLightSourceCount: Integer; safecall;
    function GetLightSourceIdFromName(const lightName: WideString): Integer; safecall;
    procedure SetNextSelectionGroupId(Id: Integer); safecall;
    procedure ISetNextSelectionGroupId(Id: Integer); safecall;
    function InsertMidSurfaceExt(placement: Double; knitFlag: WordBool): IDispatch; safecall;
    function IInsertMidSurfaceExt(placement: Double; knitFlag: WordBool): IMidSurface; safecall;
    procedure ICreatePlaneFixed(var P1: Double; var P2: Double; var P3: Double; useGlobal: WordBool); safecall;
    function SelectByMark(const selID: WideString; const selParams: WideString; x: Double; 
                          y: Double; z: Double; mark: Integer): WordBool; safecall;
    function AndSelectByMark(const selID: WideString; const selParams: WideString; x: Double; 
                             y: Double; z: Double; mark: Integer): WordBool; safecall;
    function GetDependencies(traverseflag: Integer; searchflag: Integer): OleVariant; safecall;
    function IGetDependencies(traverseflag: Integer; searchflag: Integer): WideString; safecall;
    function GetNumDependencies(traverseflag: Integer; searchflag: Integer): Integer; safecall;
    function IGetNumDependencies(traverseflag: Integer; searchflag: Integer): Integer; safecall;
    function FirstFeature: IDispatch; safecall;
    function IFirstFeature: IFeature; safecall;
    procedure UnderiveSketch; safecall;
    procedure DeriveSketch; safecall;
    function IsExploded: WordBool; safecall;
    function DeleteSelection(confirmFlag: WordBool): WordBool; safecall;
    function DeleteNamedView(const viewname: WideString): WordBool; safecall;
    function SetLightSourceName(Id: Integer; const newName: WideString): WordBool; safecall;
    procedure Insert3DSplineCurve(curveClosed: WordBool); safecall;
    function SetLightSourcePropertyValuesVB(const idName: WideString; lType: SYSINT; diff: Double; 
                                            rgbColor: Integer; dist: Double; dirX: Double; 
                                            dirY: Double; dirZ: Double; spotDirX: Double; 
                                            spotDirY: Double; spotDirZ: Double; spotAngle: Double; 
                                            fallOff0: Double; fallOff1: Double; fallOff2: Double; 
                                            ambient: Double; specular: Double; 
                                            spotExponent: Double; bDisable: WordBool): WordBool; safecall;
    function ICreateFeatureMgrView(var bitmap: Integer): IFeatMgrView; safecall;
    function SelectedEdgeProperties(const edgeName: WideString): WordBool; safecall;
    function SelectedFaceProperties(rgbColor: Integer; ambient: Double; diffuse: Double; 
                                    specular: Double; shininess: Double; transparency: Double; 
                                    emission: Double; usePartProps: WordBool; 
                                    const faceName: WideString): WordBool; safecall;
    function SelectedFeatureProperties(rgbColor: Integer; ambient: Double; diffuse: Double; 
                                       specular: Double; shininess: Double; transparency: Double; 
                                       emission: Double; usePartProps: WordBool; 
                                       suppressed: WordBool; const featureName: WideString): WordBool; safecall;
    procedure InsertSplitLineSil; safecall;
    procedure InsertSplitLineProject(isDirectional: WordBool; flipDir: WordBool); safecall;
    procedure InsertRib(is2Sided: WordBool; reverseThicknessDir: WordBool; thickness: Double; 
                        referenceEdgeIndex: Integer; reverseMaterialDir: WordBool; 
                        isDrafted: WordBool; draftOutward: WordBool; draftAngle: Double); safecall;
    function AddRadialDimension(x: Double; y: Double; z: Double): WordBool; safecall;
    function AddDiameterDimension(x: Double; y: Double; z: Double): WordBool; safecall;
    function GetModelViewNames: OleVariant; safecall;
    function IGetModelViewNames: WideString; safecall;
    function GetModelViewCount: SYSINT; safecall;
    function GetUserPreferenceDoubleValue(userPreferenceValue: Integer): Double; safecall;
    function SetUserPreferenceDoubleValue(userPreferenceValue: Integer; Value: Double): WordBool; safecall;
    procedure ViewDisplayCurvature; safecall;
    procedure Scale; safecall;
    procedure AddIns; safecall;
    function InsertCurveFile(const fileName: WideString): WordBool; safecall;
    procedure InsertCurveFileBegin; safecall;
    function InsertCurveFilePoint(x: Double; y: Double; z: Double): WordBool; safecall;
    function InsertCurveFileEnd: WordBool; safecall;
    function ChangeSketchPlane: WordBool; safecall;
    procedure ViewOrientationUndo; safecall;
    procedure PrintOut(fromPage: Integer; toPage: Integer; numCopies: Integer; collate: WordBool; 
                       const printer: WideString; Scale: Double; printToFile: WordBool); safecall;
    procedure SketchOffsetEntities(offset: Double; flip: WordBool); safecall;
    procedure InsertLibraryFeature(const libFeatPartNameIn: WideString); safecall;
    procedure SketchModifyTranslate(startX: Double; startY: Double; endX: Double; endY: Double); safecall;
    procedure SketchModifyRotate(centerX: Double; centerY: Double; angle: Double); safecall;
    procedure SketchModifyFlip(axisFlag: SYSINT); safecall;
    function SketchModifyScale(scaleFactor: Double): WordBool; safecall;
    function GetActiveConfiguration: IDispatch; safecall;
    function IGetActiveConfiguration: IConfiguration; safecall;
    function GetUserPreferenceToggle(userPreferenceToggle: Integer): WordBool; safecall;
    function SetUserPreferenceToggle(userPreferenceValue: Integer; onFlag: WordBool): WordBool; safecall;
    procedure InsertSweepRefSurface(propagate: WordBool; twistCtrlOption: Smallint; 
                                    keepTangency: WordBool; forceNonRational: WordBool); safecall;
    procedure InsertLoftRefSurface(closed: WordBool; keepTangency: WordBool; 
                                   forceNonRational: WordBool); safecall;
    procedure InsertProtrusionSwept2(propagate: WordBool; alignment: WordBool; 
                                     twistCtrlOption: Smallint; keepTangency: WordBool; 
                                     forceNonRational: WordBool); safecall;
    procedure InsertProtrusionBlend2(closed: WordBool; keepTangency: WordBool; 
                                     forceNonRational: WordBool); safecall;
    procedure InsertCutSwept2(propagate: WordBool; alignment: WordBool; twistCtrlOption: Smallint; 
                              keepTangency: WordBool; forceNonRational: WordBool); safecall;
    procedure InsertCutBlend2(closed: WordBool; keepTangency: WordBool; forceNonRational: WordBool); safecall;
    function IsEditingSelf: WordBool; safecall;
    procedure ShowNamedView2(const vName: WideString; viewId: Integer); safecall;
    procedure InsertDome(height: Double; reverseDir: WordBool; doEllipticSurface: WordBool); safecall;
    function Get_MaterialUserName: WideString; safecall;
    procedure Set_MaterialUserName(const retval: WideString); safecall;
    function Get_MaterialIdName: WideString; safecall;
    procedure Set_MaterialIdName(const retval: WideString); safecall;
    function Get_MaterialPropertyValues: OleVariant; safecall;
    procedure Set_MaterialPropertyValues(retval: OleVariant); safecall;
    function Get_IMaterialPropertyValues: Double; safecall;
    procedure Set_IMaterialPropertyValues(var retval: Double); safecall;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; safecall;
    function GetPropertyExtension(Id: Integer): OleVariant; safecall;
    procedure ResetPropertyExtension; safecall;
    function GetUpdateStamp: Integer; safecall;
    procedure ViewZoomTo2(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; z2: Double); safecall;
    procedure ScreenRotate; safecall;
    function Get_PrintSetup(setupType: Integer): Smallint; safecall;
    procedure Set_PrintSetup(setupType: Integer; setupValue: Smallint); safecall;
    procedure GraphicsRedraw2; safecall;
    procedure InsertCosmeticThread(type_: Smallint; depth: Double; length: Double; 
                                   const note: WideString); safecall;
    procedure HideCosmeticThread; safecall;
    procedure ShowCosmeticThread; safecall;
    procedure SimpleHole2(dia: Double; sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                          t2: Integer; d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool); safecall;
    procedure IRelease3rdPartyStorage(const stringIn: WideString); safecall;
    function FeatureRevolve2(angle: Double; reverseDir: WordBool; angle2: Double; revType: Integer; 
                             options: Integer): Integer; safecall;
    function FeatureRevolveCut2(angle: Double; reverseDir: WordBool; angle2: Double; 
                                revType: Integer; options: Integer): Integer; safecall;
    procedure SetSaveFlag; safecall;
    function GetExternalReferenceName: WideString; safecall;
    function SelectByRay(doubleInfoIn: OleVariant; typeWanted: Integer): WordBool; safecall;
    function ISelectByRay(var pointIn: Double; var vectorIn: Double; radiusIn: Double; 
                          typeWanted: Integer): WordBool; safecall;
    procedure SetSceneBkgDIB(l_dib: Integer); safecall;
    function Get_SceneBkgImageFileName: WideString; safecall;
    procedure Set_SceneBkgImageFileName(const retval: WideString); safecall;
    procedure InsertBkgImage(const newName: WideString); safecall;
    procedure DeleteBkgImage; safecall;
    procedure InsertSplinePoint(x: Double; y: Double; z: Double); safecall;
    procedure InsertLoftRefSurface2(closed: WordBool; keepTangency: WordBool; 
                                    forceNonRational: WordBool; tessToleranceFactor: Double; 
                                    startMatchingType: Smallint; endMatchingType: Smallint); safecall;
    procedure InsertProtrusionBlend3(closed: WordBool; keepTangency: WordBool; 
                                     forceNonRational: WordBool; tessToleranceFactor: Double; 
                                     startMatchingType: Smallint; endMatchingType: Smallint); safecall;
    procedure InsertCutBlend3(closed: WordBool; keepTangency: WordBool; forceNonRational: WordBool; 
                              tessToleranceFactor: Double; startMatchingType: Smallint; 
                              endMatchingType: Smallint); safecall;
    procedure AlignDimensions; safecall;
    procedure BreakDimensionAlignment; safecall;
    procedure SketchFillet1(rad: Double); safecall;
    procedure FeatureChamferType(chamferType: Smallint; Width: Double; angle: Double; 
                                 flip: WordBool; otherDist: Double; vertexChamDist1: Double; 
                                 vertexChamDist2: Double; vertexChamDist3: Double); safecall;
    procedure FeatureCutThin(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                             d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                             ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                             offsetReverse1: WordBool; offsetReverse2: WordBool; thk1: Double; 
                             thk2: Double; endThk: Double; revThinDir: Integer; capEnds: Integer; 
                             addBends: WordBool; bendRad: Double); safecall;
    procedure FeatureBossThin(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                              t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                              dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; dang1: Double; 
                              dang2: Double; offsetReverse1: WordBool; offsetReverse2: WordBool; 
                              thk1: Double; thk2: Double; endThk: Double; revThinDir: Integer; 
                              capEnds: Integer; addBends: WordBool; bendRad: Double); safecall;
    function InsertDatumTargetSymbol(const datum1: WideString; const datum2: WideString; 
                                     const datum3: WideString; areaStyle: Smallint; 
                                     areaOutside: WordBool; value1: Double; value2: Double; 
                                     const valueStr1: WideString; const valueStr2: WideString; 
                                     arrowsSmart: WordBool; arrowStyle: Smallint; 
                                     leaderLineStyle: Smallint; leaderBent: WordBool; 
                                     showArea: WordBool; showSymbol: WordBool): WordBool; safecall;
    function EditDatumTargetSymbol(const datum1: WideString; const datum2: WideString; 
                                   const datum3: WideString; areaStyle: Smallint; 
                                   areaOutside: WordBool; value1: Double; value2: Double; 
                                   const valueStr1: WideString; const valueStr2: WideString; 
                                   arrowsSmart: WordBool; arrowStyle: Smallint; 
                                   leaderLineStyle: Smallint; leaderBent: WordBool; 
                                   showArea: WordBool; showSymbol: WordBool): WordBool; safecall;
    procedure InsertBOMBalloon; safecall;
    function FeatureReferenceCurve(numOfCurves: Integer; baseCurves: OleVariant; merge: WordBool; 
                                   const fromFileName: WideString; out errorCode: Integer): IDispatch; safecall;
    function IFeatureReferenceCurve(numOfCurves: Integer; baseCurves: PPPUserType1; 
                                    merge: WordBool; const fromFileName: WideString; 
                                    out errorCode: Integer): IReferenceCurve; safecall;
    procedure FontBold(Bold: WordBool); safecall;
    procedure FontItalic(Italic: WordBool); safecall;
    procedure FontUnderline(Underline: WordBool); safecall;
    procedure FontFace(const face: WideString); safecall;
    procedure FontPoints(Points: Smallint); safecall;
    procedure FontUnits(units: Double); safecall;
    function SketchSplineByEqnParams(paramsIn: OleVariant): WordBool; safecall;
    procedure AlignParallelDimensions; safecall;
    procedure SetBlockingState(stateIn: Integer); safecall;
    procedure ResetBlockingState; safecall;
    function GetSceneBkgDIB: Integer; safecall;
    procedure InsertHatchedFace; safecall;
    function GetColorTable: IDispatch; safecall;
    function IGetColorTable: IColorTable; safecall;
    procedure InsertSweepRefSurface2(propagate: WordBool; twistCtrlOption: Smallint; 
                                     keepTangency: WordBool; forceNonRational: WordBool; 
                                     startMatchingType: Smallint; endMatchingType: Smallint); safecall;
    procedure InsertProtrusionSwept3(propagate: WordBool; alignment: WordBool; 
                                     twistCtrlOption: Smallint; keepTangency: WordBool; 
                                     forceNonRational: WordBool; startMatchingType: Smallint; 
                                     endMatchingType: Smallint); safecall;
    procedure InsertCutSwept3(propagate: WordBool; alignment: WordBool; twistCtrlOption: Smallint; 
                              keepTangency: WordBool; forceNonRational: WordBool; 
                              startMatchingType: Smallint; endMatchingType: Smallint); safecall;
    function IsOpenedViewOnly: WordBool; safecall;
    function IsOpenedReadOnly: WordBool; safecall;
    procedure ViewZoomToSelection; safecall;
    procedure FeatureBossThicken(thickness: Double; direction: Integer; faceIndex: Integer); safecall;
    procedure FeatureCutThicken(thickness: Double; direction: Integer; faceIndex: Integer); safecall;
    function InsertAxis: WordBool; safecall;
    procedure EditUndo(nSteps: UINT); safecall;
    procedure SelectMidpoint; safecall;
    function ISketchSplineByEqnParams(var propArray: SYSINT; var knotsArray: Double; 
                                      var cntrlPntCoordArray: Double): Integer; safecall;
    function VersionHistory: OleVariant; safecall;
    function IVersionHistory: WideString; safecall;
    function IGetVersionHistoryCount: SYSINT; safecall;
    procedure Rebuild(options: Integer); safecall;
    procedure InsertFeatureShellAddThickness(thickness: Double); safecall;
    procedure InsertOffsetSurface(thickness: Double; reverse: WordBool); safecall;
    procedure SimplifySpline(toleranceIn: Double); safecall;
    function Get_SummaryInfo(FieldId: Integer): WideString; safecall;
    procedure Set_SummaryInfo(FieldId: Integer; const retval: WideString); safecall;
    function Get_CustomInfo(const FieldName: WideString): WideString; safecall;
    procedure Set_CustomInfo(const FieldName: WideString; const retval: WideString); safecall;
    function GetCustomInfoCount: Integer; safecall;
    function GetCustomInfoType(const FieldName: WideString): WideString; safecall;
    function GetCustomInfoNames: OleVariant; safecall;
    function IGetCustomInfoNames: WideString; safecall;
    function AddCustomInfo(const FieldName: WideString; const FieldType: WideString; 
                           const FieldValue: WideString): WordBool; safecall;
    function DeleteCustomInfo(const FieldName: WideString): WordBool; safecall;
    procedure PrintOut2(fromPage: Integer; toPage: Integer; numCopies: Integer; collate: WordBool; 
                        const printer: WideString; Scale: Double; printToFile: WordBool; 
                        const ptfName: WideString); safecall;
    function SetReadOnlyState(setReadOnly: WordBool): WordBool; safecall;
    function InsertFamilyTableOpen(const fileName: WideString): WordBool; safecall;
    function MultiSelectByRay(doubleInfoIn: OleVariant; typeWanted: Integer; append: WordBool): WordBool; safecall;
    function IMultiSelectByRay(var pointIn: Double; var vectorIn: Double; radiusIn: Double; 
                               typeWanted: Integer; append: WordBool): WordBool; safecall;
    procedure InsertNewNote3(const upperText: WideString; noLeader: WordBool; bentLeader: WordBool; 
                             arrowStyle: Smallint; leaderSide: Smallint; angle: Double; 
                             balloonStyle: Smallint; balloonFit: Smallint; smartArrow: WordBool); safecall;
    procedure InsertWeldSymbol2(const dim1: WideString; const symbol: WideString; 
                                const dim2: WideString; symmetric: WordBool; fieldWeld: WordBool; 
                                showOtherSide: WordBool; dashOnTop: WordBool; peripheral: WordBool; 
                                hasProcess: WordBool; const processValue: WideString); safecall;
    function InsertSurfaceFinishSymbol2(symType: Integer; leaderType: Integer; locX: Double; 
                                        locY: Double; locZ: Double; laySymbol: Integer; 
                                        arrowType: Integer; const machAllowance: WideString; 
                                        const otherVals: WideString; const prodMethod: WideString; 
                                        const sampleLen: WideString; 
                                        const maxRoughness: WideString; 
                                        const minRoughness: WideString; 
                                        const roughnessSpacing: WideString): WordBool; safecall;
    function SaveSilent: Integer; safecall;
    function SaveAsSilent(const newName: WideString; saveAsCopy: WordBool): Integer; safecall;
    function AddCustomInfo2(const FieldName: WideString; FieldType: Integer; 
                            const FieldValue: WideString): WordBool; safecall;
    function GetCustomInfoType2(const FieldName: WideString): Integer; safecall;
    function InsertRefPoint: WordBool; safecall;
    function FeatureFillet2(r1: Double; propagate: WordBool; ftyp: WordBool; varRadTyp: WordBool; 
                            overFlowType: Integer; nRadii: SYSINT; radii: OleVariant): Integer; safecall;
    function IFeatureFillet2(r1: Double; propagate: WordBool; ftyp: WordBool; varRadTyp: WordBool; 
                             overFlowType: Integer; nRadii: SYSINT; var radii: Double): Integer; safecall;
    function GetFirstAnnotation: IDispatch; safecall;
    function IGetFirstAnnotation: IAnnotation; safecall;
    function InsertCoordinateSystem(xFlippedIn: WordBool; yFlippedIn: WordBool; zFlippedIn: WordBool): WordBool; safecall;
    function GetToolbarVisibility(toolbar: Integer): WordBool; safecall;
    procedure SetToolbarVisibility(toolbar: Integer; visibility: WordBool); safecall;
    procedure ViewDispCoordinateSystems; safecall;
    procedure ViewDispTempRefaxes; safecall;
    procedure ViewDispRefPoints; safecall;
    procedure ViewDispOrigins; safecall;
    function GetCoordinateSystemXformByName(const nameIn: WideString): OleVariant; safecall;
    function IGetCoordinateSystemXformByName(const nameIn: WideString): Double; safecall;
    function GetCurrentCoordinateSystemName: WideString; safecall;
    function EnumModelViews: IEnumModelViews; safecall;
    function InsertCompositeCurve: WordBool; safecall;
    procedure SketchParabola(val1: Double; val2: Double; z1: Double; val3: Double; val4: Double; 
                             z2: Double; val5: Double; val6: Double; z3: Double; val7: Double; 
                             val8: Double; z4: Double); safecall;
    procedure InsertRadiateSurface(distance: Double; flipDir: WordBool; tangentPropagate: WordBool); safecall;
    procedure InsertSewRefSurface; safecall;
    function InsertShape(pressureOn: Integer; tangentsOn: Integer; pressureGain: Double; 
                         tangentGain: Double; curveSpringGain: Double; alpha: Double; beta: Double; 
                         gamma: Double; delta: Double; degree: Integer; split: Integer; 
                         tuning: Integer): Integer; safecall;
    procedure InsertMfDraft2(angle: Double; flipDir: WordBool; isEdgeDraft: WordBool; 
                             propType: Integer; stepDraft: WordBool); safecall;
    function GetConfigurationCount: Integer; safecall;
    function GetConfigurationNames: OleVariant; safecall;
    function IGetConfigurationNames(var count: Integer): WideString; safecall;
    procedure FeatureCut2(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                          d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool; 
                          keepPieceIndex: Integer); safecall;
    procedure InsertCutSurface(flip: WordBool; keepPieceIndex: Integer); safecall;
    function GetDetailingDefaults: IDispatch; safecall;
    function IGetDetailingDefaults: IDetailingDefaults; safecall;
    function ListExternalFileReferencesCount(useSearchRules: WordBool): Integer; safecall;
    function ListExternalFileReferences(useSearchRules: WordBool): OleVariant; safecall;
    function IListExternalFileReferences(useSearchRules: WordBool; numRefs: Integer): WideString; safecall;
    function SketchSplineByEqnParams2(paramsIn: OleVariant): WordBool; safecall;
    function GetFirstModelView: IDispatch; safecall;
    function IGetFirstModelView: IModelView; safecall;
    function InsertPlanarRefSurface: WordBool; safecall;
    function GetNext: IDispatch; safecall;
    function GetSaveFlag: WordBool; safecall;
    function AddCustomInfo3(const configuration: WideString; const FieldName: WideString; 
                            FieldType: Integer; const FieldValue: WideString): WordBool; safecall;
    function Get_CustomInfo2(const configuration: WideString; const FieldName: WideString): WideString; safecall;
    procedure Set_CustomInfo2(const configuration: WideString; const FieldName: WideString; 
                              const retval: WideString); safecall;
    function DeleteCustomInfo2(const configuration: WideString; const FieldName: WideString): WordBool; safecall;
    function GetCustomInfoCount2(const configuration: WideString): Integer; safecall;
    function GetCustomInfoNames2(const configuration: WideString): OleVariant; safecall;
    function IGetCustomInfoNames2(const configuration: WideString): WideString; safecall;
    function GetCustomInfoType3(const configuration: WideString; const FieldName: WideString): Integer; safecall;
    function GetConsiderLeadersAsLines: WordBool; safecall;
    function SetConsiderLeadersAsLines(leadersAsLines: WordBool): WordBool; safecall;
    procedure InsertRevolvedRefSurface(angle: Double; reverseDir: WordBool; angle2: Double; 
                                       revType: SYSINT); safecall;
    function GetBendState: Integer; safecall;
    function SetBendState(bendState: Integer): Integer; safecall;
    function Get_ShowFeatureErrorDialog: WordBool; safecall;
    procedure Set_ShowFeatureErrorDialog(retval: WordBool); safecall;
    procedure ClearUndoList; safecall;
    function GetFeatureManagerWidth: Integer; safecall;
    function SetFeatureManagerWidth(Width: Integer): Integer; safecall;
    function InsertProjectedSketch2(reverse: Integer): IDispatch; safecall;
    function IInsertProjectedSketch2(reverse: Integer): IFeature; safecall;
    function GetFeatureCount: Integer; safecall;
    function FeatureByPositionReverse(num: Integer): IDispatch; safecall;
    function IFeatureByPositionReverse(num: Integer): IFeature; safecall;
    function RayIntersections(bodiesIn: OleVariant; basePointsIn: OleVariant; 
                              vectorsIn: OleVariant; options: Integer; hitRadius: Double; 
                              offset: Double): Integer; safecall;
    function IRayIntersections(var bodiesIn: IBody; numBodies: Integer; var basePointsIn: Double; 
                               var vectorsIn: Double; numRays: Integer; options: Integer; 
                               hitRadius: Double; offset: Double): Integer; safecall;
    function GetRayIntersectionsPoints: OleVariant; safecall;
    function IGetRayIntersectionsPoints: Double; safecall;
    function GetRayIntersectionsTopology: OleVariant; safecall;
    function IGetRayIntersectionsTopology: IUnknown; safecall;
    procedure EditSeedFeat; safecall;
    function EditSuppress: WordBool; safecall;
    function EditUnsuppress: WordBool; safecall;
    function EditUnsuppressDependent: WordBool; safecall;
    function EditRollback: WordBool; safecall;
    function Save2(silent: WordBool): Integer; safecall;
    function SaveAs2(const newName: WideString; saveAsVersion: Integer; saveAsCopy: WordBool; 
                     silent: WordBool): Integer; safecall;
    procedure SetPopupMenuMode(modeIn: SYSINT); safecall;
    function GetPopupMenuMode: SYSINT; safecall;
    procedure CloseFamilyTable; safecall;
    procedure CreatePlaneAtSurface(interIndex: SYSINT; projOpt: WordBool; reverseDir: WordBool; 
                                   normalPlane: WordBool; angle: Double); safecall;
    procedure SketchOffset(offset: Double; contourMode: WordBool); safecall;
    function CreateLinearSketchStepAndRepeat(numX: Integer; numY: Integer; spacingX: Double; 
                                             spacingY: Double; angleX: Double; angleY: Double; 
                                             const deleteInstances: WideString): WordBool; safecall;
    function SetAmbientLightProperties(const Name: WideString; ambient: Double; diffuse: Double; 
                                       specular: Double; colour: Integer; enabled: WordBool; 
                                       fixed: WordBool): WordBool; safecall;
    function GetAmbientLightProperties(const Name: WideString; var ambient: Double; 
                                       var diffuse: Double; var specular: Double; 
                                       var colour: Integer; var enabled: WordBool; 
                                       var fixed: WordBool): WordBool; safecall;
    function SetPointLightProperties(const Name: WideString; ambient: Double; diffuse: Double; 
                                     specular: Double; colour: Integer; enabled: WordBool; 
                                     fixed: WordBool; x: Double; y: Double; z: Double): WordBool; safecall;
    function GetPointLightProperties(const Name: WideString; var ambient: Double; 
                                     var diffuse: Double; var specular: Double; 
                                     var colour: Integer; var enabled: WordBool; 
                                     var fixed: WordBool; var x: Double; var y: Double; 
                                     var z: Double): WordBool; safecall;
    function SetDirectionLightProperties(const Name: WideString; ambient: Double; diffuse: Double; 
                                         specular: Double; colour: Integer; enabled: WordBool; 
                                         fixed: WordBool; x: Double; y: Double; z: Double): WordBool; safecall;
    function GetDirectionLightProperties(const Name: WideString; var ambient: Double; 
                                         var diffuse: Double; var specular: Double; 
                                         var colour: Integer; var enabled: WordBool; 
                                         var fixed: WordBool; var x: Double; var y: Double; 
                                         var z: Double): WordBool; safecall;
    function SetSpotlightProperties(const Name: WideString; ambient: Double; diffuse: Double; 
                                    specular: Double; colour: Integer; enabled: WordBool; 
                                    fixed: WordBool; posx: Double; posy: Double; posz: Double; 
                                    targetx: Double; targety: Double; targetz: Double; 
                                    coneAngle: Double): WordBool; safecall;
    function GetSpotlightProperties(const Name: WideString; var ambient: Double; 
                                    var diffuse: Double; var specular: Double; var colour: Integer; 
                                    var enabled: WordBool; var fixed: WordBool; var x: Double; 
                                    var y: Double; var z: Double; var targetx: Double; 
                                    var targety: Double; var targetz: Double; var coneAngle: Double): WordBool; safecall;
    procedure SplitOpenSegment(x: Double; y: Double; z: Double); safecall;
    procedure AutoInferToggle; safecall;
    procedure SketchRectangleAtAnyAngle(val1: Double; val2: Double; z1: Double; val3: Double; 
                                        val4: Double; z2: Double; val3x: Double; val3y: Double; 
                                        z3: Double; val5: WordBool); safecall;
    function CreateCircularSketchStepAndRepeat(arcRadius: Double; arcAngle: Double; 
                                               patternNum: Integer; patternSpacing: Double; 
                                               patternRotate: WordBool; 
                                               const deleteInstances: WideString): WordBool; safecall;
    procedure SplitClosedSegment(x0: Double; y0: Double; z0: Double; x1: Double; y1: Double; 
                                 z1: Double); safecall;
    function IsLightLockedToModel(lightId: Integer): WordBool; safecall;
    function LockLightToModel(lightId: Integer; fix: WordBool): WordBool; safecall;
    function FeatureFillet3(r1: Double; propagate: WordBool; ftyp: SYSINT; varRadTyp: WordBool; 
                            overFlowType: Integer; nRadii: SYSINT; radii: OleVariant; 
                            useHelpPoint: WordBool; useTangentHoldLine: WordBool): Integer; safecall;
    function IFeatureFillet3(r1: Double; propagate: WordBool; ftyp: SYSINT; varRadTyp: WordBool; 
                             overFlowType: Integer; nRadii: SYSINT; var radii: Double; 
                             useHelpPoint: WordBool; useTangentHoldLine: WordBool): Integer; safecall;
    procedure InsertConnectionPoint; safecall;
    procedure InsertRoutePoint; safecall;
    procedure FeatureBossThicken2(thickness: Double; direction: Integer; faceIndex: Integer; 
                                  fillVolume: WordBool); safecall;
    procedure FeatureCutThicken2(thickness: Double; direction: Integer; faceIndex: Integer; 
                                 fillVolume: WordBool); safecall;
    function GetConfigurationByName(const Name: WideString): IDispatch; safecall;
    function IGetConfigurationByName(const Name: WideString): IConfiguration; safecall;
    function CreatePoint2(pointX: Double; pointY: Double; pointZ: Double): IDispatch; safecall;
    function ICreatePoint2(pointX: Double; pointY: Double; pointZ: Double): ISketchPoint; safecall;
    function CreateLine2(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                         p2z: Double): IDispatch; safecall;
    function ICreateLine2(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                          p2z: Double): ISketchSegment; safecall;
    function GetActiveSketch2: IDispatch; safecall;
    function IGetActiveSketch2: ISketch; safecall;
    procedure DrawLightIcons; safecall;
    function GetLayerManager: IDispatch; safecall;
    function IGetLayerManager: ILayerMgr; safecall;
    function CreateCircle2(xC: Double; yC: Double; zc: Double; xp: Double; yp: Double; zp: Double): IDispatch; safecall;
    function ICreateCircle2(xC: Double; yC: Double; zc: Double; xp: Double; yp: Double; zp: Double): ISketchSegment; safecall;
    function CreateCircleByRadius2(xC: Double; yC: Double; zc: Double; radius: Double): IDispatch; safecall;
    function ICreateCircleByRadius2(xC: Double; yC: Double; zc: Double; radius: Double): ISketchSegment; safecall;
    function CreateArc2(xC: Double; yC: Double; zc: Double; xp1: Double; yp1: Double; zp1: Double; 
                        xp2: Double; yp2: Double; zp2: Double; direction: Smallint): IDispatch; safecall;
    function ICreateArc2(xC: Double; yC: Double; zc: Double; xp1: Double; yp1: Double; zp1: Double; 
                         xp2: Double; yp2: Double; zp2: Double; direction: Smallint): ISketchSegment; safecall;
    function CreateEllipse2(centerX: Double; centerY: Double; centerZ: Double; majorX: Double; 
                            majorY: Double; majorZ: Double; minorX: Double; minorY: Double; 
                            minorZ: Double): IDispatch; safecall;
    function ICreateEllipse2(centerX: Double; centerY: Double; centerZ: Double; majorX: Double; 
                             majorY: Double; majorZ: Double; minorX: Double; minorY: Double; 
                             minorZ: Double): ISketchSegment; safecall;
    function CreateEllipticalArc2(centerX: Double; centerY: Double; centerZ: Double; 
                                  majorX: Double; majorY: Double; majorZ: Double; minorX: Double; 
                                  minorY: Double; minorZ: Double; startX: Double; startY: Double; 
                                  startZ: Double; endX: Double; endY: Double; endZ: Double): IDispatch; safecall;
    function ICreateEllipticalArc2(centerX: Double; centerY: Double; centerZ: Double; 
                                   majorX: Double; majorY: Double; majorZ: Double; minorX: Double; 
                                   minorY: Double; minorZ: Double; startX: Double; startY: Double; 
                                   startZ: Double; endX: Double; endY: Double; endZ: Double): ISketchSegment; safecall;
    function CreateSpline(pointData: OleVariant): IDispatch; safecall;
    function ICreateSpline(pointCount: Integer; var pointData: Double): ISketchSegment; safecall;
    procedure ViewZoomtofit2; safecall;
    procedure SetInferenceMode(inferenceMode: WordBool); safecall;
    function GetInferenceMode: WordBool; safecall;
    function SetTitle2(const newTitle: WideString): WordBool; safecall;
    function SketchFillet2(rad: Double; constrainedCorners: Smallint): WordBool; safecall;
    function IsTessellationValid: WordBool; safecall;
    procedure EditRoute; safecall;
    procedure FileReload; safecall;
    function GetDesignTable: IDispatch; safecall;
    function IGetDesignTable: IDesignTable; safecall;
    function GetEntityName(const entity: IDispatch): WideString; safecall;
    function IGetEntityName(const entity: IEntity): WideString; safecall;
    function IGetNext: IModelDoc; safecall;
    function ShowConfiguration2(const configurationName: WideString): WordBool; safecall;
    function AddConfiguration2(const Name: WideString; const comment: WideString; 
                               const alternateName: WideString; suppressByDefault: WordBool; 
                               hideByDefault: WordBool; minFeatureManager: WordBool; 
                               inheritProperties: WordBool; flags: UINT): WordBool; safecall;
    function DeleteConfiguration2(const configurationName: WideString): WordBool; safecall;
    function EditConfiguration2(const Name: WideString; const newName: WideString; 
                                const comment: WideString; const alternateName: WideString; 
                                suppressByDefault: WordBool; hideByDefault: WordBool; 
                                minFeatureManager: WordBool; inheritProperties: WordBool; 
                                flags: UINT): WordBool; safecall;
    function CreateSplineByEqnParams(paramsIn: OleVariant): IDispatch; safecall;
    function ICreateSplineByEqnParams(var propArray: SYSINT; var knotsArray: Double; 
                                      var cntrlPntCoordArray: Double): ISketchSegment; safecall;
    function CreateFeatureMgrView2(var bitmap: Integer; const toolTip: WideString): IDispatch; safecall;
    function ICreateFeatureMgrView2(var bitmap: Integer; const toolTip: WideString): IFeatMgrView; safecall;
    function AddFeatureMgrView2(var bitmap: Integer; var appView: Integer; const toolTip: WideString): WordBool; safecall;
    procedure FeatureCut3(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                          d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool; 
                          keepPieceIndex: Integer); safecall;
    function GetFirstAnnotation2: IDispatch; safecall;
    function IGetFirstAnnotation2: IAnnotation; safecall;
    procedure InsertExtendSurface(extendLinear: WordBool; endCondition: Integer; distance: Double); safecall;
    procedure InsertTangencySurface(oneSide: WordBool; isFlip: WordBool); safecall;
    function CreateSplinesByEqnParams(paramsIn: OleVariant): OleVariant; safecall;
    function ICreateSplinesByEqnParams(var propArray: SYSINT; var knotsArray: Double; 
                                       var cntrlPntCoordArray: Double): IEnumSketchSegments; safecall;
    function CreateClippedSplines(paramsIn: OleVariant; x1: Double; y1: Double; x2: Double; 
                                  y2: Double): OleVariant; safecall;
    function ICreateClippedSplines(var propArray: SYSINT; var knotsArray: Double; 
                                   var cntrlPntCoordArray: Double; x1: Double; y1: Double; 
                                   x2: Double; y2: Double): IEnumSketchSegments; safecall;
    function EditSuppress2: WordBool; safecall;
    function EditUnsuppress2: WordBool; safecall;
    function EditUnsuppressDependent2: WordBool; safecall;
    function EditRollback2: WordBool; safecall;
    procedure HideDimension; safecall;
    procedure ShowFeatureDimensions; safecall;
    procedure HideFeatureDimensions; safecall;
    procedure Sketch3DIntersections; safecall;
    function FeatureFillet4(r1: Double; propagate: WordBool; uniformRadius: WordBool; ftyp: SYSINT; 
                            varRadTyp: WordBool; overFlowType: Integer; nRadii: SYSINT; 
                            radii: OleVariant; useHelpPoint: WordBool; 
                            useTangentHoldLine: WordBool; cornerType: WordBool; 
                            setbackDistCount: SYSINT; setBackDistances: OleVariant): Integer; safecall;
    function IFeatureFillet4(r1: Double; propagate: WordBool; uniformRadius: WordBool; 
                             ftyp: SYSINT; varRadTyp: WordBool; overFlowType: Integer; 
                             nRadii: SYSINT; var radii: Double; useHelpPoint: WordBool; 
                             useTangentHoldLine: WordBool; cornerType: WordBool; 
                             setbackDistCount: SYSINT; var setBackDistances: Double): Integer; safecall;
    procedure InsertDeleteFace; safecall;
    function GetDependencies2(traverseflag: WordBool; searchflag: WordBool; 
                              addReadOnlyInfo: WordBool): OleVariant; safecall;
    function IGetDependencies2(traverseflag: WordBool; searchflag: WordBool; 
                               addReadOnlyInfo: WordBool): WideString; safecall;
    function IGetNumDependencies2(traverseflag: WordBool; searchflag: WordBool; 
                                  addReadOnlyInfo: WordBool): Integer; safecall;
    procedure InsertScale(scaleFactor_x: Double; scaleFactor_y: Double; scaleFactor_z: Double; 
                          isUniform: WordBool; scaleType: SYSINT); safecall;
    procedure LockAllExternalReferences; safecall;
    procedure UnlockAllExternalReferences; safecall;
    procedure BreakAllExternalReferences; safecall;
    function EditDimensionProperties(tolType: Integer; tolMax: Double; tolMin: Double; 
                                     const tolMaxFit: WideString; const tolMinFit: WideString; 
                                     useDocPrec: WordBool; precision: Integer; arrowsIn: Integer; 
                                     useDocArrows: WordBool; arrow1: Integer; arrow2: Integer): WordBool; safecall;
    function SketchPolygon(xCenter: Double; yCenter: Double; xEdge: Double; yEdge: Double; 
                           nSides: SYSINT; bInscribed: WordBool): WordBool; safecall;
    function GetBlockingState: Integer; safecall;
    function CreateFeatureMgrView3(var bitmap: Integer; const toolTip: WideString; 
                                   whichPane: Integer): IDispatch; safecall;
    function ICreateFeatureMgrView3(var bitmap: Integer; const toolTip: WideString; 
                                    whichPane: Integer): IFeatMgrView; safecall;
    function AddFeatureMgrView3(var bitmap: Integer; var appView: Integer; 
                                const toolTip: WideString; whichPane: Integer): WordBool; safecall;
    function CreatePlaneAtOffset2(val: Double; flipDir: WordBool): IDispatch; safecall;
    function ICreatePlaneAtOffset2(val: Double; flipDir: WordBool): IRefPlane; safecall;
    function CreatePlaneAtAngle2(val: Double; flipDir: WordBool): IDispatch; safecall;
    function ICreatePlaneAtAngle2(val: Double; flipDir: WordBool): IRefPlane; safecall;
    function CreatePlaneThru3Points2: IDispatch; safecall;
    function ICreatePlaneThru3Points2: IRefPlane; safecall;
    function CreatePlanePerCurveAndPassPoint2(origAtCurve: WordBool): IDispatch; safecall;
    function ICreatePlanePerCurveAndPassPoint2(origAtCurve: WordBool): IRefPlane; safecall;
    function CreatePlaneAtSurface2(interIndex: SYSINT; projOpt: WordBool; reverseDir: WordBool; 
                                   normalPlane: WordBool; angle: Double): IDispatch; safecall;
    function ICreatePlaneAtSurface2(interIndex: SYSINT; projOpt: WordBool; reverseDir: WordBool; 
                                    normalPlane: WordBool; angle: Double): IRefPlane; safecall;
    function GetUserPreferenceIntegerValue(userPreferenceValue: Integer): Integer; safecall;
    function SetUserPreferenceIntegerValue(userPreferenceValue: Integer; Value: Integer): WordBool; safecall;
    function GetUserPreferenceTextFormat(userPreferenceValue: Integer): IDispatch; safecall;
    function IGetUserPreferenceTextFormat(userPreferenceValue: Integer): ITextFormat; safecall;
    function SetUserPreferenceTextFormat(userPreferenceValue: Integer; const Value: IDispatch): WordBool; safecall;
    function ISetUserPreferenceTextFormat(userPreferenceValue: Integer; const Value: ITextFormat): WordBool; safecall;
    procedure InsertRib2(is2Sided: WordBool; reverseThicknessDir: WordBool; thickness: Double; 
                         referenceEdgeIndex: Integer; reverseMaterialDir: WordBool; 
                         isDrafted: WordBool; draftOutward: WordBool; draftAngle: Double; 
                         isNormToSketch: WordBool); safecall;
    function InsertObjectFromFile(const filePath: WideString; createLink: WordBool; xx: Double; 
                                  yy: Double; zz: Double): WordBool; safecall;
    procedure InspectCurvature; safecall;
    procedure RemoveInspectCurvature; safecall;
    function InsertDatumTag2: IDispatch; safecall;
    function IInsertDatumTag2: IDatumTag; safecall;
    function ActivateFeatureMgrView(var appView: Integer): Integer; safecall;
    procedure FeatureSketchDrivenPattern(useCentroid: WordBool); safecall;
    procedure HideShowBodies; safecall;
    procedure HideSolidBody; safecall;
    procedure ShowSolidBody; safecall;
    procedure InsertFramePoint(xx: Double; yy: Double; zz: Double); safecall;
    procedure LockFramePoint; safecall;
    procedure UnlockFramePoint; safecall;
    function InsertGtol: IDispatch; safecall;
    function IInsertGtol: IGtol; safecall;
    function DeActivateFeatureMgrView(var appView: Integer): WordBool; safecall;
    function InsertNote(const text: WideString): IDispatch; safecall;
    function IInsertNote(const text: WideString): INote; safecall;
    procedure SetSaveAsFileName(const fileName: WideString); safecall;
    procedure ClosePrintPreview; safecall;
    procedure HideComponent2; safecall;
    procedure ShowComponent2; safecall;
    function SaveBMP(const filenameIn: WideString; widthIn: Integer; heightIn: Integer): WordBool; safecall;
    procedure InsertSketch2(updateEditRebuild: WordBool); safecall;
    procedure Insert3DSketch2(updateEditRebuild: WordBool); safecall;
    procedure InsertDeleteHole; safecall;
    procedure PreTrimSurface(bMutualTrimIn: WordBool); safecall;
    procedure PostTrimSurface(bSewSurfaceIn: WordBool); safecall;
    procedure SketchConvertIsoCurves(percentRatio: Double; vORuDir: WordBool; 
                                     doConstrain: WordBool; skipHoles: WordBool); safecall;
    procedure SelectLoop; safecall;
    procedure InsertSheetMetalBaseFlange(thickness: Double; thickenDir: WordBool; radius: Double; 
                                         extrudeDist1: Double; extrudeDist2: Double; 
                                         flipExtruDir: WordBool; endCondition1: Integer; 
                                         endCondition2: Integer; dirToUse: Integer); safecall;
    procedure InsertSheetMetalFold; safecall;
    procedure InsertSheetMetalUnfold; safecall;
    procedure InsertSheetMetalMiterFlange(useReliefRatio: WordBool; useDefaultGap: WordBool; 
                                          useAutoRelief: WordBool; globalRadius: Double; 
                                          ripGap: Double; autoReliefRatio: Double; 
                                          autoReliefWidth: Double; autoReliefDepth: Double; 
                                          reliefType: Integer; ripLocation: Integer; 
                                          trimSideBends: WordBool); safecall;
    procedure CreateGroup; safecall;
    procedure RemoveItemsFromGroup; safecall;
    procedure RemoveGroups; safecall;
    function InsertBOMBalloon2(Style: Integer; size: Integer; upperTextStyle: Integer; 
                               const upperText: WideString; lowerTextStyle: Integer; 
                               const lowerText: WideString): IDispatch; safecall;
    function IInsertBOMBalloon2(Style: Integer; size: Integer; upperTextStyle: Integer; 
                                const upperText: WideString; lowerTextStyle: Integer; 
                                const lowerText: WideString): INote; safecall;
    procedure EditRedo(nSteps: UINT); safecall;
    procedure InsertProtrusionBlend4(closed: WordBool; keepTangency: WordBool; 
                                     forceNonRational: WordBool; tessToleranceFactor: Double; 
                                     startMatchingType: Smallint; endMatchingType: Smallint; 
                                     isThinBody: WordBool; thickness1: Double; thickness2: Double; 
                                     thinType: Smallint); safecall;
    procedure InsertCutBlend4(closed: WordBool; keepTangency: WordBool; forceNonRational: WordBool; 
                              tessToleranceFactor: Double; startMatchingType: Smallint; 
                              endMatchingType: Smallint; isThinBody: WordBool; thickness1: Double; 
                              thickness2: Double; thinType: Smallint); safecall;
    procedure InsertProtrusionSwept4(propagate: WordBool; alignment: WordBool; 
                                     twistCtrlOption: Smallint; keepTangency: WordBool; 
                                     forceNonRational: WordBool; startMatchingType: Smallint; 
                                     endMatchingType: Smallint; isThinBody: WordBool; 
                                     thickness1: Double; thickness2: Double; thinType: Smallint); safecall;
    procedure InsertCutSwept4(propagate: WordBool; alignment: WordBool; twistCtrlOption: Smallint; 
                              keepTangency: WordBool; forceNonRational: WordBool; 
                              startMatchingType: Smallint; endMatchingType: Smallint; 
                              isThinBody: WordBool; thickness1: Double; thickness2: Double; 
                              thinType: Smallint); safecall;
    procedure SelectTangency; safecall;
    function InsertBendTableOpen(const fileName: WideString): WordBool; safecall;
    function InsertBendTableNew(const fileName: WideString; const units: WideString; 
                                const type_: WideString): WordBool; safecall;
    procedure InsertBendTableEdit; safecall;
    procedure DeleteBendTable; safecall;
    procedure InsertSheetMetal3dBend(angle: Double; radius: Double; flipDir: WordBool; 
                                     bendPos: Smallint); safecall;
    function CreateTangentArc2(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                               p2z: Double; arcTypeIn: Integer): WordBool; safecall;
    function GetMassProperties2(var status: Integer): OleVariant; safecall;
    function IGetMassProperties2(var status: Integer): Double; safecall;
    procedure SketchChamfer(angleORdist: Double; dist1: Double; options: Integer); safecall;
    procedure FeatureCut4(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                          d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool; 
                          keepPieceIndex: Integer; normalCut: WordBool); safecall;
    function GetPropertyManagerPage(dialogId: Integer; const title: WideString; 
                                    const handler: IUnknown): IPropertyManagerPage; safecall;
    procedure AlignOrdinate; safecall;
    procedure EditOrdinate; safecall;
    function ReattachOrdinate: WordBool; safecall;
    function EditBalloonProperties(Style: Integer; size: Integer; upperTextStyle: Integer; 
                                   const upperText: WideString; lowerTextStyle: Integer; 
                                   const lowerText: WideString): IDispatch; safecall;
    function EditDimensionProperties2(tolType: Integer; tolMax: Double; tolMin: Double; 
                                      const tolMaxFit: WideString; const tolMinFit: WideString; 
                                      useDocPrec: WordBool; precision: Integer; arrowsIn: Integer; 
                                      useDocArrows: WordBool; arrow1: Integer; arrow2: Integer; 
                                      const prefixText: WideString; const suffixText: WideString; 
                                      showValue: WordBool; const calloutText1: WideString; 
                                      const calloutText2: WideString; CenterText: WordBool): WordBool; safecall;
    procedure InsertSheetMetalClosedCorner; safecall;
    function SketchUseEdge2(chain: WordBool): WordBool; safecall;
    function SketchOffsetEntities2(offset: Double; bothDirections: WordBool; chain: WordBool): WordBool; safecall;
    function SketchOffset2(offset: Double; bothDirections: WordBool; chain: WordBool): WordBool; safecall;
    function AddDimension2(x: Double; y: Double; z: Double): IDispatch; safecall;
    function IAddDimension2(x: Double; y: Double; z: Double): IDisplayDimension; safecall;
    function AddHorizontalDimension2(x: Double; y: Double; z: Double): IDispatch; safecall;
    function IAddHorizontalDimension2(x: Double; y: Double; z: Double): IDisplayDimension; safecall;
    function AddVerticalDimension2(x: Double; y: Double; z: Double): IDispatch; safecall;
    function IAddVerticalDimension2(x: Double; y: Double; z: Double): IDisplayDimension; safecall;
    function AddRadialDimension2(x: Double; y: Double; z: Double): IDispatch; safecall;
    function IAddRadialDimension2(x: Double; y: Double; z: Double): IDisplayDimension; safecall;
    function AddDiameterDimension2(x: Double; y: Double; z: Double): IDispatch; safecall;
    function IAddDiameterDimension2(x: Double; y: Double; z: Double): IDisplayDimension; safecall;
    function GetUserUnit(UnitType: Integer): IDispatch; safecall;
    function IGetUserUnit(UnitType: Integer): IUserUnit; safecall;
    property SelectionManager: IDispatch read Get_SelectionManager write Set_SelectionManager;
    property ISelectionManager: ISelectionMgr read Get_ISelectionManager;
    property ActiveView: IDispatch read Get_ActiveView write Set_ActiveView;
    property IActiveView: IModelView read Get_IActiveView;
    property LengthUnit: Integer read Get_LengthUnit write Set_LengthUnit;
    property LightSourceUserName[Id: Integer]: WideString read Get_LightSourceUserName write Set_LightSourceUserName;
    property LightSourcePropertyValues[Id: Integer]: OleVariant read Get_LightSourcePropertyValues write Set_LightSourcePropertyValues;
    property SceneName: WideString read Get_SceneName write Set_SceneName;
    property SceneUserName: WideString read Get_SceneUserName write Set_SceneUserName;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property MaterialUserName: WideString read Get_MaterialUserName write Set_MaterialUserName;
    property MaterialIdName: WideString read Get_MaterialIdName write Set_MaterialIdName;
    property MaterialPropertyValues: OleVariant read Get_MaterialPropertyValues write Set_MaterialPropertyValues;
    property PrintSetup[setupType: Integer]: Smallint read Get_PrintSetup write Set_PrintSetup;
    property SceneBkgImageFileName: WideString read Get_SceneBkgImageFileName write Set_SceneBkgImageFileName;
    property SummaryInfo[FieldId: Integer]: WideString read Get_SummaryInfo write Set_SummaryInfo;
    property CustomInfo[const FieldName: WideString]: WideString read Get_CustomInfo write Set_CustomInfo;
    property CustomInfo2[const configuration: WideString; const FieldName: WideString]: WideString read Get_CustomInfo2 write Set_CustomInfo2;
    property ShowFeatureErrorDialog: WordBool read Get_ShowFeatureErrorDialog write Set_ShowFeatureErrorDialog;
  end;

// *********************************************************************//
// DispIntf:  IModelDocDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D46-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IModelDocDisp = dispinterface
    ['{83A33D46-27C5-11CE-BFD4-00400513BB57}']
    property SelectionManager: IDispatch dispid 65537;
    property ISelectionManager: ISelectionMgr readonly dispid 65711;
    property ActiveView: IDispatch dispid 65538;
    property IActiveView: IModelView readonly dispid 65712;
    property LengthUnit: Integer dispid 65539;
    property LightSourceUserName[Id: Integer]: WideString dispid 65716;
    property LightSourcePropertyValues[Id: Integer]: OleVariant dispid 65717;
    property SceneName: WideString dispid 65718;
    property SceneUserName: WideString dispid 65719;
    procedure FeatureFillet(r1: Double; propagate: WordBool; ftyp: WordBool; varRadTyp: WordBool; 
                            overFlowType: Integer); dispid 65540;
    procedure GridOptions(dispGrid: WordBool; gridSpacing: Double; snap: WordBool; 
                          dotStyle: WordBool; nMajor: Smallint; nMinor: Smallint; 
                          align2edge: WordBool; angleSnap: WordBool; angleUnit: Double; 
                          minorAuto: WordBool); dispid 65541;
    procedure SetUnits(uType: Smallint; fractBase: Smallint; fractDenom: Smallint; 
                       sigDigits: Smallint; roundToFraction: WordBool); dispid 65542;
    procedure LBDownAt(flags: Integer; x: Double; y: Double; z: Double); dispid 65543;
    procedure LBUpAt(flags: Integer; x: Double; y: Double; z: Double); dispid 65544;
    procedure DragTo(flags: Integer; x: Double; y: Double; z: Double); dispid 65545;
    procedure SelectAt(flags: Integer; x: Double; y: Double; z: Double); dispid 65546;
    procedure CreateLineVB(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; z2: Double); dispid 65547;
    function CreateLine(P1: OleVariant; P2: OleVariant): WordBool; dispid 65548;
    procedure CreateCenterLineVB(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; 
                                 z2: Double); dispid 65549;
    function CreateCenterLine(P1: OleVariant; P2: OleVariant): WordBool; dispid 65550;
    procedure CreateArcVB(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                          p2z: Double; p3x: Double; p3y: Double; p3z: Double; dir: Smallint); dispid 65551;
    function CreateArc(P1: OleVariant; P2: OleVariant; P3: OleVariant; dir: Smallint): WordBool; dispid 65552;
    procedure CreateCircleVB(p1x: Double; p1y: Double; p1z: Double; radius: Double); dispid 65553;
    function CreateCircleByRadius(P1: OleVariant; radius: Double): WordBool; dispid 65554;
    function GetLines: OleVariant; dispid 65555;
    procedure SketchTrim(op: Integer; selEnd: Integer; x: Double; y: Double); dispid 65556;
    procedure SketchOffsetEdges(val: Double); dispid 65557;
    procedure SketchRectangle(val1: Double; val2: Double; z1: Double; val3: Double; val4: Double; 
                              z2: Double; val5: WordBool); dispid 65558;
    procedure SketchPoint(x: Double; y: Double; z: Double); dispid 65559;
    procedure FeatureCut(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                         d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; ddir1: WordBool; 
                         ddir2: WordBool; dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                         offsetReverse2: WordBool); dispid 65560;
    procedure FeatureBoss(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                          d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool); dispid 65561;
    procedure SimpleHole(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                         d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; ddir1: WordBool; 
                         ddir2: WordBool; dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                         offsetReverse2: WordBool); dispid 65562;
    procedure FeatureLinearPattern(num1: Integer; spacing1: Double; num2: Integer; 
                                   spacing2: Double; flipDir1: WordBool; flipDir2: WordBool; 
                                   const dName1: WideString; const dName2: WideString); dispid 65563;
    procedure NameView(const vName: WideString); dispid 65564;
    procedure ShowNamedView(const vName: WideString); dispid 65565;
    procedure CreatePlaneAtOffset(val: Double; flipDir: WordBool); dispid 65566;
    procedure Toolbars(m: WordBool; vw: WordBool; skMain: WordBool; sk: WordBool; feat: WordBool; 
                       constr: WordBool; macro: WordBool); dispid 65567;
    procedure CreatePlaneAtAngle(val: Double; flipDir: WordBool); dispid 65568;
    procedure SetParamValue(val: Double); dispid 65569;
    procedure AddRelation(const relStr: WideString); dispid 65570;
    procedure DeleteAllRelations; dispid 65571;
    procedure HoleWizard(depth: Double; endType: Smallint; flip: WordBool; dir: WordBool; 
                         hType: Integer; d1: Double; d2: Double; d3: Double; d4: Double; 
                         d5: Double; d6: Double; d7: Double; d8: Double; d9: Double; d10: Double; 
                         d11: Double; d12: Double); dispid 65572;
    function SaveAs(const newName: WideString): WordBool; dispid 65573;
    procedure ActivateSelectedFeature; dispid 65574;
    procedure SelectByName(flags: Integer; const idStr: WideString); dispid 65575;
    procedure SketchAddConstraints(const idStr: WideString); dispid 65576;
    procedure SketchConstraintsDel(constrInd: Integer; const idStr: WideString); dispid 65577;
    procedure SketchConstraintsDelAll; dispid 65578;
    procedure Lock; dispid 65579;
    procedure UnLock; dispid 65580;
    procedure InsertFeatureShell(thickness: Double; outward: WordBool); dispid 65581;
    procedure SketchFillet(rad: Double); dispid 65582;
    procedure FeatureChamfer(Width: Double; angle: Double; flip: WordBool); dispid 65583;
    procedure InsertMfDraft(angle: Double; flipDir: WordBool; isEdgeDraft: WordBool; 
                            propType: Integer); dispid 65584;
    procedure ParentChildRelationship; dispid 65585;
    procedure SketchSpline(morePts: Integer; x: Double; y: Double; z: Double); dispid 65586;
    procedure SelectSketchPoint(x: Double; y: Double; incidence: Integer); dispid 65587;
    procedure SelectSketchLine(x0: Double; y0: Double; inc0: Integer; x1: Double; y1: Double; 
                               inc1: Integer); dispid 65588;
    procedure SelectSketchArc(x0: Double; y0: Double; inc0: Integer; x1: Double; y1: Double; 
                              inc1: Integer; xC: Double; yC: Double; incC: Integer; rotDir: Integer); dispid 65589;
    procedure SelectSketchSpline(size: Integer; x0: Double; y0: Double; inc0: Integer; x1: Double; 
                                 y1: Double; inc1: Integer; xC: Double; yC: Double; incC: Integer); dispid 65590;
    function CreateTangentArc(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                              p2z: Double): WordBool; dispid 65591;
    function Create3PointArc(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                             p2z: Double; p3x: Double; p3y: Double; p3z: Double): WordBool; dispid 65592;
    function CreateArcByCenter(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                               p2z: Double; p3x: Double; p3y: Double; p3z: Double): WordBool; dispid 65593;
    function CreateCircle(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                          p2z: Double): WordBool; dispid 65594;
    function AddDimension(x: Double; y: Double; z: Double): WordBool; dispid 65595;
    function AddHorizontalDimension(x: Double; y: Double; z: Double): WordBool; dispid 65596;
    function AddVerticalDimension(x: Double; y: Double; z: Double): WordBool; dispid 65597;
    function SelectSketchItem(selOpt: Integer; const Name: WideString; x: Double; y: Double; 
                              z: Double): WordBool; dispid 65598;
    procedure ClearSelection; dispid 65599;
    procedure Select(const selID: WideString; const selParams: WideString; x: Double; y: Double; 
                     z: Double); dispid 65600;
    procedure AndSelect(const selID: WideString; const selParams: WideString; x: Double; y: Double; 
                        z: Double); dispid 65601;
    function CreatePoint(pointX: Double; pointY: Double; pointZ: Double): WordBool; dispid 65602;
    function CreateLineDB(sx: Double; sy: Double; sz: Double; ex: Double; ey: Double; ez: Double): WordBool; dispid 65603;
    function CreateArcDB(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; z2: Double; 
                         x3: Double; y3: Double; z3: Double; dir: Smallint): WordBool; dispid 65604;
    function CreateCircleDB(cx: Double; cy: Double; cz: Double; radius: Double): WordBool; dispid 65605;
    function CreatePointDB(x: Double; y: Double; z: Double): WordBool; dispid 65606;
    function GetTitle: WideString; dispid 65607;
    function GetPathName: WideString; dispid 65608;
    function GetType: Integer; dispid 65609;
    procedure InsertObject; dispid 65610;
    procedure EditClearAll; dispid 65611;
    procedure EditCopy; dispid 65612;
    procedure EditCut; dispid 65613;
    procedure ObjectDisplayContent; dispid 65614;
    procedure ObjectDisplayAsIcon; dispid 65615;
    procedure ObjectResetsize; dispid 65616;
    procedure WindowRedraw; dispid 65617;
    procedure Dummy3; dispid 65618;
    procedure SetPickMode; dispid 65619;
    procedure ViewRotateminusx; dispid 65620;
    procedure ViewRotateminusy; dispid 65621;
    procedure ViewRotateminusz; dispid 65622;
    procedure ViewRotateplusx; dispid 65623;
    procedure ViewRotateplusy; dispid 65624;
    procedure ViewRotateplusz; dispid 65625;
    procedure ViewTranslateminusx; dispid 65626;
    procedure ViewTranslateminusy; dispid 65627;
    procedure ViewTranslateplusx; dispid 65628;
    procedure ViewTranslateplusy; dispid 65629;
    procedure ViewRotXMinusNinety; dispid 65630;
    procedure ViewRotYMinusNinety; dispid 65631;
    procedure ViewRotYPlusNinety; dispid 65632;
    procedure ViewZoomin; dispid 65633;
    procedure ViewZoomout; dispid 65634;
    procedure ViewDisplayHiddenremoved; dispid 65635;
    procedure ViewDisplayWireframe; dispid 65636;
    procedure ViewDisplayShaded; dispid 65637;
    procedure ViewRwShading; dispid 65638;
    procedure ViewOglShading; dispid 65639;
    procedure ViewZoomtofit; dispid 65640;
    procedure ViewRotate; dispid 65641;
    procedure ViewTranslate; dispid 65642;
    procedure ViewZoomto; dispid 65643;
    procedure ViewDisplayHiddengreyed; dispid 65644;
    procedure ViewDisplayFaceted; dispid 65645;
    procedure ViewConstraint; dispid 65646;
    procedure UserFavors; dispid 65647;
    procedure FeatureCirPattern(num: Integer; spacing: Double; flipDir: WordBool; 
                                const dName: WideString); dispid 65648;
    procedure EditSketch; dispid 65649;
    procedure FeatEdit; dispid 65650;
    procedure FeatEditDef; dispid 65651;
    procedure InsertPoint; dispid 65652;
    procedure InsertFamilyTableNew; dispid 65653;
    procedure Dummy1; dispid 65654;
    procedure InsertFamilyTableEdit; dispid 65655;
    procedure Dummy2; dispid 65656;
    procedure ToolsMacro; dispid 65657;
    procedure ToolsGrid; dispid 65658;
    procedure SketchCenterline; dispid 65659;
    procedure SketchAlign; dispid 65660;
    procedure SketchArc; dispid 65661;
    procedure SketchTangentArc; dispid 65662;
    procedure SketchCircle; dispid 65663;
    procedure SketchUndo; dispid 65664;
    procedure UserPreferences; dispid 65665;
    procedure Lights; dispid 65666;
    procedure SketchConstrainCoincident; dispid 65667;
    procedure SketchConstrainConcentric; dispid 65668;
    procedure SketchConstrainPerp; dispid 65669;
    procedure SketchConstrainTangent; dispid 65670;
    procedure SketchConstrainParallel; dispid 65671;
    procedure SketchUseEdge; dispid 65672;
    procedure SketchUseEdgeCtrline; dispid 65673;
    procedure SketchMirror; dispid 65674;
    procedure Save; dispid 65675;
    procedure Close; dispid 65676;
    procedure ViewDispRefaxes; dispid 65677;
    procedure ViewDispRefplanes; dispid 65678;
    procedure InsertSketch; dispid 65679;
    procedure InsertProtrusionSwept(propagate: WordBool; alignment: WordBool; 
                                    keepNormalConstant: WordBool); dispid 65680;
    procedure InsertProtrusionBlend(closed: WordBool); dispid 65681;
    procedure ToolsMassProps; dispid 65682;
    procedure PropertySheet; dispid 65683;
    procedure BlankRefGeom; dispid 65684;
    procedure UnBlankRefGeom; dispid 65685;
    procedure EditDelete; dispid 65686;
    procedure InsertProjectedSketch; dispid 65687;
    function CreatePlaneFixed(P1: OleVariant; P2: OleVariant; P3: OleVariant; useGlobal: WordBool): WordBool; dispid 65688;
    procedure Dummy5; dispid 65689;
    procedure Dummy6; dispid 65690;
    procedure DebugCheckBody; dispid 65691;
    procedure Dummy8; dispid 65692;
    procedure DimPreferences; dispid 65693;
    procedure UnblankSketch; dispid 65694;
    procedure EditSketchOrSingleSketchFeature; dispid 65695;
    procedure DebugCheckIgesGeom; dispid 65696;
    procedure BlankSketch; dispid 65697;
    function GetDefaultTextHeight: Double; dispid 65698;
    function IsActive(const compStr: WideString): WordBool; dispid 65699;
    function CreateEllipse(center: OleVariant; major: OleVariant; minor: OleVariant): WordBool; dispid 65700;
    function CreateEllipseVB(centerX: Double; centerY: Double; centerZ: Double; majorX: Double; 
                             majorY: Double; majorZ: Double; minorX: Double; minorY: Double; 
                             minorZ: Double): WordBool; dispid 65701;
    function CreateEllipticalArcByCenter(center: OleVariant; major: OleVariant; minor: OleVariant; 
                                         start: OleVariant; end_: OleVariant): WordBool; dispid 65702;
    function CreateEllipticalArcByCenterVB(centerX: Double; centerY: Double; centerZ: Double; 
                                           majorX: Double; majorY: Double; majorZ: Double; 
                                           minorX: Double; minorY: Double; minorZ: Double; 
                                           startX: Double; startY: Double; startZ: Double; 
                                           endX: Double; endY: Double; endZ: Double): WordBool; dispid 65703;
    function GetActiveSketch: IDispatch; dispid 65704;
    function IGetActiveSketch: ISketch; dispid 65713;
    function GetTessellationQuality: Integer; dispid 65705;
    procedure SetTessellationQuality(qualityNum: Integer); dispid 65706;
    function Parameter(const stringIn: WideString): IDispatch; dispid 65707;
    function IParameter(const stringIn: WideString): IDimension; dispid 65714;
    function SelectByID(const selID: WideString; const selParams: WideString; x: Double; y: Double; 
                        z: Double): WordBool; dispid 65708;
    function AndSelectByID(const selID: WideString; const selParams: WideString; x: Double; 
                           y: Double; z: Double): WordBool; dispid 65709;
    procedure Insert3DSketch; dispid 65710;
    function GetLightSourceName(Id: Integer): WideString; dispid 65715;
    function AddLightSource(const idName: WideString; lTyp: SYSINT; const userName: WideString): WordBool; dispid 65720;
    function AddLightSourceExtProperty(Id: Integer; PropertyExtension: OleVariant): Integer; dispid 65721;
    procedure ResetLightSourceExtProperty(Id: Integer); dispid 65722;
    procedure DeleteLightSource(Id: Integer); dispid 65723;
    function GetLightSourceExtProperty(Id: Integer; PropertyId: Integer): OleVariant; dispid 65724;
    function AddLightToScene(const lpszNewValue: WideString): Integer; dispid 65725;
    function AddSceneExtProperty(PropertyExtension: OleVariant): Integer; dispid 65726;
    procedure ResetSceneExtProperty; dispid 65727;
    function GetSceneExtProperty(PropertyId: Integer): OleVariant; dispid 65728;
    procedure FileSummaryInfo; dispid 65729;
    function GetGridSettings: OleVariant; dispid 65730;
    procedure ToolsSketchTranslate; dispid 65731;
    procedure ToolsDistance; dispid 65732;
    procedure SkToolsAutoConstr; dispid 65733;
    procedure ToolsSketchScale; dispid 65734;
    procedure Paste; dispid 65735;
    procedure ToolsConfiguration; dispid 65736;
    procedure EntityProperties; dispid 65737;
    function GetArcCentersDisplayed: WordBool; dispid 65738;
    procedure SetArcCentersDisplayed(setting: WordBool); dispid 65739;
    procedure AutoSolveToggle; dispid 65740;
    procedure Dummy7; dispid 65741;
    function IGetLines: Double; dispid 65742;
    function GetLineCount: Integer; dispid 65743;
    procedure ICreateEllipse(var center: Double; var major: Double; var minor: Double); dispid 65744;
    procedure ICreateEllipticalArcByCenter(var center: Double; var major: Double; 
                                           var minor: Double; var start: Double; var end_: Double); dispid 65745;
    function ILightSourcePropertyValues(Id: Integer): Double; dispid 65746;
    procedure InsertCutSwept(propagate: WordBool; alignment: WordBool; keepNormalConstant: WordBool); dispid 65747;
    procedure InsertCutBlend(closed: WordBool); dispid 65748;
    procedure InsertHelix(reversed: WordBool; clockwised: WordBool; tapered: WordBool; 
                          outward: WordBool; helixdef: Integer; height: Double; pitch: Double; 
                          revolution: Double; taperangle: Double; startangle: Double); dispid 65749;
    procedure ICreateLine(var P1: Double; var P2: Double); dispid 65750;
    procedure ICreateCenterLine(var P1: Double; var P2: Double); dispid 65751;
    procedure ICreateArc(var P1: Double; var P2: Double; var P3: Double; dir: Smallint); dispid 65752;
    procedure ICreateCircleByRadius(var P1: Double; radius: Double); dispid 65753;
    procedure GraphicsRedraw; dispid 65754;
    function GetVisibilityOfConstructPlanes: WordBool; dispid 65755;
    function GetDisplayWhenAdded: WordBool; dispid 65756;
    procedure SetDisplayWhenAdded(setting: WordBool); dispid 65757;
    function GetAddToDB: WordBool; dispid 65758;
    procedure SetAddToDB(setting: WordBool); dispid 65759;
    function DeSelectByID(const selID: WideString; const selParams: WideString; x: Double; 
                          y: Double; z: Double): WordBool; dispid 65760;
    property Visible: WordBool dispid 65761;
    procedure PrintDirect; dispid 65762;
    procedure PrintPreview; dispid 65763;
    procedure Quit; dispid 65764;
    procedure CreatePlaneThru3Points; dispid 65765;
    procedure ViewRotXPlusNinety; dispid 65766;
    function GetUnits: OleVariant; dispid 65767;
    procedure SetAngularUnits(uType: Smallint; fractBase: Smallint; fractDenom: Smallint; 
                              sigDigits: Smallint); dispid 65768;
    function GetAngularUnits: OleVariant; dispid 65769;
    function IGetUnits: Smallint; dispid 65770;
    procedure ISetAngularUnits(uType: Smallint; fractBase: Smallint; fractDenom: Smallint; 
                               sigDigits: Smallint); dispid 65771;
    function IGetAngularUnits: Smallint; dispid 65772;
    procedure ShowConfiguration(const configurationName: WideString); dispid 65773;
    procedure ResetConfiguration; dispid 65774;
    procedure AddConfiguration(const Name: WideString; const comment: WideString; 
                               const alternateName: WideString; suppressByDefault: WordBool; 
                               hideByDefault: WordBool; minFeatureManager: WordBool; 
                               inheritProperties: WordBool; flags: UINT); dispid 65775;
    procedure DeleteConfiguration(const configurationName: WideString); dispid 65776;
    procedure EditConfiguration(const Name: WideString; const newName: WideString; 
                                const comment: WideString; const alternateName: WideString; 
                                suppressByDefault: WordBool; hideByDefault: WordBool; 
                                minFeatureManager: WordBool; inheritProperties: WordBool; 
                                flags: UINT); dispid 65777;
    procedure CreatePlanePerCurveAndPassPoint(origAtCurve: WordBool); dispid 65778;
    function CreateFeatureMgrView(var bitmap: Integer): IDispatch; dispid 65779;
    function AddFeatureMgrView(var bitmap: Integer; var appView: Integer): WordBool; dispid 65780;
    function GetStandardViewRotation(viewId: Integer): OleVariant; dispid 65781;
    function IGetStandardViewRotation(viewId: Integer): Double; dispid 65782;
    procedure FeatureExtruRefSurface(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                                     t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                                     dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; 
                                     dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                                     offsetReverse2: WordBool); dispid 65783;
    function IGet3rdPartyStorage(const stringIn: WideString; isStoring: WordBool): IUnknown; dispid 65784;
    procedure DeleteFeatureMgrView(var appView: Integer); dispid 65785;
    function GetMassProperties: OleVariant; dispid 65786;
    function IGetMassProperties(var mPropsData: Double): WordBool; dispid 65787;
    function GetLightSourceCount: Integer; dispid 65788;
    function GetLightSourceIdFromName(const lightName: WideString): Integer; dispid 65789;
    procedure SetNextSelectionGroupId(Id: Integer); dispid 65790;
    procedure ISetNextSelectionGroupId(Id: Integer); dispid 65791;
    function InsertMidSurfaceExt(placement: Double; knitFlag: WordBool): IDispatch; dispid 65792;
    function IInsertMidSurfaceExt(placement: Double; knitFlag: WordBool): IMidSurface; dispid 65793;
    procedure ICreatePlaneFixed(var P1: Double; var P2: Double; var P3: Double; useGlobal: WordBool); dispid 65794;
    function SelectByMark(const selID: WideString; const selParams: WideString; x: Double; 
                          y: Double; z: Double; mark: Integer): WordBool; dispid 65795;
    function AndSelectByMark(const selID: WideString; const selParams: WideString; x: Double; 
                             y: Double; z: Double; mark: Integer): WordBool; dispid 65796;
    function GetDependencies(traverseflag: Integer; searchflag: Integer): OleVariant; dispid 65797;
    function IGetDependencies(traverseflag: Integer; searchflag: Integer): WideString; dispid 65798;
    function GetNumDependencies(traverseflag: Integer; searchflag: Integer): Integer; dispid 65799;
    function IGetNumDependencies(traverseflag: Integer; searchflag: Integer): Integer; dispid 65800;
    function FirstFeature: IDispatch; dispid 65801;
    function IFirstFeature: IFeature; dispid 65802;
    procedure UnderiveSketch; dispid 65803;
    procedure DeriveSketch; dispid 65804;
    function IsExploded: WordBool; dispid 65805;
    function DeleteSelection(confirmFlag: WordBool): WordBool; dispid 65806;
    function DeleteNamedView(const viewname: WideString): WordBool; dispid 65807;
    function SetLightSourceName(Id: Integer; const newName: WideString): WordBool; dispid 65808;
    procedure Insert3DSplineCurve(curveClosed: WordBool); dispid 65809;
    function SetLightSourcePropertyValuesVB(const idName: WideString; lType: SYSINT; diff: Double; 
                                            rgbColor: Integer; dist: Double; dirX: Double; 
                                            dirY: Double; dirZ: Double; spotDirX: Double; 
                                            spotDirY: Double; spotDirZ: Double; spotAngle: Double; 
                                            fallOff0: Double; fallOff1: Double; fallOff2: Double; 
                                            ambient: Double; specular: Double; 
                                            spotExponent: Double; bDisable: WordBool): WordBool; dispid 65810;
    function ICreateFeatureMgrView(var bitmap: Integer): IFeatMgrView; dispid 65811;
    function SelectedEdgeProperties(const edgeName: WideString): WordBool; dispid 65812;
    function SelectedFaceProperties(rgbColor: Integer; ambient: Double; diffuse: Double; 
                                    specular: Double; shininess: Double; transparency: Double; 
                                    emission: Double; usePartProps: WordBool; 
                                    const faceName: WideString): WordBool; dispid 65813;
    function SelectedFeatureProperties(rgbColor: Integer; ambient: Double; diffuse: Double; 
                                       specular: Double; shininess: Double; transparency: Double; 
                                       emission: Double; usePartProps: WordBool; 
                                       suppressed: WordBool; const featureName: WideString): WordBool; dispid 65814;
    procedure InsertSplitLineSil; dispid 65815;
    procedure InsertSplitLineProject(isDirectional: WordBool; flipDir: WordBool); dispid 65816;
    procedure InsertRib(is2Sided: WordBool; reverseThicknessDir: WordBool; thickness: Double; 
                        referenceEdgeIndex: Integer; reverseMaterialDir: WordBool; 
                        isDrafted: WordBool; draftOutward: WordBool; draftAngle: Double); dispid 65817;
    function AddRadialDimension(x: Double; y: Double; z: Double): WordBool; dispid 65818;
    function AddDiameterDimension(x: Double; y: Double; z: Double): WordBool; dispid 65819;
    function GetModelViewNames: OleVariant; dispid 65820;
    function IGetModelViewNames: WideString; dispid 65821;
    function GetModelViewCount: SYSINT; dispid 65822;
    function GetUserPreferenceDoubleValue(userPreferenceValue: Integer): Double; dispid 65823;
    function SetUserPreferenceDoubleValue(userPreferenceValue: Integer; Value: Double): WordBool; dispid 65824;
    procedure ViewDisplayCurvature; dispid 65825;
    procedure Scale; dispid 65826;
    procedure AddIns; dispid 65827;
    function InsertCurveFile(const fileName: WideString): WordBool; dispid 65828;
    procedure InsertCurveFileBegin; dispid 65829;
    function InsertCurveFilePoint(x: Double; y: Double; z: Double): WordBool; dispid 65830;
    function InsertCurveFileEnd: WordBool; dispid 65831;
    function ChangeSketchPlane: WordBool; dispid 65832;
    procedure ViewOrientationUndo; dispid 65833;
    procedure PrintOut(fromPage: Integer; toPage: Integer; numCopies: Integer; collate: WordBool; 
                       const printer: WideString; Scale: Double; printToFile: WordBool); dispid 65834;
    procedure SketchOffsetEntities(offset: Double; flip: WordBool); dispid 65835;
    procedure InsertLibraryFeature(const libFeatPartNameIn: WideString); dispid 65836;
    procedure SketchModifyTranslate(startX: Double; startY: Double; endX: Double; endY: Double); dispid 65837;
    procedure SketchModifyRotate(centerX: Double; centerY: Double; angle: Double); dispid 65838;
    procedure SketchModifyFlip(axisFlag: SYSINT); dispid 65839;
    function SketchModifyScale(scaleFactor: Double): WordBool; dispid 65840;
    function GetActiveConfiguration: IDispatch; dispid 65841;
    function IGetActiveConfiguration: IConfiguration; dispid 65842;
    function GetUserPreferenceToggle(userPreferenceToggle: Integer): WordBool; dispid 65843;
    function SetUserPreferenceToggle(userPreferenceValue: Integer; onFlag: WordBool): WordBool; dispid 65844;
    procedure InsertSweepRefSurface(propagate: WordBool; twistCtrlOption: Smallint; 
                                    keepTangency: WordBool; forceNonRational: WordBool); dispid 65845;
    procedure InsertLoftRefSurface(closed: WordBool; keepTangency: WordBool; 
                                   forceNonRational: WordBool); dispid 65846;
    procedure InsertProtrusionSwept2(propagate: WordBool; alignment: WordBool; 
                                     twistCtrlOption: Smallint; keepTangency: WordBool; 
                                     forceNonRational: WordBool); dispid 65847;
    procedure InsertProtrusionBlend2(closed: WordBool; keepTangency: WordBool; 
                                     forceNonRational: WordBool); dispid 65848;
    procedure InsertCutSwept2(propagate: WordBool; alignment: WordBool; twistCtrlOption: Smallint; 
                              keepTangency: WordBool; forceNonRational: WordBool); dispid 65849;
    procedure InsertCutBlend2(closed: WordBool; keepTangency: WordBool; forceNonRational: WordBool); dispid 65850;
    function IsEditingSelf: WordBool; dispid 65851;
    procedure ShowNamedView2(const vName: WideString; viewId: Integer); dispid 65852;
    procedure InsertDome(height: Double; reverseDir: WordBool; doEllipticSurface: WordBool); dispid 65853;
    property MaterialUserName: WideString dispid 65854;
    property MaterialIdName: WideString dispid 65855;
    property MaterialPropertyValues: OleVariant dispid 65856;
    function IMaterialPropertyValues: Double; dispid 65857;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; dispid 65858;
    function GetPropertyExtension(Id: Integer): OleVariant; dispid 65859;
    procedure ResetPropertyExtension; dispid 65860;
    function GetUpdateStamp: Integer; dispid 65861;
    procedure ViewZoomTo2(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; z2: Double); dispid 65862;
    procedure ScreenRotate; dispid 65863;
    property PrintSetup[setupType: Integer]: Smallint dispid 65864;
    procedure GraphicsRedraw2; dispid 65865;
    procedure InsertCosmeticThread(type_: Smallint; depth: Double; length: Double; 
                                   const note: WideString); dispid 65866;
    procedure HideCosmeticThread; dispid 65867;
    procedure ShowCosmeticThread; dispid 65868;
    procedure SimpleHole2(dia: Double; sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                          t2: Integer; d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool); dispid 65869;
    procedure IRelease3rdPartyStorage(const stringIn: WideString); dispid 65870;
    function FeatureRevolve2(angle: Double; reverseDir: WordBool; angle2: Double; revType: Integer; 
                             options: Integer): Integer; dispid 65871;
    function FeatureRevolveCut2(angle: Double; reverseDir: WordBool; angle2: Double; 
                                revType: Integer; options: Integer): Integer; dispid 65872;
    procedure SetSaveFlag; dispid 65873;
    function GetExternalReferenceName: WideString; dispid 65874;
    function SelectByRay(doubleInfoIn: OleVariant; typeWanted: Integer): WordBool; dispid 65875;
    function ISelectByRay(var pointIn: Double; var vectorIn: Double; radiusIn: Double; 
                          typeWanted: Integer): WordBool; dispid 65876;
    procedure SetSceneBkgDIB(l_dib: Integer); dispid 65877;
    property SceneBkgImageFileName: WideString dispid 65878;
    procedure InsertBkgImage(const newName: WideString); dispid 65879;
    procedure DeleteBkgImage; dispid 65880;
    procedure InsertSplinePoint(x: Double; y: Double; z: Double); dispid 65881;
    procedure InsertLoftRefSurface2(closed: WordBool; keepTangency: WordBool; 
                                    forceNonRational: WordBool; tessToleranceFactor: Double; 
                                    startMatchingType: Smallint; endMatchingType: Smallint); dispid 65882;
    procedure InsertProtrusionBlend3(closed: WordBool; keepTangency: WordBool; 
                                     forceNonRational: WordBool; tessToleranceFactor: Double; 
                                     startMatchingType: Smallint; endMatchingType: Smallint); dispid 65883;
    procedure InsertCutBlend3(closed: WordBool; keepTangency: WordBool; forceNonRational: WordBool; 
                              tessToleranceFactor: Double; startMatchingType: Smallint; 
                              endMatchingType: Smallint); dispid 65884;
    procedure AlignDimensions; dispid 65885;
    procedure BreakDimensionAlignment; dispid 65886;
    procedure SketchFillet1(rad: Double); dispid 65887;
    procedure FeatureChamferType(chamferType: Smallint; Width: Double; angle: Double; 
                                 flip: WordBool; otherDist: Double; vertexChamDist1: Double; 
                                 vertexChamDist2: Double; vertexChamDist3: Double); dispid 65888;
    procedure FeatureCutThin(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                             d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                             ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                             offsetReverse1: WordBool; offsetReverse2: WordBool; thk1: Double; 
                             thk2: Double; endThk: Double; revThinDir: Integer; capEnds: Integer; 
                             addBends: WordBool; bendRad: Double); dispid 65889;
    procedure FeatureBossThin(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                              t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                              dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; dang1: Double; 
                              dang2: Double; offsetReverse1: WordBool; offsetReverse2: WordBool; 
                              thk1: Double; thk2: Double; endThk: Double; revThinDir: Integer; 
                              capEnds: Integer; addBends: WordBool; bendRad: Double); dispid 65890;
    function InsertDatumTargetSymbol(const datum1: WideString; const datum2: WideString; 
                                     const datum3: WideString; areaStyle: Smallint; 
                                     areaOutside: WordBool; value1: Double; value2: Double; 
                                     const valueStr1: WideString; const valueStr2: WideString; 
                                     arrowsSmart: WordBool; arrowStyle: Smallint; 
                                     leaderLineStyle: Smallint; leaderBent: WordBool; 
                                     showArea: WordBool; showSymbol: WordBool): WordBool; dispid 65891;
    function EditDatumTargetSymbol(const datum1: WideString; const datum2: WideString; 
                                   const datum3: WideString; areaStyle: Smallint; 
                                   areaOutside: WordBool; value1: Double; value2: Double; 
                                   const valueStr1: WideString; const valueStr2: WideString; 
                                   arrowsSmart: WordBool; arrowStyle: Smallint; 
                                   leaderLineStyle: Smallint; leaderBent: WordBool; 
                                   showArea: WordBool; showSymbol: WordBool): WordBool; dispid 65892;
    procedure InsertBOMBalloon; dispid 65893;
    function FeatureReferenceCurve(numOfCurves: Integer; baseCurves: OleVariant; merge: WordBool; 
                                   const fromFileName: WideString; out errorCode: Integer): IDispatch; dispid 65894;
    function IFeatureReferenceCurve(numOfCurves: Integer; baseCurves: {??PPPUserType1} OleVariant; 
                                    merge: WordBool; const fromFileName: WideString; 
                                    out errorCode: Integer): IReferenceCurve; dispid 65895;
    procedure FontBold(Bold: WordBool); dispid 65896;
    procedure FontItalic(Italic: WordBool); dispid 65897;
    procedure FontUnderline(Underline: WordBool); dispid 65898;
    procedure FontFace(const face: WideString); dispid 65899;
    procedure FontPoints(Points: Smallint); dispid 65900;
    procedure FontUnits(units: Double); dispid 65901;
    function SketchSplineByEqnParams(paramsIn: OleVariant): WordBool; dispid 65902;
    procedure AlignParallelDimensions; dispid 65903;
    procedure SetBlockingState(stateIn: Integer); dispid 65904;
    procedure ResetBlockingState; dispid 65905;
    function GetSceneBkgDIB: Integer; dispid 65906;
    procedure InsertHatchedFace; dispid 65907;
    function GetColorTable: IDispatch; dispid 65908;
    function IGetColorTable: IColorTable; dispid 65909;
    procedure InsertSweepRefSurface2(propagate: WordBool; twistCtrlOption: Smallint; 
                                     keepTangency: WordBool; forceNonRational: WordBool; 
                                     startMatchingType: Smallint; endMatchingType: Smallint); dispid 65910;
    procedure InsertProtrusionSwept3(propagate: WordBool; alignment: WordBool; 
                                     twistCtrlOption: Smallint; keepTangency: WordBool; 
                                     forceNonRational: WordBool; startMatchingType: Smallint; 
                                     endMatchingType: Smallint); dispid 65911;
    procedure InsertCutSwept3(propagate: WordBool; alignment: WordBool; twistCtrlOption: Smallint; 
                              keepTangency: WordBool; forceNonRational: WordBool; 
                              startMatchingType: Smallint; endMatchingType: Smallint); dispid 65912;
    function IsOpenedViewOnly: WordBool; dispid 65913;
    function IsOpenedReadOnly: WordBool; dispid 65914;
    procedure ViewZoomToSelection; dispid 65915;
    procedure FeatureBossThicken(thickness: Double; direction: Integer; faceIndex: Integer); dispid 65916;
    procedure FeatureCutThicken(thickness: Double; direction: Integer; faceIndex: Integer); dispid 65917;
    function InsertAxis: WordBool; dispid 65918;
    procedure EditUndo(nSteps: UINT); dispid 65919;
    procedure SelectMidpoint; dispid 65920;
    function ISketchSplineByEqnParams(var propArray: SYSINT; var knotsArray: Double; 
                                      var cntrlPntCoordArray: Double): Integer; dispid 65921;
    function VersionHistory: OleVariant; dispid 65922;
    function IVersionHistory: WideString; dispid 65923;
    function IGetVersionHistoryCount: SYSINT; dispid 65924;
    procedure Rebuild(options: Integer); dispid 65925;
    procedure InsertFeatureShellAddThickness(thickness: Double); dispid 65926;
    procedure InsertOffsetSurface(thickness: Double; reverse: WordBool); dispid 65927;
    procedure SimplifySpline(toleranceIn: Double); dispid 65928;
    property SummaryInfo[FieldId: Integer]: WideString dispid 65929;
    property CustomInfo[const FieldName: WideString]: WideString dispid 65930;
    function GetCustomInfoCount: Integer; dispid 65931;
    function GetCustomInfoType(const FieldName: WideString): WideString; dispid 65932;
    function GetCustomInfoNames: OleVariant; dispid 65933;
    function IGetCustomInfoNames: WideString; dispid 65934;
    function AddCustomInfo(const FieldName: WideString; const FieldType: WideString; 
                           const FieldValue: WideString): WordBool; dispid 65935;
    function DeleteCustomInfo(const FieldName: WideString): WordBool; dispid 65936;
    procedure PrintOut2(fromPage: Integer; toPage: Integer; numCopies: Integer; collate: WordBool; 
                        const printer: WideString; Scale: Double; printToFile: WordBool; 
                        const ptfName: WideString); dispid 65937;
    function SetReadOnlyState(setReadOnly: WordBool): WordBool; dispid 65938;
    function InsertFamilyTableOpen(const fileName: WideString): WordBool; dispid 65939;
    function MultiSelectByRay(doubleInfoIn: OleVariant; typeWanted: Integer; append: WordBool): WordBool; dispid 65940;
    function IMultiSelectByRay(var pointIn: Double; var vectorIn: Double; radiusIn: Double; 
                               typeWanted: Integer; append: WordBool): WordBool; dispid 65941;
    procedure InsertNewNote3(const upperText: WideString; noLeader: WordBool; bentLeader: WordBool; 
                             arrowStyle: Smallint; leaderSide: Smallint; angle: Double; 
                             balloonStyle: Smallint; balloonFit: Smallint; smartArrow: WordBool); dispid 65942;
    procedure InsertWeldSymbol2(const dim1: WideString; const symbol: WideString; 
                                const dim2: WideString; symmetric: WordBool; fieldWeld: WordBool; 
                                showOtherSide: WordBool; dashOnTop: WordBool; peripheral: WordBool; 
                                hasProcess: WordBool; const processValue: WideString); dispid 65943;
    function InsertSurfaceFinishSymbol2(symType: Integer; leaderType: Integer; locX: Double; 
                                        locY: Double; locZ: Double; laySymbol: Integer; 
                                        arrowType: Integer; const machAllowance: WideString; 
                                        const otherVals: WideString; const prodMethod: WideString; 
                                        const sampleLen: WideString; 
                                        const maxRoughness: WideString; 
                                        const minRoughness: WideString; 
                                        const roughnessSpacing: WideString): WordBool; dispid 65944;
    function SaveSilent: Integer; dispid 65945;
    function SaveAsSilent(const newName: WideString; saveAsCopy: WordBool): Integer; dispid 65946;
    function AddCustomInfo2(const FieldName: WideString; FieldType: Integer; 
                            const FieldValue: WideString): WordBool; dispid 65947;
    function GetCustomInfoType2(const FieldName: WideString): Integer; dispid 65948;
    function InsertRefPoint: WordBool; dispid 65949;
    function FeatureFillet2(r1: Double; propagate: WordBool; ftyp: WordBool; varRadTyp: WordBool; 
                            overFlowType: Integer; nRadii: SYSINT; radii: OleVariant): Integer; dispid 65950;
    function IFeatureFillet2(r1: Double; propagate: WordBool; ftyp: WordBool; varRadTyp: WordBool; 
                             overFlowType: Integer; nRadii: SYSINT; var radii: Double): Integer; dispid 65951;
    function GetFirstAnnotation: IDispatch; dispid 65952;
    function IGetFirstAnnotation: IAnnotation; dispid 65953;
    function InsertCoordinateSystem(xFlippedIn: WordBool; yFlippedIn: WordBool; zFlippedIn: WordBool): WordBool; dispid 65954;
    function GetToolbarVisibility(toolbar: Integer): WordBool; dispid 65955;
    procedure SetToolbarVisibility(toolbar: Integer; visibility: WordBool); dispid 65956;
    procedure ViewDispCoordinateSystems; dispid 65957;
    procedure ViewDispTempRefaxes; dispid 65958;
    procedure ViewDispRefPoints; dispid 65959;
    procedure ViewDispOrigins; dispid 65960;
    function GetCoordinateSystemXformByName(const nameIn: WideString): OleVariant; dispid 65961;
    function IGetCoordinateSystemXformByName(const nameIn: WideString): Double; dispid 65962;
    function GetCurrentCoordinateSystemName: WideString; dispid 65963;
    function EnumModelViews: IEnumModelViews; dispid 65964;
    function InsertCompositeCurve: WordBool; dispid 65965;
    procedure SketchParabola(val1: Double; val2: Double; z1: Double; val3: Double; val4: Double; 
                             z2: Double; val5: Double; val6: Double; z3: Double; val7: Double; 
                             val8: Double; z4: Double); dispid 65966;
    procedure InsertRadiateSurface(distance: Double; flipDir: WordBool; tangentPropagate: WordBool); dispid 65967;
    procedure InsertSewRefSurface; dispid 65968;
    function InsertShape(pressureOn: Integer; tangentsOn: Integer; pressureGain: Double; 
                         tangentGain: Double; curveSpringGain: Double; alpha: Double; beta: Double; 
                         gamma: Double; delta: Double; degree: Integer; split: Integer; 
                         tuning: Integer): Integer; dispid 65969;
    procedure InsertMfDraft2(angle: Double; flipDir: WordBool; isEdgeDraft: WordBool; 
                             propType: Integer; stepDraft: WordBool); dispid 65970;
    function GetConfigurationCount: Integer; dispid 65971;
    function GetConfigurationNames: OleVariant; dispid 65972;
    function IGetConfigurationNames(var count: Integer): WideString; dispid 65973;
    procedure FeatureCut2(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                          d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool; 
                          keepPieceIndex: Integer); dispid 65974;
    procedure InsertCutSurface(flip: WordBool; keepPieceIndex: Integer); dispid 65975;
    function GetDetailingDefaults: IDispatch; dispid 65976;
    function IGetDetailingDefaults: IDetailingDefaults; dispid 65977;
    function ListExternalFileReferencesCount(useSearchRules: WordBool): Integer; dispid 65978;
    function ListExternalFileReferences(useSearchRules: WordBool): OleVariant; dispid 65979;
    function IListExternalFileReferences(useSearchRules: WordBool; numRefs: Integer): WideString; dispid 65980;
    function SketchSplineByEqnParams2(paramsIn: OleVariant): WordBool; dispid 65981;
    function GetFirstModelView: IDispatch; dispid 65982;
    function IGetFirstModelView: IModelView; dispid 65983;
    function InsertPlanarRefSurface: WordBool; dispid 65984;
    function GetNext: IDispatch; dispid 65985;
    function GetSaveFlag: WordBool; dispid 65986;
    function AddCustomInfo3(const configuration: WideString; const FieldName: WideString; 
                            FieldType: Integer; const FieldValue: WideString): WordBool; dispid 65987;
    property CustomInfo2[const configuration: WideString; const FieldName: WideString]: WideString dispid 65988;
    function DeleteCustomInfo2(const configuration: WideString; const FieldName: WideString): WordBool; dispid 65989;
    function GetCustomInfoCount2(const configuration: WideString): Integer; dispid 65990;
    function GetCustomInfoNames2(const configuration: WideString): OleVariant; dispid 65991;
    function IGetCustomInfoNames2(const configuration: WideString): WideString; dispid 65992;
    function GetCustomInfoType3(const configuration: WideString; const FieldName: WideString): Integer; dispid 65993;
    function GetConsiderLeadersAsLines: WordBool; dispid 65994;
    function SetConsiderLeadersAsLines(leadersAsLines: WordBool): WordBool; dispid 65995;
    procedure InsertRevolvedRefSurface(angle: Double; reverseDir: WordBool; angle2: Double; 
                                       revType: SYSINT); dispid 65996;
    function GetBendState: Integer; dispid 65997;
    function SetBendState(bendState: Integer): Integer; dispid 65998;
    property ShowFeatureErrorDialog: WordBool dispid 65999;
    procedure ClearUndoList; dispid 66000;
    function GetFeatureManagerWidth: Integer; dispid 66001;
    function SetFeatureManagerWidth(Width: Integer): Integer; dispid 66002;
    function InsertProjectedSketch2(reverse: Integer): IDispatch; dispid 66003;
    function IInsertProjectedSketch2(reverse: Integer): IFeature; dispid 66004;
    function GetFeatureCount: Integer; dispid 66005;
    function FeatureByPositionReverse(num: Integer): IDispatch; dispid 66006;
    function IFeatureByPositionReverse(num: Integer): IFeature; dispid 66007;
    function RayIntersections(bodiesIn: OleVariant; basePointsIn: OleVariant; 
                              vectorsIn: OleVariant; options: Integer; hitRadius: Double; 
                              offset: Double): Integer; dispid 66008;
    function IRayIntersections(var bodiesIn: IBody; numBodies: Integer; var basePointsIn: Double; 
                               var vectorsIn: Double; numRays: Integer; options: Integer; 
                               hitRadius: Double; offset: Double): Integer; dispid 66009;
    function GetRayIntersectionsPoints: OleVariant; dispid 66010;
    function IGetRayIntersectionsPoints: Double; dispid 66011;
    function GetRayIntersectionsTopology: OleVariant; dispid 66012;
    function IGetRayIntersectionsTopology: IUnknown; dispid 66013;
    procedure EditSeedFeat; dispid 66014;
    function EditSuppress: WordBool; dispid 66015;
    function EditUnsuppress: WordBool; dispid 66016;
    function EditUnsuppressDependent: WordBool; dispid 66017;
    function EditRollback: WordBool; dispid 66018;
    function Save2(silent: WordBool): Integer; dispid 66019;
    function SaveAs2(const newName: WideString; saveAsVersion: Integer; saveAsCopy: WordBool; 
                     silent: WordBool): Integer; dispid 66020;
    procedure SetPopupMenuMode(modeIn: SYSINT); dispid 66021;
    function GetPopupMenuMode: SYSINT; dispid 66022;
    procedure CloseFamilyTable; dispid 66023;
    procedure CreatePlaneAtSurface(interIndex: SYSINT; projOpt: WordBool; reverseDir: WordBool; 
                                   normalPlane: WordBool; angle: Double); dispid 66024;
    procedure SketchOffset(offset: Double; contourMode: WordBool); dispid 66025;
    function CreateLinearSketchStepAndRepeat(numX: Integer; numY: Integer; spacingX: Double; 
                                             spacingY: Double; angleX: Double; angleY: Double; 
                                             const deleteInstances: WideString): WordBool; dispid 66026;
    function SetAmbientLightProperties(const Name: WideString; ambient: Double; diffuse: Double; 
                                       specular: Double; colour: Integer; enabled: WordBool; 
                                       fixed: WordBool): WordBool; dispid 66027;
    function GetAmbientLightProperties(const Name: WideString; var ambient: Double; 
                                       var diffuse: Double; var specular: Double; 
                                       var colour: Integer; var enabled: WordBool; 
                                       var fixed: WordBool): WordBool; dispid 66028;
    function SetPointLightProperties(const Name: WideString; ambient: Double; diffuse: Double; 
                                     specular: Double; colour: Integer; enabled: WordBool; 
                                     fixed: WordBool; x: Double; y: Double; z: Double): WordBool; dispid 66029;
    function GetPointLightProperties(const Name: WideString; var ambient: Double; 
                                     var diffuse: Double; var specular: Double; 
                                     var colour: Integer; var enabled: WordBool; 
                                     var fixed: WordBool; var x: Double; var y: Double; 
                                     var z: Double): WordBool; dispid 66030;
    function SetDirectionLightProperties(const Name: WideString; ambient: Double; diffuse: Double; 
                                         specular: Double; colour: Integer; enabled: WordBool; 
                                         fixed: WordBool; x: Double; y: Double; z: Double): WordBool; dispid 66031;
    function GetDirectionLightProperties(const Name: WideString; var ambient: Double; 
                                         var diffuse: Double; var specular: Double; 
                                         var colour: Integer; var enabled: WordBool; 
                                         var fixed: WordBool; var x: Double; var y: Double; 
                                         var z: Double): WordBool; dispid 66032;
    function SetSpotlightProperties(const Name: WideString; ambient: Double; diffuse: Double; 
                                    specular: Double; colour: Integer; enabled: WordBool; 
                                    fixed: WordBool; posx: Double; posy: Double; posz: Double; 
                                    targetx: Double; targety: Double; targetz: Double; 
                                    coneAngle: Double): WordBool; dispid 66033;
    function GetSpotlightProperties(const Name: WideString; var ambient: Double; 
                                    var diffuse: Double; var specular: Double; var colour: Integer; 
                                    var enabled: WordBool; var fixed: WordBool; var x: Double; 
                                    var y: Double; var z: Double; var targetx: Double; 
                                    var targety: Double; var targetz: Double; var coneAngle: Double): WordBool; dispid 66034;
    procedure SplitOpenSegment(x: Double; y: Double; z: Double); dispid 66035;
    procedure AutoInferToggle; dispid 66036;
    procedure SketchRectangleAtAnyAngle(val1: Double; val2: Double; z1: Double; val3: Double; 
                                        val4: Double; z2: Double; val3x: Double; val3y: Double; 
                                        z3: Double; val5: WordBool); dispid 66037;
    function CreateCircularSketchStepAndRepeat(arcRadius: Double; arcAngle: Double; 
                                               patternNum: Integer; patternSpacing: Double; 
                                               patternRotate: WordBool; 
                                               const deleteInstances: WideString): WordBool; dispid 66038;
    procedure SplitClosedSegment(x0: Double; y0: Double; z0: Double; x1: Double; y1: Double; 
                                 z1: Double); dispid 66039;
    function IsLightLockedToModel(lightId: Integer): WordBool; dispid 66040;
    function LockLightToModel(lightId: Integer; fix: WordBool): WordBool; dispid 66041;
    function FeatureFillet3(r1: Double; propagate: WordBool; ftyp: SYSINT; varRadTyp: WordBool; 
                            overFlowType: Integer; nRadii: SYSINT; radii: OleVariant; 
                            useHelpPoint: WordBool; useTangentHoldLine: WordBool): Integer; dispid 66042;
    function IFeatureFillet3(r1: Double; propagate: WordBool; ftyp: SYSINT; varRadTyp: WordBool; 
                             overFlowType: Integer; nRadii: SYSINT; var radii: Double; 
                             useHelpPoint: WordBool; useTangentHoldLine: WordBool): Integer; dispid 66043;
    procedure InsertConnectionPoint; dispid 66044;
    procedure InsertRoutePoint; dispid 66045;
    procedure FeatureBossThicken2(thickness: Double; direction: Integer; faceIndex: Integer; 
                                  fillVolume: WordBool); dispid 66046;
    procedure FeatureCutThicken2(thickness: Double; direction: Integer; faceIndex: Integer; 
                                 fillVolume: WordBool); dispid 66047;
    function GetConfigurationByName(const Name: WideString): IDispatch; dispid 66048;
    function IGetConfigurationByName(const Name: WideString): IConfiguration; dispid 66049;
    function CreatePoint2(pointX: Double; pointY: Double; pointZ: Double): IDispatch; dispid 66050;
    function ICreatePoint2(pointX: Double; pointY: Double; pointZ: Double): ISketchPoint; dispid 66051;
    function CreateLine2(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                         p2z: Double): IDispatch; dispid 66052;
    function ICreateLine2(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                          p2z: Double): ISketchSegment; dispid 66053;
    function GetActiveSketch2: IDispatch; dispid 66054;
    function IGetActiveSketch2: ISketch; dispid 66055;
    procedure DrawLightIcons; dispid 66056;
    function GetLayerManager: IDispatch; dispid 66057;
    function IGetLayerManager: ILayerMgr; dispid 66058;
    function CreateCircle2(xC: Double; yC: Double; zc: Double; xp: Double; yp: Double; zp: Double): IDispatch; dispid 66059;
    function ICreateCircle2(xC: Double; yC: Double; zc: Double; xp: Double; yp: Double; zp: Double): ISketchSegment; dispid 66060;
    function CreateCircleByRadius2(xC: Double; yC: Double; zc: Double; radius: Double): IDispatch; dispid 66061;
    function ICreateCircleByRadius2(xC: Double; yC: Double; zc: Double; radius: Double): ISketchSegment; dispid 66062;
    function CreateArc2(xC: Double; yC: Double; zc: Double; xp1: Double; yp1: Double; zp1: Double; 
                        xp2: Double; yp2: Double; zp2: Double; direction: Smallint): IDispatch; dispid 66063;
    function ICreateArc2(xC: Double; yC: Double; zc: Double; xp1: Double; yp1: Double; zp1: Double; 
                         xp2: Double; yp2: Double; zp2: Double; direction: Smallint): ISketchSegment; dispid 66064;
    function CreateEllipse2(centerX: Double; centerY: Double; centerZ: Double; majorX: Double; 
                            majorY: Double; majorZ: Double; minorX: Double; minorY: Double; 
                            minorZ: Double): IDispatch; dispid 66065;
    function ICreateEllipse2(centerX: Double; centerY: Double; centerZ: Double; majorX: Double; 
                             majorY: Double; majorZ: Double; minorX: Double; minorY: Double; 
                             minorZ: Double): ISketchSegment; dispid 66066;
    function CreateEllipticalArc2(centerX: Double; centerY: Double; centerZ: Double; 
                                  majorX: Double; majorY: Double; majorZ: Double; minorX: Double; 
                                  minorY: Double; minorZ: Double; startX: Double; startY: Double; 
                                  startZ: Double; endX: Double; endY: Double; endZ: Double): IDispatch; dispid 66067;
    function ICreateEllipticalArc2(centerX: Double; centerY: Double; centerZ: Double; 
                                   majorX: Double; majorY: Double; majorZ: Double; minorX: Double; 
                                   minorY: Double; minorZ: Double; startX: Double; startY: Double; 
                                   startZ: Double; endX: Double; endY: Double; endZ: Double): ISketchSegment; dispid 66068;
    function CreateSpline(pointData: OleVariant): IDispatch; dispid 66069;
    function ICreateSpline(pointCount: Integer; var pointData: Double): ISketchSegment; dispid 66070;
    procedure ViewZoomtofit2; dispid 66071;
    procedure SetInferenceMode(inferenceMode: WordBool); dispid 66072;
    function GetInferenceMode: WordBool; dispid 66073;
    function SetTitle2(const newTitle: WideString): WordBool; dispid 66074;
    function SketchFillet2(rad: Double; constrainedCorners: Smallint): WordBool; dispid 66075;
    function IsTessellationValid: WordBool; dispid 66076;
    procedure EditRoute; dispid 66077;
    procedure FileReload; dispid 66078;
    function GetDesignTable: IDispatch; dispid 66079;
    function IGetDesignTable: IDesignTable; dispid 66080;
    function GetEntityName(const entity: IDispatch): WideString; dispid 66081;
    function IGetEntityName(const entity: IEntity): WideString; dispid 66082;
    function IGetNext: IModelDoc; dispid 66083;
    function ShowConfiguration2(const configurationName: WideString): WordBool; dispid 66084;
    function AddConfiguration2(const Name: WideString; const comment: WideString; 
                               const alternateName: WideString; suppressByDefault: WordBool; 
                               hideByDefault: WordBool; minFeatureManager: WordBool; 
                               inheritProperties: WordBool; flags: UINT): WordBool; dispid 66085;
    function DeleteConfiguration2(const configurationName: WideString): WordBool; dispid 66086;
    function EditConfiguration2(const Name: WideString; const newName: WideString; 
                                const comment: WideString; const alternateName: WideString; 
                                suppressByDefault: WordBool; hideByDefault: WordBool; 
                                minFeatureManager: WordBool; inheritProperties: WordBool; 
                                flags: UINT): WordBool; dispid 66087;
    function CreateSplineByEqnParams(paramsIn: OleVariant): IDispatch; dispid 66088;
    function ICreateSplineByEqnParams(var propArray: SYSINT; var knotsArray: Double; 
                                      var cntrlPntCoordArray: Double): ISketchSegment; dispid 66089;
    function CreateFeatureMgrView2(var bitmap: Integer; const toolTip: WideString): IDispatch; dispid 66090;
    function ICreateFeatureMgrView2(var bitmap: Integer; const toolTip: WideString): IFeatMgrView; dispid 66091;
    function AddFeatureMgrView2(var bitmap: Integer; var appView: Integer; const toolTip: WideString): WordBool; dispid 66092;
    procedure FeatureCut3(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                          d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool; 
                          keepPieceIndex: Integer); dispid 66093;
    function GetFirstAnnotation2: IDispatch; dispid 66094;
    function IGetFirstAnnotation2: IAnnotation; dispid 66095;
    procedure InsertExtendSurface(extendLinear: WordBool; endCondition: Integer; distance: Double); dispid 66096;
    procedure InsertTangencySurface(oneSide: WordBool; isFlip: WordBool); dispid 66097;
    function CreateSplinesByEqnParams(paramsIn: OleVariant): OleVariant; dispid 66098;
    function ICreateSplinesByEqnParams(var propArray: SYSINT; var knotsArray: Double; 
                                       var cntrlPntCoordArray: Double): IEnumSketchSegments; dispid 66099;
    function CreateClippedSplines(paramsIn: OleVariant; x1: Double; y1: Double; x2: Double; 
                                  y2: Double): OleVariant; dispid 66100;
    function ICreateClippedSplines(var propArray: SYSINT; var knotsArray: Double; 
                                   var cntrlPntCoordArray: Double; x1: Double; y1: Double; 
                                   x2: Double; y2: Double): IEnumSketchSegments; dispid 66101;
    function EditSuppress2: WordBool; dispid 66102;
    function EditUnsuppress2: WordBool; dispid 66103;
    function EditUnsuppressDependent2: WordBool; dispid 66104;
    function EditRollback2: WordBool; dispid 66105;
    procedure HideDimension; dispid 66106;
    procedure ShowFeatureDimensions; dispid 66107;
    procedure HideFeatureDimensions; dispid 66108;
    procedure Sketch3DIntersections; dispid 66109;
    function FeatureFillet4(r1: Double; propagate: WordBool; uniformRadius: WordBool; ftyp: SYSINT; 
                            varRadTyp: WordBool; overFlowType: Integer; nRadii: SYSINT; 
                            radii: OleVariant; useHelpPoint: WordBool; 
                            useTangentHoldLine: WordBool; cornerType: WordBool; 
                            setbackDistCount: SYSINT; setBackDistances: OleVariant): Integer; dispid 66110;
    function IFeatureFillet4(r1: Double; propagate: WordBool; uniformRadius: WordBool; 
                             ftyp: SYSINT; varRadTyp: WordBool; overFlowType: Integer; 
                             nRadii: SYSINT; var radii: Double; useHelpPoint: WordBool; 
                             useTangentHoldLine: WordBool; cornerType: WordBool; 
                             setbackDistCount: SYSINT; var setBackDistances: Double): Integer; dispid 66111;
    procedure InsertDeleteFace; dispid 66112;
    function GetDependencies2(traverseflag: WordBool; searchflag: WordBool; 
                              addReadOnlyInfo: WordBool): OleVariant; dispid 66113;
    function IGetDependencies2(traverseflag: WordBool; searchflag: WordBool; 
                               addReadOnlyInfo: WordBool): WideString; dispid 66114;
    function IGetNumDependencies2(traverseflag: WordBool; searchflag: WordBool; 
                                  addReadOnlyInfo: WordBool): Integer; dispid 66115;
    procedure InsertScale(scaleFactor_x: Double; scaleFactor_y: Double; scaleFactor_z: Double; 
                          isUniform: WordBool; scaleType: SYSINT); dispid 66116;
    procedure LockAllExternalReferences; dispid 66117;
    procedure UnlockAllExternalReferences; dispid 66118;
    procedure BreakAllExternalReferences; dispid 66119;
    function EditDimensionProperties(tolType: Integer; tolMax: Double; tolMin: Double; 
                                     const tolMaxFit: WideString; const tolMinFit: WideString; 
                                     useDocPrec: WordBool; precision: Integer; arrowsIn: Integer; 
                                     useDocArrows: WordBool; arrow1: Integer; arrow2: Integer): WordBool; dispid 66120;
    function SketchPolygon(xCenter: Double; yCenter: Double; xEdge: Double; yEdge: Double; 
                           nSides: SYSINT; bInscribed: WordBool): WordBool; dispid 66121;
    function GetBlockingState: Integer; dispid 66122;
    function CreateFeatureMgrView3(var bitmap: Integer; const toolTip: WideString; 
                                   whichPane: Integer): IDispatch; dispid 66123;
    function ICreateFeatureMgrView3(var bitmap: Integer; const toolTip: WideString; 
                                    whichPane: Integer): IFeatMgrView; dispid 66124;
    function AddFeatureMgrView3(var bitmap: Integer; var appView: Integer; 
                                const toolTip: WideString; whichPane: Integer): WordBool; dispid 66125;
    function CreatePlaneAtOffset2(val: Double; flipDir: WordBool): IDispatch; dispid 66126;
    function ICreatePlaneAtOffset2(val: Double; flipDir: WordBool): IRefPlane; dispid 66127;
    function CreatePlaneAtAngle2(val: Double; flipDir: WordBool): IDispatch; dispid 66128;
    function ICreatePlaneAtAngle2(val: Double; flipDir: WordBool): IRefPlane; dispid 66129;
    function CreatePlaneThru3Points2: IDispatch; dispid 66130;
    function ICreatePlaneThru3Points2: IRefPlane; dispid 66131;
    function CreatePlanePerCurveAndPassPoint2(origAtCurve: WordBool): IDispatch; dispid 66132;
    function ICreatePlanePerCurveAndPassPoint2(origAtCurve: WordBool): IRefPlane; dispid 66133;
    function CreatePlaneAtSurface2(interIndex: SYSINT; projOpt: WordBool; reverseDir: WordBool; 
                                   normalPlane: WordBool; angle: Double): IDispatch; dispid 66134;
    function ICreatePlaneAtSurface2(interIndex: SYSINT; projOpt: WordBool; reverseDir: WordBool; 
                                    normalPlane: WordBool; angle: Double): IRefPlane; dispid 66135;
    function GetUserPreferenceIntegerValue(userPreferenceValue: Integer): Integer; dispid 66136;
    function SetUserPreferenceIntegerValue(userPreferenceValue: Integer; Value: Integer): WordBool; dispid 66137;
    function GetUserPreferenceTextFormat(userPreferenceValue: Integer): IDispatch; dispid 66138;
    function IGetUserPreferenceTextFormat(userPreferenceValue: Integer): ITextFormat; dispid 66139;
    function SetUserPreferenceTextFormat(userPreferenceValue: Integer; const Value: IDispatch): WordBool; dispid 66140;
    function ISetUserPreferenceTextFormat(userPreferenceValue: Integer; const Value: ITextFormat): WordBool; dispid 66141;
    procedure InsertRib2(is2Sided: WordBool; reverseThicknessDir: WordBool; thickness: Double; 
                         referenceEdgeIndex: Integer; reverseMaterialDir: WordBool; 
                         isDrafted: WordBool; draftOutward: WordBool; draftAngle: Double; 
                         isNormToSketch: WordBool); dispid 66142;
    function InsertObjectFromFile(const filePath: WideString; createLink: WordBool; xx: Double; 
                                  yy: Double; zz: Double): WordBool; dispid 66143;
    procedure InspectCurvature; dispid 66144;
    procedure RemoveInspectCurvature; dispid 66145;
    function InsertDatumTag2: IDispatch; dispid 66146;
    function IInsertDatumTag2: IDatumTag; dispid 66147;
    function ActivateFeatureMgrView(var appView: Integer): Integer; dispid 66148;
    procedure FeatureSketchDrivenPattern(useCentroid: WordBool); dispid 66149;
    procedure HideShowBodies; dispid 66150;
    procedure HideSolidBody; dispid 66151;
    procedure ShowSolidBody; dispid 66152;
    procedure InsertFramePoint(xx: Double; yy: Double; zz: Double); dispid 66153;
    procedure LockFramePoint; dispid 66154;
    procedure UnlockFramePoint; dispid 66155;
    function InsertGtol: IDispatch; dispid 66156;
    function IInsertGtol: IGtol; dispid 66157;
    function DeActivateFeatureMgrView(var appView: Integer): WordBool; dispid 66158;
    function InsertNote(const text: WideString): IDispatch; dispid 66159;
    function IInsertNote(const text: WideString): INote; dispid 66160;
    procedure SetSaveAsFileName(const fileName: WideString); dispid 66161;
    procedure ClosePrintPreview; dispid 66162;
    procedure HideComponent2; dispid 66163;
    procedure ShowComponent2; dispid 66164;
    function SaveBMP(const filenameIn: WideString; widthIn: Integer; heightIn: Integer): WordBool; dispid 66165;
    procedure InsertSketch2(updateEditRebuild: WordBool); dispid 66166;
    procedure Insert3DSketch2(updateEditRebuild: WordBool); dispid 66167;
    procedure InsertDeleteHole; dispid 66168;
    procedure PreTrimSurface(bMutualTrimIn: WordBool); dispid 66169;
    procedure PostTrimSurface(bSewSurfaceIn: WordBool); dispid 66170;
    procedure SketchConvertIsoCurves(percentRatio: Double; vORuDir: WordBool; 
                                     doConstrain: WordBool; skipHoles: WordBool); dispid 66171;
    procedure SelectLoop; dispid 66172;
    procedure InsertSheetMetalBaseFlange(thickness: Double; thickenDir: WordBool; radius: Double; 
                                         extrudeDist1: Double; extrudeDist2: Double; 
                                         flipExtruDir: WordBool; endCondition1: Integer; 
                                         endCondition2: Integer; dirToUse: Integer); dispid 66173;
    procedure InsertSheetMetalFold; dispid 66174;
    procedure InsertSheetMetalUnfold; dispid 66175;
    procedure InsertSheetMetalMiterFlange(useReliefRatio: WordBool; useDefaultGap: WordBool; 
                                          useAutoRelief: WordBool; globalRadius: Double; 
                                          ripGap: Double; autoReliefRatio: Double; 
                                          autoReliefWidth: Double; autoReliefDepth: Double; 
                                          reliefType: Integer; ripLocation: Integer; 
                                          trimSideBends: WordBool); dispid 66176;
    procedure CreateGroup; dispid 66177;
    procedure RemoveItemsFromGroup; dispid 66178;
    procedure RemoveGroups; dispid 66179;
    function InsertBOMBalloon2(Style: Integer; size: Integer; upperTextStyle: Integer; 
                               const upperText: WideString; lowerTextStyle: Integer; 
                               const lowerText: WideString): IDispatch; dispid 66180;
    function IInsertBOMBalloon2(Style: Integer; size: Integer; upperTextStyle: Integer; 
                                const upperText: WideString; lowerTextStyle: Integer; 
                                const lowerText: WideString): INote; dispid 66181;
    procedure EditRedo(nSteps: UINT); dispid 66182;
    procedure InsertProtrusionBlend4(closed: WordBool; keepTangency: WordBool; 
                                     forceNonRational: WordBool; tessToleranceFactor: Double; 
                                     startMatchingType: Smallint; endMatchingType: Smallint; 
                                     isThinBody: WordBool; thickness1: Double; thickness2: Double; 
                                     thinType: Smallint); dispid 66183;
    procedure InsertCutBlend4(closed: WordBool; keepTangency: WordBool; forceNonRational: WordBool; 
                              tessToleranceFactor: Double; startMatchingType: Smallint; 
                              endMatchingType: Smallint; isThinBody: WordBool; thickness1: Double; 
                              thickness2: Double; thinType: Smallint); dispid 66184;
    procedure InsertProtrusionSwept4(propagate: WordBool; alignment: WordBool; 
                                     twistCtrlOption: Smallint; keepTangency: WordBool; 
                                     forceNonRational: WordBool; startMatchingType: Smallint; 
                                     endMatchingType: Smallint; isThinBody: WordBool; 
                                     thickness1: Double; thickness2: Double; thinType: Smallint); dispid 66185;
    procedure InsertCutSwept4(propagate: WordBool; alignment: WordBool; twistCtrlOption: Smallint; 
                              keepTangency: WordBool; forceNonRational: WordBool; 
                              startMatchingType: Smallint; endMatchingType: Smallint; 
                              isThinBody: WordBool; thickness1: Double; thickness2: Double; 
                              thinType: Smallint); dispid 66186;
    procedure SelectTangency; dispid 66187;
    function InsertBendTableOpen(const fileName: WideString): WordBool; dispid 66188;
    function InsertBendTableNew(const fileName: WideString; const units: WideString; 
                                const type_: WideString): WordBool; dispid 66189;
    procedure InsertBendTableEdit; dispid 66190;
    procedure DeleteBendTable; dispid 66191;
    procedure InsertSheetMetal3dBend(angle: Double; radius: Double; flipDir: WordBool; 
                                     bendPos: Smallint); dispid 66192;
    function CreateTangentArc2(p1x: Double; p1y: Double; p1z: Double; p2x: Double; p2y: Double; 
                               p2z: Double; arcTypeIn: Integer): WordBool; dispid 66193;
    function GetMassProperties2(var status: Integer): OleVariant; dispid 66194;
    function IGetMassProperties2(var status: Integer): Double; dispid 66195;
    procedure SketchChamfer(angleORdist: Double; dist1: Double; options: Integer); dispid 66196;
    procedure FeatureCut4(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; t2: Integer; 
                          d1: Double; d2: Double; dchk1: WordBool; dchk2: WordBool; 
                          ddir1: WordBool; ddir2: WordBool; dang1: Double; dang2: Double; 
                          offsetReverse1: WordBool; offsetReverse2: WordBool; 
                          keepPieceIndex: Integer; normalCut: WordBool); dispid 66197;
    function GetPropertyManagerPage(dialogId: Integer; const title: WideString; 
                                    const handler: IUnknown): IPropertyManagerPage; dispid 66198;
    procedure AlignOrdinate; dispid 66199;
    procedure EditOrdinate; dispid 66200;
    function ReattachOrdinate: WordBool; dispid 66201;
    function EditBalloonProperties(Style: Integer; size: Integer; upperTextStyle: Integer; 
                                   const upperText: WideString; lowerTextStyle: Integer; 
                                   const lowerText: WideString): IDispatch; dispid 66202;
    function EditDimensionProperties2(tolType: Integer; tolMax: Double; tolMin: Double; 
                                      const tolMaxFit: WideString; const tolMinFit: WideString; 
                                      useDocPrec: WordBool; precision: Integer; arrowsIn: Integer; 
                                      useDocArrows: WordBool; arrow1: Integer; arrow2: Integer; 
                                      const prefixText: WideString; const suffixText: WideString; 
                                      showValue: WordBool; const calloutText1: WideString; 
                                      const calloutText2: WideString; CenterText: WordBool): WordBool; dispid 66203;
    procedure InsertSheetMetalClosedCorner; dispid 66204;
    function SketchUseEdge2(chain: WordBool): WordBool; dispid 66205;
    function SketchOffsetEntities2(offset: Double; bothDirections: WordBool; chain: WordBool): WordBool; dispid 66206;
    function SketchOffset2(offset: Double; bothDirections: WordBool; chain: WordBool): WordBool; dispid 66207;
    function AddDimension2(x: Double; y: Double; z: Double): IDispatch; dispid 66208;
    function IAddDimension2(x: Double; y: Double; z: Double): IDisplayDimension; dispid 66209;
    function AddHorizontalDimension2(x: Double; y: Double; z: Double): IDispatch; dispid 66210;
    function IAddHorizontalDimension2(x: Double; y: Double; z: Double): IDisplayDimension; dispid 66211;
    function AddVerticalDimension2(x: Double; y: Double; z: Double): IDispatch; dispid 66212;
    function IAddVerticalDimension2(x: Double; y: Double; z: Double): IDisplayDimension; dispid 66213;
    function AddRadialDimension2(x: Double; y: Double; z: Double): IDispatch; dispid 66214;
    function IAddRadialDimension2(x: Double; y: Double; z: Double): IDisplayDimension; dispid 66215;
    function AddDiameterDimension2(x: Double; y: Double; z: Double): IDispatch; dispid 66216;
    function IAddDiameterDimension2(x: Double; y: Double; z: Double): IDisplayDimension; dispid 66217;
    function GetUserUnit(UnitType: Integer): IDispatch; dispid 66218;
    function IGetUserUnit(UnitType: Integer): IUserUnit; dispid 66219;
  end;

// *********************************************************************//
// Interface: ISelectionMgr
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D59-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISelectionMgr = interface(IDispatch)
    ['{83A33D59-27C5-11CE-BFD4-00400513BB57}']
    function GetSelectedObjectCount: Integer; safecall;
    function GetSelectedObjectType(AtIndex: Integer): Integer; safecall;
    function GetSelectedObject(AtIndex: Integer): IDispatch; safecall;
    function IGetSelectedObject(AtIndex: Integer): IUnknown; safecall;
    function GetSelectionPoint(AtIndex: Integer): OleVariant; safecall;
    function GetSelectionPointInSketchSpace(AtIndex: Integer): OleVariant; safecall;
    function GetSelectedObject2(AtIndex: Integer): IDispatch; safecall;
    function IGetSelectedObject2(AtIndex: Integer): IUnknown; safecall;
    function IsInEditTarget(AtIndex: Integer): WordBool; safecall;
    function GetSelectedObjectsComponent(AtIndex: Integer): IDispatch; safecall;
    function IGetSelectedObjectsComponent(AtIndex: Integer): IComponent; safecall;
    function GetSelectedObject3(AtIndex: Integer): IDispatch; safecall;
    function IGetSelectedObject3(AtIndex: Integer): IUnknown; safecall;
    function GetSelectedObjectType2(AtIndex: Integer): Integer; safecall;
    function IGetSelectionPoint(AtIndex: Integer): Double; safecall;
    function IGetSelectionPointInSketchSpace(AtIndex: Integer): Double; safecall;
    function GetSelectedObjectMark(AtIndex: Integer): Integer; safecall;
    function SetSelectedObjectMark(AtIndex: Integer; mark: Integer; Action: Integer): WordBool; safecall;
    function DeSelect(AtIndex: OleVariant): Integer; safecall;
    function IDeSelect(count: Integer; var AtIndex: Integer): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISelectionMgrDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D59-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISelectionMgrDisp = dispinterface
    ['{83A33D59-27C5-11CE-BFD4-00400513BB57}']
    function GetSelectedObjectCount: Integer; dispid 1;
    function GetSelectedObjectType(AtIndex: Integer): Integer; dispid 2;
    function GetSelectedObject(AtIndex: Integer): IDispatch; dispid 3;
    function IGetSelectedObject(AtIndex: Integer): IUnknown; dispid 4;
    function GetSelectionPoint(AtIndex: Integer): OleVariant; dispid 5;
    function GetSelectionPointInSketchSpace(AtIndex: Integer): OleVariant; dispid 6;
    function GetSelectedObject2(AtIndex: Integer): IDispatch; dispid 7;
    function IGetSelectedObject2(AtIndex: Integer): IUnknown; dispid 8;
    function IsInEditTarget(AtIndex: Integer): WordBool; dispid 9;
    function GetSelectedObjectsComponent(AtIndex: Integer): IDispatch; dispid 10;
    function IGetSelectedObjectsComponent(AtIndex: Integer): IComponent; dispid 11;
    function GetSelectedObject3(AtIndex: Integer): IDispatch; dispid 12;
    function IGetSelectedObject3(AtIndex: Integer): IUnknown; dispid 13;
    function GetSelectedObjectType2(AtIndex: Integer): Integer; dispid 14;
    function IGetSelectionPoint(AtIndex: Integer): Double; dispid 15;
    function IGetSelectionPointInSketchSpace(AtIndex: Integer): Double; dispid 16;
    function GetSelectedObjectMark(AtIndex: Integer): Integer; dispid 17;
    function SetSelectedObjectMark(AtIndex: Integer; mark: Integer; Action: Integer): WordBool; dispid 18;
    function DeSelect(AtIndex: OleVariant): Integer; dispid 19;
    function IDeSelect(count: Integer; var AtIndex: Integer): Integer; dispid 20;
  end;

// *********************************************************************//
// Interface: IComponent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D9A-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IComponent = interface(IDispatch)
    ['{83A33D9A-27C5-11CE-BFD4-00400513BB57}']
    function GetChildren: OleVariant; safecall;
    function IGetChildren: PPUserType3; safecall;
    function IGetChildrenCount: SYSINT; safecall;
    function GetXform: OleVariant; safecall;
    function IGetXform: Double; safecall;
    function GetBody: IDispatch; safecall;
    function IGetBody: IBody; safecall;
    function Get_MaterialPropertyValues: OleVariant; safecall;
    procedure Set_MaterialPropertyValues(retval: OleVariant); safecall;
    function Get_IMaterialPropertyValues: Double; safecall;
    procedure Set_IMaterialPropertyValues(var retval: Double); safecall;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; safecall;
    function GetPropertyExtension(Id: Integer): OleVariant; safecall;
    procedure ResetPropertyExtension; safecall;
    function GetMaterialIdName: WideString; safecall;
    function SetMaterialIdName(const Name: WideString): WordBool; safecall;
    function GetMaterialUserName: WideString; safecall;
    function SetMaterialUserName(const Name: WideString): WordBool; safecall;
    function GetSectionedBodies(const viewIn: IDispatch): OleVariant; safecall;
    function GetBox(includeRefPlanes: WordBool; includeSketches: WordBool): OleVariant; safecall;
    function IGetBox(includeRefPlanes: WordBool; includeSketches: WordBool): Double; safecall;
    function SetXform(xformIn: OleVariant): WordBool; safecall;
    function ISetXform(var xformIn: Double): WordBool; safecall;
    function GetModelDoc: IDispatch; safecall;
    function IGetModelDoc: IModelDoc; safecall;
    function IsFixed: WordBool; safecall;
    function EnumRelatedBodies: IEnumBodies; safecall;
    function IsSuppressed: WordBool; safecall;
    function EnumSectionedBodies(const viewIn: IModelView): IEnumBodies; safecall;
    function IsHidden(considerSuppressed: WordBool): WordBool; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_ReferencedConfiguration(const retval: WideString); safecall;
    function Get_ReferencedConfiguration: WideString; safecall;
    function GetSuppression: Integer; safecall;
    function SetSuppression(state: Integer): Integer; safecall;
    function Get_Visible: Integer; safecall;
    procedure Set_Visible(retval: Integer); safecall;
    function GetPathName: WideString; safecall;
    function SetXformAndSolve(xformIn: OleVariant): WordBool; safecall;
    function ISetXformAndSolve(var xformIn: Double): WordBool; safecall;
    function GetTessTriangles(noConversion: WordBool): OleVariant; safecall;
    function IGetTessTriangles(noConversion: WordBool): Single; safecall;
    function IGetTessTriangleCount: Integer; safecall;
    function GetTessNorms: OleVariant; safecall;
    function IGetTessNorms: Single; safecall;
    function GetTessTriStrips(noConversion: WordBool): OleVariant; safecall;
    function IGetTessTriStrips(noConversion: WordBool): Single; safecall;
    function IGetTessTriStripSize: Integer; safecall;
    function GetTessTriStripNorms: OleVariant; safecall;
    function IGetTessTriStripNorms: Single; safecall;
    function GetTessTriStripEdges: OleVariant; safecall;
    function IGetTessTriStripEdges: Integer; safecall;
    function IGetTessTriStripEdgeSize: Integer; safecall;
    function IsDisplayDataOutOfDate: Integer; safecall;
    function GetConstrainedStatus: Integer; safecall;
    function RemoveMaterialProperty: WordBool; safecall;
    function IGetTemporaryBodyID: Integer; safecall;
    function FindAttribute(const attributeDef: IDispatch; whichOne: Integer): IDispatch; safecall;
    function IFindAttribute(const attributeDef: IAttributeDef; whichOne: Integer): IAttribute; safecall;
    function Select(appendFlag: WordBool): WordBool; safecall;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; safecall;
    function DeSelect: WordBool; safecall;
    function Get_Name2: WideString; safecall;
    procedure Set_Name2(const newName: WideString); safecall;
    function Get_Solving: Integer; safecall;
    property MaterialPropertyValues: OleVariant read Get_MaterialPropertyValues write Set_MaterialPropertyValues;
    property Name: WideString read Get_Name;
    property ReferencedConfiguration: WideString read Get_ReferencedConfiguration write Set_ReferencedConfiguration;
    property Visible: Integer read Get_Visible write Set_Visible;
    property Name2: WideString read Get_Name2 write Set_Name2;
    property Solving: Integer read Get_Solving;
  end;

// *********************************************************************//
// DispIntf:  IComponentDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D9A-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IComponentDisp = dispinterface
    ['{83A33D9A-27C5-11CE-BFD4-00400513BB57}']
    function GetChildren: OleVariant; dispid 1;
    function IGetChildren: {??PPUserType3} OleVariant; dispid 2;
    function IGetChildrenCount: SYSINT; dispid 3;
    function GetXform: OleVariant; dispid 4;
    function IGetXform: Double; dispid 5;
    function GetBody: IDispatch; dispid 6;
    function IGetBody: IBody; dispid 7;
    property MaterialPropertyValues: OleVariant dispid 8;
    function IMaterialPropertyValues: Double; dispid 9;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; dispid 10;
    function GetPropertyExtension(Id: Integer): OleVariant; dispid 11;
    procedure ResetPropertyExtension; dispid 12;
    function GetMaterialIdName: WideString; dispid 13;
    function SetMaterialIdName(const Name: WideString): WordBool; dispid 14;
    function GetMaterialUserName: WideString; dispid 15;
    function SetMaterialUserName(const Name: WideString): WordBool; dispid 16;
    function GetSectionedBodies(const viewIn: IDispatch): OleVariant; dispid 17;
    function GetBox(includeRefPlanes: WordBool; includeSketches: WordBool): OleVariant; dispid 18;
    function IGetBox(includeRefPlanes: WordBool; includeSketches: WordBool): Double; dispid 19;
    function SetXform(xformIn: OleVariant): WordBool; dispid 20;
    function ISetXform(var xformIn: Double): WordBool; dispid 21;
    function GetModelDoc: IDispatch; dispid 22;
    function IGetModelDoc: IModelDoc; dispid 23;
    function IsFixed: WordBool; dispid 24;
    function EnumRelatedBodies: IEnumBodies; dispid 25;
    function IsSuppressed: WordBool; dispid 26;
    function EnumSectionedBodies(const viewIn: IModelView): IEnumBodies; dispid 27;
    function IsHidden(considerSuppressed: WordBool): WordBool; dispid 28;
    property Name: WideString readonly dispid 29;
    property ReferencedConfiguration: WideString dispid 30;
    function GetSuppression: Integer; dispid 31;
    function SetSuppression(state: Integer): Integer; dispid 32;
    property Visible: Integer dispid 33;
    function GetPathName: WideString; dispid 34;
    function SetXformAndSolve(xformIn: OleVariant): WordBool; dispid 35;
    function ISetXformAndSolve(var xformIn: Double): WordBool; dispid 36;
    function GetTessTriangles(noConversion: WordBool): OleVariant; dispid 37;
    function IGetTessTriangles(noConversion: WordBool): Single; dispid 38;
    function IGetTessTriangleCount: Integer; dispid 39;
    function GetTessNorms: OleVariant; dispid 40;
    function IGetTessNorms: Single; dispid 41;
    function GetTessTriStrips(noConversion: WordBool): OleVariant; dispid 42;
    function IGetTessTriStrips(noConversion: WordBool): Single; dispid 43;
    function IGetTessTriStripSize: Integer; dispid 44;
    function GetTessTriStripNorms: OleVariant; dispid 45;
    function IGetTessTriStripNorms: Single; dispid 46;
    function GetTessTriStripEdges: OleVariant; dispid 47;
    function IGetTessTriStripEdges: Integer; dispid 48;
    function IGetTessTriStripEdgeSize: Integer; dispid 49;
    function IsDisplayDataOutOfDate: Integer; dispid 50;
    function GetConstrainedStatus: Integer; dispid 51;
    function RemoveMaterialProperty: WordBool; dispid 52;
    function IGetTemporaryBodyID: Integer; dispid 53;
    function FindAttribute(const attributeDef: IDispatch; whichOne: Integer): IDispatch; dispid 54;
    function IFindAttribute(const attributeDef: IAttributeDef; whichOne: Integer): IAttribute; dispid 55;
    function Select(appendFlag: WordBool): WordBool; dispid 56;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; dispid 57;
    function DeSelect: WordBool; dispid 58;
    property Name2: WideString dispid 59;
    property Solving: Integer readonly dispid 60;
  end;

// *********************************************************************//
// Interface: IBody
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D3C-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IBody = interface(IDispatch)
    ['{83A33D3C-27C5-11CE-BFD4-00400513BB57}']
    function GetFirstFace: IDispatch; safecall;
    function IGetFirstFace: IFace; safecall;
    function GetFaceCount: Integer; safecall;
    function CreateNewSurface: IDispatch; safecall;
    function ICreateNewSurface: ISurface; safecall;
    function CreateBodyFromSurfaces: WordBool; safecall;
    function CreatePlanarSurface(vRootPoint: OleVariant; vNormal: OleVariant): IDispatch; safecall;
    function ICreatePlanarSurface(vRootPoint: OleVariant; vNormal: OleVariant): ISurface; safecall;
    function CreateRevolutionSurface(const profileCurve: IDispatch; axisPoint: OleVariant; 
                                     axisDirection: OleVariant; profileEndPtParams: OleVariant): IDispatch; safecall;
    function ICreateRevolutionSurface(const profileCurve: ICurve; axisPoint: OleVariant; 
                                      axisDirection: OleVariant; profileEndPtParams: OleVariant): ISurface; safecall;
    function CreateBsplineSurface(props: OleVariant; uKnots: OleVariant; vKnots: OleVariant; 
                                  ctrlPtCoords: OleVariant): IDispatch; safecall;
    function ICreateBsplineSurface(props: OleVariant; uKnots: OleVariant; vKnots: OleVariant; 
                                   ctrlPtCoords: OleVariant): ISurface; safecall;
    function CreateTrimmedSurface: WordBool; safecall;
    function AddProfileLine(rootPoint: OleVariant; direction: OleVariant): IDispatch; safecall;
    function IAddProfileLine(rootPoint: OleVariant; direction: OleVariant): ICurve; safecall;
    function AddProfileArc(center: OleVariant; axis: OleVariant; radius: Double; 
                           startPoint: OleVariant; endPoint: OleVariant): IDispatch; safecall;
    function IAddProfileArc(center: OleVariant; axis: OleVariant; radius: Double; 
                            startPoint: OleVariant; endPoint: OleVariant): ICurve; safecall;
    function AddProfileBspline(props: OleVariant; Knots: OleVariant; ctrlPtCoords: OleVariant): IDispatch; safecall;
    function IAddProfileBspline(props: OleVariant; Knots: OleVariant; ctrlPtCoords: OleVariant): ICurve; safecall;
    function CreateExtrusionSurface(const profileCurve: IDispatch; axisDirection: OleVariant): IDispatch; safecall;
    function ICreateExtrusionSurface(const profileCurve: ICurve; axisDirection: OleVariant): ISurface; safecall;
    function GetFirstSelectedFace: IDispatch; safecall;
    function IGetFirstSelectedFace: IFace; safecall;
    function GetNextSelectedFace: IDispatch; safecall;
    function IGetNextSelectedFace: IFace; safecall;
    function GetSelectedFaceCount: Integer; safecall;
    function CreateBoundedSurface(uOpt: WordBool; vOpt: WordBool; uvParams: OleVariant): WordBool; safecall;
    function GetIgesErrorCount: Integer; safecall;
    function GetIgesErrorCode(index: Integer): Integer; safecall;
    function Copy: IDispatch; safecall;
    function ICopy: IBody; safecall;
    function EnumFaces: IEnumFaces; safecall;
    function CreateBodyFromFaces(NumOfFaces: Integer; FaceList: OleVariant): IDispatch; safecall;
    function ICreateBodyFromFaces(NumOfFaces: Integer; FaceList: OleVariant): IBody; safecall;
    function DeleteFaces(NumOfFaces: Integer; FaceList: OleVariant): WordBool; safecall;
    procedure Display(const part: IDispatch; Color: Integer); safecall;
    procedure IDisplay(const part: IPartDoc; Color: Integer); safecall;
    procedure Hide(const part: IDispatch); safecall;
    procedure IHide(const part: IPartDoc); safecall;
    function ICreatePlanarSurfaceDLL(var rootPoint: Double; var Normal: Double): ISurface; safecall;
    function ICreateRevolutionSurfaceDLL(const profileCurve: ICurve; var axisPoint: Double; 
                                         var axisDirection: Double; var profileEndPtParams: Double): ISurface; safecall;
    function IAddProfileLineDLL(var rootPoint: Double; var direction: Double): ICurve; safecall;
    function IAddProfileArcDLL(var center: Double; var axis: Double; radius: Double; 
                               var startPoint: Double; var endPoint: Double): ICurve; safecall;
    function ICreateBsplineSurfaceDLL(var Properties: Integer; var UKnotArray: Double; 
                                      var VKnotArray: Double; var ControlPointCoordArray: Double): ISurface; safecall;
    function IAddProfileBsplineDLL(var Properties: Integer; var KnotArray: Double; 
                                   var ControlPointCoordArray: Double): ICurve; safecall;
    function ICreateExtrusionSurfaceDLL(const profileCurve: ICurve; var axisDirection: Double): ISurface; safecall;
    procedure ICreateBoundedSurface(uOpt: WordBool; vOpt: WordBool; var uvParams: Double); safecall;
    procedure ICombineVolumes(const ToolBody: IBody); safecall;
    function ISectionBySheet(const sheet: IBody; NumMaxSections: Integer; var SectionedBodies: IBody): Integer; safecall;
    procedure IGetBodyBox(var BoxCorners: Double); safecall;
    procedure SetIgesInfo(const systemName: WideString; granularity: Double; 
                          attemptKnitting: WordBool); safecall;
    procedure DisplayWireFrameXOR(const part: IDispatch; Color: Integer); safecall;
    procedure IDisplayWireFrameXOR(const part: IPartDoc; Color: Integer); safecall;
    procedure Save(const streamIn: IUnknown); safecall;
    procedure ISave(const streamIn: IUnknown); safecall;
    function CreateBlendSurface(const Surface1: IDispatch; Range1: Double; 
                                const Surface2: IDispatch; Range2: Double; StartVec: OleVariant; 
                                EndVec: OleVariant; HaveHelpVec: SYSINT; HelpVec: OleVariant; 
                                HaveHelpBox: SYSINT; HelpBox: OleVariant): IDispatch; safecall;
    function ICreateBlendSurface(const Surface1: ISurface; Range1: Double; 
                                 const Surface2: ISurface; Range2: Double; var StartVec: Double; 
                                 var EndVec: Double; HaveHelpVec: SYSINT; var HelpVec: Double; 
                                 HaveHelpBox: SYSINT; var HelpBox: Double): ISurface; safecall;
    function CreateOffsetSurface(const surfaceIn: IDispatch; distance: Double): IDispatch; safecall;
    function ICreateOffsetSurface(const surfaceIn: ISurface; distance: Double): ISurface; safecall;
    function RemoveRedundantTopology: WordBool; safecall;
    function GetIntersectionEdges(const toolBodyIn: IDispatch): OleVariant; safecall;
    function IGetIntersectionEdges(const toolBodyIn: IBody): PPUserType4; safecall;
    function IGetIntersectionEdgeCount(const toolBodyIn: IBody): Integer; safecall;
    procedure RemoveFacesFromSheet(NumOfFaces: Integer; facesToRemove: OleVariant); safecall;
    procedure IRemoveFacesFromSheet(NumOfFaces: Integer; facesToRemove: PPPUserType2); safecall;
    procedure ICreatePlanarTrimSurfaceDLL(VertexCount: Integer; var Points: Double; 
                                          var Normal: Double); safecall;
    function Get_MaterialPropertyValues: OleVariant; safecall;
    procedure Set_MaterialPropertyValues(retval: OleVariant); safecall;
    function Get_IMaterialPropertyValues: Double; safecall;
    procedure Set_IMaterialPropertyValues(var retval: Double); safecall;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; safecall;
    function GetPropertyExtension(Id: Integer): OleVariant; safecall;
    procedure ResetPropertyExtension; safecall;
    function GetMaterialIdName: WideString; safecall;
    function SetMaterialIdName(const Name: WideString): WordBool; safecall;
    function GetMaterialUserName: WideString; safecall;
    function SetMaterialUserName(const Name: WideString): WordBool; safecall;
    function GetMassProperties(density: Double): OleVariant; safecall;
    function IGetMassProperties(density: Double): Double; safecall;
    function ICreatePsplineSurfaceDLL(dim: Integer; uorder: Integer; vOrder: Integer; 
                                      ncol: Integer; nrow: Integer; var coeffs: Double; 
                                      basis: Integer; var xform: Double; scaleFactor: Double): ISurface; safecall;
    function SetXform(xformIn: OleVariant): WordBool; safecall;
    function ISetXform(var xformIn: Double): WordBool; safecall;
    function CreateTempBodyFromSurfaces: IDispatch; safecall;
    function ICreateTempBodyFromSurfaces: IBody; safecall;
    function Operations(operationType: SYSINT; const ToolBody: IDispatch; NumMaxSections: Integer): OleVariant; safecall;
    function IOperations(operationType: SYSINT; const ToolBody: IBody; NumMaxSections: Integer; 
                         var resultingBodies: IBody): Integer; safecall;
    function GetSheetBody(index: SYSINT): IDispatch; safecall;
    function IGetSheetBody(index: SYSINT): IBody; safecall;
    function GetProcessedBody: IDispatch; safecall;
    function IGetProcessedBody: IBody; safecall;
    function GetProcessedBodyWithSelFace: IDispatch; safecall;
    function IGetProcessedBodyWithSelFace: IBody; safecall;
    function Check: Integer; safecall;
    function GetExcessBodyArray: OleVariant; safecall;
    function IGetExcessBodyArray: PPUserType2; safecall;
    function IGetExcessBodyCount: SYSINT; safecall;
    function CreateBaseFeature(const bodyIn: IDispatch): WordBool; safecall;
    function ICreateBaseFeature(const bodyIn: IBody): WordBool; safecall;
    function DeleteFaces2(NumOfFaces: Integer; FaceList: OleVariant; option: SYSINT): Integer; safecall;
    function IDeleteFaces2(NumOfFaces: Integer; var FaceList: IFace; option: SYSINT): Integer; safecall;
    function IAddVertexPoint(var point: Double): IVertex; safecall;
    function AddVertexPoint(point: OleVariant): IDispatch; safecall;
    function GetExtremePoint(x: Double; y: Double; z: Double; out outx: Double; out outy: Double; 
                             out outz: Double): WordBool; safecall;
    function GetType: Integer; safecall;
    procedure IDeleteFaces3(NumOfFaces: Integer; var FaceList: IFace; option: Integer; 
                            doLocalCheck: WordBool; var localCheckResult: WordBool); safecall;
    procedure SetCurrentSurface(const surfaceIn: IDispatch); safecall;
    procedure ISetCurrentSurface(const surfaceIn: ISurface); safecall;
    function DraftBody(NumOfFaces: Integer; FaceList: OleVariant; EdgeList: OleVariant; 
                       draftAngle: Double; dir: OleVariant): WordBool; safecall;
    function IDraftBody(NumOfFaces: Integer; var FaceList: IFace; var EdgeList: IEdge; 
                        draftAngle: Double; var dir: Double): WordBool; safecall;
    function DeleteBlends(NumOfFaces: Integer; FaceList: OleVariant): WordBool; safecall;
    function IDeleteBlends(NumOfFaces: Integer; var FaceList: IFace): WordBool; safecall;
    function Operations2(operationType: SYSINT; const ToolBody: IDispatch; out errorCode: Integer): OleVariant; safecall;
    function IOperations2(operationType: SYSINT; const ToolBody: IBody; out errorCode: Integer): IEnumBodies; safecall;
    function GetBodyBox: OleVariant; safecall;
    function DeleteBlends2(NumOfFaces: Integer; FaceList: OleVariant; doLocalCheck: WordBool): WordBool; safecall;
    function IDeleteBlends2(NumOfFaces: Integer; var FaceList: IFace; doLocalCheck: WordBool): WordBool; safecall;
    function GetTessellation(FaceList: OleVariant): IDispatch; safecall;
    function IGetTessellation(NumOfFaces: Integer; var FaceList: IFace): ITessellation; safecall;
    property MaterialPropertyValues: OleVariant read Get_MaterialPropertyValues write Set_MaterialPropertyValues;
  end;

// *********************************************************************//
// DispIntf:  IBodyDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D3C-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IBodyDisp = dispinterface
    ['{83A33D3C-27C5-11CE-BFD4-00400513BB57}']
    function GetFirstFace: IDispatch; dispid 1;
    function IGetFirstFace: IFace; dispid 20;
    function GetFaceCount: Integer; dispid 2;
    function CreateNewSurface: IDispatch; dispid 3;
    function ICreateNewSurface: ISurface; dispid 21;
    function CreateBodyFromSurfaces: WordBool; dispid 4;
    function CreatePlanarSurface(vRootPoint: OleVariant; vNormal: OleVariant): IDispatch; dispid 5;
    function ICreatePlanarSurface(vRootPoint: OleVariant; vNormal: OleVariant): ISurface; dispid 22;
    function CreateRevolutionSurface(const profileCurve: IDispatch; axisPoint: OleVariant; 
                                     axisDirection: OleVariant; profileEndPtParams: OleVariant): IDispatch; dispid 6;
    function ICreateRevolutionSurface(const profileCurve: ICurve; axisPoint: OleVariant; 
                                      axisDirection: OleVariant; profileEndPtParams: OleVariant): ISurface; dispid 23;
    function CreateBsplineSurface(props: OleVariant; uKnots: OleVariant; vKnots: OleVariant; 
                                  ctrlPtCoords: OleVariant): IDispatch; dispid 7;
    function ICreateBsplineSurface(props: OleVariant; uKnots: OleVariant; vKnots: OleVariant; 
                                   ctrlPtCoords: OleVariant): ISurface; dispid 24;
    function CreateTrimmedSurface: WordBool; dispid 8;
    function AddProfileLine(rootPoint: OleVariant; direction: OleVariant): IDispatch; dispid 9;
    function IAddProfileLine(rootPoint: OleVariant; direction: OleVariant): ICurve; dispid 25;
    function AddProfileArc(center: OleVariant; axis: OleVariant; radius: Double; 
                           startPoint: OleVariant; endPoint: OleVariant): IDispatch; dispid 10;
    function IAddProfileArc(center: OleVariant; axis: OleVariant; radius: Double; 
                            startPoint: OleVariant; endPoint: OleVariant): ICurve; dispid 26;
    function AddProfileBspline(props: OleVariant; Knots: OleVariant; ctrlPtCoords: OleVariant): IDispatch; dispid 11;
    function IAddProfileBspline(props: OleVariant; Knots: OleVariant; ctrlPtCoords: OleVariant): ICurve; dispid 27;
    function CreateExtrusionSurface(const profileCurve: IDispatch; axisDirection: OleVariant): IDispatch; dispid 12;
    function ICreateExtrusionSurface(const profileCurve: ICurve; axisDirection: OleVariant): ISurface; dispid 28;
    function GetFirstSelectedFace: IDispatch; dispid 13;
    function IGetFirstSelectedFace: IFace; dispid 29;
    function GetNextSelectedFace: IDispatch; dispid 14;
    function IGetNextSelectedFace: IFace; dispid 30;
    function GetSelectedFaceCount: Integer; dispid 15;
    function CreateBoundedSurface(uOpt: WordBool; vOpt: WordBool; uvParams: OleVariant): WordBool; dispid 16;
    function GetIgesErrorCount: Integer; dispid 17;
    function GetIgesErrorCode(index: Integer): Integer; dispid 18;
    function Copy: IDispatch; dispid 19;
    function ICopy: IBody; dispid 31;
    function EnumFaces: IEnumFaces; dispid 32;
    function CreateBodyFromFaces(NumOfFaces: Integer; FaceList: OleVariant): IDispatch; dispid 33;
    function ICreateBodyFromFaces(NumOfFaces: Integer; FaceList: OleVariant): IBody; dispid 34;
    function DeleteFaces(NumOfFaces: Integer; FaceList: OleVariant): WordBool; dispid 35;
    procedure Display(const part: IDispatch; Color: Integer); dispid 36;
    procedure IDisplay(const part: IPartDoc; Color: Integer); dispid 37;
    procedure Hide(const part: IDispatch); dispid 38;
    procedure IHide(const part: IPartDoc); dispid 39;
    function ICreatePlanarSurfaceDLL(var rootPoint: Double; var Normal: Double): ISurface; dispid 40;
    function ICreateRevolutionSurfaceDLL(const profileCurve: ICurve; var axisPoint: Double; 
                                         var axisDirection: Double; var profileEndPtParams: Double): ISurface; dispid 41;
    function IAddProfileLineDLL(var rootPoint: Double; var direction: Double): ICurve; dispid 42;
    function IAddProfileArcDLL(var center: Double; var axis: Double; radius: Double; 
                               var startPoint: Double; var endPoint: Double): ICurve; dispid 43;
    function ICreateBsplineSurfaceDLL(var Properties: Integer; var UKnotArray: Double; 
                                      var VKnotArray: Double; var ControlPointCoordArray: Double): ISurface; dispid 44;
    function IAddProfileBsplineDLL(var Properties: Integer; var KnotArray: Double; 
                                   var ControlPointCoordArray: Double): ICurve; dispid 45;
    function ICreateExtrusionSurfaceDLL(const profileCurve: ICurve; var axisDirection: Double): ISurface; dispid 46;
    procedure ICreateBoundedSurface(uOpt: WordBool; vOpt: WordBool; var uvParams: Double); dispid 47;
    procedure ICombineVolumes(const ToolBody: IBody); dispid 48;
    function ISectionBySheet(const sheet: IBody; NumMaxSections: Integer; var SectionedBodies: IBody): Integer; dispid 49;
    procedure IGetBodyBox(var BoxCorners: Double); dispid 50;
    procedure SetIgesInfo(const systemName: WideString; granularity: Double; 
                          attemptKnitting: WordBool); dispid 51;
    procedure DisplayWireFrameXOR(const part: IDispatch; Color: Integer); dispid 52;
    procedure IDisplayWireFrameXOR(const part: IPartDoc; Color: Integer); dispid 53;
    procedure Save(const streamIn: IUnknown); dispid 54;
    procedure ISave(const streamIn: IUnknown); dispid 55;
    function CreateBlendSurface(const Surface1: IDispatch; Range1: Double; 
                                const Surface2: IDispatch; Range2: Double; StartVec: OleVariant; 
                                EndVec: OleVariant; HaveHelpVec: SYSINT; HelpVec: OleVariant; 
                                HaveHelpBox: SYSINT; HelpBox: OleVariant): IDispatch; dispid 56;
    function ICreateBlendSurface(const Surface1: ISurface; Range1: Double; 
                                 const Surface2: ISurface; Range2: Double; var StartVec: Double; 
                                 var EndVec: Double; HaveHelpVec: SYSINT; var HelpVec: Double; 
                                 HaveHelpBox: SYSINT; var HelpBox: Double): ISurface; dispid 57;
    function CreateOffsetSurface(const surfaceIn: IDispatch; distance: Double): IDispatch; dispid 58;
    function ICreateOffsetSurface(const surfaceIn: ISurface; distance: Double): ISurface; dispid 59;
    function RemoveRedundantTopology: WordBool; dispid 60;
    function GetIntersectionEdges(const toolBodyIn: IDispatch): OleVariant; dispid 61;
    function IGetIntersectionEdges(const toolBodyIn: IBody): {??PPUserType4} OleVariant; dispid 62;
    function IGetIntersectionEdgeCount(const toolBodyIn: IBody): Integer; dispid 63;
    procedure RemoveFacesFromSheet(NumOfFaces: Integer; facesToRemove: OleVariant); dispid 64;
    procedure IRemoveFacesFromSheet(NumOfFaces: Integer; facesToRemove: {??PPPUserType2} OleVariant); dispid 65;
    procedure ICreatePlanarTrimSurfaceDLL(VertexCount: Integer; var Points: Double; 
                                          var Normal: Double); dispid 66;
    property MaterialPropertyValues: OleVariant dispid 67;
    function IMaterialPropertyValues: Double; dispid 68;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; dispid 69;
    function GetPropertyExtension(Id: Integer): OleVariant; dispid 70;
    procedure ResetPropertyExtension; dispid 71;
    function GetMaterialIdName: WideString; dispid 72;
    function SetMaterialIdName(const Name: WideString): WordBool; dispid 73;
    function GetMaterialUserName: WideString; dispid 74;
    function SetMaterialUserName(const Name: WideString): WordBool; dispid 75;
    function GetMassProperties(density: Double): OleVariant; dispid 76;
    function IGetMassProperties(density: Double): Double; dispid 77;
    function ICreatePsplineSurfaceDLL(dim: Integer; uorder: Integer; vOrder: Integer; 
                                      ncol: Integer; nrow: Integer; var coeffs: Double; 
                                      basis: Integer; var xform: Double; scaleFactor: Double): ISurface; dispid 78;
    function SetXform(xformIn: OleVariant): WordBool; dispid 79;
    function ISetXform(var xformIn: Double): WordBool; dispid 80;
    function CreateTempBodyFromSurfaces: IDispatch; dispid 81;
    function ICreateTempBodyFromSurfaces: IBody; dispid 82;
    function Operations(operationType: SYSINT; const ToolBody: IDispatch; NumMaxSections: Integer): OleVariant; dispid 83;
    function IOperations(operationType: SYSINT; const ToolBody: IBody; NumMaxSections: Integer; 
                         var resultingBodies: IBody): Integer; dispid 84;
    function GetSheetBody(index: SYSINT): IDispatch; dispid 85;
    function IGetSheetBody(index: SYSINT): IBody; dispid 86;
    function GetProcessedBody: IDispatch; dispid 87;
    function IGetProcessedBody: IBody; dispid 88;
    function GetProcessedBodyWithSelFace: IDispatch; dispid 89;
    function IGetProcessedBodyWithSelFace: IBody; dispid 90;
    function Check: Integer; dispid 91;
    function GetExcessBodyArray: OleVariant; dispid 92;
    function IGetExcessBodyArray: {??PPUserType2} OleVariant; dispid 93;
    function IGetExcessBodyCount: SYSINT; dispid 94;
    function CreateBaseFeature(const bodyIn: IDispatch): WordBool; dispid 95;
    function ICreateBaseFeature(const bodyIn: IBody): WordBool; dispid 96;
    function DeleteFaces2(NumOfFaces: Integer; FaceList: OleVariant; option: SYSINT): Integer; dispid 97;
    function IDeleteFaces2(NumOfFaces: Integer; var FaceList: IFace; option: SYSINT): Integer; dispid 98;
    function IAddVertexPoint(var point: Double): IVertex; dispid 99;
    function AddVertexPoint(point: OleVariant): IDispatch; dispid 100;
    function GetExtremePoint(x: Double; y: Double; z: Double; out outx: Double; out outy: Double; 
                             out outz: Double): WordBool; dispid 101;
    function GetType: Integer; dispid 102;
    procedure IDeleteFaces3(NumOfFaces: Integer; var FaceList: IFace; option: Integer; 
                            doLocalCheck: WordBool; var localCheckResult: WordBool); dispid 103;
    procedure SetCurrentSurface(const surfaceIn: IDispatch); dispid 104;
    procedure ISetCurrentSurface(const surfaceIn: ISurface); dispid 105;
    function DraftBody(NumOfFaces: Integer; FaceList: OleVariant; EdgeList: OleVariant; 
                       draftAngle: Double; dir: OleVariant): WordBool; dispid 106;
    function IDraftBody(NumOfFaces: Integer; var FaceList: IFace; var EdgeList: IEdge; 
                        draftAngle: Double; var dir: Double): WordBool; dispid 107;
    function DeleteBlends(NumOfFaces: Integer; FaceList: OleVariant): WordBool; dispid 108;
    function IDeleteBlends(NumOfFaces: Integer; var FaceList: IFace): WordBool; dispid 109;
    function Operations2(operationType: SYSINT; const ToolBody: IDispatch; out errorCode: Integer): OleVariant; dispid 110;
    function IOperations2(operationType: SYSINT; const ToolBody: IBody; out errorCode: Integer): IEnumBodies; dispid 111;
    function GetBodyBox: OleVariant; dispid 112;
    function DeleteBlends2(NumOfFaces: Integer; FaceList: OleVariant; doLocalCheck: WordBool): WordBool; dispid 113;
    function IDeleteBlends2(NumOfFaces: Integer; var FaceList: IFace; doLocalCheck: WordBool): WordBool; dispid 114;
    function GetTessellation(FaceList: OleVariant): IDispatch; dispid 115;
    function IGetTessellation(NumOfFaces: Integer; var FaceList: IFace): ITessellation; dispid 116;
  end;

// *********************************************************************//
// Interface: IFace
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D3E-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IFace = interface(IDispatch)
    ['{83A33D3E-27C5-11CE-BFD4-00400513BB57}']
    function Get_Normal: OleVariant; safecall;
    procedure Set_Normal(retval: OleVariant); safecall;
    function Get_MaterialUserName: WideString; safecall;
    procedure Set_MaterialUserName(const retval: WideString); safecall;
    function Get_MaterialIdName: WideString; safecall;
    procedure Set_MaterialIdName(const retval: WideString); safecall;
    function Get_MaterialPropertyValues: OleVariant; safecall;
    procedure Set_MaterialPropertyValues(retval: OleVariant); safecall;
    function Get_INormal: Double; safecall;
    procedure Set_INormal(var retval: Double); safecall;
    function GetNextFace: IDispatch; safecall;
    function IGetNextFace: IFace; safecall;
    function GetSurface: IDispatch; safecall;
    function IGetSurface: ISurface; safecall;
    function GetEdgeCount: Integer; safecall;
    function GetEdges: OleVariant; safecall;
    function IGetEdges: PPUserType4; safecall;
    function GetFeature: IDispatch; safecall;
    function IGetFeature: IFeature; safecall;
    function GetFeatureId: Integer; safecall;
    function GetTrimCurves(wantCubic: WordBool): OleVariant; safecall;
    function GetUVBounds: OleVariant; safecall;
    function FaceInSurfaceSense: WordBool; safecall;
    function GetLoopCount: Integer; safecall;
    function GetFirstLoop: IDispatch; safecall;
    function IGetFirstLoop: ILoop; safecall;
    function IsSame(const faceIn: IDispatch): WordBool; safecall;
    function IIsSame(const faceIn: IFace): WordBool; safecall;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; safecall;
    function GetPropertyExtension(Id: Integer): OleVariant; safecall;
    procedure ResetPropertyExtension; safecall;
    function GetTessTriangles(noConversion: WordBool): OleVariant; safecall;
    function GetTessNorms: OleVariant; safecall;
    function GetTessTriStrips(noConversion: WordBool): OleVariant; safecall;
    function GetTessTriStripNorms: OleVariant; safecall;
    function EnumLoops: IEnumLoops; safecall;
    function EnumEdges: IEnumEdges; safecall;
    function GetBody: IDispatch; safecall;
    function IGetBody: IBody; safecall;
    function IGetTessTriangles(noConversion: WordBool): Single; safecall;
    function IGetTessNorms: Single; safecall;
    function GetTessTriangleCount: Integer; safecall;
    function IGetTessTriStrips(noConversion: WordBool): Single; safecall;
    function IGetTessTriStripNorms: Single; safecall;
    function GetTessTriStripSize: Integer; safecall;
    function IGetUVBounds: Double; safecall;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; safecall;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; safecall;
    procedure Highlight(state: WordBool); safecall;
    procedure IHighlight(state: WordBool); safecall;
    function GetTrimCurveTopology: OleVariant; safecall;
    function IGetTrimCurveTopology: PIDispatch1; safecall;
    function GetTrimCurveTopologyCount: Integer; safecall;
    function GetTrimCurveTopologyTypes: OleVariant; safecall;
    function IGetTrimCurveTopologyTypes: Integer; safecall;
    function RemoveRedundantTopology: WordBool; safecall;
    function CreateSheetBodyByFaceExtension(boxLowIn: OleVariant; boxHighIn: OleVariant): IDispatch; safecall;
    function ICreateSheetBodyByFaceExtension(var boxLowIn: Double; var boxHighIn: Double): IBody; safecall;
    function GetArea: Double; safecall;
    function GetBox: OleVariant; safecall;
    function IGetBox: Double; safecall;
    function RemoveInnerLoops(numOfLoops: Integer; innerLoopsIn: OleVariant): IDispatch; safecall;
    function IRemoveInnerLoops(numOfLoops: Integer; var innerLoopsIn: ILoop): IFace; safecall;
    function CreateSheetBody: IDispatch; safecall;
    function ICreateSheetBody: IBody; safecall;
    function GetSilhoutteEdges(var root: Double; var Normal: Double): OleVariant; safecall;
    function IGetSilhoutteEdges(var root: Double; var Normal: Double): PPUserType4; safecall;
    function IGetSilhoutteEdgeCount(var root: Double; var Normal: Double): Integer; safecall;
    function IGetTrimCurveSize(wantCubic: WordBool): Integer; safecall;
    function IGetTrimCurve: Double; safecall;
    function Get_IMaterialPropertyValues: Double; safecall;
    procedure Set_IMaterialPropertyValues(var retval: Double); safecall;
    function GetFaceId: SYSINT; safecall;
    procedure SetFaceId(idIn: SYSINT); safecall;
    function IGetTrimCurveSize2(wantCubic: Integer; wantNRational: Integer): Integer; safecall;
    function GetSilhoutteEdgesVB(xroot: Double; yroot: Double; zroot: Double; xnormal: Double; 
                                 ynormal: Double; znormal: Double): OleVariant; safecall;
    procedure RemoveFaceId(idIn: SYSINT); safecall;
    function GetTrimCurves2(wantCubic: WordBool; wantNRational: WordBool): OleVariant; safecall;
    function GetShellType: SYSINT; safecall;
    procedure IGetFacetData(facetMesh: SYSINT; var nFacets: SYSINT; var nStrips: SYSINT; 
                            stripVertexNums: PPSYSINT1; vertexCoords: PPSingle1; 
                            normalCoords: PPSingle1); safecall;
    function GetTessTriStripEdges: OleVariant; safecall;
    function IGetTessTriStripEdges: Integer; safecall;
    function IGetTessTriStripEdgeSize: Integer; safecall;
    function RemoveMaterialProperty: WordBool; safecall;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property MaterialUserName: WideString read Get_MaterialUserName write Set_MaterialUserName;
    property MaterialIdName: WideString read Get_MaterialIdName write Set_MaterialIdName;
    property MaterialPropertyValues: OleVariant read Get_MaterialPropertyValues write Set_MaterialPropertyValues;
  end;

// *********************************************************************//
// DispIntf:  IFaceDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D3E-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IFaceDisp = dispinterface
    ['{83A33D3E-27C5-11CE-BFD4-00400513BB57}']
    property Normal: OleVariant dispid 1;
    property MaterialUserName: WideString dispid 14;
    property MaterialIdName: WideString dispid 15;
    property MaterialPropertyValues: OleVariant dispid 16;
    function INormal: Double; dispid 40;
    function GetNextFace: IDispatch; dispid 2;
    function IGetNextFace: IFace; dispid 24;
    function GetSurface: IDispatch; dispid 3;
    function IGetSurface: ISurface; dispid 25;
    function GetEdgeCount: Integer; dispid 4;
    function GetEdges: OleVariant; dispid 5;
    function IGetEdges: {??PPUserType4} OleVariant; dispid 26;
    function GetFeature: IDispatch; dispid 6;
    function IGetFeature: IFeature; dispid 27;
    function GetFeatureId: Integer; dispid 7;
    function GetTrimCurves(wantCubic: WordBool): OleVariant; dispid 8;
    function GetUVBounds: OleVariant; dispid 9;
    function FaceInSurfaceSense: WordBool; dispid 10;
    function GetLoopCount: Integer; dispid 11;
    function GetFirstLoop: IDispatch; dispid 12;
    function IGetFirstLoop: ILoop; dispid 28;
    function IsSame(const faceIn: IDispatch): WordBool; dispid 13;
    function IIsSame(const faceIn: IFace): WordBool; dispid 29;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; dispid 17;
    function GetPropertyExtension(Id: Integer): OleVariant; dispid 18;
    procedure ResetPropertyExtension; dispid 19;
    function GetTessTriangles(noConversion: WordBool): OleVariant; dispid 20;
    function GetTessNorms: OleVariant; dispid 21;
    function GetTessTriStrips(noConversion: WordBool): OleVariant; dispid 22;
    function GetTessTriStripNorms: OleVariant; dispid 23;
    function EnumLoops: IEnumLoops; dispid 30;
    function EnumEdges: IEnumEdges; dispid 31;
    function GetBody: IDispatch; dispid 32;
    function IGetBody: IBody; dispid 33;
    function IGetTessTriangles(noConversion: WordBool): Single; dispid 34;
    function IGetTessNorms: Single; dispid 35;
    function GetTessTriangleCount: Integer; dispid 36;
    function IGetTessTriStrips(noConversion: WordBool): Single; dispid 37;
    function IGetTessTriStripNorms: Single; dispid 38;
    function GetTessTriStripSize: Integer; dispid 39;
    function IGetUVBounds: Double; dispid 41;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; dispid 42;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; dispid 43;
    procedure Highlight(state: WordBool); dispid 44;
    procedure IHighlight(state: WordBool); dispid 45;
    function GetTrimCurveTopology: OleVariant; dispid 46;
    function IGetTrimCurveTopology: {??PIDispatch1} OleVariant; dispid 47;
    function GetTrimCurveTopologyCount: Integer; dispid 48;
    function GetTrimCurveTopologyTypes: OleVariant; dispid 49;
    function IGetTrimCurveTopologyTypes: Integer; dispid 50;
    function RemoveRedundantTopology: WordBool; dispid 51;
    function CreateSheetBodyByFaceExtension(boxLowIn: OleVariant; boxHighIn: OleVariant): IDispatch; dispid 52;
    function ICreateSheetBodyByFaceExtension(var boxLowIn: Double; var boxHighIn: Double): IBody; dispid 53;
    function GetArea: Double; dispid 54;
    function GetBox: OleVariant; dispid 55;
    function IGetBox: Double; dispid 56;
    function RemoveInnerLoops(numOfLoops: Integer; innerLoopsIn: OleVariant): IDispatch; dispid 57;
    function IRemoveInnerLoops(numOfLoops: Integer; var innerLoopsIn: ILoop): IFace; dispid 58;
    function CreateSheetBody: IDispatch; dispid 59;
    function ICreateSheetBody: IBody; dispid 60;
    function GetSilhoutteEdges(var root: Double; var Normal: Double): OleVariant; dispid 61;
    function IGetSilhoutteEdges(var root: Double; var Normal: Double): {??PPUserType4} OleVariant; dispid 62;
    function IGetSilhoutteEdgeCount(var root: Double; var Normal: Double): Integer; dispid 63;
    function IGetTrimCurveSize(wantCubic: WordBool): Integer; dispid 64;
    function IGetTrimCurve: Double; dispid 65;
    function IMaterialPropertyValues: Double; dispid 66;
    function GetFaceId: SYSINT; dispid 67;
    procedure SetFaceId(idIn: SYSINT); dispid 68;
    function IGetTrimCurveSize2(wantCubic: Integer; wantNRational: Integer): Integer; dispid 69;
    function GetSilhoutteEdgesVB(xroot: Double; yroot: Double; zroot: Double; xnormal: Double; 
                                 ynormal: Double; znormal: Double): OleVariant; dispid 70;
    procedure RemoveFaceId(idIn: SYSINT); dispid 71;
    function GetTrimCurves2(wantCubic: WordBool; wantNRational: WordBool): OleVariant; dispid 72;
    function GetShellType: SYSINT; dispid 73;
    procedure IGetFacetData(facetMesh: SYSINT; var nFacets: SYSINT; var nStrips: SYSINT; 
                            stripVertexNums: {??PPSYSINT1} OleVariant; 
                            vertexCoords: {??PPSingle1} OleVariant; 
                            normalCoords: {??PPSingle1} OleVariant); dispid 74;
    function GetTessTriStripEdges: OleVariant; dispid 75;
    function IGetTessTriStripEdges: Integer; dispid 76;
    function IGetTessTriStripEdgeSize: Integer; dispid 77;
    function RemoveMaterialProperty: WordBool; dispid 78;
  end;

// *********************************************************************//
// Interface: ISurface
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D40-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISurface = interface(IDispatch)
    ['{83A33D40-27C5-11CE-BFD4-00400513BB57}']
    function Get_PlaneParams: OleVariant; safecall;
    function Get_CylinderParams: OleVariant; safecall;
    function Get_ConeParams: OleVariant; safecall;
    function Get_SphereParams: OleVariant; safecall;
    function Get_TorusParams: OleVariant; safecall;
    function IsPlane: WordBool; safecall;
    function IsCylinder: WordBool; safecall;
    function IsCone: WordBool; safecall;
    function Identity: Integer; safecall;
    function IsSphere: WordBool; safecall;
    function IsTorus: WordBool; safecall;
    function IsParametric: WordBool; safecall;
    function IsBlending: WordBool; safecall;
    function IsOffset: WordBool; safecall;
    function IsSwept: WordBool; safecall;
    function IsRevolved: WordBool; safecall;
    function IsForeign: WordBool; safecall;
    function Parameterization: OleVariant; safecall;
    function Evaluate(UParam: Double; VParam: Double; NumUDeriv: Integer; NumVDeriv: Integer): OleVariant; safecall;
    function GetBSurfParams(wantCubicRational: WordBool; vP0: OleVariant): OleVariant; safecall;
    function AddTrimmingLoop(nCrvs: Integer; vOrder: OleVariant; vDim: OleVariant; 
                             vPeriodic: OleVariant; vNumKnots: OleVariant; 
                             vNumCtrlPoints: OleVariant; vKnots: OleVariant; 
                             vCtrlPointDbls: OleVariant): WordBool; safecall;
    function CreateNewCurve: IDispatch; safecall;
    function ICreateNewCurve: ICurve; safecall;
    function GetRevsurfParams: OleVariant; safecall;
    function GetExtrusionsurfParams: OleVariant; safecall;
    function GetProfileCurve: IDispatch; safecall;
    function IGetProfileCurve: ICurve; safecall;
    function ReverseEvaluate(positionX: Double; positionY: Double; positionZ: Double): OleVariant; safecall;
    function Get_IPlaneParams: Double; safecall;
    function Get_ICylinderParams: Double; safecall;
    function Get_IConeParams: Double; safecall;
    function Get_ISphereParams: Double; safecall;
    function Get_ITorusParams: Double; safecall;
    function IReverseEvaluate(positionX: Double; positionY: Double; positionZ: Double): Double; safecall;
    function IGetRevsurfParams: Double; safecall;
    function IGetExtrusionsurfParams: Double; safecall;
    function IParameterization: Double; safecall;
    function IEvaluate(UParam: Double; VParam: Double; NumUDeriv: Integer; NumVDeriv: Integer): Double; safecall;
    function IGetBSurfParams: Double; safecall;
    function IGetBSurfParamsSize(wantCubicRational: WordBool; var Range: Double): Integer; safecall;
    procedure IAddTrimmingLoop(CurveCount: Integer; var order: Integer; var dim: Integer; 
                               var Periodic: Integer; var NumKnots: Integer; 
                               var NumCtrlPoints: Integer; var Knots: Double; 
                               var CtrlPointDbls: Double); safecall;
    function EvaluateAtPoint(positionX: Double; positionY: Double; positionZ: Double): OleVariant; safecall;
    function IEvaluateAtPoint(positionX: Double; positionY: Double; positionZ: Double): Double; safecall;
    function GetOffsetSurfParams: Double; safecall;
    function IGetBSurfParamsSize2(wantCubic: WordBool; wantNonRational: WordBool; var Range: Double): Integer; safecall;
    function Copy: IDispatch; safecall;
    function ICopy: ISurface; safecall;
    function CreateTrimmedSheet(curves: OleVariant): IDispatch; safecall;
    function ICreateTrimmedSheet(nCurves: Integer; var curves: ICurve): IBody; safecall;
    function AddTrimmingLoop2(nCrvs: Integer; vOrder: OleVariant; vDim: OleVariant; 
                              vPeriodic: OleVariant; vNumKnots: OleVariant; 
                              vNumCtrlPoints: OleVariant; vKnots: OleVariant; 
                              vCtrlPointDbls: OleVariant; uvRange: OleVariant): WordBool; safecall;
    procedure IAddTrimmingLoop2(CurveCount: Integer; var order: Integer; var dim: Integer; 
                                var Periodic: Integer; var NumKnots: Integer; 
                                var NumCtrlPoints: Integer; var Knots: Double; 
                                var CtrlPointDbls: Double; var uvRange: Double); safecall;
    function GetBSurfParams2(wantCubic: WordBool; wantNonRational: WordBool; vP0: OleVariant; 
                             tolerance: Double; out sense: WordBool): OleVariant; safecall;
    function IGetBSurfParamsSize3(wantCubic: WordBool; wantNonRational: WordBool; 
                                  var Range: Double; tolerance: Double; out sense: WordBool): Integer; safecall;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; safecall;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; safecall;
    function GetOffsetSurfParams2(out baseSurf: IDispatch; out sense: WordBool): Double; safecall;
    function IGetOffsetSurfParams2(out baseSurf: ISurface; out sense: WordBool): Double; safecall;
    property PlaneParams: OleVariant read Get_PlaneParams;
    property CylinderParams: OleVariant read Get_CylinderParams;
    property ConeParams: OleVariant read Get_ConeParams;
    property SphereParams: OleVariant read Get_SphereParams;
    property TorusParams: OleVariant read Get_TorusParams;
    property IPlaneParams: Double read Get_IPlaneParams;
    property ICylinderParams: Double read Get_ICylinderParams;
    property IConeParams: Double read Get_IConeParams;
    property ISphereParams: Double read Get_ISphereParams;
    property ITorusParams: Double read Get_ITorusParams;
  end;

// *********************************************************************//
// DispIntf:  ISurfaceDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D40-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISurfaceDisp = dispinterface
    ['{83A33D40-27C5-11CE-BFD4-00400513BB57}']
    property PlaneParams: OleVariant readonly dispid 1;
    property CylinderParams: OleVariant readonly dispid 2;
    property ConeParams: OleVariant readonly dispid 3;
    property SphereParams: OleVariant readonly dispid 4;
    property TorusParams: OleVariant readonly dispid 5;
    function IsPlane: WordBool; dispid 6;
    function IsCylinder: WordBool; dispid 7;
    function IsCone: WordBool; dispid 8;
    function Identity: Integer; dispid 9;
    function IsSphere: WordBool; dispid 10;
    function IsTorus: WordBool; dispid 11;
    function IsParametric: WordBool; dispid 12;
    function IsBlending: WordBool; dispid 13;
    function IsOffset: WordBool; dispid 14;
    function IsSwept: WordBool; dispid 15;
    function IsRevolved: WordBool; dispid 16;
    function IsForeign: WordBool; dispid 17;
    function Parameterization: OleVariant; dispid 18;
    function Evaluate(UParam: Double; VParam: Double; NumUDeriv: Integer; NumVDeriv: Integer): OleVariant; dispid 19;
    function GetBSurfParams(wantCubicRational: WordBool; vP0: OleVariant): OleVariant; dispid 20;
    function AddTrimmingLoop(nCrvs: Integer; vOrder: OleVariant; vDim: OleVariant; 
                             vPeriodic: OleVariant; vNumKnots: OleVariant; 
                             vNumCtrlPoints: OleVariant; vKnots: OleVariant; 
                             vCtrlPointDbls: OleVariant): WordBool; dispid 21;
    function CreateNewCurve: IDispatch; dispid 22;
    function ICreateNewCurve: ICurve; dispid 26;
    function GetRevsurfParams: OleVariant; dispid 23;
    function GetExtrusionsurfParams: OleVariant; dispid 24;
    function GetProfileCurve: IDispatch; dispid 25;
    function IGetProfileCurve: ICurve; dispid 27;
    function ReverseEvaluate(positionX: Double; positionY: Double; positionZ: Double): OleVariant; dispid 28;
    property IPlaneParams: Double readonly dispid 29;
    property ICylinderParams: Double readonly dispid 30;
    property IConeParams: Double readonly dispid 31;
    property ISphereParams: Double readonly dispid 32;
    property ITorusParams: Double readonly dispid 33;
    function IReverseEvaluate(positionX: Double; positionY: Double; positionZ: Double): Double; dispid 34;
    function IGetRevsurfParams: Double; dispid 35;
    function IGetExtrusionsurfParams: Double; dispid 36;
    function IParameterization: Double; dispid 37;
    function IEvaluate(UParam: Double; VParam: Double; NumUDeriv: Integer; NumVDeriv: Integer): Double; dispid 38;
    function IGetBSurfParams: Double; dispid 39;
    function IGetBSurfParamsSize(wantCubicRational: WordBool; var Range: Double): Integer; dispid 40;
    procedure IAddTrimmingLoop(CurveCount: Integer; var order: Integer; var dim: Integer; 
                               var Periodic: Integer; var NumKnots: Integer; 
                               var NumCtrlPoints: Integer; var Knots: Double; 
                               var CtrlPointDbls: Double); dispid 41;
    function EvaluateAtPoint(positionX: Double; positionY: Double; positionZ: Double): OleVariant; dispid 42;
    function IEvaluateAtPoint(positionX: Double; positionY: Double; positionZ: Double): Double; dispid 43;
    function GetOffsetSurfParams: Double; dispid 44;
    function IGetBSurfParamsSize2(wantCubic: WordBool; wantNonRational: WordBool; var Range: Double): Integer; dispid 45;
    function Copy: IDispatch; dispid 46;
    function ICopy: ISurface; dispid 47;
    function CreateTrimmedSheet(curves: OleVariant): IDispatch; dispid 48;
    function ICreateTrimmedSheet(nCurves: Integer; var curves: ICurve): IBody; dispid 49;
    function AddTrimmingLoop2(nCrvs: Integer; vOrder: OleVariant; vDim: OleVariant; 
                              vPeriodic: OleVariant; vNumKnots: OleVariant; 
                              vNumCtrlPoints: OleVariant; vKnots: OleVariant; 
                              vCtrlPointDbls: OleVariant; uvRange: OleVariant): WordBool; dispid 50;
    procedure IAddTrimmingLoop2(CurveCount: Integer; var order: Integer; var dim: Integer; 
                                var Periodic: Integer; var NumKnots: Integer; 
                                var NumCtrlPoints: Integer; var Knots: Double; 
                                var CtrlPointDbls: Double; var uvRange: Double); dispid 51;
    function GetBSurfParams2(wantCubic: WordBool; wantNonRational: WordBool; vP0: OleVariant; 
                             tolerance: Double; out sense: WordBool): OleVariant; dispid 52;
    function IGetBSurfParamsSize3(wantCubic: WordBool; wantNonRational: WordBool; 
                                  var Range: Double; tolerance: Double; out sense: WordBool): Integer; dispid 53;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; dispid 54;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; dispid 55;
    function GetOffsetSurfParams2(out baseSurf: IDispatch; out sense: WordBool): Double; dispid 56;
    function IGetOffsetSurfParams2(out baseSurf: ISurface; out sense: WordBool): Double; dispid 57;
  end;

// *********************************************************************//
// Interface: ICurve
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D44-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ICurve = interface(IDispatch)
    ['{83A33D44-27C5-11CE-BFD4-00400513BB57}']
    function Get_LineParams: OleVariant; safecall;
    function Get_CircleParams: OleVariant; safecall;
    function Identity: Integer; safecall;
    function IsCircle: WordBool; safecall;
    function IsLine: WordBool; safecall;
    function IsBcurve: WordBool; safecall;
    function GetBCurveParams(wantCubicIn: WordBool): OleVariant; safecall;
    function ConvertLineToBcurve(startPoint: OleVariant; endPoint: OleVariant): OleVariant; safecall;
    function ConvertArcToBcurve(center: OleVariant; axis: OleVariant; start: OleVariant; 
                                end_: OleVariant): OleVariant; safecall;
    function ReverseCurve: IDispatch; safecall;
    function IReverseCurve: ICurve; safecall;
    function GetPCurveParams: OleVariant; safecall;
    function Get_ILineParams: Double; safecall;
    function Get_ICircleParams: Double; safecall;
    function IGetBCurveParams: Double; safecall;
    function IGetBCurveParamsSize(wantCubicIn: WordBool): Integer; safecall;
    function IConvertLineToBcurveSize(var startPoint: Double; var endPoint: Double): Integer; safecall;
    function IConvertArcToBcurveSize(var center: Double; var axis: Double; var start: Double; 
                                     var end_: Double): Integer; safecall;
    function IGetPCurveParams: Double; safecall;
    function IGetPCurveParamsSize: Integer; safecall;
    function GetLength(startParam: Double; endParam: Double): Double; safecall;
    function IConvertPcurveToBcurveSize(dim: Integer; order: Integer; nsegs: Integer; 
                                        var coeffs: Double; basis: Integer; var xform: Double; 
                                        scaleFactor: Double): Integer; safecall;
    function GetSplinePts(paramsArrayIn: OleVariant): OleVariant; safecall;
    function IGetSplinePts: Double; safecall;
    function IGetSplinePtsSize(var propArray: SYSINT; var knotsArray: Double; 
                               var cntrlPntCoordArray: Double): Integer; safecall;
    function IGetBCurveParamsSize2(wantCubic: WordBool; wantNRational: WordBool): Integer; safecall;
    function Copy: IDispatch; safecall;
    function ICopy: ICurve; safecall;
    function GetTessPts(chordTolerance: Double; lengthTolerance: Double; startPoint: OleVariant; 
                        endPoint: OleVariant): OleVariant; safecall;
    function IGetTessPts(chordTolerance: Double; lengthTolerance: Double; var startPoint: Double; 
                         var endPoint: Double): Double; safecall;
    function IGetTessPtsSize(chordTolerance: Double; lengthTolerance: Double; 
                             var startPoint: Double; var endPoint: Double): Integer; safecall;
    function IntersectCurve(const otherCurve: IDispatch; thisStartPoint: OleVariant; 
                            thisEndPoint: OleVariant; otherStartPoint: OleVariant; 
                            otherEndPoint: OleVariant): OleVariant; safecall;
    function IIntersectCurve(const otherCurve: ICurve; var thisStartPoint: Double; 
                             var thisEndPoint: Double; var otherStartPoint: Double; 
                             var otherEndPoint: Double): Double; safecall;
    function IIntersectCurveSize(const otherCurve: ICurve; var thisStartPoint: Double; 
                                 var thisEndPoint: Double; var otherStartPoint: Double; 
                                 var otherEndPoint: Double): Integer; safecall;
    function CreateTrimmedCurve(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; 
                                z2: Double): IDispatch; safecall;
    function ICreateTrimmedCurve(var start: Double; var end_: Double): ICurve; safecall;
    function IsEllipse: WordBool; safecall;
    function GetEllipseParams: OleVariant; safecall;
    procedure IGetEllipseParams(var paramArray: Double); safecall;
    function Evaluate(Parameter: Double): OleVariant; safecall;
    function IEvaluate(Parameter: Double): Double; safecall;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; safecall;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; safecall;
    function GetEndParams(out start: Double; out end_: Double; out isClosed: WordBool; 
                          out isPeriodic: WordBool): WordBool; safecall;
    property LineParams: OleVariant read Get_LineParams;
    property CircleParams: OleVariant read Get_CircleParams;
    property ILineParams: Double read Get_ILineParams;
    property ICircleParams: Double read Get_ICircleParams;
  end;

// *********************************************************************//
// DispIntf:  ICurveDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D44-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ICurveDisp = dispinterface
    ['{83A33D44-27C5-11CE-BFD4-00400513BB57}']
    property LineParams: OleVariant readonly dispid 1;
    property CircleParams: OleVariant readonly dispid 2;
    function Identity: Integer; dispid 3;
    function IsCircle: WordBool; dispid 4;
    function IsLine: WordBool; dispid 5;
    function IsBcurve: WordBool; dispid 6;
    function GetBCurveParams(wantCubicIn: WordBool): OleVariant; dispid 7;
    function ConvertLineToBcurve(startPoint: OleVariant; endPoint: OleVariant): OleVariant; dispid 8;
    function ConvertArcToBcurve(center: OleVariant; axis: OleVariant; start: OleVariant; 
                                end_: OleVariant): OleVariant; dispid 9;
    function ReverseCurve: IDispatch; dispid 10;
    function IReverseCurve: ICurve; dispid 12;
    function GetPCurveParams: OleVariant; dispid 11;
    property ILineParams: Double readonly dispid 13;
    property ICircleParams: Double readonly dispid 14;
    function IGetBCurveParams: Double; dispid 15;
    function IGetBCurveParamsSize(wantCubicIn: WordBool): Integer; dispid 16;
    function IConvertLineToBcurveSize(var startPoint: Double; var endPoint: Double): Integer; dispid 17;
    function IConvertArcToBcurveSize(var center: Double; var axis: Double; var start: Double; 
                                     var end_: Double): Integer; dispid 18;
    function IGetPCurveParams: Double; dispid 19;
    function IGetPCurveParamsSize: Integer; dispid 20;
    function GetLength(startParam: Double; endParam: Double): Double; dispid 21;
    function IConvertPcurveToBcurveSize(dim: Integer; order: Integer; nsegs: Integer; 
                                        var coeffs: Double; basis: Integer; var xform: Double; 
                                        scaleFactor: Double): Integer; dispid 22;
    function GetSplinePts(paramsArrayIn: OleVariant): OleVariant; dispid 23;
    function IGetSplinePts: Double; dispid 24;
    function IGetSplinePtsSize(var propArray: SYSINT; var knotsArray: Double; 
                               var cntrlPntCoordArray: Double): Integer; dispid 25;
    function IGetBCurveParamsSize2(wantCubic: WordBool; wantNRational: WordBool): Integer; dispid 26;
    function Copy: IDispatch; dispid 27;
    function ICopy: ICurve; dispid 28;
    function GetTessPts(chordTolerance: Double; lengthTolerance: Double; startPoint: OleVariant; 
                        endPoint: OleVariant): OleVariant; dispid 29;
    function IGetTessPts(chordTolerance: Double; lengthTolerance: Double; var startPoint: Double; 
                         var endPoint: Double): Double; dispid 30;
    function IGetTessPtsSize(chordTolerance: Double; lengthTolerance: Double; 
                             var startPoint: Double; var endPoint: Double): Integer; dispid 31;
    function IntersectCurve(const otherCurve: IDispatch; thisStartPoint: OleVariant; 
                            thisEndPoint: OleVariant; otherStartPoint: OleVariant; 
                            otherEndPoint: OleVariant): OleVariant; dispid 32;
    function IIntersectCurve(const otherCurve: ICurve; var thisStartPoint: Double; 
                             var thisEndPoint: Double; var otherStartPoint: Double; 
                             var otherEndPoint: Double): Double; dispid 33;
    function IIntersectCurveSize(const otherCurve: ICurve; var thisStartPoint: Double; 
                                 var thisEndPoint: Double; var otherStartPoint: Double; 
                                 var otherEndPoint: Double): Integer; dispid 34;
    function CreateTrimmedCurve(x1: Double; y1: Double; z1: Double; x2: Double; y2: Double; 
                                z2: Double): IDispatch; dispid 35;
    function ICreateTrimmedCurve(var start: Double; var end_: Double): ICurve; dispid 36;
    function IsEllipse: WordBool; dispid 37;
    function GetEllipseParams: OleVariant; dispid 38;
    procedure IGetEllipseParams(var paramArray: Double); dispid 39;
    function Evaluate(Parameter: Double): OleVariant; dispid 40;
    function IEvaluate(Parameter: Double): Double; dispid 41;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; dispid 42;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; dispid 43;
    function GetEndParams(out start: Double; out end_: Double; out isClosed: WordBool; 
                          out isPeriodic: WordBool): WordBool; dispid 44;
  end;

// *********************************************************************//
// Interface: IEdge
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D42-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEdge = interface(IDispatch)
    ['{83A33D42-27C5-11CE-BFD4-00400513BB57}']
    function GetCurve: IDispatch; safecall;
    function IGetCurve: ICurve; safecall;
    function GetCurveParams: OleVariant; safecall;
    function IGetCurveParams: Double; safecall;
    function Evaluate(Parameter: Double): OleVariant; safecall;
    function IEvaluate(Parameter: Double): Double; safecall;
    function GetParameter(x: Double; y: Double; z: Double): OleVariant; safecall;
    function IGetParameter(x: Double; y: Double; z: Double): Double; safecall;
    function EdgeInFaceSense(const facedisp: IDispatch): WordBool; safecall;
    function IEdgeInFaceSense(const facedisp: IFace): WordBool; safecall;
    function GetTwoAdjacentFaces: OleVariant; safecall;
    procedure IGetTwoAdjacentFaces(out face1: IFace; out face2: IFace); safecall;
    function EnumCoEdges: IEnumCoEdges; safecall;
    function GetStartVertex: IDispatch; safecall;
    function IGetStartVertex: IVertex; safecall;
    function GetEndVertex: IDispatch; safecall;
    function IGetEndVertex: IVertex; safecall;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; safecall;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; safecall;
    function RemoveRedundantTopology: WordBool; safecall;
    function GetId: SYSINT; safecall;
    procedure SetId(idIn: SYSINT); safecall;
    procedure RemoveId; safecall;
    function GetCurveParams2: OleVariant; safecall;
    function IGetCurveParams2: Double; safecall;
    function IsParamReversed: WordBool; safecall;
    procedure Highlight(state: WordBool); safecall;
    function GetCoEdges: OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IEdgeDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D42-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEdgeDisp = dispinterface
    ['{83A33D42-27C5-11CE-BFD4-00400513BB57}']
    function GetCurve: IDispatch; dispid 1;
    function IGetCurve: ICurve; dispid 7;
    function GetCurveParams: OleVariant; dispid 2;
    function IGetCurveParams: Double; dispid 15;
    function Evaluate(Parameter: Double): OleVariant; dispid 3;
    function IEvaluate(Parameter: Double): Double; dispid 16;
    function GetParameter(x: Double; y: Double; z: Double): OleVariant; dispid 4;
    function IGetParameter(x: Double; y: Double; z: Double): Double; dispid 17;
    function EdgeInFaceSense(const facedisp: IDispatch): WordBool; dispid 5;
    function IEdgeInFaceSense(const facedisp: IFace): WordBool; dispid 8;
    function GetTwoAdjacentFaces: OleVariant; dispid 6;
    procedure IGetTwoAdjacentFaces(out face1: IFace; out face2: IFace); dispid 9;
    function EnumCoEdges: IEnumCoEdges; dispid 10;
    function GetStartVertex: IDispatch; dispid 11;
    function IGetStartVertex: IVertex; dispid 12;
    function GetEndVertex: IDispatch; dispid 13;
    function IGetEndVertex: IVertex; dispid 14;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; dispid 18;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; dispid 19;
    function RemoveRedundantTopology: WordBool; dispid 20;
    function GetId: SYSINT; dispid 21;
    procedure SetId(idIn: SYSINT); dispid 22;
    procedure RemoveId; dispid 23;
    function GetCurveParams2: OleVariant; dispid 24;
    function IGetCurveParams2: Double; dispid 25;
    function IsParamReversed: WordBool; dispid 26;
    procedure Highlight(state: WordBool); dispid 27;
    function GetCoEdges: OleVariant; dispid 28;
  end;

// *********************************************************************//
// Interface: IEnumCoEdges
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33D61-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumCoEdges = interface(IUnknown)
    ['{83A33D61-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: ICoEdge; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumCoEdges): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICoEdge
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D57-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ICoEdge = interface(IDispatch)
    ['{83A33D57-27C5-11CE-BFD4-00400513BB57}']
    function GetEdge: IDispatch; safecall;
    function IGetEdge: IEdge; safecall;
    function GetNext: IDispatch; safecall;
    function IGetNext: ICoEdge; safecall;
    function GetLoop: IDispatch; safecall;
    function IGetLoop: ILoop; safecall;
    function GetSense: WordBool; safecall;
    function GetPartner: IDispatch; safecall;
    function IGetPartner: ICoEdge; safecall;
    function GetCurveParams: OleVariant; safecall;
    function Evaluate(param: Double): OleVariant; safecall;
    function IGetCurveParams: Double; safecall;
    function IEvaluate(param: Double): Double; safecall;
    function GetCurve: IDispatch; safecall;
    function IGetCurve: ICurve; safecall;
  end;

// *********************************************************************//
// DispIntf:  ICoEdgeDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D57-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ICoEdgeDisp = dispinterface
    ['{83A33D57-27C5-11CE-BFD4-00400513BB57}']
    function GetEdge: IDispatch; dispid 1;
    function IGetEdge: IEdge; dispid 3;
    function GetNext: IDispatch; dispid 2;
    function IGetNext: ICoEdge; dispid 4;
    function GetLoop: IDispatch; dispid 5;
    function IGetLoop: ILoop; dispid 6;
    function GetSense: WordBool; dispid 7;
    function GetPartner: IDispatch; dispid 8;
    function IGetPartner: ICoEdge; dispid 9;
    function GetCurveParams: OleVariant; dispid 10;
    function Evaluate(param: Double): OleVariant; dispid 11;
    function IGetCurveParams: Double; dispid 12;
    function IEvaluate(param: Double): Double; dispid 13;
    function GetCurve: IDispatch; dispid 14;
    function IGetCurve: ICurve; dispid 15;
  end;

// *********************************************************************//
// Interface: ILoop
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D53-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ILoop = interface(IDispatch)
    ['{83A33D53-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: ILoop; safecall;
    function GetEdges: OleVariant; safecall;
    function IGetEdges: PPUserType4; safecall;
    function GetEdgeCount: Integer; safecall;
    function IsOuter: WordBool; safecall;
    function GetFirstCoEdge: IDispatch; safecall;
    function IGetFirstCoEdge: ICoEdge; safecall;
    function EnumEdges: IEnumEdges; safecall;
    function EnumCoEdges: IEnumCoEdges; safecall;
    function GetFace: IDispatch; safecall;
    function IGetFace: IFace; safecall;
    function SweepPlanarLoop(x: Double; y: Double; z: Double; draftAngle: Double): OleVariant; safecall;
    function ISweepPlanarLoop(x: Double; y: Double; z: Double; draftAngle: Double; 
                              var stopFacesOut: IFace): IBody; safecall;
    procedure Dummy015; safecall;
    procedure Dummy016; safecall;
    function RevolvePlanarLoop(x: Double; y: Double; z: Double; axisx: Double; axisy: Double; 
                               axisz: Double; revAngle: Double): OleVariant; safecall;
    function IRevolvePlanarLoop(x: Double; y: Double; z: Double; axisx: Double; axisy: Double; 
                                axisz: Double; revAngle: Double; var stopFacesOut: IFace): IBody; safecall;
  end;

// *********************************************************************//
// DispIntf:  ILoopDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D53-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ILoopDisp = dispinterface
    ['{83A33D53-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: ILoop; dispid 7;
    function GetEdges: OleVariant; dispid 2;
    function IGetEdges: {??PPUserType4} OleVariant; dispid 8;
    function GetEdgeCount: Integer; dispid 3;
    function IsOuter: WordBool; dispid 4;
    function GetFirstCoEdge: IDispatch; dispid 5;
    function IGetFirstCoEdge: ICoEdge; dispid 6;
    function EnumEdges: IEnumEdges; dispid 9;
    function EnumCoEdges: IEnumCoEdges; dispid 10;
    function GetFace: IDispatch; dispid 11;
    function IGetFace: IFace; dispid 12;
    function SweepPlanarLoop(x: Double; y: Double; z: Double; draftAngle: Double): OleVariant; dispid 13;
    function ISweepPlanarLoop(x: Double; y: Double; z: Double; draftAngle: Double; 
                              var stopFacesOut: IFace): IBody; dispid 14;
    procedure Dummy015; dispid 15;
    procedure Dummy016; dispid 16;
    function RevolvePlanarLoop(x: Double; y: Double; z: Double; axisx: Double; axisy: Double; 
                               axisz: Double; revAngle: Double): OleVariant; dispid 17;
    function IRevolvePlanarLoop(x: Double; y: Double; z: Double; axisx: Double; axisy: Double; 
                                axisz: Double; revAngle: Double; var stopFacesOut: IFace): IBody; dispid 18;
  end;

// *********************************************************************//
// Interface: IEnumEdges
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33D5F-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumEdges = interface(IUnknown)
    ['{83A33D5F-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: IEdge; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumEdges): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IVertex
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D63-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IVertex = interface(IDispatch)
    ['{83A33D63-27C5-11CE-BFD4-00400513BB57}']
    function GetPoint: OleVariant; safecall;
    function IGetPoint: Double; safecall;
    function EnumEdges: IEnumEdges; safecall;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; safecall;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; safecall;
    function EnumEdgesOriented: IEnumEdges; safecall;
  end;

// *********************************************************************//
// DispIntf:  IVertexDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D63-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IVertexDisp = dispinterface
    ['{83A33D63-27C5-11CE-BFD4-00400513BB57}']
    function GetPoint: OleVariant; dispid 1;
    function IGetPoint: Double; dispid 2;
    function EnumEdges: IEnumEdges; dispid 3;
    function GetClosestPointOn(x: Double; y: Double; z: Double): OleVariant; dispid 4;
    function IGetClosestPointOn(x: Double; y: Double; z: Double): Double; dispid 5;
    function EnumEdgesOriented: IEnumEdges; dispid 6;
  end;

// *********************************************************************//
// Interface: IFeature
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D38-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IFeature = interface(IDispatch)
    ['{83A33D38-27C5-11CE-BFD4-00400513BB57}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const retval: WideString); safecall;
    function Parameter(const Name: WideString): IDispatch; safecall;
    function IParameter(const Name: WideString): IDimension; safecall;
    function GetNextFeature: IDispatch; safecall;
    function IGetNextFeature: IFeature; safecall;
    function GetTypeName: WideString; safecall;
    function GetSpecificFeature: IDispatch; safecall;
    function IGetSpecificFeature: IUnknown; safecall;
    function GetUIState(stateType: Integer): WordBool; safecall;
    procedure SetUIState(stateType: Integer; flag: WordBool); safecall;
    function GetMaterialUserName: WideString; safecall;
    function SetMaterialUserName(const Name: WideString): WordBool; safecall;
    function GetMaterialIdName: WideString; safecall;
    function SetMaterialIdName(const Name: WideString): WordBool; safecall;
    function GetMaterialPropertyValues: OleVariant; safecall;
    function SetMaterialPropertyValues(MaterialPropertyValues: OleVariant): WordBool; safecall;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; safecall;
    function GetPropertyExtension(Id: Integer): OleVariant; safecall;
    procedure ResetPropertyExtension; safecall;
    function GetFirstSubFeature: IDispatch; safecall;
    function IGetFirstSubFeature: IFeature; safecall;
    function GetNextSubFeature: IDispatch; safecall;
    function IGetNextSubFeature: IFeature; safecall;
    function IGetMaterialPropertyValues: Double; safecall;
    function ISetMaterialPropertyValues(var MaterialPropertyValues: Double): WordBool; safecall;
    function IsSuppressed: WordBool; safecall;
    function GetUpdateStamp: Integer; safecall;
    function SetBody(const bodyIn: IDispatch): WordBool; safecall;
    function ISetBody(const bodyIn: IBody): WordBool; safecall;
    function GetBody: IDispatch; safecall;
    function IGetBody: IBody; safecall;
    function EnumDisplayDimensions: IEnumDisplayDimensions; safecall;
    function GetDefinition: IDispatch; safecall;
    function IGetDefinition: IUnknown; safecall;
    function ModifyDefinition(const data: IDispatch; const topDoc: IDispatch; 
                              const component: IDispatch): WordBool; safecall;
    function IModifyDefinition(const data: IUnknown; const topDoc: IModelDoc; 
                               const component: IComponent): WordBool; safecall;
    function GetFaceCount: Integer; safecall;
    function GetFaces: OleVariant; safecall;
    function IGetFaces(var faceCount: Integer): IFace; safecall;
    function GetFirstDisplayDimension: IDispatch; safecall;
    function GetNextDisplayDimension(const dispIn: IDispatch): IDispatch; safecall;
    function GetErrorCode: Integer; safecall;
    function IGetChildCount: Integer; safecall;
    function GetChildren: OleVariant; safecall;
    function IGetChildren: IFeature; safecall;
    function IGetParentCount: Integer; safecall;
    function GetParents: OleVariant; safecall;
    function IGetParents: IFeature; safecall;
    function SetBody2(const bodyIn: IDispatch; applyUserIds: WordBool): WordBool; safecall;
    function ISetBody2(const bodyIn: IBody; applyUserIds: WordBool): WordBool; safecall;
    function GetImportedFileName: WideString; safecall;
    function SetImportedFileName(const ImpName: WideString): WordBool; safecall;
    function SetSuppression(suppressState: Integer): WordBool; safecall;
    function RemoveMaterialProperty: WordBool; safecall;
    function Select(appendFlag: WordBool): WordBool; safecall;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; safecall;
    function DeSelect: WordBool; safecall;
    function GetBox(var bBox: OleVariant): WordBool; safecall;
    function IGetBox(var bBox: Double): WordBool; safecall;
    property Name: WideString read Get_Name write Set_Name;
  end;

// *********************************************************************//
// DispIntf:  IFeatureDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D38-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IFeatureDisp = dispinterface
    ['{83A33D38-27C5-11CE-BFD4-00400513BB57}']
    property Name: WideString dispid 1;
    function Parameter(const Name: WideString): IDispatch; dispid 2;
    function IParameter(const Name: WideString): IDimension; dispid 4;
    function GetNextFeature: IDispatch; dispid 3;
    function IGetNextFeature: IFeature; dispid 5;
    function GetTypeName: WideString; dispid 6;
    function GetSpecificFeature: IDispatch; dispid 7;
    function IGetSpecificFeature: IUnknown; dispid 8;
    function GetUIState(stateType: Integer): WordBool; dispid 9;
    procedure SetUIState(stateType: Integer; flag: WordBool); dispid 10;
    function GetMaterialUserName: WideString; dispid 11;
    function SetMaterialUserName(const Name: WideString): WordBool; dispid 12;
    function GetMaterialIdName: WideString; dispid 13;
    function SetMaterialIdName(const Name: WideString): WordBool; dispid 14;
    function GetMaterialPropertyValues: OleVariant; dispid 15;
    function SetMaterialPropertyValues(MaterialPropertyValues: OleVariant): WordBool; dispid 16;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; dispid 17;
    function GetPropertyExtension(Id: Integer): OleVariant; dispid 18;
    procedure ResetPropertyExtension; dispid 19;
    function GetFirstSubFeature: IDispatch; dispid 20;
    function IGetFirstSubFeature: IFeature; dispid 21;
    function GetNextSubFeature: IDispatch; dispid 22;
    function IGetNextSubFeature: IFeature; dispid 23;
    function IGetMaterialPropertyValues: Double; dispid 24;
    function ISetMaterialPropertyValues(var MaterialPropertyValues: Double): WordBool; dispid 25;
    function IsSuppressed: WordBool; dispid 26;
    function GetUpdateStamp: Integer; dispid 27;
    function SetBody(const bodyIn: IDispatch): WordBool; dispid 28;
    function ISetBody(const bodyIn: IBody): WordBool; dispid 29;
    function GetBody: IDispatch; dispid 30;
    function IGetBody: IBody; dispid 31;
    function EnumDisplayDimensions: IEnumDisplayDimensions; dispid 32;
    function GetDefinition: IDispatch; dispid 33;
    function IGetDefinition: IUnknown; dispid 34;
    function ModifyDefinition(const data: IDispatch; const topDoc: IDispatch; 
                              const component: IDispatch): WordBool; dispid 35;
    function IModifyDefinition(const data: IUnknown; const topDoc: IModelDoc; 
                               const component: IComponent): WordBool; dispid 36;
    function GetFaceCount: Integer; dispid 37;
    function GetFaces: OleVariant; dispid 38;
    function IGetFaces(var faceCount: Integer): IFace; dispid 39;
    function GetFirstDisplayDimension: IDispatch; dispid 40;
    function GetNextDisplayDimension(const dispIn: IDispatch): IDispatch; dispid 41;
    function GetErrorCode: Integer; dispid 42;
    function IGetChildCount: Integer; dispid 43;
    function GetChildren: OleVariant; dispid 44;
    function IGetChildren: IFeature; dispid 45;
    function IGetParentCount: Integer; dispid 46;
    function GetParents: OleVariant; dispid 47;
    function IGetParents: IFeature; dispid 48;
    function SetBody2(const bodyIn: IDispatch; applyUserIds: WordBool): WordBool; dispid 49;
    function ISetBody2(const bodyIn: IBody; applyUserIds: WordBool): WordBool; dispid 50;
    function GetImportedFileName: WideString; dispid 51;
    function SetImportedFileName(const ImpName: WideString): WordBool; dispid 52;
    function SetSuppression(suppressState: Integer): WordBool; dispid 53;
    function RemoveMaterialProperty: WordBool; dispid 54;
    function Select(appendFlag: WordBool): WordBool; dispid 55;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; dispid 56;
    function DeSelect: WordBool; dispid 57;
    function GetBox(var bBox: OleVariant): WordBool; dispid 58;
    function IGetBox(var bBox: Double): WordBool; dispid 59;
  end;

// *********************************************************************//
// Interface: IDimension
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D3A-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDimension = interface(IDispatch)
    ['{83A33D3A-27C5-11CE-BFD4-00400513BB57}']
    function Get_Value: Double; safecall;
    procedure Set_Value(retval: Double); safecall;
    function Get_SystemValue: Double; safecall;
    procedure Set_SystemValue(retval: Double); safecall;
    function GetUserValueIn(const doc: IDispatch): Double; safecall;
    function IGetUserValueIn(const doc: IModelDoc): Double; safecall;
    procedure SetUserValueIn(const doc: IDispatch; newValue: Double); safecall;
    procedure ISetUserValueIn(const doc: IModelDoc; newValue: Double); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const retval: WideString); safecall;
    function GetToleranceType: Integer; safecall;
    function SetToleranceType(newType: Integer): WordBool; safecall;
    function GetToleranceValues: OleVariant; safecall;
    function IGetToleranceValues: Double; safecall;
    function SetToleranceValues(tolMin: Double; tolMax: Double): WordBool; safecall;
    function GetToleranceFontInfo: OleVariant; safecall;
    function IGetToleranceFontInfo: Double; safecall;
    function SetToleranceFontInfo(useFontScale: Integer; tolScale: Double; tolHeight: Double): WordBool; safecall;
    function GetToleranceFitValues: WideString; safecall;
    function SetToleranceFitValues(const newLValue: WideString; const newUValue: WideString): WordBool; safecall;
    function Get_ReadOnly: WordBool; safecall;
    procedure Set_ReadOnly(retval: WordBool); safecall;
    function Get_FullName: WideString; safecall;
    function Get_DrivenState: Integer; safecall;
    procedure Set_DrivenState(retval: Integer); safecall;
    function IsReference: WordBool; safecall;
    function IsAppliedToAllConfigurations: WordBool; safecall;
    function SetSystemValue2(newValue: Double; whichConfigurations: Integer): Integer; safecall;
    function SetValue2(newValue: Double; whichConfigurations: Integer): Integer; safecall;
    function SetUserValueIn2(const doc: IDispatch; newValue: Double; whichConfigurations: Integer): Integer; safecall;
    function ISetUserValueIn2(const doc: IModelDoc; newValue: Double; whichConfigurations: Integer): Integer; safecall;
    function GetArcEndCondition(index: Integer): Integer; safecall;
    function SetArcEndCondition(index: Integer; condition: Integer): Integer; safecall;
    function GetValue2(const configName: WideString): Double; safecall;
    function GetSystemValue2(const configName: WideString): Double; safecall;
    property Value: Double read Get_Value write Set_Value;
    property SystemValue: Double read Get_SystemValue write Set_SystemValue;
    property Name: WideString read Get_Name write Set_Name;
    property ReadOnly: WordBool read Get_ReadOnly write Set_ReadOnly;
    property FullName: WideString read Get_FullName;
    property DrivenState: Integer read Get_DrivenState write Set_DrivenState;
  end;

// *********************************************************************//
// DispIntf:  IDimensionDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D3A-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDimensionDisp = dispinterface
    ['{83A33D3A-27C5-11CE-BFD4-00400513BB57}']
    property Value: Double dispid 1;
    property SystemValue: Double dispid 2;
    function GetUserValueIn(const doc: IDispatch): Double; dispid 3;
    function IGetUserValueIn(const doc: IModelDoc): Double; dispid 4;
    procedure SetUserValueIn(const doc: IDispatch; newValue: Double); dispid 5;
    procedure ISetUserValueIn(const doc: IModelDoc; newValue: Double); dispid 6;
    property Name: WideString dispid 7;
    function GetToleranceType: Integer; dispid 8;
    function SetToleranceType(newType: Integer): WordBool; dispid 9;
    function GetToleranceValues: OleVariant; dispid 10;
    function IGetToleranceValues: Double; dispid 11;
    function SetToleranceValues(tolMin: Double; tolMax: Double): WordBool; dispid 12;
    function GetToleranceFontInfo: OleVariant; dispid 13;
    function IGetToleranceFontInfo: Double; dispid 14;
    function SetToleranceFontInfo(useFontScale: Integer; tolScale: Double; tolHeight: Double): WordBool; dispid 15;
    function GetToleranceFitValues: WideString; dispid 16;
    function SetToleranceFitValues(const newLValue: WideString; const newUValue: WideString): WordBool; dispid 17;
    property ReadOnly: WordBool dispid 18;
    property FullName: WideString readonly dispid 19;
    property DrivenState: Integer dispid 20;
    function IsReference: WordBool; dispid 21;
    function IsAppliedToAllConfigurations: WordBool; dispid 22;
    function SetSystemValue2(newValue: Double; whichConfigurations: Integer): Integer; dispid 23;
    function SetValue2(newValue: Double; whichConfigurations: Integer): Integer; dispid 24;
    function SetUserValueIn2(const doc: IDispatch; newValue: Double; whichConfigurations: Integer): Integer; dispid 25;
    function ISetUserValueIn2(const doc: IModelDoc; newValue: Double; whichConfigurations: Integer): Integer; dispid 26;
    function GetArcEndCondition(index: Integer): Integer; dispid 27;
    function SetArcEndCondition(index: Integer; condition: Integer): Integer; dispid 28;
    function GetValue2(const configName: WideString): Double; dispid 29;
    function GetSystemValue2(const configName: WideString): Double; dispid 30;
  end;

// *********************************************************************//
// Interface: IEnumDisplayDimensions
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33DAB-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumDisplayDimensions = interface(IUnknown)
    ['{83A33DAB-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: IDisplayDimension; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumDisplayDimensions): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IDisplayDimension
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA1-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDisplayDimension = interface(IDispatch)
    ['{83A33DA1-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: IDisplayDimension; safecall;
    function GetDisplayData: IDispatch; safecall;
    function IGetDisplayData: IDisplayData; safecall;
    function Get_WitnessVisibility: Integer; safecall;
    procedure Set_WitnessVisibility(retval: Integer); safecall;
    function Get_LeaderVisibility: Integer; safecall;
    procedure Set_LeaderVisibility(retval: Integer); safecall;
    function Get_BrokenLeader: WordBool; safecall;
    procedure Set_BrokenLeader(retval: WordBool); safecall;
    function Get_SmartWitness: WordBool; safecall;
    procedure Set_SmartWitness(retval: WordBool); safecall;
    function Get_ShowParenthesis: WordBool; safecall;
    procedure Set_ShowParenthesis(retval: WordBool); safecall;
    function Get_ArrowSide: Integer; safecall;
    procedure Set_ArrowSide(retval: Integer); safecall;
    function Get_ShowDimensionValue: WordBool; safecall;
    procedure Set_ShowDimensionValue(retval: WordBool); safecall;
    function GetText(whichText: Integer): WideString; safecall;
    procedure SetText(whichText: Integer; const text: WideString); safecall;
    function GetDimension: IDispatch; safecall;
    function IGetDimension: IDimension; safecall;
    function GetUseDocTextFormat: WordBool; safecall;
    function GetTextFormat: IDispatch; safecall;
    function IGetTextFormat: ITextFormat; safecall;
    function SetTextFormat(textFormatType: Integer; const textFormat: IDispatch): WordBool; safecall;
    function ISetTextFormat(textFormatType: Integer; const textFormat: ITextFormat): WordBool; safecall;
    function GetAnnotation: IDispatch; safecall;
    function IGetAnnotation: IAnnotation; safecall;
    function Get_SolidLeader: WordBool; safecall;
    procedure Set_SolidLeader(retval: WordBool); safecall;
    function Get_Diametric: WordBool; safecall;
    procedure Set_Diametric(retval: WordBool); safecall;
    function Get_DisplayAsLinear: WordBool; safecall;
    procedure Set_DisplayAsLinear(retval: WordBool); safecall;
    function GetUseDocSecondArrow: WordBool; safecall;
    function GetSecondArrow: WordBool; safecall;
    procedure SetSecondArrow(useDoc: WordBool; secondArrow: WordBool); safecall;
    function Get_ShortenedRadius: WordBool; safecall;
    procedure Set_ShortenedRadius(retval: WordBool); safecall;
    function Get_DimensionToInside: WordBool; safecall;
    procedure Set_DimensionToInside(retval: WordBool); safecall;
    function GetUseDocDual: WordBool; safecall;
    procedure SetDual(useDoc: WordBool); safecall;
    function GetUseDocArrowHeadStyle: WordBool; safecall;
    function GetArrowHeadStyle: Integer; safecall;
    procedure SetArrowHeadStyle(useDoc: WordBool; arrowHeadStyle: Integer); safecall;
    function Get_CenterText: WordBool; safecall;
    procedure Set_CenterText(retval: WordBool); safecall;
    function Get_Inspection: WordBool; safecall;
    procedure Set_Inspection(Inspection: WordBool); safecall;
    function GetUseDocPrecision: WordBool; safecall;
    function GetPrimaryPrecision: Integer; safecall;
    function GetAlternatePrecision: Integer; safecall;
    function GetPrimaryTolPrecision: Integer; safecall;
    function GetAlternateTolPrecision: Integer; safecall;
    function SetPrecision(useDoc: WordBool; primary: Integer; alternate: Integer; 
                          primaryTol: Integer; alternateTol: Integer): Integer; safecall;
    function GetAutoArcLengthLeader: WordBool; safecall;
    function GetArcLengthLeader: Integer; safecall;
    function SetArcLengthLeader(autoLeader: WordBool; leaderType: Integer): Integer; safecall;
    function GetUseDocUnits: WordBool; safecall;
    function GetUnits: Integer; safecall;
    function GetFractionBase: Integer; safecall;
    function GetFractionValue: Integer; safecall;
    function GetRoundToFraction: WordBool; safecall;
    function SetUnits(useDoc: WordBool; uType: Integer; fractBase: Integer; fractDenom: Integer; 
                      roundToFraction: WordBool): Integer; safecall;
    function GetUseDocBrokenLeader: WordBool; safecall;
    function GetBrokenLeader2: Integer; safecall;
    function SetBrokenLeader2(useDoc: WordBool; broken: Integer): Integer; safecall;
    function GetNext2: IDispatch; safecall;
    function IGetNext2: IDisplayDimension; safecall;
    function GetType: Integer; safecall;
    function Get_Scale2: Double; safecall;
    procedure Set_Scale2(retval: Double); safecall;
    function Get_DisplayAsChain: WordBool; safecall;
    procedure Set_DisplayAsChain(retval: WordBool); safecall;
    function GetNext3: IDispatch; safecall;
    function IGetNext3: IDisplayDimension; safecall;
    function AddDisplayEnt(type_: SYSINT; data: OleVariant): WordBool; safecall;
    function IAddDisplayEnt(type_: SYSINT; var data: Double): WordBool; safecall;
    function AddDisplayText(const text: WideString; position: OleVariant; const format: IDispatch; 
                            attachment: SYSINT; WidthFactor: Double): WordBool; safecall;
    function IAddDisplayText(const text: WideString; var position: Double; 
                             const format: ITextFormat; attachment: SYSINT; WidthFactor: Double): WordBool; safecall;
    function Get_Jogged: WordBool; safecall;
    procedure Set_Jogged(retval: WordBool); safecall;
    function AutoJogOrdinate: WordBool; safecall;
    property WitnessVisibility: Integer read Get_WitnessVisibility write Set_WitnessVisibility;
    property LeaderVisibility: Integer read Get_LeaderVisibility write Set_LeaderVisibility;
    property BrokenLeader: WordBool read Get_BrokenLeader write Set_BrokenLeader;
    property SmartWitness: WordBool read Get_SmartWitness write Set_SmartWitness;
    property ShowParenthesis: WordBool read Get_ShowParenthesis write Set_ShowParenthesis;
    property ArrowSide: Integer read Get_ArrowSide write Set_ArrowSide;
    property ShowDimensionValue: WordBool read Get_ShowDimensionValue write Set_ShowDimensionValue;
    property SolidLeader: WordBool read Get_SolidLeader write Set_SolidLeader;
    property Diametric: WordBool read Get_Diametric write Set_Diametric;
    property DisplayAsLinear: WordBool read Get_DisplayAsLinear write Set_DisplayAsLinear;
    property ShortenedRadius: WordBool read Get_ShortenedRadius write Set_ShortenedRadius;
    property DimensionToInside: WordBool read Get_DimensionToInside write Set_DimensionToInside;
    property CenterText: WordBool read Get_CenterText write Set_CenterText;
    property Inspection: WordBool read Get_Inspection write Set_Inspection;
    property Scale2: Double read Get_Scale2 write Set_Scale2;
    property DisplayAsChain: WordBool read Get_DisplayAsChain write Set_DisplayAsChain;
    property Jogged: WordBool read Get_Jogged write Set_Jogged;
  end;

// *********************************************************************//
// DispIntf:  IDisplayDimensionDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA1-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDisplayDimensionDisp = dispinterface
    ['{83A33DA1-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: IDisplayDimension; dispid 2;
    function GetDisplayData: IDispatch; dispid 3;
    function IGetDisplayData: IDisplayData; dispid 4;
    property WitnessVisibility: Integer dispid 5;
    property LeaderVisibility: Integer dispid 6;
    property BrokenLeader: WordBool dispid 7;
    property SmartWitness: WordBool dispid 8;
    property ShowParenthesis: WordBool dispid 9;
    property ArrowSide: Integer dispid 10;
    property ShowDimensionValue: WordBool dispid 11;
    function GetText(whichText: Integer): WideString; dispid 12;
    procedure SetText(whichText: Integer; const text: WideString); dispid 13;
    function GetDimension: IDispatch; dispid 14;
    function IGetDimension: IDimension; dispid 15;
    function GetUseDocTextFormat: WordBool; dispid 16;
    function GetTextFormat: IDispatch; dispid 17;
    function IGetTextFormat: ITextFormat; dispid 18;
    function SetTextFormat(textFormatType: Integer; const textFormat: IDispatch): WordBool; dispid 19;
    function ISetTextFormat(textFormatType: Integer; const textFormat: ITextFormat): WordBool; dispid 20;
    function GetAnnotation: IDispatch; dispid 21;
    function IGetAnnotation: IAnnotation; dispid 22;
    property SolidLeader: WordBool dispid 23;
    property Diametric: WordBool dispid 24;
    property DisplayAsLinear: WordBool dispid 25;
    function GetUseDocSecondArrow: WordBool; dispid 26;
    function GetSecondArrow: WordBool; dispid 27;
    procedure SetSecondArrow(useDoc: WordBool; secondArrow: WordBool); dispid 28;
    property ShortenedRadius: WordBool dispid 29;
    property DimensionToInside: WordBool dispid 30;
    function GetUseDocDual: WordBool; dispid 31;
    procedure SetDual(useDoc: WordBool); dispid 32;
    function GetUseDocArrowHeadStyle: WordBool; dispid 33;
    function GetArrowHeadStyle: Integer; dispid 34;
    procedure SetArrowHeadStyle(useDoc: WordBool; arrowHeadStyle: Integer); dispid 35;
    property CenterText: WordBool dispid 36;
    property Inspection: WordBool dispid 37;
    function GetUseDocPrecision: WordBool; dispid 38;
    function GetPrimaryPrecision: Integer; dispid 39;
    function GetAlternatePrecision: Integer; dispid 40;
    function GetPrimaryTolPrecision: Integer; dispid 41;
    function GetAlternateTolPrecision: Integer; dispid 42;
    function SetPrecision(useDoc: WordBool; primary: Integer; alternate: Integer; 
                          primaryTol: Integer; alternateTol: Integer): Integer; dispid 43;
    function GetAutoArcLengthLeader: WordBool; dispid 44;
    function GetArcLengthLeader: Integer; dispid 45;
    function SetArcLengthLeader(autoLeader: WordBool; leaderType: Integer): Integer; dispid 46;
    function GetUseDocUnits: WordBool; dispid 47;
    function GetUnits: Integer; dispid 48;
    function GetFractionBase: Integer; dispid 49;
    function GetFractionValue: Integer; dispid 50;
    function GetRoundToFraction: WordBool; dispid 51;
    function SetUnits(useDoc: WordBool; uType: Integer; fractBase: Integer; fractDenom: Integer; 
                      roundToFraction: WordBool): Integer; dispid 52;
    function GetUseDocBrokenLeader: WordBool; dispid 53;
    function GetBrokenLeader2: Integer; dispid 54;
    function SetBrokenLeader2(useDoc: WordBool; broken: Integer): Integer; dispid 55;
    function GetNext2: IDispatch; dispid 56;
    function IGetNext2: IDisplayDimension; dispid 57;
    function GetType: Integer; dispid 58;
    property Scale2: Double dispid 59;
    property DisplayAsChain: WordBool dispid 60;
    function GetNext3: IDispatch; dispid 61;
    function IGetNext3: IDisplayDimension; dispid 62;
    function AddDisplayEnt(type_: SYSINT; data: OleVariant): WordBool; dispid 63;
    function IAddDisplayEnt(type_: SYSINT; var data: Double): WordBool; dispid 64;
    function AddDisplayText(const text: WideString; position: OleVariant; const format: IDispatch; 
                            attachment: SYSINT; WidthFactor: Double): WordBool; dispid 65;
    function IAddDisplayText(const text: WideString; var position: Double; 
                             const format: ITextFormat; attachment: SYSINT; WidthFactor: Double): WordBool; dispid 66;
    property Jogged: WordBool dispid 67;
    function AutoJogOrdinate: WordBool; dispid 68;
  end;

// *********************************************************************//
// Interface: IDisplayData
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D9C-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDisplayData = interface(IDispatch)
    ['{83A33D9C-27C5-11CE-BFD4-00400513BB57}']
    function GetTextCount: Integer; safecall;
    function GetTextAtIndex(index: Integer): WideString; safecall;
    function GetTextHeightAtIndex(index: Integer): Double; safecall;
    function GetTextPositionAtIndex(index: Integer): OleVariant; safecall;
    function IGetTextPositionAtIndex(index: Integer): Double; safecall;
    function GetTextAngleAtIndex(index: Integer): Double; safecall;
    function GetTextRefPositionAtIndex(index: Integer): Integer; safecall;
    function GetTextInvertAtIndex(index: Integer): Integer; safecall;
    function GetTextFontAtIndex(index: Integer): WideString; safecall;
    function GetLineCount: Integer; safecall;
    function GetLineAtIndex(index: Integer): OleVariant; safecall;
    function IGetLineAtIndex(index: Integer): Double; safecall;
    function GetArcCount: Integer; safecall;
    function GetArcAtIndex(index: Integer): OleVariant; safecall;
    function IGetArcAtIndex(index: Integer): Double; safecall;
    function GetArrowHeadCount: Integer; safecall;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; safecall;
    function IGetArrowHeadAtIndex(index: Integer): Double; safecall;
    function GetTriangleCount: Integer; safecall;
    function GetTriangleAtIndex(index: Integer): OleVariant; safecall;
    function IGetTriangleAtIndex(index: Integer): Double; safecall;
    function GetPolylineCount: Integer; safecall;
    function GetPolylineSizeAtIndex(index: Integer): Integer; safecall;
    function GetPolylineAtIndex(index: Integer): OleVariant; safecall;
    function IGetPolylineAtIndex(index: Integer): Double; safecall;
    function GetEllipseCount: Integer; safecall;
    function GetEllipseAtIndex(index: Integer): OleVariant; safecall;
    function IGetEllipseAtIndex(index: Integer): Double; safecall;
    function GetTextLineSpacingAtIndex(index: Integer): Double; safecall;
    function GetLineAtIndex2(index: Integer): OleVariant; safecall;
    function IGetLineAtIndex2(index: Integer): Double; safecall;
    function GetArcAtIndex2(index: Integer): OleVariant; safecall;
    function IGetArcAtIndex2(index: Integer): Double; safecall;
    function GetPolylineSizeAtIndex2(index: Integer): Integer; safecall;
    function GetPolylineAtIndex2(index: Integer): OleVariant; safecall;
    function IGetPolylineAtIndex2(index: Integer): Double; safecall;
    function GetEllipseAtIndex2(index: Integer): OleVariant; safecall;
    function IGetEllipseAtIndex2(index: Integer): Double; safecall;
    procedure Dummy1; safecall;
    procedure Dummy2; safecall;
    procedure Dummy3; safecall;
    procedure Dummy4; safecall;
    function GetParabolaCount: Integer; safecall;
    function GetParabolaAtIndex(index: Integer): OleVariant; safecall;
    function IGetParabolaAtIndex(index: Integer): Double; safecall;
    function GetPolygonCount: Integer; safecall;
    function GetPolygonSizeAtIndex(index: Integer): Integer; safecall;
    function GetPolygonAtIndex(index: Integer): OleVariant; safecall;
    function IGetPolygonAtIndex(index: Integer): Double; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDisplayDataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D9C-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDisplayDataDisp = dispinterface
    ['{83A33D9C-27C5-11CE-BFD4-00400513BB57}']
    function GetTextCount: Integer; dispid 1;
    function GetTextAtIndex(index: Integer): WideString; dispid 2;
    function GetTextHeightAtIndex(index: Integer): Double; dispid 3;
    function GetTextPositionAtIndex(index: Integer): OleVariant; dispid 4;
    function IGetTextPositionAtIndex(index: Integer): Double; dispid 5;
    function GetTextAngleAtIndex(index: Integer): Double; dispid 6;
    function GetTextRefPositionAtIndex(index: Integer): Integer; dispid 7;
    function GetTextInvertAtIndex(index: Integer): Integer; dispid 8;
    function GetTextFontAtIndex(index: Integer): WideString; dispid 9;
    function GetLineCount: Integer; dispid 10;
    function GetLineAtIndex(index: Integer): OleVariant; dispid 11;
    function IGetLineAtIndex(index: Integer): Double; dispid 12;
    function GetArcCount: Integer; dispid 13;
    function GetArcAtIndex(index: Integer): OleVariant; dispid 14;
    function IGetArcAtIndex(index: Integer): Double; dispid 15;
    function GetArrowHeadCount: Integer; dispid 16;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; dispid 17;
    function IGetArrowHeadAtIndex(index: Integer): Double; dispid 18;
    function GetTriangleCount: Integer; dispid 19;
    function GetTriangleAtIndex(index: Integer): OleVariant; dispid 20;
    function IGetTriangleAtIndex(index: Integer): Double; dispid 21;
    function GetPolylineCount: Integer; dispid 22;
    function GetPolylineSizeAtIndex(index: Integer): Integer; dispid 23;
    function GetPolylineAtIndex(index: Integer): OleVariant; dispid 24;
    function IGetPolylineAtIndex(index: Integer): Double; dispid 25;
    function GetEllipseCount: Integer; dispid 26;
    function GetEllipseAtIndex(index: Integer): OleVariant; dispid 27;
    function IGetEllipseAtIndex(index: Integer): Double; dispid 28;
    function GetTextLineSpacingAtIndex(index: Integer): Double; dispid 29;
    function GetLineAtIndex2(index: Integer): OleVariant; dispid 30;
    function IGetLineAtIndex2(index: Integer): Double; dispid 31;
    function GetArcAtIndex2(index: Integer): OleVariant; dispid 32;
    function IGetArcAtIndex2(index: Integer): Double; dispid 33;
    function GetPolylineSizeAtIndex2(index: Integer): Integer; dispid 34;
    function GetPolylineAtIndex2(index: Integer): OleVariant; dispid 35;
    function IGetPolylineAtIndex2(index: Integer): Double; dispid 36;
    function GetEllipseAtIndex2(index: Integer): OleVariant; dispid 37;
    function IGetEllipseAtIndex2(index: Integer): Double; dispid 38;
    procedure Dummy1; dispid 39;
    procedure Dummy2; dispid 40;
    procedure Dummy3; dispid 41;
    procedure Dummy4; dispid 42;
    function GetParabolaCount: Integer; dispid 43;
    function GetParabolaAtIndex(index: Integer): OleVariant; dispid 44;
    function IGetParabolaAtIndex(index: Integer): Double; dispid 45;
    function GetPolygonCount: Integer; dispid 46;
    function GetPolygonSizeAtIndex(index: Integer): Integer; dispid 47;
    function GetPolygonAtIndex(index: Integer): OleVariant; dispid 48;
    function IGetPolygonAtIndex(index: Integer): Double; dispid 49;
  end;

// *********************************************************************//
// Interface: ITextFormat
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DB9-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ITextFormat = interface(IDispatch)
    ['{83A33DB9-27C5-11CE-BFD4-00400513BB57}']
    function GetAllValues: OleVariant; safecall;
    function IGetAllValues(count: Integer): Double; safecall;
    function Get_Italic: WordBool; safecall;
    procedure Set_Italic(Italic: WordBool); safecall;
    function Get_Underline: WordBool; safecall;
    procedure Set_Underline(Underline: WordBool); safecall;
    function Get_Strikeout: WordBool; safecall;
    procedure Set_Strikeout(Strikeout: WordBool); safecall;
    function Get_Bold: WordBool; safecall;
    procedure Set_Bold(Bold: WordBool); safecall;
    function Get_Escapement: Double; safecall;
    procedure Set_Escapement(Escapement: Double); safecall;
    function Get_LineSpacing: Double; safecall;
    procedure Set_LineSpacing(spacing: Double); safecall;
    function Get_CharHeight: Double; safecall;
    procedure Set_CharHeight(height: Double); safecall;
    function Get_CharHeightInPts: SYSINT; safecall;
    procedure Set_CharHeightInPts(height: SYSINT); safecall;
    function IsHeightSpecifiedInPts: WordBool; safecall;
    function Get_TypeFaceName: WideString; safecall;
    procedure Set_TypeFaceName(const Name: WideString); safecall;
    function Get_WidthFactor: Double; safecall;
    procedure Set_WidthFactor(spacing: Double); safecall;
    function Get_ObliqueAngle: Double; safecall;
    procedure Set_ObliqueAngle(ObliqueAngle: Double); safecall;
    function Get_LineLength: Double; safecall;
    procedure Set_LineLength(LineLength: Double); safecall;
    function Get_Vertical: WordBool; safecall;
    procedure Set_Vertical(Vertical: WordBool); safecall;
    function Get_BackWards: WordBool; safecall;
    procedure Set_BackWards(BackWards: WordBool); safecall;
    function Get_UpsideDown: WordBool; safecall;
    procedure Set_UpsideDown(UpsideDown: WordBool); safecall;
    property Italic: WordBool read Get_Italic write Set_Italic;
    property Underline: WordBool read Get_Underline write Set_Underline;
    property Strikeout: WordBool read Get_Strikeout write Set_Strikeout;
    property Bold: WordBool read Get_Bold write Set_Bold;
    property Escapement: Double read Get_Escapement write Set_Escapement;
    property LineSpacing: Double read Get_LineSpacing write Set_LineSpacing;
    property CharHeight: Double read Get_CharHeight write Set_CharHeight;
    property CharHeightInPts: SYSINT read Get_CharHeightInPts write Set_CharHeightInPts;
    property TypeFaceName: WideString read Get_TypeFaceName write Set_TypeFaceName;
    property WidthFactor: Double read Get_WidthFactor write Set_WidthFactor;
    property ObliqueAngle: Double read Get_ObliqueAngle write Set_ObliqueAngle;
    property LineLength: Double read Get_LineLength write Set_LineLength;
    property Vertical: WordBool read Get_Vertical write Set_Vertical;
    property BackWards: WordBool read Get_BackWards write Set_BackWards;
    property UpsideDown: WordBool read Get_UpsideDown write Set_UpsideDown;
  end;

// *********************************************************************//
// DispIntf:  ITextFormatDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DB9-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ITextFormatDisp = dispinterface
    ['{83A33DB9-27C5-11CE-BFD4-00400513BB57}']
    function GetAllValues: OleVariant; dispid 1;
    function IGetAllValues(count: Integer): Double; dispid 2;
    property Italic: WordBool dispid 3;
    property Underline: WordBool dispid 4;
    property Strikeout: WordBool dispid 5;
    property Bold: WordBool dispid 6;
    property Escapement: Double dispid 7;
    property LineSpacing: Double dispid 8;
    property CharHeight: Double dispid 9;
    property CharHeightInPts: SYSINT dispid 10;
    function IsHeightSpecifiedInPts: WordBool; dispid 11;
    property TypeFaceName: WideString dispid 12;
    property WidthFactor: Double dispid 13;
    property ObliqueAngle: Double dispid 14;
    property LineLength: Double dispid 15;
    property Vertical: WordBool dispid 16;
    property BackWards: WordBool dispid 17;
    property UpsideDown: WordBool dispid 18;
  end;

// *********************************************************************//
// Interface: IAnnotation
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA9-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IAnnotation = interface(IDispatch)
    ['{83A33DA9-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: IAnnotation; safecall;
    function GetDisplayData: IDispatch; safecall;
    function IGetDisplayData: IDisplayData; safecall;
    function GetType: Integer; safecall;
    function GetSpecificAnnotation: IDispatch; safecall;
    function IGetSpecificAnnotation: IUnknown; safecall;
    function GetPosition: OleVariant; safecall;
    function IGetPosition: Double; safecall;
    function SetPosition(x: Double; y: Double; z: Double): WordBool; safecall;
    function GetLeaderCount: Integer; safecall;
    function GetLeaderPointsAtIndex(index: Integer): OleVariant; safecall;
    function IGetLeaderPointsAtIndex(index: Integer; pointCount: Integer): Double; safecall;
    function GetArrowHeadStyleAtIndex(index: Integer): Integer; safecall;
    function SetArrowHeadStyleAtIndex(index: Integer; arrowHeadStyle: Integer): Integer; safecall;
    function GetLeader: WordBool; safecall;
    function GetBentLeader: WordBool; safecall;
    function GetLeaderSide: Integer; safecall;
    function GetSmartArrowHeadStyle: WordBool; safecall;
    function SetLeader(leader: WordBool; leaderSide: Integer; smartArrowHeadStyle: WordBool; 
                       bentLeader: WordBool): Integer; safecall;
    function GetName: WideString; safecall;
    function SetName(const nameIn: WideString): WordBool; safecall;
    function GetVisualProperties: OleVariant; safecall;
    function IGetVisualProperties: Integer; safecall;
    function Get_Layer: WideString; safecall;
    procedure Set_Layer(const retval: WideString); safecall;
    function Get_LayerOverride: SYSINT; safecall;
    procedure Set_LayerOverride(retval: SYSINT); safecall;
    function Get_Color: Integer; safecall;
    procedure Set_Color(retval: Integer); safecall;
    function Get_Style: Integer; safecall;
    procedure Set_Style(retval: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(retval: Integer); safecall;
    function IGetAttachedEntityCount: Integer; safecall;
    function GetAttachedEntities: OleVariant; safecall;
    function IGetAttachedEntities: IUnknown; safecall;
    function GetAttachedEntityTypes: OleVariant; safecall;
    function IGetAttachedEntityTypes: Integer; safecall;
    function GetNext2: IDispatch; safecall;
    function IGetNext2: IAnnotation; safecall;
    function Get_Visible: Integer; safecall;
    procedure Set_Visible(retval: Integer); safecall;
    function GetTextFormatCount: Integer; safecall;
    function GetUseDocTextFormat(index: Integer): WordBool; safecall;
    function GetTextFormat(index: Integer): IDispatch; safecall;
    function IGetTextFormat(index: Integer): ITextFormat; safecall;
    function SetTextFormat(index: Integer; useDoc: WordBool; const textFormat: IDispatch): WordBool; safecall;
    function ISetTextFormat(index: Integer; useDoc: WordBool; const textFormat: ITextFormat): WordBool; safecall;
    function GetLeaderPerpendicular: WordBool; safecall;
    function GetLeaderAllAround: WordBool; safecall;
    function SetLeader2(leader: WordBool; leaderSide: Integer; smartArrowHeadStyle: WordBool; 
                        bentLeader: WordBool; perpendicular: WordBool; allAround: WordBool): Integer; safecall;
    function Select(appendFlag: WordBool): WordBool; safecall;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; safecall;
    function DeSelect: WordBool; safecall;
    property Layer: WideString read Get_Layer write Set_Layer;
    property LayerOverride: SYSINT read Get_LayerOverride write Set_LayerOverride;
    property Color: Integer read Get_Color write Set_Color;
    property Style: Integer read Get_Style write Set_Style;
    property Width: Integer read Get_Width write Set_Width;
    property Visible: Integer read Get_Visible write Set_Visible;
  end;

// *********************************************************************//
// DispIntf:  IAnnotationDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA9-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IAnnotationDisp = dispinterface
    ['{83A33DA9-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: IAnnotation; dispid 2;
    function GetDisplayData: IDispatch; dispid 3;
    function IGetDisplayData: IDisplayData; dispid 4;
    function GetType: Integer; dispid 5;
    function GetSpecificAnnotation: IDispatch; dispid 6;
    function IGetSpecificAnnotation: IUnknown; dispid 7;
    function GetPosition: OleVariant; dispid 8;
    function IGetPosition: Double; dispid 9;
    function SetPosition(x: Double; y: Double; z: Double): WordBool; dispid 10;
    function GetLeaderCount: Integer; dispid 11;
    function GetLeaderPointsAtIndex(index: Integer): OleVariant; dispid 12;
    function IGetLeaderPointsAtIndex(index: Integer; pointCount: Integer): Double; dispid 13;
    function GetArrowHeadStyleAtIndex(index: Integer): Integer; dispid 14;
    function SetArrowHeadStyleAtIndex(index: Integer; arrowHeadStyle: Integer): Integer; dispid 15;
    function GetLeader: WordBool; dispid 16;
    function GetBentLeader: WordBool; dispid 17;
    function GetLeaderSide: Integer; dispid 18;
    function GetSmartArrowHeadStyle: WordBool; dispid 19;
    function SetLeader(leader: WordBool; leaderSide: Integer; smartArrowHeadStyle: WordBool; 
                       bentLeader: WordBool): Integer; dispid 20;
    function GetName: WideString; dispid 21;
    function SetName(const nameIn: WideString): WordBool; dispid 22;
    function GetVisualProperties: OleVariant; dispid 23;
    function IGetVisualProperties: Integer; dispid 24;
    property Layer: WideString dispid 25;
    property LayerOverride: SYSINT dispid 26;
    property Color: Integer dispid 27;
    property Style: Integer dispid 28;
    property Width: Integer dispid 29;
    function IGetAttachedEntityCount: Integer; dispid 30;
    function GetAttachedEntities: OleVariant; dispid 31;
    function IGetAttachedEntities: IUnknown; dispid 32;
    function GetAttachedEntityTypes: OleVariant; dispid 33;
    function IGetAttachedEntityTypes: Integer; dispid 34;
    function GetNext2: IDispatch; dispid 35;
    function IGetNext2: IAnnotation; dispid 36;
    property Visible: Integer dispid 37;
    function GetTextFormatCount: Integer; dispid 38;
    function GetUseDocTextFormat(index: Integer): WordBool; dispid 39;
    function GetTextFormat(index: Integer): IDispatch; dispid 40;
    function IGetTextFormat(index: Integer): ITextFormat; dispid 41;
    function SetTextFormat(index: Integer; useDoc: WordBool; const textFormat: IDispatch): WordBool; dispid 42;
    function ISetTextFormat(index: Integer; useDoc: WordBool; const textFormat: ITextFormat): WordBool; dispid 43;
    function GetLeaderPerpendicular: WordBool; dispid 44;
    function GetLeaderAllAround: WordBool; dispid 45;
    function SetLeader2(leader: WordBool; leaderSide: Integer; smartArrowHeadStyle: WordBool; 
                        bentLeader: WordBool; perpendicular: WordBool; allAround: WordBool): Integer; dispid 46;
    function Select(appendFlag: WordBool): WordBool; dispid 47;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; dispid 48;
    function DeSelect: WordBool; dispid 49;
  end;

// *********************************************************************//
// Interface: IEnumLoops
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33D5D-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumLoops = interface(IUnknown)
    ['{83A33D5D-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: ILoop; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumLoops): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumFaces
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33D5B-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumFaces = interface(IUnknown)
    ['{83A33D5B-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: IFace; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumFaces): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPartDoc
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D32-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IPartDoc = interface(IDispatch)
    ['{83A33D32-27C5-11CE-BFD4-00400513BB57}']
    function Get_MaterialUserName: WideString; safecall;
    procedure Set_MaterialUserName(const retval: WideString); safecall;
    function Get_MaterialIdName: WideString; safecall;
    procedure Set_MaterialIdName(const retval: WideString); safecall;
    function Get_MaterialPropertyValues: OleVariant; safecall;
    procedure Set_MaterialPropertyValues(retval: OleVariant); safecall;
    function FirstFeature: IDispatch; safecall;
    function IFirstFeature: IFeature; safecall;
    function FeatureByName(const Name: WideString): IDispatch; safecall;
    function IFeatureByName(const Name: WideString): IFeature; safecall;
    function FeatureById(Id: Integer): IDispatch; safecall;
    function IFeatureById(Id: Integer): IFeature; safecall;
    function Body: IDispatch; safecall;
    function IBodyObject: IBody; safecall;
    procedure Dummy18; safecall;
    procedure FeatureExtrusion(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                               t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                               dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; dang1: Double; 
                               dang2: Double; offsetReverse1: WordBool; offsetReverse2: WordBool); safecall;
    procedure FeatureRevolve(angle: Double; reverseDir: WordBool; angle2: Double; revType: Integer); safecall;
    procedure FeatureRevolveCut(angle: Double; reverseDir: WordBool; angle2: Double; 
                                revType: Integer); safecall;
    function GetTessTriangles(noConversion: WordBool): OleVariant; safecall;
    function GetTessNorms: OleVariant; safecall;
    function GetProcessedBody: IDispatch; safecall;
    function IGetProcessedBody: IBody; safecall;
    function GetPartBox(noConversion: WordBool): OleVariant; safecall;
    function CreateNewBody: IDispatch; safecall;
    function ICreateNewBody: IBody; safecall;
    procedure EditRebuild; safecall;
    procedure Dummy17; safecall;
    procedure Dummy19; safecall;
    procedure ForceRebuild; safecall;
    procedure EditUnsuppressDependent; safecall;
    procedure EditRollforward; safecall;
    procedure InsertStockTurned; safecall;
    procedure EditUnsuppress; safecall;
    procedure MakeSection; safecall;
    procedure Dumpfacets; safecall;
    procedure FeatureStock; safecall;
    procedure EditRollback; safecall;
    procedure EditSuppress; safecall;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; safecall;
    function GetPropertyExtension(Id: Integer): OleVariant; safecall;
    procedure MirrorFeature; safecall;
    procedure ResetPropertyExtension; safecall;
    procedure Dummy1; safecall;
    procedure Dummy2; safecall;
    procedure Dummy3; safecall;
    procedure Dummy4; safecall;
    procedure Dummy5; safecall;
    procedure Dummy6; safecall;
    procedure Dummy7; safecall;
    procedure Dummy8; safecall;
    procedure Dummy9; safecall;
    procedure Dummy10; safecall;
    procedure Dummy11; safecall;
    procedure Dummy12; safecall;
    procedure Dummy13; safecall;
    procedure Dummy14; safecall;
    procedure Dummy15; safecall;
    procedure Dummy16; safecall;
    function GetProcessedBodyWithSelFace: IDispatch; safecall;
    function IGetProcessedBodyWithSelFace: IBody; safecall;
    function GetTessTriStrips(noConversion: WordBool): OleVariant; safecall;
    function GetTessTriStripNorms: OleVariant; safecall;
    procedure MirrorPart; safecall;
    function IGetTessTriangles(noConversion: WordBool): Single; safecall;
    function IGetTessNorms: Single; safecall;
    function GetTessTriangleCount: Integer; safecall;
    function IGetPartBox(noConversion: WordBool): Double; safecall;
    function IGetTessTriStrips(noConversion: WordBool): Single; safecall;
    function IGetTessTriStripNorms: Single; safecall;
    function GetTessTriStripSize: Integer; safecall;
    function GetEntityByName(const Name: WideString; entityType: Integer): IDispatch; safecall;
    function IGetEntityByName(const Name: WideString; entityType: Integer): IEntity; safecall;
    function GetEntityName(const entity: IDispatch): WideString; safecall;
    function IGetEntityName(const entity: IEntity): WideString; safecall;
    function SetEntityName(const entity: IDispatch; const StringValue: WideString): WordBool; safecall;
    function ISetEntityName(const entity: IEntity; const StringValue: WideString): WordBool; safecall;
    function ReorderFeature(const featureToMove: WideString; const moveAfterFeature: WideString): WordBool; safecall;
    function EnumRelatedBodies: IEnumBodies; safecall;
    function GetSectionedBody(const viewIn: IDispatch): IDispatch; safecall;
    function IGetSectionedBody(const viewIn: IModelView): IBody; safecall;
    function EnumRelatedSectionedBodies(const viewIn: IModelView): IEnumBodies; safecall;
    function Get_IMaterialPropertyValues: Double; safecall;
    procedure Set_IMaterialPropertyValues(var retval: Double); safecall;
    procedure FeatureRevolveThin(angle: Double; reverseDir: WordBool; angle2: Double; 
                                 revType: Integer; thickness1: Double; thickness2: Double; 
                                 reverseThinDir: Integer); safecall;
    procedure FeatureRevolveThinCut(angle: Double; reverseDir: WordBool; angle2: Double; 
                                    revType: Integer; thickness1: Double; thickness2: Double; 
                                    reverseThinDir: Integer); safecall;
    procedure FeatureExtrusionThin(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                                   t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                                   dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; 
                                   dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                                   offsetReverse2: WordBool; thk1: Double; thk2: Double; 
                                   endThk: Double; revThinDir: Integer; capEnds: Integer; 
                                   addBends: WordBool; bendRad: Double); safecall;
    function InsertBends(radius: Double; const useBendTable: WideString; useKfactor: Double; 
                         useBendAllowance: Double; useAutoRelief: WordBool; offsetRatio: Double): WordBool; safecall;
    function CreateFeatureFromBody(const Body: IDispatch): IDispatch; safecall;
    function ICreateFeatureFromBody(const Body: IBody): IFeature; safecall;
    function CreateFeatureFromBody2(const Body: IDispatch; makeRefSurface: WordBool): IDispatch; safecall;
    function ICreateFeatureFromBody2(const Body: IBody; makeRefSurface: WordBool): IFeature; safecall;
    function ImportDiagnosis(closeAllGaps: WordBool; removeFaces: WordBool; fixFaces: WordBool; 
                             options: Integer): Integer; safecall;
    function DeleteEntityName(const entity: IDispatch): WordBool; safecall;
    function IDeleteEntityName(const entity: IEntity): WordBool; safecall;
    function GetTessTriStripEdges: OleVariant; safecall;
    function IGetTessTriStripEdges: Integer; safecall;
    function IGetTessTriStripEdgeSize: Integer; safecall;
    function EnumBodies(bodyType: Integer): IEnumBodies; safecall;
    function GetBodies(bodyType: Integer): OleVariant; safecall;
    function GetRelatedBodies: OleVariant; safecall;
    function GetRelatedSectionedBodies(const viewIn: IDispatch): OleVariant; safecall;
    function InsertBends2(radius: Double; const useBendTable: WideString; useKfactor: Double; 
                          useBendAllowance: Double; useAutoRelief: WordBool; offsetRatio: Double; 
                          doFlatten: WordBool): WordBool; safecall;
    function CreateFeatureFromBody3(const Body: IDispatch; makeRefSurface: WordBool; 
                                    options: Integer): IDispatch; safecall;
    function ICreateFeatureFromBody3(const Body: IBody; makeRefSurface: WordBool; options: Integer): IFeature; safecall;
    function GetMateReferenceEntity: IDispatch; safecall;
    procedure FeatureExtrusion2(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                                t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                                dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; dang1: Double; 
                                dang2: Double; offsetReverse1: WordBool; offsetReverse2: WordBool; 
                                merge: WordBool); safecall;
    procedure FeatureExtrusionThin2(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                                    t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                                    dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; 
                                    dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                                    offsetReverse2: WordBool; merge: WordBool; thk1: Double; 
                                    thk2: Double; endThk: Double; revThinDir: Integer; 
                                    capEnds: Integer; addBends: WordBool; bendRad: Double); safecall;
    function CreateSurfaceFeatureFromBody(const Body: IDispatch; options: Integer): OleVariant; safecall;
    function ICreateSurfaceFeatureFromBodyCount(const Body: IBody; options: Integer): Integer; safecall;
    function ICreateSurfaceFeatureFromBody: IFeature; safecall;
    property MaterialUserName: WideString read Get_MaterialUserName write Set_MaterialUserName;
    property MaterialIdName: WideString read Get_MaterialIdName write Set_MaterialIdName;
    property MaterialPropertyValues: OleVariant read Get_MaterialPropertyValues write Set_MaterialPropertyValues;
  end;

// *********************************************************************//
// DispIntf:  IPartDocDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D32-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IPartDocDisp = dispinterface
    ['{83A33D32-27C5-11CE-BFD4-00400513BB57}']
    property MaterialUserName: WideString dispid 1;
    property MaterialIdName: WideString dispid 2;
    property MaterialPropertyValues: OleVariant dispid 3;
    function FirstFeature: IDispatch; dispid 4;
    function IFirstFeature: IFeature; dispid 53;
    function FeatureByName(const Name: WideString): IDispatch; dispid 5;
    function IFeatureByName(const Name: WideString): IFeature; dispid 54;
    function FeatureById(Id: Integer): IDispatch; dispid 6;
    function IFeatureById(Id: Integer): IFeature; dispid 55;
    function Body: IDispatch; dispid 7;
    function IBodyObject: IBody; dispid 56;
    procedure Dummy18; dispid 8;
    procedure FeatureExtrusion(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                               t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                               dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; dang1: Double; 
                               dang2: Double; offsetReverse1: WordBool; offsetReverse2: WordBool); dispid 9;
    procedure FeatureRevolve(angle: Double; reverseDir: WordBool; angle2: Double; revType: Integer); dispid 10;
    procedure FeatureRevolveCut(angle: Double; reverseDir: WordBool; angle2: Double; 
                                revType: Integer); dispid 11;
    function GetTessTriangles(noConversion: WordBool): OleVariant; dispid 12;
    function GetTessNorms: OleVariant; dispid 13;
    function GetProcessedBody: IDispatch; dispid 14;
    function IGetProcessedBody: IBody; dispid 57;
    function GetPartBox(noConversion: WordBool): OleVariant; dispid 15;
    function CreateNewBody: IDispatch; dispid 16;
    function ICreateNewBody: IBody; dispid 58;
    procedure EditRebuild; dispid 17;
    procedure Dummy17; dispid 18;
    procedure Dummy19; dispid 19;
    procedure ForceRebuild; dispid 20;
    procedure EditUnsuppressDependent; dispid 21;
    procedure EditRollforward; dispid 22;
    procedure InsertStockTurned; dispid 23;
    procedure EditUnsuppress; dispid 24;
    procedure MakeSection; dispid 25;
    procedure Dumpfacets; dispid 26;
    procedure FeatureStock; dispid 27;
    procedure EditRollback; dispid 28;
    procedure EditSuppress; dispid 29;
    function AddPropertyExtension(PropertyExtension: OleVariant): Integer; dispid 30;
    function GetPropertyExtension(Id: Integer): OleVariant; dispid 31;
    procedure MirrorFeature; dispid 32;
    procedure ResetPropertyExtension; dispid 33;
    procedure Dummy1; dispid 34;
    procedure Dummy2; dispid 35;
    procedure Dummy3; dispid 36;
    procedure Dummy4; dispid 37;
    procedure Dummy5; dispid 38;
    procedure Dummy6; dispid 39;
    procedure Dummy7; dispid 40;
    procedure Dummy8; dispid 41;
    procedure Dummy9; dispid 42;
    procedure Dummy10; dispid 43;
    procedure Dummy11; dispid 44;
    procedure Dummy12; dispid 45;
    procedure Dummy13; dispid 46;
    procedure Dummy14; dispid 47;
    procedure Dummy15; dispid 48;
    procedure Dummy16; dispid 49;
    function GetProcessedBodyWithSelFace: IDispatch; dispid 50;
    function IGetProcessedBodyWithSelFace: IBody; dispid 59;
    function GetTessTriStrips(noConversion: WordBool): OleVariant; dispid 51;
    function GetTessTriStripNorms: OleVariant; dispid 52;
    procedure MirrorPart; dispid 60;
    function IGetTessTriangles(noConversion: WordBool): Single; dispid 61;
    function IGetTessNorms: Single; dispid 62;
    function GetTessTriangleCount: Integer; dispid 63;
    function IGetPartBox(noConversion: WordBool): Double; dispid 64;
    function IGetTessTriStrips(noConversion: WordBool): Single; dispid 65;
    function IGetTessTriStripNorms: Single; dispid 66;
    function GetTessTriStripSize: Integer; dispid 67;
    function GetEntityByName(const Name: WideString; entityType: Integer): IDispatch; dispid 68;
    function IGetEntityByName(const Name: WideString; entityType: Integer): IEntity; dispid 69;
    function GetEntityName(const entity: IDispatch): WideString; dispid 70;
    function IGetEntityName(const entity: IEntity): WideString; dispid 71;
    function SetEntityName(const entity: IDispatch; const StringValue: WideString): WordBool; dispid 72;
    function ISetEntityName(const entity: IEntity; const StringValue: WideString): WordBool; dispid 73;
    function ReorderFeature(const featureToMove: WideString; const moveAfterFeature: WideString): WordBool; dispid 74;
    function EnumRelatedBodies: IEnumBodies; dispid 75;
    function GetSectionedBody(const viewIn: IDispatch): IDispatch; dispid 76;
    function IGetSectionedBody(const viewIn: IModelView): IBody; dispid 77;
    function EnumRelatedSectionedBodies(const viewIn: IModelView): IEnumBodies; dispid 78;
    function IMaterialPropertyValues: Double; dispid 79;
    procedure FeatureRevolveThin(angle: Double; reverseDir: WordBool; angle2: Double; 
                                 revType: Integer; thickness1: Double; thickness2: Double; 
                                 reverseThinDir: Integer); dispid 80;
    procedure FeatureRevolveThinCut(angle: Double; reverseDir: WordBool; angle2: Double; 
                                    revType: Integer; thickness1: Double; thickness2: Double; 
                                    reverseThinDir: Integer); dispid 81;
    procedure FeatureExtrusionThin(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                                   t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                                   dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; 
                                   dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                                   offsetReverse2: WordBool; thk1: Double; thk2: Double; 
                                   endThk: Double; revThinDir: Integer; capEnds: Integer; 
                                   addBends: WordBool; bendRad: Double); dispid 82;
    function InsertBends(radius: Double; const useBendTable: WideString; useKfactor: Double; 
                         useBendAllowance: Double; useAutoRelief: WordBool; offsetRatio: Double): WordBool; dispid 83;
    function CreateFeatureFromBody(const Body: IDispatch): IDispatch; dispid 84;
    function ICreateFeatureFromBody(const Body: IBody): IFeature; dispid 85;
    function CreateFeatureFromBody2(const Body: IDispatch; makeRefSurface: WordBool): IDispatch; dispid 86;
    function ICreateFeatureFromBody2(const Body: IBody; makeRefSurface: WordBool): IFeature; dispid 87;
    function ImportDiagnosis(closeAllGaps: WordBool; removeFaces: WordBool; fixFaces: WordBool; 
                             options: Integer): Integer; dispid 88;
    function DeleteEntityName(const entity: IDispatch): WordBool; dispid 89;
    function IDeleteEntityName(const entity: IEntity): WordBool; dispid 90;
    function GetTessTriStripEdges: OleVariant; dispid 91;
    function IGetTessTriStripEdges: Integer; dispid 92;
    function IGetTessTriStripEdgeSize: Integer; dispid 93;
    function EnumBodies(bodyType: Integer): IEnumBodies; dispid 94;
    function GetBodies(bodyType: Integer): OleVariant; dispid 95;
    function GetRelatedBodies: OleVariant; dispid 96;
    function GetRelatedSectionedBodies(const viewIn: IDispatch): OleVariant; dispid 97;
    function InsertBends2(radius: Double; const useBendTable: WideString; useKfactor: Double; 
                          useBendAllowance: Double; useAutoRelief: WordBool; offsetRatio: Double; 
                          doFlatten: WordBool): WordBool; dispid 98;
    function CreateFeatureFromBody3(const Body: IDispatch; makeRefSurface: WordBool; 
                                    options: Integer): IDispatch; dispid 99;
    function ICreateFeatureFromBody3(const Body: IBody; makeRefSurface: WordBool; options: Integer): IFeature; dispid 100;
    function GetMateReferenceEntity: IDispatch; dispid 101;
    procedure FeatureExtrusion2(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                                t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                                dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; dang1: Double; 
                                dang2: Double; offsetReverse1: WordBool; offsetReverse2: WordBool; 
                                merge: WordBool); dispid 102;
    procedure FeatureExtrusionThin2(sd: WordBool; flip: WordBool; dir: WordBool; t1: Integer; 
                                    t2: Integer; d1: Double; d2: Double; dchk1: WordBool; 
                                    dchk2: WordBool; ddir1: WordBool; ddir2: WordBool; 
                                    dang1: Double; dang2: Double; offsetReverse1: WordBool; 
                                    offsetReverse2: WordBool; merge: WordBool; thk1: Double; 
                                    thk2: Double; endThk: Double; revThinDir: Integer; 
                                    capEnds: Integer; addBends: WordBool; bendRad: Double); dispid 103;
    function CreateSurfaceFeatureFromBody(const Body: IDispatch; options: Integer): OleVariant; dispid 104;
    function ICreateSurfaceFeatureFromBodyCount(const Body: IBody; options: Integer): Integer; dispid 105;
    function ICreateSurfaceFeatureFromBody: IFeature; dispid 106;
  end;

// *********************************************************************//
// Interface: IEntity
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D65-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEntity = interface(IDispatch)
    ['{83A33D65-27C5-11CE-BFD4-00400513BB57}']
    function CreateStringAttributeDefinition(const identifierString: WideString): Integer; safecall;
    function CreateStringAttribute(definitionTag: Integer; const StringValue: WideString): WordBool; safecall;
    function FindStringAttribute(definitionTag: Integer): WideString; safecall;
    function RemoveStringAttribute(definitionTag: Integer): WordBool; safecall;
    function FindAttribute(const attributeDef: IDispatch; whichOne: Integer): IDispatch; safecall;
    function IFindAttribute(const attributeDef: IAttributeDef; whichOne: Integer): IAttribute; safecall;
    function Select(appendFlag: WordBool): WordBool; safecall;
    function GetType: Integer; safecall;
    function GetComponent: IDispatch; safecall;
    function IGetComponent: IComponent; safecall;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; safecall;
    function Get_ModelName: WideString; safecall;
    procedure Set_ModelName(const retval: WideString); safecall;
    procedure DeleteModelName; safecall;
    function DeSelect: WordBool; safecall;
    property ModelName: WideString read Get_ModelName write Set_ModelName;
  end;

// *********************************************************************//
// DispIntf:  IEntityDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D65-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEntityDisp = dispinterface
    ['{83A33D65-27C5-11CE-BFD4-00400513BB57}']
    function CreateStringAttributeDefinition(const identifierString: WideString): Integer; dispid 65537;
    function CreateStringAttribute(definitionTag: Integer; const StringValue: WideString): WordBool; dispid 65538;
    function FindStringAttribute(definitionTag: Integer): WideString; dispid 65539;
    function RemoveStringAttribute(definitionTag: Integer): WordBool; dispid 65540;
    function FindAttribute(const attributeDef: IDispatch; whichOne: Integer): IDispatch; dispid 65541;
    function IFindAttribute(const attributeDef: IAttributeDef; whichOne: Integer): IAttribute; dispid 65542;
    function Select(appendFlag: WordBool): WordBool; dispid 65543;
    function GetType: Integer; dispid 65544;
    function GetComponent: IDispatch; dispid 65545;
    function IGetComponent: IComponent; dispid 65546;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; dispid 65547;
    property ModelName: WideString dispid 65548;
    procedure DeleteModelName; dispid 65549;
    function DeSelect: WordBool; dispid 65550;
  end;

// *********************************************************************//
// Interface: IAttributeDef
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D67-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IAttributeDef = interface(IDispatch)
    ['{83A33D67-27C5-11CE-BFD4-00400513BB57}']
    function CreateInstance(const ownerDoc: IDispatch; const ownerEntity: IDispatch; 
                            const nameIn: WideString): IDispatch; safecall;
    function ICreateInstance(const ownerDoc: IModelDoc; const ownerEntity: IEntity; 
                             const nameIn: WideString): IAttribute; safecall;
    function AddParameter(const nameIn: WideString; type_: Integer; defaultValue: Double; 
                          options: Integer): WordBool; safecall;
    function SetOption(whichOption: Integer; optionValue: Integer): WordBool; safecall;
    function GetOption(whichOption: Integer): Integer; safecall;
    function AddCallback(whichCallback: Integer; const CallbackFcnAndModule: WideString; 
                         whichOption: Integer): WordBool; safecall;
    function Register: WordBool; safecall;
    function CreateInstance2(const ownerDoc: IDispatch; const ownerEntity: IDispatch; 
                             const nameIn: WideString; options: Integer): IDispatch; safecall;
    function ICreateInstance2(const ownerDoc: IModelDoc; const ownerEntity: IEntity; 
                              const nameIn: WideString; options: Integer): IAttribute; safecall;
    function CreateInstance3(const ownerDoc: IDispatch; const ownerComp: IDispatch; 
                             const ownerEntity: IDispatch; const nameIn: WideString; 
                             options: Integer; configurationOption: Integer): IDispatch; safecall;
    function ICreateInstance3(const ownerDoc: IModelDoc; const ownerComp: IComponent; 
                              const ownerEntity: IEntity; const nameIn: WideString; 
                              options: Integer; configurationOption: Integer): IAttribute; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAttributeDefDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D67-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IAttributeDefDisp = dispinterface
    ['{83A33D67-27C5-11CE-BFD4-00400513BB57}']
    function CreateInstance(const ownerDoc: IDispatch; const ownerEntity: IDispatch; 
                            const nameIn: WideString): IDispatch; dispid 1;
    function ICreateInstance(const ownerDoc: IModelDoc; const ownerEntity: IEntity; 
                             const nameIn: WideString): IAttribute; dispid 2;
    function AddParameter(const nameIn: WideString; type_: Integer; defaultValue: Double; 
                          options: Integer): WordBool; dispid 3;
    function SetOption(whichOption: Integer; optionValue: Integer): WordBool; dispid 4;
    function GetOption(whichOption: Integer): Integer; dispid 5;
    function AddCallback(whichCallback: Integer; const CallbackFcnAndModule: WideString; 
                         whichOption: Integer): WordBool; dispid 6;
    function Register: WordBool; dispid 7;
    function CreateInstance2(const ownerDoc: IDispatch; const ownerEntity: IDispatch; 
                             const nameIn: WideString; options: Integer): IDispatch; dispid 8;
    function ICreateInstance2(const ownerDoc: IModelDoc; const ownerEntity: IEntity; 
                              const nameIn: WideString; options: Integer): IAttribute; dispid 9;
    function CreateInstance3(const ownerDoc: IDispatch; const ownerComp: IDispatch; 
                             const ownerEntity: IDispatch; const nameIn: WideString; 
                             options: Integer; configurationOption: Integer): IDispatch; dispid 10;
    function ICreateInstance3(const ownerDoc: IModelDoc; const ownerComp: IComponent; 
                              const ownerEntity: IEntity; const nameIn: WideString; 
                              options: Integer; configurationOption: Integer): IAttribute; dispid 11;
  end;

// *********************************************************************//
// Interface: IAttribute
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D71-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IAttribute = interface(IDispatch)
    ['{83A33D71-27C5-11CE-BFD4-00400513BB57}']
    function GetParameter(const nameIn: WideString): IDispatch; safecall;
    function IGetParameter(const nameIn: WideString): IParameter; safecall;
    function GetEntity: IDispatch; safecall;
    function IGetEntity: IEntity; safecall;
    function GetDefinition: IDispatch; safecall;
    function IGetDefinition: IAttributeDef; safecall;
    function GetName: WideString; safecall;
    function GetEntityState(whichState: Integer): WordBool; safecall;
    function GetComponent: IDispatch; safecall;
    function IGetComponent: IComponent; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAttributeDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D71-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IAttributeDisp = dispinterface
    ['{83A33D71-27C5-11CE-BFD4-00400513BB57}']
    function GetParameter(const nameIn: WideString): IDispatch; dispid 1;
    function IGetParameter(const nameIn: WideString): IParameter; dispid 2;
    function GetEntity: IDispatch; dispid 3;
    function IGetEntity: IEntity; dispid 4;
    function GetDefinition: IDispatch; dispid 5;
    function IGetDefinition: IAttributeDef; dispid 6;
    function GetName: WideString; dispid 7;
    function GetEntityState(whichState: Integer): WordBool; dispid 8;
    function GetComponent: IDispatch; dispid 9;
    function IGetComponent: IComponent; dispid 10;
  end;

// *********************************************************************//
// Interface: IParameter
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D69-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IParameter = interface(IDispatch)
    ['{83A33D69-27C5-11CE-BFD4-00400513BB57}']
    function GetDoubleValue: Double; safecall;
    function SetDoubleValue(Value: Double): WordBool; safecall;
    function GetType: Integer; safecall;
    function GetName: WideString; safecall;
    function GetOption(whichOption: Integer): Integer; safecall;
    function SetOption(whichOption: Integer; optionValue: Integer): WordBool; safecall;
    function GetStringValue: WideString; safecall;
    function SetStringValue(const StringValue: WideString): WordBool; safecall;
    procedure GetVector(out x: Double; out y: Double; out z: Double); safecall;
    function SetVector(x: Double; y: Double; z: Double): WordBool; safecall;
    function GetVectorVB: OleVariant; safecall;
    function SetDoubleValue2(Value: Double; configurationOption: Integer; 
                             const configurationName: WideString): WordBool; safecall;
    function SetStringValue2(const StringValue: WideString; configurationOption: Integer; 
                             const configurationName: WideString): WordBool; safecall;
    function SetVector2(x: Double; y: Double; z: Double; configurationOption: Integer; 
                        const configurationName: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IParameterDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D69-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IParameterDisp = dispinterface
    ['{83A33D69-27C5-11CE-BFD4-00400513BB57}']
    function GetDoubleValue: Double; dispid 1;
    function SetDoubleValue(Value: Double): WordBool; dispid 2;
    function GetType: Integer; dispid 3;
    function GetName: WideString; dispid 4;
    function GetOption(whichOption: Integer): Integer; dispid 5;
    function SetOption(whichOption: Integer; optionValue: Integer): WordBool; dispid 6;
    function GetStringValue: WideString; dispid 7;
    function SetStringValue(const StringValue: WideString): WordBool; dispid 8;
    procedure GetVector(out x: Double; out y: Double; out z: Double); dispid 9;
    function SetVector(x: Double; y: Double; z: Double): WordBool; dispid 10;
    function GetVectorVB: OleVariant; dispid 11;
    function SetDoubleValue2(Value: Double; configurationOption: Integer; 
                             const configurationName: WideString): WordBool; dispid 12;
    function SetStringValue2(const StringValue: WideString; configurationOption: Integer; 
                             const configurationName: WideString): WordBool; dispid 13;
    function SetVector2(x: Double; y: Double; z: Double; configurationOption: Integer; 
                        const configurationName: WideString): WordBool; dispid 14;
  end;

// *********************************************************************//
// Interface: IEnumBodies
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33D96-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumBodies = interface(IUnknown)
    ['{83A33D96-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: IBody; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumBodies): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IModelView
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D4C-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IModelView = interface(IDispatch)
    ['{83A33D4C-27C5-11CE-BFD4-00400513BB57}']
    function Get_xform: OleVariant; safecall;
    procedure Set_xform(retval: OleVariant); safecall;
    function Get_Orientation: OleVariant; safecall;
    procedure Set_Orientation(retval: OleVariant); safecall;
    function Get_Translation: OleVariant; safecall;
    procedure Set_Translation(retval: OleVariant); safecall;
    function Get_Scale: Double; safecall;
    procedure Set_Scale(retval: Double); safecall;
    function Get_IXform: Double; safecall;
    procedure Set_IXform(var retval: Double); safecall;
    function Get_IOrientation: Double; safecall;
    procedure Set_IOrientation(var retval: Double); safecall;
    function Get_ITranslation: Double; safecall;
    procedure Set_ITranslation(var retval: Double); safecall;
    function GetViewHWnd: Integer; safecall;
    procedure StartDynamics; safecall;
    procedure StopDynamics; safecall;
    procedure AddPerspective; safecall;
    procedure RemovePerspective; safecall;
    function HasPerspective: WordBool; safecall;
    function GetEyePoint: OleVariant; safecall;
    procedure IGetEyePoint(var eyept: Double); safecall;
    function GetViewPlaneDistance: Double; safecall;
    procedure InitializeShading; safecall;
    function Get_Orientation2: OleVariant; safecall;
    procedure Set_Orientation2(retval: OleVariant); safecall;
    function Get_Translation2: OleVariant; safecall;
    procedure Set_Translation2(retval: OleVariant); safecall;
    function Get_IOrientation2: Double; safecall;
    procedure Set_IOrientation2(var retval: Double); safecall;
    function Get_ITranslation2: Double; safecall;
    procedure Set_ITranslation2(var retval: Double); safecall;
    function GetDisplayState(displayType: Integer): WordBool; safecall;
    function GetViewDIB: Integer; safecall;
    procedure ZoomByFactor(factor: Double); safecall;
    procedure TranslateBy(x: Double; y: Double); safecall;
    procedure RotateAboutCenter(xAngle: Double; yAngle: Double); safecall;
    procedure RotateAboutPoint(xAngle: Double; yAngle: Double; Ptx: Double; Pty: Double; Ptz: Double); safecall;
    procedure RotateAboutAxis(angle: Double; Ptx: Double; Pty: Double; Ptz: Double; 
                              AxisVecX: Double; AxisVecY: Double; AxisVecZ: Double); safecall;
    function SetEyePoint(eyept: OleVariant): WordBool; safecall;
    function ISetEyePoint(var eyept: Double): WordBool; safecall;
    function SetStereoSeparation(dfSeparation: OleVariant): WordBool; safecall;
    function ISetStereoSeparation(var dfSeparation: Double): WordBool; safecall;
    function GetStereoSeparation: OleVariant; safecall;
    function IGetStereoSeparation: Double; safecall;
    procedure GetDIBHeader(ldib: Integer); safecall;
    procedure GetStripsOfDIB(ldib: Integer; nScanLinesPerStrip: Integer; stripIndex: Integer); safecall;
    procedure Set_FrameLeft(Param1: SYSINT); safecall;
    procedure Set_FrameTop(Param1: SYSINT); safecall;
    procedure Set_FrameWidth(Param1: SYSINT); safecall;
    procedure Set_FrameHeight(Param1: SYSINT); safecall;
    procedure Set_FrameState(Param1: SYSINT); safecall;
    function Get_ObjectSizesAway: Double; safecall;
    procedure Set_ObjectSizesAway(retval: Double); safecall;
    function Get_DynamicMode: Integer; safecall;
    procedure DrawHighlightedItems; safecall;
    function GetNext: IDispatch; safecall;
    function IGetNext: IModelView; safecall;
    function Get_Scale2: Double; safecall;
    procedure Set_Scale2(retval: Double); safecall;
    function Get_HlrQuality: Integer; safecall;
    procedure Set_HlrQuality(retval: Integer); safecall;
    function Get_XorHighlight: WordBool; safecall;
    procedure Set_XorHighlight(retval: WordBool); safecall;
    property xform: OleVariant read Get_xform write Set_xform;
    property Orientation: OleVariant read Get_Orientation write Set_Orientation;
    property Translation: OleVariant read Get_Translation write Set_Translation;
    property Scale: Double read Get_Scale write Set_Scale;
    property Orientation2: OleVariant read Get_Orientation2 write Set_Orientation2;
    property Translation2: OleVariant read Get_Translation2 write Set_Translation2;
    property FrameLeft: SYSINT write Set_FrameLeft;
    property FrameTop: SYSINT write Set_FrameTop;
    property FrameWidth: SYSINT write Set_FrameWidth;
    property FrameHeight: SYSINT write Set_FrameHeight;
    property FrameState: SYSINT write Set_FrameState;
    property ObjectSizesAway: Double read Get_ObjectSizesAway write Set_ObjectSizesAway;
    property DynamicMode: Integer read Get_DynamicMode;
    property Scale2: Double read Get_Scale2 write Set_Scale2;
    property HlrQuality: Integer read Get_HlrQuality write Set_HlrQuality;
    property XorHighlight: WordBool read Get_XorHighlight write Set_XorHighlight;
  end;

// *********************************************************************//
// DispIntf:  IModelViewDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D4C-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IModelViewDisp = dispinterface
    ['{83A33D4C-27C5-11CE-BFD4-00400513BB57}']
    property xform: OleVariant dispid 1;
    property Orientation: OleVariant dispid 3;
    property Translation: OleVariant dispid 4;
    property Scale: Double dispid 5;
    function IXform: Double; dispid 6;
    function IOrientation: Double; dispid 7;
    function ITranslation: Double; dispid 8;
    function GetViewHWnd: Integer; dispid 2;
    procedure StartDynamics; dispid 9;
    procedure StopDynamics; dispid 10;
    procedure AddPerspective; dispid 11;
    procedure RemovePerspective; dispid 12;
    function HasPerspective: WordBool; dispid 13;
    function GetEyePoint: OleVariant; dispid 14;
    procedure IGetEyePoint(var eyept: Double); dispid 15;
    function GetViewPlaneDistance: Double; dispid 16;
    procedure InitializeShading; dispid 17;
    property Orientation2: OleVariant dispid 18;
    property Translation2: OleVariant dispid 19;
    function IOrientation2: Double; dispid 20;
    function ITranslation2: Double; dispid 21;
    function GetDisplayState(displayType: Integer): WordBool; dispid 22;
    function GetViewDIB: Integer; dispid 23;
    procedure ZoomByFactor(factor: Double); dispid 24;
    procedure TranslateBy(x: Double; y: Double); dispid 25;
    procedure RotateAboutCenter(xAngle: Double; yAngle: Double); dispid 26;
    procedure RotateAboutPoint(xAngle: Double; yAngle: Double; Ptx: Double; Pty: Double; Ptz: Double); dispid 27;
    procedure RotateAboutAxis(angle: Double; Ptx: Double; Pty: Double; Ptz: Double; 
                              AxisVecX: Double; AxisVecY: Double; AxisVecZ: Double); dispid 28;
    function SetEyePoint(eyept: OleVariant): WordBool; dispid 29;
    function ISetEyePoint(var eyept: Double): WordBool; dispid 30;
    function SetStereoSeparation(dfSeparation: OleVariant): WordBool; dispid 31;
    function ISetStereoSeparation(var dfSeparation: Double): WordBool; dispid 32;
    function GetStereoSeparation: OleVariant; dispid 33;
    function IGetStereoSeparation: Double; dispid 34;
    procedure GetDIBHeader(ldib: Integer); dispid 35;
    procedure GetStripsOfDIB(ldib: Integer; nScanLinesPerStrip: Integer; stripIndex: Integer); dispid 36;
    property FrameLeft: SYSINT writeonly dispid 37;
    property FrameTop: SYSINT writeonly dispid 38;
    property FrameWidth: SYSINT writeonly dispid 39;
    property FrameHeight: SYSINT writeonly dispid 40;
    property FrameState: SYSINT writeonly dispid 41;
    property ObjectSizesAway: Double dispid 42;
    property DynamicMode: Integer readonly dispid 43;
    procedure DrawHighlightedItems; dispid 44;
    function GetNext: IDispatch; dispid 45;
    function IGetNext: IModelView; dispid 46;
    property Scale2: Double dispid 47;
    property HlrQuality: Integer dispid 48;
    property XorHighlight: WordBool dispid 49;
  end;

// *********************************************************************//
// Interface: ITessellation
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {699C7492-DB56-4CC2-B7A2-9FFD56698434}
// *********************************************************************//
  ITessellation = interface(IDispatch)
    ['{699C7492-DB56-4CC2-B7A2-9FFD56698434}']
    function Get_MaxFacetWidth: Double; safecall;
    procedure Set_MaxFacetWidth(maxWidth: Double); safecall;
    function Get_CurveChordTolerance: Double; safecall;
    procedure Set_CurveChordTolerance(tolerance: Double); safecall;
    function Get_CurveChordAngleTolerance: Double; safecall;
    procedure Set_CurveChordAngleTolerance(tolerance: Double); safecall;
    function Get_SurfacePlaneTolerance: Double; safecall;
    procedure Set_SurfacePlaneTolerance(tolerance: Double); safecall;
    function Get_SurfacePlaneAngleTolerance: Double; safecall;
    procedure Set_SurfacePlaneAngleTolerance(tolerance: Double); safecall;
    function Get_NeedVertexNormal: WordBool; safecall;
    procedure Set_NeedVertexNormal(option: WordBool); safecall;
    function Get_NeedVertexParams: WordBool; safecall;
    procedure Set_NeedVertexParams(option: WordBool); safecall;
    function Get_NeedFaceFacetMap: WordBool; safecall;
    procedure Set_NeedFaceFacetMap(option: WordBool); safecall;
    function Get_NeedEdgeFinMap: WordBool; safecall;
    procedure Set_NeedEdgeFinMap(option: WordBool); safecall;
    function Get_NeedErrorList: WordBool; safecall;
    procedure Set_NeedErrorList(option: WordBool); safecall;
    function Tessellate: WordBool; safecall;
    function GetFacetCount: Integer; safecall;
    function GetFinCount: Integer; safecall;
    function GetVertexCount: Integer; safecall;
    function GetFacetFins(facetId: Integer): OleVariant; safecall;
    function IGetFacetFinsCount(facetId: Integer): Integer; safecall;
    function IGetFacetFins(facetId: Integer): Integer; safecall;
    function GetFinCoFin(finId: Integer): Integer; safecall;
    function GetFinVertices(finId: Integer): OleVariant; safecall;
    function IGetFinVertices(finId: Integer): Integer; safecall;
    function GetVertexPoint(vertexId: Integer): OleVariant; safecall;
    function IGetVertexPoint(vertexId: Integer): Double; safecall;
    function GetVertexNormal(vertexId: Integer): OleVariant; safecall;
    function IGetVertexNormal(vertexId: Integer): Double; safecall;
    function GetVertexParams(vertexId: Integer): OleVariant; safecall;
    function IGetVertexParams(vertexId: Integer): Double; safecall;
    function GetFaceFacets(const facedisp: IDispatch): OleVariant; safecall;
    function IGetFaceFacetsCount(const faceObj: IFace): Integer; safecall;
    function IGetFaceFacets(const faceObj: IFace): Integer; safecall;
    function GetFacetFace(facetId: Integer): IDispatch; safecall;
    function IGetFacetFace(facetId: Integer): IFace; safecall;
    function GetEdgeFins(const edgeDisp: IDispatch): OleVariant; safecall;
    function IGetEdgeFinsCount(const edgeObj: IEdge): Integer; safecall;
    function IGetEdgeFins(const edgeObj: IEdge): Integer; safecall;
    function GetFinEdge(finId: Integer): IDispatch; safecall;
    function IGetFinEdge(finId: Integer): IEdge; safecall;
    procedure GetErrorList(out faceErrArray: OleVariant; out facetErrArray: OleVariant; 
                           out vertexPointErrArray: OleVariant; 
                           out vertexNormalErrArray: OleVariant; 
                           out vertexParamsErrArray: OleVariant); safecall;
    procedure IGetErrorListCount(out faceErrArrayCount: Integer; out facetErrArrayCount: Integer; 
                                 out vertexPointErrArrayCount: Integer; 
                                 out vertexNormalErrArrayCount: Integer; 
                                 out vertexParamsErrArrayCount: Integer); safecall;
    procedure IGetErrorList(out faceErrArray: IFace; out facetErrArray: Integer; 
                            out vertexPointErrArray: Integer; out vertexNormalErrArray: Integer; 
                            out vertexParamsErrArray: Integer); safecall;
    property MaxFacetWidth: Double read Get_MaxFacetWidth write Set_MaxFacetWidth;
    property CurveChordTolerance: Double read Get_CurveChordTolerance write Set_CurveChordTolerance;
    property CurveChordAngleTolerance: Double read Get_CurveChordAngleTolerance write Set_CurveChordAngleTolerance;
    property SurfacePlaneTolerance: Double read Get_SurfacePlaneTolerance write Set_SurfacePlaneTolerance;
    property SurfacePlaneAngleTolerance: Double read Get_SurfacePlaneAngleTolerance write Set_SurfacePlaneAngleTolerance;
    property NeedVertexNormal: WordBool read Get_NeedVertexNormal write Set_NeedVertexNormal;
    property NeedVertexParams: WordBool read Get_NeedVertexParams write Set_NeedVertexParams;
    property NeedFaceFacetMap: WordBool read Get_NeedFaceFacetMap write Set_NeedFaceFacetMap;
    property NeedEdgeFinMap: WordBool read Get_NeedEdgeFinMap write Set_NeedEdgeFinMap;
    property NeedErrorList: WordBool read Get_NeedErrorList write Set_NeedErrorList;
  end;

// *********************************************************************//
// DispIntf:  ITessellationDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {699C7492-DB56-4CC2-B7A2-9FFD56698434}
// *********************************************************************//
  ITessellationDisp = dispinterface
    ['{699C7492-DB56-4CC2-B7A2-9FFD56698434}']
    property MaxFacetWidth: Double dispid 1;
    property CurveChordTolerance: Double dispid 2;
    property CurveChordAngleTolerance: Double dispid 3;
    property SurfacePlaneTolerance: Double dispid 4;
    property SurfacePlaneAngleTolerance: Double dispid 5;
    property NeedVertexNormal: WordBool dispid 6;
    property NeedVertexParams: WordBool dispid 7;
    property NeedFaceFacetMap: WordBool dispid 8;
    property NeedEdgeFinMap: WordBool dispid 9;
    property NeedErrorList: WordBool dispid 10;
    function Tessellate: WordBool; dispid 11;
    function GetFacetCount: Integer; dispid 12;
    function GetFinCount: Integer; dispid 13;
    function GetVertexCount: Integer; dispid 14;
    function GetFacetFins(facetId: Integer): OleVariant; dispid 15;
    function IGetFacetFinsCount(facetId: Integer): Integer; dispid 16;
    function IGetFacetFins(facetId: Integer): Integer; dispid 17;
    function GetFinCoFin(finId: Integer): Integer; dispid 18;
    function GetFinVertices(finId: Integer): OleVariant; dispid 19;
    function IGetFinVertices(finId: Integer): Integer; dispid 20;
    function GetVertexPoint(vertexId: Integer): OleVariant; dispid 21;
    function IGetVertexPoint(vertexId: Integer): Double; dispid 22;
    function GetVertexNormal(vertexId: Integer): OleVariant; dispid 23;
    function IGetVertexNormal(vertexId: Integer): Double; dispid 24;
    function GetVertexParams(vertexId: Integer): OleVariant; dispid 25;
    function IGetVertexParams(vertexId: Integer): Double; dispid 26;
    function GetFaceFacets(const facedisp: IDispatch): OleVariant; dispid 27;
    function IGetFaceFacetsCount(const faceObj: IFace): Integer; dispid 28;
    function IGetFaceFacets(const faceObj: IFace): Integer; dispid 29;
    function GetFacetFace(facetId: Integer): IDispatch; dispid 30;
    function IGetFacetFace(facetId: Integer): IFace; dispid 31;
    function GetEdgeFins(const edgeDisp: IDispatch): OleVariant; dispid 32;
    function IGetEdgeFinsCount(const edgeObj: IEdge): Integer; dispid 33;
    function IGetEdgeFins(const edgeObj: IEdge): Integer; dispid 34;
    function GetFinEdge(finId: Integer): IDispatch; dispid 35;
    function IGetFinEdge(finId: Integer): IEdge; dispid 36;
    procedure GetErrorList(out faceErrArray: OleVariant; out facetErrArray: OleVariant; 
                           out vertexPointErrArray: OleVariant; 
                           out vertexNormalErrArray: OleVariant; 
                           out vertexParamsErrArray: OleVariant); dispid 37;
    procedure IGetErrorListCount(out faceErrArrayCount: Integer; out facetErrArrayCount: Integer; 
                                 out vertexPointErrArrayCount: Integer; 
                                 out vertexNormalErrArrayCount: Integer; 
                                 out vertexParamsErrArrayCount: Integer); dispid 38;
    procedure IGetErrorList(out faceErrArray: IFace; out facetErrArray: Integer; 
                            out vertexPointErrArray: Integer; out vertexNormalErrArray: Integer; 
                            out vertexParamsErrArray: Integer); dispid 39;
  end;

// *********************************************************************//
// Interface: ISketch
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D51-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketch = interface(IDispatch)
    ['{83A33D51-27C5-11CE-BFD4-00400513BB57}']
    function Get_ModelToSketchXform: OleVariant; safecall;
    procedure Set_ModelToSketchXform(retval: OleVariant); safecall;
    function GetLines: OleVariant; safecall;
    function IGetLines: Double; safecall;
    function GetLineCount: Integer; safecall;
    function GetArcs: OleVariant; safecall;
    function IGetArcs: Double; safecall;
    function GetArcCount: Integer; safecall;
    function GetPolylines: OleVariant; safecall;
    function IGetPolylines: Double; safecall;
    function GetPolylineCount(var pointCount: Integer): Integer; safecall;
    function GetSplines: OleVariant; safecall;
    function IGetSplines: Double; safecall;
    function GetSplineCount(var pointCount: Integer): Integer; safecall;
    function GetEllipses: OleVariant; safecall;
    function IGetEllipses: Double; safecall;
    function GetEllipseCount: Integer; safecall;
    function Get_IModelToSketchXform: Double; safecall;
    function GetUserPoints: OleVariant; safecall;
    function IGetUserPoints: Double; safecall;
    function GetUserPointsCount: Integer; safecall;
    function GetSplinesInterpolate: OleVariant; safecall;
    function IGetSplinesInterpolate: Double; safecall;
    function GetSplineInterpolateCount(var pointCount: Integer): Integer; safecall;
    function GetAutomaticSolve: WordBool; safecall;
    function SetAutomaticSolve(solveFlag: WordBool): WordBool; safecall;
    function ConstrainAll: Integer; safecall;
    function GetSplineParams: OleVariant; safecall;
    function IGetSplineParams: Double; safecall;
    function GetSplineParamsCount(out size: Integer): Integer; safecall;
    function GetParabolas: OleVariant; safecall;
    function IGetParabolas: Double; safecall;
    function GetParabolaCount: Integer; safecall;
    function GetEllipses2: OleVariant; safecall;
    function IGetEllipses2: Double; safecall;
    function GetSketchPoints: OleVariant; safecall;
    function IEnumSketchPoints: IEnumSketchPoints; safecall;
    function GetSketchSegments: OleVariant; safecall;
    function IEnumSketchSegments: IEnumSketchSegments; safecall;
    function Is3D: WordBool; safecall;
    function GetSketchPointsCount: Integer; safecall;
    function GetSketchHatches: OleVariant; safecall;
    function IEnumSketchHatches: IEnumSketchHatches; safecall;
    function GetSplineParams2: OleVariant; safecall;
    function IGetSplineParams2: Double; safecall;
    function GetSplineParamsCount2(out size: Integer): Integer; safecall;
    function GetSketchTextSegments: OleVariant; safecall;
    function IEnumSketchTextSegments: IEnumSketchSegments; safecall;
    function GetConstrainedStatus: Integer; safecall;
    function SetEntityCount(entityType: Integer; entityCount: Integer): WordBool; safecall;
    function CheckFeatureUse(featureType: Integer; var openCount: Integer; var closedCount: Integer): Integer; safecall;
    function MergePoints(distance: Double): WordBool; safecall;
    property ModelToSketchXform: OleVariant read Get_ModelToSketchXform write Set_ModelToSketchXform;
    property IModelToSketchXform: Double read Get_IModelToSketchXform;
  end;

// *********************************************************************//
// DispIntf:  ISketchDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D51-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchDisp = dispinterface
    ['{83A33D51-27C5-11CE-BFD4-00400513BB57}']
    property ModelToSketchXform: OleVariant dispid 1;
    function GetLines: OleVariant; dispid 2;
    function IGetLines: Double; dispid 3;
    function GetLineCount: Integer; dispid 4;
    function GetArcs: OleVariant; dispid 5;
    function IGetArcs: Double; dispid 6;
    function GetArcCount: Integer; dispid 7;
    function GetPolylines: OleVariant; dispid 8;
    function IGetPolylines: Double; dispid 9;
    function GetPolylineCount(var pointCount: Integer): Integer; dispid 10;
    function GetSplines: OleVariant; dispid 11;
    function IGetSplines: Double; dispid 12;
    function GetSplineCount(var pointCount: Integer): Integer; dispid 13;
    function GetEllipses: OleVariant; dispid 14;
    function IGetEllipses: Double; dispid 15;
    function GetEllipseCount: Integer; dispid 16;
    property IModelToSketchXform: Double readonly dispid 17;
    function GetUserPoints: OleVariant; dispid 18;
    function IGetUserPoints: Double; dispid 19;
    function GetUserPointsCount: Integer; dispid 20;
    function GetSplinesInterpolate: OleVariant; dispid 21;
    function IGetSplinesInterpolate: Double; dispid 22;
    function GetSplineInterpolateCount(var pointCount: Integer): Integer; dispid 23;
    function GetAutomaticSolve: WordBool; dispid 24;
    function SetAutomaticSolve(solveFlag: WordBool): WordBool; dispid 25;
    function ConstrainAll: Integer; dispid 26;
    function GetSplineParams: OleVariant; dispid 27;
    function IGetSplineParams: Double; dispid 28;
    function GetSplineParamsCount(out size: Integer): Integer; dispid 29;
    function GetParabolas: OleVariant; dispid 30;
    function IGetParabolas: Double; dispid 31;
    function GetParabolaCount: Integer; dispid 32;
    function GetEllipses2: OleVariant; dispid 33;
    function IGetEllipses2: Double; dispid 34;
    function GetSketchPoints: OleVariant; dispid 35;
    function IEnumSketchPoints: IEnumSketchPoints; dispid 36;
    function GetSketchSegments: OleVariant; dispid 37;
    function IEnumSketchSegments: IEnumSketchSegments; dispid 38;
    function Is3D: WordBool; dispid 39;
    function GetSketchPointsCount: Integer; dispid 40;
    function GetSketchHatches: OleVariant; dispid 41;
    function IEnumSketchHatches: IEnumSketchHatches; dispid 42;
    function GetSplineParams2: OleVariant; dispid 43;
    function IGetSplineParams2: Double; dispid 44;
    function GetSplineParamsCount2(out size: Integer): Integer; dispid 45;
    function GetSketchTextSegments: OleVariant; dispid 46;
    function IEnumSketchTextSegments: IEnumSketchSegments; dispid 47;
    function GetConstrainedStatus: Integer; dispid 48;
    function SetEntityCount(entityType: Integer; entityCount: Integer): WordBool; dispid 49;
    function CheckFeatureUse(featureType: Integer; var openCount: Integer; var closedCount: Integer): Integer; dispid 50;
    function MergePoints(distance: Double): WordBool; dispid 51;
  end;

// *********************************************************************//
// Interface: IEnumSketchPoints
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33DCD-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumSketchPoints = interface(IUnknown)
    ['{83A33DCD-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: ISketchPoint; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumSketchPoints): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISketchPoint
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DBD-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchPoint = interface(IDispatch)
    ['{83A33DBD-27C5-11CE-BFD4-00400513BB57}']
    function Get_x: Double; safecall;
    function Get_y: Double; safecall;
    function Get_z: Double; safecall;
    function GetCoords: Double; safecall;
    function GetId: OleVariant; safecall;
    function IGetID: Integer; safecall;
    function Select(appendFlag: WordBool): WordBool; safecall;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; safecall;
    function DeSelect: WordBool; safecall;
    function Get_Layer: WideString; safecall;
    procedure Set_Layer(const retval: WideString); safecall;
    function Get_LayerOverride: SYSINT; safecall;
    procedure Set_LayerOverride(retval: SYSINT); safecall;
    function Get_Color: Integer; safecall;
    procedure Set_Color(retval: Integer); safecall;
    function SetCoords(xx: Double; yy: Double; zz: Double): WordBool; safecall;
    function GetFramePointTangent(out status: WordBool): OleVariant; safecall;
    function IGetFramePointTangent(out status: WordBool): Double; safecall;
    function SetFramePointTangent(toVector: OleVariant): WordBool; safecall;
    function ISetFramePointTangent(var toVector: Double): WordBool; safecall;
    function GetSketch: ISketch; safecall;
    property x: Double read Get_x;
    property y: Double read Get_y;
    property z: Double read Get_z;
    property Layer: WideString read Get_Layer write Set_Layer;
    property LayerOverride: SYSINT read Get_LayerOverride write Set_LayerOverride;
    property Color: Integer read Get_Color write Set_Color;
  end;

// *********************************************************************//
// DispIntf:  ISketchPointDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DBD-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchPointDisp = dispinterface
    ['{83A33DBD-27C5-11CE-BFD4-00400513BB57}']
    property x: Double readonly dispid 1;
    property y: Double readonly dispid 2;
    property z: Double readonly dispid 3;
    function GetCoords: Double; dispid 4;
    function GetId: OleVariant; dispid 5;
    function IGetID: Integer; dispid 6;
    function Select(appendFlag: WordBool): WordBool; dispid 7;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; dispid 8;
    function DeSelect: WordBool; dispid 9;
    property Layer: WideString dispid 10;
    property LayerOverride: SYSINT dispid 11;
    property Color: Integer dispid 12;
    function SetCoords(xx: Double; yy: Double; zz: Double): WordBool; dispid 13;
    function GetFramePointTangent(out status: WordBool): OleVariant; dispid 14;
    function IGetFramePointTangent(out status: WordBool): Double; dispid 15;
    function SetFramePointTangent(toVector: OleVariant): WordBool; dispid 16;
    function ISetFramePointTangent(var toVector: Double): WordBool; dispid 17;
    function GetSketch: ISketch; dispid 18;
  end;

// *********************************************************************//
// Interface: IEnumSketchSegments
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33DCF-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumSketchSegments = interface(IUnknown)
    ['{83A33DCF-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: ISketchSegment; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumSketchSegments): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISketchSegment
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DBF-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchSegment = interface(IDispatch)
    ['{83A33DBF-27C5-11CE-BFD4-00400513BB57}']
    function Get_Layer: WideString; safecall;
    procedure Set_Layer(const retval: WideString); safecall;
    function Get_LayerOverride: SYSINT; safecall;
    procedure Set_LayerOverride(retval: SYSINT); safecall;
    function Get_Color: Integer; safecall;
    procedure Set_Color(retval: Integer); safecall;
    function Get_Style: Integer; safecall;
    procedure Set_Style(retval: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(retval: Integer); safecall;
    function GetType: Integer; safecall;
    function GetId: OleVariant; safecall;
    function IGetID: Integer; safecall;
    function Select(appendFlag: WordBool): WordBool; safecall;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; safecall;
    function DeSelect: WordBool; safecall;
    function Get_ConstructionGeometry: WordBool; safecall;
    procedure Set_ConstructionGeometry(retval: WordBool); safecall;
    function GetCurve: IDispatch; safecall;
    function IGetCurve: ICurve; safecall;
    function GetSketch: ISketch; safecall;
    function GetConstraints: OleVariant; safecall;
    function IGetConstraintsCount: Integer; safecall;
    function IGetConstraints: WideString; safecall;
    property Layer: WideString read Get_Layer write Set_Layer;
    property LayerOverride: SYSINT read Get_LayerOverride write Set_LayerOverride;
    property Color: Integer read Get_Color write Set_Color;
    property Style: Integer read Get_Style write Set_Style;
    property Width: Integer read Get_Width write Set_Width;
    property ConstructionGeometry: WordBool read Get_ConstructionGeometry write Set_ConstructionGeometry;
  end;

// *********************************************************************//
// DispIntf:  ISketchSegmentDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DBF-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchSegmentDisp = dispinterface
    ['{83A33DBF-27C5-11CE-BFD4-00400513BB57}']
    property Layer: WideString dispid 2;
    property LayerOverride: SYSINT dispid 3;
    property Color: Integer dispid 4;
    property Style: Integer dispid 5;
    property Width: Integer dispid 6;
    function GetType: Integer; dispid 1;
    function GetId: OleVariant; dispid 7;
    function IGetID: Integer; dispid 8;
    function Select(appendFlag: WordBool): WordBool; dispid 9;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; dispid 10;
    function DeSelect: WordBool; dispid 11;
    property ConstructionGeometry: WordBool dispid 12;
    function GetCurve: IDispatch; dispid 13;
    function IGetCurve: ICurve; dispid 14;
    function GetSketch: ISketch; dispid 15;
    function GetConstraints: OleVariant; dispid 16;
    function IGetConstraintsCount: Integer; dispid 17;
    function IGetConstraints: WideString; dispid 18;
  end;

// *********************************************************************//
// Interface: IEnumSketchHatches
// Flags:     (272) Hidden OleAutomation
// GUID:      {54729B8E-4086-11D3-AE9B-00C04F683CBA}
// *********************************************************************//
  IEnumSketchHatches = interface(IUnknown)
    ['{54729B8E-4086-11D3-AE9B-00C04F683CBA}']
    function Next(celt: Integer; out rgelt: ISketchHatch; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumSketchHatches): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISketchHatch
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C3D00926-4068-11D3-AE9B-00C04F683CBA}
// *********************************************************************//
  ISketchHatch = interface(IDispatch)
    ['{C3D00926-4068-11D3-AE9B-00C04F683CBA}']
    function GetId: OleVariant; safecall;
    function IGetID: Integer; safecall;
    function Select(appendFlag: WordBool): WordBool; safecall;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; safecall;
    function DeSelect: WordBool; safecall;
    function Get_Layer: WideString; safecall;
    procedure Set_Layer(const retval: WideString); safecall;
    function Get_LayerOverride: SYSINT; safecall;
    procedure Set_LayerOverride(retval: SYSINT); safecall;
    function Get_Color: Integer; safecall;
    procedure Set_Color(retval: Integer); safecall;
    function Get_Pattern: WideString; safecall;
    procedure Set_Pattern(const retval: WideString); safecall;
    function Get_Scale: Double; safecall;
    procedure Set_Scale(retval: Double); safecall;
    function Get_angle: Double; safecall;
    procedure Set_angle(retval: Double); safecall;
    function GetFace: IDispatch; safecall;
    function IGetFace: IFace; safecall;
    function GetSketch: ISketch; safecall;
    function Get_Scale2: Double; safecall;
    procedure Set_Scale2(retval: Double); safecall;
    property Layer: WideString read Get_Layer write Set_Layer;
    property LayerOverride: SYSINT read Get_LayerOverride write Set_LayerOverride;
    property Color: Integer read Get_Color write Set_Color;
    property Pattern: WideString read Get_Pattern write Set_Pattern;
    property Scale: Double read Get_Scale write Set_Scale;
    property angle: Double read Get_angle write Set_angle;
    property Scale2: Double read Get_Scale2 write Set_Scale2;
  end;

// *********************************************************************//
// DispIntf:  ISketchHatchDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C3D00926-4068-11D3-AE9B-00C04F683CBA}
// *********************************************************************//
  ISketchHatchDisp = dispinterface
    ['{C3D00926-4068-11D3-AE9B-00C04F683CBA}']
    function GetId: OleVariant; dispid 1;
    function IGetID: Integer; dispid 2;
    function Select(appendFlag: WordBool): WordBool; dispid 3;
    function SelectByMark(appendFlag: WordBool; mark: Integer): WordBool; dispid 4;
    function DeSelect: WordBool; dispid 5;
    property Layer: WideString dispid 6;
    property LayerOverride: SYSINT dispid 7;
    property Color: Integer dispid 8;
    property Pattern: WideString dispid 9;
    property Scale: Double dispid 10;
    property angle: Double dispid 11;
    function GetFace: IDispatch; dispid 12;
    function IGetFace: IFace; dispid 13;
    function GetSketch: ISketch; dispid 14;
    property Scale2: Double dispid 15;
  end;

// *********************************************************************//
// Interface: IMidSurface
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D88-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IMidSurface = interface(IDispatch)
    ['{83A33D88-27C5-11CE-BFD4-00400513BB57}']
    function GetFacePairCount: Integer; safecall;
    function GetFirstFacePair(out thickness: Double; out partnerFaceDisp: IDispatch): IDispatch; safecall;
    function IGetFirstFacePair(out thickness: Double; out partnerFaceDisp: IFace): IFace; safecall;
    function GetNextFacePair(out thickness: Double; out partnerFaceDisp: IDispatch): IDispatch; safecall;
    function IGetNextFacePair(out thickness: Double; out partnerFaceDisp: IFace): IFace; safecall;
    function GetFirstNeutralSheet: IDispatch; safecall;
    function IGetFirstNeutralSheet: IBody; safecall;
    function GetNextNeutralSheet: IDispatch; safecall;
    function IGetNextNeutralSheet: IBody; safecall;
    function GetNeutralSheetCount: Integer; safecall;
    function GetFaceCount: Integer; safecall;
    function GetFirstFace(out fromFace1Disp: IDispatch; out fromFace2Disp: IDispatch; 
                          out thickness: Double): IDispatch; safecall;
    function IGetFirstFace(out fromFace1Disp: IFace; out fromFace2Disp: IFace; out thickness: Double): IFace; safecall;
    function GetNextFace(out fromFace1Disp: IDispatch; out fromFace2Disp: IDispatch; 
                         out thickness: Double): IDispatch; safecall;
    function IGetNextFace(out fromFace1Disp: IFace; out fromFace2Disp: IFace; out thickness: Double): IFace; safecall;
    function EdgeGetFace(const edgeInDisp: IDispatch): IDispatch; safecall;
    function IEdgeGetFace(const edgeInDisp: IEdge): IFace; safecall;
    function IGetFirstFaceArray(out fromFrontFaceListDisp: PPUserType5; 
                                out sizeOfFrontFaceList: Integer; 
                                out fromFaceBackListDisp: PPUserType5; 
                                out sizeOfBackFaceList: Integer; out thickness: Double): IFace; safecall;
    function IGetNextFaceArray(out fromFrontFaceListDisp: PPUserType5; 
                               out sizeOfFrontFaceList: Integer; 
                               out fromFaceBackListDisp: PPUserType5; 
                               out sizeOfBackFaceList: Integer; out thickness: Double): IFace; safecall;
    function GetFirstFaceArray(out thickness: Double): OleVariant; safecall;
    function GetNextFaceArray(out thickness: Double): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMidSurfaceDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D88-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IMidSurfaceDisp = dispinterface
    ['{83A33D88-27C5-11CE-BFD4-00400513BB57}']
    function GetFacePairCount: Integer; dispid 1;
    function GetFirstFacePair(out thickness: Double; out partnerFaceDisp: IDispatch): IDispatch; dispid 2;
    function IGetFirstFacePair(out thickness: Double; out partnerFaceDisp: IFace): IFace; dispid 3;
    function GetNextFacePair(out thickness: Double; out partnerFaceDisp: IDispatch): IDispatch; dispid 4;
    function IGetNextFacePair(out thickness: Double; out partnerFaceDisp: IFace): IFace; dispid 5;
    function GetFirstNeutralSheet: IDispatch; dispid 6;
    function IGetFirstNeutralSheet: IBody; dispid 7;
    function GetNextNeutralSheet: IDispatch; dispid 8;
    function IGetNextNeutralSheet: IBody; dispid 9;
    function GetNeutralSheetCount: Integer; dispid 10;
    function GetFaceCount: Integer; dispid 11;
    function GetFirstFace(out fromFace1Disp: IDispatch; out fromFace2Disp: IDispatch; 
                          out thickness: Double): IDispatch; dispid 12;
    function IGetFirstFace(out fromFace1Disp: IFace; out fromFace2Disp: IFace; out thickness: Double): IFace; dispid 13;
    function GetNextFace(out fromFace1Disp: IDispatch; out fromFace2Disp: IDispatch; 
                         out thickness: Double): IDispatch; dispid 14;
    function IGetNextFace(out fromFace1Disp: IFace; out fromFace2Disp: IFace; out thickness: Double): IFace; dispid 15;
    function EdgeGetFace(const edgeInDisp: IDispatch): IDispatch; dispid 16;
    function IEdgeGetFace(const edgeInDisp: IEdge): IFace; dispid 17;
    function IGetFirstFaceArray(out fromFrontFaceListDisp: {??PPUserType5} OleVariant; 
                                out sizeOfFrontFaceList: Integer; 
                                out fromFaceBackListDisp: {??PPUserType5} OleVariant; 
                                out sizeOfBackFaceList: Integer; out thickness: Double): IFace; dispid 18;
    function IGetNextFaceArray(out fromFrontFaceListDisp: {??PPUserType5} OleVariant; 
                               out sizeOfFrontFaceList: Integer; 
                               out fromFaceBackListDisp: {??PPUserType5} OleVariant; 
                               out sizeOfBackFaceList: Integer; out thickness: Double): IFace; dispid 19;
    function GetFirstFaceArray(out thickness: Double): OleVariant; dispid 20;
    function GetNextFaceArray(out thickness: Double): OleVariant; dispid 21;
  end;

// *********************************************************************//
// Interface: IFeatMgrView
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D75-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IFeatMgrView = interface(IDispatch)
    ['{83A33D75-27C5-11CE-BFD4-00400513BB57}']
    function GetFeatMgrViewWnd: Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IFeatMgrViewDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D75-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IFeatMgrViewDisp = dispinterface
    ['{83A33D75-27C5-11CE-BFD4-00400513BB57}']
    function GetFeatMgrViewWnd: Integer; dispid 1;
  end;

// *********************************************************************//
// Interface: IConfiguration
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D98-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IConfiguration = interface(IDispatch)
    ['{83A33D98-27C5-11CE-BFD4-00400513BB57}']
    function GetRootComponent: IDispatch; safecall;
    function IGetRootComponent: IComponent; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const retval: WideString); safecall;
    function Get_comment: WideString; safecall;
    procedure Set_comment(const retval: WideString); safecall;
    function Get_alternateName: WideString; safecall;
    procedure Set_alternateName(const retval: WideString); safecall;
    function Get_UseAlternateNameInBOM: WordBool; safecall;
    procedure Set_UseAlternateNameInBOM(retval: WordBool); safecall;
    function Get_SuppressNewFeatures: WordBool; safecall;
    procedure Set_SuppressNewFeatures(retval: WordBool); safecall;
    function Get_HideNewComponentModels: WordBool; safecall;
    procedure Set_HideNewComponentModels(retval: WordBool); safecall;
    function Get_SuppressNewComponentModels: WordBool; safecall;
    procedure Set_SuppressNewComponentModels(retval: WordBool); safecall;
    function Get_ShowChildComponentsInBOM: WordBool; safecall;
    procedure Set_ShowChildComponentsInBOM(retval: WordBool); safecall;
    function GetNumberOfExplodeSteps: SYSINT; safecall;
    function GetExplodeStep(explodeStepIndex: Integer): IDispatch; safecall;
    function IGetExplodeStep(explodeStepIndex: Integer): IExplodeStep; safecall;
    function AddExplodeStep(explDist: Double; reverseDir: WordBool; rigidSubassembly: WordBool; 
                            explodeRelated: WordBool): IDispatch; safecall;
    function IAddExplodeStep(explDist: Double; reverseDir: WordBool; rigidSubassembly: WordBool; 
                             explodeRelated: WordBool): IExplodeStep; safecall;
    function DeleteExplodeStep(const explodeStepName: WideString): WordBool; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property comment: WideString read Get_comment write Set_comment;
    property alternateName: WideString read Get_alternateName write Set_alternateName;
    property UseAlternateNameInBOM: WordBool read Get_UseAlternateNameInBOM write Set_UseAlternateNameInBOM;
    property SuppressNewFeatures: WordBool read Get_SuppressNewFeatures write Set_SuppressNewFeatures;
    property HideNewComponentModels: WordBool read Get_HideNewComponentModels write Set_HideNewComponentModels;
    property SuppressNewComponentModels: WordBool read Get_SuppressNewComponentModels write Set_SuppressNewComponentModels;
    property ShowChildComponentsInBOM: WordBool read Get_ShowChildComponentsInBOM write Set_ShowChildComponentsInBOM;
  end;

// *********************************************************************//
// DispIntf:  IConfigurationDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D98-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IConfigurationDisp = dispinterface
    ['{83A33D98-27C5-11CE-BFD4-00400513BB57}']
    function GetRootComponent: IDispatch; dispid 1;
    function IGetRootComponent: IComponent; dispid 2;
    property Name: WideString dispid 3;
    property comment: WideString dispid 4;
    property alternateName: WideString dispid 5;
    property UseAlternateNameInBOM: WordBool dispid 6;
    property SuppressNewFeatures: WordBool dispid 7;
    property HideNewComponentModels: WordBool dispid 8;
    property SuppressNewComponentModels: WordBool dispid 9;
    property ShowChildComponentsInBOM: WordBool dispid 10;
    function GetNumberOfExplodeSteps: SYSINT; dispid 11;
    function GetExplodeStep(explodeStepIndex: Integer): IDispatch; dispid 12;
    function IGetExplodeStep(explodeStepIndex: Integer): IExplodeStep; dispid 13;
    function AddExplodeStep(explDist: Double; reverseDir: WordBool; rigidSubassembly: WordBool; 
                            explodeRelated: WordBool): IDispatch; dispid 14;
    function IAddExplodeStep(explDist: Double; reverseDir: WordBool; rigidSubassembly: WordBool; 
                             explodeRelated: WordBool): IExplodeStep; dispid 15;
    function DeleteExplodeStep(const explodeStepName: WideString): WordBool; dispid 16;
  end;

// *********************************************************************//
// Interface: IExplodeStep
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7241680B-0BC6-11D4-AEEE-00C04F61025C}
// *********************************************************************//
  IExplodeStep = interface(IDispatch)
    ['{7241680B-0BC6-11D4-AEEE-00C04F61025C}']
    function GetNumOfComponents: SYSINT; safecall;
    function GetComponentName(index: SYSINT): WideString; safecall;
    function GetComponentXform: OleVariant; safecall;
    function IGetComponentXform: Double; safecall;
    function GetComponent(index: SYSINT): IDispatch; safecall;
    function IGetComponent(index: SYSINT): IComponent; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const retval: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
  end;

// *********************************************************************//
// DispIntf:  IExplodeStepDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7241680B-0BC6-11D4-AEEE-00C04F61025C}
// *********************************************************************//
  IExplodeStepDisp = dispinterface
    ['{7241680B-0BC6-11D4-AEEE-00C04F61025C}']
    function GetNumOfComponents: SYSINT; dispid 1;
    function GetComponentName(index: SYSINT): WideString; dispid 2;
    function GetComponentXform: OleVariant; dispid 3;
    function IGetComponentXform: Double; dispid 4;
    function GetComponent(index: SYSINT): IDispatch; dispid 5;
    function IGetComponent(index: SYSINT): IComponent; dispid 6;
    property Name: WideString dispid 7;
  end;

// *********************************************************************//
// Interface: IReferenceCurve
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA3-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IReferenceCurve = interface(IDispatch)
    ['{83A33DA3-27C5-11CE-BFD4-00400513BB57}']
    function GetSegmentCount: Integer; safecall;
    function GetFirstSegment: IDispatch; safecall;
    function IGetFirstSegment: IEdge; safecall;
    function GetNextSegment: IDispatch; safecall;
    function IGetNextSegment: IEdge; safecall;
    function SetColor(colorIn: Integer): WordBool; safecall;
    function SetVisible(Visible: WordBool): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IReferenceCurveDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA3-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IReferenceCurveDisp = dispinterface
    ['{83A33DA3-27C5-11CE-BFD4-00400513BB57}']
    function GetSegmentCount: Integer; dispid 1;
    function GetFirstSegment: IDispatch; dispid 2;
    function IGetFirstSegment: IEdge; dispid 3;
    function GetNextSegment: IDispatch; dispid 4;
    function IGetNextSegment: IEdge; dispid 5;
    function SetColor(colorIn: Integer): WordBool; dispid 6;
    function SetVisible(Visible: WordBool): WordBool; dispid 7;
  end;

// *********************************************************************//
// Interface: IColorTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA5-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IColorTable = interface(IDispatch)
    ['{83A33DA5-27C5-11CE-BFD4-00400513BB57}']
    function GetCount: Integer; safecall;
    function GetNameAtIndex(index: Integer): WideString; safecall;
    function GetColorRefAtIndex(index: Integer): Integer; safecall;
    function GetStandardCount: Integer; safecall;
    procedure SetColorRefAtIndex(index: Integer; colorRef: Integer; applyTo: SYSINT); safecall;
    function GetBasicColorCount: Integer; safecall;
    function GetBasicColors: OleVariant; safecall;
    function IGetBasicColors(ColorCount: Integer): Integer; safecall;
    function GetCustomColorCount: Integer; safecall;
    function GetCustomColors: OleVariant; safecall;
    function IGetCustomColors(ColorCount: Integer): Integer; safecall;
    function SetCustomColor(index: Integer; colorRef: Integer): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IColorTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA5-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IColorTableDisp = dispinterface
    ['{83A33DA5-27C5-11CE-BFD4-00400513BB57}']
    function GetCount: Integer; dispid 1;
    function GetNameAtIndex(index: Integer): WideString; dispid 2;
    function GetColorRefAtIndex(index: Integer): Integer; dispid 3;
    function GetStandardCount: Integer; dispid 4;
    procedure SetColorRefAtIndex(index: Integer; colorRef: Integer; applyTo: SYSINT); dispid 5;
    function GetBasicColorCount: Integer; dispid 6;
    function GetBasicColors: OleVariant; dispid 7;
    function IGetBasicColors(ColorCount: Integer): Integer; dispid 8;
    function GetCustomColorCount: Integer; dispid 9;
    function GetCustomColors: OleVariant; dispid 10;
    function IGetCustomColors(ColorCount: Integer): Integer; dispid 11;
    function SetCustomColor(index: Integer; colorRef: Integer): WordBool; dispid 12;
  end;

// *********************************************************************//
// Interface: IEnumModelViews
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33DB1-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumModelViews = interface(IUnknown)
    ['{83A33DB1-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: IModelView; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumModelViews): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IDetailingDefaults
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DB7-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDetailingDefaults = interface(IDispatch)
    ['{83A33DB7-27C5-11CE-BFD4-00400513BB57}']
    function GetAllValues: OleVariant; safecall;
    function IGetAllValues(count: Integer): Double; safecall;
    function GetTextFormat: IDispatch; safecall;
    function IGetTextFormat: ITextFormat; safecall;
    procedure SetTextFormat(const textFormat: IDispatch); safecall;
    procedure ISetTextFormat(const textFormat: ITextFormat); safecall;
    function GetDimensionTextFormat: IDispatch; safecall;
    function IGetDimensionTextFormat: ITextFormat; safecall;
    procedure SetDimensionTextFormat(const textFormat: IDispatch); safecall;
    procedure ISetDimensionTextFormat(const textFormat: ITextFormat); safecall;
    function GetSectionTextFormat: IDispatch; safecall;
    function IGetSectionTextFormat: ITextFormat; safecall;
    procedure SetSectionTextFormat(const textFormat: IDispatch); safecall;
    procedure ISetSectionTextFormat(const textFormat: ITextFormat); safecall;
    function GetDetailTextFormat: IDispatch; safecall;
    function IGetDetailTextFormat: ITextFormat; safecall;
    procedure SetDetailTextFormat(const textFormat: IDispatch); safecall;
    procedure ISetDetailTextFormat(const textFormat: ITextFormat); safecall;
  end;

// *********************************************************************//
// DispIntf:  IDetailingDefaultsDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DB7-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDetailingDefaultsDisp = dispinterface
    ['{83A33DB7-27C5-11CE-BFD4-00400513BB57}']
    function GetAllValues: OleVariant; dispid 1;
    function IGetAllValues(count: Integer): Double; dispid 2;
    function GetTextFormat: IDispatch; dispid 3;
    function IGetTextFormat: ITextFormat; dispid 4;
    procedure SetTextFormat(const textFormat: IDispatch); dispid 5;
    procedure ISetTextFormat(const textFormat: ITextFormat); dispid 6;
    function GetDimensionTextFormat: IDispatch; dispid 7;
    function IGetDimensionTextFormat: ITextFormat; dispid 8;
    procedure SetDimensionTextFormat(const textFormat: IDispatch); dispid 9;
    procedure ISetDimensionTextFormat(const textFormat: ITextFormat); dispid 10;
    function GetSectionTextFormat: IDispatch; dispid 11;
    function IGetSectionTextFormat: ITextFormat; dispid 12;
    procedure SetSectionTextFormat(const textFormat: IDispatch); dispid 13;
    procedure ISetSectionTextFormat(const textFormat: ITextFormat); dispid 14;
    function GetDetailTextFormat: IDispatch; dispid 15;
    function IGetDetailTextFormat: ITextFormat; dispid 16;
    procedure SetDetailTextFormat(const textFormat: IDispatch); dispid 17;
    procedure ISetDetailTextFormat(const textFormat: ITextFormat); dispid 18;
  end;

// *********************************************************************//
// Interface: ILayerMgr
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {75173E30-F19E-11D2-B8E9-00C04F8EF738}
// *********************************************************************//
  ILayerMgr = interface(IDispatch)
    ['{75173E30-F19E-11D2-B8E9-00C04F8EF738}']
    function AddLayer(const nameIn: WideString; const descIn: WideString; colorIn: Integer; 
                      styleIn: Integer; widthIn: Integer): SYSINT; safecall;
    function SetCurrentLayer(const nameIn: WideString): SYSINT; safecall;
    function GetCurrentLayer: WideString; safecall;
    function GetLayer(const nameIn: WideString): IDispatch; safecall;
    function IGetLayer(const nameIn: WideString): ILayer; safecall;
    function GetCount: SYSINT; safecall;
    function GetLayerList: OleVariant; safecall;
    function IGetLayerList: WideString; safecall;
    function GetLayerById(layerId: Smallint): IDispatch; safecall;
    function IGetLayerById(layerId: Smallint): ILayer; safecall;
    function DeleteLayer(const Name: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  ILayerMgrDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {75173E30-F19E-11D2-B8E9-00C04F8EF738}
// *********************************************************************//
  ILayerMgrDisp = dispinterface
    ['{75173E30-F19E-11D2-B8E9-00C04F8EF738}']
    function AddLayer(const nameIn: WideString; const descIn: WideString; colorIn: Integer; 
                      styleIn: Integer; widthIn: Integer): SYSINT; dispid 1;
    function SetCurrentLayer(const nameIn: WideString): SYSINT; dispid 2;
    function GetCurrentLayer: WideString; dispid 3;
    function GetLayer(const nameIn: WideString): IDispatch; dispid 4;
    function IGetLayer(const nameIn: WideString): ILayer; dispid 5;
    function GetCount: SYSINT; dispid 6;
    function GetLayerList: OleVariant; dispid 7;
    function IGetLayerList: WideString; dispid 8;
    function GetLayerById(layerId: Smallint): IDispatch; dispid 9;
    function IGetLayerById(layerId: Smallint): ILayer; dispid 10;
    function DeleteLayer(const Name: WideString): WordBool; dispid 11;
  end;

// *********************************************************************//
// Interface: ILayer
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {04B7287C-F19D-11D2-B8E9-00C04F8EF738}
// *********************************************************************//
  ILayer = interface(IDispatch)
    ['{04B7287C-F19D-11D2-B8E9-00C04F8EF738}']
    function Get_Name: WideString; safecall;
    function Get_Color: Integer; safecall;
    function Get_Style: SYSINT; safecall;
    function Get_Width: SYSINT; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(retval: WordBool); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const retval: WideString); safecall;
    function GetId: Integer; safecall;
    property Name: WideString read Get_Name;
    property Color: Integer read Get_Color;
    property Style: SYSINT read Get_Style;
    property Width: SYSINT read Get_Width;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Description: WideString read Get_Description write Set_Description;
  end;

// *********************************************************************//
// DispIntf:  ILayerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {04B7287C-F19D-11D2-B8E9-00C04F8EF738}
// *********************************************************************//
  ILayerDisp = dispinterface
    ['{04B7287C-F19D-11D2-B8E9-00C04F8EF738}']
    property Name: WideString readonly dispid 1;
    property Color: Integer readonly dispid 2;
    property Style: SYSINT readonly dispid 3;
    property Width: SYSINT readonly dispid 4;
    property Visible: WordBool dispid 5;
    property Description: WideString dispid 6;
    function GetId: Integer; dispid 7;
  end;

// *********************************************************************//
// Interface: IDesignTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {CE1EAA88-25AD-11D3-AE91-00C04F683CBA}
// *********************************************************************//
  IDesignTable = interface(IDispatch)
    ['{CE1EAA88-25AD-11D3-AE91-00C04F683CBA}']
    function GetRowCount: Integer; safecall;
    function GetColumnCount: Integer; safecall;
    function GetHeaderText(col: Integer): WideString; safecall;
    function GetEntryText(row: Integer; col: Integer): WideString; safecall;
    function Attach: WordBool; safecall;
    procedure Detach; safecall;
    function GetEntryValue(row: Integer; col: Integer): OleVariant; safecall;
    function GetTitle: WideString; safecall;
    function GetTotalRowCount: Integer; safecall;
    function GetTotalColumnCount: Integer; safecall;
    function GetVisibleRowCount: Integer; safecall;
    function GetVisibleColumnCount: Integer; safecall;
    procedure SetEntryText(row: Integer; col: Integer; const textIn: WideString); safecall;
    function AddRow(cellValues: OleVariant): WordBool; safecall;
    function UpdateModel: WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDesignTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {CE1EAA88-25AD-11D3-AE91-00C04F683CBA}
// *********************************************************************//
  IDesignTableDisp = dispinterface
    ['{CE1EAA88-25AD-11D3-AE91-00C04F683CBA}']
    function GetRowCount: Integer; dispid 1;
    function GetColumnCount: Integer; dispid 2;
    function GetHeaderText(col: Integer): WideString; dispid 3;
    function GetEntryText(row: Integer; col: Integer): WideString; dispid 4;
    function Attach: WordBool; dispid 5;
    procedure Detach; dispid 6;
    function GetEntryValue(row: Integer; col: Integer): OleVariant; dispid 7;
    function GetTitle: WideString; dispid 8;
    function GetTotalRowCount: Integer; dispid 9;
    function GetTotalColumnCount: Integer; dispid 10;
    function GetVisibleRowCount: Integer; dispid 11;
    function GetVisibleColumnCount: Integer; dispid 12;
    procedure SetEntryText(row: Integer; col: Integer; const textIn: WideString); dispid 13;
    function AddRow(cellValues: OleVariant): WordBool; dispid 14;
    function UpdateModel: WordBool; dispid 15;
  end;

// *********************************************************************//
// Interface: IRefPlane
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D84-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IRefPlane = interface(IDispatch)
    ['{83A33D84-27C5-11CE-BFD4-00400513BB57}']
    function GetRefPlaneParams: OleVariant; safecall;
    function IGetRefPlaneParams: Double; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRefPlaneDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D84-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IRefPlaneDisp = dispinterface
    ['{83A33D84-27C5-11CE-BFD4-00400513BB57}']
    function GetRefPlaneParams: OleVariant; dispid 1;
    function IGetRefPlaneParams: Double; dispid 2;
  end;

// *********************************************************************//
// Interface: IDatumTag
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D90-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDatumTag = interface(IDispatch)
    ['{83A33D90-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: IDatumTag; safecall;
    function GetTextCount: Integer; safecall;
    function GetTextAtIndex(index: Integer): WideString; safecall;
    function GetTextHeightAtIndex(index: Integer): Double; safecall;
    function GetTextPositionAtIndex(index: Integer): OleVariant; safecall;
    function IGetTextPositionAtIndex(index: Integer): Double; safecall;
    function GetTextAngleAtIndex(index: Integer): Double; safecall;
    function GetTextRefPositionAtIndex(index: Integer): Integer; safecall;
    function GetTextInvertAtIndex(index: Integer): Integer; safecall;
    function GetLineCount: Integer; safecall;
    function GetLineAtIndex(index: Integer): OleVariant; safecall;
    function IGetLineAtIndex(index: Integer): Double; safecall;
    function GetArcCount: Integer; safecall;
    function GetArcAtIndex(index: Integer): OleVariant; safecall;
    function IGetArcAtIndex(index: Integer): Double; safecall;
    function GetArrowHeadCount: Integer; safecall;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; safecall;
    function IGetArrowHeadAtIndex(index: Integer): Double; safecall;
    function GetTriangleCount: Integer; safecall;
    function GetTriangleAtIndex(index: Integer): OleVariant; safecall;
    function IGetTriangleAtIndex(index: Integer): Double; safecall;
    function GetAnnotation: IDispatch; safecall;
    function IGetAnnotation: IAnnotation; safecall;
    function GetLabel: WideString; safecall;
    function SetLabel(const label_: WideString): WordBool; safecall;
    function Get_FilledTriangle: WordBool; safecall;
    procedure Set_FilledTriangle(retval: WordBool); safecall;
    function Get_Shoulder: WordBool; safecall;
    procedure Set_Shoulder(retval: WordBool); safecall;
    property FilledTriangle: WordBool read Get_FilledTriangle write Set_FilledTriangle;
    property Shoulder: WordBool read Get_Shoulder write Set_Shoulder;
  end;

// *********************************************************************//
// DispIntf:  IDatumTagDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D90-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDatumTagDisp = dispinterface
    ['{83A33D90-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: IDatumTag; dispid 2;
    function GetTextCount: Integer; dispid 3;
    function GetTextAtIndex(index: Integer): WideString; dispid 4;
    function GetTextHeightAtIndex(index: Integer): Double; dispid 5;
    function GetTextPositionAtIndex(index: Integer): OleVariant; dispid 6;
    function IGetTextPositionAtIndex(index: Integer): Double; dispid 7;
    function GetTextAngleAtIndex(index: Integer): Double; dispid 8;
    function GetTextRefPositionAtIndex(index: Integer): Integer; dispid 9;
    function GetTextInvertAtIndex(index: Integer): Integer; dispid 10;
    function GetLineCount: Integer; dispid 11;
    function GetLineAtIndex(index: Integer): OleVariant; dispid 12;
    function IGetLineAtIndex(index: Integer): Double; dispid 13;
    function GetArcCount: Integer; dispid 14;
    function GetArcAtIndex(index: Integer): OleVariant; dispid 15;
    function IGetArcAtIndex(index: Integer): Double; dispid 16;
    function GetArrowHeadCount: Integer; dispid 17;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; dispid 18;
    function IGetArrowHeadAtIndex(index: Integer): Double; dispid 19;
    function GetTriangleCount: Integer; dispid 20;
    function GetTriangleAtIndex(index: Integer): OleVariant; dispid 21;
    function IGetTriangleAtIndex(index: Integer): Double; dispid 22;
    function GetAnnotation: IDispatch; dispid 23;
    function IGetAnnotation: IAnnotation; dispid 24;
    function GetLabel: WideString; dispid 25;
    function SetLabel(const label_: WideString): WordBool; dispid 26;
    property FilledTriangle: WordBool dispid 27;
    property Shoulder: WordBool dispid 28;
  end;

// *********************************************************************//
// Interface: IGtol
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D4A-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IGtol = interface(IDispatch)
    ['{83A33D4A-27C5-11CE-BFD4-00400513BB57}']
    procedure SetFrameValues(frameNumber: Smallint; const tol1: WideString; const tol2: WideString; 
                             const datum1: WideString; const datum2: WideString; 
                             const datum3: WideString); safecall;
    procedure SetFrameSymbols(frameNumber: Smallint; GCS: Smallint; tolDia1: WordBool; 
                              tolMC1: Smallint; tolDia2: WordBool; tolMC2: Smallint; 
                              datumMC1: Smallint; datumMC2: Smallint; datumMC3: Smallint); safecall;
    procedure SetPTZHeight(const ptzHt: WideString; displayIn: WordBool); safecall;
    procedure SetDatumIdentifier(const datumIdentifier: WideString); safecall;
    function GetNextGTOL: IDispatch; safecall;
    function IGetNextGTOL: IGtol; safecall;
    function GetFrameValues(frameNumber: Smallint): OleVariant; safecall;
    function GetFrameSymbols(frameNumber: Smallint): OleVariant; safecall;
    function GetPTZHeight: WideString; safecall;
    function GetDatumIdentifier: WideString; safecall;
    function GetHeight: Double; safecall;
    function GetAttachPos: OleVariant; safecall;
    function GetFontInfo: OleVariant; safecall;
    function GetLeaderInfo: OleVariant; safecall;
    function IsAttached: WordBool; safecall;
    function HasExtraLeader: WordBool; safecall;
    procedure Dummy1; safecall;
    procedure Dummy2; safecall;
    function GetTextPoint: OleVariant; safecall;
    function GetArrowHeadInfo: OleVariant; safecall;
    function IGetAttachPos: Double; safecall;
    function IGetFontInfo: Double; safecall;
    function IGetLeaderInfo(out pointCount: Integer): Double; safecall;
    procedure Dummy3; safecall;
    function IGetTextPoint: Double; safecall;
    function IGetArrowHeadInfo: Double; safecall;
    function GetSymName(symIdx: Smallint): WideString; safecall;
    function GetSymDesc(symIdx: Smallint): WideString; safecall;
    function GetSymText(symIdx: Smallint): OleVariant; safecall;
    function GetSymEdgeCounts(symIdx: Smallint): OleVariant; safecall;
    function GetSymLines(symIdx: Smallint): OleVariant; safecall;
    function GetSymArcs(symIdx: Smallint): OleVariant; safecall;
    function GetSymCircles(symIdx: Smallint): OleVariant; safecall;
    function GetSymTextPoints(symIdx: Smallint): OleVariant; safecall;
    function IGetSymEdgeCounts(symIdx: Smallint): Smallint; safecall;
    function IGetSymLines(symIdx: Smallint): Double; safecall;
    function IGetSymArcs(symIdx: Smallint): Double; safecall;
    function IGetSymCircles(symIdx: Smallint): Double; safecall;
    function IGetSymTextPoints(symIdx: Smallint): Double; safecall;
    function GetTextCount: Integer; safecall;
    function GetTextAtIndex(index: Integer): WideString; safecall;
    function GetTextHeightAtIndex(index: Integer): Double; safecall;
    function GetTextPositionAtIndex(index: Integer): OleVariant; safecall;
    function IGetTextPositionAtIndex(index: Integer): Double; safecall;
    function GetTextAngleAtIndex(index: Integer): Double; safecall;
    function GetTextRefPositionAtIndex(index: Integer): Integer; safecall;
    function GetTextInvertAtIndex(index: Integer): Integer; safecall;
    function GetLineCount: Integer; safecall;
    function GetLineAtIndex(index: Integer): OleVariant; safecall;
    function IGetLineAtIndex(index: Integer): Double; safecall;
    function GetArcCount: Integer; safecall;
    function GetArcAtIndex(index: Integer): OleVariant; safecall;
    function IGetArcAtIndex(index: Integer): Double; safecall;
    function GetArrowHeadCount: Integer; safecall;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; safecall;
    function IGetArrowHeadAtIndex(index: Integer): Double; safecall;
    function GetTriangleCount: Integer; safecall;
    function GetTriangleAtIndex(index: Integer): OleVariant; safecall;
    function IGetTriangleAtIndex(index: Integer): Double; safecall;
    function IGetFrameValues(frameNumber: Smallint): WideString; safecall;
    function IGetFrameSymbols(frameNumber: Smallint): Smallint; safecall;
    function IGetSymText(symIdx: Smallint): WideString; safecall;
    procedure SetFrameSymbols2(frameNumber: Smallint; const GCS: WideString; tolDia1: WordBool; 
                               const tolMC1: WideString; tolDia2: WordBool; 
                               const tolMC2: WideString; const datumMC1: WideString; 
                               const datumMC2: WideString; const datumMC3: WideString); safecall;
    function GetTextFont: WideString; safecall;
    function GetLeaderCount: Integer; safecall;
    function GetLeaderAtIndex(index: Integer): OleVariant; safecall;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; safecall;
    procedure SetPosition(x: Double; y: Double; z: Double); safecall;
    function GetUseDocTextFormat: WordBool; safecall;
    function GetTextFormat: IDispatch; safecall;
    function IGetTextFormat: ITextFormat; safecall;
    function SetTextFormat(textFormatType: Integer; const textFormat: IDispatch): WordBool; safecall;
    function ISetTextFormat(textFormatType: Integer; const textFormat: ITextFormat): WordBool; safecall;
    function GetCompositeFrame: WordBool; safecall;
    procedure SetCompositeFrame(composite: WordBool); safecall;
    function GetBetweenTwoPoints: WordBool; safecall;
    function GetBetweenTwoPointsText(index: Integer): WideString; safecall;
    procedure SetBetweenTwoPoints(between: WordBool; const textFrom: WideString; 
                                  const textTo: WideString); safecall;
    function GetAllAround: WordBool; safecall;
    function GetLeaderSide: Integer; safecall;
    procedure SetLeader(leader: WordBool; leaderSide: Integer; bentLeader: WordBool; 
                        allAround: WordBool); safecall;
    function GetAnnotation: IDispatch; safecall;
    function IGetAnnotation: IAnnotation; safecall;
    function GetFrameSymbols2(frameNumber: Smallint): OleVariant; safecall;
    function IGetFrameSymbols2(frameNumber: Smallint): WideString; safecall;
    function GetFrameDiameterSymbols(frameNumber: Smallint): OleVariant; safecall;
    function IGetFrameDiameterSymbols(frameNumber: Smallint): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGtolDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D4A-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IGtolDisp = dispinterface
    ['{83A33D4A-27C5-11CE-BFD4-00400513BB57}']
    procedure SetFrameValues(frameNumber: Smallint; const tol1: WideString; const tol2: WideString; 
                             const datum1: WideString; const datum2: WideString; 
                             const datum3: WideString); dispid 1;
    procedure SetFrameSymbols(frameNumber: Smallint; GCS: Smallint; tolDia1: WordBool; 
                              tolMC1: Smallint; tolDia2: WordBool; tolMC2: Smallint; 
                              datumMC1: Smallint; datumMC2: Smallint; datumMC3: Smallint); dispid 2;
    procedure SetPTZHeight(const ptzHt: WideString; displayIn: WordBool); dispid 3;
    procedure SetDatumIdentifier(const datumIdentifier: WideString); dispid 4;
    function GetNextGTOL: IDispatch; dispid 5;
    function IGetNextGTOL: IGtol; dispid 6;
    function GetFrameValues(frameNumber: Smallint): OleVariant; dispid 7;
    function GetFrameSymbols(frameNumber: Smallint): OleVariant; dispid 8;
    function GetPTZHeight: WideString; dispid 9;
    function GetDatumIdentifier: WideString; dispid 10;
    function GetHeight: Double; dispid 11;
    function GetAttachPos: OleVariant; dispid 12;
    function GetFontInfo: OleVariant; dispid 13;
    function GetLeaderInfo: OleVariant; dispid 14;
    function IsAttached: WordBool; dispid 15;
    function HasExtraLeader: WordBool; dispid 16;
    procedure Dummy1; dispid 17;
    procedure Dummy2; dispid 18;
    function GetTextPoint: OleVariant; dispid 19;
    function GetArrowHeadInfo: OleVariant; dispid 20;
    function IGetAttachPos: Double; dispid 21;
    function IGetFontInfo: Double; dispid 22;
    function IGetLeaderInfo(out pointCount: Integer): Double; dispid 23;
    procedure Dummy3; dispid 24;
    function IGetTextPoint: Double; dispid 25;
    function IGetArrowHeadInfo: Double; dispid 26;
    function GetSymName(symIdx: Smallint): WideString; dispid 27;
    function GetSymDesc(symIdx: Smallint): WideString; dispid 28;
    function GetSymText(symIdx: Smallint): OleVariant; dispid 29;
    function GetSymEdgeCounts(symIdx: Smallint): OleVariant; dispid 30;
    function GetSymLines(symIdx: Smallint): OleVariant; dispid 31;
    function GetSymArcs(symIdx: Smallint): OleVariant; dispid 32;
    function GetSymCircles(symIdx: Smallint): OleVariant; dispid 33;
    function GetSymTextPoints(symIdx: Smallint): OleVariant; dispid 34;
    function IGetSymEdgeCounts(symIdx: Smallint): Smallint; dispid 35;
    function IGetSymLines(symIdx: Smallint): Double; dispid 36;
    function IGetSymArcs(symIdx: Smallint): Double; dispid 37;
    function IGetSymCircles(symIdx: Smallint): Double; dispid 38;
    function IGetSymTextPoints(symIdx: Smallint): Double; dispid 39;
    function GetTextCount: Integer; dispid 40;
    function GetTextAtIndex(index: Integer): WideString; dispid 41;
    function GetTextHeightAtIndex(index: Integer): Double; dispid 42;
    function GetTextPositionAtIndex(index: Integer): OleVariant; dispid 43;
    function IGetTextPositionAtIndex(index: Integer): Double; dispid 44;
    function GetTextAngleAtIndex(index: Integer): Double; dispid 45;
    function GetTextRefPositionAtIndex(index: Integer): Integer; dispid 46;
    function GetTextInvertAtIndex(index: Integer): Integer; dispid 47;
    function GetLineCount: Integer; dispid 48;
    function GetLineAtIndex(index: Integer): OleVariant; dispid 49;
    function IGetLineAtIndex(index: Integer): Double; dispid 50;
    function GetArcCount: Integer; dispid 51;
    function GetArcAtIndex(index: Integer): OleVariant; dispid 52;
    function IGetArcAtIndex(index: Integer): Double; dispid 53;
    function GetArrowHeadCount: Integer; dispid 54;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; dispid 55;
    function IGetArrowHeadAtIndex(index: Integer): Double; dispid 56;
    function GetTriangleCount: Integer; dispid 57;
    function GetTriangleAtIndex(index: Integer): OleVariant; dispid 58;
    function IGetTriangleAtIndex(index: Integer): Double; dispid 59;
    function IGetFrameValues(frameNumber: Smallint): WideString; dispid 60;
    function IGetFrameSymbols(frameNumber: Smallint): Smallint; dispid 61;
    function IGetSymText(symIdx: Smallint): WideString; dispid 62;
    procedure SetFrameSymbols2(frameNumber: Smallint; const GCS: WideString; tolDia1: WordBool; 
                               const tolMC1: WideString; tolDia2: WordBool; 
                               const tolMC2: WideString; const datumMC1: WideString; 
                               const datumMC2: WideString; const datumMC3: WideString); dispid 63;
    function GetTextFont: WideString; dispid 64;
    function GetLeaderCount: Integer; dispid 65;
    function GetLeaderAtIndex(index: Integer): OleVariant; dispid 66;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; dispid 67;
    procedure SetPosition(x: Double; y: Double; z: Double); dispid 68;
    function GetUseDocTextFormat: WordBool; dispid 69;
    function GetTextFormat: IDispatch; dispid 70;
    function IGetTextFormat: ITextFormat; dispid 71;
    function SetTextFormat(textFormatType: Integer; const textFormat: IDispatch): WordBool; dispid 72;
    function ISetTextFormat(textFormatType: Integer; const textFormat: ITextFormat): WordBool; dispid 73;
    function GetCompositeFrame: WordBool; dispid 74;
    procedure SetCompositeFrame(composite: WordBool); dispid 75;
    function GetBetweenTwoPoints: WordBool; dispid 76;
    function GetBetweenTwoPointsText(index: Integer): WideString; dispid 77;
    procedure SetBetweenTwoPoints(between: WordBool; const textFrom: WideString; 
                                  const textTo: WideString); dispid 78;
    function GetAllAround: WordBool; dispid 79;
    function GetLeaderSide: Integer; dispid 80;
    procedure SetLeader(leader: WordBool; leaderSide: Integer; bentLeader: WordBool; 
                        allAround: WordBool); dispid 81;
    function GetAnnotation: IDispatch; dispid 82;
    function IGetAnnotation: IAnnotation; dispid 83;
    function GetFrameSymbols2(frameNumber: Smallint): OleVariant; dispid 84;
    function IGetFrameSymbols2(frameNumber: Smallint): WideString; dispid 85;
    function GetFrameDiameterSymbols(frameNumber: Smallint): OleVariant; dispid 86;
    function IGetFrameDiameterSymbols(frameNumber: Smallint): WordBool; dispid 87;
  end;

// *********************************************************************//
// Interface: INote
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D55-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  INote = interface(IDispatch)
    ['{83A33D55-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: INote; safecall;
    function GetText: WideString; safecall;
    function GetHeight: Double; safecall;
    function GetAttachPos: OleVariant; safecall;
    function GetFontInfo: OleVariant; safecall;
    function GetLeaderInfo: OleVariant; safecall;
    function IsAttached: WordBool; safecall;
    function HasExtraLeader: WordBool; safecall;
    function HasBalloon: WordBool; safecall;
    function GetBalloonInfo: OleVariant; safecall;
    function GetTextPoint: OleVariant; safecall;
    function GetArrowHeadInfo: OleVariant; safecall;
    function IGetAttachPos: Double; safecall;
    function IGetFontInfo: Double; safecall;
    function IGetLeaderInfo(out pointCount: Integer): Double; safecall;
    function IGetBalloonInfo: Double; safecall;
    function IGetTextPoint: Double; safecall;
    function IGetArrowHeadInfo: Double; safecall;
    function GetUpperRight: OleVariant; safecall;
    function IGetUpperRight: Double; safecall;
    function GetExtent: OleVariant; safecall;
    function IGetExtent: Double; safecall;
    function IsCompoundNote: WordBool; safecall;
    function AddText(const txt: WideString; x: Double; y: Double; z: Double): WordBool; safecall;
    function GetTextCount: Integer; safecall;
    function GetTextAtIndex(index: Integer): WideString; safecall;
    function GetHeightAtIndex(index: Integer): Double; safecall;
    function GetTextOffsetAtIndex(index: Integer): OleVariant; safecall;
    function IGetTextOffsetAtIndex(index: Integer): Double; safecall;
    procedure BeginSketchEdit; safecall;
    procedure EndSketchEdit; safecall;
    function GetExtentAtIndex(index: Integer): OleVariant; safecall;
    function IGetExtentAtIndex(index: Integer): Double; safecall;
    procedure SetTextOffsetAtIndex(index: Integer; x: Double; y: Double; z: Double); safecall;
    function GetSketch: IDispatch; safecall;
    function IGetSketch: ISketch; safecall;
    function SetTextAtIndex(index: Integer; const txt: WideString): WordBool; safecall;
    function SetText(const txt: WideString): WordBool; safecall;
    function SetZeroLengthLeader(flag: WordBool): WordBool; safecall;
    procedure SetHeight(heightIn: Double); safecall;
    function GetHeightInPoints: Integer; safecall;
    procedure SetHeightInPoints(heightIn: Integer); safecall;
    function GetName: WideString; safecall;
    function SetName(const nameIn: WideString): WordBool; safecall;
    function GetTextHeightAtIndex(index: Integer): Double; safecall;
    function GetTextPositionAtIndex(index: Integer): OleVariant; safecall;
    function IGetTextPositionAtIndex(index: Integer): Double; safecall;
    function GetTextAngleAtIndex(index: Integer): Double; safecall;
    function GetTextRefPositionAtIndex(index: Integer): Integer; safecall;
    function GetTextInvertAtIndex(index: Integer): Integer; safecall;
    function GetLineCount: Integer; safecall;
    function GetLineAtIndex(index: Integer): OleVariant; safecall;
    function IGetLineAtIndex(index: Integer): Double; safecall;
    function GetArcCount: Integer; safecall;
    function GetArcAtIndex(index: Integer): OleVariant; safecall;
    function IGetArcAtIndex(index: Integer): Double; safecall;
    function GetArrowHeadCount: Integer; safecall;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; safecall;
    function IGetArrowHeadAtIndex(index: Integer): Double; safecall;
    function GetTriangleCount: Integer; safecall;
    function GetTriangleAtIndex(index: Integer): OleVariant; safecall;
    function IGetTriangleAtIndex(index: Integer): Double; safecall;
    function GetTextFontAtIndex(index: Integer): WideString; safecall;
    procedure SetTextPoint(x: Double; y: Double; z: Double); safecall;
    function GetTextLineSpacingAtIndex(index: Integer): Double; safecall;
    function GetLeaderCount: Integer; safecall;
    function GetLeaderAtIndex(index: Integer): OleVariant; safecall;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; safecall;
    function GetTextFormat: IDispatch; safecall;
    function IGetTextFormat: ITextFormat; safecall;
    function SetTextFormat(textFormatType: Integer; const textFormat: IDispatch): WordBool; safecall;
    function ISetTextFormat(textFormatType: Integer; const textFormat: ITextFormat): WordBool; safecall;
    function GetTextFormatAtIndex(index: Integer): IDispatch; safecall;
    function IGetTextFormatAtIndex(index: Integer): ITextFormat; safecall;
    procedure SetTextFormatAtIndex(index: Integer; const textFormat: IDispatch); safecall;
    procedure ISetTextFormatAtIndex(index: Integer; const textFormat: ITextFormat); safecall;
    function GetTextJustification: Integer; safecall;
    procedure SetTextJustification(justification: Integer); safecall;
    function GetTextJustificationAtIndex(index: Integer): Integer; safecall;
    procedure SetTextJustificationAtIndex(index: Integer; justification: Integer); safecall;
    function GetUseDocTextFormat: WordBool; safecall;
    function GetHyperlinkText: WideString; safecall;
    function SetHyperlinkText(const text: WideString): WordBool; safecall;
    function GetAnnotation: IDispatch; safecall;
    function IGetAnnotation: IAnnotation; safecall;
    function Get_angle: Double; safecall;
    procedure Set_angle(retval: Double); safecall;
    function GetBalloonStyle: Integer; safecall;
    function GetBalloonSize: Integer; safecall;
    function SetBalloon(Style: Integer; size: Integer): WordBool; safecall;
    function IGetTextTokenCount: Integer; safecall;
    function GetTextTokens(out positions: OleVariant; out widths: OleVariant; 
                           out heights: OleVariant): OleVariant; safecall;
    function IGetTextTokens(out positions: Double; out widths: Double; out heights: Double): WideString; safecall;
    function IsBomBalloon: WordBool; safecall;
    function GetBomBalloonTextStyle(whichOne: WordBool): Integer; safecall;
    function GetBomBalloonText(whichOne: WordBool): WideString; safecall;
    function SetBomBalloonText(upperTextStyle: Integer; const upperText: WideString; 
                               lowerTextStyle: Integer; const lowerText: WideString): WordBool; safecall;
    property angle: Double read Get_angle write Set_angle;
  end;

// *********************************************************************//
// DispIntf:  INoteDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D55-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  INoteDisp = dispinterface
    ['{83A33D55-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: INote; dispid 13;
    function GetText: WideString; dispid 2;
    function GetHeight: Double; dispid 3;
    function GetAttachPos: OleVariant; dispid 4;
    function GetFontInfo: OleVariant; dispid 5;
    function GetLeaderInfo: OleVariant; dispid 6;
    function IsAttached: WordBool; dispid 7;
    function HasExtraLeader: WordBool; dispid 8;
    function HasBalloon: WordBool; dispid 9;
    function GetBalloonInfo: OleVariant; dispid 10;
    function GetTextPoint: OleVariant; dispid 11;
    function GetArrowHeadInfo: OleVariant; dispid 12;
    function IGetAttachPos: Double; dispid 14;
    function IGetFontInfo: Double; dispid 15;
    function IGetLeaderInfo(out pointCount: Integer): Double; dispid 16;
    function IGetBalloonInfo: Double; dispid 17;
    function IGetTextPoint: Double; dispid 18;
    function IGetArrowHeadInfo: Double; dispid 19;
    function GetUpperRight: OleVariant; dispid 20;
    function IGetUpperRight: Double; dispid 21;
    function GetExtent: OleVariant; dispid 22;
    function IGetExtent: Double; dispid 23;
    function IsCompoundNote: WordBool; dispid 24;
    function AddText(const txt: WideString; x: Double; y: Double; z: Double): WordBool; dispid 25;
    function GetTextCount: Integer; dispid 26;
    function GetTextAtIndex(index: Integer): WideString; dispid 27;
    function GetHeightAtIndex(index: Integer): Double; dispid 28;
    function GetTextOffsetAtIndex(index: Integer): OleVariant; dispid 29;
    function IGetTextOffsetAtIndex(index: Integer): Double; dispid 30;
    procedure BeginSketchEdit; dispid 31;
    procedure EndSketchEdit; dispid 32;
    function GetExtentAtIndex(index: Integer): OleVariant; dispid 33;
    function IGetExtentAtIndex(index: Integer): Double; dispid 34;
    procedure SetTextOffsetAtIndex(index: Integer; x: Double; y: Double; z: Double); dispid 35;
    function GetSketch: IDispatch; dispid 36;
    function IGetSketch: ISketch; dispid 37;
    function SetTextAtIndex(index: Integer; const txt: WideString): WordBool; dispid 38;
    function SetText(const txt: WideString): WordBool; dispid 39;
    function SetZeroLengthLeader(flag: WordBool): WordBool; dispid 40;
    procedure SetHeight(heightIn: Double); dispid 41;
    function GetHeightInPoints: Integer; dispid 42;
    procedure SetHeightInPoints(heightIn: Integer); dispid 43;
    function GetName: WideString; dispid 44;
    function SetName(const nameIn: WideString): WordBool; dispid 45;
    function GetTextHeightAtIndex(index: Integer): Double; dispid 46;
    function GetTextPositionAtIndex(index: Integer): OleVariant; dispid 47;
    function IGetTextPositionAtIndex(index: Integer): Double; dispid 48;
    function GetTextAngleAtIndex(index: Integer): Double; dispid 49;
    function GetTextRefPositionAtIndex(index: Integer): Integer; dispid 50;
    function GetTextInvertAtIndex(index: Integer): Integer; dispid 51;
    function GetLineCount: Integer; dispid 52;
    function GetLineAtIndex(index: Integer): OleVariant; dispid 53;
    function IGetLineAtIndex(index: Integer): Double; dispid 54;
    function GetArcCount: Integer; dispid 55;
    function GetArcAtIndex(index: Integer): OleVariant; dispid 56;
    function IGetArcAtIndex(index: Integer): Double; dispid 57;
    function GetArrowHeadCount: Integer; dispid 58;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; dispid 59;
    function IGetArrowHeadAtIndex(index: Integer): Double; dispid 60;
    function GetTriangleCount: Integer; dispid 61;
    function GetTriangleAtIndex(index: Integer): OleVariant; dispid 62;
    function IGetTriangleAtIndex(index: Integer): Double; dispid 63;
    function GetTextFontAtIndex(index: Integer): WideString; dispid 64;
    procedure SetTextPoint(x: Double; y: Double; z: Double); dispid 65;
    function GetTextLineSpacingAtIndex(index: Integer): Double; dispid 66;
    function GetLeaderCount: Integer; dispid 67;
    function GetLeaderAtIndex(index: Integer): OleVariant; dispid 68;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; dispid 69;
    function GetTextFormat: IDispatch; dispid 70;
    function IGetTextFormat: ITextFormat; dispid 71;
    function SetTextFormat(textFormatType: Integer; const textFormat: IDispatch): WordBool; dispid 72;
    function ISetTextFormat(textFormatType: Integer; const textFormat: ITextFormat): WordBool; dispid 73;
    function GetTextFormatAtIndex(index: Integer): IDispatch; dispid 74;
    function IGetTextFormatAtIndex(index: Integer): ITextFormat; dispid 75;
    procedure SetTextFormatAtIndex(index: Integer; const textFormat: IDispatch); dispid 76;
    procedure ISetTextFormatAtIndex(index: Integer; const textFormat: ITextFormat); dispid 77;
    function GetTextJustification: Integer; dispid 78;
    procedure SetTextJustification(justification: Integer); dispid 79;
    function GetTextJustificationAtIndex(index: Integer): Integer; dispid 80;
    procedure SetTextJustificationAtIndex(index: Integer; justification: Integer); dispid 81;
    function GetUseDocTextFormat: WordBool; dispid 82;
    function GetHyperlinkText: WideString; dispid 83;
    function SetHyperlinkText(const text: WideString): WordBool; dispid 84;
    function GetAnnotation: IDispatch; dispid 85;
    function IGetAnnotation: IAnnotation; dispid 86;
    property angle: Double dispid 87;
    function GetBalloonStyle: Integer; dispid 88;
    function GetBalloonSize: Integer; dispid 89;
    function SetBalloon(Style: Integer; size: Integer): WordBool; dispid 90;
    function IGetTextTokenCount: Integer; dispid 91;
    function GetTextTokens(out positions: OleVariant; out widths: OleVariant; 
                           out heights: OleVariant): OleVariant; dispid 92;
    function IGetTextTokens(out positions: Double; out widths: Double; out heights: Double): WideString; dispid 93;
    function IsBomBalloon: WordBool; dispid 94;
    function GetBomBalloonTextStyle(whichOne: WordBool): Integer; dispid 95;
    function GetBomBalloonText(whichOne: WordBool): WideString; dispid 96;
    function SetBomBalloonText(upperTextStyle: Integer; const upperText: WideString; 
                               lowerTextStyle: Integer; const lowerText: WideString): WordBool; dispid 97;
  end;

// *********************************************************************//
// Interface: IPropertyManagerPage
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E981B4FA-7E86-11D4-AEF2-00C04F603FAF}
// *********************************************************************//
  IPropertyManagerPage = interface(IDispatch)
    ['{E981B4FA-7E86-11D4-AEF2-00C04F603FAF}']
    function SetButtons(ButtonTypes: Integer): Integer; safecall;
    function SetGroupRange(FirstGroupId: Integer; FirstCheckId: Integer; GroupCount: Integer): Integer; safecall;
    function Show: Integer; safecall;
    function GetDialogWindow(var status: Integer): Integer; safecall;
    function GetGroupVisible(GroupId: Integer; var status: Integer): WordBool; safecall;
    function SetGroupVisible(GroupId: Integer; Visible: WordBool): Integer; safecall;
    function GetGroupExpanded(GroupId: Integer; var status: Integer): WordBool; safecall;
    function SetGroupExpanded(GroupId: Integer; Expanded: WordBool): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IPropertyManagerPageDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E981B4FA-7E86-11D4-AEF2-00C04F603FAF}
// *********************************************************************//
  IPropertyManagerPageDisp = dispinterface
    ['{E981B4FA-7E86-11D4-AEF2-00C04F603FAF}']
    function SetButtons(ButtonTypes: Integer): Integer; dispid 1;
    function SetGroupRange(FirstGroupId: Integer; FirstCheckId: Integer; GroupCount: Integer): Integer; dispid 2;
    function Show: Integer; dispid 3;
    function GetDialogWindow(var status: Integer): Integer; dispid 4;
    function GetGroupVisible(GroupId: Integer; var status: Integer): WordBool; dispid 5;
    function SetGroupVisible(GroupId: Integer; Visible: WordBool): Integer; dispid 6;
    function GetGroupExpanded(GroupId: Integer; var status: Integer): WordBool; dispid 7;
    function SetGroupExpanded(GroupId: Integer; Expanded: WordBool): Integer; dispid 8;
  end;

// *********************************************************************//
// Interface: IUserUnit
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {82071121-8B32-4F51-8983-9304756503E7}
// *********************************************************************//
  IUserUnit = interface(IDispatch)
    ['{82071121-8B32-4F51-8983-9304756503E7}']
    function Get_FractionBase: Integer; safecall;
    procedure Set_FractionBase(Value: Integer); safecall;
    function Get_FractionValue: Integer; safecall;
    procedure Set_FractionValue(Value: Integer); safecall;
    function Get_roundToFraction: WordBool; safecall;
    procedure Set_roundToFraction(Value: WordBool); safecall;
    function Get_SignificantDigits: Integer; safecall;
    procedure Set_SignificantDigits(numDigits: Integer); safecall;
    function Get_DisplayLeadingZero: WordBool; safecall;
    procedure Set_DisplayLeadingZero(Value: WordBool); safecall;
    function Get_PadZero: WordBool; safecall;
    procedure Set_PadZero(Value: WordBool); safecall;
    function Get_SeparatorCharacter: WideString; safecall;
    procedure Set_SeparatorCharacter(const Value: WideString); safecall;
    function GetConversionFactor: Double; safecall;
    function IsMetric: WordBool; safecall;
    function GetFullUnitName(plural: WordBool): WideString; safecall;
    function ConvertToUserUnit(valueIn: Double; showUsernames: WordBool; nameInEnglish: WordBool): WideString; safecall;
    function ConvertToSystemValue(const unitText: WideString; var computedValue: Double): WordBool; safecall;
    function ConvertDoubleToSystemValue(userValue: Double): Double; safecall;
    function GetUnitsString(inEnglish: WordBool): WideString; safecall;
    function Get_UnitType: Integer; safecall;
    function Get_SpecificUnitType: Integer; safecall;
    procedure Set_SpecificUnitType(SpecificUnitType: Integer); safecall;
    function GetUserAngleTolerance: Double; safecall;
    property FractionBase: Integer read Get_FractionBase write Set_FractionBase;
    property FractionValue: Integer read Get_FractionValue write Set_FractionValue;
    property roundToFraction: WordBool read Get_roundToFraction write Set_roundToFraction;
    property SignificantDigits: Integer read Get_SignificantDigits write Set_SignificantDigits;
    property DisplayLeadingZero: WordBool read Get_DisplayLeadingZero write Set_DisplayLeadingZero;
    property PadZero: WordBool read Get_PadZero write Set_PadZero;
    property SeparatorCharacter: WideString read Get_SeparatorCharacter write Set_SeparatorCharacter;
    property UnitType: Integer read Get_UnitType;
    property SpecificUnitType: Integer read Get_SpecificUnitType write Set_SpecificUnitType;
  end;

// *********************************************************************//
// DispIntf:  IUserUnitDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {82071121-8B32-4F51-8983-9304756503E7}
// *********************************************************************//
  IUserUnitDisp = dispinterface
    ['{82071121-8B32-4F51-8983-9304756503E7}']
    property FractionBase: Integer dispid 1;
    property FractionValue: Integer dispid 2;
    property roundToFraction: WordBool dispid 3;
    property SignificantDigits: Integer dispid 4;
    property DisplayLeadingZero: WordBool dispid 5;
    property PadZero: WordBool dispid 6;
    property SeparatorCharacter: WideString dispid 7;
    function GetConversionFactor: Double; dispid 8;
    function IsMetric: WordBool; dispid 9;
    function GetFullUnitName(plural: WordBool): WideString; dispid 10;
    function ConvertToUserUnit(valueIn: Double; showUsernames: WordBool; nameInEnglish: WordBool): WideString; dispid 11;
    function ConvertToSystemValue(const unitText: WideString; var computedValue: Double): WordBool; dispid 12;
    function ConvertDoubleToSystemValue(userValue: Double): Double; dispid 13;
    function GetUnitsString(inEnglish: WordBool): WideString; dispid 14;
    property UnitType: Integer readonly dispid 15;
    property SpecificUnitType: Integer dispid 16;
    function GetUserAngleTolerance: Double; dispid 17;
  end;

// *********************************************************************//
// Interface: IFrame
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D48-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IFrame = interface(IDispatch)
    ['{83A33D48-27C5-11CE-BFD4-00400513BB57}']
    function AddMenuItem(const Menu: WideString; const Item: WideString; position: Integer; 
                         const CallbackFcnAndModule: WideString): WordBool; safecall;
    function AddMenu(const Menu: WideString; position: Integer): WordBool; safecall;
    procedure Dummy003; safecall;
    procedure Dummy004; safecall;
    function GetMenuState(const MenuItemString: WideString): Integer; safecall;
    procedure RenameMenu(const MenuItemString: WideString; const newName: WideString); safecall;
    procedure RemoveMenu(const MenuItemString: WideString); safecall;
    function AddMenuPopupItem(DocType: Integer; SelectType: Integer; const Item: WideString; 
                              const CallbackFcnAndModule: WideString; 
                              const CustomNames: WideString; Unused: Integer): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IFrameDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D48-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IFrameDisp = dispinterface
    ['{83A33D48-27C5-11CE-BFD4-00400513BB57}']
    function AddMenuItem(const Menu: WideString; const Item: WideString; position: Integer; 
                         const CallbackFcnAndModule: WideString): WordBool; dispid 1;
    function AddMenu(const Menu: WideString; position: Integer): WordBool; dispid 2;
    procedure Dummy003; dispid 3;
    procedure Dummy004; dispid 4;
    function GetMenuState(const MenuItemString: WideString): Integer; dispid 5;
    procedure RenameMenu(const MenuItemString: WideString; const newName: WideString); dispid 6;
    procedure RemoveMenu(const MenuItemString: WideString); dispid 7;
    function AddMenuPopupItem(DocType: Integer; SelectType: Integer; const Item: WideString; 
                              const CallbackFcnAndModule: WideString; 
                              const CustomNames: WideString; Unused: Integer): WordBool; dispid 8;
  end;

// *********************************************************************//
// Interface: IAssemblyDoc
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D35-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IAssemblyDoc = interface(IDispatch)
    ['{83A33D35-27C5-11CE-BFD4-00400513BB57}']
    function AddComponent(const compName: WideString; x: Double; y: Double; z: Double): WordBool; safecall;
    procedure Dummy2; safecall;
    procedure FeatureExtrusion; safecall;
    procedure EditRebuild; safecall;
    procedure Dummy3; safecall;
    procedure Dummy4; safecall;
    procedure ToolsCheckInterference; safecall;
    procedure Dummy5; safecall;
    procedure Dummy6; safecall;
    function GetFirstMember: IDispatch; safecall;
    function GetSelectedMember: IDispatch; safecall;
    function IGetFirstMember: IMember; safecall;
    function IGetSelectedMember: IMember; safecall;
    procedure Dummy7; safecall;
    procedure ViewCollapseAssembly; safecall;
    procedure ViewExplodeAssembly; safecall;
    procedure TranslateComponent; safecall;
    procedure InsertNewPart; safecall;
    procedure Dummy1; safecall;
    procedure RotateComponent; safecall;
    procedure FileDeriveComponentPart; safecall;
    procedure InsertCavity; safecall;
    procedure HideComponent; safecall;
    procedure ShowComponent; safecall;
    procedure FixComponent; safecall;
    procedure UnfixComponent; safecall;
    procedure EditAssembly; safecall;
    procedure EditPart; safecall;
    procedure OpenCompFile; safecall;
    procedure UpdateFeatureScope; safecall;
    procedure AddMate(mateType: Integer; align: Integer; flip: WordBool; dist: Double; angle: Double); safecall;
    procedure CompConfigProperties(m_suppressed: WordBool; m_show_component: WordBool; 
                                   m_fdetail: WordBool); safecall;
    function AddToFeatureScope(const compName: WideString): WordBool; safecall;
    function RemoveFromFeatureScope(const compName: WideString): WordBool; safecall;
    procedure EditExplodeParameters; safecall;
    procedure RotateComponentAxis; safecall;
    procedure ViewFeatureManagerByFeatures; safecall;
    procedure ComponentReload; safecall;
    procedure ViewFeatureManagerByDependencies; safecall;
    procedure AssemblyPartToggle; safecall;
    function FeatureByName(const Name: WideString): IDispatch; safecall;
    function IFeatureByName(const Name: WideString): IFeature; safecall;
    procedure InsertJoin; safecall;
    procedure UpdateBox; safecall;
    procedure InsertWeld(const type_: WideString; const shape: WideString; topDelta: Double; 
                         bottomDelta: Double; radius: Double; const part: WideString); safecall;
    procedure ForceRebuild; safecall;
    function GetEditTarget: IDispatch; safecall;
    function IGetEditTarget: IModelDoc; safecall;
    procedure InsertCavity2(scaleFactor: Double; scaleType: Integer); safecall;
    function AutoExplode: WordBool; safecall;
    function ShowExploded(showIt: WordBool): WordBool; safecall;
    function AddComponent2(const compName: WideString; x: Double; y: Double; z: Double): IDispatch; safecall;
    function IAddComponent2(const compName: WideString; x: Double; y: Double; z: Double): IComponent; safecall;
    procedure EditMate(mateType: Integer; align: Integer; flip: WordBool; dist: Double; 
                       angle: Double); safecall;
    function InsertDerivedPattern: WordBool; safecall;
    function ResolveAllLightWeightComponents(warnUser: WordBool): Integer; safecall;
    function GetLightWeightComponentCount: Integer; safecall;
    procedure InsertCavity3(scaleFactor: Double; scaleType: Integer; keepPieceIndex: Integer); safecall;
    function ComponentReload2(const component: IDispatch; ReadOnly: WordBool; options: Integer): Integer; safecall;
    function IComponentReload2(const component: IComponent; ReadOnly: WordBool; options: Integer): Integer; safecall;
    function CompConfigProperties2(suppression: Integer; visibility: WordBool; 
                                   featureDetails: WordBool): WordBool; safecall;
    function AddPipePenetration: Integer; safecall;
    function AddPipingFitting(const pathname: WideString; const configName: WideString; 
                              alignmentIndex: Smallint): WordBool; safecall;
    function IsComponentTreeValid: WordBool; safecall;
    procedure ForceRebuild2(topOnly: WordBool); safecall;
    function SetDroppedFileConfigName(const configName: WideString): WordBool; safecall;
    function AddComponents(names: OleVariant; transforms: OleVariant): OleVariant; safecall;
    function IAddComponents(var count: Integer; var names: WideString; var transforms: Double): IComponent; safecall;
    function EditPart2(silent: WordBool; allowReadOnly: WordBool; var information: Integer): Integer; safecall;
    procedure InsertCavity4(scaleFactor_x: Double; scaleFactor_y: Double; scaleFactor_z: Double; 
                            isUniform: WordBool; scaleType: Integer; keepPieceIndex: Integer); safecall;
    procedure ToolsCheckInterference2(numComponents: Integer; lpComponents: OleVariant; 
                                      coincidentInterference: WordBool; out pComp: OleVariant; 
                                      out pFace: OleVariant); safecall;
    procedure IToolsCheckInterference2(numComponents: Integer; var lpComponents: IComponent; 
                                       coincidentInterference: WordBool; out pComp: OleVariant; 
                                       out pFace: OleVariant); safecall;
    function GetDroppedAtEntity: IDispatch; safecall;
    function CompConfigProperties3(suppression: Integer; Solving: Integer; visibility: WordBool; 
                                   featureDetails: WordBool): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAssemblyDocDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D35-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IAssemblyDocDisp = dispinterface
    ['{83A33D35-27C5-11CE-BFD4-00400513BB57}']
    function AddComponent(const compName: WideString; x: Double; y: Double; z: Double): WordBool; dispid 1;
    procedure Dummy2; dispid 2;
    procedure FeatureExtrusion; dispid 3;
    procedure EditRebuild; dispid 4;
    procedure Dummy3; dispid 5;
    procedure Dummy4; dispid 6;
    procedure ToolsCheckInterference; dispid 7;
    procedure Dummy5; dispid 8;
    procedure Dummy6; dispid 9;
    function GetFirstMember: IDispatch; dispid 10;
    function GetSelectedMember: IDispatch; dispid 11;
    function IGetFirstMember: IMember; dispid 12;
    function IGetSelectedMember: IMember; dispid 13;
    procedure Dummy7; dispid 14;
    procedure ViewCollapseAssembly; dispid 15;
    procedure ViewExplodeAssembly; dispid 16;
    procedure TranslateComponent; dispid 17;
    procedure InsertNewPart; dispid 18;
    procedure Dummy1; dispid 19;
    procedure RotateComponent; dispid 20;
    procedure FileDeriveComponentPart; dispid 21;
    procedure InsertCavity; dispid 22;
    procedure HideComponent; dispid 23;
    procedure ShowComponent; dispid 24;
    procedure FixComponent; dispid 25;
    procedure UnfixComponent; dispid 26;
    procedure EditAssembly; dispid 27;
    procedure EditPart; dispid 28;
    procedure OpenCompFile; dispid 29;
    procedure UpdateFeatureScope; dispid 30;
    procedure AddMate(mateType: Integer; align: Integer; flip: WordBool; dist: Double; angle: Double); dispid 31;
    procedure CompConfigProperties(m_suppressed: WordBool; m_show_component: WordBool; 
                                   m_fdetail: WordBool); dispid 32;
    function AddToFeatureScope(const compName: WideString): WordBool; dispid 33;
    function RemoveFromFeatureScope(const compName: WideString): WordBool; dispid 34;
    procedure EditExplodeParameters; dispid 35;
    procedure RotateComponentAxis; dispid 36;
    procedure ViewFeatureManagerByFeatures; dispid 37;
    procedure ComponentReload; dispid 38;
    procedure ViewFeatureManagerByDependencies; dispid 39;
    procedure AssemblyPartToggle; dispid 40;
    function FeatureByName(const Name: WideString): IDispatch; dispid 41;
    function IFeatureByName(const Name: WideString): IFeature; dispid 42;
    procedure InsertJoin; dispid 43;
    procedure UpdateBox; dispid 44;
    procedure InsertWeld(const type_: WideString; const shape: WideString; topDelta: Double; 
                         bottomDelta: Double; radius: Double; const part: WideString); dispid 45;
    procedure ForceRebuild; dispid 46;
    function GetEditTarget: IDispatch; dispid 47;
    function IGetEditTarget: IModelDoc; dispid 48;
    procedure InsertCavity2(scaleFactor: Double; scaleType: Integer); dispid 49;
    function AutoExplode: WordBool; dispid 50;
    function ShowExploded(showIt: WordBool): WordBool; dispid 51;
    function AddComponent2(const compName: WideString; x: Double; y: Double; z: Double): IDispatch; dispid 52;
    function IAddComponent2(const compName: WideString; x: Double; y: Double; z: Double): IComponent; dispid 53;
    procedure EditMate(mateType: Integer; align: Integer; flip: WordBool; dist: Double; 
                       angle: Double); dispid 54;
    function InsertDerivedPattern: WordBool; dispid 55;
    function ResolveAllLightWeightComponents(warnUser: WordBool): Integer; dispid 56;
    function GetLightWeightComponentCount: Integer; dispid 57;
    procedure InsertCavity3(scaleFactor: Double; scaleType: Integer; keepPieceIndex: Integer); dispid 58;
    function ComponentReload2(const component: IDispatch; ReadOnly: WordBool; options: Integer): Integer; dispid 59;
    function IComponentReload2(const component: IComponent; ReadOnly: WordBool; options: Integer): Integer; dispid 60;
    function CompConfigProperties2(suppression: Integer; visibility: WordBool; 
                                   featureDetails: WordBool): WordBool; dispid 61;
    function AddPipePenetration: Integer; dispid 62;
    function AddPipingFitting(const pathname: WideString; const configName: WideString; 
                              alignmentIndex: Smallint): WordBool; dispid 63;
    function IsComponentTreeValid: WordBool; dispid 64;
    procedure ForceRebuild2(topOnly: WordBool); dispid 65;
    function SetDroppedFileConfigName(const configName: WideString): WordBool; dispid 66;
    function AddComponents(names: OleVariant; transforms: OleVariant): OleVariant; dispid 67;
    function IAddComponents(var count: Integer; var names: WideString; var transforms: Double): IComponent; dispid 68;
    function EditPart2(silent: WordBool; allowReadOnly: WordBool; var information: Integer): Integer; dispid 69;
    procedure InsertCavity4(scaleFactor_x: Double; scaleFactor_y: Double; scaleFactor_z: Double; 
                            isUniform: WordBool; scaleType: Integer; keepPieceIndex: Integer); dispid 70;
    procedure ToolsCheckInterference2(numComponents: Integer; lpComponents: OleVariant; 
                                      coincidentInterference: WordBool; out pComp: OleVariant; 
                                      out pFace: OleVariant); dispid 71;
    procedure IToolsCheckInterference2(numComponents: Integer; var lpComponents: IComponent; 
                                       coincidentInterference: WordBool; out pComp: OleVariant; 
                                       out pFace: OleVariant); dispid 72;
    function GetDroppedAtEntity: IDispatch; dispid 73;
    function CompConfigProperties3(suppression: Integer; Solving: Integer; visibility: WordBool; 
                                   featureDetails: WordBool): WordBool; dispid 74;
  end;

// *********************************************************************//
// Interface: IMember
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D4E-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IMember = interface(IDispatch)
    ['{83A33D4E-27C5-11CE-BFD4-00400513BB57}']
    function Get_Dummy001: WideString; safecall;
    procedure Set_Dummy001(const retval: WideString); safecall;
    procedure Dummy002; safecall;
    procedure Dummy007; safecall;
    procedure Dummy003; safecall;
    procedure Dummy004; safecall;
    procedure Dummy008; safecall;
    procedure Dummy005; safecall;
    procedure Dummy006; safecall;
    procedure Dummy009; safecall;
    procedure Dummy010; safecall;
    procedure Dummy011; safecall;
    property Dummy001: WideString read Get_Dummy001 write Set_Dummy001;
  end;

// *********************************************************************//
// DispIntf:  IMemberDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D4E-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IMemberDisp = dispinterface
    ['{83A33D4E-27C5-11CE-BFD4-00400513BB57}']
    property Dummy001: WideString dispid 1;
    procedure Dummy002; dispid 2;
    procedure Dummy007; dispid 7;
    procedure Dummy003; dispid 3;
    procedure Dummy004; dispid 4;
    procedure Dummy008; dispid 8;
    procedure Dummy005; dispid 5;
    procedure Dummy006; dispid 6;
    procedure Dummy009; dispid 9;
    procedure Dummy010; dispid 10;
    procedure Dummy011; dispid 11;
  end;

// *********************************************************************//
// Interface: IDrawingDoc
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D33-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDrawingDoc = interface(IDispatch)
    ['{83A33D33-27C5-11CE-BFD4-00400513BB57}']
    procedure NewNote(const text: WideString; height: Double); safecall;
    procedure NewSheet(const Name: WideString; paperSize: Smallint; templateIn: Smallint; 
                       scale1: Double; Scale2: Double); safecall;
    procedure SetupSheet(const Name: WideString; paperSize: Smallint; templateIn: Smallint; 
                         scale1: Double; Scale2: Double); safecall;
    function NewGtol: IDispatch; safecall;
    function INewGtol: IGtol; safecall;
    function EditSelectedGtol: IDispatch; safecall;
    function IEditSelectedGtol: IGtol; safecall;
    function CreateLinearDim(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                             p4: OleVariant; angle: Double; arrowSize: Double; 
                             const text: WideString; textHeight: Double; witnessGap: Double; 
                             witnessOvershoot: Double): WordBool; safecall;
    function CreateAngDim(vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; vP3: OleVariant; 
                          vP4: OleVariant; vP5: OleVariant; vP6: OleVariant; arrowSize: Double; 
                          const text: WideString; textHeight: Double; witnessGap: Double; 
                          witnessOvershoot: Double): WordBool; safecall;
    function CreateDiamDim(dimVal: Double; vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; 
                           vP3: OleVariant; arrowSize: Double; const text: WideString; 
                           textHeight: Double; witnessGap: Double; witnessOvershoot: Double): WordBool; safecall;
    function CreateViewport(LowerLeftX: Double; LowerLeftY: Double; UpperRightX: Double; 
                            UpperRightY: Double; sketchSize: Smallint): WideString; safecall;
    function ActivateView(const viewname: WideString): WordBool; safecall;
    function Create1stAngleViews(const ModelName: WideString): WordBool; safecall;
    function Create3rdAngleViews(const ModelName: WideString): WordBool; safecall;
    function CreateDrawViewFromModelView(const ModelName: WideString; const viewname: WideString; 
                                         locX: Double; locY: Double; locZ: Double): WordBool; safecall;
    function CreateUnfoldedViewAt(x: Double; y: Double; z: Double): WordBool; safecall;
    function CreateText(const textString: WideString; textX: Double; textY: Double; textZ: Double; 
                        textHeight: Double; textAngle: Double): WordBool; safecall;
    procedure EditRebuild; safecall;
    procedure ViewFullPage; safecall;
    procedure Dummy018; safecall;
    procedure CreateSectionView; safecall;
    procedure SheetNext; safecall;
    procedure Dimensions; safecall;
    procedure InsertGroup; safecall;
    procedure SheetPrevious; safecall;
    procedure AlignVert; safecall;
    procedure AlignHorz; safecall;
    procedure InsertRefDim; safecall;
    procedure MakeSectionLine; safecall;
    procedure InsertBaseDim; safecall;
    procedure EditSketch; safecall;
    procedure CreateDetailView; safecall;
    procedure CreateAuxiliaryView; safecall;
    procedure StartDrawing; safecall;
    procedure EndDrawing; safecall;
    function GetFirstView: IDispatch; safecall;
    function IGetFirstView: IView; safecall;
    function GetInsertionPoint: OleVariant; safecall;
    procedure AttachDimensions; safecall;
    procedure InsertModelDimensions(option: Integer); safecall;
    procedure EditTemplate; safecall;
    procedure InsertOrdinate; safecall;
    procedure UnsuppressView; safecall;
    procedure HideShowDrawingViews; safecall;
    procedure SuppressView; safecall;
    procedure AlignOrdinate; safecall;
    procedure SketchDim; safecall;
    procedure CenterMark; safecall;
    procedure EditSheet; safecall;
    procedure InsertHorizontalOrdinate; safecall;
    procedure EditOrdinate; safecall;
    procedure InsertVerticalOrdinate; safecall;
    procedure ChangeOrdDir; safecall;
    function GetLineFontCount: Integer; safecall;
    function GetLineFontName(index: Integer): WideString; safecall;
    function GetLineFontInfo(index: Integer): OleVariant; safecall;
    procedure ICreateLinearDim(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                               var p4: Double; angle: Double; arrowSize: Double; 
                               const text: WideString; textHeight: Double; witnessGap: Double; 
                               witnessOvershoot: Double); safecall;
    procedure ICreateAngDim(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                            var p4: Double; var P5: Double; var P6: Double; arrowSize: Double; 
                            const text: WideString; textHeight: Double; witnessGap: Double; 
                            witnessOvershoot: Double); safecall;
    procedure ICreateDiamDim(DimValue: Double; var p0: Double; var P1: Double; var P2: Double; 
                             var P3: Double; arrowSize: Double; const text: WideString; 
                             textHeight: Double; witnessGap: Double; witnessOvershoot: Double); safecall;
    function IGetInsertionPoint: Double; safecall;
    function CreateCompoundNote(height: Double; x: Double; y: Double; z: Double): IDispatch; safecall;
    function ICreateCompoundNote(height: Double; x: Double; y: Double; z: Double): INote; safecall;
    function CreateOrdinateDim(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                               p4: OleVariant; angle: Double; arrowSize: Double; 
                               const text: WideString; textHeight: Double; witnessGap: Double; 
                               witnessOvershoot: Double): WordBool; safecall;
    procedure ICreateOrdinateDim(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                 var p4: Double; angle: Double; arrowSize: Double; 
                                 const text: WideString; textHeight: Double; witnessGap: Double; 
                                 witnessOvershoot: Double); safecall;
    procedure InsertNewNote(const text: WideString; noLeader: WordBool; balloonNote: WordBool; 
                            bentLeader: WordBool; arrowStyle: Smallint; leaderSide: Smallint); safecall;
    function AddCenterMark(cmSize: Double; cmShowLines: WordBool): WordBool; safecall;
    procedure InsertWeldSymbol(const dim1: WideString; const symbol: WideString; 
                               const dim2: WideString; symmetric: WordBool; fieldWeld: WordBool; 
                               showOtherSide: WordBool; dashOnTop: WordBool; peripheral: WordBool; 
                               hasProcess: WordBool; const processValue: WideString); safecall;
    function InsertSurfaceFinishSymbol(symType: Integer; leaderType: Integer; locX: Double; 
                                       locY: Double; locZ: Double; laySymbol: Integer; 
                                       arrowType: Integer; const machAllowance: WideString; 
                                       const otherVals: WideString; const prodMethod: WideString; 
                                       const sampleLen: WideString; const maxRoughness: WideString; 
                                       const minRoughness: WideString; 
                                       const roughnessSpacing: WideString): WordBool; safecall;
    function ModifySurfaceFinishSymbol(symType: Integer; leaderType: Integer; locX: Double; 
                                       locY: Double; locZ: Double; laySymbol: Integer; 
                                       arrowType: Integer; const machAllowance: WideString; 
                                       const otherVals: WideString; const prodMethod: WideString; 
                                       const sampleLen: WideString; const maxRoughness: WideString; 
                                       const minRoughness: WideString; 
                                       const roughnessSpacing: WideString): WordBool; safecall;
    function GetCurrentSheet: IDispatch; safecall;
    function IGetCurrentSheet: ISheet; safecall;
    procedure CreateConstructionGeometry; safecall;
    procedure ViewDisplayHidden; safecall;
    procedure InsertBreakHorizontal; safecall;
    procedure ViewDisplayWireframe; safecall;
    procedure BreakLineZigZagCut; safecall;
    procedure BreakView; safecall;
    procedure ViewDisplayHiddengreyed; safecall;
    procedure ViewTangentEdges; safecall;
    procedure BreakLineSplineCut; safecall;
    procedure InsertBreakVertical; safecall;
    procedure UnBreakView; safecall;
    procedure BreakLineStraightCut; safecall;
    procedure InsertDatumTag; safecall;
    procedure ToggleGrid; safecall;
    procedure FlipSectionLine; safecall;
    function FeatureByName(const Name: WideString): IDispatch; safecall;
    function IFeatureByName(const Name: WideString): IFeature; safecall;
    function NewSheet2(const Name: WideString; paperSize: Integer; templateIn: Integer; 
                       scale1: Double; Scale2: Double; firstAngle: WordBool; 
                       const templateName: WideString; Width: Double; height: Double): WordBool; safecall;
    function CreateLinearDim2(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                              p4: OleVariant; val: Double; primPrec: Integer; 
                              const text: WideString; TextPoint: OleVariant; angle: Double; 
                              textHeight: Double; const prefix: WideString; 
                              const suffix: WideString; const callout1: WideString; 
                              const callout2: WideString; tolType: Integer; 
                              const tolMin: WideString; const tolMax: WideString; tolPrec: Integer; 
                              arrowSize: Double; arrowStyle: Integer; arrowDir: Integer; 
                              witnessGap: Double; witnessOvershoot: Double; dualDisplay: WordBool; 
                              dualPrec: Integer): WordBool; safecall;
    procedure ICreateLinearDim2(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                var p4: Double; val: Double; primPrec: Integer; 
                                const text: WideString; var TextPoint: Double; angle: Double; 
                                textHeight: Double; const prefix: WideString; 
                                const suffix: WideString; const callout1: WideString; 
                                const callout2: WideString; tolType: Integer; 
                                const tolMin: WideString; const tolMax: WideString; 
                                tolPrec: Integer; arrowSize: Double; arrowStyle: Integer; 
                                arrowDir: Integer; witnessGap: Double; witnessOvershoot: Double; 
                                dualDisplay: WordBool; dualPrecision: Integer); safecall;
    function CreateAngDim2(vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; vP3: OleVariant; 
                           vP4: OleVariant; vP5: OleVariant; vP6: OleVariant; arrowSize: Double; 
                           const text: WideString; textHeight: Double; witnessGap: Double; 
                           witnessOvershoot: Double; vTextPoint: OleVariant): WordBool; safecall;
    procedure ICreateAngDim2(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                             var p4: Double; var P5: Double; var P6: Double; arrowSize: Double; 
                             const text: WideString; textHeight: Double; witnessGap: Double; 
                             witnessOvershoot: Double; var TextPoint: Double); safecall;
    function CreateDiamDim2(dimVal: Double; vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; 
                            vP3: OleVariant; arrowSize: Double; const text: WideString; 
                            textHeight: Double; witnessGap: Double; witnessOvershoot: Double; 
                            vTextPoint: OleVariant): WordBool; safecall;
    procedure ICreateDiamDim2(DimValue: Double; var p0: Double; var P1: Double; var P2: Double; 
                              var P3: Double; arrowSize: Double; const text: WideString; 
                              textHeight: Double; witnessGap: Double; witnessOvershoot: Double; 
                              var TextPoint: Double); safecall;
    function CreateOrdinateDim2(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                                p4: OleVariant; angle: Double; arrowSize: Double; 
                                const text: WideString; textHeight: Double; witnessGap: Double; 
                                witnessOvershoot: Double; P5: OleVariant): WordBool; safecall;
    procedure ICreateOrdinateDim2(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                  var p4: Double; angle: Double; arrowSize: Double; 
                                  const text: WideString; textHeight: Double; witnessGap: Double; 
                                  witnessOvershoot: Double; var P5: Double); safecall;
    procedure InsertNewNote2(const upperText: WideString; const lowerText: WideString; 
                             noLeader: WordBool; bentLeader: WordBool; arrowStyle: Smallint; 
                             leaderSide: Smallint; angle: Double; balloonStyle: Smallint; 
                             balloonFit: Smallint; upperNoteContent: Smallint; 
                             lowerNoteContent: Smallint); safecall;
    procedure DragModelDimension(const viewname: WideString; dropEffect: Smallint; x: Double; 
                                 y: Double; z: Double); safecall;
    function CreateViewport2(LowerLeftX: Double; LowerLeftY: Double; UpperRightX: Double; 
                             UpperRightY: Double; sketchSize: Smallint; Scale: Double): WideString; safecall;
    procedure SetupSheet2(const Name: WideString; paperSize: Smallint; templateIn: Smallint; 
                          scale1: Double; Scale2: Double; skPointsFlag: Integer); safecall;
    procedure OnComponentProperties; safecall;
    function GetLineFontCount2: Integer; safecall;
    function GetLineFontName2(index: Integer): WideString; safecall;
    function GetLineFontInfo2(index: Integer): OleVariant; safecall;
    procedure SetLineStyle(const styleName: WideString); safecall;
    procedure SetLineWidth(Width: Integer); safecall;
    procedure SetLineColor(Color: Integer); safecall;
    procedure ShowEdge; safecall;
    procedure HideEdge; safecall;
    procedure AddHoleCallout; safecall;
    function GetPenCount: Integer; safecall;
    function GetPenInfo: OleVariant; safecall;
    function IGetPenInfo: Integer; safecall;
    function GetLineFontId(index: Integer): Integer; safecall;
    function CreateAuxiliaryViewAt(x: Double; y: Double; z: Double; notAligned: WordBool): WordBool; safecall;
    function CreateDetailViewAt(x: Double; y: Double; z: Double): WordBool; safecall;
    function CreateSectionViewAt(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                 isOffsetSection: WordBool): WordBool; safecall;
    function CreateUnfoldedViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool): WordBool; safecall;
    function SetupSheet3(const Name: WideString; paperSize: Integer; templateIn: Integer; 
                         scale1: Double; Scale2: Double; firstAngle: WordBool; 
                         const templateName: WideString; Width: Double; height: Double): WordBool; safecall;
    function InsertModelAnnotations(option: Integer; allTypes: WordBool; types: Integer; 
                                    allViews: WordBool): WordBool; safecall;
    procedure InsertCustomSymbol(const symbolPath: WideString); safecall;
    function GetSheetCount: Integer; safecall;
    function GetSheetNames: OleVariant; safecall;
    function IGetSheetNames(var count: Integer): WideString; safecall;
    function ActivateSheet(const Name: WideString): WordBool; safecall;
    function CreateText2(const textString: WideString; textX: Double; textY: Double; textZ: Double; 
                         textHeight: Double; textAngle: Double): IDispatch; safecall;
    function ICreateText2(const textString: WideString; textX: Double; textY: Double; 
                          textZ: Double; textHeight: Double; textAngle: Double): INote; safecall;
    function NewSheet3(const Name: WideString; paperSize: Integer; templateIn: Integer; 
                       scale1: Double; Scale2: Double; firstAngle: WordBool; 
                       const templateName: WideString; Width: Double; height: Double; 
                       const propertyViewName: WideString): WordBool; safecall;
    function SetupSheet4(const Name: WideString; paperSize: Integer; templateIn: Integer; 
                         scale1: Double; Scale2: Double; firstAngle: WordBool; 
                         const templateName: WideString; Width: Double; height: Double; 
                         const propertyViewName: WideString): WordBool; safecall;
    function CreateLinearDim3(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                              p4: OleVariant; val: Double; primPrec: Integer; 
                              const text: WideString; TextPoint: OleVariant; angle: Double; 
                              textHeight: Double; const prefix: WideString; 
                              const suffix: WideString; const callout1: WideString; 
                              const callout2: WideString; tolType: Integer; 
                              const tolMin: WideString; const tolMax: WideString; tolPrec: Integer; 
                              arrowSize: Double; arrowStyle: Integer; arrowDir: Integer; 
                              witnessGap: Double; witnessOvershoot: Double; dualDisplay: WordBool; 
                              dualPrec: Integer): IDispatch; safecall;
    function ICreateLinearDim3(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                               var p4: Double; val: Double; primPrec: Integer; 
                               const text: WideString; var TextPoint: Double; angle: Double; 
                               textHeight: Double; const prefix: WideString; 
                               const suffix: WideString; const callout1: WideString; 
                               const callout2: WideString; tolType: Integer; 
                               const tolMin: WideString; const tolMax: WideString; 
                               tolPrec: Integer; arrowSize: Double; arrowStyle: Integer; 
                               arrowDir: Integer; witnessGap: Double; witnessOvershoot: Double; 
                               dualDisplay: WordBool; dualPrecision: Integer): IDisplayDimension; safecall;
    function CreateAngDim3(vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; vP3: OleVariant; 
                           vP4: OleVariant; vP5: OleVariant; vP6: OleVariant; arrowSize: Double; 
                           const text: WideString; textHeight: Double; witnessGap: Double; 
                           witnessOvershoot: Double; vTextPoint: OleVariant): IDispatch; safecall;
    function ICreateAngDim3(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                            var p4: Double; var P5: Double; var P6: Double; arrowSize: Double; 
                            const text: WideString; textHeight: Double; witnessGap: Double; 
                            witnessOvershoot: Double; var TextPoint: Double): IDisplayDimension; safecall;
    function CreateDiamDim3(dimVal: Double; vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; 
                            vP3: OleVariant; arrowSize: Double; const text: WideString; 
                            textHeight: Double; witnessGap: Double; witnessOvershoot: Double; 
                            vTextPoint: OleVariant): IDispatch; safecall;
    function ICreateDiamDim3(DimValue: Double; var p0: Double; var P1: Double; var P2: Double; 
                             var P3: Double; arrowSize: Double; const text: WideString; 
                             textHeight: Double; witnessGap: Double; witnessOvershoot: Double; 
                             var TextPoint: Double): IDisplayDimension; safecall;
    function CreateOrdinateDim3(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                                p4: OleVariant; angle: Double; arrowSize: Double; 
                                const text: WideString; textHeight: Double; witnessGap: Double; 
                                witnessOvershoot: Double; P5: OleVariant): IDispatch; safecall;
    function ICreateOrdinateDim3(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                 var p4: Double; angle: Double; arrowSize: Double; 
                                 const text: WideString; textHeight: Double; witnessGap: Double; 
                                 witnessOvershoot: Double; var P5: Double): IDisplayDimension; safecall;
    procedure ForceRebuild; safecall;
    function AddOrdinateDimension(DimType: Integer; locX: Double; locY: Double; locZ: Double): WordBool; safecall;
    function CreateLayer(const layerName: WideString; const layerDesc: WideString; 
                         layerColor: Integer; layerStyle: Integer; layerWidth: Integer; 
                         bOn: WordBool): WordBool; safecall;
    function SetCurrentLayer(const layerName: WideString): WordBool; safecall;
    function DrawingViewRotate(newAngle: Double): WordBool; safecall;
    function CreateDetailViewAt2(x: Double; y: Double; z: Double): WordBool; safecall;
    procedure RestoreRotation; safecall;
    function GetEditSheet: WordBool; safecall;
    procedure TranslateDrawing(deltaX: Double; deltaY: Double); safecall;
    function Create1stAngleViews2(const ModelName: WideString): WordBool; safecall;
    function Create3rdAngleViews2(const ModelName: WideString): WordBool; safecall;
    procedure HideShowDimensions; safecall;
    function CreateLinearDim4(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                              p4: OleVariant; TextPoint: OleVariant; val: Double; angle: Double; 
                              textHeight: Double): IDispatch; safecall;
    function ICreateLinearDim4(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                               var p4: Double; var TextPoint: Double; val: Double; angle: Double; 
                               textHeight: Double): IDisplayDimension; safecall;
    function CreateDiamDim4(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                            TextPoint: OleVariant; val: Double; textHeight: Double): IDispatch; safecall;
    function ICreateDiamDim4(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                             var TextPoint: Double; val: Double; textHeight: Double): IDisplayDimension; safecall;
    function CreateOrdinateDim4(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                                p4: OleVariant; P5: OleVariant; val: Double; angle: Double; 
                                textHeight: Double): IDispatch; safecall;
    function ICreateOrdinateDim4(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                 var p4: Double; var P5: Double; val: Double; angle: Double; 
                                 textHeight: Double): IDisplayDimension; safecall;
    function CreateAngDim4(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                           p4: OleVariant; P5: OleVariant; P6: OleVariant; TextPoint: OleVariant; 
                           textHeight: Double): IDispatch; safecall;
    function ICreateAngDim4(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                            var p4: Double; var P5: Double; var P6: Double; var TextPoint: Double; 
                            textHeight: Double): IDisplayDimension; safecall;
    function CreateDetailViewAt3(x: Double; y: Double; z: Double; Style: Integer; scale1: Double; 
                                 Scale2: Double; const labelIn: WideString; showtype: Integer; 
                                 fulloutline: WordBool): IDispatch; safecall;
    function ICreateDetailViewAt3(x: Double; y: Double; z: Double; Style: Integer; scale1: Double; 
                                  Scale2: Double; const labelIn: WideString; showtype: Integer; 
                                  fulloutline: WordBool): IView; safecall;
    function CreateSectionViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                  isOffsetSection: WordBool; const label_: WideString; 
                                  chgdirection: WordBool; scwithmodel: WordBool; partial: WordBool; 
                                  dispsurfcut: WordBool): IDispatch; safecall;
    function ICreateSectionViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                   isOffsetSection: WordBool; const label_: WideString; 
                                   chgdirection: WordBool; scwithmodel: WordBool; 
                                   partial: WordBool; dispsurfcut: WordBool): IView; safecall;
    function CreateAuxiliaryViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                    const label_: WideString; showarrow: WordBool; flip: WordBool): IDispatch; safecall;
    function ICreateAuxiliaryViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                     const label_: WideString; showarrow: WordBool; flip: WordBool): IView; safecall;
    procedure MakeCustomSymbol; safecall;
    procedure ExplodeCustomSymbol; safecall;
    procedure SaveCustomSymbol(const filenameIn: WideString); safecall;
    function CreateBreakOutSection(depth: Double): WordBool; safecall;
    procedure InsertThreadCallout; safecall;
    function CreateFlatPatternViewFromModelView(const ModelName: WideString; 
                                                const configName: WideString; locX: Double; 
                                                locY: Double; locZ: Double): WordBool; safecall;
    function ChangeRefConfigurationOfFlatPatternView(const ModelName: WideString; 
                                                     const configName: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDrawingDocDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D33-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDrawingDocDisp = dispinterface
    ['{83A33D33-27C5-11CE-BFD4-00400513BB57}']
    procedure NewNote(const text: WideString; height: Double); dispid 1;
    procedure NewSheet(const Name: WideString; paperSize: Smallint; templateIn: Smallint; 
                       scale1: Double; Scale2: Double); dispid 2;
    procedure SetupSheet(const Name: WideString; paperSize: Smallint; templateIn: Smallint; 
                         scale1: Double; Scale2: Double); dispid 3;
    function NewGtol: IDispatch; dispid 4;
    function INewGtol: IGtol; dispid 38;
    function EditSelectedGtol: IDispatch; dispid 5;
    function IEditSelectedGtol: IGtol; dispid 39;
    function CreateLinearDim(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                             p4: OleVariant; angle: Double; arrowSize: Double; 
                             const text: WideString; textHeight: Double; witnessGap: Double; 
                             witnessOvershoot: Double): WordBool; dispid 6;
    function CreateAngDim(vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; vP3: OleVariant; 
                          vP4: OleVariant; vP5: OleVariant; vP6: OleVariant; arrowSize: Double; 
                          const text: WideString; textHeight: Double; witnessGap: Double; 
                          witnessOvershoot: Double): WordBool; dispid 7;
    function CreateDiamDim(dimVal: Double; vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; 
                           vP3: OleVariant; arrowSize: Double; const text: WideString; 
                           textHeight: Double; witnessGap: Double; witnessOvershoot: Double): WordBool; dispid 8;
    function CreateViewport(LowerLeftX: Double; LowerLeftY: Double; UpperRightX: Double; 
                            UpperRightY: Double; sketchSize: Smallint): WideString; dispid 9;
    function ActivateView(const viewname: WideString): WordBool; dispid 10;
    function Create1stAngleViews(const ModelName: WideString): WordBool; dispid 11;
    function Create3rdAngleViews(const ModelName: WideString): WordBool; dispid 12;
    function CreateDrawViewFromModelView(const ModelName: WideString; const viewname: WideString; 
                                         locX: Double; locY: Double; locZ: Double): WordBool; dispid 13;
    function CreateUnfoldedViewAt(x: Double; y: Double; z: Double): WordBool; dispid 14;
    function CreateText(const textString: WideString; textX: Double; textY: Double; textZ: Double; 
                        textHeight: Double; textAngle: Double): WordBool; dispid 15;
    procedure EditRebuild; dispid 16;
    procedure ViewFullPage; dispid 17;
    procedure Dummy018; dispid 18;
    procedure CreateSectionView; dispid 19;
    procedure SheetNext; dispid 20;
    procedure Dimensions; dispid 21;
    procedure InsertGroup; dispid 22;
    procedure SheetPrevious; dispid 23;
    procedure AlignVert; dispid 24;
    procedure AlignHorz; dispid 25;
    procedure InsertRefDim; dispid 26;
    procedure MakeSectionLine; dispid 27;
    procedure InsertBaseDim; dispid 28;
    procedure EditSketch; dispid 29;
    procedure CreateDetailView; dispid 30;
    procedure CreateAuxiliaryView; dispid 31;
    procedure StartDrawing; dispid 32;
    procedure EndDrawing; dispid 33;
    function GetFirstView: IDispatch; dispid 34;
    function IGetFirstView: IView; dispid 40;
    function GetInsertionPoint: OleVariant; dispid 35;
    procedure AttachDimensions; dispid 36;
    procedure InsertModelDimensions(option: Integer); dispid 37;
    procedure EditTemplate; dispid 41;
    procedure InsertOrdinate; dispid 42;
    procedure UnsuppressView; dispid 43;
    procedure HideShowDrawingViews; dispid 44;
    procedure SuppressView; dispid 45;
    procedure AlignOrdinate; dispid 46;
    procedure SketchDim; dispid 47;
    procedure CenterMark; dispid 48;
    procedure EditSheet; dispid 49;
    procedure InsertHorizontalOrdinate; dispid 50;
    procedure EditOrdinate; dispid 51;
    procedure InsertVerticalOrdinate; dispid 52;
    procedure ChangeOrdDir; dispid 53;
    function GetLineFontCount: Integer; dispid 54;
    function GetLineFontName(index: Integer): WideString; dispid 55;
    function GetLineFontInfo(index: Integer): OleVariant; dispid 56;
    procedure ICreateLinearDim(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                               var p4: Double; angle: Double; arrowSize: Double; 
                               const text: WideString; textHeight: Double; witnessGap: Double; 
                               witnessOvershoot: Double); dispid 57;
    procedure ICreateAngDim(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                            var p4: Double; var P5: Double; var P6: Double; arrowSize: Double; 
                            const text: WideString; textHeight: Double; witnessGap: Double; 
                            witnessOvershoot: Double); dispid 58;
    procedure ICreateDiamDim(DimValue: Double; var p0: Double; var P1: Double; var P2: Double; 
                             var P3: Double; arrowSize: Double; const text: WideString; 
                             textHeight: Double; witnessGap: Double; witnessOvershoot: Double); dispid 59;
    function IGetInsertionPoint: Double; dispid 60;
    function CreateCompoundNote(height: Double; x: Double; y: Double; z: Double): IDispatch; dispid 61;
    function ICreateCompoundNote(height: Double; x: Double; y: Double; z: Double): INote; dispid 62;
    function CreateOrdinateDim(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                               p4: OleVariant; angle: Double; arrowSize: Double; 
                               const text: WideString; textHeight: Double; witnessGap: Double; 
                               witnessOvershoot: Double): WordBool; dispid 63;
    procedure ICreateOrdinateDim(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                 var p4: Double; angle: Double; arrowSize: Double; 
                                 const text: WideString; textHeight: Double; witnessGap: Double; 
                                 witnessOvershoot: Double); dispid 64;
    procedure InsertNewNote(const text: WideString; noLeader: WordBool; balloonNote: WordBool; 
                            bentLeader: WordBool; arrowStyle: Smallint; leaderSide: Smallint); dispid 65;
    function AddCenterMark(cmSize: Double; cmShowLines: WordBool): WordBool; dispid 66;
    procedure InsertWeldSymbol(const dim1: WideString; const symbol: WideString; 
                               const dim2: WideString; symmetric: WordBool; fieldWeld: WordBool; 
                               showOtherSide: WordBool; dashOnTop: WordBool; peripheral: WordBool; 
                               hasProcess: WordBool; const processValue: WideString); dispid 67;
    function InsertSurfaceFinishSymbol(symType: Integer; leaderType: Integer; locX: Double; 
                                       locY: Double; locZ: Double; laySymbol: Integer; 
                                       arrowType: Integer; const machAllowance: WideString; 
                                       const otherVals: WideString; const prodMethod: WideString; 
                                       const sampleLen: WideString; const maxRoughness: WideString; 
                                       const minRoughness: WideString; 
                                       const roughnessSpacing: WideString): WordBool; dispid 68;
    function ModifySurfaceFinishSymbol(symType: Integer; leaderType: Integer; locX: Double; 
                                       locY: Double; locZ: Double; laySymbol: Integer; 
                                       arrowType: Integer; const machAllowance: WideString; 
                                       const otherVals: WideString; const prodMethod: WideString; 
                                       const sampleLen: WideString; const maxRoughness: WideString; 
                                       const minRoughness: WideString; 
                                       const roughnessSpacing: WideString): WordBool; dispid 69;
    function GetCurrentSheet: IDispatch; dispid 70;
    function IGetCurrentSheet: ISheet; dispid 71;
    procedure CreateConstructionGeometry; dispid 72;
    procedure ViewDisplayHidden; dispid 73;
    procedure InsertBreakHorizontal; dispid 74;
    procedure ViewDisplayWireframe; dispid 75;
    procedure BreakLineZigZagCut; dispid 76;
    procedure BreakView; dispid 77;
    procedure ViewDisplayHiddengreyed; dispid 78;
    procedure ViewTangentEdges; dispid 79;
    procedure BreakLineSplineCut; dispid 80;
    procedure InsertBreakVertical; dispid 81;
    procedure UnBreakView; dispid 82;
    procedure BreakLineStraightCut; dispid 83;
    procedure InsertDatumTag; dispid 84;
    procedure ToggleGrid; dispid 85;
    procedure FlipSectionLine; dispid 86;
    function FeatureByName(const Name: WideString): IDispatch; dispid 87;
    function IFeatureByName(const Name: WideString): IFeature; dispid 88;
    function NewSheet2(const Name: WideString; paperSize: Integer; templateIn: Integer; 
                       scale1: Double; Scale2: Double; firstAngle: WordBool; 
                       const templateName: WideString; Width: Double; height: Double): WordBool; dispid 89;
    function CreateLinearDim2(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                              p4: OleVariant; val: Double; primPrec: Integer; 
                              const text: WideString; TextPoint: OleVariant; angle: Double; 
                              textHeight: Double; const prefix: WideString; 
                              const suffix: WideString; const callout1: WideString; 
                              const callout2: WideString; tolType: Integer; 
                              const tolMin: WideString; const tolMax: WideString; tolPrec: Integer; 
                              arrowSize: Double; arrowStyle: Integer; arrowDir: Integer; 
                              witnessGap: Double; witnessOvershoot: Double; dualDisplay: WordBool; 
                              dualPrec: Integer): WordBool; dispid 90;
    procedure ICreateLinearDim2(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                var p4: Double; val: Double; primPrec: Integer; 
                                const text: WideString; var TextPoint: Double; angle: Double; 
                                textHeight: Double; const prefix: WideString; 
                                const suffix: WideString; const callout1: WideString; 
                                const callout2: WideString; tolType: Integer; 
                                const tolMin: WideString; const tolMax: WideString; 
                                tolPrec: Integer; arrowSize: Double; arrowStyle: Integer; 
                                arrowDir: Integer; witnessGap: Double; witnessOvershoot: Double; 
                                dualDisplay: WordBool; dualPrecision: Integer); dispid 91;
    function CreateAngDim2(vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; vP3: OleVariant; 
                           vP4: OleVariant; vP5: OleVariant; vP6: OleVariant; arrowSize: Double; 
                           const text: WideString; textHeight: Double; witnessGap: Double; 
                           witnessOvershoot: Double; vTextPoint: OleVariant): WordBool; dispid 92;
    procedure ICreateAngDim2(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                             var p4: Double; var P5: Double; var P6: Double; arrowSize: Double; 
                             const text: WideString; textHeight: Double; witnessGap: Double; 
                             witnessOvershoot: Double; var TextPoint: Double); dispid 93;
    function CreateDiamDim2(dimVal: Double; vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; 
                            vP3: OleVariant; arrowSize: Double; const text: WideString; 
                            textHeight: Double; witnessGap: Double; witnessOvershoot: Double; 
                            vTextPoint: OleVariant): WordBool; dispid 94;
    procedure ICreateDiamDim2(DimValue: Double; var p0: Double; var P1: Double; var P2: Double; 
                              var P3: Double; arrowSize: Double; const text: WideString; 
                              textHeight: Double; witnessGap: Double; witnessOvershoot: Double; 
                              var TextPoint: Double); dispid 95;
    function CreateOrdinateDim2(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                                p4: OleVariant; angle: Double; arrowSize: Double; 
                                const text: WideString; textHeight: Double; witnessGap: Double; 
                                witnessOvershoot: Double; P5: OleVariant): WordBool; dispid 96;
    procedure ICreateOrdinateDim2(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                  var p4: Double; angle: Double; arrowSize: Double; 
                                  const text: WideString; textHeight: Double; witnessGap: Double; 
                                  witnessOvershoot: Double; var P5: Double); dispid 97;
    procedure InsertNewNote2(const upperText: WideString; const lowerText: WideString; 
                             noLeader: WordBool; bentLeader: WordBool; arrowStyle: Smallint; 
                             leaderSide: Smallint; angle: Double; balloonStyle: Smallint; 
                             balloonFit: Smallint; upperNoteContent: Smallint; 
                             lowerNoteContent: Smallint); dispid 98;
    procedure DragModelDimension(const viewname: WideString; dropEffect: Smallint; x: Double; 
                                 y: Double; z: Double); dispid 99;
    function CreateViewport2(LowerLeftX: Double; LowerLeftY: Double; UpperRightX: Double; 
                             UpperRightY: Double; sketchSize: Smallint; Scale: Double): WideString; dispid 100;
    procedure SetupSheet2(const Name: WideString; paperSize: Smallint; templateIn: Smallint; 
                          scale1: Double; Scale2: Double; skPointsFlag: Integer); dispid 101;
    procedure OnComponentProperties; dispid 102;
    function GetLineFontCount2: Integer; dispid 103;
    function GetLineFontName2(index: Integer): WideString; dispid 104;
    function GetLineFontInfo2(index: Integer): OleVariant; dispid 105;
    procedure SetLineStyle(const styleName: WideString); dispid 106;
    procedure SetLineWidth(Width: Integer); dispid 107;
    procedure SetLineColor(Color: Integer); dispid 108;
    procedure ShowEdge; dispid 109;
    procedure HideEdge; dispid 110;
    procedure AddHoleCallout; dispid 111;
    function GetPenCount: Integer; dispid 112;
    function GetPenInfo: OleVariant; dispid 113;
    function IGetPenInfo: Integer; dispid 114;
    function GetLineFontId(index: Integer): Integer; dispid 115;
    function CreateAuxiliaryViewAt(x: Double; y: Double; z: Double; notAligned: WordBool): WordBool; dispid 116;
    function CreateDetailViewAt(x: Double; y: Double; z: Double): WordBool; dispid 117;
    function CreateSectionViewAt(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                 isOffsetSection: WordBool): WordBool; dispid 118;
    function CreateUnfoldedViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool): WordBool; dispid 119;
    function SetupSheet3(const Name: WideString; paperSize: Integer; templateIn: Integer; 
                         scale1: Double; Scale2: Double; firstAngle: WordBool; 
                         const templateName: WideString; Width: Double; height: Double): WordBool; dispid 120;
    function InsertModelAnnotations(option: Integer; allTypes: WordBool; types: Integer; 
                                    allViews: WordBool): WordBool; dispid 121;
    procedure InsertCustomSymbol(const symbolPath: WideString); dispid 122;
    function GetSheetCount: Integer; dispid 123;
    function GetSheetNames: OleVariant; dispid 124;
    function IGetSheetNames(var count: Integer): WideString; dispid 125;
    function ActivateSheet(const Name: WideString): WordBool; dispid 126;
    function CreateText2(const textString: WideString; textX: Double; textY: Double; textZ: Double; 
                         textHeight: Double; textAngle: Double): IDispatch; dispid 127;
    function ICreateText2(const textString: WideString; textX: Double; textY: Double; 
                          textZ: Double; textHeight: Double; textAngle: Double): INote; dispid 128;
    function NewSheet3(const Name: WideString; paperSize: Integer; templateIn: Integer; 
                       scale1: Double; Scale2: Double; firstAngle: WordBool; 
                       const templateName: WideString; Width: Double; height: Double; 
                       const propertyViewName: WideString): WordBool; dispid 129;
    function SetupSheet4(const Name: WideString; paperSize: Integer; templateIn: Integer; 
                         scale1: Double; Scale2: Double; firstAngle: WordBool; 
                         const templateName: WideString; Width: Double; height: Double; 
                         const propertyViewName: WideString): WordBool; dispid 130;
    function CreateLinearDim3(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                              p4: OleVariant; val: Double; primPrec: Integer; 
                              const text: WideString; TextPoint: OleVariant; angle: Double; 
                              textHeight: Double; const prefix: WideString; 
                              const suffix: WideString; const callout1: WideString; 
                              const callout2: WideString; tolType: Integer; 
                              const tolMin: WideString; const tolMax: WideString; tolPrec: Integer; 
                              arrowSize: Double; arrowStyle: Integer; arrowDir: Integer; 
                              witnessGap: Double; witnessOvershoot: Double; dualDisplay: WordBool; 
                              dualPrec: Integer): IDispatch; dispid 131;
    function ICreateLinearDim3(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                               var p4: Double; val: Double; primPrec: Integer; 
                               const text: WideString; var TextPoint: Double; angle: Double; 
                               textHeight: Double; const prefix: WideString; 
                               const suffix: WideString; const callout1: WideString; 
                               const callout2: WideString; tolType: Integer; 
                               const tolMin: WideString; const tolMax: WideString; 
                               tolPrec: Integer; arrowSize: Double; arrowStyle: Integer; 
                               arrowDir: Integer; witnessGap: Double; witnessOvershoot: Double; 
                               dualDisplay: WordBool; dualPrecision: Integer): IDisplayDimension; dispid 132;
    function CreateAngDim3(vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; vP3: OleVariant; 
                           vP4: OleVariant; vP5: OleVariant; vP6: OleVariant; arrowSize: Double; 
                           const text: WideString; textHeight: Double; witnessGap: Double; 
                           witnessOvershoot: Double; vTextPoint: OleVariant): IDispatch; dispid 133;
    function ICreateAngDim3(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                            var p4: Double; var P5: Double; var P6: Double; arrowSize: Double; 
                            const text: WideString; textHeight: Double; witnessGap: Double; 
                            witnessOvershoot: Double; var TextPoint: Double): IDisplayDimension; dispid 134;
    function CreateDiamDim3(dimVal: Double; vP0: OleVariant; vP1: OleVariant; vP2: OleVariant; 
                            vP3: OleVariant; arrowSize: Double; const text: WideString; 
                            textHeight: Double; witnessGap: Double; witnessOvershoot: Double; 
                            vTextPoint: OleVariant): IDispatch; dispid 135;
    function ICreateDiamDim3(DimValue: Double; var p0: Double; var P1: Double; var P2: Double; 
                             var P3: Double; arrowSize: Double; const text: WideString; 
                             textHeight: Double; witnessGap: Double; witnessOvershoot: Double; 
                             var TextPoint: Double): IDisplayDimension; dispid 136;
    function CreateOrdinateDim3(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                                p4: OleVariant; angle: Double; arrowSize: Double; 
                                const text: WideString; textHeight: Double; witnessGap: Double; 
                                witnessOvershoot: Double; P5: OleVariant): IDispatch; dispid 137;
    function ICreateOrdinateDim3(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                 var p4: Double; angle: Double; arrowSize: Double; 
                                 const text: WideString; textHeight: Double; witnessGap: Double; 
                                 witnessOvershoot: Double; var P5: Double): IDisplayDimension; dispid 138;
    procedure ForceRebuild; dispid 139;
    function AddOrdinateDimension(DimType: Integer; locX: Double; locY: Double; locZ: Double): WordBool; dispid 140;
    function CreateLayer(const layerName: WideString; const layerDesc: WideString; 
                         layerColor: Integer; layerStyle: Integer; layerWidth: Integer; 
                         bOn: WordBool): WordBool; dispid 141;
    function SetCurrentLayer(const layerName: WideString): WordBool; dispid 142;
    function DrawingViewRotate(newAngle: Double): WordBool; dispid 143;
    function CreateDetailViewAt2(x: Double; y: Double; z: Double): WordBool; dispid 144;
    procedure RestoreRotation; dispid 145;
    function GetEditSheet: WordBool; dispid 146;
    procedure TranslateDrawing(deltaX: Double; deltaY: Double); dispid 147;
    function Create1stAngleViews2(const ModelName: WideString): WordBool; dispid 148;
    function Create3rdAngleViews2(const ModelName: WideString): WordBool; dispid 149;
    procedure HideShowDimensions; dispid 150;
    function CreateLinearDim4(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                              p4: OleVariant; TextPoint: OleVariant; val: Double; angle: Double; 
                              textHeight: Double): IDispatch; dispid 151;
    function ICreateLinearDim4(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                               var p4: Double; var TextPoint: Double; val: Double; angle: Double; 
                               textHeight: Double): IDisplayDimension; dispid 152;
    function CreateDiamDim4(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                            TextPoint: OleVariant; val: Double; textHeight: Double): IDispatch; dispid 153;
    function ICreateDiamDim4(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                             var TextPoint: Double; val: Double; textHeight: Double): IDisplayDimension; dispid 154;
    function CreateOrdinateDim4(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                                p4: OleVariant; P5: OleVariant; val: Double; angle: Double; 
                                textHeight: Double): IDispatch; dispid 155;
    function ICreateOrdinateDim4(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                                 var p4: Double; var P5: Double; val: Double; angle: Double; 
                                 textHeight: Double): IDisplayDimension; dispid 156;
    function CreateAngDim4(p0: OleVariant; P1: OleVariant; P2: OleVariant; P3: OleVariant; 
                           p4: OleVariant; P5: OleVariant; P6: OleVariant; TextPoint: OleVariant; 
                           textHeight: Double): IDispatch; dispid 157;
    function ICreateAngDim4(var p0: Double; var P1: Double; var P2: Double; var P3: Double; 
                            var p4: Double; var P5: Double; var P6: Double; var TextPoint: Double; 
                            textHeight: Double): IDisplayDimension; dispid 158;
    function CreateDetailViewAt3(x: Double; y: Double; z: Double; Style: Integer; scale1: Double; 
                                 Scale2: Double; const labelIn: WideString; showtype: Integer; 
                                 fulloutline: WordBool): IDispatch; dispid 159;
    function ICreateDetailViewAt3(x: Double; y: Double; z: Double; Style: Integer; scale1: Double; 
                                  Scale2: Double; const labelIn: WideString; showtype: Integer; 
                                  fulloutline: WordBool): IView; dispid 160;
    function CreateSectionViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                  isOffsetSection: WordBool; const label_: WideString; 
                                  chgdirection: WordBool; scwithmodel: WordBool; partial: WordBool; 
                                  dispsurfcut: WordBool): IDispatch; dispid 161;
    function ICreateSectionViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                   isOffsetSection: WordBool; const label_: WideString; 
                                   chgdirection: WordBool; scwithmodel: WordBool; 
                                   partial: WordBool; dispsurfcut: WordBool): IView; dispid 162;
    function CreateAuxiliaryViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                    const label_: WideString; showarrow: WordBool; flip: WordBool): IDispatch; dispid 163;
    function ICreateAuxiliaryViewAt2(x: Double; y: Double; z: Double; notAligned: WordBool; 
                                     const label_: WideString; showarrow: WordBool; flip: WordBool): IView; dispid 164;
    procedure MakeCustomSymbol; dispid 165;
    procedure ExplodeCustomSymbol; dispid 166;
    procedure SaveCustomSymbol(const filenameIn: WideString); dispid 167;
    function CreateBreakOutSection(depth: Double): WordBool; dispid 168;
    procedure InsertThreadCallout; dispid 169;
    function CreateFlatPatternViewFromModelView(const ModelName: WideString; 
                                                const configName: WideString; locX: Double; 
                                                locY: Double; locZ: Double): WordBool; dispid 170;
    function ChangeRefConfigurationOfFlatPatternView(const ModelName: WideString; 
                                                     const configName: WideString): WordBool; dispid 171;
  end;

// *********************************************************************//
// Interface: IView
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D50-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IView = interface(IDispatch)
    ['{83A33D50-27C5-11CE-BFD4-00400513BB57}']
    function Get_suppressState: Integer; safecall;
    procedure Set_suppressState(retval: Integer); safecall;
    function GetNextView: IDispatch; safecall;
    function IGetNextView: IView; safecall;
    function GetLines: OleVariant; safecall;
    function GetOutline: OleVariant; safecall;
    function GetXform: OleVariant; safecall;
    function GetArcs: OleVariant; safecall;
    function GetUserPoints: OleVariant; safecall;
    function GetPolylines: OleVariant; safecall;
    function GetSplines: OleVariant; safecall;
    function GetDimensionInfo: OleVariant; safecall;
    function GetDimensionString: OleVariant; safecall;
    function GetFirstNote: IDispatch; safecall;
    function IGetFirstNote: INote; safecall;
    function GetFirstGTOL: IDispatch; safecall;
    function IGetFirstGTOL: IGtol; safecall;
    function IGetLines: Double; safecall;
    function IGetOutline: Double; safecall;
    function IGetXform: Double; safecall;
    function IGetArcs: Double; safecall;
    function IGetUserPoints: Double; safecall;
    function IGetPolylines: Double; safecall;
    function IGetSplines: Double; safecall;
    function IGetDimensionInfo: Double; safecall;
    function IGetDimensionString: WideString; safecall;
    function GetLineCount: Integer; safecall;
    function GetArcCount: Integer; safecall;
    function GetUserPointsCount: Integer; safecall;
    function GetPolylineCount(out pointCount: Integer): Integer; safecall;
    function GetSplineCount(out pointCount: Integer): Integer; safecall;
    function GetDimensionCount: Integer; safecall;
    function GetEllipses: OleVariant; safecall;
    function IGetEllipses: Double; safecall;
    function GetEllipseCount: Integer; safecall;
    function GetDisplayMode: Integer; safecall;
    procedure SetDisplayMode(displayIn: Integer); safecall;
    function GetDisplayTangentEdges: WordBool; safecall;
    procedure SetDisplayTangentEdges(displayIn: WordBool); safecall;
    function GetCenterMarkCount: Integer; safecall;
    function GetCenterMarkInfo: OleVariant; safecall;
    function IGetCenterMarkInfo: Double; safecall;
    function GetSectionLineCount(out size: Integer): Integer; safecall;
    function GetSectionLineInfo: OleVariant; safecall;
    function GetSectionLineStrings: OleVariant; safecall;
    function IGetSectionLineInfo: Double; safecall;
    function IGetSectionLineStrings: WideString; safecall;
    procedure UpdateViewDisplayGeometry; safecall;
    function GetDetailCircleCount: Integer; safecall;
    function GetDetailCircleInfo: OleVariant; safecall;
    function IGetDetailCircleInfo: Double; safecall;
    function GetDetailCircleStrings: OleVariant; safecall;
    function IGetDetailCircleStrings: WideString; safecall;
    function GetDimensionIds: OleVariant; safecall;
    function IGetDimensionIds: WideString; safecall;
    function GetDimensionDisplayInfo: OleVariant; safecall;
    function IGetDimensionDisplayInfo: Double; safecall;
    function GetDimensionDisplayString: OleVariant; safecall;
    function IGetDimensionDisplayString: WideString; safecall;
    function GetArcs2: OleVariant; safecall;
    function IGetArcs2: Double; safecall;
    function GetEllipses2: OleVariant; safecall;
    function IGetEllipses2: Double; safecall;
    function GetViewXform: OleVariant; safecall;
    function IGetViewXform: Double; safecall;
    function GetFirstSFSymbol: IDispatch; safecall;
    function IGetFirstSFSymbol: ISFSymbol; safecall;
    function GetFirstDatumTag: IDispatch; safecall;
    function IGetFirstDatumTag: IDatumTag; safecall;
    function GetFirstDatumTargetSym: IDispatch; safecall;
    function IGetFirstDatumTargetSym: IDatumTargetSym; safecall;
    function GetFirstWeldSymbol: IDispatch; safecall;
    function IGetFirstWeldSymbol: IWeldSymbol; safecall;
    function GetDatumPointsCount: Integer; safecall;
    function GetDatumPoints: OleVariant; safecall;
    function IGetDatumPoints: Double; safecall;
    procedure UseDefaultAlignment; safecall;
    procedure RemoveAlignment; safecall;
    procedure AlignVerticalTo(const viewNameIn: WideString); safecall;
    procedure AlignHorizontalTo(const viewNameIn: WideString); safecall;
    function GetDisplayData: IDispatch; safecall;
    function IGetDisplayData: IDisplayData; safecall;
    function GetPolyLineCount2(out pointCount: Integer): Integer; safecall;
    function GetPolylines2: OleVariant; safecall;
    function IGetPolylines2: Double; safecall;
    function ShowExploded(showIt: WordBool): WordBool; safecall;
    function IsExploded: WordBool; safecall;
    procedure Set_ReferencedConfiguration(const retval: WideString); safecall;
    function Get_ReferencedConfiguration: WideString; safecall;
    function GetFirstCThread: IDispatch; safecall;
    function IGetFirstCThread: ICThread; safecall;
    function CreateViewArrow(const drawingViewNameIn: WideString; const arrowNameIn: WideString): WordBool; safecall;
    procedure ModifyViewArrow(const drawingViewNameIn: WideString; const arrowNameIn: WideString); safecall;
    procedure MoveViewArrow(const drawingViewNameIn: WideString; dx: Double; dy: Double; dz: Double); safecall;
    function GetPolylines3: OleVariant; safecall;
    function IGetPolylines3: Double; safecall;
    function GetPolyLineCount3(out pointCount: Integer): Integer; safecall;
    function GetFirstDisplayDimension: IDispatch; safecall;
    function IGetFirstDisplayDimension: IDisplayDimension; safecall;
    function GetSketch: IDispatch; safecall;
    function IGetSketch: ISketch; safecall;
    function GetLines2: OleVariant; safecall;
    function IGetLines2: Double; safecall;
    function GetSplines2: OleVariant; safecall;
    function IGetSplines2: Double; safecall;
    function GetArcs3: OleVariant; safecall;
    function IGetArcs3: Double; safecall;
    function GetEllipses3: OleVariant; safecall;
    function IGetEllipses3: Double; safecall;
    function GetBomTable: IDispatch; safecall;
    function IGetBomTable: IBomTable; safecall;
    function Get_UseSheetScale: Integer; safecall;
    procedure Set_UseSheetScale(retval: Integer); safecall;
    function Get_ScaleDecimal: Double; safecall;
    procedure Set_ScaleDecimal(retval: Double); safecall;
    function Get_ScaleRatio: OleVariant; safecall;
    procedure Set_ScaleRatio(retval: OleVariant); safecall;
    function Get_IScaleRatio: Double; safecall;
    procedure Set_IScaleRatio(var retval: Double); safecall;
    function Get_position: OleVariant; safecall;
    procedure Set_position(retval: OleVariant); safecall;
    function Get_IPosition: Double; safecall;
    procedure Set_IPosition(var retval: Double); safecall;
    function SetXform(transform: OleVariant): WordBool; safecall;
    function ISetXform(var transform: Double): WordBool; safecall;
    function GetAlignment: Integer; safecall;
    function GetReferencedModelName: WideString; safecall;
    function GetFirstAnnotation: IDispatch; safecall;
    function IGetFirstAnnotation: IAnnotation; safecall;
    function GetFirstCustomSymbol: IDispatch; safecall;
    function IGetFirstCustomSymbol: ICustomSymbol; safecall;
    function GetDimensionInfo2: OleVariant; safecall;
    function IGetDimensionInfo2: Double; safecall;
    function GetParabolas: OleVariant; safecall;
    function IGetParabolas: Double; safecall;
    function GetParabolaCount: Integer; safecall;
    function GetEllipses4: OleVariant; safecall;
    function IGetEllipses4: Double; safecall;
    function GetLines3: OleVariant; safecall;
    function IGetLines3: Double; safecall;
    function GetArcs4: OleVariant; safecall;
    function IGetArcs4: Double; safecall;
    function GetSplines3: OleVariant; safecall;
    function IGetSplines3: Double; safecall;
    function GetEllipses5: OleVariant; safecall;
    function IGetEllipses5: Double; safecall;
    function GetParabolas2: OleVariant; safecall;
    function IGetParabolas2: Double; safecall;
    function GetUserPoints2: OleVariant; safecall;
    function IGetUserPoints2: Double; safecall;
    function GetDimensionInfo3: OleVariant; safecall;
    function IGetDimensionInfo3: Double; safecall;
    function GetDatumPoints2: OleVariant; safecall;
    function IGetDatumPoints2: Double; safecall;
    function Get_Name: WideString; safecall;
    function Get_type_: Integer; safecall;
    function Get_ProjectedDimensions: WordBool; safecall;
    procedure Set_ProjectedDimensions(retval: WordBool); safecall;
    function HasDesignTable: WordBool; safecall;
    function GetDesignTableExtent: OleVariant; safecall;
    function IGetDesignTableExtent: Double; safecall;
    function GetDisplayData2: IDispatch; safecall;
    function IGetDisplayData2: IDisplayData; safecall;
    function GetFirstAnnotation2: IDispatch; safecall;
    function IGetFirstAnnotation2: IAnnotation; safecall;
    function GetDimensionCount2: Integer; safecall;
    function GetDimensionInfo4: OleVariant; safecall;
    function IGetDimensionInfo4: Double; safecall;
    function GetDimensionString2: OleVariant; safecall;
    function IGetDimensionString2: WideString; safecall;
    function GetDimensionIds2: OleVariant; safecall;
    function IGetDimensionIds2: WideString; safecall;
    function GetDimensionDisplayInfo2: OleVariant; safecall;
    function IGetDimensionDisplayInfo2: Double; safecall;
    function GetDimensionDisplayString2: OleVariant; safecall;
    function IGetDimensionDisplayString2: WideString; safecall;
    function GetFirstDisplayDimension2: IDispatch; safecall;
    function IGetFirstDisplayDimension2: IDisplayDimension; safecall;
    function GetPolylines4: OleVariant; safecall;
    function IGetPolylines4: Double; safecall;
    function GetPolyLineCount4(out pointCount: Integer): Integer; safecall;
    function IsModelLoaded: WordBool; safecall;
    function LoadModel: Integer; safecall;
    function GetDisplayTangentEdges2: Integer; safecall;
    procedure SetDisplayTangentEdges2(displayIn: Integer); safecall;
    function GetSectionLines: OleVariant; safecall;
    function IGetSectionLines: IDrSection; safecall;
    function GetSection: IDispatch; safecall;
    function IGetSection: IDrSection; safecall;
    function GetHiddenComponents: OleVariant; safecall;
    function EnumHiddenComponents: IEnumComponents; safecall;
    function EnumSectionLines: IEnumDrSections; safecall;
    function GetDisplayData3: IDispatch; safecall;
    function IGetDisplayData3: IDisplayData; safecall;
    function GetDimensionCount3: Integer; safecall;
    function GetDimensionInfo5: OleVariant; safecall;
    function IGetDimensionInfo5: Double; safecall;
    function GetDimensionString3: OleVariant; safecall;
    function IGetDimensionString3: WideString; safecall;
    function GetDimensionIds3: OleVariant; safecall;
    function IGetDimensionIds3: WideString; safecall;
    function GetDimensionDisplayInfo3: OleVariant; safecall;
    function IGetDimensionDisplayInfo3: Double; safecall;
    function GetDimensionDisplayString3: OleVariant; safecall;
    function IGetDimensionDisplayString3: WideString; safecall;
    function GetFirstDisplayDimension3: IDispatch; safecall;
    function IGetFirstDisplayDimension3: IDisplayDimension; safecall;
    function IsCropped: WordBool; safecall;
    function Get_angle: Double; safecall;
    procedure Set_angle(retval: Double); safecall;
    function GetDetailCircles: OleVariant; safecall;
    function IGetDetailCircles(NumDetailCircles: Integer): IDetailCircle; safecall;
    function GetProjectionArrow: IDispatch; safecall;
    function IGetProjectionArrow: IProjectionArrow; safecall;
    function GetDetail: IDispatch; safecall;
    function IGetDetail: IDetailCircle; safecall;
    property suppressState: Integer read Get_suppressState write Set_suppressState;
    property ReferencedConfiguration: WideString read Get_ReferencedConfiguration write Set_ReferencedConfiguration;
    property UseSheetScale: Integer read Get_UseSheetScale write Set_UseSheetScale;
    property ScaleDecimal: Double read Get_ScaleDecimal write Set_ScaleDecimal;
    property ScaleRatio: OleVariant read Get_ScaleRatio write Set_ScaleRatio;
    property position: OleVariant read Get_position write Set_position;
    property Name: WideString read Get_Name;
    property type_: Integer read Get_type_;
    property ProjectedDimensions: WordBool read Get_ProjectedDimensions write Set_ProjectedDimensions;
    property angle: Double read Get_angle write Set_angle;
  end;

// *********************************************************************//
// DispIntf:  IViewDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D50-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IViewDisp = dispinterface
    ['{83A33D50-27C5-11CE-BFD4-00400513BB57}']
    property suppressState: Integer dispid 16;
    function GetNextView: IDispatch; dispid 1;
    function IGetNextView: IView; dispid 13;
    function GetLines: OleVariant; dispid 2;
    function GetOutline: OleVariant; dispid 3;
    function GetXform: OleVariant; dispid 4;
    function GetArcs: OleVariant; dispid 5;
    function GetUserPoints: OleVariant; dispid 6;
    function GetPolylines: OleVariant; dispid 7;
    function GetSplines: OleVariant; dispid 8;
    function GetDimensionInfo: OleVariant; dispid 9;
    function GetDimensionString: OleVariant; dispid 10;
    function GetFirstNote: IDispatch; dispid 11;
    function IGetFirstNote: INote; dispid 14;
    function GetFirstGTOL: IDispatch; dispid 12;
    function IGetFirstGTOL: IGtol; dispid 15;
    function IGetLines: Double; dispid 17;
    function IGetOutline: Double; dispid 18;
    function IGetXform: Double; dispid 19;
    function IGetArcs: Double; dispid 20;
    function IGetUserPoints: Double; dispid 21;
    function IGetPolylines: Double; dispid 22;
    function IGetSplines: Double; dispid 23;
    function IGetDimensionInfo: Double; dispid 24;
    function IGetDimensionString: WideString; dispid 25;
    function GetLineCount: Integer; dispid 26;
    function GetArcCount: Integer; dispid 27;
    function GetUserPointsCount: Integer; dispid 28;
    function GetPolylineCount(out pointCount: Integer): Integer; dispid 29;
    function GetSplineCount(out pointCount: Integer): Integer; dispid 30;
    function GetDimensionCount: Integer; dispid 31;
    function GetEllipses: OleVariant; dispid 32;
    function IGetEllipses: Double; dispid 33;
    function GetEllipseCount: Integer; dispid 34;
    function GetDisplayMode: Integer; dispid 35;
    procedure SetDisplayMode(displayIn: Integer); dispid 36;
    function GetDisplayTangentEdges: WordBool; dispid 37;
    procedure SetDisplayTangentEdges(displayIn: WordBool); dispid 38;
    function GetCenterMarkCount: Integer; dispid 39;
    function GetCenterMarkInfo: OleVariant; dispid 40;
    function IGetCenterMarkInfo: Double; dispid 41;
    function GetSectionLineCount(out size: Integer): Integer; dispid 42;
    function GetSectionLineInfo: OleVariant; dispid 43;
    function GetSectionLineStrings: OleVariant; dispid 44;
    function IGetSectionLineInfo: Double; dispid 45;
    function IGetSectionLineStrings: WideString; dispid 46;
    procedure UpdateViewDisplayGeometry; dispid 47;
    function GetDetailCircleCount: Integer; dispid 48;
    function GetDetailCircleInfo: OleVariant; dispid 49;
    function IGetDetailCircleInfo: Double; dispid 50;
    function GetDetailCircleStrings: OleVariant; dispid 51;
    function IGetDetailCircleStrings: WideString; dispid 52;
    function GetDimensionIds: OleVariant; dispid 53;
    function IGetDimensionIds: WideString; dispid 54;
    function GetDimensionDisplayInfo: OleVariant; dispid 55;
    function IGetDimensionDisplayInfo: Double; dispid 56;
    function GetDimensionDisplayString: OleVariant; dispid 57;
    function IGetDimensionDisplayString: WideString; dispid 58;
    function GetArcs2: OleVariant; dispid 59;
    function IGetArcs2: Double; dispid 60;
    function GetEllipses2: OleVariant; dispid 61;
    function IGetEllipses2: Double; dispid 62;
    function GetViewXform: OleVariant; dispid 63;
    function IGetViewXform: Double; dispid 64;
    function GetFirstSFSymbol: IDispatch; dispid 65;
    function IGetFirstSFSymbol: ISFSymbol; dispid 66;
    function GetFirstDatumTag: IDispatch; dispid 67;
    function IGetFirstDatumTag: IDatumTag; dispid 68;
    function GetFirstDatumTargetSym: IDispatch; dispid 69;
    function IGetFirstDatumTargetSym: IDatumTargetSym; dispid 70;
    function GetFirstWeldSymbol: IDispatch; dispid 71;
    function IGetFirstWeldSymbol: IWeldSymbol; dispid 72;
    function GetDatumPointsCount: Integer; dispid 73;
    function GetDatumPoints: OleVariant; dispid 74;
    function IGetDatumPoints: Double; dispid 75;
    procedure UseDefaultAlignment; dispid 76;
    procedure RemoveAlignment; dispid 77;
    procedure AlignVerticalTo(const viewNameIn: WideString); dispid 78;
    procedure AlignHorizontalTo(const viewNameIn: WideString); dispid 79;
    function GetDisplayData: IDispatch; dispid 80;
    function IGetDisplayData: IDisplayData; dispid 81;
    function GetPolyLineCount2(out pointCount: Integer): Integer; dispid 82;
    function GetPolylines2: OleVariant; dispid 83;
    function IGetPolylines2: Double; dispid 84;
    function ShowExploded(showIt: WordBool): WordBool; dispid 85;
    function IsExploded: WordBool; dispid 86;
    property ReferencedConfiguration: WideString dispid 87;
    function GetFirstCThread: IDispatch; dispid 88;
    function IGetFirstCThread: ICThread; dispid 89;
    function CreateViewArrow(const drawingViewNameIn: WideString; const arrowNameIn: WideString): WordBool; dispid 90;
    procedure ModifyViewArrow(const drawingViewNameIn: WideString; const arrowNameIn: WideString); dispid 91;
    procedure MoveViewArrow(const drawingViewNameIn: WideString; dx: Double; dy: Double; dz: Double); dispid 92;
    function GetPolylines3: OleVariant; dispid 93;
    function IGetPolylines3: Double; dispid 94;
    function GetPolyLineCount3(out pointCount: Integer): Integer; dispid 95;
    function GetFirstDisplayDimension: IDispatch; dispid 96;
    function IGetFirstDisplayDimension: IDisplayDimension; dispid 97;
    function GetSketch: IDispatch; dispid 98;
    function IGetSketch: ISketch; dispid 99;
    function GetLines2: OleVariant; dispid 100;
    function IGetLines2: Double; dispid 101;
    function GetSplines2: OleVariant; dispid 102;
    function IGetSplines2: Double; dispid 103;
    function GetArcs3: OleVariant; dispid 104;
    function IGetArcs3: Double; dispid 105;
    function GetEllipses3: OleVariant; dispid 106;
    function IGetEllipses3: Double; dispid 107;
    function GetBomTable: IDispatch; dispid 108;
    function IGetBomTable: IBomTable; dispid 109;
    property UseSheetScale: Integer dispid 110;
    property ScaleDecimal: Double dispid 111;
    property ScaleRatio: OleVariant dispid 112;
    function IScaleRatio: Double; dispid 113;
    property position: OleVariant dispid 114;
    function IPosition: Double; dispid 115;
    function SetXform(transform: OleVariant): WordBool; dispid 116;
    function ISetXform(var transform: Double): WordBool; dispid 117;
    function GetAlignment: Integer; dispid 118;
    function GetReferencedModelName: WideString; dispid 119;
    function GetFirstAnnotation: IDispatch; dispid 120;
    function IGetFirstAnnotation: IAnnotation; dispid 121;
    function GetFirstCustomSymbol: IDispatch; dispid 122;
    function IGetFirstCustomSymbol: ICustomSymbol; dispid 123;
    function GetDimensionInfo2: OleVariant; dispid 124;
    function IGetDimensionInfo2: Double; dispid 125;
    function GetParabolas: OleVariant; dispid 126;
    function IGetParabolas: Double; dispid 127;
    function GetParabolaCount: Integer; dispid 128;
    function GetEllipses4: OleVariant; dispid 129;
    function IGetEllipses4: Double; dispid 130;
    function GetLines3: OleVariant; dispid 131;
    function IGetLines3: Double; dispid 132;
    function GetArcs4: OleVariant; dispid 133;
    function IGetArcs4: Double; dispid 134;
    function GetSplines3: OleVariant; dispid 135;
    function IGetSplines3: Double; dispid 136;
    function GetEllipses5: OleVariant; dispid 137;
    function IGetEllipses5: Double; dispid 138;
    function GetParabolas2: OleVariant; dispid 139;
    function IGetParabolas2: Double; dispid 140;
    function GetUserPoints2: OleVariant; dispid 141;
    function IGetUserPoints2: Double; dispid 142;
    function GetDimensionInfo3: OleVariant; dispid 143;
    function IGetDimensionInfo3: Double; dispid 144;
    function GetDatumPoints2: OleVariant; dispid 145;
    function IGetDatumPoints2: Double; dispid 146;
    property Name: WideString readonly dispid 147;
    property type_: Integer readonly dispid 148;
    property ProjectedDimensions: WordBool dispid 149;
    function HasDesignTable: WordBool; dispid 150;
    function GetDesignTableExtent: OleVariant; dispid 151;
    function IGetDesignTableExtent: Double; dispid 152;
    function GetDisplayData2: IDispatch; dispid 153;
    function IGetDisplayData2: IDisplayData; dispid 154;
    function GetFirstAnnotation2: IDispatch; dispid 155;
    function IGetFirstAnnotation2: IAnnotation; dispid 156;
    function GetDimensionCount2: Integer; dispid 157;
    function GetDimensionInfo4: OleVariant; dispid 158;
    function IGetDimensionInfo4: Double; dispid 159;
    function GetDimensionString2: OleVariant; dispid 160;
    function IGetDimensionString2: WideString; dispid 161;
    function GetDimensionIds2: OleVariant; dispid 162;
    function IGetDimensionIds2: WideString; dispid 163;
    function GetDimensionDisplayInfo2: OleVariant; dispid 164;
    function IGetDimensionDisplayInfo2: Double; dispid 165;
    function GetDimensionDisplayString2: OleVariant; dispid 166;
    function IGetDimensionDisplayString2: WideString; dispid 167;
    function GetFirstDisplayDimension2: IDispatch; dispid 168;
    function IGetFirstDisplayDimension2: IDisplayDimension; dispid 169;
    function GetPolylines4: OleVariant; dispid 170;
    function IGetPolylines4: Double; dispid 171;
    function GetPolyLineCount4(out pointCount: Integer): Integer; dispid 172;
    function IsModelLoaded: WordBool; dispid 173;
    function LoadModel: Integer; dispid 174;
    function GetDisplayTangentEdges2: Integer; dispid 175;
    procedure SetDisplayTangentEdges2(displayIn: Integer); dispid 176;
    function GetSectionLines: OleVariant; dispid 177;
    function IGetSectionLines: IDrSection; dispid 178;
    function GetSection: IDispatch; dispid 179;
    function IGetSection: IDrSection; dispid 180;
    function GetHiddenComponents: OleVariant; dispid 181;
    function EnumHiddenComponents: IEnumComponents; dispid 182;
    function EnumSectionLines: IEnumDrSections; dispid 183;
    function GetDisplayData3: IDispatch; dispid 184;
    function IGetDisplayData3: IDisplayData; dispid 185;
    function GetDimensionCount3: Integer; dispid 186;
    function GetDimensionInfo5: OleVariant; dispid 187;
    function IGetDimensionInfo5: Double; dispid 188;
    function GetDimensionString3: OleVariant; dispid 189;
    function IGetDimensionString3: WideString; dispid 190;
    function GetDimensionIds3: OleVariant; dispid 191;
    function IGetDimensionIds3: WideString; dispid 192;
    function GetDimensionDisplayInfo3: OleVariant; dispid 193;
    function IGetDimensionDisplayInfo3: Double; dispid 194;
    function GetDimensionDisplayString3: OleVariant; dispid 195;
    function IGetDimensionDisplayString3: WideString; dispid 196;
    function GetFirstDisplayDimension3: IDispatch; dispid 197;
    function IGetFirstDisplayDimension3: IDisplayDimension; dispid 198;
    function IsCropped: WordBool; dispid 199;
    property angle: Double dispid 200;
    function GetDetailCircles: OleVariant; dispid 201;
    function IGetDetailCircles(NumDetailCircles: Integer): IDetailCircle; dispid 202;
    function GetProjectionArrow: IDispatch; dispid 203;
    function IGetProjectionArrow: IProjectionArrow; dispid 204;
    function GetDetail: IDispatch; dispid 205;
    function IGetDetail: IDetailCircle; dispid 206;
  end;

// *********************************************************************//
// Interface: ISFSymbol
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D8E-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISFSymbol = interface(IDispatch)
    ['{83A33D8E-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: ISFSymbol; safecall;
    function GetTextCount: Integer; safecall;
    function GetTextAtIndex(index: Integer): WideString; safecall;
    function GetTextHeightAtIndex(index: Integer): Double; safecall;
    function GetTextPositionAtIndex(index: Integer): OleVariant; safecall;
    function IGetTextPositionAtIndex(index: Integer): Double; safecall;
    function GetTextAngleAtIndex(index: Integer): Double; safecall;
    function GetLineCount: Integer; safecall;
    function GetLineAtIndex(index: Integer): OleVariant; safecall;
    function IGetLineAtIndex(index: Integer): Double; safecall;
    function GetArcCount: Integer; safecall;
    function GetArcAtIndex(index: Integer): OleVariant; safecall;
    function IGetArcAtIndex(index: Integer): Double; safecall;
    function GetArrowHeadCount: Integer; safecall;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; safecall;
    function IGetArrowHeadAtIndex(index: Integer): Double; safecall;
    function GetTextRefPositionAtIndex(index: Integer): Integer; safecall;
    function GetTextInvertAtIndex(index: Integer): Integer; safecall;
    function GetTextFontAtIndex(index: Integer): WideString; safecall;
    function GetTriangleCount: Integer; safecall;
    function GetTriangleAtIndex(index: Integer): OleVariant; safecall;
    function IGetTriangleAtIndex(index: Integer): Double; safecall;
    function IsAttached: WordBool; safecall;
    function HasExtraLeader: WordBool; safecall;
    function GetLeaderCount: Integer; safecall;
    function GetLeaderAtIndex(index: Integer): OleVariant; safecall;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; safecall;
    function IGetArrowHeadInfo: Double; safecall;
    function GetArrowHeadInfo: OleVariant; safecall;
    function GetAnnotation: IDispatch; safecall;
    function IGetAnnotation: IAnnotation; safecall;
    function GetSymbolType: Integer; safecall;
    function SetSymbolType(symbolType: Integer): WordBool; safecall;
    function GetDirectionOfLay: Integer; safecall;
    function SetDirectionOfLay(direction: Integer): WordBool; safecall;
    function GetText(whichOne: Integer): WideString; safecall;
    function SetText(whichOne: Integer; const text: WideString): WordBool; safecall;
    function Get_Rotated: WordBool; safecall;
    procedure Set_Rotated(retval: WordBool); safecall;
    function Get_Grinding: WordBool; safecall;
    procedure Set_Grinding(retval: WordBool); safecall;
    property Rotated: WordBool read Get_Rotated write Set_Rotated;
    property Grinding: WordBool read Get_Grinding write Set_Grinding;
  end;

// *********************************************************************//
// DispIntf:  ISFSymbolDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D8E-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISFSymbolDisp = dispinterface
    ['{83A33D8E-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: ISFSymbol; dispid 2;
    function GetTextCount: Integer; dispid 3;
    function GetTextAtIndex(index: Integer): WideString; dispid 4;
    function GetTextHeightAtIndex(index: Integer): Double; dispid 5;
    function GetTextPositionAtIndex(index: Integer): OleVariant; dispid 6;
    function IGetTextPositionAtIndex(index: Integer): Double; dispid 7;
    function GetTextAngleAtIndex(index: Integer): Double; dispid 8;
    function GetLineCount: Integer; dispid 9;
    function GetLineAtIndex(index: Integer): OleVariant; dispid 10;
    function IGetLineAtIndex(index: Integer): Double; dispid 11;
    function GetArcCount: Integer; dispid 12;
    function GetArcAtIndex(index: Integer): OleVariant; dispid 13;
    function IGetArcAtIndex(index: Integer): Double; dispid 14;
    function GetArrowHeadCount: Integer; dispid 15;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; dispid 16;
    function IGetArrowHeadAtIndex(index: Integer): Double; dispid 17;
    function GetTextRefPositionAtIndex(index: Integer): Integer; dispid 18;
    function GetTextInvertAtIndex(index: Integer): Integer; dispid 19;
    function GetTextFontAtIndex(index: Integer): WideString; dispid 20;
    function GetTriangleCount: Integer; dispid 21;
    function GetTriangleAtIndex(index: Integer): OleVariant; dispid 22;
    function IGetTriangleAtIndex(index: Integer): Double; dispid 23;
    function IsAttached: WordBool; dispid 24;
    function HasExtraLeader: WordBool; dispid 25;
    function GetLeaderCount: Integer; dispid 26;
    function GetLeaderAtIndex(index: Integer): OleVariant; dispid 27;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; dispid 28;
    function IGetArrowHeadInfo: Double; dispid 29;
    function GetArrowHeadInfo: OleVariant; dispid 30;
    function GetAnnotation: IDispatch; dispid 31;
    function IGetAnnotation: IAnnotation; dispid 32;
    function GetSymbolType: Integer; dispid 33;
    function SetSymbolType(symbolType: Integer): WordBool; dispid 34;
    function GetDirectionOfLay: Integer; dispid 35;
    function SetDirectionOfLay(direction: Integer): WordBool; dispid 36;
    function GetText(whichOne: Integer): WideString; dispid 37;
    function SetText(whichOne: Integer; const text: WideString): WordBool; dispid 38;
    property Rotated: WordBool dispid 39;
    property Grinding: WordBool dispid 40;
  end;

// *********************************************************************//
// Interface: IDatumTargetSym
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D92-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDatumTargetSym = interface(IDispatch)
    ['{83A33D92-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: IDatumTargetSym; safecall;
    function GetTextCount: Integer; safecall;
    function GetTextAtIndex(index: Integer): WideString; safecall;
    function GetTextHeightAtIndex(index: Integer): Double; safecall;
    function GetTextPositionAtIndex(index: Integer): OleVariant; safecall;
    function IGetTextPositionAtIndex(index: Integer): Double; safecall;
    function GetTextAngleAtIndex(index: Integer): Double; safecall;
    function GetTextRefPositionAtIndex(index: Integer): Integer; safecall;
    function GetTextInvertAtIndex(index: Integer): Integer; safecall;
    function GetLineCount: Integer; safecall;
    function GetLineAtIndex(index: Integer): OleVariant; safecall;
    function IGetLineAtIndex(index: Integer): Double; safecall;
    function GetArcCount: Integer; safecall;
    function GetArcAtIndex(index: Integer): OleVariant; safecall;
    function IGetArcAtIndex(index: Integer): Double; safecall;
    function GetArrowHeadCount: Integer; safecall;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; safecall;
    function IGetArrowHeadAtIndex(index: Integer): Double; safecall;
    function GetTriangleCount: Integer; safecall;
    function GetTriangleAtIndex(index: Integer): OleVariant; safecall;
    function IGetTriangleAtIndex(index: Integer): Double; safecall;
    function GetAnnotation: IDispatch; safecall;
    function IGetAnnotation: IAnnotation; safecall;
    function GetTargetShape: Integer; safecall;
    function GetTargetAreaSize(whichOne: Integer): WideString; safecall;
    function SetTargetArea(shape: Integer; const size1: WideString; const size2: WideString): WordBool; safecall;
    function GetDisplaySymbol: WordBool; safecall;
    function GetDisplayTargetArea: WordBool; safecall;
    function GetDisplaySizeOutside: WordBool; safecall;
    function SetDisplay(symbol: WordBool; targetArea: WordBool; sizeOutside: WordBool): WordBool; safecall;
    function GetDatumReferenceLabel(whichOne: Integer): WideString; safecall;
    function SetDatumReferenceLabel(whichOne: Integer; const text: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDatumTargetSymDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D92-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDatumTargetSymDisp = dispinterface
    ['{83A33D92-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: IDatumTargetSym; dispid 2;
    function GetTextCount: Integer; dispid 3;
    function GetTextAtIndex(index: Integer): WideString; dispid 4;
    function GetTextHeightAtIndex(index: Integer): Double; dispid 5;
    function GetTextPositionAtIndex(index: Integer): OleVariant; dispid 6;
    function IGetTextPositionAtIndex(index: Integer): Double; dispid 7;
    function GetTextAngleAtIndex(index: Integer): Double; dispid 8;
    function GetTextRefPositionAtIndex(index: Integer): Integer; dispid 9;
    function GetTextInvertAtIndex(index: Integer): Integer; dispid 10;
    function GetLineCount: Integer; dispid 11;
    function GetLineAtIndex(index: Integer): OleVariant; dispid 12;
    function IGetLineAtIndex(index: Integer): Double; dispid 13;
    function GetArcCount: Integer; dispid 14;
    function GetArcAtIndex(index: Integer): OleVariant; dispid 15;
    function IGetArcAtIndex(index: Integer): Double; dispid 16;
    function GetArrowHeadCount: Integer; dispid 17;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; dispid 18;
    function IGetArrowHeadAtIndex(index: Integer): Double; dispid 19;
    function GetTriangleCount: Integer; dispid 20;
    function GetTriangleAtIndex(index: Integer): OleVariant; dispid 21;
    function IGetTriangleAtIndex(index: Integer): Double; dispid 22;
    function GetAnnotation: IDispatch; dispid 23;
    function IGetAnnotation: IAnnotation; dispid 24;
    function GetTargetShape: Integer; dispid 25;
    function GetTargetAreaSize(whichOne: Integer): WideString; dispid 26;
    function SetTargetArea(shape: Integer; const size1: WideString; const size2: WideString): WordBool; dispid 27;
    function GetDisplaySymbol: WordBool; dispid 28;
    function GetDisplayTargetArea: WordBool; dispid 29;
    function GetDisplaySizeOutside: WordBool; dispid 30;
    function SetDisplay(symbol: WordBool; targetArea: WordBool; sizeOutside: WordBool): WordBool; dispid 31;
    function GetDatumReferenceLabel(whichOne: Integer): WideString; dispid 32;
    function SetDatumReferenceLabel(whichOne: Integer; const text: WideString): WordBool; dispid 33;
  end;

// *********************************************************************//
// Interface: IWeldSymbol
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D94-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IWeldSymbol = interface(IDispatch)
    ['{83A33D94-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: IWeldSymbol; safecall;
    function GetTextCount: Integer; safecall;
    function GetTextAtIndex(index: Integer): WideString; safecall;
    function GetTextHeightAtIndex(index: Integer): Double; safecall;
    function GetTextPositionAtIndex(index: Integer): OleVariant; safecall;
    function IGetTextPositionAtIndex(index: Integer): Double; safecall;
    function GetTextAngleAtIndex(index: Integer): Double; safecall;
    function GetTextRefPositionAtIndex(index: Integer): Integer; safecall;
    function GetTextInvertAtIndex(index: Integer): Integer; safecall;
    function GetLineCount: Integer; safecall;
    function GetLineAtIndex(index: Integer): OleVariant; safecall;
    function IGetLineAtIndex(index: Integer): Double; safecall;
    function GetArcCount: Integer; safecall;
    function GetArcAtIndex(index: Integer): OleVariant; safecall;
    function IGetArcAtIndex(index: Integer): Double; safecall;
    function GetArrowHeadCount: Integer; safecall;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; safecall;
    function IGetArrowHeadAtIndex(index: Integer): Double; safecall;
    function GetTriangleCount: Integer; safecall;
    function GetTriangleAtIndex(index: Integer): OleVariant; safecall;
    function IGetTriangleAtIndex(index: Integer): Double; safecall;
    function IsAttached: WordBool; safecall;
    function HasExtraLeader: WordBool; safecall;
    function GetLeaderCount: Integer; safecall;
    function GetLeaderAtIndex(index: Integer): OleVariant; safecall;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; safecall;
    function IGetArrowHeadInfo: Double; safecall;
    function GetArrowHeadInfo: OleVariant; safecall;
    function GetAnnotation: IDispatch; safecall;
    function IGetAnnotation: IAnnotation; safecall;
    function GetText(whichText: Integer): WideString; safecall;
    function GetContour(top: WordBool): Integer; safecall;
    function GetSymmetric: Integer; safecall;
    function GetPeripheral: WordBool; safecall;
    function GetFieldWeld: Integer; safecall;
    function GetProcess: WordBool; safecall;
    function GetProcessReference: WordBool; safecall;
    function GetStagger: WordBool; safecall;
    function SetText(top: WordBool; const left: WideString; const symbol: WideString; 
                     const right: WideString; const stagger: WideString; contour: Integer): WordBool; safecall;
    function SetSymmetric(symmetric: Integer): WordBool; safecall;
    function SetPeripheral(peripheral: WordBool): WordBool; safecall;
    function SetFieldWeld(fieldWeld: Integer): WordBool; safecall;
    function SetProcess(process: WordBool; const text: WideString; reference: WordBool): WordBool; safecall;
    function SetStagger(stagger: WordBool): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IWeldSymbolDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D94-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IWeldSymbolDisp = dispinterface
    ['{83A33D94-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: IWeldSymbol; dispid 2;
    function GetTextCount: Integer; dispid 3;
    function GetTextAtIndex(index: Integer): WideString; dispid 4;
    function GetTextHeightAtIndex(index: Integer): Double; dispid 5;
    function GetTextPositionAtIndex(index: Integer): OleVariant; dispid 6;
    function IGetTextPositionAtIndex(index: Integer): Double; dispid 7;
    function GetTextAngleAtIndex(index: Integer): Double; dispid 8;
    function GetTextRefPositionAtIndex(index: Integer): Integer; dispid 9;
    function GetTextInvertAtIndex(index: Integer): Integer; dispid 10;
    function GetLineCount: Integer; dispid 11;
    function GetLineAtIndex(index: Integer): OleVariant; dispid 12;
    function IGetLineAtIndex(index: Integer): Double; dispid 13;
    function GetArcCount: Integer; dispid 14;
    function GetArcAtIndex(index: Integer): OleVariant; dispid 15;
    function IGetArcAtIndex(index: Integer): Double; dispid 16;
    function GetArrowHeadCount: Integer; dispid 17;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; dispid 18;
    function IGetArrowHeadAtIndex(index: Integer): Double; dispid 19;
    function GetTriangleCount: Integer; dispid 20;
    function GetTriangleAtIndex(index: Integer): OleVariant; dispid 21;
    function IGetTriangleAtIndex(index: Integer): Double; dispid 22;
    function IsAttached: WordBool; dispid 23;
    function HasExtraLeader: WordBool; dispid 24;
    function GetLeaderCount: Integer; dispid 25;
    function GetLeaderAtIndex(index: Integer): OleVariant; dispid 26;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; dispid 27;
    function IGetArrowHeadInfo: Double; dispid 28;
    function GetArrowHeadInfo: OleVariant; dispid 29;
    function GetAnnotation: IDispatch; dispid 30;
    function IGetAnnotation: IAnnotation; dispid 31;
    function GetText(whichText: Integer): WideString; dispid 32;
    function GetContour(top: WordBool): Integer; dispid 33;
    function GetSymmetric: Integer; dispid 34;
    function GetPeripheral: WordBool; dispid 35;
    function GetFieldWeld: Integer; dispid 36;
    function GetProcess: WordBool; dispid 37;
    function GetProcessReference: WordBool; dispid 38;
    function GetStagger: WordBool; dispid 39;
    function SetText(top: WordBool; const left: WideString; const symbol: WideString; 
                     const right: WideString; const stagger: WideString; contour: Integer): WordBool; dispid 40;
    function SetSymmetric(symmetric: Integer): WordBool; dispid 41;
    function SetPeripheral(peripheral: WordBool): WordBool; dispid 42;
    function SetFieldWeld(fieldWeld: Integer): WordBool; dispid 43;
    function SetProcess(process: WordBool; const text: WideString; reference: WordBool): WordBool; dispid 44;
    function SetStagger(stagger: WordBool): WordBool; dispid 45;
  end;

// *********************************************************************//
// Interface: ICThread
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D9E-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ICThread = interface(IDispatch)
    ['{83A33D9E-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: ICThread; safecall;
    function GetDisplayData: IDispatch; safecall;
    function IGetDisplayData: IDisplayData; safecall;
    function GetAnnotation: IDispatch; safecall;
    function IGetAnnotation: IAnnotation; safecall;
  end;

// *********************************************************************//
// DispIntf:  ICThreadDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D9E-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ICThreadDisp = dispinterface
    ['{83A33D9E-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: ICThread; dispid 2;
    function GetDisplayData: IDispatch; dispid 3;
    function IGetDisplayData: IDisplayData; dispid 4;
    function GetAnnotation: IDispatch; dispid 5;
    function IGetAnnotation: IAnnotation; dispid 6;
  end;

// *********************************************************************//
// Interface: IBomTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D82-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IBomTable = interface(IDispatch)
    ['{83A33D82-27C5-11CE-BFD4-00400513BB57}']
    function GetExtent: OleVariant; safecall;
    function IGetExtent: Double; safecall;
    function GetRowCount: Integer; safecall;
    function GetColumnCount: Integer; safecall;
    function GetHeaderText(col: Integer): WideString; safecall;
    function GetEntryText(row: Integer; col: Integer): WideString; safecall;
    procedure Attach; safecall;
    procedure Detach; safecall;
    function GetColumnWidth(col: Integer): Double; safecall;
    function GetRowHeight(row: Integer): Double; safecall;
    function GetEntryValue(row: Integer; col: Integer): OleVariant; safecall;
    function Attach2: WordBool; safecall;
    function GetDisplayData: IDispatch; safecall;
    function IGetDisplayData: IDisplayData; safecall;
    function IsVisible: WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IBomTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D82-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IBomTableDisp = dispinterface
    ['{83A33D82-27C5-11CE-BFD4-00400513BB57}']
    function GetExtent: OleVariant; dispid 1;
    function IGetExtent: Double; dispid 2;
    function GetRowCount: Integer; dispid 3;
    function GetColumnCount: Integer; dispid 4;
    function GetHeaderText(col: Integer): WideString; dispid 5;
    function GetEntryText(row: Integer; col: Integer): WideString; dispid 6;
    procedure Attach; dispid 7;
    procedure Detach; dispid 8;
    function GetColumnWidth(col: Integer): Double; dispid 9;
    function GetRowHeight(row: Integer): Double; dispid 10;
    function GetEntryValue(row: Integer; col: Integer): OleVariant; dispid 11;
    function Attach2: WordBool; dispid 12;
    function GetDisplayData: IDispatch; dispid 13;
    function IGetDisplayData: IDisplayData; dispid 14;
    function IsVisible: WordBool; dispid 15;
  end;

// *********************************************************************//
// Interface: ICustomSymbol
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DB5-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ICustomSymbol = interface(IDispatch)
    ['{83A33DB5-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; safecall;
    function IGetNext: ICustomSymbol; safecall;
    function GetTextCount: Integer; safecall;
    function GetTextAtIndex(index: Integer): WideString; safecall;
    function GetTextHeightAtIndex(index: Integer): Double; safecall;
    function GetTextPositionAtIndex(index: Integer): OleVariant; safecall;
    function IGetTextPositionAtIndex(index: Integer): Double; safecall;
    function GetTextAngleAtIndex(index: Integer): Double; safecall;
    function GetTextRefPositionAtIndex(index: Integer): Integer; safecall;
    function GetTextInvertAtIndex(index: Integer): Integer; safecall;
    function GetLineCount: Integer; safecall;
    function GetLineAtIndex(index: Integer): OleVariant; safecall;
    function IGetLineAtIndex(index: Integer): Double; safecall;
    function GetArcCount: Integer; safecall;
    function GetArcAtIndex(index: Integer): OleVariant; safecall;
    function IGetArcAtIndex(index: Integer): Double; safecall;
    function GetArrowHeadCount: Integer; safecall;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; safecall;
    function IGetArrowHeadAtIndex(index: Integer): Double; safecall;
    function GetTriangleCount: Integer; safecall;
    function GetTriangleAtIndex(index: Integer): OleVariant; safecall;
    function IGetTriangleAtIndex(index: Integer): Double; safecall;
    function GetSketch: IDispatch; safecall;
    function IGetSketch: ISketch; safecall;
    function GetSketchPosition: OleVariant; safecall;
    function IGetSketchPosition: Double; safecall;
    function IsAttached: WordBool; safecall;
    function HasExtraLeader: WordBool; safecall;
    function GetLeaderCount: Integer; safecall;
    function GetLeaderAtIndex(index: Integer): OleVariant; safecall;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; safecall;
    function IGetArrowHeadInfo: Double; safecall;
    function GetArrowHeadInfo: OleVariant; safecall;
    function GetAnnotation: IDispatch; safecall;
    function IGetAnnotation: IAnnotation; safecall;
    function Get_angle: Double; safecall;
    procedure Set_angle(retval: Double); safecall;
    function Get_Scale2: Double; safecall;
    procedure Set_Scale2(retval: Double); safecall;
    function GetText(index: Integer): WideString; safecall;
    function SetText(index: Integer; const text: WideString): WordBool; safecall;
    function GetTextJustificationAtIndex(index: Integer): Integer; safecall;
    procedure SetTextJustificationAtIndex(index: Integer; justification: Integer); safecall;
    function GetTextLineSpacingAtIndex(index: Integer): Double; safecall;
    property angle: Double read Get_angle write Set_angle;
    property Scale2: Double read Get_Scale2 write Set_Scale2;
  end;

// *********************************************************************//
// DispIntf:  ICustomSymbolDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DB5-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ICustomSymbolDisp = dispinterface
    ['{83A33DB5-27C5-11CE-BFD4-00400513BB57}']
    function GetNext: IDispatch; dispid 1;
    function IGetNext: ICustomSymbol; dispid 2;
    function GetTextCount: Integer; dispid 3;
    function GetTextAtIndex(index: Integer): WideString; dispid 4;
    function GetTextHeightAtIndex(index: Integer): Double; dispid 5;
    function GetTextPositionAtIndex(index: Integer): OleVariant; dispid 6;
    function IGetTextPositionAtIndex(index: Integer): Double; dispid 7;
    function GetTextAngleAtIndex(index: Integer): Double; dispid 8;
    function GetTextRefPositionAtIndex(index: Integer): Integer; dispid 9;
    function GetTextInvertAtIndex(index: Integer): Integer; dispid 10;
    function GetLineCount: Integer; dispid 11;
    function GetLineAtIndex(index: Integer): OleVariant; dispid 12;
    function IGetLineAtIndex(index: Integer): Double; dispid 13;
    function GetArcCount: Integer; dispid 14;
    function GetArcAtIndex(index: Integer): OleVariant; dispid 15;
    function IGetArcAtIndex(index: Integer): Double; dispid 16;
    function GetArrowHeadCount: Integer; dispid 17;
    function GetArrowHeadAtIndex(index: Integer): OleVariant; dispid 18;
    function IGetArrowHeadAtIndex(index: Integer): Double; dispid 19;
    function GetTriangleCount: Integer; dispid 20;
    function GetTriangleAtIndex(index: Integer): OleVariant; dispid 21;
    function IGetTriangleAtIndex(index: Integer): Double; dispid 22;
    function GetSketch: IDispatch; dispid 23;
    function IGetSketch: ISketch; dispid 24;
    function GetSketchPosition: OleVariant; dispid 25;
    function IGetSketchPosition: Double; dispid 26;
    function IsAttached: WordBool; dispid 27;
    function HasExtraLeader: WordBool; dispid 28;
    function GetLeaderCount: Integer; dispid 29;
    function GetLeaderAtIndex(index: Integer): OleVariant; dispid 30;
    function IGetLeaderAtIndex(index: Integer; out pointCount: Integer): Double; dispid 31;
    function IGetArrowHeadInfo: Double; dispid 32;
    function GetArrowHeadInfo: OleVariant; dispid 33;
    function GetAnnotation: IDispatch; dispid 34;
    function IGetAnnotation: IAnnotation; dispid 35;
    property angle: Double dispid 36;
    property Scale2: Double dispid 37;
    function GetText(index: Integer): WideString; dispid 38;
    function SetText(index: Integer; const text: WideString): WordBool; dispid 39;
    function GetTextJustificationAtIndex(index: Integer): Integer; dispid 40;
    procedure SetTextJustificationAtIndex(index: Integer; justification: Integer); dispid 41;
    function GetTextLineSpacingAtIndex(index: Integer): Double; dispid 42;
  end;

// *********************************************************************//
// Interface: IDrSection
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F183A33F-D4DB-11D3-AEB2-00C04F603FAF}
// *********************************************************************//
  IDrSection = interface(IDispatch)
    ['{F183A33F-D4DB-11D3-AEB2-00C04F603FAF}']
    function GetView: IDispatch; safecall;
    function IGetView: IView; safecall;
    function GetSectionView: IDispatch; safecall;
    function IGetSectionView: IView; safecall;
    function GetLabel: WideString; safecall;
    function SetLabel(const label_: WideString): WordBool; safecall;
    function GetUseDocTextFormat: WordBool; safecall;
    function GetTextFormat: IDispatch; safecall;
    function IGetTextFormat: ITextFormat; safecall;
    function SetTextFormat(useDoc: WordBool; const textFormat: IDispatch): WordBool; safecall;
    function ISetTextFormat(useDoc: WordBool; const textFormat: ITextFormat): WordBool; safecall;
    function GetReversedCutDirection: WordBool; safecall;
    procedure SetReversedCutDirection(reversed: WordBool); safecall;
    function GetScaleWithModelChanges: WordBool; safecall;
    procedure SetScaleWithModelChanges(scaleWithChanges: WordBool); safecall;
    function GetPartialSection: WordBool; safecall;
    procedure SetPartialSection(partial: WordBool); safecall;
    function GetDisplayOnlySurfaceCut: WordBool; safecall;
    procedure SetDisplayOnlySurfaceCut(Display: WordBool); safecall;
    function IsAligned: WordBool; safecall;
    function GetName: WideString; safecall;
    function GetTextInfo: OleVariant; safecall;
    function IGetTextInfo: Double; safecall;
    function GetArrowInfo: OleVariant; safecall;
    function IGetArrowInfo: Double; safecall;
    function GetExcludedComponents: OleVariant; safecall;
    function EnumExcludedComponents: IEnumComponents; safecall;
    function GetAutoHatch: WordBool; safecall;
    procedure SetAutoHatch(autoHatch: WordBool); safecall;
    function IGetLineSegmentCount: Integer; safecall;
    function GetLineInfo: OleVariant; safecall;
    function IGetLineInfo: Double; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDrSectionDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F183A33F-D4DB-11D3-AEB2-00C04F603FAF}
// *********************************************************************//
  IDrSectionDisp = dispinterface
    ['{F183A33F-D4DB-11D3-AEB2-00C04F603FAF}']
    function GetView: IDispatch; dispid 1;
    function IGetView: IView; dispid 2;
    function GetSectionView: IDispatch; dispid 3;
    function IGetSectionView: IView; dispid 4;
    function GetLabel: WideString; dispid 5;
    function SetLabel(const label_: WideString): WordBool; dispid 6;
    function GetUseDocTextFormat: WordBool; dispid 7;
    function GetTextFormat: IDispatch; dispid 8;
    function IGetTextFormat: ITextFormat; dispid 9;
    function SetTextFormat(useDoc: WordBool; const textFormat: IDispatch): WordBool; dispid 10;
    function ISetTextFormat(useDoc: WordBool; const textFormat: ITextFormat): WordBool; dispid 11;
    function GetReversedCutDirection: WordBool; dispid 12;
    procedure SetReversedCutDirection(reversed: WordBool); dispid 13;
    function GetScaleWithModelChanges: WordBool; dispid 14;
    procedure SetScaleWithModelChanges(scaleWithChanges: WordBool); dispid 15;
    function GetPartialSection: WordBool; dispid 16;
    procedure SetPartialSection(partial: WordBool); dispid 17;
    function GetDisplayOnlySurfaceCut: WordBool; dispid 18;
    procedure SetDisplayOnlySurfaceCut(Display: WordBool); dispid 19;
    function IsAligned: WordBool; dispid 20;
    function GetName: WideString; dispid 21;
    function GetTextInfo: OleVariant; dispid 22;
    function IGetTextInfo: Double; dispid 23;
    function GetArrowInfo: OleVariant; dispid 24;
    function IGetArrowInfo: Double; dispid 25;
    function GetExcludedComponents: OleVariant; dispid 26;
    function EnumExcludedComponents: IEnumComponents; dispid 27;
    function GetAutoHatch: WordBool; dispid 28;
    procedure SetAutoHatch(autoHatch: WordBool); dispid 29;
    function IGetLineSegmentCount: Integer; dispid 30;
    function GetLineInfo: OleVariant; dispid 31;
    function IGetLineInfo: Double; dispid 32;
  end;

// *********************************************************************//
// Interface: IEnumComponents
// Flags:     (272) Hidden OleAutomation
// GUID:      {51EFB944-D449-11D3-AEBE-00C04F683CBA}
// *********************************************************************//
  IEnumComponents = interface(IUnknown)
    ['{51EFB944-D449-11D3-AEBE-00C04F683CBA}']
    function Next(celt: Integer; out rgelt: IComponent; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumComponents): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumDrSections
// Flags:     (272) Hidden OleAutomation
// GUID:      {585A6A15-E95B-11D3-AEBC-00C04F603FAF}
// *********************************************************************//
  IEnumDrSections = interface(IUnknown)
    ['{585A6A15-E95B-11D3-AEBC-00C04F603FAF}']
    function Next(celt: Integer; out rgelt: IDrSection; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumDrSections): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IDetailCircle
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4B65A34A-4C44-11D4-AEF6-00C04F683CBA}
// *********************************************************************//
  IDetailCircle = interface(IDispatch)
    ['{4B65A34A-4C44-11D4-AEF6-00C04F683CBA}']
    function GetView: IView; safecall;
    function GetDetailView: IView; safecall;
    function GetLabel: WideString; safecall;
    function GetTextFormat: ITextFormat; safecall;
    function GetName: WideString; safecall;
    function GetArrowInfo: OleVariant; safecall;
    function IGetArrowInfo: Double; safecall;
    function GetStyle: Integer; safecall;
    function GetDisplay: Integer; safecall;
    function GetConnectingLine: OleVariant; safecall;
    function IGetConnectingLine: Double; safecall;
    function HasFullOutline: WordBool; safecall;
    function GetLeaderInfo: OleVariant; safecall;
    function IGetLeaderInfo: Double; safecall;
    function GetUseDocTextFormat: WordBool; safecall;
    function SetTextFormat(useDoc: WordBool; const textFormat: ITextFormat): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDetailCircleDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4B65A34A-4C44-11D4-AEF6-00C04F683CBA}
// *********************************************************************//
  IDetailCircleDisp = dispinterface
    ['{4B65A34A-4C44-11D4-AEF6-00C04F683CBA}']
    function GetView: IView; dispid 1;
    function GetDetailView: IView; dispid 2;
    function GetLabel: WideString; dispid 3;
    function GetTextFormat: ITextFormat; dispid 4;
    function GetName: WideString; dispid 5;
    function GetArrowInfo: OleVariant; dispid 6;
    function IGetArrowInfo: Double; dispid 7;
    function GetStyle: Integer; dispid 8;
    function GetDisplay: Integer; dispid 9;
    function GetConnectingLine: OleVariant; dispid 10;
    function IGetConnectingLine: Double; dispid 11;
    function HasFullOutline: WordBool; dispid 12;
    function GetLeaderInfo: OleVariant; dispid 13;
    function IGetLeaderInfo: Double; dispid 14;
    function GetUseDocTextFormat: WordBool; dispid 15;
    function SetTextFormat(useDoc: WordBool; const textFormat: ITextFormat): WordBool; dispid 16;
  end;

// *********************************************************************//
// Interface: IProjectionArrow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A2227E65-A3A7-11D4-AEFF-00C04F603FAF}
// *********************************************************************//
  IProjectionArrow = interface(IDispatch)
    ['{A2227E65-A3A7-11D4-AEFF-00C04F603FAF}']
    function GetView: IDispatch; safecall;
    function IGetView: IView; safecall;
    function GetProjectedView: IDispatch; safecall;
    function IGetProjectedView: IView; safecall;
    function GetLabel: WideString; safecall;
    function SetLabel(const label_: WideString): WordBool; safecall;
    function GetUseDocTextFormat: WordBool; safecall;
    function GetTextFormat: IDispatch; safecall;
    function IGetTextFormat: ITextFormat; safecall;
    function GetCoordinates: OleVariant; safecall;
    function IGetCoordinates: Double; safecall;
  end;

// *********************************************************************//
// DispIntf:  IProjectionArrowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A2227E65-A3A7-11D4-AEFF-00C04F603FAF}
// *********************************************************************//
  IProjectionArrowDisp = dispinterface
    ['{A2227E65-A3A7-11D4-AEFF-00C04F603FAF}']
    function GetView: IDispatch; dispid 1;
    function IGetView: IView; dispid 2;
    function GetProjectedView: IDispatch; dispid 3;
    function IGetProjectedView: IView; dispid 4;
    function GetLabel: WideString; dispid 5;
    function SetLabel(const label_: WideString): WordBool; dispid 6;
    function GetUseDocTextFormat: WordBool; dispid 7;
    function GetTextFormat: IDispatch; dispid 8;
    function IGetTextFormat: ITextFormat; dispid 9;
    function GetCoordinates: OleVariant; dispid 10;
    function IGetCoordinates: Double; dispid 11;
  end;

// *********************************************************************//
// Interface: ISheet
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D80-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISheet = interface(IDispatch)
    ['{83A33D80-27C5-11CE-BFD4-00400513BB57}']
    function GetBomTable: IDispatch; safecall;
    function IGetBomTable: IBomTable; safecall;
    function GetName: WideString; safecall;
    procedure SetName(const nameIn: WideString); safecall;
    function GetTemplateName: WideString; safecall;
    procedure SetTemplateName(const nameIn: WideString); safecall;
    function GetProperties: OleVariant; safecall;
    function IGetProperties: Double; safecall;
    procedure SetProperties(paperSz: Integer; templ: Integer; scale1: Double; Scale2: Double; 
                            firstAngle: WordBool; Width: Double; height: Double); safecall;
    function GetCustomColorsCount: Integer; safecall;
    function IGetCustomColors: Integer; safecall;
    function GetOLEObjectCount: Integer; safecall;
    function GetOLEObjectSettings(index: Integer; var byteCount: Integer; var aspect: Integer): OleVariant; safecall;
    function IGetOLEObjectSettings(index: Integer; var byteCount: Integer; var aspect: Integer; 
                                   var position: Double): WordBool; safecall;
    function GetOLEObjectData(index: Integer): OleVariant; safecall;
    function IGetOLEObjectData(index: Integer; var buffer: Byte): WordBool; safecall;
    function CreateOLEObject(aspect: Integer; position: OleVariant; buffer: OleVariant): WordBool; safecall;
    function ICreateOLEObject(aspect: Integer; var position: Double; byteCount: Integer; 
                              var buffer: Byte): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISheetDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D80-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISheetDisp = dispinterface
    ['{83A33D80-27C5-11CE-BFD4-00400513BB57}']
    function GetBomTable: IDispatch; dispid 1;
    function IGetBomTable: IBomTable; dispid 2;
    function GetName: WideString; dispid 3;
    procedure SetName(const nameIn: WideString); dispid 4;
    function GetTemplateName: WideString; dispid 5;
    procedure SetTemplateName(const nameIn: WideString); dispid 6;
    function GetProperties: OleVariant; dispid 7;
    function IGetProperties: Double; dispid 8;
    procedure SetProperties(paperSz: Integer; templ: Integer; scale1: Double; Scale2: Double; 
                            firstAngle: WordBool; Width: Double; height: Double); dispid 9;
    function GetCustomColorsCount: Integer; dispid 10;
    function IGetCustomColors: Integer; dispid 11;
    function GetOLEObjectCount: Integer; dispid 12;
    function GetOLEObjectSettings(index: Integer; var byteCount: Integer; var aspect: Integer): OleVariant; dispid 13;
    function IGetOLEObjectSettings(index: Integer; var byteCount: Integer; var aspect: Integer; 
                                   var position: Double): WordBool; dispid 14;
    function GetOLEObjectData(index: Integer): OleVariant; dispid 15;
    function IGetOLEObjectData(index: Integer; var buffer: Byte): WordBool; dispid 16;
    function CreateOLEObject(aspect: Integer; position: OleVariant; buffer: OleVariant): WordBool; dispid 17;
    function ICreateOLEObject(aspect: Integer; var position: Double; byteCount: Integer; 
                              var buffer: Byte): WordBool; dispid 18;
  end;

// *********************************************************************//
// Interface: IModeler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D73-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IModeler = interface(IDispatch)
    ['{83A33D73-27C5-11CE-BFD4-00400513BB57}']
    function CreateBodyFromBox(boxDimArray: OleVariant): IDispatch; safecall;
    function ICreateBodyFromBox(var boxDimArray: Double): IBody; safecall;
    function SetTolerances(var ToleranceIDArray: Integer; var ToleranceValueArray: Double; 
                           NumTol: Integer): WordBool; safecall;
    function UnsetTolerances(var ToleranceIDArray: Integer; NumTol: Integer): WordBool; safecall;
    function Restore(const streamIn: IUnknown): IDispatch; safecall;
    function IRestore(const streamIn: IUnknown): IBody; safecall;
    function SetInitKnitGapWidth(InitGapWidth: Double): WordBool; safecall;
    function GetInitKnitGapWidth: Double; safecall;
    function CreateBodyFromCyl(cylDimArray: OleVariant): IDispatch; safecall;
    function ICreateBodyFromCyl(var cylDimArray: Double): IBody; safecall;
    function CreateBodyFromCone(coneDimArray: OleVariant): IDispatch; safecall;
    function ICreateBodyFromCone(var coneDimArray: Double): IBody; safecall;
    function CreateBrepBody(type_: SYSINT; nTopologies: SYSINT; topologies: OleVariant; 
                            edgeToleranceArray: OleVariant; vertexToleranceArray: OleVariant; 
                            pointArray: OleVariant; curveArray: OleVariant; 
                            surfaceArray: OleVariant; nRelations: SYSINT; parents: OleVariant; 
                            children: OleVariant; senses: OleVariant): IDispatch; safecall;
    function ICreateBrepBody(type_: SYSINT; nTopologies: SYSINT; var topologies: SYSINT; 
                             var edgeTolArray: Double; var vertexTolArray: Double; 
                             var pointArray: Double; var curveArray: ICurve; 
                             var surfaceArray: ISurface; nRelations: SYSINT; var parents: SYSINT; 
                             var children: SYSINT; var senses: SYSINT): IBody; safecall;
    function CreatePlanarSurface(vRootPoint: OleVariant; vNormal: OleVariant): IDispatch; safecall;
    function ICreatePlanarSurface(var rootPoint: Double; var Normal: Double): ISurface; safecall;
    function CreateExtrusionSurface(const profileCurve: IDispatch; axisDirection: OleVariant): IDispatch; safecall;
    function ICreateExtrusionSurface(const profileCurve: ICurve; var axisDirection: Double): ISurface; safecall;
    function CreateRevolutionSurface(const profileCurve: IDispatch; axisPoint: OleVariant; 
                                     axisDirection: OleVariant; profileEndPtParams: OleVariant): IDispatch; safecall;
    function ICreateRevolutionSurface(const profileCurve: ICurve; var axisPoint: Double; 
                                      var axisDirection: Double; var profileEndPtParams: Double): ISurface; safecall;
    function CreateBsplineSurface(props: OleVariant; uKnots: OleVariant; vKnots: OleVariant; 
                                  ctrlPtCoords: OleVariant): IDispatch; safecall;
    function ICreateBsplineSurface(var Properties: Integer; var UKnotArray: Double; 
                                   var VKnotArray: Double; var ControlPointCoordArray: Double): ISurface; safecall;
    function CreateOffsetSurface(const surfaceIn: IDispatch; distance: Double): IDispatch; safecall;
    function ICreateOffsetSurface(const surfaceIn: ISurface; distance: Double): ISurface; safecall;
    function CreateLine(rootPoint: OleVariant; direction: OleVariant): IDispatch; safecall;
    function ICreateLine(var rootPoint: Double; var direction: Double): ICurve; safecall;
    function CreateArc(center: OleVariant; axis: OleVariant; radius: Double; 
                       startPoint: OleVariant; endPoint: OleVariant): IDispatch; safecall;
    function ICreateArc(var center: Double; var axis: Double; radius: Double; 
                        var startPoint: Double; var endPoint: Double): ICurve; safecall;
    function CreateBsplineCurve(props: OleVariant; Knots: OleVariant; ctrlPtCoords: OleVariant): IDispatch; safecall;
    function ICreateBsplineCurve(var Properties: Integer; var KnotArray: Double; 
                                 var ControlPointCoordArray: Double): ICurve; safecall;
    function CreatePCurve(const surface: IDispatch; props: OleVariant; Knots: OleVariant; 
                          ctrlPtCoords: OleVariant): IDispatch; safecall;
    function ICreatePCurve(const surface: ISurface; var props: Integer; var Knots: Double; 
                           var ctrlPtCoords: Double): ICurve; safecall;
    function CreateBodiesFromSheets(sheets: OleVariant; options: Integer; var error: Integer): OleVariant; safecall;
    function ICreateBodiesFromSheets(nSheets: Integer; var sheets: IUnknown; options: Integer; 
                                     var nResults: Integer; var results: IUnknown): Integer; safecall;
    function ICreateBodyFromFaces(NumOfFaces: Integer; var faces: IFace; doLocalCheck: WordBool; 
                                  var localCheckResult: WordBool): IBody; safecall;
    function FindTwoEdgeMaxDeviation(const lpEdge1: IDispatch; const lpEdge2: IDispatch): Double; safecall;
    function IFindTwoEdgeMaxDeviation(const pEdge1: IEdge; const pEdge2: IEdge): Double; safecall;
    function CreateConicalSurface(center: OleVariant; direction: OleVariant; radius: Double; 
                                  semiAngle: Double): IDispatch; safecall;
    function ICreateConicalSurface(var center: Double; var direction: Double; radius: Double; 
                                   semiAngle: Double): ISurface; safecall;
    function CreateCylindricalSurface(center: OleVariant; direction: OleVariant; radius: Double): IDispatch; safecall;
    function ICreateCylindricalSurface(var center: Double; var direction: Double; radius: Double): ISurface; safecall;
    function CreateSphericalSurface(center: OleVariant; radius: Double): IDispatch; safecall;
    function ICreateSphericalSurface(var center: Double; radius: Double): ISurface; safecall;
    function CreateToroidalSurface(center: OleVariant; axis: OleVariant; refDirection: OleVariant; 
                                   majorRadius: Double; minorRadius: Double): IDispatch; safecall;
    function ICreateToroidalSurface(var center: Double; var axis: Double; var refDirection: Double; 
                                    majorRadius: Double; minorRadius: Double): ISurface; safecall;
    function CreateBodyFromFaces2(NumOfFaces: Integer; faces: OleVariant; actionType: Integer; 
                                  doLocalCheck: WordBool; out localCheckResult: WordBool): IDispatch; safecall;
    function ICreateBodyFromFaces2(NumOfFaces: Integer; var faces: IFace; actionType: Integer; 
                                   doLocalCheck: WordBool; out localCheckResult: WordBool): IBody; safecall;
    function SetToleranceValue(ToleranceID: Integer; NewToleranceValue: Double): Double; safecall;
    function GetToleranceValue(ToleranceID: Integer): Double; safecall;
    function CreateSheetFromSurface(const surfaceIn: IDispatch; uvRange: OleVariant): IDispatch; safecall;
    function ICreateSheetFromSurface(const surfaceIn: ISurface; var uvRange: Double): IBody; safecall;
    function ImprintingFaces(targetFaceArray: OleVariant; toolFaceArray: OleVariant; 
                             options: Integer; out targetEdges: OleVariant; 
                             out toolEdges: OleVariant; out targetVertices: OleVariant; 
                             out toolVertices: OleVariant): WordBool; safecall;
    procedure IImprintingFaces(out targetEdges: IEdge; out toolEdges: IEdge; 
                               out targetVertices: IVertex; out toolVertices: IVertex); safecall;
    function IImprintingFacesCount(nTargetFaces: Integer; var targetFaceArray: IFace; 
                                   nToolFaces: Integer; var toolFaceArray: IFace; options: Integer; 
                                   out nTargetEdges: Integer; out ntoolEdges: Integer; 
                                   out ntargetVertices: Integer; out toolVertices: Integer): WordBool; safecall;
    function CreateSweptSurface(const curveIn: IDispatch; dir: OleVariant): IDispatch; safecall;
    function ICreateSweptSurface(const curveIn: ICurve; var dir: Double): ISurface; safecall;
    function ReplaceSurfaces(nFaces: Integer; faceArray: OleVariant; newSurfArray: OleVariant; 
                             senseArray: OleVariant; tolerance: Double): WordBool; safecall;
    function IReplaceSurfaces(nFaces: Integer; var faceArray: IFace; var newSurfArray: ISurface; 
                              var senseArray: SYSINT; tolerance: Double): WordBool; safecall;
    function SplitFaceOnParam(const facedisp: IDispatch; UVFlag: Integer; Parameter: Double; 
                              out status: WordBool): OleVariant; safecall;
    function ISplitFaceOnParamCount(const facedisp: IFace; UVFlag: Integer; Parameter: Double; 
                                    out status: WordBool): Integer; safecall;
    function ISplitFaceOnParam: IFace; safecall;
    function CheckInterference(const body1: IDispatch; const body2: IDispatch; 
                               coincidentInterference: WordBool; 
                               out body1InterferedFaceArray: OleVariant; 
                               out body2InterferedFaceArray: OleVariant; 
                               out intersectedBodyArray: OleVariant): WordBool; safecall;
    function ICheckInterferenceCount(const body1: IBody; const body2: IBody; 
                                     coincidentInterference: WordBool; 
                                     out body1InterferedFaceCount: Integer; 
                                     out body2InterferedFaceCount: Integer; 
                                     out intersectedBodyCount: Integer): WordBool; safecall;
    procedure ICheckInterference(out body1InterferedFaceArray: IFace; 
                                 out body2InterferedFaceArray: IFace; 
                                 out intersectedBodyArray: IBody); safecall;
  end;

// *********************************************************************//
// DispIntf:  IModelerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D73-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IModelerDisp = dispinterface
    ['{83A33D73-27C5-11CE-BFD4-00400513BB57}']
    function CreateBodyFromBox(boxDimArray: OleVariant): IDispatch; dispid 1;
    function ICreateBodyFromBox(var boxDimArray: Double): IBody; dispid 2;
    function SetTolerances(var ToleranceIDArray: Integer; var ToleranceValueArray: Double; 
                           NumTol: Integer): WordBool; dispid 3;
    function UnsetTolerances(var ToleranceIDArray: Integer; NumTol: Integer): WordBool; dispid 4;
    function Restore(const streamIn: IUnknown): IDispatch; dispid 5;
    function IRestore(const streamIn: IUnknown): IBody; dispid 6;
    function SetInitKnitGapWidth(InitGapWidth: Double): WordBool; dispid 7;
    function GetInitKnitGapWidth: Double; dispid 8;
    function CreateBodyFromCyl(cylDimArray: OleVariant): IDispatch; dispid 9;
    function ICreateBodyFromCyl(var cylDimArray: Double): IBody; dispid 10;
    function CreateBodyFromCone(coneDimArray: OleVariant): IDispatch; dispid 11;
    function ICreateBodyFromCone(var coneDimArray: Double): IBody; dispid 12;
    function CreateBrepBody(type_: SYSINT; nTopologies: SYSINT; topologies: OleVariant; 
                            edgeToleranceArray: OleVariant; vertexToleranceArray: OleVariant; 
                            pointArray: OleVariant; curveArray: OleVariant; 
                            surfaceArray: OleVariant; nRelations: SYSINT; parents: OleVariant; 
                            children: OleVariant; senses: OleVariant): IDispatch; dispid 13;
    function ICreateBrepBody(type_: SYSINT; nTopologies: SYSINT; var topologies: SYSINT; 
                             var edgeTolArray: Double; var vertexTolArray: Double; 
                             var pointArray: Double; var curveArray: ICurve; 
                             var surfaceArray: ISurface; nRelations: SYSINT; var parents: SYSINT; 
                             var children: SYSINT; var senses: SYSINT): IBody; dispid 14;
    function CreatePlanarSurface(vRootPoint: OleVariant; vNormal: OleVariant): IDispatch; dispid 15;
    function ICreatePlanarSurface(var rootPoint: Double; var Normal: Double): ISurface; dispid 16;
    function CreateExtrusionSurface(const profileCurve: IDispatch; axisDirection: OleVariant): IDispatch; dispid 17;
    function ICreateExtrusionSurface(const profileCurve: ICurve; var axisDirection: Double): ISurface; dispid 18;
    function CreateRevolutionSurface(const profileCurve: IDispatch; axisPoint: OleVariant; 
                                     axisDirection: OleVariant; profileEndPtParams: OleVariant): IDispatch; dispid 19;
    function ICreateRevolutionSurface(const profileCurve: ICurve; var axisPoint: Double; 
                                      var axisDirection: Double; var profileEndPtParams: Double): ISurface; dispid 20;
    function CreateBsplineSurface(props: OleVariant; uKnots: OleVariant; vKnots: OleVariant; 
                                  ctrlPtCoords: OleVariant): IDispatch; dispid 21;
    function ICreateBsplineSurface(var Properties: Integer; var UKnotArray: Double; 
                                   var VKnotArray: Double; var ControlPointCoordArray: Double): ISurface; dispid 22;
    function CreateOffsetSurface(const surfaceIn: IDispatch; distance: Double): IDispatch; dispid 23;
    function ICreateOffsetSurface(const surfaceIn: ISurface; distance: Double): ISurface; dispid 24;
    function CreateLine(rootPoint: OleVariant; direction: OleVariant): IDispatch; dispid 25;
    function ICreateLine(var rootPoint: Double; var direction: Double): ICurve; dispid 26;
    function CreateArc(center: OleVariant; axis: OleVariant; radius: Double; 
                       startPoint: OleVariant; endPoint: OleVariant): IDispatch; dispid 27;
    function ICreateArc(var center: Double; var axis: Double; radius: Double; 
                        var startPoint: Double; var endPoint: Double): ICurve; dispid 28;
    function CreateBsplineCurve(props: OleVariant; Knots: OleVariant; ctrlPtCoords: OleVariant): IDispatch; dispid 29;
    function ICreateBsplineCurve(var Properties: Integer; var KnotArray: Double; 
                                 var ControlPointCoordArray: Double): ICurve; dispid 30;
    function CreatePCurve(const surface: IDispatch; props: OleVariant; Knots: OleVariant; 
                          ctrlPtCoords: OleVariant): IDispatch; dispid 31;
    function ICreatePCurve(const surface: ISurface; var props: Integer; var Knots: Double; 
                           var ctrlPtCoords: Double): ICurve; dispid 32;
    function CreateBodiesFromSheets(sheets: OleVariant; options: Integer; var error: Integer): OleVariant; dispid 33;
    function ICreateBodiesFromSheets(nSheets: Integer; var sheets: IUnknown; options: Integer; 
                                     var nResults: Integer; var results: IUnknown): Integer; dispid 34;
    function ICreateBodyFromFaces(NumOfFaces: Integer; var faces: IFace; doLocalCheck: WordBool; 
                                  var localCheckResult: WordBool): IBody; dispid 35;
    function FindTwoEdgeMaxDeviation(const lpEdge1: IDispatch; const lpEdge2: IDispatch): Double; dispid 36;
    function IFindTwoEdgeMaxDeviation(const pEdge1: IEdge; const pEdge2: IEdge): Double; dispid 37;
    function CreateConicalSurface(center: OleVariant; direction: OleVariant; radius: Double; 
                                  semiAngle: Double): IDispatch; dispid 38;
    function ICreateConicalSurface(var center: Double; var direction: Double; radius: Double; 
                                   semiAngle: Double): ISurface; dispid 39;
    function CreateCylindricalSurface(center: OleVariant; direction: OleVariant; radius: Double): IDispatch; dispid 40;
    function ICreateCylindricalSurface(var center: Double; var direction: Double; radius: Double): ISurface; dispid 41;
    function CreateSphericalSurface(center: OleVariant; radius: Double): IDispatch; dispid 42;
    function ICreateSphericalSurface(var center: Double; radius: Double): ISurface; dispid 43;
    function CreateToroidalSurface(center: OleVariant; axis: OleVariant; refDirection: OleVariant; 
                                   majorRadius: Double; minorRadius: Double): IDispatch; dispid 44;
    function ICreateToroidalSurface(var center: Double; var axis: Double; var refDirection: Double; 
                                    majorRadius: Double; minorRadius: Double): ISurface; dispid 45;
    function CreateBodyFromFaces2(NumOfFaces: Integer; faces: OleVariant; actionType: Integer; 
                                  doLocalCheck: WordBool; out localCheckResult: WordBool): IDispatch; dispid 46;
    function ICreateBodyFromFaces2(NumOfFaces: Integer; var faces: IFace; actionType: Integer; 
                                   doLocalCheck: WordBool; out localCheckResult: WordBool): IBody; dispid 47;
    function SetToleranceValue(ToleranceID: Integer; NewToleranceValue: Double): Double; dispid 48;
    function GetToleranceValue(ToleranceID: Integer): Double; dispid 49;
    function CreateSheetFromSurface(const surfaceIn: IDispatch; uvRange: OleVariant): IDispatch; dispid 50;
    function ICreateSheetFromSurface(const surfaceIn: ISurface; var uvRange: Double): IBody; dispid 51;
    function ImprintingFaces(targetFaceArray: OleVariant; toolFaceArray: OleVariant; 
                             options: Integer; out targetEdges: OleVariant; 
                             out toolEdges: OleVariant; out targetVertices: OleVariant; 
                             out toolVertices: OleVariant): WordBool; dispid 52;
    procedure IImprintingFaces(out targetEdges: IEdge; out toolEdges: IEdge; 
                               out targetVertices: IVertex; out toolVertices: IVertex); dispid 53;
    function IImprintingFacesCount(nTargetFaces: Integer; var targetFaceArray: IFace; 
                                   nToolFaces: Integer; var toolFaceArray: IFace; options: Integer; 
                                   out nTargetEdges: Integer; out ntoolEdges: Integer; 
                                   out ntargetVertices: Integer; out toolVertices: Integer): WordBool; dispid 54;
    function CreateSweptSurface(const curveIn: IDispatch; dir: OleVariant): IDispatch; dispid 55;
    function ICreateSweptSurface(const curveIn: ICurve; var dir: Double): ISurface; dispid 56;
    function ReplaceSurfaces(nFaces: Integer; faceArray: OleVariant; newSurfArray: OleVariant; 
                             senseArray: OleVariant; tolerance: Double): WordBool; dispid 57;
    function IReplaceSurfaces(nFaces: Integer; var faceArray: IFace; var newSurfArray: ISurface; 
                              var senseArray: SYSINT; tolerance: Double): WordBool; dispid 58;
    function SplitFaceOnParam(const facedisp: IDispatch; UVFlag: Integer; Parameter: Double; 
                              out status: WordBool): OleVariant; dispid 59;
    function ISplitFaceOnParamCount(const facedisp: IFace; UVFlag: Integer; Parameter: Double; 
                                    out status: WordBool): Integer; dispid 60;
    function ISplitFaceOnParam: IFace; dispid 61;
    function CheckInterference(const body1: IDispatch; const body2: IDispatch; 
                               coincidentInterference: WordBool; 
                               out body1InterferedFaceArray: OleVariant; 
                               out body2InterferedFaceArray: OleVariant; 
                               out intersectedBodyArray: OleVariant): WordBool; dispid 62;
    function ICheckInterferenceCount(const body1: IBody; const body2: IBody; 
                                     coincidentInterference: WordBool; 
                                     out body1InterferedFaceCount: Integer; 
                                     out body2InterferedFaceCount: Integer; 
                                     out intersectedBodyCount: Integer): WordBool; dispid 63;
    procedure ICheckInterference(out body1InterferedFaceArray: IFace; 
                                 out body2InterferedFaceArray: IFace; 
                                 out intersectedBodyArray: IBody); dispid 64;
  end;

// *********************************************************************//
// Interface: IEnvironment
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D78-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnvironment = interface(IDispatch)
    ['{83A33D78-27C5-11CE-BFD4-00400513BB57}']
    function GetSymEdgeCounts(const symId: WideString): OleVariant; safecall;
    function IGetSymEdgeCounts(const symId: WideString): Smallint; safecall;
    function GetSymLines(const symId: WideString): OleVariant; safecall;
    function IGetSymLines(const symId: WideString): Double; safecall;
    function GetSymArcs(const symId: WideString): OleVariant; safecall;
    function IGetSymArcs(const symId: WideString): Double; safecall;
    function GetSymCircles(const symId: WideString): OleVariant; safecall;
    function IGetSymCircles(const symId: WideString): Double; safecall;
    function GetSymTextPoints(const symId: WideString): OleVariant; safecall;
    function IGetSymTextPoints(const symId: WideString): Double; safecall;
    function GetSymText(const symId: WideString): OleVariant; safecall;
    function GetSymTriangles(const symId: WideString): OleVariant; safecall;
    function IGetSymTriangles(const symId: WideString): Double; safecall;
  end;

// *********************************************************************//
// DispIntf:  IEnvironmentDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D78-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnvironmentDisp = dispinterface
    ['{83A33D78-27C5-11CE-BFD4-00400513BB57}']
    function GetSymEdgeCounts(const symId: WideString): OleVariant; dispid 1;
    function IGetSymEdgeCounts(const symId: WideString): Smallint; dispid 2;
    function GetSymLines(const symId: WideString): OleVariant; dispid 3;
    function IGetSymLines(const symId: WideString): Double; dispid 4;
    function GetSymArcs(const symId: WideString): OleVariant; dispid 5;
    function IGetSymArcs(const symId: WideString): Double; dispid 6;
    function GetSymCircles(const symId: WideString): OleVariant; dispid 7;
    function IGetSymCircles(const symId: WideString): Double; dispid 8;
    function GetSymTextPoints(const symId: WideString): OleVariant; dispid 9;
    function IGetSymTextPoints(const symId: WideString): Double; dispid 10;
    function GetSymText(const symId: WideString): OleVariant; dispid 11;
    function GetSymTriangles(const symId: WideString): OleVariant; dispid 12;
    function IGetSymTriangles(const symId: WideString): Double; dispid 13;
  end;

// *********************************************************************//
// Interface: IEnumDocuments
// Flags:     (272) Hidden OleAutomation
// GUID:      {83A33DB3-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IEnumDocuments = interface(IUnknown)
    ['{83A33DB3-27C5-11CE-BFD4-00400513BB57}']
    function Next(celt: Integer; out rgelt: IModelDoc; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumDocuments): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMathUtility
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F7D97F80-162E-11D4-AEAB-00C04FA0AC51}
// *********************************************************************//
  IMathUtility = interface(IDispatch)
    ['{F7D97F80-162E-11D4-AEAB-00C04FA0AC51}']
    function CreateTransform(ArrayDataIn: OleVariant): IDispatch; safecall;
    function ICreateTransform(var ArrayDataIn: Double): IMathTransform; safecall;
    function CreateTransformRotateAxis(const pointObjIn: IDispatch; const vectorObjIn: IDispatch; 
                                       angle: Double): IDispatch; safecall;
    function ICreateTransformRotateAxis(const pointObjIn: IMathPoint; 
                                        const vectorObjIn: IMathVector; angle: Double): IMathTransform; safecall;
    function CreatePoint(ArrayDataIn: OleVariant): IDispatch; safecall;
    function ICreatePoint(var ArrayDataIn: Double): IMathPoint; safecall;
    function CreateVector(ArrayDataIn: OleVariant): IDispatch; safecall;
    function ICreateVector(var ArrayDataIn: Double): IMathVector; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMathUtilityDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F7D97F80-162E-11D4-AEAB-00C04FA0AC51}
// *********************************************************************//
  IMathUtilityDisp = dispinterface
    ['{F7D97F80-162E-11D4-AEAB-00C04FA0AC51}']
    function CreateTransform(ArrayDataIn: OleVariant): IDispatch; dispid 1;
    function ICreateTransform(var ArrayDataIn: Double): IMathTransform; dispid 2;
    function CreateTransformRotateAxis(const pointObjIn: IDispatch; const vectorObjIn: IDispatch; 
                                       angle: Double): IDispatch; dispid 3;
    function ICreateTransformRotateAxis(const pointObjIn: IMathPoint; 
                                        const vectorObjIn: IMathVector; angle: Double): IMathTransform; dispid 4;
    function CreatePoint(ArrayDataIn: OleVariant): IDispatch; dispid 5;
    function ICreatePoint(var ArrayDataIn: Double): IMathPoint; dispid 6;
    function CreateVector(ArrayDataIn: OleVariant): IDispatch; dispid 7;
    function ICreateVector(var ArrayDataIn: Double): IMathVector; dispid 8;
  end;

// *********************************************************************//
// Interface: IMathTransform
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F7D97F82-162E-11D4-AEAB-00C04FA0AC51}
// *********************************************************************//
  IMathTransform = interface(IDispatch)
    ['{F7D97F82-162E-11D4-AEAB-00C04FA0AC51}']
    function Multiply(const TransformObjIn: IDispatch): IDispatch; safecall;
    function IMultiply(const TransformObjIn: IMathTransform): IMathTransform; safecall;
    function Get_ArrayData: OleVariant; safecall;
    procedure Set_ArrayData(ArrayDataOut: OleVariant); safecall;
    function Get_IArrayData: Double; safecall;
    procedure Set_IArrayData(var ArrayDataOut: Double); safecall;
    procedure GetData(var xAxisObjOut: IDispatch; var yAxisObjOut: IDispatch; 
                      var zAxisObjOut: IDispatch; var TransformObjOut: IDispatch; 
                      var scaleOut: Double); safecall;
    procedure IGetData(var xAxisObjOut: IMathVector; var yAxisObjOut: IMathVector; 
                       var zAxisObjOut: IMathVector; var TransformObjOut: IMathVector; 
                       var scaleOut: Double); safecall;
    procedure SetData(const xAxisObjIn: IDispatch; const yAxisObjIn: IDispatch; 
                      const zAxisObjIn: IDispatch; const TransformObjIn: IDispatch; 
                      scaleValIn: Double); safecall;
    procedure ISetData(const xAxisObjIn: IMathVector; const yAxisObjIn: IMathVector; 
                       const zAxisObjIn: IMathVector; const TransformObjIn: IMathVector; 
                       scaleValIn: Double); safecall;
    function Inverse: IDispatch; safecall;
    function IInverse: IMathTransform; safecall;
    property ArrayData: OleVariant read Get_ArrayData write Set_ArrayData;
  end;

// *********************************************************************//
// DispIntf:  IMathTransformDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F7D97F82-162E-11D4-AEAB-00C04FA0AC51}
// *********************************************************************//
  IMathTransformDisp = dispinterface
    ['{F7D97F82-162E-11D4-AEAB-00C04FA0AC51}']
    function Multiply(const TransformObjIn: IDispatch): IDispatch; dispid 1;
    function IMultiply(const TransformObjIn: IMathTransform): IMathTransform; dispid 2;
    property ArrayData: OleVariant dispid 3;
    function IArrayData: Double; dispid 4;
    procedure GetData(var xAxisObjOut: IDispatch; var yAxisObjOut: IDispatch; 
                      var zAxisObjOut: IDispatch; var TransformObjOut: IDispatch; 
                      var scaleOut: Double); dispid 5;
    procedure IGetData(var xAxisObjOut: IMathVector; var yAxisObjOut: IMathVector; 
                       var zAxisObjOut: IMathVector; var TransformObjOut: IMathVector; 
                       var scaleOut: Double); dispid 6;
    procedure SetData(const xAxisObjIn: IDispatch; const yAxisObjIn: IDispatch; 
                      const zAxisObjIn: IDispatch; const TransformObjIn: IDispatch; 
                      scaleValIn: Double); dispid 7;
    procedure ISetData(const xAxisObjIn: IMathVector; const yAxisObjIn: IMathVector; 
                       const zAxisObjIn: IMathVector; const TransformObjIn: IMathVector; 
                       scaleValIn: Double); dispid 8;
    function Inverse: IDispatch; dispid 9;
    function IInverse: IMathTransform; dispid 10;
  end;

// *********************************************************************//
// Interface: IMathVector
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F7D97F86-162E-11D4-AEAB-00C04FA0AC51}
// *********************************************************************//
  IMathVector = interface(IDispatch)
    ['{F7D97F86-162E-11D4-AEAB-00C04FA0AC51}']
    function MultiplyTransform(const TransformObjIn: IDispatch): IDispatch; safecall;
    function IMultiplyTransform(const TransformObjIn: IMathTransform): IMathVector; safecall;
    function Get_ArrayData: OleVariant; safecall;
    procedure Set_ArrayData(ArrayDataOut: OleVariant); safecall;
    function Get_IArrayData: Double; safecall;
    procedure Set_IArrayData(var ArrayDataOut: Double); safecall;
    function Add(const vectorObjIn: IDispatch): IDispatch; safecall;
    function IAdd(const vectorObjIn: IMathVector): IMathVector; safecall;
    function Subtract(const vectorObjIn: IDispatch): IDispatch; safecall;
    function ISubtract(const vectorObjIn: IMathVector): IMathVector; safecall;
    function Scale(valueIn: Double): IDispatch; safecall;
    function IScale(valueIn: Double): IMathVector; safecall;
    function GetLength: Double; safecall;
    function Dot(const vectorObjIn: IDispatch): Double; safecall;
    function IDot(const vectorObjIn: IMathVector): Double; safecall;
    function Cross(const vectorObjIn: IDispatch): IDispatch; safecall;
    function ICross(const vectorObjIn: IMathVector): IMathVector; safecall;
    function ConvertToPoint: IDispatch; safecall;
    function IConvertToPoint: IMathPoint; safecall;
    property ArrayData: OleVariant read Get_ArrayData write Set_ArrayData;
  end;

// *********************************************************************//
// DispIntf:  IMathVectorDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F7D97F86-162E-11D4-AEAB-00C04FA0AC51}
// *********************************************************************//
  IMathVectorDisp = dispinterface
    ['{F7D97F86-162E-11D4-AEAB-00C04FA0AC51}']
    function MultiplyTransform(const TransformObjIn: IDispatch): IDispatch; dispid 1;
    function IMultiplyTransform(const TransformObjIn: IMathTransform): IMathVector; dispid 2;
    property ArrayData: OleVariant dispid 3;
    function IArrayData: Double; dispid 4;
    function Add(const vectorObjIn: IDispatch): IDispatch; dispid 5;
    function IAdd(const vectorObjIn: IMathVector): IMathVector; dispid 6;
    function Subtract(const vectorObjIn: IDispatch): IDispatch; dispid 7;
    function ISubtract(const vectorObjIn: IMathVector): IMathVector; dispid 8;
    function Scale(valueIn: Double): IDispatch; dispid 9;
    function IScale(valueIn: Double): IMathVector; dispid 10;
    function GetLength: Double; dispid 11;
    function Dot(const vectorObjIn: IDispatch): Double; dispid 12;
    function IDot(const vectorObjIn: IMathVector): Double; dispid 13;
    function Cross(const vectorObjIn: IDispatch): IDispatch; dispid 14;
    function ICross(const vectorObjIn: IMathVector): IMathVector; dispid 15;
    function ConvertToPoint: IDispatch; dispid 16;
    function IConvertToPoint: IMathPoint; dispid 17;
  end;

// *********************************************************************//
// Interface: IMathPoint
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F7D97F84-162E-11D4-AEAB-00C04FA0AC51}
// *********************************************************************//
  IMathPoint = interface(IDispatch)
    ['{F7D97F84-162E-11D4-AEAB-00C04FA0AC51}']
    function MultiplyTransform(const TransformObjIn: IDispatch): IDispatch; safecall;
    function IMultiplyTransform(const TransformObjIn: IMathTransform): IMathPoint; safecall;
    function Get_ArrayData: OleVariant; safecall;
    procedure Set_ArrayData(ArrayDataOut: OleVariant); safecall;
    function Get_IArrayData: Double; safecall;
    procedure Set_IArrayData(var ArrayDataOut: Double); safecall;
    function AddVector(const vectorObjIn: IDispatch): IDispatch; safecall;
    function IAddVector(const vectorObjIn: IMathVector): IMathPoint; safecall;
    function SubtractVector(const vectorObjIn: IDispatch): IDispatch; safecall;
    function ISubtractVector(const vectorObjIn: IMathVector): IMathPoint; safecall;
    function Subtract(const pointObjIn: IDispatch): IDispatch; safecall;
    function ISubtract(const pointObjIn: IMathPoint): IMathVector; safecall;
    function Scale(valueIn: Double): IDispatch; safecall;
    function IScale(valueIn: Double): IMathPoint; safecall;
    function ConvertToVector: IDispatch; safecall;
    function IConvertToVector: IMathVector; safecall;
    property ArrayData: OleVariant read Get_ArrayData write Set_ArrayData;
  end;

// *********************************************************************//
// DispIntf:  IMathPointDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F7D97F84-162E-11D4-AEAB-00C04FA0AC51}
// *********************************************************************//
  IMathPointDisp = dispinterface
    ['{F7D97F84-162E-11D4-AEAB-00C04FA0AC51}']
    function MultiplyTransform(const TransformObjIn: IDispatch): IDispatch; dispid 1;
    function IMultiplyTransform(const TransformObjIn: IMathTransform): IMathPoint; dispid 2;
    property ArrayData: OleVariant dispid 3;
    function IArrayData: Double; dispid 4;
    function AddVector(const vectorObjIn: IDispatch): IDispatch; dispid 5;
    function IAddVector(const vectorObjIn: IMathVector): IMathPoint; dispid 6;
    function SubtractVector(const vectorObjIn: IDispatch): IDispatch; dispid 7;
    function ISubtractVector(const vectorObjIn: IMathVector): IMathPoint; dispid 8;
    function Subtract(const pointObjIn: IDispatch): IDispatch; dispid 9;
    function ISubtract(const pointObjIn: IMathPoint): IMathVector; dispid 10;
    function Scale(valueIn: Double): IDispatch; dispid 11;
    function IScale(valueIn: Double): IMathPoint; dispid 12;
    function ConvertToVector: IDispatch; dispid 13;
    function IConvertToVector: IMathVector; dispid 14;
  end;

// *********************************************************************//
// Interface: IRefAxis
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D86-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IRefAxis = interface(IDispatch)
    ['{83A33D86-27C5-11CE-BFD4-00400513BB57}']
    function GetRefAxisParams: OleVariant; safecall;
    function IGetRefAxisParams: Double; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRefAxisDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D86-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IRefAxisDisp = dispinterface
    ['{83A33D86-27C5-11CE-BFD4-00400513BB57}']
    function GetRefAxisParams: OleVariant; dispid 1;
    function IGetRefAxisParams: Double; dispid 2;
  end;

// *********************************************************************//
// Interface: IMate
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D8A-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IMate = interface(IDispatch)
    ['{83A33D8A-27C5-11CE-BFD4-00400513BB57}']
    function GetMateParams: OleVariant; safecall;
    procedure IGetMateParams(out mateType: Integer; out alignFlag: Integer; 
                             out canBeFlipped: Integer); safecall;
    function GetMateDimensionValue: OleVariant; safecall;
    function IGetMateDimensionValue: Double; safecall;
    function GetMateEntities: OleVariant; safecall;
    procedure IGetMateEntities(out entity1: IMateEntity; out entity2: IMateEntity); safecall;
    function GetEntity(whichOne: SYSINT): IDispatch; safecall;
    function IGetEntity(whichOne: SYSINT): IEntity; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMateDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D8A-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IMateDisp = dispinterface
    ['{83A33D8A-27C5-11CE-BFD4-00400513BB57}']
    function GetMateParams: OleVariant; dispid 1;
    procedure IGetMateParams(out mateType: Integer; out alignFlag: Integer; 
                             out canBeFlipped: Integer); dispid 2;
    function GetMateDimensionValue: OleVariant; dispid 3;
    function IGetMateDimensionValue: Double; dispid 4;
    function GetMateEntities: OleVariant; dispid 5;
    procedure IGetMateEntities(out entity1: IMateEntity; out entity2: IMateEntity); dispid 6;
    function GetEntity(whichOne: SYSINT): IDispatch; dispid 7;
    function IGetEntity(whichOne: SYSINT): IEntity; dispid 8;
  end;

// *********************************************************************//
// Interface: IMateEntity
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D8C-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IMateEntity = interface(IDispatch)
    ['{83A33D8C-27C5-11CE-BFD4-00400513BB57}']
    function GetMember: IDispatch; safecall;
    function IGetMember: IMember; safecall;
    function GetEntityType: Integer; safecall;
    function GetEntityParams: OleVariant; safecall;
    function IGetEntityParams: Double; safecall;
    function GetComponent: IDispatch; safecall;
    function IGetComponent: IComponent; safecall;
    function GetComponentName: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMateEntityDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33D8C-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IMateEntityDisp = dispinterface
    ['{83A33D8C-27C5-11CE-BFD4-00400513BB57}']
    function GetMember: IDispatch; dispid 1;
    function IGetMember: IMember; dispid 2;
    function GetEntityType: Integer; dispid 3;
    function GetEntityParams: OleVariant; dispid 4;
    function IGetEntityParams: Double; dispid 5;
    function GetComponent: IDispatch; dispid 6;
    function IGetComponent: IComponent; dispid 7;
    function GetComponentName: WideString; dispid 8;
  end;

// *********************************************************************//
// Interface: ISWPropertySheet
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA7-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISWPropertySheet = interface(IDispatch)
    ['{83A33DA7-27C5-11CE-BFD4-00400513BB57}']
    function AddPage(page: Integer): Integer; safecall;
    function RemovePage(page: Integer): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISWPropertySheetDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DA7-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISWPropertySheetDisp = dispinterface
    ['{83A33DA7-27C5-11CE-BFD4-00400513BB57}']
    function AddPage(page: Integer): Integer; dispid 1;
    function RemovePage(page: Integer): Integer; dispid 2;
  end;

// *********************************************************************//
// Interface: IRibFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {83A33DAD-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IRibFeatureData = interface(IUnknown)
    ['{83A33DAD-27C5-11CE-BFD4-00400513BB57}']
    function Get_IsTwoSided: WordBool; safecall;
    procedure Set_IsTwoSided(twoSided: WordBool); safecall;
    function Get_reverseThicknessDir: WordBool; safecall;
    procedure Set_reverseThicknessDir(reverse: WordBool); safecall;
    function Get_thickness: Double; safecall;
    procedure Set_thickness(thickness: Double); safecall;
    function Get_RefSketchIndex: SYSINT; safecall;
    procedure Set_RefSketchIndex(index: SYSINT); safecall;
    function NextReference: SYSINT; safecall;
    function Get_FlipSide: WordBool; safecall;
    procedure Set_FlipSide(FlipSide: WordBool); safecall;
    function Get_EnableDraft: WordBool; safecall;
    procedure Set_EnableDraft(EnableDraft: WordBool); safecall;
    function Get_draftOutward: WordBool; safecall;
    procedure Set_draftOutward(draftOutward: WordBool); safecall;
    function Get_draftAngle: Double; safecall;
    procedure Set_draftAngle(angle: Double); safecall;
    property IsTwoSided: WordBool read Get_IsTwoSided write Set_IsTwoSided;
    property reverseThicknessDir: WordBool read Get_reverseThicknessDir write Set_reverseThicknessDir;
    property thickness: Double read Get_thickness write Set_thickness;
    property RefSketchIndex: SYSINT read Get_RefSketchIndex write Set_RefSketchIndex;
    property FlipSide: WordBool read Get_FlipSide write Set_FlipSide;
    property EnableDraft: WordBool read Get_EnableDraft write Set_EnableDraft;
    property draftOutward: WordBool read Get_draftOutward write Set_draftOutward;
    property draftAngle: Double read Get_draftAngle write Set_draftAngle;
  end;

// *********************************************************************//
// DispIntf:  IRibFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {83A33DAD-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IRibFeatureDataDisp = dispinterface
    ['{83A33DAD-27C5-11CE-BFD4-00400513BB57}']
    property IsTwoSided: WordBool dispid 1;
    property reverseThicknessDir: WordBool dispid 2;
    property thickness: Double dispid 3;
    property RefSketchIndex: SYSINT dispid 4;
    function NextReference: SYSINT; dispid 5;
    property FlipSide: WordBool dispid 6;
    property EnableDraft: WordBool dispid 7;
    property draftOutward: WordBool dispid 8;
    property draftAngle: Double dispid 9;
  end;

// *********************************************************************//
// Interface: IDomeFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {83A33DAF-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDomeFeatureData = interface(IUnknown)
    ['{83A33DAF-27C5-11CE-BFD4-00400513BB57}']
    function Get_height: Double; safecall;
    procedure Set_height(height: Double); safecall;
    function Get_reverseDir: WordBool; safecall;
    procedure Set_reverseDir(reverse: WordBool); safecall;
    function Get_Elliptical: WordBool; safecall;
    procedure Set_Elliptical(Elliptical: WordBool); safecall;
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function Get_face: IDispatch; safecall;
    procedure Set_face(const face: IDispatch); safecall;
    function Get_IFace: IFace; safecall;
    procedure Set_IFace(const face: IFace); safecall;
    property height: Double read Get_height write Set_height;
    property reverseDir: WordBool read Get_reverseDir write Set_reverseDir;
    property Elliptical: WordBool read Get_Elliptical write Set_Elliptical;
    property face: IDispatch read Get_face write Set_face;
    property IFace: IFace read Get_IFace write Set_IFace;
  end;

// *********************************************************************//
// DispIntf:  IDomeFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {83A33DAF-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  IDomeFeatureDataDisp = dispinterface
    ['{83A33DAF-27C5-11CE-BFD4-00400513BB57}']
    property height: Double dispid 1;
    property reverseDir: WordBool dispid 2;
    property Elliptical: WordBool dispid 3;
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 4;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 5;
    procedure ReleaseSelectionAccess; dispid 6;
    property face: IDispatch dispid 7;
    property IFace: IFace dispid 8;
  end;

// *********************************************************************//
// Interface: ISketchLine
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC1-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchLine = interface(IDispatch)
    ['{83A33DC1-27C5-11CE-BFD4-00400513BB57}']
    function GetStartPoint: OleVariant; safecall;
    function IGetStartPoint: Double; safecall;
    function GetEndPoint: OleVariant; safecall;
    function IGetEndPoint: Double; safecall;
    function GetStartPoint2: IDispatch; safecall;
    function IGetStartPoint2: ISketchPoint; safecall;
    function GetEndPoint2: IDispatch; safecall;
    function IGetEndPoint2: ISketchPoint; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISketchLineDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC1-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchLineDisp = dispinterface
    ['{83A33DC1-27C5-11CE-BFD4-00400513BB57}']
    function GetStartPoint: OleVariant; dispid 1;
    function IGetStartPoint: Double; dispid 2;
    function GetEndPoint: OleVariant; dispid 3;
    function IGetEndPoint: Double; dispid 4;
    function GetStartPoint2: IDispatch; dispid 5;
    function IGetStartPoint2: ISketchPoint; dispid 6;
    function GetEndPoint2: IDispatch; dispid 7;
    function IGetEndPoint2: ISketchPoint; dispid 8;
  end;

// *********************************************************************//
// Interface: ISketchArc
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC3-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchArc = interface(IDispatch)
    ['{83A33DC3-27C5-11CE-BFD4-00400513BB57}']
    function GetStartPoint: OleVariant; safecall;
    function IGetStartPoint: Double; safecall;
    function GetEndPoint: OleVariant; safecall;
    function IGetEndPoint: Double; safecall;
    function GetCenterPoint: OleVariant; safecall;
    function IGetCenterPoint: Double; safecall;
    function IsCircle: SYSINT; safecall;
    function GetRotationDir: SYSINT; safecall;
    function GetStartPoint2: IDispatch; safecall;
    function IGetStartPoint2: ISketchPoint; safecall;
    function GetEndPoint2: IDispatch; safecall;
    function IGetEndPoint2: ISketchPoint; safecall;
    function GetCenterPoint2: IDispatch; safecall;
    function IGetCenterPoint2: ISketchPoint; safecall;
    function GetRadius: Double; safecall;
    function SetRadius(radius: Double): WordBool; safecall;
    function GetNormalVector: OleVariant; safecall;
    function IGetNormalVector: Double; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISketchArcDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC3-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchArcDisp = dispinterface
    ['{83A33DC3-27C5-11CE-BFD4-00400513BB57}']
    function GetStartPoint: OleVariant; dispid 1;
    function IGetStartPoint: Double; dispid 2;
    function GetEndPoint: OleVariant; dispid 3;
    function IGetEndPoint: Double; dispid 4;
    function GetCenterPoint: OleVariant; dispid 5;
    function IGetCenterPoint: Double; dispid 6;
    function IsCircle: SYSINT; dispid 7;
    function GetRotationDir: SYSINT; dispid 8;
    function GetStartPoint2: IDispatch; dispid 9;
    function IGetStartPoint2: ISketchPoint; dispid 10;
    function GetEndPoint2: IDispatch; dispid 11;
    function IGetEndPoint2: ISketchPoint; dispid 12;
    function GetCenterPoint2: IDispatch; dispid 13;
    function IGetCenterPoint2: ISketchPoint; dispid 14;
    function GetRadius: Double; dispid 15;
    function SetRadius(radius: Double): WordBool; dispid 16;
    function GetNormalVector: OleVariant; dispid 17;
    function IGetNormalVector: Double; dispid 18;
  end;

// *********************************************************************//
// Interface: ISketchText
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC5-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchText = interface(IDispatch)
    ['{83A33DC5-27C5-11CE-BFD4-00400513BB57}']
    function GetEdges: OleVariant; safecall;
    function EnumEdges: IEnumEdges; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISketchTextDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC5-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchTextDisp = dispinterface
    ['{83A33DC5-27C5-11CE-BFD4-00400513BB57}']
    function GetEdges: OleVariant; dispid 1;
    function EnumEdges: IEnumEdges; dispid 2;
  end;

// *********************************************************************//
// Interface: ISketchEllipse
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC7-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchEllipse = interface(IDispatch)
    ['{83A33DC7-27C5-11CE-BFD4-00400513BB57}']
    function GetStartPoint: OleVariant; safecall;
    function IGetStartPoint: Double; safecall;
    function GetEndPoint: OleVariant; safecall;
    function IGetEndPoint: Double; safecall;
    function GetCenterPoint: OleVariant; safecall;
    function IGetCenterPoint: Double; safecall;
    function GetMajorPoint: OleVariant; safecall;
    function IGetMajorPoint: Double; safecall;
    function GetMinorPoint: OleVariant; safecall;
    function IGetMinorPoint: Double; safecall;
    function GetStartPoint2: IDispatch; safecall;
    function IGetStartPoint2: ISketchPoint; safecall;
    function GetEndPoint2: IDispatch; safecall;
    function IGetEndPoint2: ISketchPoint; safecall;
    function GetCenterPoint2: IDispatch; safecall;
    function IGetCenterPoint2: ISketchPoint; safecall;
    function GetMajorPoint2: IDispatch; safecall;
    function IGetMajorPoint2: ISketchPoint; safecall;
    function GetMinorPoint2: IDispatch; safecall;
    function IGetMinorPoint2: ISketchPoint; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISketchEllipseDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC7-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchEllipseDisp = dispinterface
    ['{83A33DC7-27C5-11CE-BFD4-00400513BB57}']
    function GetStartPoint: OleVariant; dispid 1;
    function IGetStartPoint: Double; dispid 2;
    function GetEndPoint: OleVariant; dispid 3;
    function IGetEndPoint: Double; dispid 4;
    function GetCenterPoint: OleVariant; dispid 5;
    function IGetCenterPoint: Double; dispid 6;
    function GetMajorPoint: OleVariant; dispid 7;
    function IGetMajorPoint: Double; dispid 8;
    function GetMinorPoint: OleVariant; dispid 9;
    function IGetMinorPoint: Double; dispid 10;
    function GetStartPoint2: IDispatch; dispid 11;
    function IGetStartPoint2: ISketchPoint; dispid 12;
    function GetEndPoint2: IDispatch; dispid 13;
    function IGetEndPoint2: ISketchPoint; dispid 14;
    function GetCenterPoint2: IDispatch; dispid 15;
    function IGetCenterPoint2: ISketchPoint; dispid 16;
    function GetMajorPoint2: IDispatch; dispid 17;
    function IGetMajorPoint2: ISketchPoint; dispid 18;
    function GetMinorPoint2: IDispatch; dispid 19;
    function IGetMinorPoint2: ISketchPoint; dispid 20;
  end;

// *********************************************************************//
// Interface: ISketchParabola
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC9-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchParabola = interface(IDispatch)
    ['{83A33DC9-27C5-11CE-BFD4-00400513BB57}']
    function GetStartPoint: OleVariant; safecall;
    function IGetStartPoint: Double; safecall;
    function GetEndPoint: OleVariant; safecall;
    function IGetEndPoint: Double; safecall;
    function GetFocalPoint: OleVariant; safecall;
    function IGetFocalPoint: Double; safecall;
    function GetApexPoint: OleVariant; safecall;
    function IGetApexPoint: Double; safecall;
    function GetStartPoint2: IDispatch; safecall;
    function IGetStartPoint2: ISketchPoint; safecall;
    function GetEndPoint2: IDispatch; safecall;
    function IGetEndPoint2: ISketchPoint; safecall;
    function GetFocalPoint2: IDispatch; safecall;
    function IGetFocalPoint2: ISketchPoint; safecall;
    function GetApexPoint2: IDispatch; safecall;
    function IGetApexPoint2: ISketchPoint; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISketchParabolaDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DC9-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchParabolaDisp = dispinterface
    ['{83A33DC9-27C5-11CE-BFD4-00400513BB57}']
    function GetStartPoint: OleVariant; dispid 1;
    function IGetStartPoint: Double; dispid 2;
    function GetEndPoint: OleVariant; dispid 3;
    function IGetEndPoint: Double; dispid 4;
    function GetFocalPoint: OleVariant; dispid 5;
    function IGetFocalPoint: Double; dispid 6;
    function GetApexPoint: OleVariant; dispid 7;
    function IGetApexPoint: Double; dispid 8;
    function GetStartPoint2: IDispatch; dispid 9;
    function IGetStartPoint2: ISketchPoint; dispid 10;
    function GetEndPoint2: IDispatch; dispid 11;
    function IGetEndPoint2: ISketchPoint; dispid 12;
    function GetFocalPoint2: IDispatch; dispid 13;
    function IGetFocalPoint2: ISketchPoint; dispid 14;
    function GetApexPoint2: IDispatch; dispid 15;
    function IGetApexPoint2: ISketchPoint; dispid 16;
  end;

// *********************************************************************//
// Interface: ISketchSpline
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DCB-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchSpline = interface(IDispatch)
    ['{83A33DCB-27C5-11CE-BFD4-00400513BB57}']
    function GetPointCount: Integer; safecall;
    function GetPoints: OleVariant; safecall;
    function IGetPoints: Double; safecall;
    function GetPoints2: OleVariant; safecall;
    function IEnumPoints: IEnumSketchPoints; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISketchSplineDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DCB-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ISketchSplineDisp = dispinterface
    ['{83A33DCB-27C5-11CE-BFD4-00400513BB57}']
    function GetPointCount: Integer; dispid 1;
    function GetPoints: OleVariant; dispid 2;
    function IGetPoints: Double; dispid 3;
    function GetPoints2: OleVariant; dispid 4;
    function IEnumPoints: IEnumSketchPoints; dispid 5;
  end;

// *********************************************************************//
// Interface: ILightDialog
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DF1-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ILightDialog = interface(IDispatch)
    ['{83A33DF1-27C5-11CE-BFD4-00400513BB57}']
    function AddSubDialog(page: Integer): WordBool; safecall;
    function GetLightId: Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  ILightDialogDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {83A33DF1-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  ILightDialogDisp = dispinterface
    ['{83A33DF1-27C5-11CE-BFD4-00400513BB57}']
    function AddSubDialog(page: Integer): WordBool; dispid 1;
    function GetLightId: Integer; dispid 2;
  end;

// *********************************************************************//
// Interface: IEnumCurves
// Flags:     (272) Hidden OleAutomation
// GUID:      {5B57E3BC-7139-11D3-AEA2-00C04F683CBA}
// *********************************************************************//
  IEnumCurves = interface(IUnknown)
    ['{5B57E3BC-7139-11D3-AEA2-00C04F683CBA}']
    function Next(celt: Integer; out rgelt: ICurve; var pceltFetched: Integer): HResult; stdcall;
    function Skip(celt: Integer): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppenum: IEnumCurves): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISimpleHoleFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {1D06FD54-96DD-11D3-AEAA-00C04F683CBA}
// *********************************************************************//
  ISimpleHoleFeatureData = interface(IUnknown)
    ['{1D06FD54-96DD-11D3-AEAA-00C04F683CBA}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function Get_ReverseDirection: WordBool; safecall;
    procedure Set_ReverseDirection(ReverseDirection: WordBool); safecall;
    function Get_DraftWhileExtruding: WordBool; safecall;
    procedure Set_DraftWhileExtruding(draftWhileExtrude: WordBool); safecall;
    function Get_draftOutward: WordBool; safecall;
    procedure Set_draftOutward(draftOutward: WordBool); safecall;
    function Get_ReverseOffset: WordBool; safecall;
    procedure Set_ReverseOffset(draftOutward: WordBool); safecall;
    function Get_type_: SYSINT; safecall;
    procedure Set_type_(type_: SYSINT); safecall;
    function Get_Diameter: Double; safecall;
    procedure Set_Diameter(Diameter: Double); safecall;
    function Get_depth: Double; safecall;
    procedure Set_depth(depth: Double); safecall;
    function Get_draftAngle: Double; safecall;
    procedure Set_draftAngle(draftAngle: Double); safecall;
    function Get_SurfaceOffset: Double; safecall;
    procedure Set_SurfaceOffset(SurfaceOffset: Double); safecall;
    function Get_face: IDispatch; safecall;
    procedure Set_face(const face: IDispatch); safecall;
    function Get_IFace: IFace; safecall;
    procedure Set_IFace(const face: IFace); safecall;
    function Get_Vertex: IDispatch; safecall;
    procedure Set_Vertex(const Vertex: IDispatch); safecall;
    function Get_IVertex: IVertex; safecall;
    procedure Set_IVertex(const Vertex: IVertex); safecall;
    property ReverseDirection: WordBool read Get_ReverseDirection write Set_ReverseDirection;
    property DraftWhileExtruding: WordBool read Get_DraftWhileExtruding write Set_DraftWhileExtruding;
    property draftOutward: WordBool read Get_draftOutward write Set_draftOutward;
    property ReverseOffset: WordBool read Get_ReverseOffset write Set_ReverseOffset;
    property type_: SYSINT read Get_type_ write Set_type_;
    property Diameter: Double read Get_Diameter write Set_Diameter;
    property depth: Double read Get_depth write Set_depth;
    property draftAngle: Double read Get_draftAngle write Set_draftAngle;
    property SurfaceOffset: Double read Get_SurfaceOffset write Set_SurfaceOffset;
    property face: IDispatch read Get_face write Set_face;
    property IFace: IFace read Get_IFace write Set_IFace;
    property Vertex: IDispatch read Get_Vertex write Set_Vertex;
    property IVertex: IVertex read Get_IVertex write Set_IVertex;
  end;

// *********************************************************************//
// DispIntf:  ISimpleHoleFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {1D06FD54-96DD-11D3-AEAA-00C04F683CBA}
// *********************************************************************//
  ISimpleHoleFeatureDataDisp = dispinterface
    ['{1D06FD54-96DD-11D3-AEAA-00C04F683CBA}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 1;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 2;
    procedure ReleaseSelectionAccess; dispid 3;
    property ReverseDirection: WordBool dispid 4;
    property DraftWhileExtruding: WordBool dispid 5;
    property draftOutward: WordBool dispid 6;
    property ReverseOffset: WordBool dispid 7;
    property type_: SYSINT dispid 8;
    property Diameter: Double dispid 9;
    property depth: Double dispid 10;
    property draftAngle: Double dispid 11;
    property SurfaceOffset: Double dispid 12;
    property face: IDispatch dispid 13;
    property IFace: IFace dispid 14;
    property Vertex: IDispatch dispid 15;
    property IVertex: IVertex dispid 16;
  end;

// *********************************************************************//
// Interface: IWizardHoleFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {887AB457-A739-11D3-B97F-001083029A97}
// *********************************************************************//
  IWizardHoleFeatureData = interface(IUnknown)
    ['{887AB457-A739-11D3-B97F-001083029A97}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function Get_type_: SYSINT; safecall;
    procedure Set_type_(hole_type: SYSINT); safecall;
    function Get_Diameter: Double; safecall;
    procedure Set_Diameter(Diameter: Double); safecall;
    function Get_CounterBoreDiameter: Double; safecall;
    procedure Set_CounterBoreDiameter(cbore_dia: Double); safecall;
    function Get_CounterDrillDiameter: Double; safecall;
    procedure Set_CounterDrillDiameter(cdrill_dia: Double); safecall;
    function Get_CounterSinkDiameter: Double; safecall;
    procedure Set_CounterSinkDiameter(csunk_dia: Double); safecall;
    function Get_MinorDiameter: Double; safecall;
    procedure Set_MinorDiameter(minor_dia: Double); safecall;
    function Get_MajorDiameter: Double; safecall;
    procedure Set_MajorDiameter(major_dia: Double); safecall;
    function Get_HoleDiameter: Double; safecall;
    procedure Set_HoleDiameter(Diameter: Double); safecall;
    function Get_ThruHoleDiameter: Double; safecall;
    procedure Set_ThruHoleDiameter(Diameter: Double); safecall;
    function Get_TapDrillDiameter: Double; safecall;
    procedure Set_TapDrillDiameter(Diameter: Double); safecall;
    function Get_ThruTapDrillDiameter: Double; safecall;
    procedure Set_ThruTapDrillDiameter(Diameter: Double); safecall;
    function Get_NearCounterSinkDiameter: Double; safecall;
    procedure Set_NearCounterSinkDiameter(Diameter: Double); safecall;
    function Get_MidCounterSinkDiameter: Double; safecall;
    procedure Set_MidCounterSinkDiameter(Diameter: Double); safecall;
    function Get_FarCounterSinkDiameter: Double; safecall;
    procedure Set_FarCounterSinkDiameter(Diameter: Double); safecall;
    function Get_ThreadDiameter: Double; safecall;
    procedure Set_ThreadDiameter(Diameter: Double); safecall;
    function Get_depth: Double; safecall;
    procedure Set_depth(depth: Double); safecall;
    function Get_CounterBoreDepth: Double; safecall;
    procedure Set_CounterBoreDepth(cbore_depth: Double); safecall;
    function Get_CounterDrillDepth: Double; safecall;
    procedure Set_CounterDrillDepth(cdrill_depth: Double); safecall;
    function Get_HoleDepth: Double; safecall;
    procedure Set_HoleDepth(depth: Double); safecall;
    function Get_ThruHoleDepth: Double; safecall;
    procedure Set_ThruHoleDepth(depth: Double); safecall;
    function Get_TapDrillDepth: Double; safecall;
    procedure Set_TapDrillDepth(depth: Double); safecall;
    function Get_ThruTapDrillDepth: Double; safecall;
    procedure Set_ThruTapDrillDepth(depth: Double); safecall;
    function Get_ThreadDepth: Double; safecall;
    procedure Set_ThreadDepth(depth: Double); safecall;
    function Get_CounterDrillAngle: Double; safecall;
    procedure Set_CounterDrillAngle(cdrill_angle: Double); safecall;
    function Get_CounterSinkAngle: Double; safecall;
    procedure Set_CounterSinkAngle(csunk_angle: Double); safecall;
    function Get_DrillAngle: Double; safecall;
    procedure Set_DrillAngle(drill_angle: Double); safecall;
    function Get_NearCounterSinkAngle: Double; safecall;
    procedure Set_NearCounterSinkAngle(angle: Double); safecall;
    function Get_MidCounterSinkAngle: Double; safecall;
    procedure Set_MidCounterSinkAngle(angle: Double); safecall;
    function Get_FarCounterSinkAngle: Double; safecall;
    procedure Set_FarCounterSinkAngle(angle: Double); safecall;
    function Get_ThreadAngle: Double; safecall;
    procedure Set_ThreadAngle(angle: Double); safecall;
    function Get_HeadClearance: Double; safecall;
    procedure Set_HeadClearance(HeadClearance: Double); safecall;
    function Get_face: IDispatch; safecall;
    procedure Set_face(const face: IDispatch); safecall;
    function Get_IFace: IFace; safecall;
    procedure Set_IFace(const face: IFace); safecall;
    function Get_Vertex: IDispatch; safecall;
    procedure Set_Vertex(const Vertex: IDispatch); safecall;
    function Get_IVertex: IVertex; safecall;
    procedure Set_IVertex(const Vertex: IVertex); safecall;
    function Get_endCondition: SYSINT; safecall;
    procedure Set_endCondition(endCondition: SYSINT); safecall;
    function Get_Standard: WideString; safecall;
    procedure Set_Standard(const Standard: WideString); safecall;
    function Get_FastenerType: WideString; safecall;
    procedure Set_FastenerType(const FastenerType: WideString); safecall;
    function Get_FastenerSize: WideString; safecall;
    procedure Set_FastenerSize(const FastenerSize: WideString); safecall;
    property type_: SYSINT read Get_type_ write Set_type_;
    property Diameter: Double read Get_Diameter write Set_Diameter;
    property CounterBoreDiameter: Double read Get_CounterBoreDiameter write Set_CounterBoreDiameter;
    property CounterDrillDiameter: Double read Get_CounterDrillDiameter write Set_CounterDrillDiameter;
    property CounterSinkDiameter: Double read Get_CounterSinkDiameter write Set_CounterSinkDiameter;
    property MinorDiameter: Double read Get_MinorDiameter write Set_MinorDiameter;
    property MajorDiameter: Double read Get_MajorDiameter write Set_MajorDiameter;
    property HoleDiameter: Double read Get_HoleDiameter write Set_HoleDiameter;
    property ThruHoleDiameter: Double read Get_ThruHoleDiameter write Set_ThruHoleDiameter;
    property TapDrillDiameter: Double read Get_TapDrillDiameter write Set_TapDrillDiameter;
    property ThruTapDrillDiameter: Double read Get_ThruTapDrillDiameter write Set_ThruTapDrillDiameter;
    property NearCounterSinkDiameter: Double read Get_NearCounterSinkDiameter write Set_NearCounterSinkDiameter;
    property MidCounterSinkDiameter: Double read Get_MidCounterSinkDiameter write Set_MidCounterSinkDiameter;
    property FarCounterSinkDiameter: Double read Get_FarCounterSinkDiameter write Set_FarCounterSinkDiameter;
    property ThreadDiameter: Double read Get_ThreadDiameter write Set_ThreadDiameter;
    property depth: Double read Get_depth write Set_depth;
    property CounterBoreDepth: Double read Get_CounterBoreDepth write Set_CounterBoreDepth;
    property CounterDrillDepth: Double read Get_CounterDrillDepth write Set_CounterDrillDepth;
    property HoleDepth: Double read Get_HoleDepth write Set_HoleDepth;
    property ThruHoleDepth: Double read Get_ThruHoleDepth write Set_ThruHoleDepth;
    property TapDrillDepth: Double read Get_TapDrillDepth write Set_TapDrillDepth;
    property ThruTapDrillDepth: Double read Get_ThruTapDrillDepth write Set_ThruTapDrillDepth;
    property ThreadDepth: Double read Get_ThreadDepth write Set_ThreadDepth;
    property CounterDrillAngle: Double read Get_CounterDrillAngle write Set_CounterDrillAngle;
    property CounterSinkAngle: Double read Get_CounterSinkAngle write Set_CounterSinkAngle;
    property DrillAngle: Double read Get_DrillAngle write Set_DrillAngle;
    property NearCounterSinkAngle: Double read Get_NearCounterSinkAngle write Set_NearCounterSinkAngle;
    property MidCounterSinkAngle: Double read Get_MidCounterSinkAngle write Set_MidCounterSinkAngle;
    property FarCounterSinkAngle: Double read Get_FarCounterSinkAngle write Set_FarCounterSinkAngle;
    property ThreadAngle: Double read Get_ThreadAngle write Set_ThreadAngle;
    property HeadClearance: Double read Get_HeadClearance write Set_HeadClearance;
    property face: IDispatch read Get_face write Set_face;
    property IFace: IFace read Get_IFace write Set_IFace;
    property Vertex: IDispatch read Get_Vertex write Set_Vertex;
    property IVertex: IVertex read Get_IVertex write Set_IVertex;
    property endCondition: SYSINT read Get_endCondition write Set_endCondition;
    property Standard: WideString read Get_Standard write Set_Standard;
    property FastenerType: WideString read Get_FastenerType write Set_FastenerType;
    property FastenerSize: WideString read Get_FastenerSize write Set_FastenerSize;
  end;

// *********************************************************************//
// DispIntf:  IWizardHoleFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {887AB457-A739-11D3-B97F-001083029A97}
// *********************************************************************//
  IWizardHoleFeatureDataDisp = dispinterface
    ['{887AB457-A739-11D3-B97F-001083029A97}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 1;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 2;
    procedure ReleaseSelectionAccess; dispid 3;
    property type_: SYSINT dispid 4;
    property Diameter: Double dispid 5;
    property CounterBoreDiameter: Double dispid 6;
    property CounterDrillDiameter: Double dispid 7;
    property CounterSinkDiameter: Double dispid 8;
    property MinorDiameter: Double dispid 9;
    property MajorDiameter: Double dispid 10;
    property HoleDiameter: Double dispid 11;
    property ThruHoleDiameter: Double dispid 12;
    property TapDrillDiameter: Double dispid 13;
    property ThruTapDrillDiameter: Double dispid 14;
    property NearCounterSinkDiameter: Double dispid 15;
    property MidCounterSinkDiameter: Double dispid 16;
    property FarCounterSinkDiameter: Double dispid 17;
    property ThreadDiameter: Double dispid 18;
    property depth: Double dispid 19;
    property CounterBoreDepth: Double dispid 20;
    property CounterDrillDepth: Double dispid 21;
    property HoleDepth: Double dispid 22;
    property ThruHoleDepth: Double dispid 23;
    property TapDrillDepth: Double dispid 24;
    property ThruTapDrillDepth: Double dispid 25;
    property ThreadDepth: Double dispid 26;
    property CounterDrillAngle: Double dispid 27;
    property CounterSinkAngle: Double dispid 28;
    property DrillAngle: Double dispid 29;
    property NearCounterSinkAngle: Double dispid 30;
    property MidCounterSinkAngle: Double dispid 31;
    property FarCounterSinkAngle: Double dispid 32;
    property ThreadAngle: Double dispid 33;
    property HeadClearance: Double dispid 34;
    property face: IDispatch dispid 35;
    property IFace: IFace dispid 36;
    property Vertex: IDispatch dispid 37;
    property IVertex: IVertex dispid 38;
    property endCondition: SYSINT dispid 39;
    property Standard: WideString dispid 40;
    property FastenerType: WideString dispid 41;
    property FastenerSize: WideString dispid 42;
  end;

// *********************************************************************//
// Interface: IChamferFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {7271D7C7-ACC9-11D3-B97F-001083029A97}
// *********************************************************************//
  IChamferFeatureData = interface(IUnknown)
    ['{7271D7C7-ACC9-11D3-B97F-001083029A97}']
    function GetEdgeChamferDistance(side: SYSINT): Double; safecall;
    procedure SetEdgeChamferDistance(side: SYSINT; distance: Double); safecall;
    function GetVertexChamferDistance(side: SYSINT): Double; safecall;
    procedure SetVertexChamferDistance(side: SYSINT; distance: Double); safecall;
    function Get_type_: SYSINT; safecall;
    procedure Set_type_(chamfer_type: SYSINT); safecall;
    function Get_EdgeChamferAngle: Double; safecall;
    procedure Set_EdgeChamferAngle(angle: Double); safecall;
    property type_: SYSINT read Get_type_ write Set_type_;
    property EdgeChamferAngle: Double read Get_EdgeChamferAngle write Set_EdgeChamferAngle;
  end;

// *********************************************************************//
// DispIntf:  IChamferFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {7271D7C7-ACC9-11D3-B97F-001083029A97}
// *********************************************************************//
  IChamferFeatureDataDisp = dispinterface
    ['{7271D7C7-ACC9-11D3-B97F-001083029A97}']
    function GetEdgeChamferDistance(side: SYSINT): Double; dispid 1;
    procedure SetEdgeChamferDistance(side: SYSINT; distance: Double); dispid 2;
    function GetVertexChamferDistance(side: SYSINT): Double; dispid 3;
    procedure SetVertexChamferDistance(side: SYSINT; distance: Double); dispid 4;
    property type_: SYSINT dispid 5;
    property EdgeChamferAngle: Double dispid 6;
  end;

// *********************************************************************//
// Interface: IDraftFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {BC633CE1-B367-11D3-B981-001083029A97}
// *********************************************************************//
  IDraftFeatureData = interface(IUnknown)
    ['{BC633CE1-B367-11D3-B981-001083029A97}']
    function Get_type_: SYSINT; safecall;
    function Get_angle: Double; safecall;
    procedure Set_angle(angle: Double); safecall;
    function Get_ReverseDirection: WordBool; safecall;
    procedure Set_ReverseDirection(ReverseDirection: WordBool); safecall;
    property type_: SYSINT read Get_type_;
    property angle: Double read Get_angle write Set_angle;
    property ReverseDirection: WordBool read Get_ReverseDirection write Set_ReverseDirection;
  end;

// *********************************************************************//
// DispIntf:  IDraftFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {BC633CE1-B367-11D3-B981-001083029A97}
// *********************************************************************//
  IDraftFeatureDataDisp = dispinterface
    ['{BC633CE1-B367-11D3-B981-001083029A97}']
    property type_: SYSINT readonly dispid 1;
    property angle: Double dispid 2;
    property ReverseDirection: WordBool dispid 3;
  end;

// *********************************************************************//
// Interface: ISimpleFilletFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {CC929F0B-B404-11D3-B981-001083029A97}
// *********************************************************************//
  ISimpleFilletFeatureData = interface(IUnknown)
    ['{CC929F0B-B404-11D3-B981-001083029A97}']
    function Get_type_: SYSINT; safecall;
    function Get_DefaultRadius: Double; safecall;
    procedure Set_DefaultRadius(radius: Double); safecall;
    function Get_overFlowType: SYSINT; safecall;
    procedure Set_overFlowType(overflow_type: SYSINT); safecall;
    function Get_IsMultipleRadius: WordBool; safecall;
    procedure Set_IsMultipleRadius(IsMultipleRadius: WordBool); safecall;
    function Get_RoundCorners: WordBool; safecall;
    procedure Set_RoundCorners(RoundCorners: WordBool); safecall;
    function Get_PropagateToTangentFaces: WordBool; safecall;
    procedure Set_PropagateToTangentFaces(propTgtFaces: WordBool); safecall;
    function Get_FilletItemsCount: SYSINT; safecall;
    function GetFilletItemAtIndex(index: SYSINT): IDispatch; safecall;
    function IGetFilletItemAtIndex(index: SYSINT): IUnknown; safecall;
    function GetRadius(const pFilletItem: IDispatch): Double; safecall;
    function IGetRadius(const pFilletItem: IUnknown): Double; safecall;
    procedure SetRadius(const pFilletItem: IDispatch; radius: Double); safecall;
    procedure ISetRadius(const pFilletItem: IUnknown; radius: Double); safecall;
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    property type_: SYSINT read Get_type_;
    property DefaultRadius: Double read Get_DefaultRadius write Set_DefaultRadius;
    property overFlowType: SYSINT read Get_overFlowType write Set_overFlowType;
    property IsMultipleRadius: WordBool read Get_IsMultipleRadius write Set_IsMultipleRadius;
    property RoundCorners: WordBool read Get_RoundCorners write Set_RoundCorners;
    property PropagateToTangentFaces: WordBool read Get_PropagateToTangentFaces write Set_PropagateToTangentFaces;
    property FilletItemsCount: SYSINT read Get_FilletItemsCount;
  end;

// *********************************************************************//
// DispIntf:  ISimpleFilletFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {CC929F0B-B404-11D3-B981-001083029A97}
// *********************************************************************//
  ISimpleFilletFeatureDataDisp = dispinterface
    ['{CC929F0B-B404-11D3-B981-001083029A97}']
    property type_: SYSINT readonly dispid 1;
    property DefaultRadius: Double dispid 2;
    property overFlowType: SYSINT dispid 3;
    property IsMultipleRadius: WordBool dispid 4;
    property RoundCorners: WordBool dispid 5;
    property PropagateToTangentFaces: WordBool dispid 6;
    property FilletItemsCount: SYSINT readonly dispid 7;
    function GetFilletItemAtIndex(index: SYSINT): IDispatch; dispid 8;
    function IGetFilletItemAtIndex(index: SYSINT): IUnknown; dispid 9;
    function GetRadius(const pFilletItem: IDispatch): Double; dispid 10;
    function IGetRadius(const pFilletItem: IUnknown): Double; dispid 11;
    procedure SetRadius(const pFilletItem: IDispatch; radius: Double); dispid 12;
    procedure ISetRadius(const pFilletItem: IUnknown; radius: Double); dispid 13;
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 14;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 15;
    procedure ReleaseSelectionAccess; dispid 16;
  end;

// *********************************************************************//
// Interface: IVariableFilletFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {CC929F0D-B404-11D3-B981-001083029A97}
// *********************************************************************//
  IVariableFilletFeatureData = interface(IUnknown)
    ['{CC929F0D-B404-11D3-B981-001083029A97}']
    function Get_DefaultRadius: Double; safecall;
    procedure Set_DefaultRadius(radius: Double); safecall;
    function Get_overFlowType: SYSINT; safecall;
    procedure Set_overFlowType(overflow_type: SYSINT); safecall;
    function Get_TransitionType: SYSINT; safecall;
    procedure Set_TransitionType(transition_type: SYSINT); safecall;
    function Get_PropagateToTangentFaces: WordBool; safecall;
    procedure Set_PropagateToTangentFaces(propTgtFaces: WordBool); safecall;
    function Get_FilletEdgeCount: SYSINT; safecall;
    function GetFilletEdgeAtIndex(index: SYSINT): IDispatch; safecall;
    function IGetFilletEdgeAtIndex(index: SYSINT): IEdge; safecall;
    function GetRadius(const pFilletItem: IDispatch): Double; safecall;
    function IGetRadius(const pFilletItem: IVertex): Double; safecall;
    procedure SetRadius(const pFilletItem: IDispatch; radius: Double); safecall;
    procedure ISetRadius(const pFilletItem: IVertex; radius: Double); safecall;
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    property DefaultRadius: Double read Get_DefaultRadius write Set_DefaultRadius;
    property overFlowType: SYSINT read Get_overFlowType write Set_overFlowType;
    property TransitionType: SYSINT read Get_TransitionType write Set_TransitionType;
    property PropagateToTangentFaces: WordBool read Get_PropagateToTangentFaces write Set_PropagateToTangentFaces;
    property FilletEdgeCount: SYSINT read Get_FilletEdgeCount;
  end;

// *********************************************************************//
// DispIntf:  IVariableFilletFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {CC929F0D-B404-11D3-B981-001083029A97}
// *********************************************************************//
  IVariableFilletFeatureDataDisp = dispinterface
    ['{CC929F0D-B404-11D3-B981-001083029A97}']
    property DefaultRadius: Double dispid 1;
    property overFlowType: SYSINT dispid 2;
    property TransitionType: SYSINT dispid 3;
    property PropagateToTangentFaces: WordBool dispid 4;
    property FilletEdgeCount: SYSINT readonly dispid 5;
    function GetFilletEdgeAtIndex(index: SYSINT): IDispatch; dispid 6;
    function IGetFilletEdgeAtIndex(index: SYSINT): IEdge; dispid 7;
    function GetRadius(const pFilletItem: IDispatch): Double; dispid 8;
    function IGetRadius(const pFilletItem: IVertex): Double; dispid 9;
    procedure SetRadius(const pFilletItem: IDispatch; radius: Double); dispid 10;
    procedure ISetRadius(const pFilletItem: IVertex; radius: Double); dispid 11;
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 12;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 13;
    procedure ReleaseSelectionAccess; dispid 14;
  end;

// *********************************************************************//
// Interface: IExtrudeFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {908A7175-B72C-11D3-B981-001083029A97}
// *********************************************************************//
  IExtrudeFeatureData = interface(IUnknown)
    ['{908A7175-B72C-11D3-B981-001083029A97}']
    function GetEndCondition(forward: WordBool): SYSINT; safecall;
    procedure SetEndCondition(forward: WordBool; endCondition: SYSINT); safecall;
    function GetDepth(forward: WordBool): Double; safecall;
    procedure SetDepth(forward: WordBool; depth: Double); safecall;
    function GetWallThickness(forward: WordBool): Double; safecall;
    procedure SetWallThickness(forward: WordBool; wallThickness: Double); safecall;
    function GetDraftWhileExtruding(forward: WordBool): WordBool; safecall;
    procedure SetDraftWhileExtruding(forward: WordBool; draftWhileExtrude: WordBool); safecall;
    function GetDraftOutward(forward: WordBool): WordBool; safecall;
    procedure SetDraftOutward(forward: WordBool; draftOutward: WordBool); safecall;
    function GetDraftAngle(forward: WordBool): Double; safecall;
    procedure SetDraftAngle(forward: WordBool; draftAngle: Double); safecall;
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function GetFace(forward: WordBool): IDispatch; safecall;
    procedure SetFace(forward: WordBool; const face: IDispatch); safecall;
    function IGetFace(forward: WordBool): IFace; safecall;
    procedure ISetFace(forward: WordBool; const face: IFace); safecall;
    function GetVertex(forward: WordBool): IDispatch; safecall;
    procedure SetVertex(forward: WordBool; const face: IDispatch); safecall;
    function IGetVertex(forward: WordBool): IVertex; safecall;
    procedure ISetVertex(forward: WordBool; const face: IVertex); safecall;
    function Get_ReverseDirection: WordBool; safecall;
    procedure Set_ReverseDirection(ReverseDirection: WordBool); safecall;
    function Get_bothDirections: WordBool; safecall;
    procedure Set_bothDirections(bothDirections: WordBool); safecall;
    function Get_FlipSideToCut: WordBool; safecall;
    procedure Set_FlipSideToCut(flip: WordBool); safecall;
    function IsBossFeature: WordBool; safecall;
    function IsThinFeature: WordBool; safecall;
    function IsBaseExtrude: WordBool; safecall;
    property ReverseDirection: WordBool read Get_ReverseDirection write Set_ReverseDirection;
    property bothDirections: WordBool read Get_bothDirections write Set_bothDirections;
    property FlipSideToCut: WordBool read Get_FlipSideToCut write Set_FlipSideToCut;
  end;

// *********************************************************************//
// DispIntf:  IExtrudeFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {908A7175-B72C-11D3-B981-001083029A97}
// *********************************************************************//
  IExtrudeFeatureDataDisp = dispinterface
    ['{908A7175-B72C-11D3-B981-001083029A97}']
    function GetEndCondition(forward: WordBool): SYSINT; dispid 1;
    procedure SetEndCondition(forward: WordBool; endCondition: SYSINT); dispid 2;
    function GetDepth(forward: WordBool): Double; dispid 3;
    procedure SetDepth(forward: WordBool; depth: Double); dispid 4;
    function GetWallThickness(forward: WordBool): Double; dispid 5;
    procedure SetWallThickness(forward: WordBool; wallThickness: Double); dispid 6;
    function GetDraftWhileExtruding(forward: WordBool): WordBool; dispid 7;
    procedure SetDraftWhileExtruding(forward: WordBool; draftWhileExtrude: WordBool); dispid 8;
    function GetDraftOutward(forward: WordBool): WordBool; dispid 9;
    procedure SetDraftOutward(forward: WordBool; draftOutward: WordBool); dispid 10;
    function GetDraftAngle(forward: WordBool): Double; dispid 11;
    procedure SetDraftAngle(forward: WordBool; draftAngle: Double); dispid 12;
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 13;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 14;
    procedure ReleaseSelectionAccess; dispid 15;
    function GetFace(forward: WordBool): IDispatch; dispid 16;
    procedure SetFace(forward: WordBool; const face: IDispatch); dispid 17;
    function IGetFace(forward: WordBool): IFace; dispid 18;
    procedure ISetFace(forward: WordBool; const face: IFace); dispid 19;
    function GetVertex(forward: WordBool): IDispatch; dispid 20;
    procedure SetVertex(forward: WordBool; const face: IDispatch); dispid 21;
    function IGetVertex(forward: WordBool): IVertex; dispid 22;
    procedure ISetVertex(forward: WordBool; const face: IVertex); dispid 23;
    property ReverseDirection: WordBool dispid 24;
    property bothDirections: WordBool dispid 25;
    property FlipSideToCut: WordBool dispid 26;
    function IsBossFeature: WordBool; dispid 27;
    function IsThinFeature: WordBool; dispid 28;
    function IsBaseExtrude: WordBool; dispid 29;
  end;

// *********************************************************************//
// Interface: IRevolveFeatureData
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {B7FFF613-B735-11D3-B981-001083029A97}
// *********************************************************************//
  IRevolveFeatureData = interface(IUnknown)
    ['{B7FFF613-B735-11D3-B981-001083029A97}']
    function GetRevolutionAngle(forward: WordBool): Double; safecall;
    procedure SetRevolutionAngle(forward: WordBool; angle: Double); safecall;
    function GetWallThickness(forward: WordBool): Double; safecall;
    procedure SetWallThickness(forward: WordBool; wallThickness: Double); safecall;
    function Get_type_: SYSINT; safecall;
    procedure Set_type_(revolveCut_type: SYSINT); safecall;
    function Get_ReverseDirection: WordBool; safecall;
    procedure Set_ReverseDirection(ReverseDirection: WordBool); safecall;
    function IsBossFeature: WordBool; safecall;
    function IsThinFeature: WordBool; safecall;
    property type_: SYSINT read Get_type_ write Set_type_;
    property ReverseDirection: WordBool read Get_ReverseDirection write Set_ReverseDirection;
  end;

// *********************************************************************//
// DispIntf:  IRevolveFeatureDataDisp
// Flags:     (336) Hidden Dual OleAutomation
// GUID:      {B7FFF613-B735-11D3-B981-001083029A97}
// *********************************************************************//
  IRevolveFeatureDataDisp = dispinterface
    ['{B7FFF613-B735-11D3-B981-001083029A97}']
    function GetRevolutionAngle(forward: WordBool): Double; dispid 1;
    procedure SetRevolutionAngle(forward: WordBool; angle: Double); dispid 2;
    function GetWallThickness(forward: WordBool): Double; dispid 3;
    procedure SetWallThickness(forward: WordBool; wallThickness: Double); dispid 4;
    property type_: SYSINT dispid 5;
    property ReverseDirection: WordBool dispid 6;
    function IsBossFeature: WordBool; dispid 7;
    function IsThinFeature: WordBool; dispid 8;
  end;

// *********************************************************************//
// Interface: IMirrorPatternFeatureData
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {414F4F1E-30EC-11D4-AEEB-00C04F683CBA}
// *********************************************************************//
  IMirrorPatternFeatureData = interface(IDispatch)
    ['{414F4F1E-30EC-11D4-AEEB-00C04F683CBA}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function Get_Plane: IDispatch; safecall;
    procedure Set_Plane(const refPlane: IDispatch); safecall;
    function GetMirrorPlaneType: Integer; safecall;
    function Get_PatternFeatureArray: OleVariant; safecall;
    procedure Set_PatternFeatureArray(ArrayOut: OleVariant); safecall;
    function GetPatternFeatureCount: Integer; safecall;
    function IGetPatternFeatureArray: IDispatch; safecall;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); safecall;
    function Get_GeometryPattern: WordBool; safecall;
    procedure Set_GeometryPattern(geometry: WordBool); safecall;
    property Plane: IDispatch read Get_Plane write Set_Plane;
    property PatternFeatureArray: OleVariant read Get_PatternFeatureArray write Set_PatternFeatureArray;
    property GeometryPattern: WordBool read Get_GeometryPattern write Set_GeometryPattern;
  end;

// *********************************************************************//
// DispIntf:  IMirrorPatternFeatureDataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {414F4F1E-30EC-11D4-AEEB-00C04F683CBA}
// *********************************************************************//
  IMirrorPatternFeatureDataDisp = dispinterface
    ['{414F4F1E-30EC-11D4-AEEB-00C04F683CBA}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 1;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 2;
    procedure ReleaseSelectionAccess; dispid 3;
    property Plane: IDispatch dispid 4;
    function GetMirrorPlaneType: Integer; dispid 5;
    property PatternFeatureArray: OleVariant dispid 6;
    function GetPatternFeatureCount: Integer; dispid 7;
    function IGetPatternFeatureArray: IDispatch; dispid 8;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); dispid 9;
    property GeometryPattern: WordBool dispid 10;
  end;

// *********************************************************************//
// Interface: ICircularPatternFeatureData
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DBBF39DE-7AB5-11D4-AEB6-00C04FA0AC51}
// *********************************************************************//
  ICircularPatternFeatureData = interface(IDispatch)
    ['{DBBF39DE-7AB5-11D4-AEB6-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function Get_axis: IDispatch; safecall;
    procedure Set_axis(const refAxis: IDispatch); safecall;
    function GetAxisType: Integer; safecall;
    function Get_ReverseDirection: WordBool; safecall;
    procedure Set_ReverseDirection(ReverseDirection: WordBool); safecall;
    function Get_spacing: Double; safecall;
    procedure Set_spacing(distance: Double); safecall;
    function Get_TotalInstances: Integer; safecall;
    procedure Set_TotalInstances(count: Integer); safecall;
    function Get_EqualSpacing: WordBool; safecall;
    procedure Set_EqualSpacing(EqualSpacing: WordBool); safecall;
    function Get_VarySketch: WordBool; safecall;
    procedure Set_VarySketch(VarySketch: WordBool); safecall;
    function Get_GeometryPattern: WordBool; safecall;
    procedure Set_GeometryPattern(geometry: WordBool); safecall;
    function Get_PatternFeatureArray: OleVariant; safecall;
    procedure Set_PatternFeatureArray(ArrayOut: OleVariant); safecall;
    function GetPatternFeatureCount: Integer; safecall;
    function IGetPatternFeatureArray: IDispatch; safecall;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); safecall;
    function Get_SkippedItemArray: OleVariant; safecall;
    procedure Set_SkippedItemArray(ArrayOut: OleVariant); safecall;
    function GetSkippedItemCount: Integer; safecall;
    function IGetSkippedItemArray: Integer; safecall;
    procedure ISetSkippedItemArray(featCount: Integer; var ArrayDataIn: Integer); safecall;
    property axis: IDispatch read Get_axis write Set_axis;
    property ReverseDirection: WordBool read Get_ReverseDirection write Set_ReverseDirection;
    property spacing: Double read Get_spacing write Set_spacing;
    property TotalInstances: Integer read Get_TotalInstances write Set_TotalInstances;
    property EqualSpacing: WordBool read Get_EqualSpacing write Set_EqualSpacing;
    property VarySketch: WordBool read Get_VarySketch write Set_VarySketch;
    property GeometryPattern: WordBool read Get_GeometryPattern write Set_GeometryPattern;
    property PatternFeatureArray: OleVariant read Get_PatternFeatureArray write Set_PatternFeatureArray;
    property SkippedItemArray: OleVariant read Get_SkippedItemArray write Set_SkippedItemArray;
  end;

// *********************************************************************//
// DispIntf:  ICircularPatternFeatureDataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DBBF39DE-7AB5-11D4-AEB6-00C04FA0AC51}
// *********************************************************************//
  ICircularPatternFeatureDataDisp = dispinterface
    ['{DBBF39DE-7AB5-11D4-AEB6-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 1;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 2;
    procedure ReleaseSelectionAccess; dispid 3;
    property axis: IDispatch dispid 4;
    function GetAxisType: Integer; dispid 5;
    property ReverseDirection: WordBool dispid 6;
    property spacing: Double dispid 7;
    property TotalInstances: Integer dispid 8;
    property EqualSpacing: WordBool dispid 9;
    property VarySketch: WordBool dispid 10;
    property GeometryPattern: WordBool dispid 11;
    property PatternFeatureArray: OleVariant dispid 12;
    function GetPatternFeatureCount: Integer; dispid 13;
    function IGetPatternFeatureArray: IDispatch; dispid 14;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); dispid 15;
    property SkippedItemArray: OleVariant dispid 16;
    function GetSkippedItemCount: Integer; dispid 17;
    function IGetSkippedItemArray: Integer; dispid 18;
    procedure ISetSkippedItemArray(featCount: Integer; var ArrayDataIn: Integer); dispid 19;
  end;

// *********************************************************************//
// Interface: ILinearPatternFeatureData
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F86D1E94-7DE8-11D4-AEB7-00C04FA0AC51}
// *********************************************************************//
  ILinearPatternFeatureData = interface(IDispatch)
    ['{F86D1E94-7DE8-11D4-AEB7-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function Get_D1Axis: IDispatch; safecall;
    procedure Set_D1Axis(const refAxis: IDispatch); safecall;
    function Get_D2Axis: IDispatch; safecall;
    procedure Set_D2Axis(const refAxis: IDispatch); safecall;
    function GetD1AxisType: Integer; safecall;
    function GetD2AxisType: Integer; safecall;
    function Get_D1ReverseDirection: WordBool; safecall;
    procedure Set_D1ReverseDirection(ReverseDirection: WordBool); safecall;
    function Get_D2ReverseDirection: WordBool; safecall;
    procedure Set_D2ReverseDirection(ReverseDirection: WordBool); safecall;
    function Get_D1Spacing: Double; safecall;
    procedure Set_D1Spacing(distance: Double); safecall;
    function Get_D2Spacing: Double; safecall;
    procedure Set_D2Spacing(distance: Double); safecall;
    function Get_D1TotalInstances: Integer; safecall;
    procedure Set_D1TotalInstances(count: Integer); safecall;
    function Get_D2TotalInstances: Integer; safecall;
    procedure Set_D2TotalInstances(count: Integer); safecall;
    function Get_VarySketch: WordBool; safecall;
    procedure Set_VarySketch(VarySketch: WordBool); safecall;
    function Get_GeometryPattern: WordBool; safecall;
    procedure Set_GeometryPattern(geometry: WordBool); safecall;
    function Get_PatternFeatureArray: OleVariant; safecall;
    procedure Set_PatternFeatureArray(ArrayOut: OleVariant); safecall;
    function GetPatternFeatureCount: Integer; safecall;
    function IGetPatternFeatureArray: IDispatch; safecall;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); safecall;
    function Get_SkippedItemArray: OleVariant; safecall;
    procedure Set_SkippedItemArray(ArrayOut: OleVariant); safecall;
    function GetSkippedItemCount: Integer; safecall;
    function IGetSkippedItemArray: Integer; safecall;
    procedure ISetSkippedItemArray(featCount: Integer; var ArrayDataIn: Integer); safecall;
    property D1Axis: IDispatch read Get_D1Axis write Set_D1Axis;
    property D2Axis: IDispatch read Get_D2Axis write Set_D2Axis;
    property D1ReverseDirection: WordBool read Get_D1ReverseDirection write Set_D1ReverseDirection;
    property D2ReverseDirection: WordBool read Get_D2ReverseDirection write Set_D2ReverseDirection;
    property D1Spacing: Double read Get_D1Spacing write Set_D1Spacing;
    property D2Spacing: Double read Get_D2Spacing write Set_D2Spacing;
    property D1TotalInstances: Integer read Get_D1TotalInstances write Set_D1TotalInstances;
    property D2TotalInstances: Integer read Get_D2TotalInstances write Set_D2TotalInstances;
    property VarySketch: WordBool read Get_VarySketch write Set_VarySketch;
    property GeometryPattern: WordBool read Get_GeometryPattern write Set_GeometryPattern;
    property PatternFeatureArray: OleVariant read Get_PatternFeatureArray write Set_PatternFeatureArray;
    property SkippedItemArray: OleVariant read Get_SkippedItemArray write Set_SkippedItemArray;
  end;

// *********************************************************************//
// DispIntf:  ILinearPatternFeatureDataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F86D1E94-7DE8-11D4-AEB7-00C04FA0AC51}
// *********************************************************************//
  ILinearPatternFeatureDataDisp = dispinterface
    ['{F86D1E94-7DE8-11D4-AEB7-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 1;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 2;
    procedure ReleaseSelectionAccess; dispid 3;
    property D1Axis: IDispatch dispid 4;
    property D2Axis: IDispatch dispid 5;
    function GetD1AxisType: Integer; dispid 6;
    function GetD2AxisType: Integer; dispid 7;
    property D1ReverseDirection: WordBool dispid 8;
    property D2ReverseDirection: WordBool dispid 9;
    property D1Spacing: Double dispid 10;
    property D2Spacing: Double dispid 11;
    property D1TotalInstances: Integer dispid 12;
    property D2TotalInstances: Integer dispid 13;
    property VarySketch: WordBool dispid 14;
    property GeometryPattern: WordBool dispid 15;
    property PatternFeatureArray: OleVariant dispid 16;
    function GetPatternFeatureCount: Integer; dispid 17;
    function IGetPatternFeatureArray: IDispatch; dispid 18;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); dispid 19;
    property SkippedItemArray: OleVariant dispid 20;
    function GetSkippedItemCount: Integer; dispid 21;
    function IGetSkippedItemArray: Integer; dispid 22;
    procedure ISetSkippedItemArray(featCount: Integer; var ArrayDataIn: Integer); dispid 23;
  end;

// *********************************************************************//
// Interface: ITablePatternFeatureData
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E5D1AF7C-7F5D-11D4-AEB7-00C04FA0AC51}
// *********************************************************************//
  ITablePatternFeatureData = interface(IDispatch)
    ['{E5D1AF7C-7F5D-11D4-AEB7-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function Get_CoordinateSystem: IDispatch; safecall;
    procedure Set_CoordinateSystem(const refCoord: IDispatch); safecall;
    function Get_ReferencePoint: IDispatch; safecall;
    procedure Set_ReferencePoint(const refPoint: IDispatch); safecall;
    function GetReferencePointType: Integer; safecall;
    function Get_useCentroid: WordBool; safecall;
    procedure Set_useCentroid(useCentroid: WordBool); safecall;
    function SavePointsToFile(const fileName: WideString): WordBool; safecall;
    function LoadPointsFromFile(const fileName: WideString): WordBool; safecall;
    function GetBasePoint: OleVariant; safecall;
    function IGetBasePoint: Double; safecall;
    function Get_GeometryPattern: WordBool; safecall;
    procedure Set_GeometryPattern(geometry: WordBool); safecall;
    function Get_PatternFeatureArray: OleVariant; safecall;
    procedure Set_PatternFeatureArray(ArrayOut: OleVariant); safecall;
    function GetPatternFeatureCount: Integer; safecall;
    function IGetPatternFeatureArray: IDispatch; safecall;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); safecall;
    function Get_pointArray: OleVariant; safecall;
    procedure Set_pointArray(ArrayOut: OleVariant); safecall;
    function GetPointCount: Integer; safecall;
    function IGetPointArray: Double; safecall;
    procedure ISetPointArray(featCount: Integer; var ArrayDataIn: Double); safecall;
    property CoordinateSystem: IDispatch read Get_CoordinateSystem write Set_CoordinateSystem;
    property ReferencePoint: IDispatch read Get_ReferencePoint write Set_ReferencePoint;
    property useCentroid: WordBool read Get_useCentroid write Set_useCentroid;
    property GeometryPattern: WordBool read Get_GeometryPattern write Set_GeometryPattern;
    property PatternFeatureArray: OleVariant read Get_PatternFeatureArray write Set_PatternFeatureArray;
    property pointArray: OleVariant read Get_pointArray write Set_pointArray;
  end;

// *********************************************************************//
// DispIntf:  ITablePatternFeatureDataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E5D1AF7C-7F5D-11D4-AEB7-00C04FA0AC51}
// *********************************************************************//
  ITablePatternFeatureDataDisp = dispinterface
    ['{E5D1AF7C-7F5D-11D4-AEB7-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 1;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 2;
    procedure ReleaseSelectionAccess; dispid 3;
    property CoordinateSystem: IDispatch dispid 4;
    property ReferencePoint: IDispatch dispid 5;
    function GetReferencePointType: Integer; dispid 6;
    property useCentroid: WordBool dispid 7;
    function SavePointsToFile(const fileName: WideString): WordBool; dispid 8;
    function LoadPointsFromFile(const fileName: WideString): WordBool; dispid 9;
    function GetBasePoint: OleVariant; dispid 10;
    function IGetBasePoint: Double; dispid 11;
    property GeometryPattern: WordBool dispid 12;
    property PatternFeatureArray: OleVariant dispid 13;
    function GetPatternFeatureCount: Integer; dispid 14;
    function IGetPatternFeatureArray: IDispatch; dispid 15;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); dispid 16;
    property pointArray: OleVariant dispid 17;
    function GetPointCount: Integer; dispid 18;
    function IGetPointArray: Double; dispid 19;
    procedure ISetPointArray(featCount: Integer; var ArrayDataIn: Double); dispid 20;
  end;

// *********************************************************************//
// Interface: ISketchPatternFeatureData
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AE998464-8050-11D4-AEB7-00C04FA0AC51}
// *********************************************************************//
  ISketchPatternFeatureData = interface(IDispatch)
    ['{AE998464-8050-11D4-AEB7-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function Get_sketch: IDispatch; safecall;
    procedure Set_sketch(const sketch: IDispatch); safecall;
    function Get_ReferencePoint: IDispatch; safecall;
    procedure Set_ReferencePoint(const refPoint: IDispatch); safecall;
    function GetReferencePointType: Integer; safecall;
    function Get_useCentroid: WordBool; safecall;
    procedure Set_useCentroid(useCentroid: WordBool); safecall;
    function GetBasePoint: OleVariant; safecall;
    function IGetBasePoint: Double; safecall;
    function Get_GeometryPattern: WordBool; safecall;
    procedure Set_GeometryPattern(geometry: WordBool); safecall;
    function Get_PatternFeatureArray: OleVariant; safecall;
    procedure Set_PatternFeatureArray(ArrayOut: OleVariant); safecall;
    function GetPatternFeatureCount: Integer; safecall;
    function IGetPatternFeatureArray: IDispatch; safecall;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); safecall;
    property sketch: IDispatch read Get_sketch write Set_sketch;
    property ReferencePoint: IDispatch read Get_ReferencePoint write Set_ReferencePoint;
    property useCentroid: WordBool read Get_useCentroid write Set_useCentroid;
    property GeometryPattern: WordBool read Get_GeometryPattern write Set_GeometryPattern;
    property PatternFeatureArray: OleVariant read Get_PatternFeatureArray write Set_PatternFeatureArray;
  end;

// *********************************************************************//
// DispIntf:  ISketchPatternFeatureDataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AE998464-8050-11D4-AEB7-00C04FA0AC51}
// *********************************************************************//
  ISketchPatternFeatureDataDisp = dispinterface
    ['{AE998464-8050-11D4-AEB7-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 1;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 2;
    procedure ReleaseSelectionAccess; dispid 3;
    property sketch: IDispatch dispid 4;
    property ReferencePoint: IDispatch dispid 5;
    function GetReferencePointType: Integer; dispid 6;
    property useCentroid: WordBool dispid 7;
    function GetBasePoint: OleVariant; dispid 8;
    function IGetBasePoint: Double; dispid 9;
    property GeometryPattern: WordBool dispid 10;
    property PatternFeatureArray: OleVariant dispid 11;
    function GetPatternFeatureCount: Integer; dispid 12;
    function IGetPatternFeatureArray: IDispatch; dispid 13;
    procedure ISetPatternFeatureArray(featCount: Integer; var ArrayDataIn: IDispatch); dispid 14;
  end;

// *********************************************************************//
// Interface: IMirrorSolidFeatureData
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E9172718-836B-11D4-AEB7-00C04FA0AC51}
// *********************************************************************//
  IMirrorSolidFeatureData = interface(IDispatch)
    ['{E9172718-836B-11D4-AEB7-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; safecall;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; safecall;
    procedure ReleaseSelectionAccess; safecall;
    function Get_face: IDispatch; safecall;
    procedure Set_face(const refFace: IDispatch); safecall;
    property face: IDispatch read Get_face write Set_face;
  end;

// *********************************************************************//
// DispIntf:  IMirrorSolidFeatureDataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E9172718-836B-11D4-AEB7-00C04FA0AC51}
// *********************************************************************//
  IMirrorSolidFeatureDataDisp = dispinterface
    ['{E9172718-836B-11D4-AEB7-00C04FA0AC51}']
    function AccessSelections(const topDoc: IDispatch; const component: IDispatch): WordBool; dispid 1;
    function IAccessSelections(const topDoc: IModelDoc; const component: IComponent): WordBool; dispid 2;
    procedure ReleaseSelectionAccess; dispid 3;
    property face: IDispatch dispid 4;
  end;

// *********************************************************************//
// DispIntf:  DSldWorksEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {83A33D22-37C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  DSldWorksEvents = dispinterface
    ['{83A33D22-37C5-11CE-BFD4-00400513BB57}']
    function FileOpenNotify(const fileName: WideString): Integer; dispid 1;
    function FileNewNotify(const newDoc: IDispatch; DocType: Integer): Integer; dispid 2;
    function DestroyNotify: Integer; dispid 3;
    function ActiveDocChangeNotify: Integer; dispid 4;
    function ActiveModelDocChangeNotify: Integer; dispid 5;
    function PropertySheetCreateNotify(const sheet: IDispatch; sheetType: Integer): Integer; dispid 6;
    function NonNativeFileOpenNotify(const fileName: WideString): Integer; dispid 7;
    function LightSheetCreateNotify(const NewSheet: IDispatch; sheetType: Integer; lightId: Integer): Integer; dispid 8;
    function DocumentConversionNotify(const fileName: WideString): Integer; dispid 9;
    function DocumentLoadNotify(const docTitle: WideString; const docPath: WideString): Integer; dispid 10;
    function FileNewNotify2(const newDoc: IDispatch; DocType: Integer; 
                            const templateName: WideString): Integer; dispid 11;
    function FileOpenNotify2(const fileName: WideString): Integer; dispid 12;
    function ReferenceNotFoundNotify(const fileName: WideString): Integer; dispid 14;
  end;

// *********************************************************************//
// DispIntf:  DPartDocEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {83A33D32-37C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  DPartDocEvents = dispinterface
    ['{83A33D32-37C5-11CE-BFD4-00400513BB57}']
    function RegenNotify: Integer; dispid 1;
    function DestroyNotify: Integer; dispid 2;
    function RegenPostNotify: Integer; dispid 3;
    function ViewNewNotify: Integer; dispid 4;
    function NewSelectionNotify: Integer; dispid 5;
    function FileSaveNotify(const fileName: WideString): Integer; dispid 6;
    function FileSaveAsNotify(const fileName: WideString): Integer; dispid 7;
    function LoadFromStorageNotify: Integer; dispid 8;
    function SaveToStorageNotify: Integer; dispid 9;
    function ActiveConfigChangeNotify: Integer; dispid 10;
    function ActiveConfigChangePostNotify: Integer; dispid 11;
    function ViewNewNotify2(const viewBeingAdded: IDispatch): Integer; dispid 14;
    function LightingDialogCreateNotify(const dialog: IDispatch): Integer; dispid 15;
    function AddItemNotify(entityType: Integer; const itemName: WideString): Integer; dispid 16;
    function RenameItemNotify(entityType: Integer; const oldName: WideString; 
                              const newName: WideString): Integer; dispid 17;
    function DeleteItemNotify(entityType: Integer; const itemName: WideString): Integer; dispid 18;
    function ModifyNotify: Integer; dispid 19;
    function FileReloadNotify: Integer; dispid 20;
    function AddCustomPropertyNotify(const propName: WideString; const configuration: WideString; 
                                     const Value: WideString; valueType: Integer): Integer; dispid 21;
    function ChangeCustomPropertyNotify(const propName: WideString; 
                                        const configuration: WideString; 
                                        const oldValue: WideString; const newValue: WideString; 
                                        valueType: Integer): Integer; dispid 22;
    function DeleteCustomPropertyNotify(const propName: WideString; 
                                        const configuration: WideString; const Value: WideString; 
                                        valueType: Integer): Integer; dispid 23;
    function FeatureEditPreNotify(const editFeature: IDispatch): Integer; dispid 24;
    function FeatureSketchEditPreNotify(const editFeature: IDispatch; const featureSketch: IDispatch): Integer; dispid 25;
    function FileSaveAsNotify2(const fileName: WideString): Integer; dispid 26;
    function DeleteSelectionPreNotify: Integer; dispid 27;
    function FileReloadPreNotify: Integer; dispid 28;
  end;

// *********************************************************************//
// DispIntf:  DDrawingDocEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {83A33D34-37C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  DDrawingDocEvents = dispinterface
    ['{83A33D34-37C5-11CE-BFD4-00400513BB57}']
    function RegenNotify: Integer; dispid 1;
    function DestroyNotify: Integer; dispid 2;
    function RegenPostNotify: Integer; dispid 3;
    function ViewNewNotify: Integer; dispid 4;
    function NewSelectionNotify: Integer; dispid 5;
    function FileSaveNotify(const fileName: WideString): Integer; dispid 6;
    function FileSaveAsNotify(const fileName: WideString): Integer; dispid 7;
    function LoadFromStorageNotify: Integer; dispid 8;
    function SaveToStorageNotify: Integer; dispid 9;
    function ActiveConfigChangeNotify: Integer; dispid 10;
    function ActiveConfigChangePostNotify: Integer; dispid 11;
    function ViewNewNotify2(const viewBeingAdded: IDispatch): Integer; dispid 14;
    function AddItemNotify(entityType: Integer; const itemName: WideString): Integer; dispid 15;
    function RenameItemNotify(entityType: Integer; const oldName: WideString; 
                              const newName: WideString): Integer; dispid 16;
    function DeleteItemNotify(entityType: Integer; const itemName: WideString): Integer; dispid 17;
    function ModifyNotify: Integer; dispid 18;
    function FileReloadNotify: Integer; dispid 19;
    function AddCustomPropertyNotify(const propName: WideString; const configuration: WideString; 
                                     const Value: WideString; valueType: Integer): Integer; dispid 20;
    function ChangeCustomPropertyNotify(const propName: WideString; 
                                        const configuration: WideString; 
                                        const oldValue: WideString; const newValue: WideString; 
                                        valueType: Integer): Integer; dispid 21;
    function DeleteCustomPropertyNotify(const propName: WideString; 
                                        const configuration: WideString; const Value: WideString; 
                                        valueType: Integer): Integer; dispid 22;
    function FileSaveAsNotify2(const fileName: WideString): Integer; dispid 23;
    function DeleteSelectionPreNotify: Integer; dispid 24;
    function FileReloadPreNotify: Integer; dispid 25;
  end;

// *********************************************************************//
// DispIntf:  DAssemblyDocEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {83A33D35-37C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  DAssemblyDocEvents = dispinterface
    ['{83A33D35-37C5-11CE-BFD4-00400513BB57}']
    function RegenNotify: Integer; dispid 1;
    function DestroyNotify: Integer; dispid 2;
    function RegenPostNotify: Integer; dispid 3;
    function ViewNewNotify: Integer; dispid 4;
    function NewSelectionNotify: Integer; dispid 5;
    function FileSaveNotify(const fileName: WideString): Integer; dispid 6;
    function FileSaveAsNotify(const fileName: WideString): Integer; dispid 7;
    function LoadFromStorageNotify: Integer; dispid 8;
    function SaveToStorageNotify: Integer; dispid 9;
    function ActiveConfigChangeNotify: Integer; dispid 10;
    function ActiveConfigChangePostNotify: Integer; dispid 11;
    function BeginInContextEditNotify(const docBeingEdited: IDispatch; DocType: Integer): Integer; dispid 12;
    function EndInContextEditNotify(const docBeingEdited: IDispatch; DocType: Integer): Integer; dispid 13;
    function ViewNewNotify2(const viewBeingAdded: IDispatch): Integer; dispid 16;
    function LightingDialogCreateNotify(const dialog: IDispatch): Integer; dispid 17;
    function AddItemNotify(entityType: Integer; const itemName: WideString): Integer; dispid 18;
    function RenameItemNotify(entityType: Integer; const oldName: WideString; 
                              const newName: WideString): Integer; dispid 19;
    function DeleteItemNotify(entityType: Integer; const itemName: WideString): Integer; dispid 20;
    function ModifyNotify: Integer; dispid 21;
    function ComponentStateChangeNotify(const componentModel: IDispatch; oldCompState: Smallint; 
                                        newCompState: Smallint): Integer; dispid 22;
    function FileDropNotify(const fileName: WideString): Integer; dispid 23;
    function FileReloadNotify: Integer; dispid 24;
    function ComponentStateChangeNotify2(const componentModel: IDispatch; 
                                         const compName: WideString; oldCompState: Smallint; 
                                         newCompState: Smallint): Integer; dispid 25;
    function AddCustomPropertyNotify(const propName: WideString; const configuration: WideString; 
                                     const Value: WideString; valueType: Integer): Integer; dispid 26;
    function ChangeCustomPropertyNotify(const propName: WideString; 
                                        const configuration: WideString; 
                                        const oldValue: WideString; const newValue: WideString; 
                                        valueType: Integer): Integer; dispid 27;
    function DeleteCustomPropertyNotify(const propName: WideString; 
                                        const configuration: WideString; const Value: WideString; 
                                        valueType: Integer): Integer; dispid 28;
    function FeatureEditPreNotify(const editFeature: IDispatch): Integer; dispid 29;
    function FeatureSketchEditPreNotify(const editFeature: IDispatch; const featureSketch: IDispatch): Integer; dispid 30;
    function FileSaveAsNotify2(const fileName: WideString): Integer; dispid 31;
    function InterferenceNotify(var pComp: OleVariant; var pFace: OleVariant): Integer; dispid 32;
    function DeleteSelectionPreNotify: Integer; dispid 33;
    function FileReloadPreNotify: Integer; dispid 34;
    function ComponentMoveNotify: Integer; dispid 35;
  end;

// *********************************************************************//
// DispIntf:  DModelViewEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {83A33D4C-37C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  DModelViewEvents = dispinterface
    ['{83A33D4C-37C5-11CE-BFD4-00400513BB57}']
    function RepaintNotify(paintType: Integer): Integer; dispid 1;
    function ViewChangeNotify(view: OleVariant): Integer; dispid 2;
    function DestroyNotify: Integer; dispid 3;
    function RepaintPostNotify: Integer; dispid 4;
    function BufferSwapNotify: Integer; dispid 5;
    function DestroyNotify2(destroyType: Integer): Integer; dispid 6;
  end;

// *********************************************************************//
// DispIntf:  DFeatMgrViewEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {83A33D76-27C5-11CE-BFD4-00400513BB57}
// *********************************************************************//
  DFeatMgrViewEvents = dispinterface
    ['{83A33D76-27C5-11CE-BFD4-00400513BB57}']
    function ActivateNotify(var view: OleVariant): Integer; dispid 1;
    function DeactivateNotify(var view: OleVariant): Integer; dispid 2;
    function DestroyNotify(var view: OleVariant): Integer; dispid 3;
  end;

// *********************************************************************//
// DispIntf:  DSWPropertySheetEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {E05FF9E0-FC82-11D2-9395-00C04F79BFFE}
// *********************************************************************//
  DSWPropertySheetEvents = dispinterface
    ['{E05FF9E0-FC82-11D2-9395-00C04F79BFFE}']
    function DestroyNotify: Integer; dispid 1;
    function HelpNotify(page: Integer): Integer; dispid 2;
  end;

// *********************************************************************//
// DispIntf:  ISdmDoc
// Flags:     (4096) Dispatchable
// GUID:      {AC048CEA-AE93-11D3-AEA7-00C04F60F02A}
// *********************************************************************//
  ISdmDoc = dispinterface
    ['{AC048CEA-AE93-11D3-AEA7-00C04F60F02A}']
  end;

  CoSldWorks_ = class
    class function Create: ISldWorks;
    class function CreateRemote(const MachineName: string): ISldWorks;
  end;

  CoPartDoc = class
    class function Create: IPartDoc;
    class function CreateRemote(const MachineName: string): IPartDoc;
  end;

  CoDrawingDoc = class
    class function Create: IDrawingDoc;
    class function CreateRemote(const MachineName: string): IDrawingDoc;
  end;

  CoAssemblyDoc = class
    class function Create: IAssemblyDoc;
    class function CreateRemote(const MachineName: string): IAssemblyDoc;
  end;

  Cofeature = class
    class function Create: IFeature;
    class function CreateRemote(const MachineName: string): IFeature;
  end;

  CoDimension = class
    class function Create: IDimension;
    class function CreateRemote(const MachineName: string): IDimension;
  end;

  CoBody = class
    class function Create: IBody;
    class function CreateRemote(const MachineName: string): IBody;
  end;

  Coface = class
    class function Create: IFace;
    class function CreateRemote(const MachineName: string): IFace;
  end;

  Cosurface = class
    class function Create: ISurface;
    class function CreateRemote(const MachineName: string): ISurface;
  end;

  CoEdge_ = class
    class function Create: IEdge;
    class function CreateRemote(const MachineName: string): IEdge;
  end;

  CoCurve = class
    class function Create: ICurve;
    class function CreateRemote(const MachineName: string): ICurve;
  end;

  CoModelDoc = class
    class function Create: IModelDoc;
    class function CreateRemote(const MachineName: string): IModelDoc;
  end;

  CoFrame = class
    class function Create: IFrame;
    class function CreateRemote(const MachineName: string): IFrame;
  end;

  CoGtol = class
    class function Create: IGtol;
    class function CreateRemote(const MachineName: string): IGtol;
  end;

  CoModelView = class
    class function Create: IModelView;
    class function CreateRemote(const MachineName: string): IModelView;
  end;

  CoMember = class
    class function Create: IMember;
    class function CreateRemote(const MachineName: string): IMember;
  end;

  Coview = class
    class function Create: IView;
    class function CreateRemote(const MachineName: string): IView;
  end;

  Cosketch = class
    class function Create: ISketch;
    class function CreateRemote(const MachineName: string): ISketch;
  end;

  CoLoop = class
    class function Create: ILoop;
    class function CreateRemote(const MachineName: string): ILoop;
  end;

  Conote = class
    class function Create: INote;
    class function CreateRemote(const MachineName: string): INote;
  end;

  CoCoEdge = class
    class function Create: ICoEdge;
    class function CreateRemote(const MachineName: string): ICoEdge;
  end;

  CoVertex = class
    class function Create: IVertex;
    class function CreateRemote(const MachineName: string): IVertex;
  end;

  CoSelectionMgr = class
    class function Create: ISelectionMgr;
    class function CreateRemote(const MachineName: string): ISelectionMgr;
  end;

  CoEnumFaces = class
    class function Create: IEnumFaces;
    class function CreateRemote(const MachineName: string): IEnumFaces;
  end;

  CoEnumLoops = class
    class function Create: IEnumLoops;
    class function CreateRemote(const MachineName: string): IEnumLoops;
  end;

  CoEnumEdges = class
    class function Create: IEnumEdges;
    class function CreateRemote(const MachineName: string): IEnumEdges;
  end;

  CoEnumCoEdges = class
    class function Create: IEnumCoEdges;
    class function CreateRemote(const MachineName: string): IEnumCoEdges;
  end;

  CoEnumBodies = class
    class function Create: IEnumBodies;
    class function CreateRemote(const MachineName: string): IEnumBodies;
  end;

  Coentity = class
    class function Create: IEntity;
    class function CreateRemote(const MachineName: string): IEntity;
  end;

  CoattributeDef = class
    class function Create: IAttributeDef;
    class function CreateRemote(const MachineName: string): IAttributeDef;
  end;

  CoParameter = class
    class function Create: IParameter;
    class function CreateRemote(const MachineName: string): IParameter;
  end;

  CoAttribute = class
    class function Create: IAttribute;
    class function CreateRemote(const MachineName: string): IAttribute;
  end;

  CoModeler = class
    class function Create: IModeler;
    class function CreateRemote(const MachineName: string): IModeler;
  end;

  CoFeatMgrView = class
    class function Create: IFeatMgrView;
    class function CreateRemote(const MachineName: string): IFeatMgrView;
  end;

  CoEnvironment = class
    class function Create: IEnvironment;
    class function CreateRemote(const MachineName: string): IEnvironment;
  end;

  Cosheet = class
    class function Create: ISheet;
    class function CreateRemote(const MachineName: string): ISheet;
  end;

  CoBomTable = class
    class function Create: IBomTable;
    class function CreateRemote(const MachineName: string): IBomTable;
  end;

  CorefPlane = class
    class function Create: IRefPlane;
    class function CreateRemote(const MachineName: string): IRefPlane;
  end;

  CorefAxis = class
    class function Create: IRefAxis;
    class function CreateRemote(const MachineName: string): IRefAxis;
  end;

  CoMidSurface = class
    class function Create: IMidSurface;
    class function CreateRemote(const MachineName: string): IMidSurface;
  end;

  CoMate = class
    class function Create: IMate;
    class function CreateRemote(const MachineName: string): IMate;
  end;

  CoMateEntity = class
    class function Create: IMateEntity;
    class function CreateRemote(const MachineName: string): IMateEntity;
  end;

  CoSFSymbol = class
    class function Create: ISFSymbol;
    class function CreateRemote(const MachineName: string): ISFSymbol;
  end;

  CoDatumTag = class
    class function Create: IDatumTag;
    class function CreateRemote(const MachineName: string): IDatumTag;
  end;

  CoDatumTargetSym = class
    class function Create: IDatumTargetSym;
    class function CreateRemote(const MachineName: string): IDatumTargetSym;
  end;

  CoWeldSymbol = class
    class function Create: IWeldSymbol;
    class function CreateRemote(const MachineName: string): IWeldSymbol;
  end;

  Coconfiguration = class
    class function Create: IConfiguration;
    class function CreateRemote(const MachineName: string): IConfiguration;
  end;

  Cocomponent = class
    class function Create: IComponent;
    class function CreateRemote(const MachineName: string): IComponent;
  end;

  CoDisplayData = class
    class function Create: IDisplayData;
    class function CreateRemote(const MachineName: string): IDisplayData;
  end;

  CoCThread = class
    class function Create: ICThread;
    class function CreateRemote(const MachineName: string): ICThread;
  end;

  CoDisplayDimension = class
    class function Create: IDisplayDimension;
    class function CreateRemote(const MachineName: string): IDisplayDimension;
  end;

  CoReferenceCurve = class
    class function Create: IReferenceCurve;
    class function CreateRemote(const MachineName: string): IReferenceCurve;
  end;

  CoColorTable = class
    class function Create: IColorTable;
    class function CreateRemote(const MachineName: string): IColorTable;
  end;

  CoSWPropertySheet = class
    class function Create: ISWPropertySheet;
    class function CreateRemote(const MachineName: string): ISWPropertySheet;
  end;

  CoAnnotation = class
    class function Create: IAnnotation;
    class function CreateRemote(const MachineName: string): IAnnotation;
  end;

  CoEnumDisplayDimensions = class
    class function Create: IEnumDisplayDimensions;
    class function CreateRemote(const MachineName: string): IEnumDisplayDimensions;
  end;

  CoRibFeatureData = class
    class function Create: IRibFeatureData;
    class function CreateRemote(const MachineName: string): IRibFeatureData;
  end;

  CoDomeFeatureData = class
    class function Create: IDomeFeatureData;
    class function CreateRemote(const MachineName: string): IDomeFeatureData;
  end;

  CoEnumModelViews = class
    class function Create: IEnumModelViews;
    class function CreateRemote(const MachineName: string): IEnumModelViews;
  end;

  CoEnumDocuments = class
    class function Create: IEnumDocuments;
    class function CreateRemote(const MachineName: string): IEnumDocuments;
  end;

  CoCustomSymbol = class
    class function Create: ICustomSymbol;
    class function CreateRemote(const MachineName: string): ICustomSymbol;
  end;

  CoDetailingDefaults = class
    class function Create: IDetailingDefaults;
    class function CreateRemote(const MachineName: string): IDetailingDefaults;
  end;

  CotextFormat = class
    class function Create: ITextFormat;
    class function CreateRemote(const MachineName: string): ITextFormat;
  end;

  CoSketchPoint = class
    class function Create: ISketchPoint;
    class function CreateRemote(const MachineName: string): ISketchPoint;
  end;

  CoSketchSegment = class
    class function Create: ISketchSegment;
    class function CreateRemote(const MachineName: string): ISketchSegment;
  end;

  CoSketchLine = class
    class function Create: ISketchLine;
    class function CreateRemote(const MachineName: string): ISketchLine;
  end;

  CoSketchArc = class
    class function Create: ISketchArc;
    class function CreateRemote(const MachineName: string): ISketchArc;
  end;

  CoSketchText = class
    class function Create: ISketchText;
    class function CreateRemote(const MachineName: string): ISketchText;
  end;

  CoSketchEllipse = class
    class function Create: ISketchEllipse;
    class function CreateRemote(const MachineName: string): ISketchEllipse;
  end;

  CoSketchParabola = class
    class function Create: ISketchParabola;
    class function CreateRemote(const MachineName: string): ISketchParabola;
  end;

  CoSketchSpline = class
    class function Create: ISketchSpline;
    class function CreateRemote(const MachineName: string): ISketchSpline;
  end;

  CoEnumSketchPoints = class
    class function Create: IEnumSketchPoints;
    class function CreateRemote(const MachineName: string): IEnumSketchPoints;
  end;

  CoEnumSketchSegments = class
    class function Create: IEnumSketchSegments;
    class function CreateRemote(const MachineName: string): IEnumSketchSegments;
  end;

  CoLightDialog = class
    class function Create: ILightDialog;
    class function CreateRemote(const MachineName: string): ILightDialog;
  end;

  CoLayer = class
    class function Create: ILayer;
    class function CreateRemote(const MachineName: string): ILayer;
  end;

  CoLayerMgr = class
    class function Create: ILayerMgr;
    class function CreateRemote(const MachineName: string): ILayerMgr;
  end;

  CoDesignTable = class
    class function Create: IDesignTable;
    class function CreateRemote(const MachineName: string): IDesignTable;
  end;

  CoSketchHatch = class
    class function Create: ISketchHatch;
    class function CreateRemote(const MachineName: string): ISketchHatch;
  end;

  CoEnumSketchHatches = class
    class function Create: IEnumSketchHatches;
    class function CreateRemote(const MachineName: string): IEnumSketchHatches;
  end;

  CoEnumCurves = class
    class function Create: IEnumCurves;
    class function CreateRemote(const MachineName: string): IEnumCurves;
  end;

  CoSimpleHoleFeatureData = class
    class function Create: ISimpleHoleFeatureData;
    class function CreateRemote(const MachineName: string): ISimpleHoleFeatureData;
  end;

  CoWizardHoleFeatureData = class
    class function Create: IWizardHoleFeatureData;
    class function CreateRemote(const MachineName: string): IWizardHoleFeatureData;
  end;

  CoChamferFeatureData = class
    class function Create: IChamferFeatureData;
    class function CreateRemote(const MachineName: string): IChamferFeatureData;
  end;

  CoDraftFeatureData = class
    class function Create: IDraftFeatureData;
    class function CreateRemote(const MachineName: string): IDraftFeatureData;
  end;

  CoSimpleFilletFeatureData = class
    class function Create: ISimpleFilletFeatureData;
    class function CreateRemote(const MachineName: string): ISimpleFilletFeatureData;
  end;

  CoVariableFilletFeatureData = class
    class function Create: IVariableFilletFeatureData;
    class function CreateRemote(const MachineName: string): IVariableFilletFeatureData;
  end;

  CoExtrudeFeatureData = class
    class function Create: IExtrudeFeatureData;
    class function CreateRemote(const MachineName: string): IExtrudeFeatureData;
  end;

  CoRevolveFeatureData = class
    class function Create: IRevolveFeatureData;
    class function CreateRemote(const MachineName: string): IRevolveFeatureData;
  end;

  CoSdmDoc = class
    class function Create: ISdmDoc;
    class function CreateRemote(const MachineName: string): ISdmDoc;
  end;

  CoDrSection = class
    class function Create: IDrSection;
    class function CreateRemote(const MachineName: string): IDrSection;
  end;

  CoEnumComponents = class
    class function Create: IEnumComponents;
    class function CreateRemote(const MachineName: string): IEnumComponents;
  end;

  CoEnumDrSections = class
    class function Create: IEnumDrSections;
    class function CreateRemote(const MachineName: string): IEnumDrSections;
  end;

  CoExplodeStep = class
    class function Create: IExplodeStep;
    class function CreateRemote(const MachineName: string): IExplodeStep;
  end;

  CoMathUtility = class
    class function Create: IMathUtility;
    class function CreateRemote(const MachineName: string): IMathUtility;
  end;

  CoMathTransform = class
    class function Create: IMathTransform;
    class function CreateRemote(const MachineName: string): IMathTransform;
  end;

  CoMathPoint = class
    class function Create: IMathPoint;
    class function CreateRemote(const MachineName: string): IMathPoint;
  end;

  CoMathVector = class
    class function Create: IMathVector;
    class function CreateRemote(const MachineName: string): IMathVector;
  end;

  CoMirrorPatternFeatureData = class
    class function Create: IMirrorPatternFeatureData;
    class function CreateRemote(const MachineName: string): IMirrorPatternFeatureData;
  end;

  CoDetailCircle = class
    class function Create: IDetailCircle;
    class function CreateRemote(const MachineName: string): IDetailCircle;
  end;

  CoCircularPatternFeatureData = class
    class function Create: ICircularPatternFeatureData;
    class function CreateRemote(const MachineName: string): ICircularPatternFeatureData;
  end;

  CoLinearPatternFeatureData = class
    class function Create: ILinearPatternFeatureData;
    class function CreateRemote(const MachineName: string): ILinearPatternFeatureData;
  end;

  CoTablePatternFeatureData = class
    class function Create: ITablePatternFeatureData;
    class function CreateRemote(const MachineName: string): ITablePatternFeatureData;
  end;

  CoSketchPatternFeatureData = class
    class function Create: ISketchPatternFeatureData;
    class function CreateRemote(const MachineName: string): ISketchPatternFeatureData;
  end;

  CoMirrorSolidFeatureData = class
    class function Create: IMirrorSolidFeatureData;
    class function CreateRemote(const MachineName: string): IMirrorSolidFeatureData;
  end;

  CoPropertyManagerPage = class
    class function Create: IPropertyManagerPage;
    class function CreateRemote(const MachineName: string): IPropertyManagerPage;
  end;

  CoProjectionArrow = class
    class function Create: IProjectionArrow;
    class function CreateRemote(const MachineName: string): IProjectionArrow;
  end;

  CoTessellation = class
    class function Create: ITessellation;
    class function CreateRemote(const MachineName: string): ITessellation;
  end;

  CoUserUnit = class
    class function Create: IUserUnit;
    class function CreateRemote(const MachineName: string): IUserUnit;
  end;

implementation

uses ComObj;

class function CoSldWorks_.Create: ISldWorks;
begin
  Result := CreateComObject(CLASS_SldWorks_) as ISldWorks;
end;

class function CoSldWorks_.CreateRemote(const MachineName: string): ISldWorks;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SldWorks_) as ISldWorks;
end;

class function CoPartDoc.Create: IPartDoc;
begin
  Result := CreateComObject(CLASS_PartDoc) as IPartDoc;
end;

class function CoPartDoc.CreateRemote(const MachineName: string): IPartDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PartDoc) as IPartDoc;
end;

class function CoDrawingDoc.Create: IDrawingDoc;
begin
  Result := CreateComObject(CLASS_DrawingDoc) as IDrawingDoc;
end;

class function CoDrawingDoc.CreateRemote(const MachineName: string): IDrawingDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DrawingDoc) as IDrawingDoc;
end;

class function CoAssemblyDoc.Create: IAssemblyDoc;
begin
  Result := CreateComObject(CLASS_AssemblyDoc) as IAssemblyDoc;
end;

class function CoAssemblyDoc.CreateRemote(const MachineName: string): IAssemblyDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AssemblyDoc) as IAssemblyDoc;
end;

class function Cofeature.Create: IFeature;
begin
  Result := CreateComObject(CLASS_feature) as IFeature;
end;

class function Cofeature.CreateRemote(const MachineName: string): IFeature;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_feature) as IFeature;
end;

class function CoDimension.Create: IDimension;
begin
  Result := CreateComObject(CLASS_Dimension) as IDimension;
end;

class function CoDimension.CreateRemote(const MachineName: string): IDimension;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Dimension) as IDimension;
end;

class function CoBody.Create: IBody;
begin
  Result := CreateComObject(CLASS_Body) as IBody;
end;

class function CoBody.CreateRemote(const MachineName: string): IBody;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Body) as IBody;
end;

class function Coface.Create: IFace;
begin
  Result := CreateComObject(CLASS_face) as IFace;
end;

class function Coface.CreateRemote(const MachineName: string): IFace;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_face) as IFace;
end;

class function Cosurface.Create: ISurface;
begin
  Result := CreateComObject(CLASS_surface) as ISurface;
end;

class function Cosurface.CreateRemote(const MachineName: string): ISurface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_surface) as ISurface;
end;

class function CoEdge_.Create: IEdge;
begin
  Result := CreateComObject(CLASS_Edge) as IEdge;
end;

class function CoEdge_.CreateRemote(const MachineName: string): IEdge;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Edge) as IEdge;
end;

class function CoCurve.Create: ICurve;
begin
  Result := CreateComObject(CLASS_Curve) as ICurve;
end;

class function CoCurve.CreateRemote(const MachineName: string): ICurve;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Curve) as ICurve;
end;

class function CoModelDoc.Create: IModelDoc;
begin
  Result := CreateComObject(CLASS_ModelDoc) as IModelDoc;
end;

class function CoModelDoc.CreateRemote(const MachineName: string): IModelDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ModelDoc) as IModelDoc;
end;

class function CoFrame.Create: IFrame;
begin
  Result := CreateComObject(CLASS_Frame) as IFrame;
end;

class function CoFrame.CreateRemote(const MachineName: string): IFrame;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Frame) as IFrame;
end;

class function CoGtol.Create: IGtol;
begin
  Result := CreateComObject(CLASS_Gtol) as IGtol;
end;

class function CoGtol.CreateRemote(const MachineName: string): IGtol;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Gtol) as IGtol;
end;

class function CoModelView.Create: IModelView;
begin
  Result := CreateComObject(CLASS_ModelView) as IModelView;
end;

class function CoModelView.CreateRemote(const MachineName: string): IModelView;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ModelView) as IModelView;
end;

class function CoMember.Create: IMember;
begin
  Result := CreateComObject(CLASS_Member) as IMember;
end;

class function CoMember.CreateRemote(const MachineName: string): IMember;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Member) as IMember;
end;

class function Coview.Create: IView;
begin
  Result := CreateComObject(CLASS_view) as IView;
end;

class function Coview.CreateRemote(const MachineName: string): IView;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_view) as IView;
end;

class function Cosketch.Create: ISketch;
begin
  Result := CreateComObject(CLASS_sketch) as ISketch;
end;

class function Cosketch.CreateRemote(const MachineName: string): ISketch;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_sketch) as ISketch;
end;

class function CoLoop.Create: ILoop;
begin
  Result := CreateComObject(CLASS_Loop) as ILoop;
end;

class function CoLoop.CreateRemote(const MachineName: string): ILoop;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Loop) as ILoop;
end;

class function Conote.Create: INote;
begin
  Result := CreateComObject(CLASS_note) as INote;
end;

class function Conote.CreateRemote(const MachineName: string): INote;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_note) as INote;
end;

class function CoCoEdge.Create: ICoEdge;
begin
  Result := CreateComObject(CLASS_CoEdge) as ICoEdge;
end;

class function CoCoEdge.CreateRemote(const MachineName: string): ICoEdge;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CoEdge) as ICoEdge;
end;

class function CoVertex.Create: IVertex;
begin
  Result := CreateComObject(CLASS_Vertex) as IVertex;
end;

class function CoVertex.CreateRemote(const MachineName: string): IVertex;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Vertex) as IVertex;
end;

class function CoSelectionMgr.Create: ISelectionMgr;
begin
  Result := CreateComObject(CLASS_SelectionMgr) as ISelectionMgr;
end;

class function CoSelectionMgr.CreateRemote(const MachineName: string): ISelectionMgr;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SelectionMgr) as ISelectionMgr;
end;

class function CoEnumFaces.Create: IEnumFaces;
begin
  Result := CreateComObject(CLASS_EnumFaces) as IEnumFaces;
end;

class function CoEnumFaces.CreateRemote(const MachineName: string): IEnumFaces;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumFaces) as IEnumFaces;
end;

class function CoEnumLoops.Create: IEnumLoops;
begin
  Result := CreateComObject(CLASS_EnumLoops) as IEnumLoops;
end;

class function CoEnumLoops.CreateRemote(const MachineName: string): IEnumLoops;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumLoops) as IEnumLoops;
end;

class function CoEnumEdges.Create: IEnumEdges;
begin
  Result := CreateComObject(CLASS_EnumEdges) as IEnumEdges;
end;

class function CoEnumEdges.CreateRemote(const MachineName: string): IEnumEdges;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumEdges) as IEnumEdges;
end;

class function CoEnumCoEdges.Create: IEnumCoEdges;
begin
  Result := CreateComObject(CLASS_EnumCoEdges) as IEnumCoEdges;
end;

class function CoEnumCoEdges.CreateRemote(const MachineName: string): IEnumCoEdges;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumCoEdges) as IEnumCoEdges;
end;

class function CoEnumBodies.Create: IEnumBodies;
begin
  Result := CreateComObject(CLASS_EnumBodies) as IEnumBodies;
end;

class function CoEnumBodies.CreateRemote(const MachineName: string): IEnumBodies;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumBodies) as IEnumBodies;
end;

class function Coentity.Create: IEntity;
begin
  Result := CreateComObject(CLASS_entity) as IEntity;
end;

class function Coentity.CreateRemote(const MachineName: string): IEntity;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_entity) as IEntity;
end;

class function CoattributeDef.Create: IAttributeDef;
begin
  Result := CreateComObject(CLASS_attributeDef) as IAttributeDef;
end;

class function CoattributeDef.CreateRemote(const MachineName: string): IAttributeDef;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_attributeDef) as IAttributeDef;
end;

class function CoParameter.Create: IParameter;
begin
  Result := CreateComObject(CLASS_Parameter) as IParameter;
end;

class function CoParameter.CreateRemote(const MachineName: string): IParameter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Parameter) as IParameter;
end;

class function CoAttribute.Create: IAttribute;
begin
  Result := CreateComObject(CLASS_Attribute) as IAttribute;
end;

class function CoAttribute.CreateRemote(const MachineName: string): IAttribute;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Attribute) as IAttribute;
end;

class function CoModeler.Create: IModeler;
begin
  Result := CreateComObject(CLASS_Modeler) as IModeler;
end;

class function CoModeler.CreateRemote(const MachineName: string): IModeler;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Modeler) as IModeler;
end;

class function CoFeatMgrView.Create: IFeatMgrView;
begin
  Result := CreateComObject(CLASS_FeatMgrView) as IFeatMgrView;
end;

class function CoFeatMgrView.CreateRemote(const MachineName: string): IFeatMgrView;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FeatMgrView) as IFeatMgrView;
end;

class function CoEnvironment.Create: IEnvironment;
begin
  Result := CreateComObject(CLASS_Environment) as IEnvironment;
end;

class function CoEnvironment.CreateRemote(const MachineName: string): IEnvironment;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Environment) as IEnvironment;
end;

class function Cosheet.Create: ISheet;
begin
  Result := CreateComObject(CLASS_sheet) as ISheet;
end;

class function Cosheet.CreateRemote(const MachineName: string): ISheet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_sheet) as ISheet;
end;

class function CoBomTable.Create: IBomTable;
begin
  Result := CreateComObject(CLASS_BomTable) as IBomTable;
end;

class function CoBomTable.CreateRemote(const MachineName: string): IBomTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BomTable) as IBomTable;
end;

class function CorefPlane.Create: IRefPlane;
begin
  Result := CreateComObject(CLASS_refPlane) as IRefPlane;
end;

class function CorefPlane.CreateRemote(const MachineName: string): IRefPlane;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_refPlane) as IRefPlane;
end;

class function CorefAxis.Create: IRefAxis;
begin
  Result := CreateComObject(CLASS_refAxis) as IRefAxis;
end;

class function CorefAxis.CreateRemote(const MachineName: string): IRefAxis;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_refAxis) as IRefAxis;
end;

class function CoMidSurface.Create: IMidSurface;
begin
  Result := CreateComObject(CLASS_MidSurface) as IMidSurface;
end;

class function CoMidSurface.CreateRemote(const MachineName: string): IMidSurface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MidSurface) as IMidSurface;
end;

class function CoMate.Create: IMate;
begin
  Result := CreateComObject(CLASS_Mate) as IMate;
end;

class function CoMate.CreateRemote(const MachineName: string): IMate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Mate) as IMate;
end;

class function CoMateEntity.Create: IMateEntity;
begin
  Result := CreateComObject(CLASS_MateEntity) as IMateEntity;
end;

class function CoMateEntity.CreateRemote(const MachineName: string): IMateEntity;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MateEntity) as IMateEntity;
end;

class function CoSFSymbol.Create: ISFSymbol;
begin
  Result := CreateComObject(CLASS_SFSymbol) as ISFSymbol;
end;

class function CoSFSymbol.CreateRemote(const MachineName: string): ISFSymbol;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SFSymbol) as ISFSymbol;
end;

class function CoDatumTag.Create: IDatumTag;
begin
  Result := CreateComObject(CLASS_DatumTag) as IDatumTag;
end;

class function CoDatumTag.CreateRemote(const MachineName: string): IDatumTag;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DatumTag) as IDatumTag;
end;

class function CoDatumTargetSym.Create: IDatumTargetSym;
begin
  Result := CreateComObject(CLASS_DatumTargetSym) as IDatumTargetSym;
end;

class function CoDatumTargetSym.CreateRemote(const MachineName: string): IDatumTargetSym;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DatumTargetSym) as IDatumTargetSym;
end;

class function CoWeldSymbol.Create: IWeldSymbol;
begin
  Result := CreateComObject(CLASS_WeldSymbol) as IWeldSymbol;
end;

class function CoWeldSymbol.CreateRemote(const MachineName: string): IWeldSymbol;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WeldSymbol) as IWeldSymbol;
end;

class function Coconfiguration.Create: IConfiguration;
begin
  Result := CreateComObject(CLASS_configuration) as IConfiguration;
end;

class function Coconfiguration.CreateRemote(const MachineName: string): IConfiguration;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_configuration) as IConfiguration;
end;

class function Cocomponent.Create: IComponent;
begin
  Result := CreateComObject(CLASS_component) as IComponent;
end;

class function Cocomponent.CreateRemote(const MachineName: string): IComponent;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_component) as IComponent;
end;

class function CoDisplayData.Create: IDisplayData;
begin
  Result := CreateComObject(CLASS_DisplayData) as IDisplayData;
end;

class function CoDisplayData.CreateRemote(const MachineName: string): IDisplayData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DisplayData) as IDisplayData;
end;

class function CoCThread.Create: ICThread;
begin
  Result := CreateComObject(CLASS_CThread) as ICThread;
end;

class function CoCThread.CreateRemote(const MachineName: string): ICThread;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CThread) as ICThread;
end;

class function CoDisplayDimension.Create: IDisplayDimension;
begin
  Result := CreateComObject(CLASS_DisplayDimension) as IDisplayDimension;
end;

class function CoDisplayDimension.CreateRemote(const MachineName: string): IDisplayDimension;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DisplayDimension) as IDisplayDimension;
end;

class function CoReferenceCurve.Create: IReferenceCurve;
begin
  Result := CreateComObject(CLASS_ReferenceCurve) as IReferenceCurve;
end;

class function CoReferenceCurve.CreateRemote(const MachineName: string): IReferenceCurve;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReferenceCurve) as IReferenceCurve;
end;

class function CoColorTable.Create: IColorTable;
begin
  Result := CreateComObject(CLASS_ColorTable) as IColorTable;
end;

class function CoColorTable.CreateRemote(const MachineName: string): IColorTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ColorTable) as IColorTable;
end;

class function CoSWPropertySheet.Create: ISWPropertySheet;
begin
  Result := CreateComObject(CLASS_SWPropertySheet) as ISWPropertySheet;
end;

class function CoSWPropertySheet.CreateRemote(const MachineName: string): ISWPropertySheet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWPropertySheet) as ISWPropertySheet;
end;

class function CoAnnotation.Create: IAnnotation;
begin
  Result := CreateComObject(CLASS_Annotation) as IAnnotation;
end;

class function CoAnnotation.CreateRemote(const MachineName: string): IAnnotation;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Annotation) as IAnnotation;
end;

class function CoEnumDisplayDimensions.Create: IEnumDisplayDimensions;
begin
  Result := CreateComObject(CLASS_EnumDisplayDimensions) as IEnumDisplayDimensions;
end;

class function CoEnumDisplayDimensions.CreateRemote(const MachineName: string): IEnumDisplayDimensions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumDisplayDimensions) as IEnumDisplayDimensions;
end;

class function CoRibFeatureData.Create: IRibFeatureData;
begin
  Result := CreateComObject(CLASS_RibFeatureData) as IRibFeatureData;
end;

class function CoRibFeatureData.CreateRemote(const MachineName: string): IRibFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RibFeatureData) as IRibFeatureData;
end;

class function CoDomeFeatureData.Create: IDomeFeatureData;
begin
  Result := CreateComObject(CLASS_DomeFeatureData) as IDomeFeatureData;
end;

class function CoDomeFeatureData.CreateRemote(const MachineName: string): IDomeFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DomeFeatureData) as IDomeFeatureData;
end;

class function CoEnumModelViews.Create: IEnumModelViews;
begin
  Result := CreateComObject(CLASS_EnumModelViews) as IEnumModelViews;
end;

class function CoEnumModelViews.CreateRemote(const MachineName: string): IEnumModelViews;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumModelViews) as IEnumModelViews;
end;

class function CoEnumDocuments.Create: IEnumDocuments;
begin
  Result := CreateComObject(CLASS_EnumDocuments) as IEnumDocuments;
end;

class function CoEnumDocuments.CreateRemote(const MachineName: string): IEnumDocuments;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumDocuments) as IEnumDocuments;
end;

class function CoCustomSymbol.Create: ICustomSymbol;
begin
  Result := CreateComObject(CLASS_CustomSymbol) as ICustomSymbol;
end;

class function CoCustomSymbol.CreateRemote(const MachineName: string): ICustomSymbol;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CustomSymbol) as ICustomSymbol;
end;

class function CoDetailingDefaults.Create: IDetailingDefaults;
begin
  Result := CreateComObject(CLASS_DetailingDefaults) as IDetailingDefaults;
end;

class function CoDetailingDefaults.CreateRemote(const MachineName: string): IDetailingDefaults;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DetailingDefaults) as IDetailingDefaults;
end;

class function CotextFormat.Create: ITextFormat;
begin
  Result := CreateComObject(CLASS_textFormat) as ITextFormat;
end;

class function CotextFormat.CreateRemote(const MachineName: string): ITextFormat;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_textFormat) as ITextFormat;
end;

class function CoSketchPoint.Create: ISketchPoint;
begin
  Result := CreateComObject(CLASS_SketchPoint) as ISketchPoint;
end;

class function CoSketchPoint.CreateRemote(const MachineName: string): ISketchPoint;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchPoint) as ISketchPoint;
end;

class function CoSketchSegment.Create: ISketchSegment;
begin
  Result := CreateComObject(CLASS_SketchSegment) as ISketchSegment;
end;

class function CoSketchSegment.CreateRemote(const MachineName: string): ISketchSegment;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchSegment) as ISketchSegment;
end;

class function CoSketchLine.Create: ISketchLine;
begin
  Result := CreateComObject(CLASS_SketchLine) as ISketchLine;
end;

class function CoSketchLine.CreateRemote(const MachineName: string): ISketchLine;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchLine) as ISketchLine;
end;

class function CoSketchArc.Create: ISketchArc;
begin
  Result := CreateComObject(CLASS_SketchArc) as ISketchArc;
end;

class function CoSketchArc.CreateRemote(const MachineName: string): ISketchArc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchArc) as ISketchArc;
end;

class function CoSketchText.Create: ISketchText;
begin
  Result := CreateComObject(CLASS_SketchText) as ISketchText;
end;

class function CoSketchText.CreateRemote(const MachineName: string): ISketchText;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchText) as ISketchText;
end;

class function CoSketchEllipse.Create: ISketchEllipse;
begin
  Result := CreateComObject(CLASS_SketchEllipse) as ISketchEllipse;
end;

class function CoSketchEllipse.CreateRemote(const MachineName: string): ISketchEllipse;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchEllipse) as ISketchEllipse;
end;

class function CoSketchParabola.Create: ISketchParabola;
begin
  Result := CreateComObject(CLASS_SketchParabola) as ISketchParabola;
end;

class function CoSketchParabola.CreateRemote(const MachineName: string): ISketchParabola;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchParabola) as ISketchParabola;
end;

class function CoSketchSpline.Create: ISketchSpline;
begin
  Result := CreateComObject(CLASS_SketchSpline) as ISketchSpline;
end;

class function CoSketchSpline.CreateRemote(const MachineName: string): ISketchSpline;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchSpline) as ISketchSpline;
end;

class function CoEnumSketchPoints.Create: IEnumSketchPoints;
begin
  Result := CreateComObject(CLASS_EnumSketchPoints) as IEnumSketchPoints;
end;

class function CoEnumSketchPoints.CreateRemote(const MachineName: string): IEnumSketchPoints;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumSketchPoints) as IEnumSketchPoints;
end;

class function CoEnumSketchSegments.Create: IEnumSketchSegments;
begin
  Result := CreateComObject(CLASS_EnumSketchSegments) as IEnumSketchSegments;
end;

class function CoEnumSketchSegments.CreateRemote(const MachineName: string): IEnumSketchSegments;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumSketchSegments) as IEnumSketchSegments;
end;

class function CoLightDialog.Create: ILightDialog;
begin
  Result := CreateComObject(CLASS_LightDialog) as ILightDialog;
end;

class function CoLightDialog.CreateRemote(const MachineName: string): ILightDialog;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LightDialog) as ILightDialog;
end;

class function CoLayer.Create: ILayer;
begin
  Result := CreateComObject(CLASS_Layer) as ILayer;
end;

class function CoLayer.CreateRemote(const MachineName: string): ILayer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Layer) as ILayer;
end;

class function CoLayerMgr.Create: ILayerMgr;
begin
  Result := CreateComObject(CLASS_LayerMgr) as ILayerMgr;
end;

class function CoLayerMgr.CreateRemote(const MachineName: string): ILayerMgr;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LayerMgr) as ILayerMgr;
end;

class function CoDesignTable.Create: IDesignTable;
begin
  Result := CreateComObject(CLASS_DesignTable) as IDesignTable;
end;

class function CoDesignTable.CreateRemote(const MachineName: string): IDesignTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DesignTable) as IDesignTable;
end;

class function CoSketchHatch.Create: ISketchHatch;
begin
  Result := CreateComObject(CLASS_SketchHatch) as ISketchHatch;
end;

class function CoSketchHatch.CreateRemote(const MachineName: string): ISketchHatch;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchHatch) as ISketchHatch;
end;

class function CoEnumSketchHatches.Create: IEnumSketchHatches;
begin
  Result := CreateComObject(CLASS_EnumSketchHatches) as IEnumSketchHatches;
end;

class function CoEnumSketchHatches.CreateRemote(const MachineName: string): IEnumSketchHatches;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumSketchHatches) as IEnumSketchHatches;
end;

class function CoEnumCurves.Create: IEnumCurves;
begin
  Result := CreateComObject(CLASS_EnumCurves) as IEnumCurves;
end;

class function CoEnumCurves.CreateRemote(const MachineName: string): IEnumCurves;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumCurves) as IEnumCurves;
end;

class function CoSimpleHoleFeatureData.Create: ISimpleHoleFeatureData;
begin
  Result := CreateComObject(CLASS_SimpleHoleFeatureData) as ISimpleHoleFeatureData;
end;

class function CoSimpleHoleFeatureData.CreateRemote(const MachineName: string): ISimpleHoleFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SimpleHoleFeatureData) as ISimpleHoleFeatureData;
end;

class function CoWizardHoleFeatureData.Create: IWizardHoleFeatureData;
begin
  Result := CreateComObject(CLASS_WizardHoleFeatureData) as IWizardHoleFeatureData;
end;

class function CoWizardHoleFeatureData.CreateRemote(const MachineName: string): IWizardHoleFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WizardHoleFeatureData) as IWizardHoleFeatureData;
end;

class function CoChamferFeatureData.Create: IChamferFeatureData;
begin
  Result := CreateComObject(CLASS_ChamferFeatureData) as IChamferFeatureData;
end;

class function CoChamferFeatureData.CreateRemote(const MachineName: string): IChamferFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChamferFeatureData) as IChamferFeatureData;
end;

class function CoDraftFeatureData.Create: IDraftFeatureData;
begin
  Result := CreateComObject(CLASS_DraftFeatureData) as IDraftFeatureData;
end;

class function CoDraftFeatureData.CreateRemote(const MachineName: string): IDraftFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DraftFeatureData) as IDraftFeatureData;
end;

class function CoSimpleFilletFeatureData.Create: ISimpleFilletFeatureData;
begin
  Result := CreateComObject(CLASS_SimpleFilletFeatureData) as ISimpleFilletFeatureData;
end;

class function CoSimpleFilletFeatureData.CreateRemote(const MachineName: string): ISimpleFilletFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SimpleFilletFeatureData) as ISimpleFilletFeatureData;
end;

class function CoVariableFilletFeatureData.Create: IVariableFilletFeatureData;
begin
  Result := CreateComObject(CLASS_VariableFilletFeatureData) as IVariableFilletFeatureData;
end;

class function CoVariableFilletFeatureData.CreateRemote(const MachineName: string): IVariableFilletFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VariableFilletFeatureData) as IVariableFilletFeatureData;
end;

class function CoExtrudeFeatureData.Create: IExtrudeFeatureData;
begin
  Result := CreateComObject(CLASS_ExtrudeFeatureData) as IExtrudeFeatureData;
end;

class function CoExtrudeFeatureData.CreateRemote(const MachineName: string): IExtrudeFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ExtrudeFeatureData) as IExtrudeFeatureData;
end;

class function CoRevolveFeatureData.Create: IRevolveFeatureData;
begin
  Result := CreateComObject(CLASS_RevolveFeatureData) as IRevolveFeatureData;
end;

class function CoRevolveFeatureData.CreateRemote(const MachineName: string): IRevolveFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RevolveFeatureData) as IRevolveFeatureData;
end;

class function CoSdmDoc.Create: ISdmDoc;
begin
  Result := CreateComObject(CLASS_SdmDoc) as ISdmDoc;
end;

class function CoSdmDoc.CreateRemote(const MachineName: string): ISdmDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SdmDoc) as ISdmDoc;
end;

class function CoDrSection.Create: IDrSection;
begin
  Result := CreateComObject(CLASS_DrSection) as IDrSection;
end;

class function CoDrSection.CreateRemote(const MachineName: string): IDrSection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DrSection) as IDrSection;
end;

class function CoEnumComponents.Create: IEnumComponents;
begin
  Result := CreateComObject(CLASS_EnumComponents) as IEnumComponents;
end;

class function CoEnumComponents.CreateRemote(const MachineName: string): IEnumComponents;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumComponents) as IEnumComponents;
end;

class function CoEnumDrSections.Create: IEnumDrSections;
begin
  Result := CreateComObject(CLASS_EnumDrSections) as IEnumDrSections;
end;

class function CoEnumDrSections.CreateRemote(const MachineName: string): IEnumDrSections;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EnumDrSections) as IEnumDrSections;
end;

class function CoExplodeStep.Create: IExplodeStep;
begin
  Result := CreateComObject(CLASS_ExplodeStep) as IExplodeStep;
end;

class function CoExplodeStep.CreateRemote(const MachineName: string): IExplodeStep;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ExplodeStep) as IExplodeStep;
end;

class function CoMathUtility.Create: IMathUtility;
begin
  Result := CreateComObject(CLASS_MathUtility) as IMathUtility;
end;

class function CoMathUtility.CreateRemote(const MachineName: string): IMathUtility;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MathUtility) as IMathUtility;
end;

class function CoMathTransform.Create: IMathTransform;
begin
  Result := CreateComObject(CLASS_MathTransform) as IMathTransform;
end;

class function CoMathTransform.CreateRemote(const MachineName: string): IMathTransform;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MathTransform) as IMathTransform;
end;

class function CoMathPoint.Create: IMathPoint;
begin
  Result := CreateComObject(CLASS_MathPoint) as IMathPoint;
end;

class function CoMathPoint.CreateRemote(const MachineName: string): IMathPoint;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MathPoint) as IMathPoint;
end;

class function CoMathVector.Create: IMathVector;
begin
  Result := CreateComObject(CLASS_MathVector) as IMathVector;
end;

class function CoMathVector.CreateRemote(const MachineName: string): IMathVector;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MathVector) as IMathVector;
end;

class function CoMirrorPatternFeatureData.Create: IMirrorPatternFeatureData;
begin
  Result := CreateComObject(CLASS_MirrorPatternFeatureData) as IMirrorPatternFeatureData;
end;

class function CoMirrorPatternFeatureData.CreateRemote(const MachineName: string): IMirrorPatternFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MirrorPatternFeatureData) as IMirrorPatternFeatureData;
end;

class function CoDetailCircle.Create: IDetailCircle;
begin
  Result := CreateComObject(CLASS_DetailCircle) as IDetailCircle;
end;

class function CoDetailCircle.CreateRemote(const MachineName: string): IDetailCircle;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DetailCircle) as IDetailCircle;
end;

class function CoCircularPatternFeatureData.Create: ICircularPatternFeatureData;
begin
  Result := CreateComObject(CLASS_CircularPatternFeatureData) as ICircularPatternFeatureData;
end;

class function CoCircularPatternFeatureData.CreateRemote(const MachineName: string): ICircularPatternFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CircularPatternFeatureData) as ICircularPatternFeatureData;
end;

class function CoLinearPatternFeatureData.Create: ILinearPatternFeatureData;
begin
  Result := CreateComObject(CLASS_LinearPatternFeatureData) as ILinearPatternFeatureData;
end;

class function CoLinearPatternFeatureData.CreateRemote(const MachineName: string): ILinearPatternFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LinearPatternFeatureData) as ILinearPatternFeatureData;
end;

class function CoTablePatternFeatureData.Create: ITablePatternFeatureData;
begin
  Result := CreateComObject(CLASS_TablePatternFeatureData) as ITablePatternFeatureData;
end;

class function CoTablePatternFeatureData.CreateRemote(const MachineName: string): ITablePatternFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TablePatternFeatureData) as ITablePatternFeatureData;
end;

class function CoSketchPatternFeatureData.Create: ISketchPatternFeatureData;
begin
  Result := CreateComObject(CLASS_SketchPatternFeatureData) as ISketchPatternFeatureData;
end;

class function CoSketchPatternFeatureData.CreateRemote(const MachineName: string): ISketchPatternFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SketchPatternFeatureData) as ISketchPatternFeatureData;
end;

class function CoMirrorSolidFeatureData.Create: IMirrorSolidFeatureData;
begin
  Result := CreateComObject(CLASS_MirrorSolidFeatureData) as IMirrorSolidFeatureData;
end;

class function CoMirrorSolidFeatureData.CreateRemote(const MachineName: string): IMirrorSolidFeatureData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MirrorSolidFeatureData) as IMirrorSolidFeatureData;
end;

class function CoPropertyManagerPage.Create: IPropertyManagerPage;
begin
  Result := CreateComObject(CLASS_PropertyManagerPage) as IPropertyManagerPage;
end;

class function CoPropertyManagerPage.CreateRemote(const MachineName: string): IPropertyManagerPage;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PropertyManagerPage) as IPropertyManagerPage;
end;

class function CoProjectionArrow.Create: IProjectionArrow;
begin
  Result := CreateComObject(CLASS_ProjectionArrow) as IProjectionArrow;
end;

class function CoProjectionArrow.CreateRemote(const MachineName: string): IProjectionArrow;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ProjectionArrow) as IProjectionArrow;
end;

class function CoTessellation.Create: ITessellation;
begin
  Result := CreateComObject(CLASS_Tessellation) as ITessellation;
end;

class function CoTessellation.CreateRemote(const MachineName: string): ITessellation;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Tessellation) as ITessellation;
end;

class function CoUserUnit.Create: IUserUnit;
begin
  Result := CreateComObject(CLASS_UserUnit) as IUserUnit;
end;

class function CoUserUnit.CreateRemote(const MachineName: string): IUserUnit;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UserUnit) as IUserUnit;
end;

end.
