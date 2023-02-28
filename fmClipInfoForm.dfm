object ClipInfoForm: TClipInfoForm
  Left = 0
  Top = 0
  Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1082#1083#1080#1087#1072
  ClientHeight = 507
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 253
    Height = 15
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1083#1080#1087#1072', '#1085#1077' '#1073#1086#1083#1077#1077' 100 '#1089#1080#1084#1074#1086#1083#1086#1074
  end
  object LabelClipInfo: TLabel
    Left = 8
    Top = 58
    Width = 236
    Height = 15
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1082#1083#1080#1087#1072' ('#1085#1077' '#1073#1086#1083#1077#1077' 5000 '#1089#1080#1084#1074#1086#1083#1086#1074')'
  end
  object Label2: TLabel
    Left = 512
    Top = 8
    Width = 61
    Height = 15
    Caption = #1071#1079#1099#1082' '#1074#1074#1086#1076#1072
  end
  object MemoClipInfo: TMemo
    Left = 8
    Top = 79
    Width = 733
    Height = 394
    Lines.Strings = (
      'MemoClipInfo')
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = MemoClipInfoChange
  end
  object ButtonOk: TButton
    Left = 535
    Top = 479
    Width = 94
    Height = 25
    Caption = #1054#1050
    TabOrder = 2
    OnClick = ButtonOkClick
  end
  object EditClipName: TEdit
    Left = 8
    Top = 29
    Width = 733
    Height = 23
    TabOrder = 0
    Text = 'EditClipName'
    OnChange = EditClipNameChange
  end
  object ButtonCancel: TButton
    Left = 647
    Top = 479
    Width = 94
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
  object EditCountNameLetters: TEdit
    Left = 280
    Top = 3
    Width = 81
    Height = 23
    TabOrder = 4
    Text = 'EditCountNameLetters'
  end
  object EditCountInfoLetters: TEdit
    Left = 280
    Top = 54
    Width = 81
    Height = 23
    TabOrder = 5
    Text = 'EditCountInfoLetters'
  end
  object LanguageComboBox: TComboBox
    Left = 596
    Top = 3
    Width = 145
    Height = 23
    TabOrder = 6
    Text = 'LanguageComboBox'
  end
end
