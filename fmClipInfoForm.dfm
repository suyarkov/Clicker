object ClipInfoForm: TClipInfoForm
  Left = 0
  Top = 0
  Caption = 'ClipInfoForm'
  ClientHeight = 424
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object MemoClipName: TMemo
    Left = 24
    Top = 20
    Width = 473
    Height = 37
    Lines.Strings = (
      'MemoClipName')
    TabOrder = 0
  end
  object MemoClipInfo: TMemo
    Left = 24
    Top = 72
    Width = 473
    Height = 289
    Lines.Strings = (
      'MemoClipInfo')
    TabOrder = 1
  end
  object ButtonOk: TButton
    Left = 422
    Top = 384
    Width = 75
    Height = 25
    Caption = 'ButtonOk'
    TabOrder = 2
    OnClick = ButtonOkClick
  end
end
