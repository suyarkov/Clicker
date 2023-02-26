object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 467
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object LabelClipName: TLabel
    Left = 24
    Top = 63
    Width = 249
    Height = 15
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1083#1080#1087#1072' ('#1085#1077' '#1073#1086#1083#1077#1077' 100 '#1089#1080#1074#1086#1083#1086#1074')'
  end
  object LabelClipInfo: TLabel
    Left = 24
    Top = 139
    Width = 236
    Height = 15
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1082#1083#1080#1087#1072' ('#1085#1077' '#1073#1086#1083#1077#1077' 5000 '#1089#1080#1084#1074#1086#1083#1086#1074')'
  end
  object LabelCountLanguages: TLabel
    Left = 639
    Top = 37
    Width = 118
    Height = 15
    Caption = 'LabelCountLanguages'
  end
  object LabelMainLanguage: TLabel
    Left = 639
    Top = 16
    Width = 107
    Height = 15
    Caption = 'LabelMainLanguage'
  end
  object Label2: TLabel
    Left = 475
    Top = 16
    Width = 34
    Height = 15
    Caption = 'Label2'
  end
  object MemoClipName: TMemo
    Left = 8
    Top = 84
    Width = 609
    Height = 37
    Lines.Strings = (
      'MemoClipName')
    TabOrder = 0
    OnChange = MemoClipNameChange
  end
  object MemoClipInfo: TMemo
    Left = 8
    Top = 160
    Width = 609
    Height = 289
    Lines.Strings = (
      'MemoClipInfo')
    ScrollBars = ssBoth
    TabOrder = 1
    OnChange = MemoClipInfoChange
  end
  object EditCountNameLetters: TEdit
    Left = 279
    Top = 55
    Width = 50
    Height = 23
    TabOrder = 2
    Text = 'EditCountNameLetters'
  end
  object EditCountInfoLetters: TEdit
    Left = 280
    Top = 131
    Width = 49
    Height = 23
    TabOrder = 3
    Text = 'EditCountInfoLetters'
  end
  object ButtonStep1: TButton
    Left = 8
    Top = 8
    Width = 104
    Height = 37
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1103#1079#1099#1082#1080
    TabOrder = 4
    OnClick = ButtonStep1Click
  end
  object ButtonStep2: TButton
    Left = 147
    Top = 8
    Width = 126
    Height = 37
    Caption = #1055#1077#1088#1077#1074#1086#1076' '#1089#1091#1073#1090#1080#1090#1088#1086#1074
    TabOrder = 5
    OnClick = ButtonStep2Click
  end
  object ButtonStep3: TButton
    Left = 320
    Top = 8
    Width = 129
    Height = 37
    Caption = #1055#1077#1088#1077#1074#1086#1076' '#1086#1087#1080#1089#1072#1085#1080#1103
    TabOrder = 6
    OnClick = ButtonStep3Click
  end
  object LoadTask: TButton
    Left = 639
    Top = 114
    Width = 75
    Height = 25
    Caption = 'LoadTask'
    TabOrder = 7
    OnClick = LoadTaskClick
  end
  object Memo1: TMemo
    Left = 639
    Top = 253
    Width = 449
    Height = 97
    Lines.Strings = (
      'Memo1')
    TabOrder = 8
    Visible = False
  end
  object Start: TButton
    Left = 639
    Top = 83
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 9
    OnClick = StartClick
  end
  object CountRepeatCicleEdit: TEdit
    Left = 531
    Top = 13
    Width = 54
    Height = 23
    Enabled = False
    TabOrder = 10
    Text = 'CountRepeatCicleEdit'
  end
  object TestButton: TButton
    Left = 639
    Top = 159
    Width = 75
    Height = 25
    Caption = 'TestButton'
    TabOrder = 11
    OnClick = TestButtonClick
  end
  object GetXYMouse: TButton
    Left = 639
    Top = 219
    Width = 75
    Height = 25
    Caption = 'GetXYMouse'
    TabOrder = 12
    OnClick = GetXYMouseClick
  end
  object XYMouse: TEdit
    Left = 639
    Top = 190
    Width = 75
    Height = 23
    TabOrder = 13
    Text = 'XYMouse'
  end
  object TestButton2: TButton
    Left = 640
    Top = 256
    Width = 75
    Height = 25
    Caption = 'TestButton2'
    TabOrder = 14
    OnClick = TestButton2Click
  end
  object TranslateTextMemo: TMemo
    Left = 639
    Top = 384
    Width = 657
    Height = 65
    Lines.Strings = (
      'TranslateTextMemo')
    ScrollBars = ssVertical
    TabOrder = 15
    Visible = False
  end
  object OpenDialog1: TOpenDialog
    Left = 736
    Top = 96
  end
end
