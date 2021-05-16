object dm: Tdm
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 296
  Width = 459
  object FDManager1: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 352
    Top = 48
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'SERVER=.\HaoSQL'
      'User_Name=sa'
      'Password=haosql'
      'OSAuthent=No'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=DESKTOP-M53FFHS'
      'Database=yhosta'
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM dbo.T_yhks_tmp')
    Left = 40
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 344
    Top = 112
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 344
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 48
    Top = 160
  end
end
