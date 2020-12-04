//==============================================================================
//  DB �ڵ鸵���� ����ϴ� Library Function
//==============================================================================
unit d_MainLib;

interface

uses
  SysUtils, Classes, DB, ADODB, inifiles, CPort, Variants, h_MainLib;

type
  TDm_MainLib = class(TDataModule)
    qryTemp: TADOQuery;
    MainDatabase: TADOConnection;
    qryTrackMove: TADOQuery;
    qryOrderGet: TADOQuery;
    qryTrackCheck: TADOQuery;
    qryTrackIPGOSet: TADOQuery;
    qryOrderSet: TADOQuery;
    qrySCDataMove: TADOQuery;
    qryTrackGetJobNo: TADOQuery;
    qrySCOrderSet: TADOQuery;
    qryTrackSet: TADOQuery;
    qryCurrentSet: TADOQuery;
    qryCurrentGet: TADOQuery;
    qryComset: TADOQuery;
    qryErrorMsgGet: TADOQuery;
    PD_INS_PGM_HIST: TADOStoredProc;
    qryRackGet: TADOQuery;
    qryRackSet: TADOQuery;
    PD_INS_EPLT_ORDER: TADOStoredProc;
    PD_RE_INPUT: TADOStoredProc;
    PD_UDT_ORD_SEQ: TADOStoredProc;
    SP_CELL_FIND: TADOStoredProc;
    qryError: TADOQuery;

    procedure MainDatabaseAfterConnect(Sender: TObject);
    procedure MainDatabaseAfterDisconnect(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    M_Info : Main_Info;
  end;
    function  Uf_DBConnection: Boolean;
    function  Uf_CommConnection: Boolean;
    procedure Uf_GetInitfile;
    procedure Uf_SetInitfile;

    function  Uf_GetCVCRRead:Boolean;       //buttonCVCR_Read
    function  Uf_GetCVCWRead:Boolean;       //buttonCVCW_Read

    function  Uf_TrackDataCheck(Device, Buff_No: Integer): Boolean;
    procedure Uf_TrackDataSet(Job_No: String; Data, Device, Buff_No: Integer);
    procedure Uf_TrackDBMove(Device, Buff_No: Integer);
    function  Uf_TrackGetJobNo(Device, Buff_No: Integer): Integer;
    function  Uf_TrackIPGOSet(Job_No, Device, Buff_No: Integer): Boolean;

    function  Uf_TableWirte_CVCR(Idx: Integer; Value:AnsiString):Boolean;
    function  Uf_TableWirte_CVCW(Idx: Integer; Value:AnsiString):Boolean;
    function  Uf_TableWirte_SCCR(Idx: Integer; Value:String):Boolean;
    function  Uf_TableWirte_SCCW(Idx: Integer; Value:String):Boolean;

    function  Uf_TC_SCCW_Update(Hogi:Integer;Msg:String):Boolean;

    function  Uf_GetSCRRead:Boolean;
    function  Uf_SetSCRWrite:Boolean;
    function  Uf_GetSCWRead:Boolean;

    function  Uf_GetComset(Key, Field: String):String;
    function  Uf_GetCurrent(Key, Field: String):String;
    procedure Uf_SetCurrent(Key, Field, Value: String);
    function  Uf_GetErrorMsg(Mach, Code: String): String;
    function  Uf_GetOrderJobNo(Device: Integer; IO, Status: String ): Integer; overload;
    function  Uf_GetOrderJobNo(Device: Integer; WhereStr: String): Integer; overload;
    function  Uf_GetOrderJobNo(WhereStr: String): Integer; overload;
    function  Uf_GetOrderPLCNo(IO, Status: String): Integer;
    function  Uf_GetOrderCount(WhereStr: String) : Integer;
    function  Uf_GetOrder(Job_No, Field: String): String;
    procedure Uf_SetOrder(Job_No, Field, Value: String);
    procedure Uf_DeleteOrder(Job_No: String);
    function  Uf_ReIn_OrderCreate(Job_No: String): Boolean;
    procedure Uf_UpdateOrdSeq();
    function  Uf_GetRack(Loc, Field: String): String;
    procedure Uf_SetRack(Loc, Field, Value: String);
    procedure Uf_SetRackStock(Loc, Field, Value: String);
    procedure Uf_SetIntStatus(Device: Integer);


    procedure Uf_SCDataMove(Device: Integer; IO: String);
    procedure Uf_SC_WriteDataSet(Device, Job_No: Integer; IO: String);

    function  GetEmptyRack(tTYPE, PLC_NO, SC: String): String;
    procedure InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
    function  InsertEPLT_ORDER(I_WMS_NO, I_ITEM_CODE, I_PLC_NO, I_QTY: String): String;

    procedure ErrorWrite(ErrorCode, ErrorMach, JOB_NO, ORD_LOC: String);
    procedure ErrorClear(Mach, ErrorCode: String);

var
  Dm_MainLib: TDm_MainLib;


var
  gDbCon :  Array[1..2] of TDbCon;

implementation

uses h_ReferLib, RCP_Comm;
{$R *.dfm}

//------------------------------------------------------------------------------
// Database Connection
//------------------------------------------------------------------------------
function Uf_DBConnection: Boolean;
var
  FileName : String;
  Msg : String;
begin
  Result := False;
  //---------------------------------------------------------------------------
  // DB ������ ���� ini Read
  //---------------- -----------------------------------------------------------
  gDbCon[1].OLE     := IniRead(INI_PATH, 'Database', 'Provider'      , 'SQLOLEDB.1');
  gDbCon[1].Alias   := IniRead(INI_PATH, 'Database', 'Datasource'    , '');
  gDbcon[1].Catalog := IniRead(INI_PATH, 'Database', 'InitialCatalog', '');
  gDbCon[1].User    := IniRead(INI_PATH, 'Database', 'ID'            , '');
  gDbCon[1].Pass    := IniRead(INI_PATH, 'Database', 'PW'            , '');

  //---------------------------------------------------------------------------
  // DB ����
  //---------------------------------------------------------------------------
  with Dm_MainLib.MainDatabase do
  begin
    try
      Close;
      ConnectionString :='Provider='        + gDbCon[1].Ole     + ';' +
                         'Persist Security Info=True;'          +
                         'User ID='         + gDbCon[1].User    + ';' +
                         'Data Source='     + gDbCon[1].Alias   + ';' +
                         'Initial Catalog=' + gDbCon[1].Catalog + ';' +
                         'Password='        + gDbCon[1].Pass       ;
      Connected := True;
      Result:= True ;
    except
      ON E: Exception do
      begin
        FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
        Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
        Msg := Msg + 'Uf_DBConnection' + '['+ E.Message + ']' + 'ConnectionStr:' + ConnectionString;
        LogWrite(FileName, Msg);
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Serial Comm Connection
//------------------------------------------------------------------------------
function Uf_CommConnection: Boolean;
Begin
  Result := False;
//  try
//    Uf_GetInitfile ;
//    frmMain.ComPortPLC.Connected := True;
//
//    Result:= True ;
//    gLogwriteComport := False;
//    LogWrite('.\log\ErrorDB.log','Comport Connection Sucess ' );
//  except
//    if gLogwriteComport = False then
//    begin
//       LogWrite('.\log\ErrorDB.log','Comport Connection Fail ');
//       gLogwriteComport := True;
//    end;
//  end;
end;

//------------------------------------------------------------------------------
//  INI File �� ���� ��� �������� �о�´�.
//------------------------------------------------------------------------------
procedure Uf_GetInitfile;
var
    MyIniFile: TIniFile;
begin
//    MyIniFile := TIniFile.Create(INI_PATH);
//
//    frmMain.ComPortPLC.Port     := MyIniFile.ReadString('CVC', 'PORT', 'COM1');
//    frmMain.ComPortPLC.BaudRate := StrToBaudRate(MyIniFile.ReadString('CVC', 'BaudRate', '9600'));
//    frmMain.ComPortPLC.DataBits := StrToDataBits(MyIniFile.ReadString('CVC', 'DataBits', '8'));
//    frmMain.ComPortPLC.StopBits := StrToStopBits(MyIniFile.ReadString('CVC', 'StopBits', '1'));
//    frmMain.ComPortPLC.Parity.Bits := StrToParity(MyIniFile.ReadString('CVC', 'Parity', 'None'));
//
//    MyIniFile.Free;
end;

//------------------------------------------------------------------------------
//  INI File�� ����� ��� �������� Write �Ѵ�.
//------------------------------------------------------------------------------
procedure Uf_SetInitfile;
var
    MyIniFile: TIniFile;
begin
//    MyIniFile := TIniFile.Create(INI_PATH);
//
//    MyIniFile.Writestring('CVC', 'PORT', frmMain.ComPortPLC.Port);
//    MyIniFile.Writestring('CVC', 'BaudRate', BaudrateToStr(frmMain.ComPortPLC.BaudRate ));
//    MyIniFile.Writestring('CVC', 'DataBits', DataBitsToStr(frmMain.ComPortPLC.DataBits) );
//    MyIniFile.Writestring('CVC', 'StopBits', StopBitsToStr(frmMain.ComPortPLC.StopBits));
//    MyIniFile.Writestring('CVC', 'Parity', ParityToStr(frmMain.ComPortPLC.Parity.Bits));
//
//    MyIniFile.Free;
end;

//---------------------------------------------------------------------------
// Uf_TrackDataCheck : Device:PLC_No, Buff_No: CV_NO. Ʈ���� ������ ���� Ȯ��
//---------------------------------------------------------------------------
function Uf_TrackDataCheck(Device, Buff_No: Integer): Boolean;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  Result := False;
  try
    with Dm_MainLib.qryTrackCheck do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT PLC_NO, BUFF_NO, DATA ' +
                '   FROM TT_TRACK WITH(NOLOCK)' +
                '  WHERE PLC_NO = ' + IntToStr(Device) +
                '    AND BUFF_NO = ' + IntToStr(Buff_No) +
                '    AND DATA = 1 ';
      SQL.Text := StrSQL;
      Open;

      // �����Ͱ� �������� �ʴ� ���
      if (isEmpty) then
      begin
        Result := False;
      end
      // �����Ͱ� �����ϴ� ���
      else
      begin
        Result := True;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_TrackDataCheck', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_TrackDataCheck' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;

end;

//---------------------------------------------------------------------------
// Uf_TrackIPGOSet : DB Ʈ�������͸� �Է���. Job_No:�۾���ȣ. Device:PLC NO, Buff_NO:CV_NO
//-----------------------------------------------------------------------
procedure Uf_TrackDataSet(Job_No: String; Data, Device, Buff_No: Integer);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  try
    with Dm_MainLib.qryTrackMove do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_TRACK ' +
                '    SET DATA      = ' + QuotedStr(IntToStr(Data)) +
                '      , JOB_NO    = ' + QuotedStr(Job_No) +
                '      , UPDATE_DT = GETDATE()' +
                '  WHERE PLC_NO  = ' + IntToStr(Device) +
                '    AND BUFF_NO = ' + IntToStr(Buff_No);
      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;
  except
    on E : Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_TrackDataSet', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_TrackDataSet' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//---------------------------------------------------------------------------
// Uf_TrackDBUpdate : DB Ʈ�� �����͸� �̵���Ŵ. Device:PLC NO, Buff_NO:CV_NO
//---------------------------------------------------------------------------
procedure Uf_TrackDBMove(Device, Buff_No : Integer);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  if (Buff_No = 1) then Exit;

  try
    with Dm_MainLib.qryTrackMove do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_TRACK ' +
                '    SET DATA = 1 ' +
                '      , JOB_NO = A.JOB_NO ' +
                '      , UPDATE_DT = GETDATE() ' +
                '   FROM (SELECT DATA, JOB_NO ' +
                '           FROM TT_TRACK WITH(NOLOCK)' +
                '          WHERE PLC_NO = ' + IntToStr(Device) +
                '            AND BUFF_NO = ' + IntToStr(Buff_No - 1) + ') AS A ' +
                '  WHERE PLC_NO = ' + IntToStr(Device) +
                '    AND BUFF_NO = ' + IntToStr(Buff_No);
      SQL.Text := StrSQL;
      ExecSQL;

      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_TRACK ' +
                '    SET DATA = 0 ' +
                '      , JOB_NO = '''' ' +
                '      , UPDATE_DT = GETDATE() ' +
                '  WHERE PLC_NO = ' + IntToStr(Device) +
                '    AND BUFF_NO = ' + IntToStr(Buff_No - 1);
      SQL.Text := StrSQL;
      ExecSQL;

      Close;
    end;
  except
    on E : Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_TrackDBMove', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_TrackDBMove' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// Uf_TrackGetJobNo : Device: PLC No 1 or 2, Buff_No: CV_NO
//==============================================================================
function Uf_TrackGetJobNo(Device, Buff_No: Integer): Integer;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  if (Buff_No = 1) then Exit;
  Result := -1;
  try
    with Dm_MainLib.qryTrackGetJobNo do
    begin
      Close;
      StrSQL := ' SELECT JOB_NO ' +
                '   FROM TT_TRACK WITH(NOLOCK) ' +
                '  WHERE PLC_NO = ' + IntToStr(Device) +
                '    AND BUFF_NO = ' + IntToStr(Buff_No);
      SQL.Text := StrSQL;
      Open;

      if (StrToIntDef(FieldByName('JOB_NO').AsString, 0) > 0) then
      begin
        Result := FieldByName('JOB_NO').AsInteger;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_TrackGetJobNo', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_TrackDBMove' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;

end;

//---------------------------------------------------------------------------
// Uf_TrackIPGOSet : �԰� Ʈ�� ������ �Է���. Device:PLC NO, Buff_NO:CV_NO
//---------------------------------------------------------------------------
function Uf_TrackIPGOSet(Job_No, Device, Buff_No : Integer): Boolean;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  try
    with Dm_MainLib.qryTrackIPGOSet do
    begin
      Close;
      StrSQL := ' UPDATE TT_TRACK ' +
                '    SET JOB_NO = ' + QuotedStr(IntToStr(Job_No)) +
                '      , DATA = 1 ' +
                '      , UPDATE_DT = GETDATE() ' +
                '  WHERE PLC_NO = ' + IntToStr(Device) +
                '    AND BUFF_NO = ' + IntToStr(Buff_No) +
                '    AND DATA = 0 ' ;
      SQL.Text := StrSQL;

      // Ʈ���Է� ������ ���û��º���  & return True, ���н� return False
      if (ExecSQL) > 0 then
      begin
        Result := True;
        Uf_SetOrder(IntToStr(Job_No), 'STATUS', 'CV�̵�');
        Close;
      end
      else
      begin
        Result := False;
        Close;
      end
    end;

  except
    on E: Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_TrackIPGOSet', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_TrackIPGOSet' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;

  end;

end;


//==============================================================================
//
//==============================================================================
function Uf_GetCVCRRead:Boolean;
var Max,Loop:Integer;
    ReadBuffer:Array [0..111] of AnsiChar;
    strSQL, Temp :String;
begin
//    Result:=False;
//    Max := 4;
//
//    with Dm_MainLib.qrytemp do
//    begin
//      try
//        strSQL := 'SELECT * FROM TC_CVCR_MOLD WHERE Idx=1';
//        Close;
//        SQL.Text := strSQL;
//        Open;
//
//        FillChar(ReadBuffer, sizeof(ReadBuffer),Ord('0'));
//
//        if RecordCount>0 then
//        begin
//          for Loop:=0 to Max-1do
//          begin
//            Temp:=FieldByName('CH'+FormatFloat('00',Loop )).AsString;
//            Temp:=StrHexToStrBin(Temp);
//            StrMove(@ReadBuffer[Loop*16],PChar(Temp),Length(Temp));
//          end;
//        end;
//        StrMove(@gCVCR.All,ReadBuffer,Max*16);
//        Result:=True;
//        gUf_GetCVCRead := False;
//      Except
//        on E: Exception do BEGIN
//          Dm_MainLib.MainDatabase.Connected := False;
//          if gUf_GetCVCRead = False then begin
//              LogWrite('.\log\ErrorDB.log','Uf_GetCVCRRead'+ '['+ E.Message + ']'+'['+strSQL +']');
//              gUf_GetCVCRead := True;
//          end;
//        End;
//      End;
//    end;
end;

//==============================================================================
//
//==============================================================================
function Uf_GetCVCWRead:Boolean;
var Loop, Max:Integer;
    ReadBuffer:Array [0..31] of Char;
    strSQL, Temp:String;
begin
  Result:=False;

//  with Dm_MainLib.qrytemp do
//  begin
//    try
//      strSQL := 'SELECT * FROM TC_CVCW_MOLD WHERE Idx=1';
//      Close;
//      SQL.Text := strSQL;
//      Open;
//
//      FillChar(ReadBuffer, sizeof(ReadBuffer),Ord('0'));
//      Max:=2;
//      if RecordCount>0 then
//      begin
//        for Loop:=0 to Max-1 do
//        begin
//          Temp:=FieldByName('CH'+FormatFloat('00',Loop)).AsString;
//          Temp:=StrHexToStrBin(Temp);
//          StrMove(@ReadBuffer[Loop*16],PChar(Temp),Length(Temp));
//        end;
//      end;
//      StrMove(@gCVCW.All,ReadBuffer,Max*16);
//      Result:=True;
//
//    Except
//      on E: Exception do
//      BEGIN
//        Dm_MainLib.MainDatabase.Connected := False;
//        LogWrite('.\log\ErrorDB.log','Uf_GetCVCWRead'+ '['+ E.Message + ']'+'['+strSQL +']');
//      End ;
//    End;
//  end;
end;

//==============================================================================
//
//==============================================================================
function Uf_TableWirte_CVCR(Idx: Integer; Value:AnsiString):Boolean;
var
  Loop   : Integer;
  Max    : Integer;
  StrSQL : string;
  Temp   : string;
begin
  Result := False;
  Max := Length(Value) div 16;

  try
    with Dm_MainLib.qryTemp do
    begin
      Close;
      StrSQL := ' SELECT * FROM TC_CVCR WITH(NOLOCK) WHERE IDX = ' + IntToStr(Idx);
      SQL.Text := StrSQL;
      Open;

      // ���̺� ���� ���� ���
      if (isEmpty) then
      begin
        Close;
        StrSQL := 'INSERT INTO TC_CVCR(IDX, ';

        for Loop := 0 to Max - 1 do
        begin
          StrSQL := StrSQL + 'CH' + FormatFloat('00', Loop) + ', ';
        end;

        // ������ CR_DATE�ְ�  ��ȣ ����
        StrSQL := StrSQL + 'CR_DATE)';

        // Values ��
        StrSQL := StrSQL + 'VALUES (' + QuotedStr(IntToStr(Idx)) + ', ';

        for Loop := 0 to Max -1 do
        begin
          StrSQL := StrSQL + QuotedStr(Copy(Value, (Loop * 16) + 1, 16)) + ',';
        end;

        // ������ CR_DATE�� �ְ� ��ȣ ����
        StrSQL := StrSQL + 'GETDATE() )';
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end
      // ���̺� ���� �ִ� ���
      else
      begin
        Close;
        StrSQL := 'UPDATE TC_CVCR SET ';

        for Loop := 0 to Max - 1 do
        begin
          Temp   := Copy(Value, (Loop * 16) + 1, 16);
          StrSQL := StrSQL + 'CH' + FormatFloat('00', Loop) + '=' + QuotedStr(Temp) + ', ';
        end;

        StrSQL := StrSQL + 'UP_DATE = GETDATE() Where Idx=' + IntToStr(Idx);
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end;
      Close;
    end;

  except on E: Exception do
    begin
      LogWrite('.\log\ErrorDB.log','Uf_TableWirte_CVCR'+ '['+ E.Message + ']'+'['+strSQL +']');
    end;
  end;
end;

//==============================================================================
//
//==============================================================================
function Uf_TableWirte_CVCW(Idx: Integer; Value: AnsiString):Boolean;
var
  Loop   : Integer;
  strSQL : String;
  Temp   : String;
begin
  Result := False;

  try
    with Dm_MainLib.qryTemp do
    begin
      Close;
      StrSQL := ' SELECT * FROM TC_CVCW WITH(NOLOCK) WHERE IDX = ' + IntToStr(Idx);
      SQL.Text := StrSQL;
      Open;

      // ���̺� ���� ���� ���
      if (isEmpty) then
      begin
        Close;
        StrSQL := ' INSERT INTO TC_CVCW (IDX, CH00, CR_DATE, UP_DATE) ' +
                  '         VALUES (' + QuotedStr(IntToStr(Idx)) + ', ' +
                                        QuotedStr(Value) + ', GETDATE(), GETDATE() )';
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end
      // ���̺� ���� �ִ� ���
      else
      begin
        Close;
        StrSQL := ' UPDATE TC_CVCW ' +
                  '    SET CH00 = ' + QuotedStr(Value) +
                  '      , UP_DATE = GETDATE() ' +
                  '  WHERE Idx = ' + QuotedStr(IntToStr(Idx));
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end;
      Close;
    end;
  except
    on E:Exception do
    begin
      LogWrite('.\log\ErrorDB.log','Uf_TableWirte_CVCW'+ '['+ E.Message + ']'+'['+strSQL +']');
    end;
  end;
end;

//==============================================================================
//
//==============================================================================
function Uf_TableWirte_SCCW(Idx: Integer; Value:String):Boolean;
var
  Loop :Integer;
  strSQL : String;
  Temp:String;
begin
  Result:=False;

  try
    with Dm_MainLib.qryTemp do
    begin
      Close;
      StrSQL := ' SELECT * FROM TC_SCCW WITH(NOLOCK) WHERE IDX = ' + IntToStr(Idx);
      SQL.Text := StrSQL;
      Open;

      // ���̺� ���� ���� ���
      if (isEmpty) then
      begin
        Close;
        StrSQL := 'INSERT INTO TC_SCCW(IDX, ';

        // ä�� 00 01 02 ��� (3 word)
        for Loop := 0 to 2 do
        begin
          StrSQL := StrSQL + 'CH' + FormatFloat('00', Loop) + ', ';
        end;

        // ������ CR_DATE�ְ�  ��ȣ ����
        StrSQL := StrSQL + 'CR_DATE, UP_DATE)';

        // Values ��
        StrSQL := StrSQL + 'VALUES (' + QuotedStr(IntToStr(Idx)) + ', ';

        // Bit ä��
        StrSQL := StrSQL + QuotedStr(Copy(Value, 1, 16)) + ',';

        // Word ä��
        StrSQL := StrSQL + QuotedStr(Copy(Value, 17, 4)) + ',';
        StrSQL := StrSQL + QuotedStr(Copy(Value, 21, 4)) + ',';

        // ������ CR_DATE�� �ְ� ��ȣ ����
        StrSQL := StrSQL + 'GETDATE(), GETDATE() )';
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result:=True;
        end;
      end
      // ���̺� ���� �ִ� ���
      else
      begin
        Close;
        StrSQL := 'UPDATE TC_SCCW SET ';
        // Bit ä��
        StrSQL := StrSQL + 'CH00 = ' + QuotedStr(Copy(Value, 1, 16)) + ',';

        // Word ä��
        StrSQL := StrSQL + 'CH01 = ' + QuotedSTr(Copy(Value, 17, 4)) + ',';
        StrSQL := StrSQL + 'CH02 = ' + QuotedSTr(Copy(Value, 21, 4)) + ',';
        StrSQL := StrSQL + 'UP_DATE = GETDATE() Where Idx=' + IntToStr(Idx);
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end;
      Close;
    end;

  except on E: Exception do
    begin
      LogWrite('.\log\ErrorDB.log','Uf_TableWirte_SCCR'+ '['+ E.Message + ']'+'['+strSQL +']');
    end;
  end;
end;

//==============================================================================
//
//==============================================================================
function Uf_TableWirte_SCCR(Idx: Integer; Value:String):Boolean;
var
  Loop      : Integer;
  StrSQL    : string;
  Temp      : string;
begin
  Result:=False;

  try
    with Dm_MainLib.qryTemp do
    begin
      Close;
      StrSQL := ' SELECT * FROM TC_SCCR WITH(NOLOCK) WHERE IDX = ' + IntToStr(Idx);
      SQL.Text := StrSQL;
      Open;

      // ���̺� ���� ���� ���
      if (isEmpty) then
      begin
        Close;
        StrSQL := 'INSERT INTO TC_SCCR(IDX, ';

        // ä�� 00 01 02 ��� (3 word)
        for Loop := 0 to 2 do
        begin
          StrSQL := StrSQL + 'CH' + FormatFloat('00', Loop) + ', ';
        end;

        // ������ CR_DATE�ְ�  ��ȣ ����
        StrSQL := StrSQL + 'CR_DATE, UP_DATE)';

        // Values ��
        StrSQL := StrSQL + 'VALUES (' + QuotedStr(IntToStr(Idx)) + ', ';

        // Bit ä��
        StrSQL := StrSQL + QuotedStr(Copy(Value, 1, 16)) + ',';

        // Word ä��
        StrSQL := StrSQL + QuotedStr(Copy(Value, 17, 4)) + ',';
        StrSQL := StrSQL + QuotedStr(Copy(Value, 21, 4)) + ',';

        // ������ CR_DATE�� �ְ� ��ȣ ����
        StrSQL := StrSQL + 'GETDATE(), GETDATE() )';
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result:=True;
        end;
      end
      // ���̺� ���� �ִ� ���
      else
      begin
        Close;
        StrSQL := 'UPDATE TC_SCCR SET ';
        // Bit ä��
        StrSQL := StrSQL + 'CH00 = ' + QuotedStr(Copy(Value, 1, 16)) + ',';

        // Word ä��
        StrSQL := StrSQL + 'CH01 = ' + QuotedSTr(Copy(Value, 17, 4)) + ',';
        StrSQL := StrSQL + 'CH02 = ' + QuotedSTr(Copy(Value, 21, 4)) + ',';
        StrSQL := StrSQL + 'UP_DATE = GETDATE() Where Idx=' + IntToStr(Idx);
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end;
      Close;
    end;

  except on E: Exception do
    begin
      LogWrite('.\log\ErrorDB.log','Uf_TableWirte_SCCR'+ '['+ E.Message + ']'+'['+strSQL +']');
    end;
  end;
end;

//==============================================================================
//
//==============================================================================
function Uf_SetSCRWrite:Boolean;
var Str:String;
begin
  Result:=False;
//  Str:=GetScToPc();
//  if Uf_TableWirte_SCCR(Str) then //Hex 28byte
//  begin
//    Result:=True;
//  end;
end;

//==============================================================================
//
//==============================================================================
function Uf_GetSCRRead:Boolean;
var Loop :Integer;
    strSQL, Temp,Temp1,Temp2:String;
begin
  Result:=False;
//  with Dm_MainLib.qrytemp do
//  begin
//    try
//      strSQL   := 'SELECT * FROM TC_SCCR_MOLD WHERE Idx=1';
//      Close;
//      SQL.Text := strSQL;
//      open;
//
//      if RecordCount>0 then
//      begin
//        for Loop:=0 to cMaxSCC-1 do
//        begin
//          Temp:=FieldByName('CH'+FormatFloat('00',Loop)).AsString;
//          Temp1:=StrHexToStrBin(Copy(Temp,1,4));
//          Temp2:=Copy(Temp,5,8);
//          StrMove(@gSCCR.SC[Loop+1],PChar(Temp1+Temp2),24);
//        end;
//      end;
//      Result:=True;
//      gUf_GetSCRRead := False;
//    Except
//      on E: Exception do
//      BEGIN
//        Dm_MainLib.MainDatabase.Connected := False;
//        if gUf_GetSCRRead = False then
//        begin
//            LogWrite('.\log\ErrorDB.log','Uf_GetSCRRead'+ '['+ E.Message + ']'+'['+strSQL +']');
//            gUf_GetSCRRead := True;
//        end;
//      End ;
//    End;
//  end;
end;

//==============================================================================
// Uf_SCDBMove : IO: �԰�, ���
//==============================================================================
procedure Uf_SCDataMove(Device: Integer; IO: String);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  try
    with Dm_MainLib.qrySCDataMove do
    begin
      Close;

      if (IO = '�԰�') then
      begin
        Close;
        SQL.Clear;
        StrSQL := ' UPDATE TT_TRACK ' +
                  '    SET DATA = 1 ' +
                  '      , JOB_NO = A.JOB_NO ' +
                  '      , UPDATE_DT = GETDATE() ' +
                  '   FROM (SELECT DATA, JOB_NO ' +
                  '           FROM TT_TRACK WITH(NOLOCK) ' +
                  '          WHERE PLC_NO = ' + IntToStr(Device) +
                  '            AND BUFF_NO = 7) AS A ' +
                  '  WHERE PLC_NO = 1 ' +
                  '    AND BUFF_NO = 100 ' +
                  '    AND TYPE = ''SC'' ' ;
        SQL.Text := StrSQL;
        ExecSQL;

        Close;
        SQL.Clear;
        StrSQL := ' UPDATE TT_TRACK ' +
                  '    SET DATA = 0 ' +
                  '      , JOB_NO = '''' ' +
                  '      , UPDATE_DT = GETDATE() ' +
                  '  WHERE PLC_NO = ' + IntToStr(Device) +
                  '    AND BUFF_NO = 7 ' +
                  '    AND TYPE = ''CV'' ';
        SQL.Text := StrSQL;
        ExecSQL;
      end
      else if (IO = '���') then
      begin
        Close;
        SQL.Clear;
        StrSQL := ' UPDATE TT_TRACK ' +
                  '    SET DATA = 1 ' +
                  '      , JOB_NO = A.JOB_NO ' +
                  '      , UPDATE_DT = GETDATE() ' +
                  '   FROM (SELECT DATA, JOB_NO ' +
                  '           FROM TT_TRACK WITH(NOLOCK) ' +
                  '          WHERE PLC_NO = 1 ' +
                  '            AND BUFF_NO = 100 ' +
                  '            AND TYPE = ''SC'') AS A ' +
                  '  WHERE PLC_NO = ' + IntToStr(Device) +
                  '    AND BUFF_NO = 1 ' +
                  '    AND TYPE = ''CV'' ' ;
        SQL.Text := StrSQL;
        ExecSQL;

        Close;
        SQL.Clear;
        StrSQL := ' UPDATE TT_TRACK ' +
                  '    SET DATA = 0 ' +
                  '      , JOB_NO = '''' ' +
                  '      , UPDATE_DT = GETDATE() ' +
                  '  WHERE PLC_NO = 1' +
                  '    AND BUFF_NO = 100' +
                  '    AND TYPE = ''SC'' ';
        SQL.Text := StrSQL;
        ExecSQL;
      end;
      Close;
    end;
  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_SCDataMove', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_SCDataMove' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// Uf_SC_WriteDataSet
//==============================================================================
procedure Uf_SC_WriteDataSet(Device, Job_No: Integer; IO: String);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
  iBank, iBay, iLevel : Integer;
  hBay, hLevel : AnsiString;
begin
  try
    with Dm_MainLib.qrySCOrderSet do
    begin
      Close;

      if (IO = '�԰�') then
      begin
        StrSQL := ' SELECT DST_BANK, DST_BAY, DST_LEVEL ' +
                  '   FROM TT_ORDER WITH(NOLOCK) ' +
                  '  WHERE JOB_NO = ' + QuotedStr(IntToStr(Job_No));
        SQL.Text := StrSQL;
        Open;

        // ������ Out
        if (isEmpty) then Exit;

        gSCCW.SC[1].Storage_In    := '1';
        gSCCW.SC[1].Storage_Out   := '0';
        gSCCW.SC[1].Home_Return   := '0';
        gSCCW.SC[1].MachineAction := '1'; // �⵿�䱸

        gSCCW.SC[1].None1[0]      := '0';
        gSCCW.SC[1].None1[1]      := '0';

        iBank  := FieldByName('DST_BANK').AsInteger;
        if ((iBank mod 2) = 1) then
        begin
          gSCCW.SC[1].Odd_Bay  := '1'; // Ȧ����
          gSCCW.SC[1].Even_Bay := '0'; // ¦����
        end
        else
        begin
          gSCCW.SC[1].Odd_Bay  := '0';
          gSCCW.SC[1].Even_Bay := '1';
        end;

        // PLC 1�� : ����, PLC 2�� �ĸ�
        if (Device = 1) then
        begin
          gSCCW.SC[1].Station := '1';
        end
        else if (Device = 2) then
        begin
          gSCCW.SC[1].Station := '0';
        end;

        gSCCW.SC[1].None2[0] := '0';
        gSCCW.SC[1].None2[1] := '0';
        gSCCW.SC[1].None2[2] := '0';
        gSCCW.SC[1].None2[3] := '0';
        gSCCW.SC[1].None2[4] := '0';
        gSCCW.SC[1].None2[5] := '0';
        gSCCW.SC[1].None2[6] := '0';

        iBay   := FieldByName('DST_BAY').AsInteger;
        hBay   := IntToHex(iBay, 2); // 35 -> 23  // Dec�ϰ�쿡�� FormatFloat('00', iBay);
        iLevel := FieldByName('DST_LEVEL').AsInteger;
        hLevel := IntToHex(iLevel, 2);            // Dec�ϰ�쿡�� FormatFloat('00', iLevel);
        StrMove(@gSCCW.SC[1].Bay,   PChar(hBay), 2);
        StrMove(@gSCCW.SC[1].Level, PChar(hLevel), 2);

      end
      else if (IO = '���') then
      begin
        StrSQL := ' SELECT SRC_BANK, SRC_BAY, SRC_LEVEL ' +
                  '   FROM TT_ORDER WITH(NOLOCK) ' +
                  '  WHERE JOB_NO = ' + QuotedStr(IntToStr(Job_No));
        SQL.Text := StrSQL;
        Open;

        // ������ Out
        if (isEmpty) then Exit;

        gSCCW.SC[1].Storage_In    := '0';
        gSCCW.SC[1].Storage_Out   := '1';
        gSCCW.SC[1].Home_Return   := '0';
        gSCCW.SC[1].MachineAction := '1'; // �⵿�䱸

        gSCCW.SC[1].None1[0]      := '0';
        gSCCW.SC[1].None1[1]      := '0';

        iBank  := FieldByName('SRC_BANK').AsInteger;
        if ((iBank mod 2) = 1) then
        begin
          gSCCW.SC[1].Odd_Bay  := '1'; // Ȧ����
          gSCCW.SC[1].Even_Bay := '0'; // ¦����
        end
        else
        begin
          gSCCW.SC[1].Odd_Bay  := '0';
          gSCCW.SC[1].Even_Bay := '1';
        end;

        // PLC 1�� : ����, PLC 2�� �ĸ�
        if (Device = 1) then
        begin
          gSCCW.SC[1].Station := '1';
        end
        else if (Device = 2) then
        begin
          gSCCW.SC[1].Station := '0';
        end;

        gSCCW.SC[1].None2[0] := '0';
        gSCCW.SC[1].None2[1] := '0';
        gSCCW.SC[1].None2[2] := '0';
        gSCCW.SC[1].None2[3] := '0';
        gSCCW.SC[1].None2[4] := '0';
        gSCCW.SC[1].None2[5] := '0';
        gSCCW.SC[1].None2[6] := '0';

        iBay   := FieldByName('SRC_BAY').AsInteger;
        iLevel := FieldByName('SRC_LEVEL').AsInteger;
        hBay   := IntToHex(iBay, 2);
        hLevel := IntToHex(iLevel, 2);
        StrMove(@gSCCW.SC[1].Bay,   PChar(hBay), 2);
        StrMove(@gSCCW.SC[1].Level, PChar(hLevel), 2);
      end;
      Close;
    end;
  except
    on E: Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_SC_WriteDataSet', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_SC_WriteDataSet' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;

  end;

end;

//==============================================================================
// Uf_GetCurrent : TC_CURRENT ���̺� �� get
//==============================================================================
function Uf_GetCurrent(Key, Field: String): String;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  Result := '';
  try

    with Dm_MainLib.qryCurrentGet do
    begin
      Close;
      StrSQL := ' SELECT ' + Field +
                '   FROM TC_CURRENT WITH(NOLOCK)' +
                '  WHERE CURRENT_NAME = ' + QuotedStr(Key);
      SQL.Text := StrSQL;
      Open;
      if (isEmpty) then Result := ''
      else Result := FieldByName(Field).AsString;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetCurrent', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetCurrent' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;

end;

//==============================================================================
// Uf_SetCurrent : TC_CURRENT ���̺� ������Ʈ
//==============================================================================
procedure Uf_SetCurrent(Key, Field, Value: String);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin

  try

    with Dm_MainLib.qryCurrentSet do
    begin
      Close;
      StrSQL := ' UPDATE TC_CURRENT ' +
                '    SET ' + Field + ' = ' + QuotedStr(Value) +
                '      , UP_DT = CONVERT([varchar](max),getdate(),(21)) ' +
                '  WHERE CURRENT_NAME = ' + QuotedStr(Key);
      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_SetCurrent', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_SetCurrent' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;

end;

//==============================================================================
// Uf_GetSCWRead : TC_SCCW�� �� ������ �о�� ���ۿ� ����
//==============================================================================
function Uf_GetSCWRead:Boolean;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
  Temp : AnsiString;
  hTemp : AnsiString;
begin
  Result := False;

  try

    with Dm_MainLib.qryTemp do
    begin
      Close;
      StrSQL := ' SELECT * FROM TC_SCCW WITH(NOLOCK) WHERE IDX = 1';
      SQL.Text := StrSQL;
      Open;

      if (isEmpty) then
      begin
        Result := False;
        Exit;
      end;

      Temp := FieldByName('CH00').AsString;
      hTemp := Copy(Temp, 1, 4);
      hTemp := HexStrToBinStr(hTemp);
      StrMove(@gSCCW.SC[1], PChar(hTemp), 16);
      hTemp := Copy(Temp, 5, 2);
      StrMove(@gSCCW.SC[1].Bay, PChar(hTemp), 2);
      hTemp := Copy(Temp, 7, 2);
      StrMove(@gSCCW.SC[1].Level, PChar(hTemp), 2);
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetSCWRead', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetSCWRead' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// Uf_GetComset : TC_COMSET ���̺� �� ������
//==============================================================================
function  Uf_GetComset(Key, Field: String):String;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  try

    with Dm_MainLib.qryComset do
    begin
      Close;
      StrSQL := ' SELECT TOP 1 ' + Field +
                '   FROM TC_COMSET WITH(NOLOCK) ' +
                '  WHERE ID_NAME LIKE ' + QuotedStr('%' + Key + '%');
      SQL.Text := StrSQL;
      Open;

      if (isEmpty) then Result := ''
      else Result := FieldByName(Field).AsString;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetCommset', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetCommset' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// Uf_GetOrderPLCNo : IO: �԰�, ���. Status:CV���, SC���. Return PLC_NO
//==============================================================================
function  Uf_GetOrderPLCNo(IO, Status: String): Integer;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  Result := 0;

  if (IO = '') or (Status = '') then Exit;

  try
    with Dm_MainLib.qryOrderGet do
    begin
      Close;
      // �԰����� Ž��
      if (IO = '�԰�') then
      begin
        StrSQL := 'SELECT TOP 1 PLC_NO ' +
                  '  FROM TT_ORDER WITH(NOLOCK)' +
                  ' WHERE ORD_IO = ''�԰�'' ' +
                  '   AND STATUS = ' + QuotedStr(Status) +
                  ' ORDER BY CONVERT(INT, ORD_SEQ), ORD_DT ';
      end
      // ������� Ž��
      else if (IO = '���') then
      begin
        StrSQL := 'SELECT TOP 1 PLC_NO ' +
                  '  FROM TT_ORDER WITH(NOLOCK)' +
                  ' WHERE ORD_IO = ''���'' ' +
                  '   AND STATUS = ' + QuotedStr(Status) +
                  ' ORDER BY ORD_EMG DESC, CONVERT(INT, ORD_SEQ), ORD_DT ';
      end;
      SQL.Text := StrSQL;
      Open;

      // ���ð� ������ ������ PLC_NO ����, ������ -1
      if (isEmpty) then Result := -1
      else Result := FieldByName('PLC_NO').AsInteger;
      Close;
    end;
  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetOrderPLCNo', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetOrderPLCNo' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// Uf_GetOrderCount : IO: '�԰�', '���'. ORD_TYPE: '�ķ�Ʈ ���' ��
//==============================================================================
function Uf_GetOrderCount(WhereStr: String) : Integer;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  if (WhereStr = '') then Exit;

  try
    with Dm_MainLib.qryErrorMsgGet do
    begin
      Close;
      StrSQL := ' SELECT COUNT(*) as CNT ' +
                '   FROM TT_ORDER WITH(NOLOCK) ' +
                '  WHERE 1=1 ' + WhereStr;
      SQL.Text := StrSQL;
      Open;

      // ������ ��ĭ ����
      if (isEmpty) then Result := -1
      else Result := FieldByName('CNT').AsInteger;
      Close;
    end;
  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetOrderCount', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetOrderCount' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;


//==============================================================================
// Uf_GetErrorMsg : Mach: SC, CV. Code: ErrorCode. Return ErrorMsg
//==============================================================================
function Uf_GetErrorMsg(Mach, Code: String): String;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  if (Mach = '') then Exit;
  Result := '';

  try
    with Dm_MainLib.qryErrorMsgGet do
    begin
      Close;
      StrSQL := ' SELECT ERR_NAME ' +
                '   FROM TM_ERROR WITH(NOLOCK) ' +
                '  WHERE MACH_ID = ' + QuotedStr(Mach) +
                '    AND ERR_CODE = ' + QuotedStr(Code);
      SQL.Text := StrSQL;
      Open;

      // ������ ��ĭ ����
      if (isEmpty) then Result := ''
      else Result := FieldByName('ERR_NAME').AsString;
      Close;
    end;
  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetErrorMsg', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetErrorMsg' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;

end;

//==============================================================================
// Uf_GetOrderJobNo : Device: PLC ��ȣ 1,2. IO: �԰�, ���. Status:CV���, SC���. Return PLC_NO
//==============================================================================
function Uf_GetOrderJobNo(Device: Integer; IO, Status: String ): Integer;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  if (not (Device in [1..2])) then Exit;

  Result := -1;

  try
    with Dm_MainLib.qryOrderGet do
    begin
      Close;
      // �԰����� Ž��
      if (IO = '�԰�') then
      begin
        StrSQL := 'SELECT TOP 1 JOB_NO ' +
                  '  FROM TT_ORDER WITH(NOLOCK) ' +
                  ' WHERE PLC_NO = ' + QuotedStr(IntToStr(Device)) +
                  '   AND ORD_IO = ''�԰�'' ' +
                  '   AND STATUS = ' + QuotedStr(Status) +
                  ' ORDER BY ORD_SEQ, ORD_DT ';
      end
      // ������� Ž��
      else if (IO = '���') then
      begin
        StrSQL := 'SELECT TOP 1 JOB_NO ' +
                  '  FROM TT_ORDER WITH(NOLOCK)' +
                  ' WHERE PLC_NO = ' + QuotedStr(IntToStr(Device)) +
                  '   AND ORD_IO = ''���'' ' +
                  '   AND STATUS = ' + QuotedStr(Status) +
                  ' ORDER BY ORD_EMG DESC, ORD_SEQ, ORD_DT ';
      end;
      SQL.Text := StrSQL;
      Open;

      // ���ð� ������ ������ JOB_NO ����, ������ -1
      if (isEmpty) then Result := -1
      else Result := FieldByName('JOB_NO').AsInteger;
      Close;
    end;
  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetOrderJobNo', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetOrderJobNo' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// Uf_GetOrderJobNo : Device: PLC ��ȣ 1,2. WhreStr: Ž������: ex)'STATUS = ''CV���'' '
//==============================================================================
function Uf_GetOrderJobNo(Device: Integer; WhereStr: String): Integer;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin

  if (WhereStr = '') then Exit;

  try
    with Dm_MainLib.qryOrderGet do
    begin
      Close;
      StrSQL := ' SELECT JOB_NO ' +
                '   FROM TT_ORDER WITH(NOLOCK) ' +
                '  WHERE 1 = 1' +
                '    AND PLC_NO = ' + QuotedStr(IntToStr(Device)) + WhereStr;
      SQL.Text := StrSQL;
      Open;

      if (isEmpty) then Result := -1
      else Result := FieldByName('JOB_NO').AsInteger;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetOrderJobNo', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetOrderJobNo' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;

  end;
end;

//==============================================================================
// Uf_GetOrderJobNo : Device: PLC ��ȣ 1,2. WhreStr: Ž������: ex)'STATUS = ''CV���'' '
//==============================================================================
function Uf_GetOrderJobNo(WhereStr: String): Integer;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin

  if (WhereStr = '') then Exit;

  try
    with Dm_MainLib.qryOrderGet do
    begin
      Close;
      StrSQL := ' SELECT JOB_NO ' +
                '   FROM TT_ORDER WITH(NOLOCK) ' +
                '  WHERE 1 = 1' + WhereStr;
      SQL.Text := StrSQL;
      Open;

      if (isEmpty) then Result := -1
      else Result := FieldByName('JOB_NO').AsInteger;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetOrderJobNo', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetOrderJobNo' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;

  end;
end;

//==============================================================================
// Uf_GetOrder
//==============================================================================
function  Uf_GetOrder(Job_No, Field: String): String;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin

  try
    with Dm_MainLib.qryOrderGet do
    begin
      Close;
      StrSQL := ' SELECT ' + Field +
                '   FROM TT_ORDER WITH(NOLOCK) ' +
                '  WHERE JOB_NO = ' + QuotedStr(Job_No);
      SQL.Text := StrSQL;
      Open;

      if (isEmpty) then Result := ''
      else Result := FieldByName(Field).AsString;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetOrder', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetOrder' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;


//==============================================================================
// Uf_SetOrder
//==============================================================================
procedure Uf_SetOrder(Job_No, Field, Value: String);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  try
    with Dm_MainLib.qryOrderSet do
    begin
      Close;
      if (Field = 'OT_DATE') or (Field = 'IN_DATE') then
      begin
        StrSQL := ' UPDATE TT_ORDER ' +
                  '    SET ' + Field + ' = CONVERT([varchar](max),getdate(),(21)) ' +
                  '      , UP_DT = CONVERT([varchar](max),getdate(),(21)) ' +
                  '  WHERE JOB_NO = ' + QuotedStr(Job_No);
      end
      else
      begin
        StrSQL := ' UPDATE TT_ORDER ' +
                  '    SET ' + Field + ' = ' + QuotedStr(Value) +
                  '      , UP_DT = CONVERT([varchar](max),getdate(),(21)) ' +
                  '  WHERE JOB_NO = ' + QuotedStr(Job_No);
      end;

      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_SetOrder', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_SetOrder' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;

  end;
end;

//==============================================================================
// Uf_DeleteOrder : TT_ORDER ������ ����
//==============================================================================
procedure Uf_DeleteOrder(Job_No : String);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  try
    with Dm_MainLib.qryOrderSet do
    begin
      Close;
      StrSQL := ' DELETE FROM TT_ORDER ' +
                '  WHERE JOB_NO = ' + QuotedStr(Job_No);
      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_SetOrder', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_SetOrder' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;

  end;
end;

//==============================================================================
// Uf_ReIn_OrderCrate : Job_No ���԰� ������ �۾���ȣ
//==============================================================================
function Uf_ReIn_OrderCreate(Job_No: String): Boolean;
var
  FileName : String;
  Msg : String;
  O_VRETCD, O_VRETMSG: String;
  Param : String;
begin
  Param := 'I_JOB_NO :' + Job_No;
  try
    with Dm_MainLib.PD_RE_INPUT do
    begin
      Close;
      ProcedureName := 'PD_RE_INPUT';
      Parameters.ParamByName('@I_JOB_NO').Value := Job_No;
      Parameters.ParamByName('@O_VRETCD').Direction := pdOutput;
      ExecProc;
      O_VRETCD  := VarToStr(Parameters.ParamByName('@O_VRETCD' ).Value);
      Close;

      if (Copy(O_VRETCD, 1, 2) = 'NG') then
      begin
        InsertPGMHist('RCP', 'E', 'Uf_ReIn_OrderCreate', '', '', 'SP', 'PD_RE_INPUT', Param, O_VRETCD);
        Result := False;
      end
      else
      begin
        InsertPGMHist('RCP', 'N', 'Uf_ReIn_OrderCreate', '', '', 'SP', 'PD_RE_INPUT', Param, O_VRETCD);
        Result := True;
      end;
      Close;
    end;
  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_ReIn_OrderCrate', '', 'Exception Error', 'SP', 'PD_INS_EPLT_ORDER', Param, E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_ReIn_OrderCrate' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// Uf_UpdateOrdSeq : TT_ORDER�� ORD_SEQ_SEL�� �ϳ� ���õǵ��� ������Ʈ ���ִ� ���ν��� ȣ��
//==============================================================================
procedure Uf_UpdateOrdSeq();
var
  FileName : String;
  Msg : String;
  O_VRETCD, O_VRETMSG: String;
  Param : String;
begin
  Param := '';
  try
    with Dm_MainLib.PD_UDT_ORD_SEQ do
    begin
      Close;
      ProcedureName := 'PD_UDT_ORD_SEQ';
      ExecProc;
      Close;
    end;
  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_UpdateOrdSeq', '', 'Exception Error', 'SP', 'PD_UDT_ORD_SEQ', Param, E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_UpdateOrdSeq' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// Uf_SetRack : Loc: ��ġ. Field:������Ʈ�� �ʵ�. Value: ��
//==============================================================================
function  Uf_GetRack(Loc, Field: String): String;
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin

  try
    with Dm_MainLib.qryRackGet do
    begin
      Close;
      StrSQL := ' SELECT ' + Field +
                '   FROM TT_RACK WITH(NOLOCK) ' +
                '  WHERE RACK_LOC = ' + QuotedStr(Loc);
      SQL.Text := StrSQL;
      Open;

      if (isEmpty) then Result := ''
      else Result := FieldByName(Field).AsString;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_GetRack', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_GetRack' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// Uf_SetRack : Loc: ��ġ. Field:������Ʈ�� �ʵ�. Value: ��
//==============================================================================
procedure Uf_SetRack(Loc, Field, Value:String);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  try
    with Dm_MainLib.qryRackSet do
    begin
      Close;
      StrSQL := ' UPDATE TT_RACK ' +
                '    SET ' + Field + ' = ' + QuotedStr(Value) +
                '      , UP_DT = CONVERT([varchar](max),getdate(),(21)) ' +
                '  WHERE RACK_LOC = ' + QuotedStr(Loc);

      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_SetRack', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_SetRack' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;

  end;
end;


//==============================================================================
// Uf_SetRackStock : Loc: ��ġ. Field:������Ʈ�� �ʵ�. Value: ��
//==============================================================================
procedure Uf_SetRackStock(Loc, Field, Value: String);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  try
    with Dm_MainLib.qryRackSet do
    begin
      Close;
      StrSQL := ' UPDATE TT_RACK_STOCK ' +
                '    SET ' + Field + ' = ' + QuotedStr(Value) +
                '      , UP_DT = CONVERT([varchar](max),getdate(),(21)) ' +
                '  WHERE RACK_LOC = ' + QuotedStr(Loc);

      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_SetRackStock', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_SetRackStock' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;

  end;
end;

//==============================================================================
// Uf_SetIntStatus : Device : PLC_NO
//==============================================================================
procedure Uf_SetIntStatus(Device: Integer);
var
  FileName : String;
  Msg : String;
  StrSQL : String;
begin
  try
    with Dm_MainLib.qryRackSet do
    begin
      Close;
      StrSQL := ' UPDATE TC_INT_STATUS ' +
                '    SET INT_DATE = GETDATE() ' +
                '  WHERE INT_NAME = ''MFC'' '+
                '    AND INT_M_NO = ''' + IntToStr(Device) + ''' ';

      SQL.Text := StrSQL;
      ExecSQL;
      Close;
    end;

  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'Uf_SetIntStatus', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'Uf_SetIntStatus' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;

  end;
end;


//==============================================================================
// Uf_TC_SCCW_Update
//==============================================================================
function Uf_TC_SCCW_Update(Hogi:Integer;Msg:String):Boolean;
var
  strSQL :String;
begin
  Result:=False;
  with Dm_MainLib.qrytemp do
  begin
    try
      strSQL:='Update TC_SCCW_MOLD '+
              'Set CH'+FormatFloat('00',(Hogi-1))+'='+QuotedStr(Msg)+' '+
              'Where IDX=1';
      Close;
      SQL.Text := strSQL ;
      if (ExecSQL > 0) then
      begin
        Result:=True;
      end;
      Close;
    Except
      on E: Exception do
      BEGIN
        LogWrite('.\log\ErrorDB.log','Uf_TC_SCCW_Update'+ '['+ E.Message + ']'+'['+strSQL +']');
      End ;
    End;
  end;
end;


procedure TDm_MainLib.MainDatabaseAfterConnect(Sender: TObject);
begin
//    frmMain.TimerConnectDB.Enabled := False;
//    frmMain.cbControl.Checked := True;

//    frmControl.LogWriteProcess( 'ERROR', 'MainDatabase After Connect !');
end;

procedure TDm_MainLib.MainDatabaseAfterDisconnect(Sender: TObject);
begin
//    frmMain.TimerConnectDB.Enabled := True;
//    frmControl.LogWriteProcess( 'ERROR', 'MainDatabase AfterDisconnect !');
end;

//==============================================================================
// InsertPGMHist ( W_PROGRAM_HIST ���̺� �̷��� ����)
//==============================================================================
procedure InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
var
  FileName : String;
  Msg : String;
begin
  try
    with Dm_MainLib.PD_INS_PGM_HIST do
    begin
      Close;
      ProcedureName := 'PD_INS_PGM_HIST';
      Parameters.ParamByName('i_MENU_ID'     ).Value := MENU_ID;
      Parameters.ParamByName('i_HIST_TYPE'   ).Value := HIST_TYPE;
      Parameters.ParamByName('i_PGM_FUNCTION').Value := FUNC_NAME;
      Parameters.ParamByName('i_EVENT_NAME'  ).Value := EVENT_NAME;
      Parameters.ParamByName('i_EVENT_DESC'  ).Value := EVENT_DESC;
      Parameters.ParamByName('i_COMMAND_TYPE').Value := COMMAND_TYPE;
      Parameters.ParamByName('i_COMMAND_TEXT').Value := COMMAND_TEXT;
      Parameters.ParamByName('i_PARAM'       ).Value := PARAM;
      Parameters.ParamByName('i_ERROR_MSG'   ).Value := ERROR_MSG;
      Parameters.ParamByName('i_USER_ID'     ).Value := Dm_MainLib.M_Info.UserCode + ' ['+Dm_MainLib.M_Info.ActivePCAddr+']';
      ExecProc;
      Close;
    end;
  except
    on E : Exception do
    begin
      Dm_MainLib.PD_INS_PGM_HIST.Close;
      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now());
      Msg := Msg + 'InsertPGMHist' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// InsertEPLT_ORDER : ���ȷ�Ʈ��� ����. Return : O_VRETCD- 0����, �� �� ����
//==============================================================================
function InsertEPLT_ORDER(I_WMS_NO, I_ITEM_CODE, I_PLC_NO, I_QTY: String): String;
var
  FileName : String;
  Msg : String;
  O_VRETCD, O_VRETMSG: String;
  Param : String;
begin
  Result := '';
  Param := 'I_WMS_NO :'    + I_WMS_NO    + '|' +
           'I_ITEM_CODE :' + I_ITEM_CODE + '|' +
           'I_PLC_NO :'	   + I_PLC_NO    + '|' +
           'I_QTY :'		   + I_QTY;
  try
    with Dm_MainLib.PD_INS_EPLT_ORDER do
    begin
      Close;
      ProcedureName := 'PD_INS_EPLT_ORDER';
      Parameters.ParamByName('I_WMS_NO'   ).Value := I_WMS_NO;
      Parameters.ParamByName('I_ITEM_CODE').Value := I_ITEM_CODE;
      Parameters.ParamByName('I_PLC_NO'   ).Value := I_PLC_NO;
      Parameters.ParamByName('I_QTY'      ).Value := I_QTY;
      Parameters.ParamByName('O_VRETCD'   ).Direction := pdOutput;
      Parameters.ParamByName('O_VRETMSG'  ).Direction := pdOutput;
      ExecProc;
      O_VRETCD  := VarToStr(Parameters.ParamByName('O_VRETCD' ).Value);
      O_VRETMSG := VarToStr(Parameters.ParamByName('O_VRETMSG').Value);
      Close;

      Result := O_VRETCD + '-' + O_VRETMSG;
      if (O_VRETCD <> '0') then
      begin
        InsertPGMHist('RCP', 'E', 'InsertEPLT_ORDER', '', '', 'SP', 'PD_INS_EPLT_ORDER', Param, Result);
      end
      else
      begin
        InsertPGMHist('RCP', 'N', 'InsertEPLT_ORDER', '', '', 'SP', 'PD_INS_EPLT_ORDER', Param, '');
      end;
      Close;
    end;
  except
    on E:Exception do
    begin
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'InsertEPLT_ORDER', '', 'Exception Error', 'SP', 'PD_IN_EPLT_ORDER', Param, E.Message);

      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'InsertEPLT_ORDER' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;


//==============================================================================
// GetEmptyRack ( �� ã�� )                                                 //
//==============================================================================
function GetEmptyRack(tTYPE, PLC_NO, SC: String): String;
var
  ParamStr : String;
  FileName : String;
  Msg : String;
  O_VRETCD, O_VRETMSG: String;
  Param : String;
begin
  try
    ParamStr := 'TYPE:'   + tTYPE  + '|' +
                'PLC_NO:' + PLC_NO + '|' +
                'SC:'     + SC     + '|' ;

    with Dm_MainLib.SP_CELL_FIND do
    begin
      Close;
      Parameters.ParamByName('@I_TYPE'  ).Value := tTYPE;
      Parameters.ParamByName('@I_PLC_NO').Value := PLC_NO;
      Parameters.ParamByName('@I_SC'    ).Value := SC;
      Parameters.ParamByName('@O_RACK_LOC').Direction := pdOutput;
      ExecProc;
      Result := Parameters.ParamValues['@O_RACK_LOC'];
      Close;
    end;
  except
    on E : Exception do
    begin
      Dm_MainLib.SP_CELL_FIND.Close;

    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'GetEmptyRack', '', 'Exception Error', 'SP', Dm_MainLib.SP_CELL_FIND.ProcedureName, ParamStr, E.Message);
      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'GetEmptyRack' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;



//==============================================================================
// ErrorWrite [�������]                                                      //
//==============================================================================
procedure ErrorWrite(ErrorCode, ErrorMach, JOB_NO, ORD_LOC: String);
var
  FileName : String;
  Msg : String;
  StrSQL : String ;
begin
  try
    with Dm_MainLib.qryError do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT ERR_CODE ' +
                '   FROM TM_ERROR WITH (NOLOCK) ' +
                '  WHERE WMS_NO  = ''D'' ' +
                '    AND MACH_ID = ''' + ErrorMach + ''' ' +
                '    AND ERR_CODE  = ''' + ErrorCode + ''' ';
      SQL.Text := StrSQL;
      Open;
      if not (eof and bof) then
      begin
        Close;
        SQL.Clear;
        StrSQL  := ' INSERT TT_ERROR ' +
                   ' SELECT ' +
                   '  ''D'' ' +                                // WMS_NO
                   ', ''' + ErrorMach + ''' ' +                // MACH_ID
                   ', ''' + ErrorCode + ''' ' +                // ERR_CODE
                   ', GETDATE() ' +                            // ERR_START
                   ', Null ' +                                 // ERR_END
                   ', ''' + JOB_NO + ''' ' +                   // ERR_JOB_NO
                   ', ''' + ORD_LOC + ''' ' +                  // ERR_LOC
                   ', '''' ' +                                 // ERR_MEMO
                   ', '''' ' +                                 // UP_DT
                   ', CONVERT(VARCHAR(MAX), GETDATE(), 21) ' + // CR_DT
                   '   FROM TM_ERROR WITH (NOLOCK) ' +
                   '  WHERE MACH_ID   = '''+ ErrorMach + ''' ' +
                   '    AND ERR_CODE  = ''' + ErrorCode + ''' ' ;
        SQL.Text := StrSQL ;
        ExecSQL;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      Dm_MainLib.qryError.Close;

    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'ErrorWrite', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'ErrorWrite' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;

//==============================================================================
// ErrorClear [��������]                                                      //
//==============================================================================
procedure ErrorClear(Mach, ErrorCode: String);
var
  FileName : String;
  Msg : String;
  StrSQL : String ;
begin
  try
    with Dm_MainLib.qryError do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_ERROR ' +
                '    SET ERR_END = GETDATE() ' +
                '      , UP_DT   = CONVERT(VARCHAR(MAX), GETDATE(), 21) ' +
                '  WHERE MACH_ID   = ''' + Mach + ''' ' +
                '    AND ERR_CODE  = ''' + ErrorCode   + ''' ' +
                '    AND ERR_START = ' +
                '       ( SELECT TOP 1 ERR_START ' +
                '           FROM TT_ERROR WITH (NOLOCK) ' +
                '          WHERE MACH_ID   = ''' + Mach + ''' ' +
                '            AND ERR_CODE  = ''' + ErrorCode   + ''' ' +
                '          ORDER BY ERR_START DESC) ' ;
      SQL.Text := StrSQL ;
      ExecSQL;
      Close;
    end;
  except
    on E : Exception do
    begin
      Dm_MainLib.qryError.Close;
    // �����̷� DB�� ���
    //InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
      InsertPGMHist('RCP', 'E', 'ErrorClear', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      FileName := 'Log\DB_Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
      Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>';
      Msg := Msg + 'ErrorClear' + '['+ E.Message + ']';
      LogWrite(FileName, Msg);
    end;
  end;
end;




end.
