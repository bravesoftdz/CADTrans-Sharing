unit ChildFormUnit;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, ImgList, Grids, ToolWin,
  EMRInputFormUnit, NTSGTypes, {ValEdit,} Menus, LResources;

type
  TChildForm = class(TForm)
    Panel1: TPanel;
    MainSplitter: TSplitter;
    Panel2: TPanel;
    Panel4: TPanel;
    MainListBox: TListBox;
    HelpImageList: TImageList;
    SWImageList: TImageList;
    ButtonImageList: TImageList;
    ChildToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    EMRImageList: TImageList;
    OptImageList: TImageList;
    OptImageListLg: TImageList;
    EMRImageListLg: TImageList;
    HelpImageListLg: TImageList;
    MainMenu: TMainMenu;
    N19: TMenuItem;
    ViewLgIcon1: TMenuItem;
    ViewSmIcon1: TMenuItem;
    ViewList1: TMenuItem;
    ViewReport1: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N1: TMenuItem;
    N9: TMenuItem;
    N12: TMenuItem;
    N11: TMenuItem;
    MinimizeAll1: TMenuItem;
    ImageList1: TImageList;
    MainPageControl: TPageControl;
    TabSheet5: TTabSheet;
    EMRListView: TListView;
    Panel6: TPanel;
    EMRProgressBar: TProgressBar;
    TabSheet6: TTabSheet;
    OptListView: TListView;
    Panel3: TPanel;
    OptProgressBar: TProgressBar;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    Panel7: TPanel;
    SWProgressBar: TProgressBar;
    TabSheet9: TTabSheet;
    HelpListView: TListView;
    Panel8: TPanel;
    GeoListView: TListView;
    GeoImageList: TImageList;
    GeoImageListLg: TImageList;
    Panel9: TPanel;
    ListBoxImageList: TImageList;
    SWView: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MainListBoxClick(Sender: TObject);
    procedure EMRListViewDblClick(Sender: TObject);
    procedure SWViewDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DisableForm;
    procedure EnableForm;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure OptListViewDblClick(Sender: TObject);
    procedure HelpListViewDblClick(Sender: TObject);
    procedure GeStObListViewClick(Sender: TObject);
    procedure GeStObListViewKeyPress(Sender: TObject; var Key: Char);
    procedure GeStObListViewDblClick(Sender: TObject);
    procedure ViewLgIcon1Click(Sender: TObject);
    procedure ViewSmIcon1Click(Sender: TObject);
    procedure ViewList1Click(Sender: TObject);
    procedure ViewReport1Click(Sender: TObject);
    procedure GeoListViewDblClick(Sender: TObject);
    procedure MainListBoxMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure MainListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SWViewCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
  private
    { Private declarations }
    procedure CheckGeometry(Sender: TListView);
  public
    { Public declarations }
    NTSGData: TNTSGData;
  end;

implementation

uses EMRCalcUnit, EMROutputFormUnit, MainFormUnit, GeoInputFormUnit, ModelingUnit,
  Math, OptInputFormUnit, OptLimitsFormUnit, OptInputMasFormUnit,
  OptInputCriteriaFormUnit, OptimizeCalcUnit, OptOutputMasFormUnit,
  GeoInputStatorFormUnit, GeoInputRotorFormUnit, NTSGDialogs,
  GeoStandCompFormUnit;


procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 inherited;
 Action:=caFree;
 NTSGData.Free;
 NTSGData := nil;
 DisableForm;
end;

procedure TChildForm.FormCreate(Sender: TObject);
begin
 MainListBox.ItemIndex:=0;
 MainPageControl.ActivePageIndex:=MainListBox.ItemIndex;
 NTSGData:=TNTSGData.Create;
 Self.Caption:=NTSGData.Caption;
 SWView.FullExpand;
 EnableForm;
end;

procedure TChildForm.MainListBoxClick(Sender: TObject);
begin
 MainPageControl.ActivePageIndex:=MainListBox.ItemIndex;
 MainNTSGForm.Refresh1Execute(Sender);
end;

procedure TChildForm.EMRListViewDblClick(Sender: TObject);
var temp: TOutput;
    Inp: boolean;
begin
 case EMRListView.ItemIndex of
  1: begin
      if not NTSGData.HasEMRInput then
       try
        EMRInputForm:=TEMRInputForm.Create(Self);
        if EMRInputForm.ShowModal<>mrOk then Exit;
       finally
        EMRInputForm.Free;
        EMRInputForm:=nil;
       end;

      if not (NTSGData.HasEMROutput) or (NTSGData.HasEMRChanged) then
       begin
        try
         temp:=TOutput.Create;
         try
          MainCalc(NTSGData.Input,temp);
         except
//          MessageBox('Параметры генератора при заданных исходных данных не могут быть рассчитаны. Воспользуйтесь командой Изменить исходные данные', 'Предупреждение', [smbOK]);
          MessageDlgCtr('Параметры генератора при заданных исходных данных не могут быть рассчитаны. Воспользуйтесь командой Изменить исходные данные', mtInformation, [mbOk], 0);
          Exit;
         end;
         NTSGData.Output:=temp;
         NTSGData.Output.UserName := MainNTSGForm.UserName;
        finally
         temp.Free;
         temp:=nil;
        end; 

        NTSGData.Input.HasChanged := False;
       end;
     end;
  2: begin
      if not NTSGData.HasEMROutput then
       begin
        MessageDlgCtr('Параметры генератора не были рассчитаны. Воспользуйтесь командой Рассчитать генератор', mtInformation, [mbOk], 0);
        Exit;
       end;
      EMROutputForm:=TEMROutputForm.Create(MainNTSGForm);
     end;
 else {0}
     begin
      try
       EMRInputForm:=TEMRInputForm.Create(Self);
       Inp := NTSGData.HasEMRInput;
       if EMRInputForm.ShowModal<>mrOk then Exit;
       NTSGData.Input.HasChanged := Inp;
      finally
       EMRInputForm.Free;
       EMRInputForm:=nil;
      end;
     end;
 end;
 MainNTSGForm.Refresh1Execute(Sender);
end;

procedure TChildForm.SWViewDblClick(Sender: TObject);
begin
 {if not NTSGData.HasGeometry then
  begin
   MessageDlgCtr('Сначала необходимо рассчитать геометрические параметры генератора во вкладке Расчет геометрии', mtInformation, [mbOk], 0);
   Exit;
  end;  }

   NTSGData.Geometry.Di:= 230;
   NTSGData.Geometry.De:= 312;
   NTSGData.Geometry.d_v:=5-1.5;   //5 - диаметр винт, а 3,5 отверстие под крепление
   NTSGData.Geometry.db:=6-0.5;
   NTSGData.Geometry.Do_rot:= NTSGData.Geometry.Di - 30;
   NTSGData.Geometry.Dst_n1:= 60;
   NTSGData.Geometry.Dob_vn1:= 150;
   NTSGData.Geometry.Dob_vn2:= 140;
   NTSGData.Geometry.h_odr:= 6;
   NTSGData.Geometry.hror:= 5;
   NTSGData.Geometry.Dst_n2:= 70;
   NTSGData.Geometry.Dst:= 44;
   NTSGData.Geometry.losn:= 134;
   NTSGData.Geometry.Shpr_t2:= 3.3;
   NTSGData.Geometry.Shpr_t1:= 5;
   NTSGData.Geometry.Shpr_b:= 12;
   NTSGData.Geometry.losn_ob:= 138;
   NTSGData.Geometry.L_krd:= 27;
   NTSGData.Geometry.thickness:= 7;
   NTSGData.Geometry.DiRot:= 160;
   NTSGData.Geometry.Lo_rot:= NTSGData.Geometry.losn_ob;
   NTSGData.Geometry.Lror:= (NTSGData.Geometry.Lo_rot - NTSGData.Geometry.h_odr)/2;
   NTSGData.Geometry.Db_d:= 7;
   NTSGData.Geometry.Dm := 30;
   NTSGData.Geometry.Dp := 35;
   NTSGData.Geometry.LMuft:=70;
   NTSGData.Geometry.lp :=17;
   NTSGData.Geometry.lkr :=18;
   NTSGData.Geometry.lburt :=5;
   NTSGData.Geometry.Derot := 326;
   NTSGData.Geometry.Lm := 41;
   NTSGData.Geometry.d_vg:=5.6;
   NTSGData.Geometry.h_vg:=1.5;
   NTSGData.Geometry.h_zapas:=3;
   NTSGData.Geometry.H_v1:=NTSGData.Geometry.Di/2-2.5;
   NTSGData.Geometry.H_v2:=NTSGData.Geometry.Di/2+NTSGData.Geometry.Lm+2.5;
   NTSGData.Geometry.p:= 16;
   NTSGData.Geometry.hn := 3;
   NTSGData.Geometry.bm := 18;
   NTSGData.Geometry.bm_:= 24;
   NTSGData.Geometry.hm := 4;
   NTSGData.Geometry.bn_:= 26.97;
   NTSGData.Geometry.St:= 10;
   NTSGData.Geometry.ShC:= 16;
   NTSGData.Geometry.ShH:= 6;
   NTSGData.Geometry.BgH:= 15;
   NTSGData.Geometry.Tw:= 10;
   NTSGData.Geometry.Bw:= 8;
   NTSGData.Geometry.db:=6-0.5;
   NTSGData.Geometry.d_v:=3;

 if SWView.Selections[0].Text = 'Генератор' then
   GeneratorAssembly(NTSGData.Geometry.GeneratorAsmDims);

{ if SWView.Selections[0].Text = 'Статор' then
   createstMagnet(NTSGData.Geometry.MagnetDims);     }

 if SWView.Selections[0].Text = 'Обмотка' then
   Winding(NTSGData.Geometry.WindingDims);

 if SWView.Selections[0].Text = 'Остов' then
   OstovAsm(NTSGData.Geometry.OstovAsmDims);

 if SWView.Selections[0].Text = 'Основание статора' then
   StatorBase(NTSGData.Geometry.StatorBaseDims);

 if SWView.Selections[0].Text = 'Тороид' then
   ToroidBase(NTSGData.Geometry.ToroidDims);

 if SWView.Selections[0].Text = 'Бандаж' then
   BandageBase(NTSGData.Geometry.BandageDims);

 if SWView.Selections[0].Text = 'Ротор' then
   RotorAssembly(NTSGData.Geometry.RotorAsmDims);

 if SWView.Selections[0].Text = 'Диск' then
   DiskRotoraAssembly(NTSGData.Geometry.DiskRotAsmDims);

 if SWView.Selections[0].Text = 'Диск ротора' then
   DiskOsnRot(NTSGData.Geometry.DiskOsnRotDims);

 if SWView.Selections[0].Text = 'Сборка наконечника' then
   CreateAssemblyNakonech(NTSGData.Geometry.NakonAsmDims);

 if SWView.Selections[0].Text = 'Магнит' then
   Magnet(NTSGData.Geometry.MagnetDims);

 if SWView.Selections[0].Text = 'Наконечник' then
   Furulle(NTSGData.Geometry.FurulleDims);

 if SWView.Selections[0].Text = 'Основание' then
   OsnRotoraAssembly(NTSGData.Geometry.OsnovRotAsmDims);

 if SWView.Selections[0].Text = 'Обод ротора' then
   ObodRot(NTSGData.Geometry.ObodRotDims);

 if SWView.Selections[0].Text = 'Диск основания' then
   DiskOsnRot(NTSGData.Geometry.DiskOsnRotDims);

 if SWView.Selections[0].Text = 'Ступица ротора' then
   Stupica(NTSGData.Geometry.StupicaDims);

 if SWView.Selections[0].Text = 'Ребро основания' then
   RebroOsnRot(NTSGData.Geometry.RebroOsnDims);

 if SWView.Selections[0].Text = 'Вал' then
   Shaft(NTSGData.Geometry.ShaftDims);
   
 MainNTSGForm.Refresh1Execute(Sender);
   
end;

procedure TChildForm.FormActivate(Sender: TObject);
begin
 EnableForm;
end;

procedure TChildForm.FormDeactivate(Sender: TObject);
begin
 DisableForm;
end;

procedure TChildForm.DisableForm;
begin
 MainNTSGForm.FileSave.Enabled:=False;
 MainNTSGForm.FileSaveAs.Enabled:=False;
 ViewLgIcon1.Enabled:=False;
 ViewSmIcon1.Enabled:=False;
 ViewList1.Enabled:=False;
 ViewReport1.Enabled:=False;
end;

procedure TChildForm.EnableForm;
begin
 MainNTSGForm.FileSave.Enabled:=NTSGData.HasEMROutput;
 MainNTSGForm.FileSaveAs.Enabled:=NTSGData.HasEMROutput;
 ViewLgIcon1.Enabled:=True;
 ViewSmIcon1.Enabled:=True;
 ViewList1.Enabled:=True;
 ViewReport1.Enabled:=True;
end;

procedure TChildForm.ToolButton1Click(Sender: TObject);
begin
 EMRListView.ViewStyle:=vsIcon;
 OptListView.ViewStyle:=vsIcon;
 GeoListView.ViewStyle:=vsIcon;
 HelpListView.ViewStyle:=vsIcon;
end;

procedure TChildForm.ToolButton2Click(Sender: TObject);
begin
 EMRListView.ViewStyle:=vsSmallIcon;
 OptListView.ViewStyle:=vsSmallIcon;
 GeoListView.ViewStyle:=vsSmallIcon;
 HelpListView.ViewStyle:=vsSmallIcon;
end;

procedure TChildForm.ToolButton3Click(Sender: TObject);
begin
 EMRListView.ViewStyle:=vsList;
 OptListView.ViewStyle:=vsList;
 GeoListView.ViewStyle:=vsList;
 HelpListView.ViewStyle:=vsList;
end;

procedure TChildForm.ToolButton4Click(Sender: TObject);
begin
 EMRListView.ViewStyle:=vsReport;
 OptListView.ViewStyle:=vsReport;
 GeoListView.ViewStyle:=vsReport;
 HelpListView.ViewStyle:=vsReport;
end;

procedure TChildForm.ToolButton6Click(Sender: TObject);
begin
 case MainListBox.ItemIndex of
  0: EMRListViewDblClick(Self);
  1: OptListViewDblClick(Self);
  2: GeoListViewDblClick(Self);
  4: HelpListViewDblClick(Self);
 else
  Exit;
 end;
end;

procedure TChildForm.OptListViewDblClick(Sender: TObject);
var TempInp  : TInput;
    TempValue: TParam;
    TempMas  : TInputMas;
    vsego: extended;
begin
 case OptListView.ItemIndex of
  1: begin
      try
        OptLimitsForm:=TOptLimitsForm.Create(Self);
        if OptLimitsForm.ShowModal<>mrOk then Exit;
       finally
        OptLimitsForm.Free;
        OptLimitsForm:=nil;
       end; 
     end;
  2: begin
      if not(NTSGData.HasOptInput) then
       begin
        MessageDlgCtr('Исходные данные не были введены. Воспользуйтесь командой Задать исходные данные', mtInformation, [mbOk], 0);
        Exit;
       end;

      if not(NTSGData.HasOptLimits) then
       begin
        MessageDlgCtr('Граничные условия не были введены. Воспользуйтесь командой Ввести граничные условия', mtInformation, [mbOk], 0);
        Exit;
       end;


      if (NTSGData.HasOptInputMas)  then
       begin
         TOptInputMasForm.Create(Self);
       end else
       begin
         TempInp := TInput.Create;
      TempInp.Di := NTSGData.Optimize.DiMin;
      TempInp.AL := NTSGData.Optimize.ALMin;
      TempInp.BL := NTSGData.Optimize.BLMin;
      TempInp.B0 := NTSGData.Optimize.B0Min;
      TempInp.D11:= NTSGData.Optimize.D11Min;
      TempInp.F1 := NTSGData.Optimize.F1;
      TempInp.U  := NTSGData.Optimize.U;
      TempInp.P  := NTSGData.Optimize.P;
      TempInp.PMM:= NTSGData.Optimize.PMM;

      NTSGData.Optimize.InputMasClear;

      vsego :=       (NTSGData.Optimize.D11Max-NTSGData.Optimize.D11Min)/0.1;
      vsego := vsego*(NTSGData.Optimize.ALMax -NTSGData.Optimize.ALMin) /0.001;
      vsego := vsego*(NTSGData.Optimize.BLMax -NTSGData.Optimize.BLMin) /0.01;
      vsego := vsego*(NTSGData.Optimize.DiMax -NTSGData.Optimize.DiMin) /0.01;
      vsego := vsego*(NTSGData.Optimize.B0Max -NTSGData.Optimize.B0Min) /0.0005;

      OptProgressBar.Max := round(vsego);
      OptProgressBar.Position := OptProgressBar.Min;

      while not(TempInp.D11>=NTSGData.Optimize.D11Max) do
       begin
       TempInp.Di:=NTSGData.Optimize.DiMin;
        while not(TempInp.di>=NTSGData.Optimize.DiMax) do
         begin
          TempInp.AL:=NTSGData.Optimize.ALMin;
          while not(TempInp.al>=NTSGData.Optimize.ALMax) do
           begin
             TempInp.BL:=NTSGData.Optimize.BLMin;
             while not(TempInp.BL>=NTSGData.Optimize.BLMax) do
              begin
               TempInp.B0:=NTSGData.Optimize.B0Min;
               while not(TempInp.B0>=NTSGData.Optimize.B0Max) do
                begin
                 OptCalc(TempInp, TempValue);
                 NTSGData.Optimize.InputMasAdd(TempValue);
                 OptProgressBar.Position := OptProgressBar.Position+1;
                 TempInp.B0:=TempInp.B0+LPiTau(0.0005);
                end;
              TempInp.BL:=TempInp.BL+LPiTau(0.01);
             end;
            TempInp.al:=TempInp.al+LPiTau(0.001);
           end;
          TempInp.di:=TempInp.di+LPiTau(0.01);
         end;
        TempInp.d11:=TempInp.d11+LPiTau(0.1);
       end;
      end;
      OptProgressBar.Position := OptProgressBar.Max;
     end;
  3: begin
      if NTSGData.HasOptInputMas then
       try
        OptInputCriteriaForm:=TOptInputCriteriaForm.Create(Self);
        if OptInputCriteriaForm.ShowModal<>mrOk then Exit;
       finally
        OptInputCriteriaForm.Free;
        OptInputCriteriaForm:=nil;
       end;
     end;
  4: begin
      if not(NTSGData.HasOptInputMas) then
        Exit;
      if not(NTSGData.HasOptCriteria) then
       begin
        MessageDlgCtr('Критериальные ограничения не были заданы. Воспользуйтесь командой Задать критериальные ограничения', mtInformation, [mbOk], 0);
        Exit;
       end;
      if NTSGData.HasOptOutputMas then
       begin
        TOptOutputMasForm.Create(Self);
        Exit;
       end;
       
      Range(NTSGData.Optimize, TempMas);
      NTSGData.Optimize.OutputMas := TempMas;
     end;
  5: begin

     end;
  else
     begin
       try
        OptInputForm:=TOptInputForm.Create(Self);
        if OptInputForm.ShowModal<>mrOk then Exit;
       finally
        OptInputForm.Free;
        OptInputForm:=nil;
       end;
     end;
  end;

  MainNTSGForm.Refresh1Execute(Sender);
end;

procedure TChildForm.HelpListViewDblClick(Sender: TObject);
begin
{ TODO : sadff }
end;

procedure TChildForm.CheckGeometry(Sender: TListView);
var GeoInputForm: TGeoInputForm;
begin
 NTSGData.Geometry.SmCheckGeometry(Sender);

 if Sender.ItemIndex<0 then Exit;

 try
  GeoInputForm:=TGeoInputForm.Create(Sender);
  GeoInputForm.Caption:=Sender.Items[Sender.ItemIndex].SubItems[0];
  GeoInputForm.LabelName.Caption:=GeoInputForm.Caption;
  GeoInputForm.LabelRazm.Caption:=Sender.Items[Sender.ItemIndex].SubItems[2];
  if Sender.Items[Sender.ItemIndex].SubItems[1]<>'-' then
   GeoInputForm.EditValue.Text:=Sender.Items[Sender.ItemIndex].SubItems[1]
  else
   GeoInputForm.EditValue.Text:='1000';
  if GeoInputForm.ShowModal=mrOk then
   begin
    Sender.Items[Sender.ItemIndex].SubItems[1]:=GeoInputForm.EditValue.Text;
    NTSGData.Geometry.SmCheckGeometry(Sender);
   end;
 finally
   GeoInputForm.Free;
   GeoInputForm:=nil;
 end;
end;

procedure TChildForm.GeStObListViewClick(Sender: TObject);
begin
 CheckGeometry(Sender as TListView);
end;

procedure TChildForm.GeStObListViewKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key=' ' then CheckGeometry(Sender as TListView);
end;

procedure TChildForm.GeStObListViewDblClick(Sender: TObject);
begin
 CheckGeometry(Sender as TListView);
end;

procedure TChildForm.ViewLgIcon1Click(Sender: TObject);
begin
  EMRListView.ViewStyle:=vsIcon;
  OptListView.ViewStyle:=vsIcon;
  HelpListView.ViewStyle:=vsIcon;
  ToolButton1Click(Self);
  ToolButton1.Down:=True;
end;

procedure TChildForm.ViewSmIcon1Click(Sender: TObject);
begin
  EMRListView.ViewStyle:=vsSmallIcon;
  OptListView.ViewStyle:=vsSmallIcon;
  HelpListView.ViewStyle:=vsSmallIcon;
  ToolButton2Click(Self);
  ToolButton2.Down:=True;
end;

procedure TChildForm.ViewList1Click(Sender: TObject);
begin
  EMRListView.ViewStyle:=vsList;
  OptListView.ViewStyle:=vsList;
  HelpListView.ViewStyle:=vsList;
  ToolButton3Click(Self);
  ToolButton3.Down:=True;
end;

procedure TChildForm.ViewReport1Click(Sender: TObject);
begin
  EMRListView.ViewStyle:=vsReport;
  OptListView.ViewStyle:=vsReport;
  HelpListView.ViewStyle:=vsReport;
  ToolButton4Click(Self);
  ToolButton4.Down:=True;
end;

procedure TChildForm.GeoListViewDblClick(Sender: TObject);
begin
 if not(NTSGData.HasEMROutput) then
  begin
   MessageDlgCtr('Параметры генератора не были рассчитаны. Воспользуйтесь командой Рассчитать генератор во вкладке Электромагнитный расчёт', mtInformation, [mbOk], 0);
   Exit;
  end;

 case GeoListView.ItemIndex of
  0: begin
      try
       GeoOutputShowForm := TGeoOutputShowForm.Create(Self);
       GeoOutputShowForm.ShowModal;
      finally
       GeoOutputShowForm.Free;
       GeoOutputShowForm := nil;
      end;
     end;
  1: begin
      try
       GeoInputConstrForm := TGeoInputConstrForm.Create(Self);
       GeoInputConstrForm.ShowModal;
      finally
       GeoInputConstrForm.Free;
       GeoInputConstrForm := nil;
      end;
     end;
  2: begin
      try
       GeoStandCompForm := TGeoStandCompForm.Create(Self);
       GeoStandCompForm.ShowModal;
      finally
       GeoStandCompForm.Free;
       GeoStandCompForm := nil;
      end;
     end;
  end;
  MainNTSGForm.Refresh1Execute(Sender);
end;

procedure TChildForm.MainListBoxMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
 Height := 25;
end;

procedure TChildForm.MainListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 (Control as TListBox).Canvas.FillRect(Rect);
 ListBoxImageList.Draw((Control as TListBox).Canvas, Rect.Left+5, Rect.Top+5, Index, True);
 (Control as TListBox).Canvas.TextOut(Rect.Left+30, Rect.Top+7, (Control as TListBox).Items[Index]);
end;

procedure TChildForm.SWViewCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
  AllowCollapse := False;
end;

initialization
  {$i ChildFormUnit.lrs}
  {$i ChildFormUnit.lrs}
  {$i ChildFormUnit.lrs}

end.
