object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 467
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
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
    Left = 296
    Top = 16
    Width = 118
    Height = 15
    Caption = 'LabelCountLanguages'
  end
  object LabelMainLanguage: TLabel
    Left = 24
    Top = 16
    Width = 107
    Height = 15
    Caption = 'LabelMainLanguage'
  end
  object Label2: TLabel
    Left = 640
    Top = 440
    Width = 34
    Height = 15
    Caption = 'Label2'
  end
  object MemoClipName: TMemo
    Left = 24
    Top = 84
    Width = 473
    Height = 37
    Lines.Strings = (
      'MemoClipName')
    TabOrder = 0
    OnChange = MemoClipNameChange
  end
  object MemoClipInfo: TMemo
    Left = 24
    Top = 160
    Width = 473
    Height = 289
    Lines.Strings = (
      'MemoClipInfo')
    TabOrder = 1
    OnChange = MemoClipInfoChange
  end
  object EditCountNameLetters: TEdit
    Left = 296
    Top = 55
    Width = 137
    Height = 23
    TabOrder = 2
    Text = 'EditCountNameLetters'
  end
  object EditCountInfoLetters: TEdit
    Left = 296
    Top = 135
    Width = 137
    Height = 23
    TabOrder = 3
    Text = 'EditCountInfoLetters'
  end
  object ButtonStep1: TButton
    Left = 520
    Top = 84
    Width = 104
    Height = 57
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1103#1079#1099#1082#1080
    TabOrder = 4
  end
  object Button2: TButton
    Left = 520
    Top = 160
    Width = 104
    Height = 57
    Caption = #1057#1091#1073#1090#1080#1090#1088#1099
    TabOrder = 5
  end
  object Button3: TButton
    Left = 520
    Top = 240
    Width = 104
    Height = 57
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1082#1083#1080#1087#1072
    TabOrder = 6
  end
  object LoadTask: TButton
    Left = 528
    Top = 360
    Width = 75
    Height = 25
    Caption = 'LoadTask'
    TabOrder = 7
    OnClick = LoadTaskClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 288
    Width = 506
    Height = 97
    Lines.Strings = (
      'Memo1')
    TabOrder = 8
  end
  object EditFileName: TEdit
    Left = 630
    Top = 299
    Width = 121
    Height = 23
    TabOrder = 9
    Text = 'EditFileName'
  end
  object Start: TButton
    Left = 528
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 10
    OnClick = StartClick
  end
  object Edit1: TEdit
    Left = 659
    Top = 240
    Width = 121
    Height = 23
    TabOrder = 11
    Text = 'Edit1'
  end
  object StringGrid1: TStringGrid
    Left = 680
    Top = 31
    Width = 65
    Height = 66
    Color = clBtnFace
    DefaultColWidth = 285
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goFixedRowDefAlign]
    TabOrder = 12
  end
  object OpenDialog1: TOpenDialog
    Left = 528
    Top = 32
  end
end
