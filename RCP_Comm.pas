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

  gWholePacket  : Array [1..2, 1..1024] of AnsiChar; // ������ �ϼ� ���� ������
  gIdx          : Array [1..2] of Integer;           // ������ �ϼ� ���� ���� �����ͼ�
  gSTXReceived  : Array [1..2] of Bool;              // ������ ������ ���� ����

  gTRACK        : Array [1..1,0..4] of TTrack;   //0 �� ũ����...
  gCVCR         : Array [1..2] of TCVCR;
  gCVCW         : Array [1..2] of TCVCW;
  gSCCR         : TSCCR;
  gSCCW         : TSCCW;

  gOld_SC_Error_Code: Integer = 0;
  gOld_CV_Error_Code: Array [1..2, 1..6] of Integer;

  AckNakFlag    : Char;                    // PLC ��Ž� �������.
  gLastCommTime : Tdatetime;               // ������� ����ð�.
  gRcpConnect   : String;

  gCommandFlag : Integer;
  gInOutFlag   : String;
  gDBConnected : Boolean;
  gCVRead      : Boolean;  // PLC 2�� ��������� �����͸� �о��� ��쿡�� EPLT�ڵ�����ϵ��� �ϱ� ����

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
    if (btnComm.Caption = '��Ž���') then
    begin

      // DB ����
      if (Uf_DBConnection()) then
      begin
        ShpDatabaseConn.Brush.Color := CONN_STATUS_COLOR[1];
        gDBConnected := True;

        // �α� ���� �ɼ�
        DeleteOption := StrToIntDef(IniRead(INI_PATH, 'Delete', 'DeleteOption', '0'), 0);
        LogFileDelete;
      end;

      // ���� plc ����
      if ( not FrontPLCSocket.Active) and (gDBConnected) then
      begin
        FrontPLCSocket.Address := INIRead(INI_PATH, 'PLC1', 'IP'  , ''); //Uf_GetComset('�����̾�1', 'ID_IP');
        FrontPLCSocket.Port    := StrToInt(INIRead(INI_PATH, 'PLC1', 'PORT', '')); //StrToInt(Uf_GetComset('�����̾�1', 'ID_PORT'));
        FrontPLCSocket.Open();
      end;

      // �ĸ� plc ����
      if (not RearPLCSocket.Active) then
      begin
        RearPLCSocket.Address := INIRead(INI_PATH, 'PLC2', 'IP'  , ''); //Uf_GetComset('�����̾�2', 'ID_IP');
        RearPLCSocket.Port    := StrToInt(INIRead(INI_PATH, 'PLC2', 'PORT', '')); //StrToInt(Uf_GetComset('�����̾�2', 'ID_PORT'));
        RearPLCSocket.Open();
      end;

      btnComm.Caption := '��Ÿ���';
      tmrMain.Enabled          := True;
      tmrConnectDB.Enabled     := True;
      tmrServer.Enabled        := True;
      tmrUPD_ORDSEQSEL.Enabled := True;
      tmrEPLTOut.Enabled       := True;
    end
    else
    begin
      btnComm.Caption := '��Ž���';
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
//  ControlProcess_CV : Device: PLC 1 or 2. �����̾� ����
//------------------------------------------------------------------------------
procedure TfrmMain.ControlProcess_CV(Device: Integer);
var
  Job_No : Integer;
  i : Integer;
  ErrorCode : Array [1..6] of Integer;
  WhereStr : String;
  OrdType, RackLoc : String;
begin

  // �ڵ���尡 �ƴϸ� Exit
  if (gCVCR[Device].Hogi[1].AutoMode = '0') or
     (rgCV.ItemIndex = 1) then
  begin
    Exit;
  end;

  // Fillchar(gCVCW, sizeof(gCVCW), '0');
  FillChar(ErrorCode, SizeOf(ErrorCode), 0);

  // �����̾� ���� �߻��� ���ø� ��
  for i := 1 to 6 do
  begin
    if(gCVCR[Device].Hogi[1].Error[i] = '1') then
    begin
      ErrorCode[i] := i + 7;

      // ���� �����ڵ�� ���� �����ڵ尡 ������ ����
      if (gOld_CV_Error_Code[Device][i] = ErrorCode[i]) then Exit;

      gCVCW[Device].Hogi[1].StriOrder[i] := '0';

      // TT_ORDER ��������ǥ�� ����
      Job_No := Uf_TrackGetJobNo(Device, i);
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_STAT', '1');
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_CODE', FormatFloat('0000', ErrorCode[i]));

      // ���� ���
      RackLoc := Uf_GetOrder(IntToStr(Job_No), 'ORD_LOC');
      ErrorWrite(FormatFloat('0000', ErrorCode[i]), 'CV', IntToStr(Job_No), RackLoc);

      gOld_CV_Error_Code[Device][i] := ErrorCode[i];
    end
    // ������ �ƴѰ��
    else if (gCVCR[Device].Hogi[1].Error[i] = '0') then
    begin
      // ������ ������ �־��� ���, (���� ������)
      if (gOld_CV_Error_Code[Device][i] <> 0) then
      begin
        // ���� ���� �ð� ���
        // TT_Track �۾���ȣ ������
        Job_No := Uf_TrackGetJobNo(Device, i);

        // ������ ���� ����
        Uf_SetOrder(IntToStr(Job_No), 'ERROR_STAT', '0');
        Uf_SetOrder(IntToStr(Job_No), 'ERROR_CODE', '');

        // ���� ���� �ð� ���
        ErrorClear(FormatFloat('0000', gOld_CV_Error_Code[Device][i]));

        gOld_CV_Error_Code[Device][i] := 0;
      end;
    end;
  end;

  // 1->2 ��������
  // CV1: ȭ����, ��������, CV2: ȭ����, ��������
  if (gCVCR[Device].Hogi[1].Exist[1] = '1') and
     (gCVCR[Device].Hogi[1].Exist[2] = '0') and
     (gCVCR[Device].Hogi[1].Error[1] = '0') and
     (Uf_TrackDataCheck(Device, 1) = True ) and
     (Uf_TrackDataCheck(Device, 2) = False) then
  begin
    // CV1 ���� ��� ����
    gCVCW[Device].Hogi[1].StriOrder[1] := '1';

    Job_No := Uf_GetOrderJobNo(Device, '���', 'SC�Ϸ�');
    Uf_SetOrder(IntToStr(Job_No), 'STATUS', 'CV�̵�');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_MACH', 'CV');
  end;

  // 2->3 ��������
  if (gCVCR[Device].Hogi[1].Exist[2] = '1') and
     (gCVCR[Device].Hogi[1].Exist[3] = '0') and
     (gCVCR[Device].Hogi[1].Error[2] = '0') and
     (Uf_TrackDataCheck(Device, 2) = True ) and
     (Uf_TrackDataCheck(Device, 3) = False) then
  begin
    // CV2 ���� ��� ����
    gCVCW[Device].Hogi[1].StriOrder[2] := '1';
  end;
  // 3->4 �������� (��� �Ϸ�)
  if (gCVCR[Device].Hogi[1].Exist[3] = '1') and
     (gCVCR[Device].Hogi[1].Exist[4] = '0') and
     (gCVCR[Device].Hogi[1].Error[3] = '0') and
     (Uf_TrackDataCheck(Device, 3) = True ) and
     (Uf_TrackDataCheck(Device, 4) = False) then
  begin
    // CV3 ���� ��� ����
    gCVCW[Device].Hogi[1].StriOrder[3] := '1';
  end;

  // CV4�� ���ÿϷ� �� ���� (�԰�)
  if (gCVCR[Device].Hogi[1].Exist[4] = '1') and
     (gCVCR[Device].Hogi[1].JobDone  = '1') then
  begin
    // �۾��Ϸ� ǥ�ú� �ҵ�
    gCVCW[Device].Hogi[1].CompleteBell := '0';

    WhereStr := ' AND ORD_IO = ' + QuotedStr('���') +
                ' AND STATUS = ' + QuotedStr('CV�Ϸ�');
    Job_No  := Uf_GetOrderJobNo(Device, WhereStr);
    OrdType := Uf_GetOrder(IntToStr(Job_No), 'ORD_TYPE');


    //**** �κ���� Ȯ�� -> ǰ����� Ȯ�� -> �԰� Ȯ�� ****//

    //**** �Ϸ�� �κ����, ������� ���� ���� -> ���԰� ���� ���� & ������� ����
    if ((OrdType = '�κ����') or (OrdType = '�������')) then
    begin
      // ���԰� ���� ����
      Uf_ReIn_OrderCrate(IntToStr(Job_No));

      // �Ϸ�� [�κ����, �������]���� ����
      Uf_DeleteOrder(IntToStr(Job_No));

      // Ʈ�������� ����
      Uf_TrackDataSet('', 0, Device, 4);

      // ���԰� ������ �۾���ȣ ������
      WhereStr := ' AND ORD_IO   = ' + QuotedStr('�԰�') +
                  ' AND ORD_TYPE IN (' + QuotedStr('���԰�') + ',' + QuotedStr('�����԰�') + ')' +
                  ' AND STATUS   = ' + QuotedStr('CV���');
      Job_No := Uf_GetOrderJobNo(Device, WhereStr);

      // Ʈ�������� ���� & ���� ���� ����
      Uf_TrackIPGOSet(Job_No, Device, 4);
    end
    //**** �Ϸ�� ǰ��������� ���� -> �ȷ�Ʈ �԰� ���� ���� & ������� ����
    else if (OrdType = 'ǰ�����') then
    begin
      // ���԰� ���� ����
      Uf_ReIn_OrderCrate(IntToStr(Job_No));

      // �Ϸ�� [ǰ�����] ���� ����
      Uf_DeleteOrder(IntToStr(Job_No));

      // Ʈ�������� ����
      Uf_TrackDataSet('', 0, Device, 4);

      // ���԰� ������ �۾���ȣ ������
      WhereStr := ' AND ORD_IO   = ' + QuotedStr('�԰�') +
                  ' AND ORD_TYPE = ' + QuotedStr('�ķ�Ʈ�԰�') +
                  ' AND STATUS   = ' + QuotedStr('CV���');
      Job_No := Uf_GetOrderJobNo(Device, WhereStr);

      // Ʈ�������� ���� & ���� ���� ����
      Uf_TrackIPGOSet(Job_No, Device, 4);
    end
    //**** �Ϸ�� �ķ�Ʈ��� ���� ���� -> �ȷ�Ʈ �԰� ���� ���� & ������� ����
    else if (OrdType = '�ķ�Ʈ���') then
    begin
      // �Ϸ�� [�ķ�Ʈ���] ���� ����
      Uf_DeleteOrder(IntToStr(Job_No));

      // Ʈ�������� ����
      Uf_TrackDataSet('', 0, Device, 4);

      // �԰������� �۾���ȣ ������
      WhereStr := ' AND ORD_IO = ' + QuotedStr('�԰�') +
                  ' AND STATUS = ' + QuotedStr('CV���') +
                  ' AND ORD_SEQ_SEL = 1' ;
      Job_No := Uf_GetOrderJobNo(Device, WhereStr);

      // Ʈ�������� ���� & ���� ���� ����
      Uf_TrackIPGOSet(Job_No, Device, 4);
    end;
  end;

  // 4->5 ��������
  if (gCVCR[Device].Hogi[1].Exist[4] = '1') and
     (gCVCR[Device].Hogi[1].Exist[5] = '0') and
     (gCVCR[Device].Hogi[1].Error[4] = '0') and
     (Uf_TrackDataCheck(Device, 4) = True ) and
     (Uf_TrackDataCheck(Device, 5) = False) then
  begin
    WhereStr := ' AND ORD_IO = ' + QuotedStr('���') +
                ' AND STATUS = ' + QuotedStr('CV�Ϸ�') +
                ' AND JOB_NO = ' + QuotedStr(IntToStr(Uf_TrackGetJobNo(Device, 4))) ;
    Job_No := Uf_GetOrderJobNo(Device, WhereStr);
    if (Job_No <> -1) then
    begin
      gCVCW[Device].Hogi[1].StriOrder[4] := '0';
    end
    else
    begin
      // CV4 ���� ��� ����
      gCVCW[Device].Hogi[1].StriOrder[4] := '1';
    end;
  end;

  // 5->6 ��������
  if (gCVCR[Device].Hogi[1].Exist[5] = '1') and
     (gCVCR[Device].Hogi[1].Exist[6] = '0') and
     (gCVCR[Device].Hogi[1].Error[5] = '0') and
     (Uf_TrackDataCheck(Device, 5) = True ) and
     (Uf_TrackDataCheck(Device, 6) = False) then
  begin
    // CV5 ���� ��� ����
    gCVCW[Device].Hogi[1].StriOrder[5] := '1';
  end;

  // 6->7 ��������
  if (gCVCR[Device].Hogi[1].Exist[6] = '1') and
     (gCVCR[Device].Hogi[1].Exist[7] = '0') and
     (gCVCR[Device].Hogi[1].Error[6] = '0') and
     (Uf_TrackDataCheck(Device, 6) = True ) and
     (Uf_TrackDataCheck(Device, 7) = False) then
  begin
    // CV6 ���� ��� ����
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

  // �ڵ���尡 �ƴҰ�� Exit
  if (gSCCR.SC[1].Auto_Mode = '0') or
     (gSCCR.SC[1].Manual_Mode = '1') or
     (rgSC.ItemIndex = 1) then
  begin
    Exit;
  end;

  // TC_SCCW�� �� ������ �ٽ� �о ���� ����(gSCCW)�� ����
  Uf_GetSCWRead;

  //** ����Ŀ �۾��� ���� **//
  if (gSCCR.SC[1].Job_Standby = '0') and
     ((gSCCR.SC[1].Storage_In_Ing = '1') or (gSCCR.SC[1].Storage_Out_Ing = '1') or (gSCCR.SC[1].Home_Returning = '1')) then
  begin
    // �⵿ �䱸�� ��
    gSCCW.SC[1].MachineAction := '0';
  end;

  //====== SCȨ �̵���û Ȯ�� ======//
  if (gSCCR.SC[1].Home_Returning = '0') and (Uf_GetCurrent('SCMOVEHOME', 'OPTION1') = 'True') then
  begin
    FillChar(gSCCW, SizeOf(gSCCW), '0');

    gSCCW.SC[1].Home_Return := '1';
    gSCCW.SC[1].MachineAction := '1';

    Uf_SetCurrent('SCMOVEHOME', 'OPTION1', '0');

    Exit;
  end;

  //====== SC�ʱ�ȭ ��û Ȯ��(�����Ϸ�, �۾���� ���� ������) ======//
  if (Uf_GetCurrent('SCCLEAR', 'OPTION1') = 'True') then
  begin
    Fillchar(gSCCW, sizeof(gSCCW), '0');

    Uf_SetCurrent('SCCLEAR', 'OPTION1', '0');

    Exit;
  end;

  //====== �����԰� ���۾�ó�� ======//
  if (Uf_GetCurrent('SCDOUBLEINRESET', 'OPTION1') = 'True') then
  begin
    edtStep.Text := 'RESET - �����԰�';
    // ���� �۾� �������� (�����԰��� ��� TT_ORDER�� STATUS = 'SC�Ͽ�'��) ����Ŀ �۾��� ������ 1����
    Device := Uf_GetOrderPLCNo('�԰�', 'SC�Ͽ�');
    Job_No := Uf_GetOrderJobNo(Device, '�԰�', 'SC�Ͽ�');

    // ���ù��� �缳��
    Uf_SC_WriteDataSet(Device, Job_No, '�԰�');

    // TC_Current �� �ʱ�ȭ
    Uf_SetCurrent('SCDOUBLEIN'     , 'OPTION1', '0');
    Uf_SetCurrent('SCDOUBLEINRESET', 'OPTION1', '0');

    Exit;
  end
  //====== ����� �۾����ó�� ======//
  else if (Uf_GetCurrent('SCEMPTYOUTCANCEL', 'OPTION1') = 'True') then
  begin
    edtStep.Text := 'RESET - �����(�۾����)';

    // ���ù��� �ʱ�ȭ
    FillChar(gSCCW, SizeOf(gSCCW), '0');

    // TC_Current�� �ʱ�ȭ
    Uf_SetCurrent('SCEMPTYOUT'      , 'OPTION1', '0');
    Uf_SetCurrent('SCEMPTYOUTCANCEL', 'OPTION1', '0');

    Exit;
  end
  //====== ����� �ٸ������ó�� ======//
  else if (Uf_GetCurrent('SCEMPTYOUTRESET', 'OPTION1') = 'True') then
  begin
    edtStep.Text := 'RESET - �����(�ٸ������)';
    // ���� �۾� �������� (������� ��� TT_ORDER�� STATUS = 'SC����'��)
    Device := Uf_GetOrderPLCNo('���', 'SC����');
    Job_No := Uf_GetOrderJobNo(Device, '���', 'SC����');

    // ���ù��� �缳��
    Uf_SC_WriteDataSet(Device, Job_No, '���');

    // TC_Current �� �ʱ�ȭ
    Uf_SetCurrent('SCEMPTYOUT'     , 'OPTION1', '0');
    Uf_SetCurrent('SCEMPTYOUTRESET', 'OPTION1', '0');

    Exit;
  end;

  //====== ���� ======//
  if (gSCCR.SC[1].Error = '1') then
  begin
    ErrorCode:= Data16to10(gSCCR.SC[1].Error_Code[1]) * 16 +
                Data16to10(gSCCR.SC[1].Error_Code[2]);

    // ���� �����ڵ�� ���� �����ڵ尡 ������ ����
    if (gOld_SC_Error_Code = ErrorCode) then Exit;

    // TT_ORDER ��������ǥ�� ����
    WhereStr := ' AND STATUS in (''SC����'', ''SC�Ͽ�'') ';
    Job_No := Uf_GetOrderJobNo(1, WhereStr);
    if (Uf_GetOrder(IntToStr(Job_No), 'ERROR_STAT') = '0') then
    begin
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_STAT', '1');
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_CODE', FormatFloat('0000', ErrorCode));
    end;

    // ������ġ ������
    Old_RackLoc := Uf_GetOrder(IntToStr(Job_No), 'ORD_LOC');

    // ���� ���
    ErrorWrite(FormatFloat('0000', ErrorCode), 'SC', IntToStr(Job_No), Old_RackLoc);

    // �����԰�
    if (gSCCR.SC[1].Twin_In = '1') or
       (ErrorCode = 42) then
    begin

      // TC_Current �����԰� ��ŷ
      if (Uf_GetCurrent('SCDOUBLEIN', 'OPTION1') = 'False') then
      begin
        Uf_SetCurrent('SCDOUBLEIN', 'OPTION1', '1');
      end;

      // TT_Rack �����԰� ��ŷ
      if (Uf_GetRack(Old_RackLoc, 'RACK_STAT') <> '�����԰�') then
      begin
        Uf_SetRack(Old_RackLoc, 'RACK_STAT', '�����԰�');
      end;

      // �� ��ġ ��������
      Device := StrToInt(Uf_GetOrder(IntToStr(Job_No), 'PLC_NO'));
      Rack_Loc := GetEmptyRack('', IntToStr(Device), '1');
      if (Copy(Rack_Loc, 1, 2) = 'NG')  then
      begin
        // �����̷� ����
        ErrorLogWrite('��ã�� ����');
      end
      else
      begin
        Rack_Loc := Copy(Rack_Loc, 3, 6);
        // ��ġ �缳��
        Uf_SetOrder(IntToStr(Job_No), 'ORD_LOC'  , Rack_Loc);
        Uf_SetOrder(IntToStr(Job_No), 'DST_BANK' , Copy(Rack_Loc, 1, 2));
        Uf_SetOrder(IntToStr(Job_No), 'DST_BAY'  , Copy(Rack_Loc, 3, 2));
        Uf_SetOrder(IntToStr(Job_No), 'DST_LEVEL', Copy(Rack_Loc, 5, 2));

        // �� �԰��� ���� ǥ��
        Uf_SetRack(Rack_Loc, 'RACK_STAT', '�԰���');

        // �� ��� ��ġ ����
        Uf_SetRackStock(Old_RackLoc, 'RACK_LOC', Rack_Loc);
        Uf_SetRackStock(Old_RackLoc, 'RACK_BANK',  Copy(Rack_Loc, 1, 2));
        Uf_SetRackStock(Old_RackLoc, 'RACK_BAY',   Copy(Rack_Loc, 3, 2));
        Uf_SetRackStock(Old_RackLoc, 'RACK_LEVEL', Copy(Rack_Loc, 5, 2));

        // ���ù��� �缳��
        Uf_SC_WriteDataSet(Device, Job_No, '�԰�');
      end;
    end
    // �����
    else if (gSCCR.SC[1].Blank_Out = '1') or
            (ErrorCode = 43) then
    begin
      if (Uf_GetCurrent('SCEMPTYOUT', 'OPTION1') = 'False') then
      begin
        Uf_SetCurrent('SCEMPTYOUT', 'OPTION1', '1');
      end;

      Rack_Loc := Uf_GetOrder(IntToStr(Job_No), 'ORD LOC');
      if (Uf_GetRack(Rack_Loc, 'RACK_STAT') <> '�����') then
      begin
        Uf_SetRack(Rack_Loc, 'RACK_STAT', '�����');
      end;
    end;

    // �����ڵ� ����
    gOld_SC_Error_Code := ErrorCode;

    Exit;
  end
  // ���� �ƴ�
  else if (gSCCR.SC[1].Error = '0') then
  begin
    // ������ ������ �־��� ���, (���� ������)
    if (gOld_SC_Error_Code <> 0) then
    begin
      // TT_ORDER �۾���ȣ ������
      WhereStr := ' AND STATUS in (''SC����'', ''SC�Ͽ�'') ';
      Job_No := Uf_GetOrderJobNo(1, WhereStr);

      // ������ ���� ����
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_STAT', '0');
      Uf_SetOrder(IntToStr(Job_No), 'ERROR_CODE', '');

      // �����԰� TC_Current �� �ʱ�ȭ
      if (gOld_SC_Error_Code = 42) then
      begin
        Uf_SetCurrent('SCDOUBLEIN', 'OPTION1', '0');
      end;

      // ���� ���� �ð� ���
      ErrorClear(FormatFloat('0000', gOld_SC_Error_Code));

      gOld_SC_Error_Code := 0;
    end;
  end;

  // �԰�,��� �����ư��� ����
  if      gInOutFlag = ''     then gInOutFlag := '�԰�'
  else if gInOutFlag = '�԰�' then gInOutFlag := '���'
  else if gInOutFlag = '���' then gInOutFlag := '�԰�';

  //====== �������� �۾� ó�� ======//
  WhereStr := ' AND STATUS in (''SC����'', ''SC�Ͽ�'')' ;
  SC_JobCnt := Uf_GetOrderCount(WhereStr);
  if (SC_JobCnt = 1) then
  begin
    //** �������� �۾� ó�� **//
    SC_JOB_Process;
  end
  //====== ����Ŀ �۾��� ���� ��� ���ο� ���� Ž�� ======//
  else if (SC_JobCnt = 0) then
  begin
    //** ����Ŀ ������ (�۾����� ������ ����) **//
    if (gSCCR.SC[1].Job_Standby     = '1') and
       (gSCCR.SC[1].Home_Returning  = '0') and
       (gSCCR.SC[1].Storage_In_Ing  = '0') and
       (gSCCR.SC[1].Storage_Out_Ing = '0') and
       (gSCCR.SC[1].Pallet_Exist    = '0') and
       (gSCCR.SC[1].Error           = '0') then
    begin
      edtStep.Text := 'READY';

      // 1. �۾�(TT_ORDER)���� Ȯ��
      if (gInOutFlag = '�԰�') and (Uf_GetCurrent('SC_IN_USE', 'OPTION1') = 'True') then
      begin
        // CV�Ϸ��� ������ PLC��ȣ�� ã�ƿ�.
        Device := Uf_GetOrderPLCNo(gInOutFlag, 'CV�Ϸ�');
        if(Device < 0) then Exit;

        // ������ ã�� PLC��ȣ�� �԰�밡 �غ���°� �ƴϰų�
        // Ʈ�� �����Ͱ� ���ٸ� �ٸ� PLC �԰���� �غ���¸� Ȯ����
        if (gCVCR[Device].Hogi[1].ST2_IN_READY = '0') or
           (Uf_TrackDataCheck(Device, 7) = False) then
        begin
          // PLC��ȣ ���
          if (Device = 1) then Device := 2
          else                 Device := 1;

          // �ٸ� PLC�� �԰�밡 �غ�����̰�
          // Ʈ�� �����Ͱ� ������ �۾���ȣ ��������
          if (gCVCR[Device].Hogi[1].ST2_IN_READY = '1') and
             (Uf_TrackDataCheck(Device, 7) = True) then
          begin
            Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'CV�Ϸ�');
          end;
        end
        // �غ�����̰�, Ʈ�������� ������ �۾���ȣ ã��
        else
        begin
          Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'CV�Ϸ�');
        end;
      end
      else if (gInOutFlag = '���') and (Uf_GetCurrent('SC_OT_USE', 'OPTION1') = 'True') then
      begin
        // SC����� ������ PLC��ȣ�� ã�ƿ�.
        Device := Uf_GetOrderPLCNo(gInOutFlag, 'SC���');
        if(Device < 0) then Exit;

        // ������ ã�� PLC��ȣ�� ���밡 �غ���°� �ƴϰų�
        // Ʈ�� �����Ͱ� �ִٸ�  �ٸ� PLC ������ �غ���¸� Ȯ����
        if (gCVCR[Device].Hogi[1].ST1_OUT_READY = '0') or
           (Uf_TrackDataCheck(Device, 1) = True) then
        begin
          // PLC��ȣ ���
          if (Device = 1) then Device := 2
          else                 Device := 1;

          // �ٸ� PLC�� ���밡 �غ�����̰�
          // Ʈ�������Ͱ� ������ �۾���ȣ ��������
          if (gCVCR[Device].Hogi[1].ST1_OUT_READY = '1') and
             (Uf_TrackDataCheck(Device, 1) = False) then
          begin
            Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'SC���');
          end;
        end
        // �غ�����̰�, Ʈ�������� ������ �۾���ȣ ã��
        else
        begin
          Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'SC���');
        end;
      end;

      // 1.1 �۾��� ��ã���� ��� Exit
      if ((Device < 0) or (Job_No < 0)) then Exit;

      // 1.2 �԰��(CV7) ����(CV1) �غ� �ȵ����� Exit
      if (((gInOutFlag = '�԰�') and ((Uf_GetCurrent('SC_IN_USE', 'OPTION1') = 'False') or
                                      (gCVCR[Device].Hogi[1].ST2_IN_READY = '0') or
                                      (gCVCR[Device].Hogi[1].Exist[7] = '0'))) or
          ((gInOutFlag = '���') and ((Uf_GetCurrent('SC_OT_USE', 'OPTION1') = 'False') or
                                      (gCVCR[Device].Hogi[1].ST1_OUT_READY = '0') or
                                      (gCVCR[Device].Hogi[1].Exist[1] = '1'))) ) then
      begin
        Exit;
      end;

      // 2. gSCCW����ü ����(SC Write ����ü), (Device�� Job_No�� 1���� ã�ƿ���)
      FillChar(gSCCW, SizeOf(gSCCW), chr($00));
      Uf_SC_WriteDataSet(Device, Job_No, gInOutFlag);

      // 3. ���� ���� ���� 'SC���' -> 'SC����'
      Uf_SetOrder(IntToStr(Job_No), 'STATUS', 'SC����');

      edtStep.Text := 'ORDER';

    end
  end;

end;

//------------------------------------------------------------------------------
//  CVCW_Write : TC_CVCW�� ��� �� PLC����
//------------------------------------------------------------------------------
procedure TfrmMain.CVCW_Write(Device: Integer);
var
  dataStr : AnsiString;
begin

  // �ڵ���尡 �ƴϸ� Exit
  if (gCVCR[Device].Hogi[1].AutoMode = '0') or
     (rgCV.ItemIndex = 1) then
  begin
    Exit;
  end;

  // original
  dataStr := gCVCW[Device].Hogi[1].All; // 00000000 00000000

  // DB�� ����
  Uf_TableWirte_CVCW(Device, dataStr);

  // reverse
  //dataStr := ReverseString(dataStr);

  // bin to hex
  dataStr := StrBinToStrHex(dataStr);

  // PLC�� ����
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
    // �ڽ� ���α׷��� ���̴� �Լ�
    //-----------------------------------------------
    ExitProcess(0);
  end;
  Application.OnException := AppException ;

  (Sender as TForm).Caption := Cap ;
  lblUptime.Caption := FormatDatetime('YYYY/MM/DD HH:MM:SS', now());

  mmCommLog.Clear();
  mmErrorLog.Clear();
  PageControl.Pages[0].Show;

  // PLC �۽�(�б�䱸) ���� �÷���. ����:0 -> PLC1_SC:1 -> PLC1_CV:2 -> PLC2_CV:3
  gCommandFlag := 0;

  Fillchar(gCVCR, sizeof(gCVCR), '0');
  Fillchar(gCVCW, sizeof(gCVCW), '0');
  FillChar(gSCCR, SizeOf(gSCCR), '0');
  FillChar(gSCCW, SizeOf(gSCCW), '0');

  FillChar(gOld_CV_Error_Code,Sizeof(gOld_CV_Error_Code),0);

  edtStep.Text := 'START';

  gCVRead := False;

  gLogwriteDBConnection := False;   //��ŷα׸� �����ؼ� ���� �ʱ�
  gUf_GetCVCRead        := False;   //��ŷα׸� �����ؼ� ���� �ʱ�
  gUf_GetSCRRead        := False;   //��ŷα׸� �����ؼ� ���� �ʱ�
end;

//------------------------------------------------------------------------------
//  FillBuff : PLC�κ��� �о���� ���� ó����. Device : PLC��ȣ (1, 2)
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

  // ���� �б⿡ ���� ����
  if (Copy(gWholePacket[Device], 2, 5) = '00RSB') then
  begin
    // ��������
    if (Copy(gWholePacket[Device], 1, 1) = ACK) then
    begin
     // ACK 00 RSB    04 123456789ABC ETX  Block ������ ���� ���
     // ACK 00 RSB 01 04 123456789ABC ETX   Block ������ �ִ� ���
//      blockcount�� ���� ��츦 ����Ͽ�
//      blockCount := StrToInt('$' + Copy(gWholePacket[Device], 7, 2));
//      dataCount := StrToInt('$' + Copy(gWholePacket[Device], 9, 2));

      dataCount := StrToInt('$' + Copy(gWholePacket[Device], 7, 2));

      // CV ������ ��� (�����Ͱ����� ����) cv: 2word 8����, SC: 3word 12����
      if(dataCount = 2) then
      begin
        // Bit ������ -> 2word ���
        bitWordCnt := 2;

        // ��ȯ�ؼ� �־������
        tmpStr := Copy(gWholePacket[Device], 9, dataCount * 4);
        for i := 0 to bitWordCnt - 1 do
        begin
          convStr := StrHexToStrBin(Copy(tmpStr, (i * 4) + 1, 4)); // '1234' -> '0001 0010 0011 0100'
          //convStr := ReverseString(convStr);                       // '0001 0010 0011 0100' -> '0010 1100 0100 1000'
          dataStr := dataStr + convStr;
        end;

        // DB(Table:TC_CVCR)�� ����
        Uf_TableWirte_CVCR(Device, dataStr);

        // ��ȯ�� dataStr ���� ���ۿ� ����
        Fillchar(gCVCR[Device], sizeof(gCVCR[Device]), chr($00));
        StrMove(@gCVCR[Device].All, PAnsiChar(dataStr), Length(dataStr)); // StrMove����:StrMove(@gSCCR.All[1], PChar(@gWholePacket1[9]), dataCount*2);
        CommLogWrite(Device, 'PLC#' + IntToStr(Device) + '_' + 'CV_' + 'Recv Convert[' + gCVCR[Device].All + ']');

        // ����ǥ��
        ShowPLCStatus(Device, 'CV');

        // Tracküũ (ȭ�� �̵��Ϸ� �Ǹ� ������ �̵�, �������� ��)
        TrackingProcess_CV(Device);

        // ���� ���� (ȭ����, ��������)
        ControlProcess_CV(Device);

        // ���� ���� ǥ��
        ShowCVWriteStatus(Device);

        // DB(Table:TC_CVCW)�� ����& PLC�� ����
        CVCW_Write(Device);

        // ���α׷� ���� �� ���� PLC2������ �о��� ���.
        if (Device = 2) then
        begin
          gCVRead := True;
        end;
      end
      // SC ������ ���
      else if(dataCount = 3) then
      begin
        // Bit ������ -> 1word ���
        bitWordCnt := 1;

        // ��ȯ�ؼ� �־������
        tmpStr := Copy(gWholePacket[Device], 9, dataCount * 4);
        for i := 0 to bitWordCnt - 1 do
        begin
          convStr := StrHexToStrBin(Copy(tmpStr, (i * 4) + 1, 4)); // '1234' -> '0001 0010 0011 0100'
          //convStr := ReverseString(convStr);                       // '0001 0010 0011 0100' -> '0010 1100 0100 1000'
          dataStr := dataStr + convStr;
        end;

        // Word ������ 2Word ���
        wordCnt := 2;
        for i := 1 to wordCnt do
        begin
          convStr := Copy(tmpStr, (i * 4) + 1, 4);
          dataStr := dataStr + convStr;
        end;

        // DB(Table:TC_SCCR)�� ����
        Uf_TableWirte_SCCR(Device, dataStr);

        // ��ȯ�� dataStr ���� ���ۿ� ����
        FillChar(gSCCR, SizeOf(gSCCR), chr($00));
        StrMove(@gSCCR.All, PAnsiChar(dataStr), Length(dataStr));  // StrMove����:StrMove(@gSCCR.All[1], PChar(@gWholePacket1[9]), dataCount*2);
        CommLogWrite(Device, 'PLC#' + IntToStr(Device) + '_' + 'SC_' + 'Recv Convert[' + gSCCR.All + ']');

        // ����ǥ��
        ShowPLCStatus(Device, 'SC');

        // ���� ���� (����Ŀ ���������)
        ControlProcess_SC;

        // ���û��� ǥ��
        ShowSCWriteStatus;

        // DB(Table:TC_CVCW)�� ����& PLC�� ����
        SCCW_Write;
      end;

    end
    // ������ ����
    else if (Copy(gWholePacket[Device], 1, 1) = NAK) then
    begin
      // NAK 00 RSB 1111 ETX  Block
      // �����ڵ尡 �ִ� ���
      if ((Length(Trim(gWholePacket[Device])) > 6) and
          (Length(Trim(gWholePacket[Device])) < 12)) then
      begin
        ErrorLogWrite('PLC NAK Recv [PLC#' + IntToStr(Device) + '_' + gWholePacket[Device] + ']');
      end
      else
      begin
        ErrorLogWrite('PLC NAK Error Recv [PLC#' + IntToStr(Device) + '_' + gWholePacket[Device]+ '] �����ڵ� ����' );
      end;
    end;
  end
  // ���� ���⿡ ���� ����
  else if (Copy(gWholePacket[Device], 2, 5) = '00WSB') then
  begin
    // ��������
    if (Copy(gWholePacket[Device], 1, 1) = ACK) then
    begin
      // ACK 00 WSB ETX  Block
      CommLogWrite(Device, 'PLC#' + IntToStr(Device) + '_' + 'Recv [' + gWholePacket[Device] + ']');
    end
    // ������ ����
    else if (Copy(gWholePacket[Device], 1, 1) = NAK) then
    begin
      // NAK 00 WSB 1111 ETX  Block
      // �����ڵ尡 �ִ� ���
      if ((Length(Trim(gWholePacket[Device])) > 6) and
          (Length(Trim(gWholePacket[Device])) < 12)) then
      begin
        ErrorLogWrite('PLC NAK Recv [PLC#' + IntToStr(Device) + '_' + gWholePacket[Device] + ']');
      end
      else
      begin
        ErrorLogWrite('PLC NAK Error Recv [PLC#' + IntToStr(Device) + '_' + gWholePacket[Device]+ '] �����ڵ� ����' );
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
//  LogFileDelete : �α����� �ڵ�����
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
// �α��ڵ� ���� Ÿ�̸�
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
    // read data�� ���� ó��
    // data=ACK123456890ETX. data=12211ACK123456789ETX123

    // ������ ����
    if ((SockRecvBuff[PLC_No][i] = ACK) or (SockRecvBuff[PLC_No][i] = NAK)) then
    begin
      // ��ü ��Ŷ ���� �ʱ�ȭ. gWholePacket1 : 1024 byte [1024 AnsiChar]
      FillChar(gWholePacket[PLC_No], SizeOf(gWholePacket[PLC_No]), chr($00));
      gIdx[PLC_No] := 1;
      gWholePacket[PLC_No][gIdx[PLC_No]] := SockRecvBuff[PLC_No][i];

      // ������ ������ ACK or NAK ���� �÷��� True ����
      gSTXReceived[PLC_No] := True;

      Inc(gIdx[PLC_No]);
    end
    // ������ ��
    else if (SockRecvBuff[PLC_No][i] = ETX) then
    begin
      // ������ �������� ���� ��� ��ü��Ŷ�� ETX���� ������ �ϼ�
      if (gSTXReceived[PLC_No]) then
      begin
        gWholePacket[PLC_No][gIdx[PLC_No]] := SockRecvBuff[PLC_No][i];

        // ���� ������ �α�
        CommLogWrite(PLC_No, 'PLC#' + IntToStr(PLC_No) + '_' + 'Recv[' + Copy(gWholePacket[PLC_No], 1, SockRecvLength[PLC_No])  + ']');

        // �������� �ϼ��Ǿ����Ƿ�, ������ ���� �÷��� �ʱ�ȭ (False)
        gSTXReceived[PLC_No] := False;

        // SCC �Ǵ� CVC ���ۿ� ����
        FillBuff(PLC_No);
      end;
    end
    // ������ �߰�
    else
    begin
      // ������ ������(ACK or NAK)�� �޾����� �����͸� ����
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
//  SCCW_Write : TC_CVCW�� ��� �� PLC����
//------------------------------------------------------------------------------
procedure TfrmMain.SCCW_Write;
var
  dataStr : AnsiString;
begin

  // �ڵ���尡 �ƴϸ� Exit
  if (gSCCR.SC[1].Auto_Mode = '0') or
     (rgSC.ItemIndex = 1) then
  begin
    Exit;
  end;

  // bit ������
  dataStr := Copy(gSCCW.SC[1].All, 0, 16); // 00000000 00000000

  // ���� Hex ���̱�
  dataStr := dataStr + Copy(gSCCW.SC[1].Bay, 1, 2);
  dataStr := dataStr + Copy(gSCCW.SC[1].Level, 1, 2);

  // DB�� ����
  Uf_TableWirte_SCCW(1, dataStr);

  // original
  dataStr := Copy(gSCCW.SC[1].All, 0, 16); // 00000000 00000000
  // reverse
  //dataStr := ReverseString(dataStr);
  // bin to hex
  dataStr := StrBinToStrHex(dataStr);
  dataStr := dataStr + Copy(gSCCW.SC[1].Bay, 1, 2);
  dataStr := dataStr + Copy(gSCCW.SC[1].Level, 1, 2);

  // PLC�� ����
  dataStr := '00WSB' + '05' + '%MW50' + '02' + dataStr;
  PLCWrite(1, 'SC', dataStr);

end;

//------------------------------------------------------------------------------
//  SC_JOB_Process : PLC�� ���¸� �����ش�. (Device: 1, 2 PLC��ȣ)
//------------------------------------------------------------------------------
procedure TfrmMain.SC_JOB_Process;
var
  Job_No : Integer;
  Device : Integer;
begin

  //** ����Ŀ �԰�� ��ŷ�Ϸ� **// (�԰�뿡�� ��, CV->SC)
  if (gSCCR.SC[1].Job_Standby       = '0') and
     (gSCCR.SC[1].Storage_In_Ing    = '1') and
     (gSCCR.SC[1].Storage_Out_Ing   = '0') and
     (gSCCR.SC[1].In_St_Fork_Finish = '1') and
     (gSCCR.SC[1].Pallet_Exist      = '1') then
  begin
    edtStep.Text := 'ORDER - �԰����ŷ�Ϸ�';
    // �԰��(CV7)���� SC�� ������ �̵�
    Device := Uf_GetOrderPLCNo('�԰�', 'SC����');
    Job_No := Uf_GetOrderJobNo(Device, '�԰�', 'SC����');
    Uf_SCDataMove(Device, '�԰�');

    // ���û��� ���� 'SC����'->'SC�Ͽ�'
    Uf_SetOrder(IntToStr(Job_No), 'STATUS'  , 'SC�Ͽ�');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_MACH', 'SC');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', '100');
  end
  //** ����Ŀ �԰��۾� �Ϸ� **// (���� ����, ���ó���� Ʈ���ŷ� �� ����)
  else if (gSCCR.SC[1].Job_Standby     = '0') and
          (gSCCR.SC[1].Storage_In_Ing  = '0') and
          (gSCCR.SC[1].Storage_Out_Ing = '0') and
          (gSCCR.SC[1].Rack_In_Finish  = '1') and
          (gSCCR.SC[1].Pallet_Exist    = '0') then
  begin
    edtStep.Text := 'FINISH - ���԰�Ϸ�';

    // �۾� ������
    Device := Uf_GetOrderPLCNo('�԰�', 'SC�Ͽ�');
    Job_No := Uf_GetOrderJobNo(Device, '�԰�', 'SC�Ͽ�');

    // ���û��� ���� 'SC�Ͽ�'->'SC�Ϸ�'
    Uf_SetOrder(IntToStr(Job_No), 'STATUS' , 'SC�Ϸ�');
    Uf_SetOrder(IntToStr(Job_No), 'IN_DATE', '');
    Uf_SetOrder(IntToStr(Job_No), 'END_YN' , 'Y');

    // ���� ����
    Uf_DeleteOrder(IntToStr(Job_No));

    // Ʈ�������� ����
    Uf_TrackDataSet('', 0, 1, 100);

    // ���� �ʱ�ȭ
    Fillchar(gSCCW, sizeof(gSCCW), '0');
  end
  //** ����Ŀ ��� ��ŷ�Ϸ� **// (������ ����)
  else if (gSCCR.SC[1].Job_Standby     = '0') and
          (gSCCR.SC[1].Storage_In_Ing  = '0') and
          (gSCCR.SC[1].Storage_Out_Ing = '1') and
          (gSCCR.SC[1].Rack_Out_Finish = '1') and
          (gSCCR.SC[1].Pallet_Exist    = '1') then
  begin
    edtStep.Text := 'ORDER - ����ŷ�Ϸ�';
    // �۾� ������
    Device := Uf_GetOrderPLCNo('���', 'SC����');
    Job_No := Uf_GetOrderJobNo(Device, '���', 'SC����');

    // SC Ʈ�� ������ ������Ʈ
    Uf_TrackDataSet(IntToStr(Job_No), 1, 1, 100);
    Uf_SetOrder(IntToStr(Job_No), 'STATUS'  , 'SC�Ͽ�');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_MACH', 'SC');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', '100');
  end
  //** ����Ŀ ����۾� �Ϸ� **// (���뿡 �������� SC->CV)
  else if (gSCCR.SC[1].Job_Standby        = '0') and
          (gSCCR.SC[1].Storage_In_Ing     = '0') and
          (gSCCR.SC[1].Storage_Out_Ing    = '0') and
          (gSCCR.SC[1].Out_St_Fork_Finish = '1') and
          (gSCCR.SC[1].Pallet_Exist       = '0') then
  begin
    edtStep.Text := 'FINISH - ���� ��ŷ�Ϸ�';
    // �۾� ������
    Device := Uf_GetOrderPLCNo(gInOutFlag, 'SC�Ͽ�');
    Job_No := Uf_GetOrderJobNo(Device, gInOutFlag, 'SC�Ͽ�');

    // ���û��� ���� 'SC����'->'SC�Ϸ�'
    Uf_SetOrder(IntToStr(Job_No), 'STATUS'  , 'SC�Ϸ�');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_MACH', 'CV');
    Uf_SetOrder(IntToStr(Job_No), 'OT_DATE' , ''); //OT_DATE, IN_DATE�� ���� ����. ��=CONVERT([varchar](max),getdate(),(21))

    // CV Ʈ�� ������ ������Ʈ
    Uf_TrackDataSet(IntToStr(Job_No), 1, Device, 1);
    Uf_TrackDataSet('', 0, 1, 100);

    // ���� �ʱ�ȭ
    Fillchar(gSCCW, sizeof(gSCCW), '0');
  end;
end;

//------------------------------------------------------------------------------
//  ShowPLCStatus : PLC�� ���¸� �����ش�. (Device: 1, 2 PLC��ȣ)
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
//  ShowCVWriteStatus �����̾� ���û���ǥ�� : Device: PLC_No 1,2.
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
//  ShowSCWriteStatus: ����Ŀ ���û��� ǥ��
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

  // DB�� ����Ǿ����� ���� ��� DB ����
  if (not Dm_MainLib.MainDatabase.Connected) then
  begin
    ShpDatabaseConn.Brush.Color := CONN_STATUS_COLOR[0];
    if (Uf_DBConnection) then
    begin
      ShpDatabaseConn.Brush.Color := CONN_STATUS_COLOR[1];
    end;
  end
  // ����Ǿ� �ִ� ���
  else
  begin
    ShpDatabaseConn.Brush.Color := CONN_STATUS_COLOR[1];
  end;

  tmrConnectDB.Enabled := true;
end;

//------------------------------------------------------------------------------
// tmrEPLTOutTimer : ���ķ�Ʈ �ڵ���� ����
//------------------------------------------------------------------------------
procedure TfrmMain.tmrEPLTOutTimer(Sender: TObject);
var
  i, j, CargoCnt: Integer;
  WhereStr : String;
begin

  // PLC 2�� ��������� �����͸� �о��� ��쿡�� �����ϵ��� �ϱ� ����
  if (gCVRead = false ) then Exit;

  // ���ȷ�Ʈ ������ø� �����ϱ� ���� ���� ��. ���� ���� �Ϲ� ���� ����.
  for i := 1 to 2 do
  begin
    // 1. PLC�� (���� �ĸ�) ���ȷ�Ʈ �ڵ� ��� ��û Ȯ��
    if (Uf_GetCurrent('AUTO_OUT_EPLT', 'OPTION' + IntToStr(i)) = 'False') then Continue;

    CargoCnt := 0;
    // 2. ������ 1~4 ȭ�� ���� Ȯ��
    for j := 1 to 4 do
    begin
      if (gCVCR[i].Hogi[1].Exist[j] = '1') then Inc(CargoCnt);
    end;

    // 2.1 ȭ�� ������ 2�� �̻��̸� X
    if (CargoCnt >= 2) then Continue;

    // 3. ���ȷ�Ʈ ��� �۾� ���� Ȯ��. 2�� �̻��̸� X
    WhereStr := ' AND PLC_NO   = ' + QuotedStr(IntToStr(i)) +
                ' AND ORD_IO   = ' + QuotedStr('���') +
                ' AND ORD_TYPE = ' + QuotedStr('�ķ�Ʈ���');
    if(Uf_GetOrderCount(WhereStr) >= 2) then Continue;

    // �� ���ǵ��� ����ϸ� ���ȷ�Ʈ������ø� ����. (2�� ����)
    for j := 1 to 2 do
    begin
      InsertEPLT_ORDER('D', 'EPLT', IntToStr(i), '1');
    end;
  end;

end;

//------------------------------------------------------------------------------
// tmrMainTimer : ��� Timer Event
//------------------------------------------------------------------------------
procedure TfrmMain.tmrMainTimer(Sender: TObject);
var
  dataStr : string;
begin
  tmrMain.Enabled := False;
  ledSend.State := lsOff;

  dataStr := '';
  // ù �����0
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
        // �����б� �䱸 : ����(00) + RSB + (��������) + ������ + ���������
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
        // �����б� �䱸 : ����(00) + RSB + (��������) + ������ + ���������
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
        // �����б� �䱸 : ����(00) + RSB + (��������) + ������ + ���������
        dataStr := ENQ + '00'+ 'RSB'+'05'+'%MW52'+'03' + EOT;
        PLCWrite(1, 'SC', dataStr);
      end;
    end;
  end;

  tmrMain.Enabled := True;
end;

//------------------------------------------------------------------------------
//  tmrServerTimer : ���� ���� Ȯ�� Ÿ�̸�
//------------------------------------------------------------------------------
procedure TfrmMain.tmrServerTimer(Sender: TObject);
begin
  if (not FrontPLCSocket.Active) then
  begin
    btnComm.Caption := '��Ž���';
    ShpMFCInterfaceConn1.Brush.Color := CONN_STATUS_COLOR[0];
    FrontPLCSocket.Open;
  end;

  if (not RearPLCSocket.Active) then
  begin
    btnComm.Caption := '��Ž���';
    ShpMFCInterfaceConn2.Brush.Color := CONN_STATUS_COLOR[0];
    RearPLCSocket.Open;
  end;

  if (FrontPLCSocket.Active and RearPLCSocket.Active) then
  begin
    btnComm.Caption := '��Ÿ���';
    ShpMFCInterfaceConn1.Brush.Color := CONN_STATUS_COLOR[1];
    ShpMFCInterfaceConn2.Brush.Color := CONN_STATUS_COLOR[1];
  end;

end;

//------------------------------------------------------------------------------
//  tmrUPD_ORDSEQSELTimer : TT_ORDER�� ORD_SEQ_SEL�� �ϳ� ���õǵ��� ������Ʈ ���ִ� ���ν��� ȣ��
//------------------------------------------------------------------------------
procedure TfrmMain.tmrUPD_ORDSEQSELTimer(Sender: TObject);
begin
  tmrUPD_ORDSEQSEL.Enabled := False;

  Uf_UpdateOrdSeq();

  tmrUPD_ORDSEQSEL.Enabled := True;
end;

//------------------------------------------------------------------------------
//  TrackingProcess_CV : Device : PLC 1 or 2 , �����̾� Ʈ��ŷó��
//------------------------------------------------------------------------------
procedure TfrmMain.TrackingProcess_CV(Device: Integer);
var
  Job_No : Integer;
begin
  // �ڵ���尡 �ƴ� ��� Exit
  if (gCVCR[Device].Hogi[1].AutoMode = '0') or
     (rgCV.ItemIndex = 1) then
  begin
    Exit;
  end;

  // CV 1->2 �̵� �Ϸ�ó�� : 1->2 ������ �̵�
  if (gCVCR[Device].Hogi[1].StraightFinish[1] = '1') and
     (gCVCR[Device].Hogi[1].Exist[2] = '1') and
     (gCVCR[Device].Hogi[1].Error[1] = '0') and
     (Uf_TrackDataCheck(Device, 1) = True ) and
     (Uf_TrackDataCheck(Device, 2) = False )then
  begin
    // CV1 Data move to CV2
    Uf_TrackDBMove(Device, 2);

    // TT_ORDER.NOW_SITE ����
    Job_No := Uf_TrackGetJobNo(Device, 2);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '2');

    // CV1 �������� OFF
    gCVCW[Device].Hogi[1].StriOrder[1] := '0';
  end;
  // CV 2->3 �̵��Ϸ�ó�� : 2->3 ������ �̵�
  if (gCVCR[Device].Hogi[1].StraightFinish[2] = '1') and
     (gCVCR[Device].Hogi[1].Exist[3] = '1') and
     (gCVCR[Device].Hogi[1].Error[2] = '0') and
     (Uf_TrackDataCheck(Device, 2) = True ) and
     (Uf_TrackDataCheck(Device, 3) = False ) then
  begin
    // CV2 Data move to CV3
    Uf_TrackDBMove(Device, 3);

    // TT_ORDER.NOW_SITE ����
    Job_No := Uf_TrackGetJobNo(Device, 3);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '3');

    // CV2 �������� OFF
    gCVCW[Device].Hogi[1].StriOrder[2] := '0';
  end;
  // CV 3->4 �̵��Ϸ�ó�� : 3->4 ������ �̵� (��� �Ϸ�)
  if (gCVCR[Device].Hogi[1].StraightFinish[3] = '1') and
     (gCVCR[Device].Hogi[1].Exist[4] = '1') and
     (gCVCR[Device].Hogi[1].Error[3] = '0') and
     (Uf_TrackDataCheck(Device, 3) = True ) and
     (Uf_TrackDataCheck(Device, 4) = False )then
  begin
    // CV3 Data move to CV4
    Uf_TrackDBMove(Device, 4);

    // ��� �Ϸ� ó��
    Job_No := Uf_TrackGetJobNo(Device, 4);
    Uf_SetOrder(IntToStr(Job_No), 'STATUS', 'CV�Ϸ�');
    Uf_SetOrder(IntToStr(Job_No), 'END_YN', 'Y');
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '4');

    // �ķ�Ʈ����� ������ ��� �۾��Ϸ� ǥ�ú� �ҵ�
    if (Uf_GetOrder(IntToStr(Job_No), 'ORD_TYPE') = '�ķ�Ʈ���') then
    begin
      gCVCW[Device].Hogi[1].CompleteBell := '0';
    end
    // �κ����, ǰ������� ������ ����۾��Ϸ� ǥ�ú� ����
    else
    begin
      gCVCW[Device].Hogi[1].CompleteBell := '1';
    end;

    // CV3 �������� OFF
    gCVCW[Device].Hogi[1].StriOrder[3] := '0';
  end;
  // CV 4->5 �̵��Ϸ�ó�� : 4->5 �������̵�
  if (gCVCR[Device].Hogi[1].StraightFinish[4] = '1') and
     (gCVCR[Device].Hogi[1].Exist[5] = '1') and
     (gCVCR[Device].Hogi[1].Error[4] = '0') and
     (Uf_TrackDataCheck(Device, 4) = True ) and
     (Uf_TrackDataCheck(Device, 5) = False ) then
  begin
    // CV4 Data move to CV5
    Uf_TrackDBMove(Device, 5);

    // TT_ORDER.NOW_SITE ����
    Job_No := Uf_TrackGetJobNo(Device, 5);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '5');

    // CV4 �������� OFF
    gCVCW[Device].Hogi[1].StriOrder[4] := '0';
  end;
  // CV 5->6 �̵��Ϸ�ó�� : 5->6 �������̵�
  if (gCVCR[Device].Hogi[1].StraightFinish[5] = '1') and
     (gCVCR[Device].Hogi[1].Exist[6] = '1') and
     (gCVCR[Device].Hogi[1].Error[5] = '0') and
     (Uf_TrackDataCheck(Device, 5) = True ) and
     (Uf_TrackDataCheck(Device, 6) = False ) then
  begin
    // CV5 Data move to CV6
    Uf_TrackDBMove(Device, 6);

    // TT_ORDER.NOW_SITE ����
    Job_No := Uf_TrackGetJobNo(Device, 6);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '6');

    // CV5 �������� OFF
    gCVCW[Device].Hogi[1].StriOrder[5] := '0';
  end;
  // CV 6->7 �̵��Ϸ�ó�� : 6->7 �������̵�
  if (gCVCR[Device].Hogi[1].StraightFinish[6] = '1') and
     (gCVCR[Device].Hogi[1].Exist[7] = '1') and
     (gCVCR[Device].Hogi[1].Error[6] = '0') and
     (Uf_TrackDataCheck(Device, 6) = True ) and
     (Uf_TrackDataCheck(Device, 7) = False ) then
  begin
    // CV6 Data move to CV7
    Uf_TrackDBMove(Device, 7);

    // TT_ORDER.NOW_SITE ����
    Job_No := Uf_TrackGetJobNo(Device, 7);
    Uf_SetOrder(IntToStr(Job_No), 'NOW_SITE', IntToStr(Device) + '7');

    // Order Status ����: CV�̵� -> SC���
    Job_No := Uf_TrackGetJobNo(Device, 7);
    Uf_SetOrder(IntToStr(Job_No), 'STATUS', 'CV�Ϸ�');

    // CV6 �������� OFF
    gCVCW[Device].Hogi[1].StriOrder[6] := '0';
  end;

end;

end.
