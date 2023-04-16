object ProfileForm: TProfileForm
  Left = 0
  Top = 0
  Caption = 'ProfileForm'
  ClientHeight = 163
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Yfbv: TLabel
    Left = 8
    Top = 8
    Width = 83
    Height = 15
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label4: TLabel
    Left = 8
    Top = 40
    Width = 133
    Height = 15
    Caption = #1044#1083#1103' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' '#1101#1082#1088#1072#1085#1072
  end
  object Label5: TLabel
    Left = 8
    Top = 74
    Width = 126
    Height = 15
    Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1103#1079#1099#1082' '#1082#1072#1085#1072#1083#1072
  end
  object BitBtnOk: TBitBtn
    Left = 32
    Top = 121
    Width = 75
    Height = 25
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtnOkClick
  end
  object BitBtnCancel: TBitBtn
    Left = 190
    Top = 121
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = BitBtnCancelClick
  end
  object Edit1: TEdit
    Left = 97
    Top = 8
    Width = 192
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 147
    Top = 37
    Width = 142
    Height = 23
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 147
    Top = 66
    Width = 142
    Height = 23
    TabOrder = 2
    Text = 'pl'
  end
end
