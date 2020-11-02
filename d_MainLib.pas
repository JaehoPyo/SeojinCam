//==============================================================================
//  DB 핸들링에서 사용하는 Library Function
//==============================================================================
unit d_MainLib;

interface

uses
  SysUtils, Classes, DB, ADODB, inifiles, CPort, Graphics;

type
  TDm_MainLib = class(TDataModule)
    qryTemp: TADOQuery;
    MainDatabase: TADOConnection;
    ADOQuery1: TADOQuery;
    qryTrack: TADOQuery;
    PD_INS_PGM_HIST: TADOStoredProc;

    procedure MainDatabaseAfterConnect(Sender: TObject);
    procedure MainDatabaseAfterDisconnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm_MainLib: TDm_MainLib;

    function Uf_DBConnection: Boolean;
    function Uf_CommConnection: Boolean;

    procedure Uf_GetInitfile;
    procedure Uf_SetInitfile;

    function Uf_GetCVCRRead:Boolean;       //buttonCVCR_Read
    function Uf_GetCVCWRead:Boolean;       //buttonCVCW_Read

    function  Uf_TrackDataCheck(Device, Buff_No: Integer): Boolean;
    procedure Uf_TrackDBSave(Hogi_No, Buff_no: Integer);
    procedure Uf_TrackDBUpdate(Device, Buff_No: Integer);
    procedure Uf_TrackMemoryClear(Hogi_No, Buff_No: integer); // 안씀
    procedure Uf_TrackMemoryMove( Hogi_No, FromBuff_No, ToBuff_No: integer); // 안씀
    function  Uf_Read_TT_Track_Table:Boolean; // 안씀

    function Uf_TableWirte_CVCR(Idx: Integer; Value:AnsiString):Boolean;
    function Uf_TableWirte_CVCW(Idx: Integer; Value:AnsiString):Boolean;
    function Uf_TableWirte_SCCR(Idx: Integer; Value:String):Boolean;
    function Uf_TableWirte_SCCW(Idx: Integer; Value:String):Boolean;

    function Uf_TC_SCCW_Update(Hogi:Integer;Msg:String):Boolean;

    function Uf_GetSCRRead:Boolean;
    function Uf_SetSCRWrite:Boolean;
    function Uf_GetSCWRead:Boolean;

    function Uf_SC_Error_Write(Stock_No:Integer;Error_Code:String):Boolean;

Const
    CONN_STATUS_COLOR : Array [0..1] of TColor = ($008484FF, $0068FF68);

    STX = #2;
    ETX = #3;
    ENQ = #5;
    EOT = #4;
    ACK = #6;
//    NAK = #15;
    NAK = #21;
    cMaxSCC  = 1;
    INI_PATH  : String = './AwHouse.INI';

type

  TDbCon = record
    Ole     : String;
    Alias   : String;
    User    : String;
    Pass    : String;
    Catalog : String;
  end;
  //---------------------------------------------------------------------------
  // SCC Status 를 가지고 다니는 전역 변수 구조체
  //---------------------------------------------------------------------------
  TSCR_Base = Record
    Case Integer of
      1 : (All : Array [0..23] of AnsiChar);
      2 : (
           Manual_Mode        : AnsiChar;
           Auto_Mode          : AnsiChar;
           Home_Position      : AnsiChar;
           Home_Returning     : AnsiChar;
           Job_Standby        : AnsiChar;
           Reserve1           : AnsiChar;
           Blank_Out          : AnsiChar;
           Twin_In            : AnsiChar;
           Pallet_Exist       : AnsiChar;
           Rack_In_Finish     : AnsiChar;
           In_St_Fork_Finish  : AnsiChar;
           Rack_Out_Finish    : AnsiChar;
           Out_St_Fork_Finish : AnsiChar;
           Error              : AnsiChar;
           Storage_In_Ing     : AnsiChar;
           Storage_Out_Ing    : AnsiChar;
           Error_Code         : Array[1..2] of AnsiChar;
           Bay                : Array[1..2] of AnsiChar;
           Reserve2           : Array[1..2] of AnsiChar;
           Level              : Array[1..2] of AnsiChar;
           )
  End;

  TSCCR = Record
    Case Integer of
      1 : (All : Array [1..sizeof(TSCR_Base)*cMaxSCC] of AnsiChar); // 24
      2 : (
           SC : Array [1..cMaxSCC] of TSCR_Base;
           )
  End;

  //---------------------------------------------------------------------------
  //
  //---------------------------------------------------------------------------
  TSCW_Base = Record
    Case Integer of
      1 : (All : Array [0..14] of AnsiChar);
      2 : (
           Storage_In    : AnsiChar;
           Storage_Out   : AnsiChar;
           Home_Return   : AnsiChar;
           MachineAction : AnsiChar;
           Reserve1      : AnsiChar;
           Reserve2      : AnsiChar;
           Odd_Bay       : AnsiChar;
           Even_Bay      : AnsiChar;
           Station       : Array [0..1] of AnsiChar;
           Bay           : Array [0..1] of AnsiChar;
           Level         : Array [0..1] of AnsiChar;
           )
  End;

  TSCCW = Record
    Case Integer of
      1 : (All : Array [1..sizeof(TSCW_Base)*cMaxSCC] of AnsiChar); //24*5
      2 : (
           SC : Array [1..cMaxSCC] of TSCW_Base;
           )
  End;


  //---------------------------------------------------------------------------
  // Tracking Status 를 가지고 다니는 전역 변수 구조체
  //---------------------------------------------------------------------------
  TTrack = record
    Exist       : Integer;                     // CV Buffer No.
    BUFF_DATA   : Integer;                     // 데이터 유무
    ORD_DATE    : String;                      // 작업일자
    ORD_JOBNO   : Integer;                     // 작업번호
    ORD_TYPE    : String;                      // 작업구분
    ORD_SUBTYPE : String;                      // 작업구분
    ORD_LOC     : String;                      // Location
  end;

  //---------------------------------------------------------------------------
  // C/V Read Status 를 가지고 다니는 전역 변수 구조체
  //---------------------------------------------------------------------------
  //---------------------------------------------------------------------------
  // C/V Read Status 를 가지고 다니는 전역 변수 구조체
  //---------------------------------------------------------------------------
  TCVCB_Base = Record
    case Integer of
      1 : (All : array [1..32] of AnsiChar);
      2 : (
        AutoMode       : AnsiChar;                 // 자동모드
        Exist          : Array [1..7] of AnsiChar; // 버킷상태 ( 화물유무)
        None1          : AnsiChar;                 // 미사용
        JobDone        : AnsiChar;                 // 작업완료
        ST1_OUT_READY  : AnsiChar;                 // 출고대 출고준비 완료상태
        ST2_IN_READY   : AnsiChar;                 // 입고대 입고준비 완료상태
        None2          : Array [1..4] of AnsiChar; // 미사용
        StraightFinish : Array [1..6] of AnsiChar; // 1: 1->2, 2:2->3, 3:3->4, 4:4->5, 5:5->6, 6:6->7 직진완료
        None3          : Array [1..2] of AnsiChar; // 미사용
        Error          : Array [1..6] of AnsiChar; // 1: 1->2, 2:2->3, 3:3->4, 4:4->5, 5:5->6, 6:6->7 직진에러
        None4          : Array [1..2] of AnsiChar; // 미사용
        )
  end;

  TCVCR = Record
    Case Integer of
      1 : (All : Array [1..sizeof(TCVCB_Base)*1] of AnsiChar);
      2 : (
           Hogi : Array [1..1] of TCVCB_Base; //버킷 1호기, 2호기
           )
    End;

  TCVCW_Base = Record
    Cmd     : Array [1..6] of AnsiChar;
    Reserve : Array [1..2] of AnsiChar;
  End;


  //---------------------------------------------------------------------------
  // C/V Write Status 를 가지고 다니는 전역 변수 구조체
  //---------------------------------------------------------------------------
  TWBuff = Record
    case Integer of
      1 : (All : array [1..16] of AnsiChar);
      2 : (
        StriOrder     : Array[1..6] of AnsiChar; // 직진지시
        Reserve       : Array[1..10] of AnsiChar; //공란
    )
  end;

  TCVCW = Record
    case Integer of
      1 : (All : array [1..(Sizeof(TWBuff))*cMaxSCC] of AnsiChar);
      2 : (
        Hogi    : Array [1..cMaxSCC] of TWBuff;
      )
  end;

  //---------------------------------------------------------------------------
  // 에러정보를 가지고 다니는 전역 변수 구조체
  //---------------------------------------------------------------------------
  TOld_Error = Record
    Case Integer of
      1: (All : Array[1..4] of AnsiChar);
      2: (Data : Array[1..cMaxSCC,1..4] of AnsiChar;)
  End;

var
    gDbCon :  Array[1..2] of TDbCon;

implementation

uses h_ReferLib, RCP_Comm;
{$R *.dfm}

//------------------------------------------------------------------------------
// Database Connection
//------------------------------------------------------------------------------
function Uf_DBConnection: Boolean;
Begin
  Result := False;
  //---------------------------------------------------------------------------
  // DB 연결을 위한 ini Read
  //---------------- -----------------------------------------------------------
  gDbCon[1].OLE     := IniRead(INI_PATH, 'Database', 'Provider'      , 'SQLOLEDB.1');
  gDbCon[1].Alias   := IniRead(INI_PATH, 'Database', 'Datasource'    , '');
  gDbcon[1].Catalog := IniRead(INI_PATH, 'Database', 'InitialCatalog', '');
  gDbCon[1].User    := IniRead(INI_PATH, 'Database', 'ID'            , '');
  gDbCon[1].Pass    := IniRead(INI_PATH, 'Database', 'PW'            , '');

  //---------------------------------------------------------------------------
  // DB 연결
  //---------------------------------------------------------------------------
  with Dm_MainLib.MainDatabase do
  Begin
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
//      frmMain.CommLogWrite('N', 'DB Connected');
    except
      ON E: Exception do
      BEGIN
         //FileLib.LogWrite( LogClient, E.Message );
         frmMain.ErrorLogWrite('procedure[MainDatabase]' + E.Message + ' ConnectionString=' + ConnectionString);
         frmMain.mmErrorLog.Lines.Add( 'Error -> procedure[MainDatabase]' + E.Message);
      End;
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
//  INI File 로 부터 통신 설정값을 읽어온다.
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
//  INI File에 변경된 통신 설정값을 Write 한다.
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
// Uf_TrackDataCheck : Device:PLC_No, Buff_No: CV_NO. 트랙의 데이터 유무 확인
//---------------------------------------------------------------------------
function Uf_TrackDataCheck(Device, Buff_No: Integer): Boolean;
var
  StrSQL : String;
begin
  Result := False;
  try
    with Dm_MainLib.qryTrack do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT PLC_NO, BUFF_NO, DATA ' +
                '   FROM TT_TRACK ' +
                '  WHERE PLC_NO = ' + IntToStr(Device) +
                '    AND BUFF_NO = ' + IntToStr(Buff_No) +
                '    AND DATA = 1 ';
      SQL.Text := StrSQL;
      Open;

      // 데이터가 존재하지 않는 경우
      if (isEmpty) then
      begin
        Result := False;
      end
      // 데이터가 존재하는 경우
      else
      begin
        Result := True;
      end;

    end;
  except
    on E : Exception do
    begin
      LogWrite('.\log\ErrorDB.log','Uf_TrackDataCheck'+ '['+ E.Message + ']' + '[' + StrSQL + ']');
    end;
  end;

end;

//---------------------------------------------------------------------------
// DB로부터 Trackin Data를 받아 구조체로 넣는다
//---------------------------------------------------------------------------
procedure Uf_TrackDBSave(Hogi_No, Buff_no : Integer);
var
  strSQL : string;
begin
//  with Dm_MainLib.qrytemp do
//  Begin
//    try
//      strSQL := ' UPDATE TT_TRACK_MOLD SET ' +
//                ' BUFF_DATA     = '   + inttostr(gTRACK[Hogi_No][Buff_no].BUFF_DATA) + '  , ' +
//                ' ORD_DATE      = ''' +          gTRACK[Hogi_No][Buff_No].ORD_DATE   + ''', ' +
//                ' ORD_JOBNO     = '   + inttostr(gTRACK[Hogi_No][Buff_No].ORD_JOBNO) + '  , ' +
//                ' ORD_TYPE      = ''' +          gTRACK[Hogi_No][Buff_no].ORD_TYPE   + ''', ' +
//                ' ORD_SUBTYPE   = ''' +          gTRACK[Hogi_No][Buff_no].ORD_SUBTYPE+ ''', ' +
//                ' ORD_LOC       = ''' +          gTRACK[Hogi_No][Buff_no].ORD_LOC    + '''  ' +
//                ' WHERE aws_NO = '    + inttostr( Hogi_No )                                   +
//                ' AND BUFF_NO = '     + inttostr( Buff_no );
//      Close;
//      SQL.Text := strSQL;
//      ExecSQL;
//    Except
//      on E: Exception do BEGIN
//        LogWrite('.\log\ErrorDB.log','Uf_TrackDBSave'+ '['+ E.Message + ']'+'['+strSQL +']');
//      End ;
//    End;
//  end;
end;

//---------------------------------------------------------------------------
// Uf_TrackDBUpdate : DB 트랙 데이터를 업데이트 함. Device:PLC NO, Buff_NO:CV_NO
//---------------------------------------------------------------------------
procedure Uf_TrackDBUpdate(Device, Buff_No : Integer);
var
  StrSQL : String;
begin
  if (Buff_No = 1) then Exit;

  try
    with Dm_MainLib.qryTrack do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE TT_TRACK ' +
                '    SET DATA = 1 ' +
                '      , JOB_NO = A.JOB_NO ' +
                '      , UPDATE_DT = GETDATE() ' +
                '   FROM (SELECT DATA, JOB_NO ' +
                '           FROM TT_TRACK ' +
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
    end;
  except
    on E : Exception do
    begin
      LogWrite('.\log\ErrorDB.log','Uf_TrackDBUpdate'+ '['+ E.Message + ']' + '[' + StrSQL + ']');
    end;
  end;
end;

//---------------------------------------------------------------------------
// Tracking 데이터 지운다.
//---------------------------------------------------------------------------
procedure Uf_TrackMemoryClear(Hogi_No, Buff_No: integer);
begin
//
//  gTRACK[Hogi_No][Buff_No].BUFF_DATA   := 0;
//  gTRACK[Hogi_No][Buff_No].ORD_DATE    := '';
//  gTRACK[Hogi_No][Buff_No].ORD_JOBNO   := 0;
//  gTRACK[Hogi_No][Buff_No].ORD_TYPE    := '';
//  gTRACK[Hogi_No][Buff_No].ORD_SUBTYPE := '';
//  gTRACK[Hogi_No][Buff_No].ORD_LOC     := '';
//
//  Uf_TrackDBSave( Hogi_No,Buff_No );
end;

//---------------------------------------------------------------------------
// Tracking 데이터를 이동한다.(구조체)  -  전체이동
//---------------------------------------------------------------------------
procedure Uf_TrackMemoryMove( Hogi_No, FromBuff_No, ToBuff_No: integer);
begin
//  if (gTRACK[Hogi_No][ FromBuff_No].BUFF_DATA = 1) and (gTRACK[Hogi_No][ToBuff_No].BUFF_DATA = 0) then
//  begin
//    gTRACK[Hogi_No][ToBuff_No].BUFF_DATA   := gTRACK[Hogi_No][FromBuff_No].BUFF_DATA;
//    gTRACK[Hogi_No][ToBuff_No].ORD_TYPE    := gTRACK[Hogi_No][FromBuff_No].ORD_TYPE;
//    gTRACK[Hogi_No][ToBuff_No].ORD_DATE    := gTRACK[Hogi_No][FromBuff_No].ORD_DATE;
//    gTRACK[Hogi_No][ToBuff_No].ORD_JOBNO   := gTRACK[Hogi_No][FromBuff_No].ORD_JOBNO;
//    gTRACK[Hogi_No][ToBuff_No].ORD_SUBTYPE := gTRACK[Hogi_No][FromBuff_No].ORD_SUBTYPE;
//    gTRACK[Hogi_No][ToBuff_No].ORD_LOC     := gTRACK[Hogi_No][FromBuff_No].ORD_LOC;
//
//    Uf_TrackMemoryClear( Hogi_No,FromBuff_No );
//    Uf_TrackDBSave( Hogi_No,ToBuff_No )
//  end;
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
      StrSQL := ' SELECT * FROM TC_CVCR WHERE IDX = ' + IntToStr(Idx);
      SQL.Text := StrSQL;
      Open;

      // 테이블에 행이 없는 경우
      if (isEmpty) then
      begin
        Close;
        StrSQL := 'INSERT INTO TC_CVCR(IDX, ';

        for Loop := 0 to Max - 1 do
        begin
          StrSQL := StrSQL + 'CH' + FormatFloat('00', Loop) + ', ';
        end;

        // 마지막 CR_DATE넣고  괄호 닫음
        StrSQL := StrSQL + 'CR_DATE)';

        // Values 문
        StrSQL := StrSQL + 'VALUES (' + QuotedStr(IntToStr(Idx)) + ', ';

        for Loop := 0 to Max -1 do
        begin
          StrSQL := StrSQL + QuotedStr(Copy(Value, (Loop * 16) + 1, 16)) + ',';
        end;

        // 마지막 CR_DATE값 넣고 괄호 닫음
        StrSQL := StrSQL + 'GETDATE() )';
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end
      // 테이블에 행이 있는 경우
      else
      begin
        Close;
        StrSQL := 'UPDATE TC_CVCR SET ';

        for Loop := 0 to Max - 1 do
        begin
          Temp   := Copy(Value, (Loop * 16) + 1, 16);
          StrSQL := StrSQL + 'CH' + FormatFloat('00', Loop) + '=' + QuotedStr(Temp) + ', ';
        end;

        StrSQL := StrSQL + 'CR_DATE=GETDATE() Where Idx=' + IntToStr(Idx);
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end;
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
      StrSQL := ' SELECT * FROM TC_CVCW WHERE IDX = ' + IntToStr(Idx);
      SQL.Text := StrSQL;
      Open;

      // 테이블에 행이 없는 경우
      if (isEmpty) then
      begin
        Close;
        StrSQL := ' INSERT INTO TC_CVCW (IDX, CH00, CR_DATE) ' +
                  '         VALUES (' + QuotedStr(IntToStr(Idx)) + ', ' +
                                        QuotedStr(Value) + ', GETDATE() )';
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end
      // 테이블에 행이 있는 경우
      else
      begin
        Close;
        StrSQL := ' UPDATE TC_CVCW ' +
                  '    SET CH00 = ' + QuotedStr(Value) +
                  '      , CR_DATE = GETDATE() ' +
                  '  WHERE Idx = ' + QuotedStr(IntToStr(Idx));
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end;

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
var Loop :Integer;
    strSQL, Temp:String;
begin
    Result:=False;
  //  Max:=5;
    strSQL := 'UPDATE TC_SCCW_MOLD SET ';
    for Loop:=0 to cMaxSCC-1 do
    begin
      Temp:=Copy(Value,Loop*8+1,8);
      strSQL:=strSQL+'CH'+FormatFloat('00',Loop)+'='+QuotedStr(Temp)+', ';
    end;
    strSQL:=strSQL+'CWDATE=SYSDATE Where Idx=1';

    with Dm_MainLib.qrytemp do
    begin
      try
        Close;
        SQL.Text:=strSQL;

        if ExecSQL>0 then
        begin
          Result:=True;
        end;
      Except
        on E: Exception do
        BEGIN
          LogWrite('.\log\ErrorDB.log','Uf_TableWirte_SCCW'+ '['+ E.Message + ']'+'['+strSQL +']');
        End ;
      End;
    end;
end;

//==============================================================================
//
//==============================================================================
function Uf_Read_TT_Track_Table:Boolean;
var AWS_No, Buff_No:Integer;
    strSQL : string;
begin
//    Result:=False;
//
////    FillChar(gTRACK, sizeof(gTRACK),Ord('0'));
//
//    with Dm_MainLib.qrytemp do
//    begin
//      try
//        strSQL := 'SELECT * '
//               +  'FROM TT_TRACK_MOLD '
//               +  'ORDER BY AWS_NO,BUFF_NO,BUFF_DATA ';
//        Close;
//        SQL.Text := strSQL ;
//        Open;
//
//        First;
//        while (Not Eof) do
//        begin
//          AWS_No   := FieldByName('AWS_NO').AsInteger;
//          Buff_No  := FieldByName('BUFF_NO').AsInteger;
//
//          gTRACK[AWS_No][Buff_No].BUFF_DATA   := FieldByName('BUFF_DATA').AsInteger;
//          gTRACK[AWS_No][Buff_No].ORD_DATE    := FieldByName('ORD_DATE').AsString;
//          gTRACK[AWS_No][Buff_No].ORD_JOBNO   := FieldByName('ORD_JOBNO').AsInteger;
//          gTRACK[AWS_No][Buff_No].ORD_TYPE    := FieldByName('ORD_TYPE').AsString;
//          gTRACK[AWS_No][Buff_No].ORD_SUBTYPE := FieldByName('ORD_SUBTYPE').AsString;
//          gTRACK[AWS_No][Buff_No].ORD_LOC     := FieldByName('ORD_LOC').AsString;
//
//          Next;
//        end;
//        Result:=True;
//      Except
//        on E: Exception do
//        BEGIN
//          LogWrite('.\log\ErrorDB.log','Uf_Read_TT_Track_Table'+ '['+ E.Message + ']'+'['+strSQL +']');
//        End ;
//      End;
//    end;
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
      StrSQL := ' SELECT * FROM TC_SCCR WHERE IDX = ' + IntToStr(Idx);
      SQL.Text := StrSQL;
      Open;

      // 테이블에 행이 없는 경우
      if (isEmpty) then
      begin
        Close;
        StrSQL := 'INSERT INTO TC_SCCR(IDX, ';

        // 채널 00 01 02 사용 (3 word)
        for Loop := 0 to 2 do
        begin
          StrSQL := StrSQL + 'CH' + FormatFloat('00', Loop) + ', ';
        end;

        // 마지막 CR_DATE넣고  괄호 닫음
        StrSQL := StrSQL + 'CR_DATE)';

        // Values 문
        StrSQL := StrSQL + 'VALUES (' + QuotedStr(IntToStr(Idx)) + ', ';

        // Bit 채널
        StrSQL := StrSQL + QuotedStr(Copy(Value, 1, 16)) + ',';

        // Word 채널
        StrSQL := StrSQL + QuotedStr(Copy(Value, 17, 4)) + ',';
        StrSQL := StrSQL + QuotedStr(Copy(Value, 21, 4)) + ',';

        // 마지막 CR_DATE값 넣고 괄호 닫음
        StrSQL := StrSQL + 'GETDATE() )';
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result:=True;
        end;
      end
      // 테이블에 행이 있는 경우
      else
      begin
        Close;
        StrSQL := 'UPDATE TC_SCCR SET ';
        // Bit 채널
        StrSQL := StrSQL + 'CH00 = ' + QuotedStr(Copy(Value, 1, 16)) + ',';

        // Word 채널
        StrSQL := StrSQL + 'CH01 = ' + QuotedSTr(Copy(Value, 17, 4)) + ',';
        StrSQL := StrSQL + 'CH02 = ' + QuotedSTr(Copy(Value, 21, 4)) + ',';
        StrSQL := StrSQL + 'CR_DATE=GETDATE() Where Idx=' + IntToStr(Idx);
        SQL.Text := StrSQL;
        if ExecSQL > 0 then
        begin
          Result := True;
        end;
      end;
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
//
//==============================================================================
function Uf_SC_Error_Write(Stock_No:Integer;Error_Code:String):Boolean;
var strSQL, Msg:String;
begin
  Result:=False;
//  with Dm_MainLib.qrytemp do
//  begin
//    Try
//      strSQL := 'Select * From TM_ERROR Where Err_Code='+QuotedStr(Error_Code);
//      Close;
//      SQL.Text := strSQL ;
//      Open;
//
//      if RecordCount>0 then
//      begin
//        Msg:=FieldByName('ERR_NAME').AsString;
//      end else
//      begin
//        Msg:='NOT DEFINE';
//      end;
//
//      //-------------------------------------------------------
//      //  에러이력 등록
//      //-------------------------------------------------------
//      strSQL := 'INSERT INTO TT_ERROR_MOLD '+
//                '(Mc_type, mc_code, ERR_CODE, ERR_DESC, err_start) VALUES('+
//                  QuotedStr('SC')+','+
//                  IntToStr(Stock_No)+','+
//                  QuotedStr(Error_Code)+','+
//                  QuotedStr(Msg)+','+
//                'SYSDATE)';
//      Close;
//      SQL.Text := strSQL ;
//
//      if ExecSQL>0 then
//      begin
//        Result:=True;
//        gOld_SC_Error.Data[Stock_No,1]:='1';
//      end;
//
//    Except
//      on E: Exception do
//      BEGIN
//        LogWrite('.\log\ErrorDB.log','Uf_SC_Error_Write'+ '['+ E.Message + ']'+'['+strSQL +']');
//      End ;
//    End;
//  end;
end;

//==============================================================================
//
//==============================================================================
function Uf_GetSCWRead:Boolean;
var Loop :Integer;
    strSQL,Temp,Temp1,Temp2,Temp3:String;
begin
  Result:=False;

//  with Dm_MainLib.qrytemp do
//  begin
//    try
//      strSQL   :='SELECT * FROM TC_SCCW_MOLD WHERE Idx=1';
//      Close;
//      SQL.Text := strSQL ;
//      Open;
//
//      if RecordCount>0 then
//      begin
//        for Loop:=0 to cMaxSCC-1 do
//        begin
//          Temp:=FieldByName('CH'+FormatFloat('00',Loop)).AsString;
//          Temp1:=StrHexToStrBin(Copy(Temp,1,2));
//          Temp2:=Copy(Temp,3,2);
//          Temp3:=Copy(Temp,5,4);
//          StrMove(@gSCCW.SC[Loop+1],PChar(Temp1+Temp2+Temp3),20);
//        end;
//      end;
//      Result:=True;
//    Except
//      on E: Exception do
//      BEGIN
//        Dm_MainLib.MainDatabase.Connected := False;
//        LogWrite('.\log\ErrorDB.log','Uf_GetSCWRead'+ '['+ E.Message + ']'+'['+strSQL +']');
//      End ;
//    End;
//  end;
end;

//==============================================================================
//
//==============================================================================
function Uf_TC_SCCW_Update(Hogi:Integer;Msg:String):Boolean;
var strSQL :String;
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
      if ExecSQL>0 then
      begin
        Result:=True;
      end;
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
// InsertPGMHist ( W_PROGRAM_HIST 테이블에 이력을 넣음)
//==============================================================================
procedure InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
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
      LogWrite('.\log\ErrorDB.log','Uf_TC_SCCW_Update'+ '['+ E.Message + ']');
    end;
  end;
end;

end.
