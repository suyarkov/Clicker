object ProfileForm: TProfileForm
  Left = 0
  Top = 0
  Caption = 'ProfileForm'
  ClientHeight = 434
  ClientWidth = 257
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
    Width = 11
    Height = 15
    Caption = 'ID'
  end
  object Label3: TLabel
    Left = 8
    Top = 55
    Width = 34
    Height = 15
    Caption = 'NAME'
  end
  object Label4: TLabel
    Left = 8
    Top = 171
    Width = 22
    Height = 15
    Caption = 'SIZE'
  end
  object Label5: TLabel
    Left = 8
    Top = 283
    Width = 54
    Height = 15
    Caption = 'MAINLNG'
  end
  object BitBtnOk: TBitBtn
    Left = 72
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = BitBtnOkClick
  end
  object BitBtnCancel: TBitBtn
    Left = 168
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = BitBtnCancelClick
  end
  object Memo1: TMemo
    Left = 16
    Top = 80
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 16
    Top = 192
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo2')
    TabOrder = 3
  end
  object Memo3: TMemo
    Left = 8
    Top = 304
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo3')
    TabOrder = 4
  end
end
