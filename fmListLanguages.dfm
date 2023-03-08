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
  TextHeight = 15
  object LanguagesGrid: TStringGrid
    Left = 16
    Top = 8
    Width = 597
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
