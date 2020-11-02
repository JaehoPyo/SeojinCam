unit h_MainLib;

interface

uses Graphics;

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
  Main_Info = Record
    IdPass : Boolean;
    ConChk : Boolean ;
    MenuName, MenuNumber, MenuTitle : String ;
    UserCode, UserName, UserPwd, UserGrade, UserAdmin, UserETC1, UserETC2 : String;
    WMS_NO : String;
    WRHS : String;
    PCPosition : integer;
    ReLogin : Boolean;
    ActiveFormID, ActiveFormName : String;
    ActivePCName, ActivePCAddr : String;
  end;
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
      1 : (All : Array [0..19] of AnsiChar);
      2 : (
           Storage_In    : AnsiChar;
           Storage_Out   : AnsiChar;
           Home_Return   : AnsiChar;
           MachineAction : AnsiChar;
           None1         : Array [0..1] of AnsiChar;
           Odd_Bay       : AnsiChar;
           Even_Bay      : AnsiChar;
           Station       : AnsiChar;                  // Station 2글자일 가능성 있음
           None2         : Array [0..6] of AnsiChar;  // Station 2글자일 가능성 있음 (0000 0001 or 0000 0000)
           Bay           : Array [0..1] of AnsiChar;  // 2글자, Hex or Dec
           Level         : Array [0..1] of AnsiChar;  // 2글자, Hex or Dec
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

implementation

end.
