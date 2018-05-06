object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=bdclientes'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 88
    Top = 56
  end
end
