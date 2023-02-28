object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 292
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object LabelCountLanguages: TLabel
    Left = 135
    Top = 30
    Width = 118
    Height = 15
    Caption = 'LabelCountLanguages'
  end
  object LabelMainLanguage: TLabel
    Left = 135
    Top = 8
    Width = 107
    Height = 15
    Caption = 'LabelMainLanguage'
  end
  object Label2: TLabel
    Left = 135
    Top = 51
    Width = 34
    Height = 15
    Caption = 'Label2'
  end
  object ButtonStep1: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 37
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1103#1079#1099#1082#1080
    TabOrder = 0
    OnClick = ButtonStep1Click
  end
  object ButtonStep2: TButton
    Left = 8
    Top = 51
    Width = 121
    Height = 37
    Caption = #1055#1077#1088#1077#1074#1086#1076' '#1089#1091#1073#1090#1080#1090#1088#1086#1074
    TabOrder = 1
    OnClick = ButtonStep2Click
  end
  object ButtonStep3: TButton
    Left = 8
    Top = 94
    Width = 121
    Height = 37
    Caption = #1055#1077#1088#1077#1074#1086#1076' '#1086#1087#1080#1089#1072#1085#1080#1103
    TabOrder = 2
    OnClick = ButtonStep3Click
  end
  object LoadTask: TButton
    Left = 302
    Top = 114
    Width = 75
    Height = 25
    Caption = 'LoadTask'
    TabOrder = 3
    OnClick = LoadTaskClick
  end
  object Memo1: TMemo
    Left = 303
    Top = 287
    Width = 449
    Height = 97
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
    Visible = False
  end
  object Start: TButton
    Left = 302
    Top = 83
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 5
    OnClick = StartClick
  end
  object CountRepeatCicleEdit: TEdit
    Left = 175
    Top = 48
    Width = 54
    Height = 23
    Enabled = False
    TabOrder = 6
    Text = 'CountRepeatCicleEdit'
  end
  object TestButton: TButton
    Left = 302
    Top = 159
    Width = 75
    Height = 25
    Caption = 'TestButton'
    TabOrder = 7
    OnClick = TestButtonClick
  end
  object GetXYMouse: TButton
    Left = 302
    Top = 219
    Width = 75
    Height = 25
    Caption = 'GetXYMouse'
    TabOrder = 8
    OnClick = GetXYMouseClick
  end
  object XYMouse: TEdit
    Left = 302
    Top = 190
    Width = 75
    Height = 23
    TabOrder = 9
    Text = 'XYMouse'
  end
  object TestButton2: TButton
    Left = 303
    Top = 256
    Width = 75
    Height = 25
    Caption = 'TestButton2'
    TabOrder = 10
    OnClick = TestButton2Click
  end
  object MemoError: TMemo
    Left = 8
    Top = 219
    Width = 289
    Height = 177
    Lines.Strings = (
      'MemoError')
    TabOrder = 11
    Visible = False
  end
  object TranslateTextMemo: TMemo
    Left = 302
    Top = 384
    Width = 657
    Height = 65
    Lines.Strings = (
      'TranslateTextMemo')
    ScrollBars = ssVertical
    TabOrder = 12
    Visible = False
  end
  object OpenDialog1: TOpenDialog
    Left = 399
    Top = 96
  end
end
