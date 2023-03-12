object SQLiteModule: TSQLiteModule
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object ClickConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Click')
    Connected = True
    LoginPrompt = False
    Left = 195
    Top = 23
  end
end
