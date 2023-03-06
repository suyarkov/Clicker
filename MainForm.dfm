object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 247
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object LabelCountLanguages: TLabel
    Left = 8
    Top = 29
    Width = 118
    Height = 15
    Caption = 'LabelCountLanguages'
  end
  object LabelMainLanguage: TLabel
    Left = 8
    Top = 8
    Width = 107
    Height = 15
    Caption = 'LabelMainLanguage'
  end
  object Label2: TLabel
    Left = 8
    Top = 50
    Width = 34
    Height = 15
    Caption = 'Label2'
  end
  object ButtonStep1: TButton
    Left = 8
    Top = 79
    Width = 121
    Height = 37
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1103#1079#1099#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonStep1Click
  end
  object ButtonStep2: TButton
    Left = 8
    Top = 122
    Width = 121
    Height = 37
    Caption = #1055#1077#1088#1077#1074#1086#1076' '#1089#1091#1073#1090#1080#1090#1088#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonStep2Click
  end
  object ButtonStep3: TButton
    Left = 8
    Top = 165
    Width = 121
    Height = 37
    Caption = #1055#1077#1088#1077#1074#1086#1076' '#1086#1087#1080#1089#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonStep3Click
  end
  object LoadTask: TButton
    Left = 166
    Top = 39
    Width = 75
    Height = 25
    Caption = 'LoadTask'
    TabOrder = 3
    OnClick = LoadTaskClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 254
    Width = 521
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
    Visible = False
  end
  object Start: TButton
    Left = 166
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 5
    OnClick = StartClick
  end
  object CountRepeatCicleEdit: TEdit
    Left = 61
    Top = 50
    Width = 54
    Height = 23
    Enabled = False
    TabOrder = 6
    Text = 'CountRepeatCicleEdit'
  end
  object GetXYMouse: TButton
    Left = 166
    Top = 99
    Width = 75
    Height = 25
    Caption = 'GetXYMouse'
    TabOrder = 7
    OnClick = GetXYMouseClick
  end
  object XYMouse: TEdit
    Left = 166
    Top = 70
    Width = 75
    Height = 23
    TabOrder = 8
    Text = 'XYMouse'
  end
  object ButtonStep3_1: TButton
    Left = 8
    Top = 207
    Width = 121
    Height = 33
    Caption = #1054#1076#1085#1086' '#1086#1087#1080#1089#1072#1085#1080#1103
    TabOrder = 9
    OnClick = ButtonStep3_1Click
  end
  object Button1: TButton
    Left = 168
    Top = 144
    Width = 65
    Height = 25
    Caption = 'Button1'
    TabOrder = 10
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 207
    Top = 199
  end
end
