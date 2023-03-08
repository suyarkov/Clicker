object fLanguages: TfLanguages
  Left = 0
  Top = 0
  Caption = 'fLanguages'
  ClientHeight = 433
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 400
    Width = 73
    Height = 15
    Caption = #1042#1089#1077#1075#1086' '#1103#1079#1099#1082#1086#1074
  end
  object LabelCount: TLabel
    Left = 96
    Top = 400
    Width = 25
    Height = 15
    Caption = '10'
  end
  object Label2: TLabel
    Left = 168
    Top = 400
    Width = 46
    Height = 15
    Caption = #1040#1082#1090#1080#1074#1085#1086
  end
  object LabelActiv: TLabel
    Left = 232
    Top = 400
    Width = 55
    Height = 15
    Caption = 'LabelActiv'
    OnClick = LabelActivClick
  end
  object LanguagesGrid: TStringGrid
    Left = 8
    Top = 8
    Width = 605
    Height = 377
    TabOrder = 0
    OnDblClick = LanguagesGridDblClick
  end
  object ButtonOK: TButton
    Left = 432
    Top = 400
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 528
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object DataSource1: TDataSource
    Left = 584
    Top = 16
  end
end
