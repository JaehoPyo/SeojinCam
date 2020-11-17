unit RCP_Comm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  CPortCtl, h_MainLib, h_ReferLib, d_MainLib, System.Win.ScktComp, StrUtils, ShellAPI;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    mmErrorLog: TMemo;
    TabSheet2: TTabSheet;
    mmCommLog: TMemo;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel9: TPanel;
    Panel10: TPanel;
    cbSC_1: TCheckBox;
    cbSC_2: TCheckBox;
    cbSC_3: TCheckBox;
    cbSC_4: TCheckBox;
    cbSC_5: TCheckBox;
    cbSC_6: TCheckBox;
    cbSC_7: TCheckBox;
    cbSC_8: TCheckBox;
    cbSC_9: TCheckBox;
    cbSC_10: TCheckBox;
    cbSC_11: TCheckBox;
    cbSC_12: TCheckBox;
    cbSC_13: TCheckBox;
    cbSC_14: TCheckBox;
    cbSC_15: TCheckBox;
    cbSC_16: TCheckBox;
    edtSC_Error: TEdit;
    edtSC_Loc: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    cbSC_Write_1: TCheckBox;
    cbSC_Write_2: TCheckBox;
    cbSC_Write_3: TCheckBox;
    cbSC_Write_4: TCheckBox;
    cbSC_Write_5: TCheckBox;
    cbSC_Write_6: TCheckBox;
    cbSC_Write_7: TCheckBox;
    cbSC_Write_8: TCheckBox;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    edtSC_Write_Bay: TEdit;
    Label7: TLabel;
    edtSC_Write_Level: TEdit;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    GroupBox3: TGroupBox;
    cbCV1_go1: TCheckBox;
    cbCV1_go3: TCheckBox;
    cbCV1_go4: TCheckBox;
    cbCV1_go2: TCheckBox;
    cbCV1_go5: TCheckBox;
    cbCV1_go6: TCheckBox;
    GroupBox4: TGroupBox;
    cbCV2_go1: TCheckBox;
    cbCV2_go3: TCheckBox;
    cbCV2_go4: TCheckBox;
    cbCV2_go2: TCheckBox;
    cbCV2_go5: TCheckBox;
    cbCV2_go6: TCheckBox;
    GroupBox5: TGroupBox;
    cbCV1_1: TCheckBox;
    cbCV1_2: TCheckBox;
    GroupBox6: TGroupBox;
    cbCV1_3: TCheckBox;
    cbCV1_4: TCheckBox;
    cbCV1_5: TCheckBox;
    cbCV1_6: TCheckBox;
    cbCV1_7: TCheckBox;
    cbCV1_8: TCheckBox;
    cbCV1_9: TCheckBox;
    cbCV1_10: TCheckBox;
    cbCV1_11: TCheckBox;
    cbCV1_12: TCheckBox;
    cbCV1_13: TCheckBox;
    cbCV1_14: TCheckBox;
    cbCV1_15: TCheckBox;
    cbCV1_16: TCheckBox;
    cbCV1_17: TCheckBox;
    cbCV1_18: TCheckBox;
    cbCV1_19: TCheckBox;
    cbCV1_20: TCheckBox;
    cbCV1_21: TCheckBox;
    cbCV1_22: TCheckBox;
    cbCV1_23: TCheckBox;
    cbCV1_24: TCheckBox;
    cbCV1_25: TCheckBox;
    cbCV1_26: TCheckBox;
    cbCV1_27: TCheckBox;
    cbCV1_28: TCheckBox;
    cbCV1_29: TCheckBox;
    cbCV1_30: TCheckBox;
    cbCV1_31: TCheckBox;
    cbCV1_32: TCheckBox;
    tmrMain: TTimer;
    btnComm: TButton;
    FrontPLCSocket: TClientSocket;
    tmrConnectDB: TTimer;
    pnlStatusBar: TPanel;
    pnlStatusPanel4: TPanel;
    pnlStatusPanel3: TPanel;
    pnlStatusPanel2: TPanel;
    pnlStatusPanel1: TPanel;
    Label8: TLabel;
    lblUptime: TLabel;
    Label9: TLabel;
    ShpMFCInterfaceConn2: TShape;
    Label10: TLabel;
    ShpDatabaseConn: TShape;
    RearPLCSocket: TClientSocket;
    Panel17: TPanel;
    Label11: TLabel;
    ShpMFCInterfaceConn1: TShape;
    cbCV2_1: TCheckBox;
    cbCV2_2: TCheckBox;
    cbCV2_3: TCheckBox;
    cbCV2_4: TCheckBox;
    cbCV2_5: TCheckBox;
    cbCV2_6: TCheckBox;
    cbCV2_7: TCheckBox;
    cbCV2_8: TCheckBox;
    cbCV2_9: TCheckBox;
    cbCV2_10: TCheckBox;
    cbCV2_11: TCheckBox;
    cbCV2_12: TCheckBox;
    cbCV2_13: TCheckBox;
    cbCV2_14: TCheckBox;
    cbCV2_15: TCheckBox;
    cbCV2_16: TCheckBox;
    cbCV2_17: TCheckBox;
    cbCV2_18: TCheckBox;
    cbCV2_19: TCheckBox;
    cbCV2_20: TCheckBox;
    cbCV2_21: TCheckBox;
    cbCV2_22: TCheckBox;
    cbCV2_23: TCheckBox;
    cbCV2_24: TCheckBox;
    cbCV2_25: TCheckBox;
    cbCV2_26: TCheckBox;
    cbCV2_27: TCheckBox;
    cbCV2_28: TCheckBox;
    cbCV2_29: TCheckBox;
    cbCV2_30: TCheckBox;
    cbCV2_31: TCheckBox;
    cbCV2_32: TCheckBox;
    rgCV: TRadioGroup;
    Panel18: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    ledSend: TComLed;
    ledReceive: TComLed;
    rgSC: TRadioGroup;
    cbSC_Write_9: TCheckBox;
    edtStep: TEdit;
    Label12: TLabel;
    tmrServer: TTimer;
    tmrLogFileCheck: TTimer;
    tmrUPD_ORDSEQSEL: TTimer;
    tmrEPLTOut: TTimer;

    procedure AppException(Sender: TObject; E: Exception);
    procedure btnCommClick(Sender: TObject);
    procedure CommLogWrite(Device: Integer; Msg: String);
    procedure ControlProcess_CV (Device: Integer);
    procedure ControlProcess_SC;
    procedure CVCW_Write(Device: Integer);
    procedure ErrorLogWrite(Msg: string);
    procedure FillBuff(Device: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure tmrConnectDBTimer(Sender: TObject);
    procedure PLCSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure PLCSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure PLCSocketWrite(Sender: TObject; Socket: TCustomWinSocket);
    procedure PLCSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure PLCSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure PLCWrite(Device: Integer; Machine: string; Data: AnsiString);
    procedure ShowPLCStatus(Device: Integer; Machine: string);
    procedure ShowCVWriteStatus(Device: Integer);
    procedure ShowSCWriteStatus;
    procedure SCCW_Write;
    procedure SC_JOB_Process;
    procedure TrackingProcess_CV(Device: Integer);
    procedure tmrLogFileCheckTimer(Sender: TObject);
    procedure tmrServerTimer(Sender: TObject);
    procedure tmrUPD_ORDSEQSELTimer(Sender: TObject);
    procedure tmrEPLTOutTimer(Sender: TObject);
  private
    procedure LogFileDelete;
    function  DeleteRecodingFile(fileDir: String; iOption: integer): Boolean;
    function  MinDeleteFile(const DirName: string; const UseRecycleBin: Boolean): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

  DeleteOption : integer;

  gWholePacket  : Array [1..2, 1..1024] of AnsiChar; // 프레임 완성 후의 데이터
  gIdx          : Array [1..2] of Integer;           // 프레임 완성 후의 수신 데이터수
  gSTXReceived  : Array [1..2] of Bool;              // 프레임 시작점 수신 여부

  gTRACK        : Array [1..1,0..4] of TTrack;   //0 은 크레인...
  gCVCR         : Array [1..2] of TCVCR;
  gCVCW         : Array [1..2] of TCVCW;
  gSCCR         : TSCCR;
  gSCCW         : TSCCW;

  gOld_SC_Error_Code: Integer = 0;
  gOld_CV_Error_Code: Array [1..2, 1..6] of Integer;

  AckNakFlag    : Char;                    // PLC 통신시 응답헤더.
  gLastCommTime : Tdatetime;               // 최종통신 응답시간.
  gRcpConnect   : String;

  gCommandFlag : Integer;
  gInOutFlag   : String;
  gDBConnected : Boolean;
  gCVRead      : Boolean;  // PLC 2번 컨베어까지 데이터를 읽었을 경우에만 EPLT자동출고하도록 하기 위함

  gLogwriteDBConnection : Boolean;
  gLogwriteComport      : Boolean;
  gUf_GetCVCRead        : Boolean;
  gUf_GetSCRRead        : Boolean;

implementation

{$R *.dfm}


//------------------------------------------------------------------------------
// AppException
//------------------------------------------------------------------------------
procedure TfrmMain.AppException(Sender: TObject; E: Exception);
var
  ErrorMessage : String;
begin
  ErrorMessage := ErrorMessage + '  ' + E.message;
  mmErrorLog.Lines.Add(ErrorMessage);
end;

//------------------------------------------------------------------------------
//  btnCommClick Event
//------------------------------------------------------------------------------
procedure TfrmMain.btnCommClick(Sender: TObject);
begin
  try
    if (btnComm.Caption = '통신시작') then
    begin

      // DB 접속
      if (Uf_DBConnection()) then
      begin
        ShpDatabaseConn.Brush.Color := CONN_STATUS_COLOR[1];
        gDBConnected := True;

        // 로그 삭제 옵션
        DeleteOption := StrToIntDef(IniRead(INI_PATH, 'Delete', 'DeleteOption', '0'), 0);
        LogFileDelete;
      end;

      // 전면 plc 접속
      if ( not FrontPLCSocket.Active) and (gDBConnected) then
      begin
        FrontPLCSocket.Address := INIRead(INI_PATH, 'PLC1', 'IP'  , ''); //Uf_GetComset('컨베이어1', 'ID_IP');
        FrontPLCSocket.Port    := StrToInt(INIRead(INI_PATH, 'PLC1', 'PORT', '')); //StrToInt(Uf_GetComset('컨베이어1', 'ID_PORT'));
        FrontPLCSocket.Open();
      end;

      // 후면 plc 접속
      if (not RearPLCSocket.Active) then
      begin
        RearPLCSocket.Address := INIRead(INI_PATH, 'PLC2', 'IP'  , ''); //Uf_GetComset('컨베이어2', 'ID_IP');
        RearPLCSocket.Port    := StrToInt(INIRead(INI_PATH, 'PLC2', 'PORT', '')); //StrToInt(Uf_GetComset('컨베이어2', 'ID_PORT'));
        RearPLCSocket.Open();
      end;

      btnComm.Caption := '통신멈춤';
      tmrMain.Enabled          := True;
      tmrConnectDB.Enabled     := True;
      tmrServer.Enabled        := True;
      tmrUPD_ORDSEQSEL.Enabled := True;
      tmrEPLTOut.Enabled       := True;
    end
    else
    begin
      btnComm.Caption := '통신시작';
      FrontPLCSocket.Close();
      RearPLCSocket.Close();
      Dm_MainLib.MainDatabase.Close();
      ShpDatabaseConn.Brush.Color := CONN_STATUS_COLOR[0];
      tmrMain.Enabled          := False;
      tmrConnectDB.Enabled     := False;
      tmrServer.Enabled        := False;
      tmrUPD_ORDSEQSEL.Enabled := False;
      tmrEPLTOut.Enabled       := False;
    end;
  except
    on e: Exception do
    begin
      ErrorLogWrite('procedure[btnCommClick]'+ e.Message);
    end;

  end;
end;

//------------------------------------------------------------------------------
//  CommLogWrite
//------------------------------------------------------------------------------
procedure TfrmMain.CommLogWrite(Device: Integer; Msg: String);
var
  FileName : String;
begin
  FileName := 'Log\PLC_' + IntToStr(Device) + '_' + FormatDatetime('YYYYMMDD', now) + '.log';
  Msg := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>' + Msg;
  LogWrite(FileName, Msg);

  if (mmCommLog.Lines.Count > 50) then mmCommLog.Clear;

  mmCommLog.Lines.Add(Msg);
end;

//------------------------------------------------------------------------------
//  ControlProcess_CV : Device: PLC 1 or 2. 컨베이어 제어
//------------------------------------------------------------------------------
procedure TfrmMain.ControlProcess_CV(Device: Integer);
var
  Job_No : Integer;
  i : Integer;
  ErrorCode : Array [1..6] of Integer;
  WhereStr : String;
  OrdType, RackLoc : String;
begin

  // 자동모드가 아니면 Exit
  if (gCVCR[Device].Hogi[1].AutoMode = '0') or
     (rgCV.ItemIndex = 1) then
  begin
    Exit;
  end;

  // Fillchar(gCVCW, sizeof(gCVCW), '0');
  FillChar(ErrorCode, SizeOf(ErrorCode), 0);

  // 컨베이어 에러 발생시 지시를 끔
  for i := 1 to 6 do
  begin
    if(gCVCR[Device].Hogi[1].Error[i] = '1') then
    begin
      ErrorCode[i] := i + 7;

      // 이전 에러코드와 현재 에러코드가 같으면 나감
      if (gOld_CV_Error_Code[Device][i] = ErrorCode[i]) then Exit;

      gCVCW[Device].Hogi[1].StriOrder[i] := '0';

      // TT_ORDER 에러상태표시 설정
      Job_No := Uf_TrackGetJobNo(Device, i);
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_STAT', '1');
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_CODE', FormatFloat('0000', ErrorCode[i]));

      // 에러 기록
      RackLoc := Uf_GetOrder(IntToStr(Job_No), 'ORD_LOC');
      ErrorWrite(FormatFloat('0000', ErrorCode[i]), 'CV', IntToStr(Job_No), RackLoc);

      gOld_CV_Error_Code[Device][i] := ErrorCode[i];
    end
    // 에러가 아닌경우
    else if (gCVCR[Device].Hogi[1].Error[i] = '0') then
    begin
      // 이전에 에러가 있었을 경우, (에러 해제시)
      if (gOld_CV_Error_Code[Device][i] <> 0) then
      begin
        // 에러 해제 시간 기록
        // TT_Track 작업번호 가져옴
        Job_No := Uf_TrackGetJobNo(Device, i);

        // 지시의 에러 삭제
        Uf_SetOrder(IntToStr(Job_No), 'ERROR_STAT', '0');
        Uf_SetOrder(IntToStr(Job_No), 'ERROR_CODE', '');

        // 에러 해제 시각 기록
        ErrorClear(FormatFloat('0000', gOld_CV_Error_Code[Device][i]));

        gOld_CV_Error_Code[Device][i] := 0;
      end;
    end;
  end;

  // 1->2 직진지시
  // CV1: 화물有, 데이터有, CV2: 화물無, 데이터無
  if (gCVCR[Device].Hogi[1].Exist[1] = '1') and
     (gCVCR[Device].Hogi[1].Exist[2] = '0') and
     (gCVCR[Device].Hogi[1].Error[1] = '0') and
     (Uf_TrackDataCheck(Device, 1) = True ) and
     (Uf_TrackDataCheck(Device, 2) = False) then
  begin
    // CV1 직진 명령 설정
    gCVCW[Device].Hogi[1].StriOrder[1] := '1';

    Job_No := Uf_GetOrderJobNo(Device, '출고', 'SC완료');
    Uf_SetOrder(IntToStr(Job_No), 'STATUS', 'CV이동');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_MACH', 'CV');
  end;

  // 2->3 직진지시
  if (gCVCR[Device].Hogi[1].Exist[2] = '1') and
     (gCVCR[Device].Hogi[1].Exist[3] = '0') and
     (gCVCR[Device].Hogi[1].Error[2] = '0') and
     (Uf_TrackDataCheck(Device, 2) = True ) and
     (Uf_TrackDataCheck(Device, 3) = False) then
  begin
    // CV2 직진 명령 설정
    gCVCW[Device].Hogi[1].StriOrder[2] := '1';
  end;
  // 3->4 직진지시 (출고 완료)
  if (gCVCR[Device].Hogi[1].Exist[3] = '1') and
     (gCVCR[Device].Hogi[1].Exist[4] = '0') and
     (gCVCR[Device].Hogi[1].Error[3] = '0') and
     (Uf_TrackDataCheck(Device, 3) = True ) and
     (Uf_TrackDataCheck(Device, 4) = False) then
  begin
    // CV3 직진 명령 설정
    gCVCW[Device].Hogi[1].StriOrder[3] := '1';
  end;

  // CV4번 지시완료 및 생성 (입고)
  if (gCVCR[Device].Hogi[1].Exist[4] = '1') and
     (gCVCR[Device].Hogi[1].JobDone  = '1') then
  begin
    // 작업완료 표시벨 소등
    gCVCW[Device].Hogi[1].CompleteBell := '0';

    WhereStr := ' AND ORD_IO = ' + QuotedStr('출고') +
                ' AND STATUS = ' + QuotedStr('CV완료');
    Job_No  := Uf_GetOrderJobNo(Device, WhereStr);
    OrdType := Uf_GetOrder(IntToStr(Job_No), 'ORD_TYPE');


    //**** 부분출고 확인 -> 품목출고 확인 -> 입고 확인 ****//

    //**** 완료된 부분출고, 보충출고 지시 있음 -> 재입고 지시 생성 & 출고지시 삭제
    if ((OrdType = '부분출고') or (OrdType = '보충출고')) then
    begin
      // 재입고 지시 생성
      Uf_ReIn_OrderCrate(IntToStr(Job_No));

      // 완료된 [부분출고, 보충출고]지시 삭제
      Uf_DeleteOrder(IntToStr(Job_No));

      // 트랙데이터 제거
      Uf_TrackDataSet('', 0, Device, 4);

      // 재입고 지시의 작업번호 가져옴
      WhereStr := ' AND ORD_IO   = ' + QuotedStr('입고') +
                  ' AND ORD_TYPE IN (' + QuotedStr('재입고') + ',' + QuotedStr('보충입고') + ')' +
                  ' AND STATUS   = ' + QuotedStr('CV대기');
      Job_No := Uf_GetOrderJobNo(Device, WhereStr);

      // 트랙데이터 생성 & 지시 상태 변경
      Uf_TrackIPGOSet(Job_No, Device, 4);
    end
    //**** 완료된 품목출고지시 있음 -> 팔레트 입고 지시 생성 & 출고지시 삭제
    else if (OrdType = '품목출고') then
    begin
      // 재입고 지시 생성
      Uf_ReIn_OrderCrate(IntToStr(Job_No));

      // 완료된 [품목출고] 지시 삭제
      Uf_DeleteOrder(IntToStr(Job_No));

      // 트랙데이터 제거
      Uf_TrackDataSet('', 0, Device, 4);

      // 재입고 지시의 작업번호 가져옴
      WhereStr := ' AND ORD_IO   = ' + QuotedStr('입고') +
                  ' AND ORD_TYPE = ' + QuotedStr('파레트입고') +
                  ' AND STATUS   = ' + QuotedStr('CV대기');
      Job_No := Uf_GetOrderJobNo(Device, WhereStr);

      // 트랙데이터 생성 & 지시 상태 변경
      Uf_TrackIPGOSet(Job_No, Device, 4);
    end
    //**** 완료된 파레트출고 지시 있음 -> 팔레트 입고 지시 생성 & 출고지시 삭제
    else if (OrdType = '파레트출고') then
    begin
      // 완료된 [파레트출고] 지시 삭제
      Uf_DeleteOrder(IntToStr(Job_No));

      // 트랙데이터 제거
      Uf_TrackDataSet('', 0, Device, 4);

      // 입고지시의 작업번호 가져옴
      WhereStr := ' AND ORD_IO = ' + QuotedStr('입고') +
                  ' AND STATUS = ' + QuotedStr('CV대기') +
                  ' AND ORD_SEQ_SEL = 1' ;
      Job_No := Uf_GetOrderJobNo(Device, WhereStr);

      // 트랙데이터 생성 & 지시 상태 변경
      Uf_TrackIPGOSet(Job_No, Device, 4);
    end;
  end;

  // 4->5 직진지시
  if (gCVCR[Device].Hogi[1].Exist[4] = '1') and
     (gCVCR[Device].Hogi[1].Exist[5] = '0') and
     (gCVCR[Device].Hogi[1].Error[4] = '0') and
     (Uf_TrackDataCheck(Device, 4) = True ) and
     (Uf_TrackDataCheck(Device, 5) = False) then
  begin
    WhereStr := ' AND ORD_IO = ' + QuotedStr('출고') +
                ' AND STATUS = ' + QuotedStr('CV완료') +
                ' AND JOB_NO = ' + QuotedStr(IntToStr(Uf_TrackGetJobNo(Device, 4))) ;
    Job_No := Uf_GetOrderJobNo(Device, WhereStr);
    if (Job_No <> -1) then
    begin
      gCVCW[Device].Hogi[1].StriOrder[4] := '0';
    end
    else
    begin
      // CV4 직진 명령 설정
      gCVCW[Device].Hogi[1].StriOrder[4] := '1';
    end;
  end;

  // 5->6 직진지시
  if (gCVCR[Device].Hogi[1].Exist[5] = '1') and
     (gCVCR[Device].Hogi[1].Exist[6] = '0') and
     (gCVCR[Device].Hogi[1].Error[5] = '0') and
     (Uf_TrackDataCheck(Device, 5) = True ) and
     (Uf_TrackDataCheck(Device, 6) = False) then
  begin
    // CV5 직진 명령 설정
    gCVCW[Device].Hogi[1].StriOrder[5] := '1';
  end;

  // 6->7 직진지시
  if (gCVCR[Device].Hogi[1].Exist[6] = '1') and
     (gCVCR[Device].Hogi[1].Exist[7] = '0') and
     (gCVCR[Device].Hogi[1].Error[6] = '0') and
     (Uf_TrackDataCheck(Device, 6) = True ) and
     (Uf_TrackDataCheck(Device, 7) = False) then
  begin
    // CV6 직진 명령 설정
    gCVCW[Device].Hogi[1].StriOrder[6] := '1';
  end;
end;

//------------------------------------------------------------------------------
//  ControlProcess_SC
//------------------------------------------------------------------------------
procedure TfrmMain.ControlProcess_SC;
var
  Device : Integer; // PLC_NO
  Job_No : Integer;
  i, j, SC_JobCnt : Integer;
  CargoCnt : Integer;
  Rack_Loc, Old_RackLoc : String;
  ErrorCode : Integer;
  ErrorMsg : String;
  WhereStr : String;
begin

  // 자동모드가 아닐경우 Exit
  if (gSCCR.SC[1].Auto_Mode = '0') or
     (gSCCR.SC[1].Manual_Mode = '1') or
     (rgSC.ItemIndex = 1) then
  begin
    Exit;
  end;

  // TC_SCCW에 쓴 내용을 다시 읽어서 쓰기 버퍼(gSCCW)에 저장
  Uf_GetSCWRead;

  //** 스태커 작업중 상태 **//
  if (gSCCR.SC[1].Job_Standby = '0') and
     ((gSCCR.SC[1].Storage_In_Ing = '1') or (gSCCR.SC[1].Storage_Out_Ing = '1') or (gSCCR.SC[1].Home_Returning = '1')) then
  begin
    // 기동 요구를 끔
    gSCCW.SC[1].MachineAction := '0';
  end;

  //====== SC홈 이동요청 확인 ======//
  if (gSCCR.SC[1].Home_Returning = '0') and (Uf_GetCurrent('SCMOVEHOME', 'OPTION1') = 'True') then
  begin
    FillChar(gSCCW, SizeOf(gSCCW), '0');

    gSCCW.SC[1].Home_Return := '1';
    gSCCW.SC[1].MachineAction := '1';

    Uf_SetCurrent('SCMOVEHOME', 'OPTION1', '0');

    Exit;
  end;

  //====== SC초기화 요청 확인(강제완료, 작업취소 등의 이유로) ======//
  if (Uf_GetCurrent('SCCLEAR', 'OPTION1') = 'True') then
  begin
    Fillchar(gSCCW, sizeof(gSCCW), '0');

    Uf_SetCurrent('SCCLEAR', 'OPTION1', '0');

    Exit;
  end;

  //====== 이중입고 재작업처리 ======//
  if (Uf_GetCurrent('SCDOUBLEINRESET', 'OPTION1') = 'True') then
  begin
    edtStep.Text := 'RESET - 이중입고';
    // 현재 작업 가져오기 (이중입고의 경우 TT_ORDER의 STATUS = 'SC하역'임) 스태커 작업은 언제나 1개임
    Device := Uf_GetOrderPLCNo('입고', 'SC하역');
    Job_No := Uf_GetOrderJobNo(Device, '입고', 'SC하역');

    // 지시버퍼 재설정
    Uf_SC_WriteDataSet(Device, Job_No, '입고');

    // TC_Current 값 초기화
    Uf_SetCurrent('SCDOUBLEIN'     , 'OPTION1', '0');
    Uf_SetCurrent('SCDOUBLEINRESET', 'OPTION1', '0');

    Exit;
  end
  //====== 공출고 작업취소처리 ======//
  else if (Uf_GetCurrent('SCEMPTYOUTCANCEL', 'OPTION1') = 'True') then
  begin
    edtStep.Text := 'RESET - 공출고(작업취소)';

    // 지시버퍼 초기화
    FillChar(gSCCW, SizeOf(gSCCW), '0');

    // TC_Current값 초기화
    Uf_SetCurrent('SCEMPTYOUT'      , 'OPTION1', '0');
    Uf_SetCurrent('SCEMPTYOUTCANCEL', 'OPTION1', '0');

    Exit;
  end
  //====== 공출고 다른셀출고처리 ======//
  else if (Uf_GetCurrent('SCEMPTYOUTRESET', 'OPTION1') = 'True') then
  begin
    edtStep.Text := 'RESET - 공출고(다른셀출고)';
    // 현재 작업 가져오기 (공출고의 경우 TT_ORDER의 STATUS = 'SC적재'임)
    Device := Uf_GetOrderPLCNo('출고', 'SC적재');
    Job_No := Uf_GetOrderJobNo(Device, '출고', 'SC적재');

    // 지시버퍼 재설정
    Uf_SC_WriteDataSet(Device, Job_No, '출고');

    // TC_Current 값 초기화
    Uf_SetCurrent('SCEMPTYOUT'     , 'OPTION1', '0');
    Uf_SetCurrent('SCEMPTYOUTRESET', 'OPTION1', '0');

    Exit;
  end;

  //====== 에러 ======//
  if (gSCCR.SC[1].Error = '1') then
  begin
    ErrorCode:= Data16to10(gSCCR.SC[1].Error_Code[1]) * 16 +
                Data16to10(gSCCR.SC[1].Error_Code[2]);

    // 이전 에러코드와 현재 에러코드가 같으면 나감
    if (gOld_SC_Error_Code = ErrorCode) then Exit;

    // TT_ORDER 에러상태표시 설정
    WhereStr := ' AND STATUS in (''SC적재'', ''SC하역'') ';
    Job_No := Uf_GetOrderJobNo(1, WhereStr);
    if (Uf_GetOrder(IntToStr(Job_No), 'ERROR_STAT') = '0') then
    begin
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_STAT', '1');
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_CODE', FormatFloat('0000', ErrorCode));
    end;

    // 에러위치 가져옴
    Old_RackLoc := Uf_GetOrder(IntToStr(Job_No), 'ORD_LOC');

    // 에러 기록
    ErrorWrite(FormatFloat('0000', ErrorCode), 'SC', IntToStr(Job_No), Old_RackLoc);

    // 이중입고
    if (gSCCR.SC[1].Twin_In = '1') or
       (ErrorCode = 42) then
    begin

      // TC_Current 이중입고 마킹
      if (Uf_GetCurrent('SCDOUBLEIN', 'OPTION1') = 'False') then
      begin
        Uf_SetCurrent('SCDOUBLEIN', 'OPTION1', '1');
      end;

      // TT_Rack 이중입고 마킹
      if (Uf_GetRack(Old_RackLoc, 'RACK_STAT') <> '이중입고') then
      begin
        Uf_SetRack(Old_RackLoc, 'RACK_STAT', '이중입고');
      end;

      // 새 위치 가져오기
      Device := StrToInt(Uf_GetOrder(IntToStr(Job_No), 'PLC_NO'));
      Rack_Loc := GetEmptyRack('', IntToStr(Device), '1');
      if (Copy(Rack_Loc, 1, 2) = 'NG')  then
      begin
        // 에러이력 남김
        ErrorLogWrite('빈셀찾기 실패');
      end
      else
      begin
        Rack_Loc := Copy(Rack_Loc, 3, 6);
        // 위치 재설정
        Uf_SetOrder(IntToStr(Job_No), 'ORD_LOC'  , Rack_Loc);
        Uf_SetOrder(IntToStr(Job_No), 'DST_BANK' , Copy(Rack_Loc, 1, 2));
        Uf_SetOrder(IntToStr(Job_No), 'DST_BAY'  , Copy(Rack_Loc, 3, 2));
        Uf_SetOrder(IntToStr(Job_No), 'DST_LEVEL', Copy(Rack_Loc, 5, 2));

        // 랙 입고중 상태 표시
        Uf_SetRack(Rack_Loc, 'RACK_STAT', '입고중');

        // 랙 재고 위치 변경
        Uf_SetRackStock(Old_RackLoc, 'RACK_LOC', Rack_Loc);
        Uf_SetRackStock(Old_RackLoc, 'RACK_BANK',  Copy(Rack_Loc, 1, 2));
        Uf_SetRackStock(Old_RackLoc, 'RACK_BAY',   Copy(Rack_Loc, 3, 2));
        Uf_SetRackStock(Old_RackLoc, 'RACK_LEVEL', Copy(Rack_Loc, 5, 2));

        // 지시버퍼 재설정
        Uf_SC_WriteDataSet(Device, Job_No, '입고');
      end;
    end
    // 공출고
    else if (gSCCR.SC[1].Blank_Out = '1') or
            (ErrorCode = 43) then
    begin
      if (Uf_GetCurrent('SCEMPTYOUT', 'OPTION1') = 'False') then
      begin
        Uf_SetCurrent('SCEMPTYOUT', 'OPTION1', '1');
      end;

      Rack_Loc := Uf_GetOrder(IntToStr(Job_No), 'ORD LOC');
      if (Uf_GetRack(Rack_Loc, 'RACK_STAT') <> '공출고') then
      begin
        Uf_SetRack(Rack_Loc, 'RACK_STAT', '공출고');
      end;
    end;

    // 에러코드 저장
    gOld_SC_Error_Code := ErrorCode;

    Exit;
  end
  // 에러 아님
  else if (gSCCR.SC[1].Error = '0') then
  begin
    // 이전에 에러가 있었을 경우, (에러 해제시)
    if (gOld_SC_Error_Code <> 0) then
    begin
      // TT_ORDER 작업번호 가져옴
      WhereStr := ' AND STATUS in (''SC적재'', ''SC하역'') ';
      Job_No := Uf_GetOrderJobNo(1, WhereStr);

      // 지시의 에러 삭제
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_STAT', '0');
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_CODE', '');

      // 이중입고 TC_Current 값 초기화
      if (gOld_SC_Error_Code = 42) then
      begin
        Uf_SetCurrent('SCDOUBLEIN', 'OPTION1', '0');
      end;

      // 에러 해제 시각 기록
      ErrorClear(FormatFloat('0000', gOld_SC_Error_Code));

      gOld_SC_Error_Code := 0;
    end;
  end;

  // 입고,출고 번갈아가며 지시
  if      gInOutFlag = ''     then gInOutFlag := '입고'
  else if gInOutFlag = '입고' then gInOutFlag := '출고'
  else if gInOutFlag = '출고' then gInOutFlag := '입고';

  //====== 진행중인 작업 처리 ======//
  WhereStr := ' AND STATUS in (''SC적재'', ''SC하역'')' ;
  SC_JobCnt := Uf_GetOrderCount(WhereStr);
  if (SC_JobCnt = 1) then
  begin
    //** 진행중인 작업 처리 **//
    SC_JOB_Process;
  end
  //====== 스태커 작업이 없는 경우 새로운 지시 탐색 ======//
  else if (SC_JobCnt = 0) then
  begin
    //** 스태커 대기상태 (작업지시 데이터 생성) **//
    if (gSCCR.SC[1].Job_Standby     = '1') and
       (gSCCR.SC[1].Home_Returning  = '0') and
       (gSCCR.SC[1].Storage_In_Ing  = '0') and
       (gSCCR.SC[1].Storage_Out_Ing = '0') and
       (gSCCR.SC[1].Pallet_Exist    = '0') and
       (gSCCR.SC[1].Error           = '0') then
    begin
      edtStep.Text := 'READY';

      // 1. 작업(TT_ORDER)유무 확인
      if (gInOutFlag = '입고') and (Uf_GetCurrent('SC_IN_USE', 'OPTION1') = 'True') then
      begin
        // CV완료인 지시의 PLC번호를 찾아옴.
        Device := Uf_GetOrderPLCNo(gInOutFlag, 'CV완료');
        if(Device < 0) then Exit;

        // 위에서 찾은 PLC번호의 입고대가 준비상태가 아니거나
        // 트랙 데이터가 없다면 다른 PLC 입고대의 준비상태를 확인함
        if (gCVCR[Device].Hogi[1].ST2_IN_READY = '0') or
           (Uf_TrackDataCheck(Device, 7) = False) then
        begin
          // PLC번호 토글
          if (Device = 1) then Device := 2
          else                 Device := 1;

          // 다른 PLC의 입고대가 준비상태이고
          // 트랙 데이터가 있으면 작업번호 가져오기
          if (gCVCR[Device].Hogi[1].ST2_IN_READY = '1') and
             (Uf_TrackDataCheck(Device, 7) = True) then
          begin
            Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'CV완료');
          end;
        end
        // 준비상태이고, 트랙데이터 있으면 작업번호 찾음
        else
        begin
          Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'CV완료');
        end;
      end
      else if (gInOutFlag = '출고') and (Uf_GetCurrent('SC_OT_USE', 'OPTION1') = 'True') then
      begin
        // SC대기인 지시의 PLC번호를 찾아옴.
        Device := Uf_GetOrderPLCNo(gInOutFlag, 'SC대기');
        if(Device < 0) then Exit;

        // 위에서 찾은 PLC번호의 출고대가 준비상태가 아니거나
        // 트랙 데이터가 있다면  다른 PLC 출고대의 준비상태를 확인함
        if (gCVCR[Device].Hogi[1].ST1_OUT_READY = '0') or
           (Uf_TrackDataCheck(Device, 1) = True) then
        begin
          // PLC번호 토글
          if (Device = 1) then Device := 2
          else                 Device := 1;

          // 다른 PLC의 출고대가 준비상태이고
          // 트랙데이터가 없으면 작업번호 가져오기
          if (gCVCR[Device].Hogi[1].ST1_OUT_READY = '1') and
             (Uf_TrackDataCheck(Device, 1) = False) then
          begin
            Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'SC대기');
          end;
        end
        // 준비상태이고, 트랙데이터 없으면 작업번호 찾음
        else
        begin
          Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'SC대기');
        end;
      end;

      // 1.1 작업을 못찾았을 경우 Exit
      if ((Device < 0) or (Job_No < 0)) then Exit;

      // 1.2 입고대(CV7) 출고대(CV1) 준비 안됐으면 Exit
      if (((gInOutFlag = '입고') and ((Uf_GetCurrent('SC_IN_USE', 'OPTION1') = 'False') or
                                      (gCVCR[Device].Hogi[1].ST2_IN_READY = '0') or
                                      (gCVCR[Device].Hogi[1].Exist[7] = '0'))) or
          ((gInOutFlag = '출고') and ((Uf_GetCurrent('SC_OT_USE', 'OPTION1') = 'False') or
                                      (gCVCR[Device].Hogi[1].ST1_OUT_READY = '0') or
                                      (gCVCR[Device].Hogi[1].Exist[1] = '1'))) ) then
      begin
        Exit;
      end;

      // 2. gSCCW구조체 구성(SC Write 구조체), (Device와 Job_No는 1에서 찾아왔음)
      FillChar(gSCCW, SizeOf(gSCCW), chr($00));
      Uf_SC_WriteDataSet(Device, Job_No, gInOutFlag);

      // 3. 지시 상태 변경 'SC대기' -> 'SC지시'
      Uf_SetOrder(IntToStr(Job_No), 'STATUS', 'SC적재');

      edtStep.Text := 'ORDER';

    end
  end;

end;

//------------------------------------------------------------------------------
//  CVCW_Write : TC_CVCW에 기록 및 PLC전송
//------------------------------------------------------------------------------
procedure TfrmMain.CVCW_Write(Device: Integer);
var
  dataStr : AnsiString;
begin

  // 자동모드가 아니면 Exit
  if (gCVCR[Device].Hogi[1].AutoMode = '0') or
     (rgCV.ItemIndex = 1) then
  begin
    Exit;
  end;

  // original
  dataStr := gCVCW[Device].Hogi[1].All; // 00000000 00000000

  // DB에 쓰기
  Uf_TableWirte_CVCW(Device, dataStr);

  // reverse
  //dataStr := ReverseString(dataStr);

  // bin to hex
  dataStr := StrBinToStrHex(dataStr);

  // PLC에 쓰기
  dataStr := '00WSB' + '07' + '%MW2950' + '01' + dataStr;
  PLCWrite(Device, 'CV', dataStr);

end;

//------------------------------------------------------------------------------
//  ErrorLogWrite
//------------------------------------------------------------------------------
procedure TfrmMain.ErrorLogWrite(Msg: string);
var
  FileName : String;
  FileLog : string;
begin
  FileName := 'Log\Error_' + FormatDatetime('YYYYMMDD', now) + '.log';
  FileLog := FormatDateTime('YYYY-MM-DD HH:mm:ss ', Now()) + '>>' + Msg;
  LogWrite(FileName, FileLog);

  if (mmErrorLog.Lines.Count > 10) then mmErrorLog.Clear;

  mmErrorLog.Lines.Add(Msg);

//InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
  InsertPGMHist('RCP', 'E', 'ErrorLogWrite', '', '', 'PGM', '', '', Msg);
end;

//------------------------------------------------------------------------------
// Form Close Event
//------------------------------------------------------------------------------
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FrontPLCSocket.Active) then FrontPLCSocket.Close();
  if (RearPLCSocket.Active) then RearPLCSocket.Close();
  ExitProcess(0);
end;

//------------------------------------------------------------------------------
// Form Create Event
//------------------------------------------------------------------------------
procedure TfrmMain.FormCreate(Sender: TObject);
var
  Cap  : String;
  hogi : Integer;
begin

  Dm_MainLib.M_Info.UserCode := IniRead(INI_PATH, 'USERSETTING', 'UserCode', '');
  Dm_MainLib.M_Info.ActivePCName := SysGetComputerName; // PC Name
  Dm_MainLib.M_Info.ActivePCAddr := SysGetLocalIp(1);   // PC Ip-Address

  Cap := IniRead(INI_PATH, 'PROGRAM', 'ProgramName', '');
  if  findwindow(nil, pchar(cap)) <> 0 then
  begin
    Close;
    //-----------------------------------------------
    // 자신 프로그램을 죽이는 함수
    //-----------------------------------------------
    ExitProcess(0);
  end;
  Application.OnException := AppException ;

  (Sender as TForm).Caption := Cap ;
  lblUptime.Caption := FormatDatetime('YYYY/MM/DD HH:MM:SS', now());

  mmCommLog.Clear();
  mmErrorLog.Clear();
  PageControl.Pages[0].Show;

  // PLC 송신(읽기요구) 구분 플래그. 시작:0 -> PLC1_SC:1 -> PLC1_CV:2 -> PLC2_CV:3
  gCommandFlag := 0;

  Fillchar(gCVCR, sizeof(gCVCR), '0');
  Fillchar(gCVCW, sizeof(gCVCW), '0');
  FillChar(gSCCR, SizeOf(gSCCR), '0');
  FillChar(gSCCW, SizeOf(gSCCW), '0');

  FillChar(gOld_CV_Error_Code,Sizeof(gOld_CV_Error_Code),0);

  edtStep.Text := 'START';

  gCVRead := False;

  gLogwriteDBConnection := False;   //통신로그를 연속해서 찍지 않기
  gUf_GetCVCRead        := False;   //통신로그를 연속해서 찍지 않기
  gUf_GetSCRRead        := False;   //통신로그를 연속해서 찍지 않기
end;

//------------------------------------------------------------------------------
//  FillBuff : PLC로부터 읽어들인 값을 처리함. Device : PLC번호 (1, 2)
//------------------------------------------------------------------------------
procedure TfrmMain.FillBuff(Device: Integer);
var
  dataCount : Integer;
  blockCount : Integer;
  tmpStr : string;
  convStr : string;
  dataStr : AnsiString;
  i : Integer;
  bitWordCnt : Integer;
  WordCnt : Integer;
begin
  // EX) ACK 00 RSB 03 68000F0F0009 ETX

  // 연속 읽기에 대한 응답
  if (Copy(gWholePacket[Device], 2, 5) = '00RSB') then
  begin
    // 정상응답
    if (Copy(gWholePacket[Device], 1, 1) = ACK) then
    begin
     // ACK 00 RSB    04 123456789ABC ETX  Block 갯수가 없는 경우
     // ACK 00 RSB 01 04 123456789ABC ETX   Block 갯수가 있는 경우
//      blockcount가 있을 경우를 대비하여
//      blockCount := StrToInt('$' + Copy(gWholePacket[Device], 7, 2));
//      dataCount := StrToInt('$' + Copy(gWholePacket[Device], 9, 2));

      dataCount := StrToInt('$' + Copy(gWholePacket[Device], 7, 2));

      // CV 응답인 경우 (데이터갯수로 구분) cv: 2word 8글자, SC: 3word 12글자
      if(dataCount = 2) then
      begin
        // Bit 데이터 -> 2word 사용
        bitWordCnt := 2;

        // 변환해서 넣어줘야함
        tmpStr := Copy(gWholePacket[Device], 9, dataCount * 4);
        for i := 0 to bitWordCnt - 1 do
        begin
          convStr := StrHexToStrBin(Copy(tmpStr, (i * 4) + 1, 4)); // '1234' -> '0001 0010 0011 0100'
          //convStr := ReverseString(convStr);                       // '0001 0010 0011 0100' -> '0010 1100 0100 1000'
          dataStr := dataStr + convStr;
        end;

        // DB(Table:TC_CVCR)에 쓰기
        Uf_TableWirte_CVCR(Device, dataStr);

        // 변환한 dataStr 값을 버퍼에 넣음
        Fillchar(gCVCR[Device], sizeof(gCVCR[Device]), chr($00));
        StrMove(@gCVCR[Device].All, PAnsiChar(dataStr), Length(dataStr)); // StrMove참고:StrMove(@gSCCR.All[1], PChar(@gWholePacket1[9]), dataCount*2);
        CommLogWrite(Device, 'PLC#' + IntToStr(Device) + '_' + 'CV_' + 'Recv Convert[' + gCVCR[Device].All + ']');

        // 상태표시
        ShowPLCStatus(Device, 'CV');

        // Track체크 (화물 이동완료 되면 데이터 이동, 직진지시 끔)
        TrackingProcess_CV(Device);

        // 지시 설정 (화물有, 데이터有)
        ControlProcess_CV(Device);

        // 지시 상태 표시
        ShowCVWriteStatus(Device);

        // DB(Table:TC_CVCW)에 쓰기& PLC에 쓰기
        CVCW_Write(Device);

        // 프로그램 실행 후 최초 PLC2번까지 읽었을 경우.
        if (Device = 2) then
        begin
          gCVRead := True;
        end;
      end
      // SC 응답인 경우
      else if(dataCount = 3) then
      begin
        // Bit 데이터 -> 1word 사용
        bitWordCnt := 1;

        // 변환해서 넣어줘야함
        tmpStr := Copy(gWholePacket[Device], 9, dataCount * 4);
        for i := 0 to bitWordCnt - 1 do
        begin
          convStr := StrHexToStrBin(Copy(tmpStr, (i * 4) + 1, 4)); // '1234' -> '0001 0010 0011 0100'
          //convStr := ReverseString(convStr);                       // '0001 0010 0011 0100' -> '0010 1100 0100 1000'
          dataStr := dataStr + convStr;
        end;

        // Word 데이터 2Word 사용
        wordCnt := 2;
        for i := 1 to wordCnt do
        begin
          convStr := Copy(tmpStr, (i * 4) + 1, 4);
          dataStr := dataStr + convStr;
        end;

        // DB(Table:TC_SCCR)에 쓰기
        Uf_TableWirte_SCCR(Device, dataStr);

        // 변환한 dataStr 값을 버퍼에 넣음
        FillChar(gSCCR, SizeOf(gSCCR), chr($00));
        StrMove(@gSCCR.All, PAnsiChar(dataStr), Length(dataStr));  // StrMove참고:StrMove(@gSCCR.All[1], PChar(@gWholePacket1[9]), dataCount*2);
        CommLogWrite(Device, 'PLC#' + IntToStr(Device) + '_' + 'SC_' + 'Recv Convert[' + gSCCR.All + ']');

        // 상태표시
        ShowPLCStatus(Device, 'SC');

        // 지시 설정 (스태커 입출고지시)
        ControlProcess_SC;

        // 지시상태 표시
        ShowSCWriteStatus;

        // DB(Table:TC_CVCW)에 쓰기& PLC에 쓰기
        SCCW_Write;
      end;

    end
    // 비정상 응답
    else if (Copy(gWholePacket[Device], 1, 1) = NAK) then
    begin
      // NAK 00 RSB 1111 ETX  Block
      // 에러코드가 있는 경우
      if ((Length(Trim(gWholePacket[Device])) > 6) and
          (Length(Trim(gWholePacket[Device])) < 12)) then
      begin
        ErrorLogWrite('PLC NAK Recv [PLC#' + IntToStr(Device) + '_' + gWholePacket[Device] + ']');
      end
      else
      begin
        ErrorLogWrite('PLC NAK Error Recv [PLC#' + IntToStr(Device) + '_' + gWholePacket[Device]+ '] 에러코드 없음' );
      end;
    end;
  end
  // 연속 쓰기에 대한 응답
  else if (Copy(gWholePacket[Device], 2, 5) = '00WSB') then
  begin
    // 정상응답
    if (Copy(gWholePacket[Device], 1, 1) = ACK) then
    begin
      // ACK 00 WSB ETX  Block
      CommLogWrite(Device, 'PLC#' + IntToStr(Device) + '_' + 'Recv [' + gWholePacket[Device] + ']');
    end
    // 비정상 응답
    else if (Copy(gWholePacket[Device], 1, 1) = NAK) then
    begin
      // NAK 00 WSB 1111 ETX  Block
      // 에러코드가 있는 경우
      if ((Length(Trim(gWholePacket[Device])) > 6) and
          (Length(Trim(gWholePacket[Device])) < 12)) then
      begin
        ErrorLogWrite('PLC NAK Recv [PLC#' + IntToStr(Device) + '_' + gWholePacket[Device] + ']');
      end
      else
      begin
        ErrorLogWrite('PLC NAK Error Recv [PLC#' + IntToStr(Device) + '_' + gWholePacket[Device]+ '] 에러코드 없음' );
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
//  LogFileDelete : 로그파일 자동삭제
//------------------------------------------------------------------------------
procedure TfrmMain.LogFileDelete;
var
  i : integer ;
  DeleteDir : String ;
begin
  DeleteDir := '.\Log\';
  if (DeleteDir <> '') and
     (DeleteOption in [0..2])then
  begin
    DeleteRecodingFile(DeleteDir, DeleteOption);
    InsertPGMHist('[Main]', 'N', 'LogFileDelete', '', 'Automatically Delete Log ['+IntToStr(DeleteOption)+']', 'PGM', '', '', '');
  end;
end;

//------------------------------------------------------------------------------
//  DeleteRecodingFile
//------------------------------------------------------------------------------
function TfrmMain.DeleteRecodingFile(fileDir: String; iOption: integer): Boolean;
var
  FoundFile : Integer;
  SearchRec : TSearchRec;
  stLogDir  : string;
  Sdate : TDateTime;
begin
  Sdate :=  Now();
  result := true;
  stLogDir := fileDir + '*';
  try
    FoundFile := findfirst(stLogDir,faAnyFile,SearchRec);
    while FoundFile = 0 do
    begin
      Application.ProcessMessages;
      case iOption of
       0 : if (Sdate - FileDateToDateTime(SearchRec.Time)) >= 30 then
           begin
             if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
             MinDeleteFile(fileDir + SearchRec.name, true); //
           end;
       1 : if (Sdate - FileDateToDateTime(SearchRec.Time)) >= 7 then
           begin
             if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
             MinDeleteFile(fileDir + SearchRec.name, true); //
           end;
       2 : if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
           MinDeleteFile(fileDir + SearchRec.name, true); //
      end;
      FoundFile := findnext(SearchRec);
    end;
    FindClose(SearchRec);
  except
    FindClose(SearchRec);
    result := false;
  end;
end;

//------------------------------------------------------------------------------
//  MinDeleteFile
//------------------------------------------------------------------------------
function TfrmMain.MinDeleteFile(const DirName : string;
const UseRecycleBin: Boolean): Boolean;
var
  SHFileOpStruct: TSHFileOpStruct;
  DirBuf: array [0..255] of char;
  Directory: string;
begin
  try
    Directory := ExcludeTrailingPathDelimiter(DirName);

    Fillchar(SHFileOpStruct, sizeof(SHFileOpStruct), 0);
    FillChar(DirBuf, sizeof(DirBuf), 0);
    StrPCopy(DirBuf, Directory);

    with SHFileOpStruct do
    begin
      Wnd := 0;
      pFrom := @DirBuf;
      wFunc := FO_DELETE;
      if UseRecycleBin = True then
      fFlags := FOF_NOCONFIRMATION or FOF_SILENT;
    end;
    Result := (SHFileOperation(SHFileOpStruct)=0);
  except
    Result := False;
  end;
end;

//==============================================================================
// 로그자동 삭제 타이머
//==============================================================================
procedure TfrmMain.tmrLogFileCheckTimer(Sender: TObject);
begin
  try
    tmrLogFileCheck.Enabled := False ;
    LogFileDelete ;
  finally
    tmrLogFileCheck.Enabled := True ;
  end;
end;

//------------------------------------------------------------------------------
//  PLCSocketConnect Event
//------------------------------------------------------------------------------
procedure TfrmMain.PLCSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
var
  PLC_Socket : TClientSocket;
  PLC_No : string;
  shpStatus : TShape;
begin
  PLC_Socket := Sender as TClientSocket;
  PLC_No := IntToStr(PLC_Socket.Tag);
  shpStatus := Self.FindComponent('ShpMFCInterfaceConn' + PLC_No) as TShape;

  if (PLC_Socket.Active) then
  begin
    CommLogWrite(StrToInt(PLC_No), 'Connected to PLC#' + PLC_No + '[' + PLC_Socket.Address + ':' + IntToStr(PLC_Socket.Port) + ']');
    shpStatus.Brush.Color := CONN_STATUS_COLOR[1];
  end
  else
  begin
    ErrorLogWrite('Connect Failed to PLC#' + PLC_No + '[' + PLC_Socket.Address + ':' + IntToStr(PLC_Socket.Port) + ']');
    shpStatus.Brush.Color := CONN_STATUS_COLOR[0];
  end;
end;

//------------------------------------------------------------------------------
//  PLCSocketDisconnect Event
//------------------------------------------------------------------------------
procedure TfrmMain.PLCSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
var
  PLC_Socket : TClientSocket;
  PLC_No : string;
  shpStatus : TShape;
begin
  PLC_Socket := Sender as TClientSocket;
  PLC_No := IntToStr(PLC_Socket.Tag);
  shpStatus := Self.FindComponent('ShpMFCInterfaceConn' + PLC_No) as TShape;

  if (PLC_Socket.Active) then
  begin
    CommLogWrite(StrToInt(PLC_No), 'Disconnected Failed to PLC#' + PLC_No + '[' + PLC_Socket.Address + ':' + IntToStr(PLC_Socket.Port) + ']');
    shpStatus.Brush.Color := CONN_STATUS_COLOR[1];
  end
  else
  begin
    CommLogWrite(StrToInt(PLC_No), 'Disconnected to PLC#' + PLC_No + '[' + PLC_Socket.Address + ':' + IntToStr(PLC_Socket.Port) + ']');
    shpStatus.Brush.Color := CONN_STATUS_COLOR[0];
  end;
end;

//------------------------------------------------------------------------------
//  PLCSocketError Event
//------------------------------------------------------------------------------
procedure TfrmMain.PLCSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  PLC_Socket : TClientSocket;
  PLC_No : string;
  shpStatus : TShape;
begin
  PLC_Socket := Sender as TClientSocket;
  PLC_No := IntToStr(PLC_Socket.Tag);
  shpStatus := Self.FindComponent('ShpMFCInterfaceConn' + PLC_No) as TShape;

  CommLogWrite(StrToInt(PLC_No), 'Error PLC#' + PLC_No + '[' + PLC_Socket.Address + ':' + IntToStr(PLC_Socket.Port) + '] ErrorCode:' + IntToStr(ErrorCode));
  shpStatus.Brush.Color := CONN_STATUS_COLOR[0];
end;

//------------------------------------------------------------------------------
//  PLCSocketRead Event
//------------------------------------------------------------------------------
procedure TfrmMain.PLCSocketRead(Sender: TObject; Socket: TCustomWinSocket);
var
  PLC_Socket : TClientSocket;
  PLC_No : Integer;
  i : Integer;
  SockRecvLength : Array [1..2] of Integer;
  SockRecvBuff : Array [1..2, 1..1024] of AnsiChar;
begin
  PLC_Socket := Sender as TClientSocket;
  PLC_No := PLC_Socket.Tag;
  FillChar(SockRecvBuff[PLC_No], SizeOf(SockRecvBuff[PLC_NO]), chr($00));

  // gChrRecvBuff : 1024 byte [1024 AnsiChar]
  // Socket Read
  SockRecvLength[PLC_No] := Socket.ReceiveBuf(SockRecvBuff[PLC_No], Socket.ReceiveLength);

  // i : SockRecvBuff Index
  i := 1;
  while(i <= SockRecvLength[PLC_No]) do
  begin
    // read data에 대한 처리
    // data=ACK123456890ETX. data=12211ACK123456789ETX123

    // 데이터 시작
    if ((SockRecvBuff[PLC_No][i] = ACK) or (SockRecvBuff[PLC_No][i] = NAK)) then
    begin
      // 전체 패킷 버퍼 초기화. gWholePacket1 : 1024 byte [1024 AnsiChar]
      FillChar(gWholePacket[PLC_No], SizeOf(gWholePacket[PLC_No]), chr($00));
      gIdx[PLC_No] := 1;
      gWholePacket[PLC_No][gIdx[PLC_No]] := SockRecvBuff[PLC_No][i];

      // 데이터 시작점 ACK or NAK 수신 플래그 True 설정
      gSTXReceived[PLC_No] := True;

      Inc(gIdx[PLC_No]);
    end
    // 데이터 끝
    else if (SockRecvBuff[PLC_No][i] = ETX) then
    begin
      // 데이터 시작점을 받은 경우 전체패킷에 ETX까지 프레임 완성
      if (gSTXReceived[PLC_No]) then
      begin
        gWholePacket[PLC_No][gIdx[PLC_No]] := SockRecvBuff[PLC_No][i];

        // 수신 데이터 로그
        CommLogWrite(PLC_No, 'PLC#' + IntToStr(PLC_No) + '_' + 'Recv[' + Copy(gWholePacket[PLC_No], 1, SockRecvLength[PLC_No])  + ']');

        // 프레임이 완성되었으므로, 시작점 수신 플래그 초기화 (False)
        gSTXReceived[PLC_No] := False;

        // SCC 또는 CVC 버퍼에 넣음
        FillBuff(PLC_No);
      end;
    end
    // 데이터 중간
    else
    begin
      // 데이터 시작점(ACK or NAK)을 받았으면 데이터를 쌓음
      if (gSTXReceived[PLC_No]) then
      begin
        gWholePacket[PLC_No][gIdx[PLC_No]] := SockRecvBuff[PLC_No][i];
        Inc(gIdx[PLC_No]);
      end
    end;

    Inc(i);
  end;


end;


//------------------------------------------------------------------------------
//  PLCSocketWrite Event
//------------------------------------------------------------------------------
procedure TfrmMain.PLCSocketWrite(Sender: TObject; Socket: TCustomWinSocket);
begin
  ledSend.State := lsOn;
end;


//------------------------------------------------------------------------------
//  PLCWrite : Device: 1:PLC1, 2:PLC2. Machine: SC, CV. Data: data.
//------------------------------------------------------------------------------
procedure TfrmMain.PLCWrite(Device: Integer; Machine : string; Data: AnsiString);
var
  PLC_Socket : TClientSocket;
begin

  try
    case Device of
      1 : PLC_Socket := FrontPLCSocket;
      2 : PLC_Socket := RearPLCSocket;
    end;

    if (PLC_Socket.Socket.SendText(Data) > 0) then
    begin
      CommLogWrite(Device, 'PLC#' + IntToStr(Device) + '_' + Machine + ' Send[' + Data + ']');
    end
    else
    begin
      CommLogWrite(Device, 'PLC#' + IntToStr(Device) + '_' + Machine + ' Send Error [' + Data + ']');
    end;
  except
    on e : Exception do
    begin
      ErrorLogWrite('PLCWrite Error [PLC#' + IntToStr(Device) + '_' + Machine+ ':' + Data + ']');
    end;
  end;

end;

//------------------------------------------------------------------------------
//  SCCW_Write : TC_CVCW에 기록 및 PLC전송
//------------------------------------------------------------------------------
procedure TfrmMain.SCCW_Write;
var
  dataStr : AnsiString;
begin

  // 자동모드가 아니면 Exit
  if (gSCCR.SC[1].Auto_Mode = '0') or
     (rgSC.ItemIndex = 1) then
  begin
    Exit;
  end;

  // bit 데이터
  dataStr := Copy(gSCCW.SC[1].All, 0, 16); // 00000000 00000000

  // 뒷쪽 Hex 붙이기
  dataStr := dataStr + Copy(gSCCW.SC[1].Bay, 1, 2);
  dataStr := dataStr + Copy(gSCCW.SC[1].Level, 1, 2);

  // DB에 쓰기
  Uf_TableWirte_SCCW(1, dataStr);

  // original
  dataStr := Copy(gSCCW.SC[1].All, 0, 16); // 00000000 00000000
  // reverse
  //dataStr := ReverseString(dataStr);
  // bin to hex
  dataStr := StrBinToStrHex(dataStr);
  dataStr := dataStr + Copy(gSCCW.SC[1].Bay, 1, 2);
  dataStr := dataStr + Copy(gSCCW.SC[1].Level, 1, 2);

  // PLC에 쓰기
  dataStr := '00WSB' + '05' + '%MW50' + '02' + dataStr;
  PLCWrite(1, 'SC', dataStr);

end;

//------------------------------------------------------------------------------
//  SC_JOB_Process : PLC의 상태를 보여준다. (Device: 1, 2 PLC번호)
//------------------------------------------------------------------------------
procedure TfrmMain.SC_JOB_Process;
var
  Job_No : Integer;
  Device : Integer;
begin

  //** 스태커 입고대 포킹완료 **// (입고대에서 뜸, CV->SC)
  if (gSCCR.SC[1].Job_Standby       = '0') and
     (gSCCR.SC[1].Storage_In_Ing    = '1') and
     (gSCCR.SC[1].Storage_Out_Ing   = '0') and
     (gSCCR.SC[1].In_St_Fork_Finish = '1') and
     (gSCCR.SC[1].Pallet_Exist      = '1') then
  begin
    edtStep.Text := 'ORDER - 입고대포킹완료';
    // 입고대(CV7)에서 SC로 데이터 이동
    Device := Uf_GetOrderPLCNo('입고', 'SC적재');
    Job_No := Uf_GetOrderJobNo(Device, '입고', 'SC적재');
    Uf_SCDataMove(Device, '입고');

    // 지시상태 변경 'SC적재'->'SC하역'
    Uf_SetOrder(IntToStr(Job_No), 'STATUS'  , 'SC하역');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_MACH', 'SC');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', '100');
  end
  //** 스태커 입고작업 완료 **// (랙에 넣음, 재고처리는 트리거로 할 예정)
  else if (gSCCR.SC[1].Job_Standby     = '0') and
          (gSCCR.SC[1].Storage_In_Ing  = '0') and
          (gSCCR.SC[1].Storage_Out_Ing = '0') and
          (gSCCR.SC[1].Rack_In_Finish  = '1') and
          (gSCCR.SC[1].Pallet_Exist    = '0') then
  begin
    edtStep.Text := 'FINISH - 랙입고완료';

    // 작업 가져옴
    Device := Uf_GetOrderPLCNo('입고', 'SC하역');
    Job_No := Uf_GetOrderJobNo(Device, '입고', 'SC하역');

    // 지시상태 변경 'SC하역'->'SC완료'
    Uf_SetOrder(IntToStr(Job_No), 'STATUS' , 'SC완료');
    Uf_SetOrder(IntToStr(Job_No), 'IN_DATE', '');
    Uf_SetOrder(IntToStr(Job_No), 'END_YN' , 'Y');

    // 지시 삭제
    Uf_DeleteOrder(IntToStr(Job_No));

    // 트랙데이터 삭제
    Uf_TrackDataSet('', 0, 1, 100);

    // 지시 초기화
    Fillchar(gSCCW, sizeof(gSCCW), '0');
  end
  //** 스태커 출고랙 포킹완료 **// (랙에서 꺼냄)
  else if (gSCCR.SC[1].Job_Standby     = '0') and
          (gSCCR.SC[1].Storage_In_Ing  = '0') and
          (gSCCR.SC[1].Storage_Out_Ing = '1') and
          (gSCCR.SC[1].Rack_Out_Finish = '1') and
          (gSCCR.SC[1].Pallet_Exist    = '1') then
  begin
    edtStep.Text := 'ORDER - 랙포킹완료';
    // 작업 가져옴
    Device := Uf_GetOrderPLCNo('출고', 'SC적재');
    Job_No := Uf_GetOrderJobNo(Device, '출고', 'SC적재');

    // SC 트랙 데이터 업데이트
    Uf_TrackDataSet(IntToStr(Job_No), 1, 1, 100);
    Uf_SetOrder(IntToStr(Job_No), 'STATUS'  , 'SC하역');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_MACH', 'SC');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', '100');
  end
  //** 스태커 출고작업 완료 **// (출고대에 내려놓음 SC->CV)
  else if (gSCCR.SC[1].Job_Standby        = '0') and
          (gSCCR.SC[1].Storage_In_Ing     = '0') and
          (gSCCR.SC[1].Storage_Out_Ing    = '0') and
          (gSCCR.SC[1].Out_St_Fork_Finish = '1') and
          (gSCCR.SC[1].Pallet_Exist       = '0') then
  begin
    edtStep.Text := 'FINISH - 출고대 포킹완료';
    // 작업 가져옴
    Device := Uf_GetOrderPLCNo(gInOutFlag, 'SC하역');
    Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'SC하역');

    // 지시상태 변경 'SC지시'->'SC완료'
    Uf_SetOrder(IntToStr(Job_No), 'STATUS'  , 'SC완료');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_MACH', 'CV');
    Uf_SetOrder(IntToStr(Job_No), 'OT_DATE' , ''); //OT_DATE, IN_DATE는 구현 참고. 값=CONVERT([varchar](max),getdate(),(21))

    // CV 트랙 데이터 업데이트
    Uf_TrackDataSet(IntToStr(Job_No), 1, Device, 1);
    Uf_TrackDataSet('', 0, 1, 100);

    // 지시 초기화
    Fillchar(gSCCW, sizeof(gSCCW), '0');
  end;
end;

//------------------------------------------------------------------------------
//  ShowPLCStatus : PLC의 상태를 보여준다. (Device: 1, 2 PLC번호)
//------------------------------------------------------------------------------
procedure TfrmMain.ShowPLCStatus(Device: Integer; Machine: string);
var
  ErrCode : Integer;
  Bay : Integer;
  Level : Integer;
begin
  case Device of
    1:
    begin
      if (Machine = 'SC') then
      begin
        cbSC_1.Checked  := Boolean(StrToIntDef(gSCCR.SC[1].Manual_Mode, 0));
        cbSC_2.Checked  := Boolean(StrToIntDef(gSCCR.SC[1].Auto_Mode, 0));
        cbSC_3.Checked  := Boolean(StrToIntDef(gSCCR.SC[1].Home_Position, 0));
        cbSC_4.Checked  := Boolean(StrToIntDef(gSCCR.SC[1].Home_Returning, 0));
        cbSC_5.Checked  := Boolean(StrToIntDef(gSCCR.SC[1].Job_Standby, 0));
        cbSC_6.Checked  := Boolean(StrToIntDef(gSCCR.SC[1].Reserve1, 0));
        cbSC_7.Checked  := Boolean(StrToIntDef(gSCCR.SC[1].Blank_Out, 0));
        cbSC_8.Checked  := Boolean(StrToIntDef(gSCCR.SC[1].Twin_In, 0));
        cbSC_9.Checked  := Boolean(StrToIntDef(gSCCR.SC[1].Pallet_Exist, 0));
        cbSC_10.Checked := Boolean(StrToIntDef(gSCCR.SC[1].Rack_In_Finish, 0));
        cbSC_11.Checked := Boolean(StrToIntDef(gSCCR.SC[1].In_St_Fork_Finish, 0));
        cbSC_12.Checked := Boolean(StrToIntDef(gSCCR.SC[1].Rack_Out_Finish, 0));
        cbSC_13.Checked := Boolean(StrToIntDef(gSCCR.SC[1].Out_St_Fork_Finish, 0));
        cbSC_14.Checked := Boolean(StrToIntDef(gSCCR.SC[1].Error, 0));
        cbSC_15.Checked := Boolean(StrToIntDef(gSCCR.SC[1].Storage_In_Ing, 0));
        cbSC_16.Checked := Boolean(StrToIntDef(gSCCR.SC[1].Storage_Out_Ing, 0));

        ErrCode := Data16To10(gSCCR.SC[1].Error_Code[1]) * 16 +
                   Data16To10(gSCCR.SC[1].Error_Code[2]);
        edtSC_Error.Text := IntToStr(ErrCode);

        Bay := Data16To10(gSCCR.SC[1].Bay[1]) * 16 +
               Data16To10(gSCCR.SC[1].Bay[2]);
        Level := Data16To10(gSCCR.SC[1].Level[1]) * 16 +
                 Data16To10(gSCCR.SC[1].Level[2]);
        edtSC_Loc.Text := IntToStr(Bay) + '-' + IntToStr(Level);
      end
      else if (Machine = 'CV') then
      begin
        cbCV1_1.Checked  := Boolean(StrToIntDef(gCVCR[1].Hogi[1].AutoMode, 0));
        cbCV1_2.Checked  := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Exist[1], 0));
        cbCV1_3.Checked  := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Exist[2], 0));
        cbCV1_4.Checked  := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Exist[3], 0));
        cbCV1_5.Checked  := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Exist[4], 0));
        cbCV1_6.Checked  := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Exist[5], 0));
        cbCV1_7.Checked  := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Exist[6], 0));
        cbCV1_8.Checked  := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Exist[7], 0));
        cbCV1_9.Checked  := Boolean(StrToIntDef(gCVCR[1].Hogi[1].None1, 0));
        cbCV1_10.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].JobDone, 0));
        cbCV1_11.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].ST1_OUT_READY, 0));
        cbCV1_12.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].ST2_IN_READY, 0));
        cbCV1_13.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].None2[1], 0));
        cbCV1_14.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].None2[2], 0));
        cbCV1_15.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].None2[3], 0));
        cbCV1_16.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].None2[4], 0));
        cbCV1_17.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].StraightFinish[1], 0));
        cbCV1_18.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].StraightFinish[2], 0));
        cbCV1_19.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].StraightFinish[3], 0));
        cbCV1_20.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].StraightFinish[4], 0));
        cbCV1_21.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].StraightFinish[5], 0));
        cbCV1_22.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].StraightFinish[6], 0));
        cbCV1_23.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].None3[1], 0));
        cbCV1_24.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].None3[2], 0));
        cbCV1_25.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Error[1], 0));
        cbCV1_26.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Error[2], 0));
        cbCV1_27.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Error[3], 0));
        cbCV1_28.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Error[4], 0));
        cbCV1_29.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Error[5], 0));
        cbCV1_30.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].Error[6], 0));
        cbCV1_31.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].None4[1], 0));
        cbCV1_32.Checked := Boolean(StrToIntDef(gCVCR[1].Hogi[1].None4[2], 0));
      end;
    end;
    2:
    begin
      if (Machine = 'CV') then
      begin
        cbCV2_1.Checked  := Boolean(StrToIntDef(gCVCR[2].Hogi[1].AutoMode, 0));
        cbCV2_2.Checked  := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Exist[1], 0));
        cbCV2_3.Checked  := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Exist[2], 0));
        cbCV2_4.Checked  := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Exist[3], 0));
        cbCV2_5.Checked  := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Exist[4], 0));
        cbCV2_6.Checked  := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Exist[5], 0));
        cbCV2_7.Checked  := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Exist[6], 0));
        cbCV2_8.Checked  := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Exist[7], 0));
        cbCV2_9.Checked  := Boolean(StrToIntDef(gCVCR[2].Hogi[1].None1, 0));
        cbCV2_10.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].JobDone, 0));
        cbCV2_11.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].ST1_OUT_READY, 0));
        cbCV2_12.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].ST2_IN_READY, 0));
        cbCV2_13.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].None2[1], 0));
        cbCV2_14.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].None2[2], 0));
        cbCV2_15.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].None2[3], 0));
        cbCV2_16.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].None2[4], 0));
        cbCV2_17.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].StraightFinish[1], 0));
        cbCV2_18.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].StraightFinish[2], 0));
        cbCV2_19.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].StraightFinish[3], 0));
        cbCV2_20.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].StraightFinish[4], 0));
        cbCV2_21.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].StraightFinish[5], 0));
        cbCV2_22.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].StraightFinish[6], 0));
        cbCV2_23.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].None3[1], 0));
        cbCV2_24.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].None3[2], 0));
        cbCV2_25.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Error[1], 0));
        cbCV2_26.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Error[2], 0));
        cbCV2_27.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Error[3], 0));
        cbCV2_28.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Error[4], 0));
        cbCV2_29.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Error[5], 0));
        cbCV2_30.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].Error[6], 0));
        cbCV2_31.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].None4[1], 0));
        cbCV2_32.Checked := Boolean(StrToIntDef(gCVCR[2].Hogi[1].None4[2], 0));
      end;
    end;
  end;

end;

//------------------------------------------------------------------------------
//  ShowCVWriteStatus 컨베이어 지시상태표시 : Device: PLC_No 1,2.
//------------------------------------------------------------------------------
procedure TfrmMain.ShowCVWriteStatus(Device: Integer);
var
  PLC_NO : String;
  CheckBox : TCheckBox;
  i : Integer;
begin
  PLC_NO := IntToStr(Device);
  for i := 1 to 6 do
  begin
    CheckBox := (FindComponent('cbCV' + PLC_NO + '_go' + IntToStr(i)) as TCheckBox);
    CheckBox.Checked := Boolean(StrToIntDef(gCVCW[Device].Hogi[1].StriOrder[i], 0));
  end;
end;

//------------------------------------------------------------------------------
//  ShowSCWriteStatus: 스태커 지시상태 표시
//------------------------------------------------------------------------------
procedure TfrmMain.ShowSCWriteStatus;
begin
  cbSC_Write_1.Checked := Boolean(StrToIntDef(gSCCW.SC[1].Storage_In, 0));
  cbSC_Write_2.Checked := Boolean(StrToIntDef(gSCCW.SC[1].Storage_Out, 0));
  cbSC_Write_3.Checked := Boolean(StrToIntDef(gSCCW.SC[1].Home_Return, 0));
  cbSC_Write_4.Checked := Boolean(StrToIntDef(gSCCW.SC[1].MachineAction, 0));
  cbSC_Write_5.Checked := Boolean(StrToIntDef(gSCCW.SC[1].None1[0], 0));
  cbSC_Write_6.Checked := Boolean(StrToIntDef(gSCCW.SC[1].None1[1], 0));
  cbSC_Write_7.Checked := Boolean(StrToIntDef(gSCCW.SC[1].Odd_Bay, 0));
  cbSC_Write_8.Checked := Boolean(StrToIntDef(gSCCW.SC[1].Even_Bay, 0));
  cbSC_Write_9.Checked := Boolean(StrToIntDef(gSCCW.SC[1].Station, 0));

  edtSC_Write_Bay.Text   := gSCCW.SC[1].Bay;
  edtSC_Write_Level.Text := gSCCW.SC[1].Level;

end;

//------------------------------------------------------------------------------
//  tmrConnectDBTimer : Connection Check
//------------------------------------------------------------------------------
procedure TfrmMain.tmrConnectDBTimer(Sender: TObject);
begin
  tmrConnectDB.Enabled := false;

  // DB에 연결되어있지 않은 경우 DB 접속
  if (not Dm_MainLib.MainDatabase.Connected) then
  begin
    ShpDatabaseConn.Brush.Color := CONN_STATUS_COLOR[0];
    if (Uf_DBConnection) then
    begin
      ShpDatabaseConn.Brush.Color := CONN_STATUS_COLOR[1];
    end;
  end
  // 연결되어 있는 경우
  else
  begin
    ShpDatabaseConn.Brush.Color := CONN_STATUS_COLOR[1];
  end;

  tmrConnectDB.Enabled := true;
end;

//------------------------------------------------------------------------------
// tmrEPLTOutTimer : 공파레트 자동출고 지시
//------------------------------------------------------------------------------
procedure TfrmMain.tmrEPLTOutTimer(Sender: TObject);
var
  i, j, CargoCnt: Integer;
  WhereStr : String;
begin

  // PLC 2번 컨베어까지 데이터를 읽었을 경우에만 실행하도록 하기 위함
  if (gCVRead = false ) then Exit;

  // 공팔레트 출고지시를 생성하기 위한 과정 임. 이후 출고는 일반 출고와 같음.
  for i := 1 to 2 do
  begin
    // 1. PLC별 (전면 후면) 공팔레트 자동 출고 요청 확인
    if (Uf_GetCurrent('AUTO_OUT_EPLT', 'OPTION' + IntToStr(i)) = 'False') then Continue;

    CargoCnt := 0;
    // 2. 컨베어 1~4 화물 갯수 확인
    for j := 1 to 4 do
    begin
      if (gCVCR[i].Hogi[1].Exist[j] = '1') then Inc(CargoCnt);
    end;

    // 2.1 화물 갯수가 2개 이상이면 X
    if (CargoCnt >= 2) then Continue;

    // 3. 공팔렛트 출고 작업 갯수 확인. 2개 이상이면 X
    WhereStr := ' AND PLC_NO   = ' + QuotedStr(IntToStr(i)) +
                ' AND ORD_IO   = ' + QuotedStr('출고') +
                ' AND ORD_TYPE = ' + QuotedStr('파레트출고');
    if(Uf_GetOrderCount(WhereStr) >= 2) then Continue;

    // 위 조건들을 통과하면 공팔렛트출고지시를 만듦. (2개 만듦)
    for j := 1 to 2 do
    begin
      InsertEPLT_ORDER('D', 'EPLT', IntToStr(i), '1');
    end;
  end;

end;

//------------------------------------------------------------------------------
// tmrMainTimer : 통신 Timer Event
//------------------------------------------------------------------------------
procedure TfrmMain.tmrMainTimer(Sender: TObject);
var
  dataStr : string;
begin
  tmrMain.Enabled := False;
  ledSend.State := lsOff;

  dataStr := '';
  // 첫 실행시0
  // 0->1->2->3->0 ...
  if gCommandFlag = 3 then gCommandFlag := 0;

  gCommandFlag := gCommandFlag + 1;

  // 1 : Front PLC CV
  // 2 : Rear PLC CV
  // 3 : Front PLC SC

  case gCommandFlag of
    1 :
    begin
      if (not FrontPLCSocket.Active) then
      begin
        CommLogWrite(1, 'FrontPLCSocket is not activated');
      end
      else
      begin
        // ENQ + data + EOT
        // 연속읽기 요구 : 국번(00) + RSB + (변수길이) + 변수명 + 읽을워드수
        dataStr := ENQ + '00'+ 'RSB'+'07'+'%MW2952'+'02' + EOT;
        PLCWrite(1, 'CV', dataStr);
      end;
    end;
    2 :
    begin
      if (not FrontPLCSocket.Active) then
      begin
        CommLogWrite(1, 'FrontPLCSocket is not activated');
      end
      else
      begin
        // ENQ + data + EOT
        // 연속읽기 요구 : 국번(00) + RSB + (변수길이) + 변수명 + 읽을워드수
        dataStr := ENQ + '00'+ 'RSB'+'07'+'%MW2952'+'02' + EOT;
        PLCWrite(2, 'CV', dataStr);
      end;
    end;
    3 :
    begin
      if (not RearPLCSocket.Active) then
      begin
        CommLogWrite(2, 'RearPLCSocket is not activated');
      end
      else
      begin
        // ENQ + data + EOT
        // 연속읽기 요구 : 국번(00) + RSB + (변수길이) + 변수명 + 읽을워드수
        dataStr := ENQ + '00'+ 'RSB'+'05'+'%MW52'+'03' + EOT;
        PLCWrite(1, 'SC', dataStr);
      end;
    end;
  end;

  tmrMain.Enabled := True;
end;

//------------------------------------------------------------------------------
//  tmrServerTimer : 서버 접속 확인 타이머
//------------------------------------------------------------------------------
procedure TfrmMain.tmrServerTimer(Sender: TObject);
begin
  if (not FrontPLCSocket.Active) then
  begin
    btnComm.Caption := '통신시작';
    ShpMFCInterfaceConn1.Brush.Color := CONN_STATUS_COLOR[0];
    FrontPLCSocket.Open;
  end;

  if (not RearPLCSocket.Active) then
  begin
    btnComm.Caption := '통신시작';
    ShpMFCInterfaceConn2.Brush.Color := CONN_STATUS_COLOR[0];
    RearPLCSocket.Open;
  end;

  if (FrontPLCSocket.Active and RearPLCSocket.Active) then
  begin
    btnComm.Caption := '통신멈춤';
    ShpMFCInterfaceConn1.Brush.Color := CONN_STATUS_COLOR[1];
    ShpMFCInterfaceConn2.Brush.Color := CONN_STATUS_COLOR[1];
  end;

end;

//------------------------------------------------------------------------------
//  tmrUPD_ORDSEQSELTimer : TT_ORDER의 ORD_SEQ_SEL이 하나 선택되도록 업데이트 해주는 프로시저 호출
//------------------------------------------------------------------------------
procedure TfrmMain.tmrUPD_ORDSEQSELTimer(Sender: TObject);
begin
  tmrUPD_ORDSEQSEL.Enabled := False;

  Uf_UpdateOrdSeq();

  tmrUPD_ORDSEQSEL.Enabled := True;
end;

//------------------------------------------------------------------------------
//  TrackingProcess_CV : Device : PLC 1 or 2 , 컨베이어 트랙킹처리
//------------------------------------------------------------------------------
procedure TfrmMain.TrackingProcess_CV(Device: Integer);
var
  Job_No : Integer;
begin
  // 자동모드가 아닌 경우 Exit
  if (gCVCR[Device].Hogi[1].AutoMode = '0') or
     (rgCV.ItemIndex = 1) then
  begin
    Exit;
  end;

  // CV 1->2 이동 완료처리 : 1->2 데이터 이동
  if (gCVCR[Device].Hogi[1].StraightFinish[1] = '1') and
     (gCVCR[Device].Hogi[1].Exist[2] = '1') and
     (gCVCR[Device].Hogi[1].Error[1] = '0') and
     (Uf_TrackDataCheck(Device, 1) = True ) and
     (Uf_TrackDataCheck(Device, 2) = False )then
  begin
    // CV1 Data move to CV2
    Uf_TrackDBMove(Device, 2);

    // TT_ORDER.NOW_SITE 변경
    Job_No := Uf_TrackGetJobNo(Device, 2);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '2');

    // CV1 직진지시 OFF
    gCVCW[Device].Hogi[1].StriOrder[1] := '0';
  end;
  // CV 2->3 이동완료처리 : 2->3 데이터 이동
  if (gCVCR[Device].Hogi[1].StraightFinish[2] = '1') and
     (gCVCR[Device].Hogi[1].Exist[3] = '1') and
     (gCVCR[Device].Hogi[1].Error[2] = '0') and
     (Uf_TrackDataCheck(Device, 2) = True ) and
     (Uf_TrackDataCheck(Device, 3) = False ) then
  begin
    // CV2 Data move to CV3
    Uf_TrackDBMove(Device, 3);

    // TT_ORDER.NOW_SITE 변경
    Job_No := Uf_TrackGetJobNo(Device, 3);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '3');

    // CV2 직진지시 OFF
    gCVCW[Device].Hogi[1].StriOrder[2] := '0';
  end;
  // CV 3->4 이동완료처리 : 3->4 데이터 이동 (출고 완료)
  if (gCVCR[Device].Hogi[1].StraightFinish[3] = '1') and
     (gCVCR[Device].Hogi[1].Exist[4] = '1') and
     (gCVCR[Device].Hogi[1].Error[3] = '0') and
     (Uf_TrackDataCheck(Device, 3) = True ) and
     (Uf_TrackDataCheck(Device, 4) = False )then
  begin
    // CV3 Data move to CV4
    Uf_TrackDBMove(Device, 4);

    // 출고 완료 처리
    Job_No := Uf_TrackGetJobNo(Device, 4);
    Uf_SetOrder(IntToStr(Job_No), 'STATUS', 'CV완료');
    Uf_SetOrder(IntToStr(Job_No), 'END_YN', 'Y');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '4');

    // 파레트출고일 때에만 출고 작업완료 표시벨 소등
    if (Uf_GetOrder(IntToStr(Job_No), 'ORD_TYPE') = '파레트출고') then
    begin
      gCVCW[Device].Hogi[1].CompleteBell := '0';
    end
    // 부분출고, 품목출고일 때에는 출고작업완료 표시벨 점등
    else
    begin
      gCVCW[Device].Hogi[1].CompleteBell := '1';
    end;

    // CV3 직진지시 OFF
    gCVCW[Device].Hogi[1].StriOrder[3] := '0';
  end;
  // CV 4->5 이동완료처리 : 4->5 데이터이동
  if (gCVCR[Device].Hogi[1].StraightFinish[4] = '1') and
     (gCVCR[Device].Hogi[1].Exist[5] = '1') and
     (gCVCR[Device].Hogi[1].Error[4] = '0') and
     (Uf_TrackDataCheck(Device, 4) = True ) and
     (Uf_TrackDataCheck(Device, 5) = False ) then
  begin
    // CV4 Data move to CV5
    Uf_TrackDBMove(Device, 5);

    // TT_ORDER.NOW_SITE 변경
    Job_No := Uf_TrackGetJobNo(Device, 5);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '5');

    // CV4 직진지시 OFF
    gCVCW[Device].Hogi[1].StriOrder[4] := '0';
  end;
  // CV 5->6 이동완료처리 : 5->6 데이터이동
  if (gCVCR[Device].Hogi[1].StraightFinish[5] = '1') and
     (gCVCR[Device].Hogi[1].Exist[6] = '1') and
     (gCVCR[Device].Hogi[1].Error[5] = '0') and
     (Uf_TrackDataCheck(Device, 5) = True ) and
     (Uf_TrackDataCheck(Device, 6) = False ) then
  begin
    // CV5 Data move to CV6
    Uf_TrackDBMove(Device, 6);

    // TT_ORDER.NOW_SITE 변경
    Job_No := Uf_TrackGetJobNo(Device, 6);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '6');

    // CV5 직진지시 OFF
    gCVCW[Device].Hogi[1].StriOrder[5] := '0';
  end;
  // CV 6->7 이동완료처리 : 6->7 데이터이동
  if (gCVCR[Device].Hogi[1].StraightFinish[6] = '1') and
     (gCVCR[Device].Hogi[1].Exist[7] = '1') and
     (gCVCR[Device].Hogi[1].Error[6] = '0') and
     (Uf_TrackDataCheck(Device, 6) = True ) and
     (Uf_TrackDataCheck(Device, 7) = False ) then
  begin
    // CV6 Data move to CV7
    Uf_TrackDBMove(Device, 7);

    // TT_ORDER.NOW_SITE 변경
    Job_No := Uf_TrackGetJobNo(Device, 7);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '7');

    // Order Status 변경: CV이동 -> SC대기
    Job_No := Uf_TrackGetJobNo(Device, 7);
    Uf_SetOrder(IntToStr(Job_No), 'STATUS', 'CV완료');

    // CV6 직진지시 OFF
    gCVCW[Device].Hogi[1].StriOrder[6] := '0';
  end;

end;

end.
