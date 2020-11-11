object Dm_MainLib: TDm_MainLib
  OldCreateOrder = False
  Height = 563
  Width = 590
  object MainDatabase: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=WMS_SEOJIN;Data Source=192.168.0.123,34333;'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 8
  end
  object qryTemp: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 24
    Top = 88
  end
  object qryTrackMove: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 80
    Top = 88
  end
  object qryOrderGet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 80
    Top = 144
  end
  object qryTrackCheck: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 144
    Top = 88
  end
  object qryTrackIPGOSet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 200
    Top = 88
  end
  object qryOrderSet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 144
    Top = 144
  end
  object qrySCDataMove: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 80
    Top = 200
  end
  object qryTrackGetJobNo: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 256
    Top = 88
  end
  object qrySCOrderSet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 144
    Top = 200
  end
  object qryTrackSet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 304
    Top = 88
  end
  object qryCurrentSet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 200
    Top = 200
  end
  object qryCurrentGet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 256
    Top = 200
  end
  object qryComset: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 80
    Top = 264
  end
  object qryErrorMsgGet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 80
    Top = 328
  end
  object PD_INS_PGM_HIST: TADOStoredProc
    Connection = MainDatabase
    ProcedureName = 'PD_INS_PGM_HIST'
    Parameters = <
      item
        Name = 'I_MENU_ID'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_HIST_TYPE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_PGM_FUNCTION'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_EVENT_NAME'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_EVENT_DESC'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_COMMAND_TYPE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_COMMAND_TEXT'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_PARAM'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_ERROR_MSG'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_USER_ID'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'O_ERR_CD'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdOutput
        Size = 4000
        Value = Null
      end
      item
        Name = 'O_ERR_MSG'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdOutput
        Size = 4000
        Value = Null
      end>
    Left = 80
    Top = 8
  end
  object qryRackGet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 80
    Top = 384
  end
  object qryRackSet: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 144
    Top = 384
  end
  object PD_INS_EPLT_ORDER: TADOStoredProc
    Connection = MainDatabase
    ProcedureName = 'PD_INS_EPLT_ORDER'
    Parameters = <
      item
        Name = 'I_WMS_NO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = 'I_ITEM_CODE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = 'I_PLC_NO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = 'I_QTY'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'O_VRETCD'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdOutput
        Size = 20
        Value = Null
      end
      item
        Name = 'O_VRETMSG'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdOutput
        Size = 250
        Value = Null
      end>
    Left = 144
    Top = 8
  end
  object PD_RE_INPUT: TADOStoredProc
    Connection = MainDatabase
    ProcedureName = 'PD_RE_INPUT'
    Parameters = <>
    Left = 200
    Top = 8
  end
  object PD_UDT_ORD_SEQ: TADOStoredProc
    Connection = MainDatabase
    ProcedureName = 'PD_UDT_ORD_SEQ'
    Parameters = <>
    Left = 256
    Top = 8
  end
  object SP_CELL_FIND: TADOStoredProc
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=netis1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=WMS_SEOJIN;Data Source=192.168.0.12' +
      '3,34333'
    ProcedureName = 'PD_GET_EMPTY_RACK'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@I_TYPE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@I_PLC_NO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
      end
      item
        Name = '@I_SC'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
      end
      item
        Name = '@O_RACK_LOC'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 8
      end>
    Left = 304
    Top = 9
  end
  object qryError: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 144
    Top = 328
  end
end
