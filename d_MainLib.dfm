object Dm_MainLib: TDm_MainLib
  OldCreateOrder = False
  Height = 251
  Width = 364
  object MainDatabase: TADOConnection
    Left = 40
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 120
    Top = 48
  end
  object qryTemp: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 184
    Top = 48
  end
  object qryTrack: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 240
    Top = 48
  end
  object PD_INS_PGM_HIST: TADOStoredProc
    Parameters = <>
    Left = 40
    Top = 112
  end
end
