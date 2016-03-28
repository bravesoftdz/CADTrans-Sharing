object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1063#1077#1088#1074#1103#1095#1085#1072#1103' '#1079#1091#1073#1095#1072#1090#1072#1103' '#1087#1077#1088#1077#1076#1072#1095#1072
  ClientHeight = 684
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 240
    Top = 619
    Width = 177
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    Default = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 628
    Width = 177
    Height = 25
    Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1082#1086#1083'-'#1074#1086' '#1087#1077#1088#1077#1076#1072#1095
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 409
    Height = 281
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 29
      Width = 244
      Height = 13
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1072#1103' '#1073#1099#1089#1090#1088#1086#1093#1086#1076#1085#1099#1084' '#1074#1072#1083#1086#1084
    end
    object Label2: TLabel
      Left = 16
      Top = 61
      Width = 205
      Height = 13
      Caption = #1063#1072#1089#1090#1086#1090#1072' '#1074#1088#1072#1097#1077#1085#1080#1103' '#1073#1099#1089#1090#1088#1086#1093#1086#1076#1085#1086#1075#1086' '#1074#1072#1083#1072
    end
    object Label3: TLabel
      Left = 16
      Top = 94
      Width = 158
      Height = 13
      Caption = #1055#1077#1088#1077#1076#1072#1090#1086#1095#1085#1086#1077' '#1095#1080#1089#1083#1086' '#1087#1077#1088#1077#1076#1072#1095#1080
    end
    object Label5: TLabel
      Left = 16
      Top = 128
      Width = 144
      Height = 13
      Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1088#1077#1089#1091#1088#1089' '#1087#1077#1088#1077#1076#1072#1095#1080
    end
    object EditP1: TEdit
      Left = 284
      Top = 26
      Width = 122
      Height = 21
      TabOrder = 0
      Text = '10'
      OnExit = EditP1Exit
      OnKeyPress = EditP1KeyPress
    end
    object Editn1: TEdit
      Left = 285
      Top = 53
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '750'
      OnExit = Editn1Exit
      OnKeyPress = EditP1KeyPress
    end
    object EditU: TEdit
      Left = 284
      Top = 91
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '3'
      OnExit = EditUExit
      OnKeyPress = EditP1KeyPress
    end
    object EditLh: TEdit
      Left = 285
      Top = 132
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '6300'
      OnExit = EditLhExit
      OnKeyPress = EditP1KeyPress
    end
    object CheckBox1_Revers: TCheckBox
      Left = 16
      Top = 159
      Width = 105
      Height = 17
      Caption = #1056#1077#1074#1077#1088#1089#1080#1088#1086#1074#1072#1085#1080#1077
      TabOrder = 4
    end
    object CheckBox2_Nagr: TCheckBox
      Left = 163
      Top = 159
      Width = 97
      Height = 17
      Caption = #1058#1080#1087#1086#1074#1086#1081
      Checked = True
      State = cbChecked
      TabOrder = 5
      WordWrap = True
      OnClick = CheckBox2_NagrClick
    end
    object CheckBox3_Otw1: TCheckBox
      Left = 303
      Top = 159
      Width = 97
      Height = 17
      Caption = #1057#1090#1072#1085#1076#1072#1088#1090#1085#1086#1077
      Checked = True
      State = cbChecked
      TabOrder = 6
      OnClick = CheckBox3_Otw1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 210
    Width = 409
    Height = 158
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1095#1077#1088#1074#1103#1082#1072
    TabOrder = 3
    object Label8: TLabel
      Left = 16
      Top = 29
      Width = 151
      Height = 13
      Caption = #1042#1080#1076' '#1090#1077#1088#1084#1086#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1095#1077#1088#1074#1103#1082#1072
    end
    object Label4: TLabel
      Left = 16
      Top = 61
      Width = 251
      Height = 13
      Caption = #1058#1074#1077#1088#1076#1086#1089#1090#1100' '#1073#1086#1082#1086#1074#1086#1081' '#1087#1086#1074#1077#1088#1093#1085#1086#1089#1090#1080' '#1074#1080#1090#1082#1086#1074' '#1095#1077#1088#1074#1103#1082#1072
    end
    object Label7: TLabel
      Left = 16
      Top = 94
      Width = 63
      Height = 13
      Caption = #1058#1080#1087' '#1095#1077#1088#1074#1103#1082#1072
    end
    object Label9: TLabel
      Left = 16
      Top = 128
      Width = 131
      Height = 13
      Caption = #1052#1072#1088#1082#1072' '#1089#1090#1072#1083#1080' '#1076#1083#1103' '#1095#1077#1088#1074#1103#1082#1072
    end
    object Edit_H_HRcp1: TEdit
      Left = 285
      Top = 58
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '48'
      OnExit = Edit_H_HRcp1Exit
      OnKeyPress = EditP1KeyPress
    end
    object ComboBoxTipCh: TComboBox
      Left = 272
      Top = 85
      Width = 134
      Height = 21
      TabOrder = 1
    end
    object ComboBox_Termobr1: TComboBox
      Left = 272
      Top = 21
      Width = 134
      Height = 21
      TabOrder = 2
    end
    object ComboBox_mc1: TComboBox
      Left = 272
      Top = 125
      Width = 134
      Height = 21
      TabOrder = 3
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 374
    Width = 409
    Height = 249
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1095#1077#1088#1074#1103#1095#1085#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
    TabOrder = 4
    object Label10: TLabel
      Left = 16
      Top = 32
      Width = 124
      Height = 13
      Caption = #1052#1072#1088#1082#1072' '#1089#1090#1072#1083#1080' '#1076#1083#1103' '#1082#1086#1083#1077#1089#1072
    end
    object Label11: TLabel
      Left = 16
      Top = 67
      Width = 181
      Height = 13
      Caption = #1057#1087#1086#1089#1086#1073' '#1086#1090#1083#1080#1074#1082#1080' '#1095#1077#1088#1074#1103#1095#1085#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
    end
    object Label12: TLabel
      Left = 16
      Top = 104
      Width = 155
      Height = 13
      Caption = #1058#1074#1077#1088#1076#1086#1089#1090#1100' '#1063#1077#1088#1074#1103#1095#1085#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
    end
    object Label13: TLabel
      Left = 16
      Top = 144
      Width = 189
      Height = 13
      Caption = #1055#1088#1077#1076#1077#1083' '#1090#1077#1082#1091#1095#1077#1089#1090#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' '#1082#1086#1083#1077#1089#1072
    end
    object Label14: TLabel
      Left = 16
      Top = 185
      Width = 189
      Height = 13
      Caption = #1055#1088#1077#1076#1077#1083' '#1087#1088#1086#1095#1085#1086#1089#1090#1084' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' '#1082#1086#1083#1077#1089#1072
    end
    object ComboBox_Mc2: TComboBox
      Left = 272
      Top = 32
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object ComboBox_Sposob: TComboBox
      Left = 272
      Top = 67
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object Edit_H_HBp1: TEdit
      Left = 272
      Top = 104
      Width = 137
      Height = 21
      TabOrder = 2
      Text = '200'
      OnExit = Edit_H_HBp1Exit
      OnKeyPress = EditP1KeyPress
    end
    object ComboBox_Sigma_t2: TComboBox
      Left = 272
      Top = 144
      Width = 134
      Height = 21
      TabOrder = 3
      Text = '800'
    end
    object ComboBox_Sigma_B2: TComboBox
      Left = 272
      Top = 184
      Width = 128
      Height = 21
      TabOrder = 4
      Text = '400'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 659
    Width = 906
    Height = 25
    Panels = <
      item
        Width = 100
      end>
  end
  object PageControl1: TPageControl
    Left = 440
    Top = 8
    Width = 433
    Height = 645
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
  end
end
