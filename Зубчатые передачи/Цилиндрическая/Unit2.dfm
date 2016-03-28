object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1090#1080#1087#1072' '#1079#1091#1073#1072
  ClientHeight = 147
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 119
    Top = 66
    Width = 154
    Height = 13
    Caption = #1059#1075#1086#1083' '#1085#1072#1082#1083#1086#1085#1072' '#1079#1091#1073#1072' '#1074' '#1075#1088#1072#1076#1091#1089#1072#1093
    Visible = False
  end
  object EditBetg: TEdit
    Left = 289
    Top = 63
    Width = 33
    Height = 21
    TabOrder = 0
    Text = '0'
    Visible = False
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 105
    Height = 105
    Caption = #1058#1080#1087' '#1079#1091#1073#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      'AUTO'
      #1055#1088#1103#1084#1086#1081
      #1050#1086#1089#1086#1081
      #1064#1077#1074#1088#1086#1085#1099#1081)
    ParentFont = False
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object CheckBox1: TCheckBox
    Left = 119
    Top = 85
    Width = 203
    Height = 17
    Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100#1085#1072#1103' '#1082#1072#1085#1072#1074#1082#1072' '#1085#1072' '#1074#1077#1085#1094#1077
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 38
    Top = 119
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 119
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    ModalResult = 2
    TabOrder = 4
    OnClick = Button2Click
  end
end
