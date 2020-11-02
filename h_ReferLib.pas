//==============================================================================
//  SMIC 에서 사용하는 Library Function
//==============================================================================
unit h_ReferLib;

interface

uses Inifiles,Windows, Sysutils,StdCtrls, math;

  function  IniRead ( IniRoot , KeyName  , FieldName , ReadStr   : String ) : String;
  function  IniWrite( IniRoot , KeyName  , FieldName , WriteStr  : String ) : Boolean;
  procedure LogWrite( Filename, Msg : string );
  procedure LogFileCopy( Filename : string );
  function  HexStrToBinStr( HexStr : String) : String;
  function  BinStrToHexStr( BinStr : String ) : String; // 0010 0000 -> 20
  function StringToCaseSelect (Selector : string; CaseList: array of string): Integer;
  Function CharToHexaChar(Rs : char ) : String;

  function ReturnNumber ( Argb :boolean ) : integer;
  function AddLeadingZeroes(const aNumber, Length : integer) : string;
  function StrHexToStrBin(const Value: String):String;
  function StrBinToStrHex(const Value: String):String;
  function Data16To10(Rs : string) : integer;         // 'F'    -> 15
var
  BiteArray : Array [0..15] of String = ('0000', '0001', '0010', '0011', '0100', '0101',
                                         '0110', '0111', '1000', '1001', '1010', '1011',
                                         '1100', '1101', '1110', '1111');
implementation

//==============================================================================
// 스트링 2진수를 스트링 16진수로 변환
//==============================================================================
function StrBinToStrHex(const Value: String):String;
var nret, idx, i : Integer;
    formatstr:string;
begin
  Result:='';
  if (Length(Value) mod 4)=0 then
  begin
    nret := 0;
    idx := 0;
    for i := Length(Value) downto 1 do
    begin
      nret := nret +  StrToIntDef(Value[i],0) * Trunc(Power(2, idx));
      Inc(idx);
    end;
    formatstr:='%.'+ IntToStr(round(Length(Value)/4))+'X';
    Result := Format(formatstr, [nret]);
  end;
end;

//==============================================================================
// 스트링 16진수를 스트링 2진수로 변환
//==============================================================================
function StrHexToStrBin(const Value: String):String;
const
   BitArray: array[0..15] of string =
       ('0000', '0001', '0010', '0011',
        '0100', '0101', '0110', '0111',
        '1000', '1001', '1010', '1011',
        '1100', '1101', '1110', '1111');
var Index: Integer;
    Str:String;
begin
  Result:='';
  Str:=UpperCase(Value);
  for Index := 1 to Length(Str) do
  begin
    if ((Str[Index]>='0') and (Str[Index]<='9')) or
       ((Str[Index]>='A') and (Str[Index]<='F')) then
    begin
      Result := Result + BitArray[StrToInt('$'+Str[Index])];
    end;
  end;
end;

function StringToCaseSelect (Selector : string; CaseList: array of string): Integer;
var cnt: integer;
begin
   Result:=-1;
   for cnt:=0 to Length(CaseList)-1 do
begin
     if CompareText(Selector, CaseList[cnt]) = 0 then
     begin
       Result:=cnt;
       Break;
     end;
   end;
end;

//==============================================================================
// INI 파일에서 Key Field 의 값을 읽어온다
//==============================================================================
function IniRead( IniRoot , KeyName , FieldName , ReadStr : String ): String;
var
  Ini_File : TIniFile;
begin
  try
    Ini_File := TIniFile.Create(ExpandFileName(IniRoot));
    try
      Result := PChar(Ini_File.ReadString(KeyName, FieldName, ReadStr));
    finally
      Ini_File := nil;
      Ini_File.Free;
    end;
  except
    Result := ReadStr;
  end;
end;

//==============================================================================
// INI 파일에서 Key Field 의 값을 기록한다
//==============================================================================
function IniWrite ( IniRoot , KeyName, FieldName, WriteStr : String ): Boolean ;
var Ini_File   : TIniFile;
begin
  try
    Ini_File := TIniFile.Create( ExpandFileName ( IniRoot )  );
    try
      Ini_File.WriteString( KeyName, FieldName, WriteStr  );
      Result := True;
    finally
      Ini_File := nil;
      Ini_File.Free;
    end;
  except
    Result := False;
  end;
end;

procedure LogWrite( Filename, Msg : string );
var
  F: TextFile;
  S: file of Byte;
  Rc : integer;
  Size : Longint;
  LogFile    : string;
begin

  LogFile := Filename ;

  if FileExists(LogFile) then
  begin
    AssignFile(S, LogFile);
    Reset(S);

    Size := FileSize(S);
    CloseFile(S);
    if (size > 5000000) then
    begin  //10KB   //1K is 1000Byte
      LogFileCopy(Filename);
      Rc := 0; // 0:생성
    end else
      Rc := 1; // 추가
  end else
    Rc := 0 ;

  AssignFile(F, LogFile);
  if Rc = 1 then
     Append(F)   // 추가
  else
     Rewrite(F); // 파일 생성

  Writeln(F, FormatDateTime('YYYY-MM-DD HH:NN:SS ', Now) + Msg);
  CloseFile(F);
end;

procedure LogFileCopy(Filename:string);
var
  F: TextFile;
  R: TextFile;
  LogFile    : string;
  LogFileOld : string;
  Msg        : string;
  i : integer;
begin
  LogFile    := Filename ;

  for i := length(Filename) downto 1 do
  begin
    if  Filename[i] = '.' then
    begin
      msg := copy(Filename,1,i-1) + '.x'+ copy(Filename,i+1,length(Filename)-i );
      break;
    end;
  end;

  if Msg = '' then
    LogFileOld := Filename + FormatDateTime('YYMMDDhhnn', Now)
  else
     LogFileOld := Msg + FormatDateTime('YYMMDDhhnn', Now);

  // Read File 처리
  AssignFile(R, LogFile);
  Reset(R);
  ReadLn(R, Msg);

  // Write File  처리
  AssignFile(F, LogFileOld);
  Rewrite(F); // 파일 생성
  Writeln(F, Msg );

  while not Eof(R) do
  begin
    ReadLn( R, Msg );
    Writeln(F, Msg );
  end;
  CloseFile(R);
  CloseFile(F);
end;

function  HexStrToBinStr( HexStr : String) : String;        // 'FFA1' -> '1111111110100001'
var
    i   : Integer;
begin
  Result := '' ;
  for i := 1 to Length(HexStr) do
  begin
    Result := Result + BiteArray[strtoint('$'+ HexStr[i])];
  end;
end;

function  BinStrToHexStr( BinStr : String ) : String; // 0010 -> 2
var i, j : Integer;
begin
  Result := '' ;
  For i := 1 to (Length(Binstr) div 4) do
  begin
    for j := low(BiteArray) to high(BiteArray) do
    begin
      if Copy(Binstr, ((i-1)*4)+1, 4) = BiteArray[j] then Break;
    end;
    Result := Result + inttohex(j, 0);
  End;
end;


//---------------------------------------------------------------------------
// 로그 저장 Procedure
//---------------------------------------------------------------------------
procedure LogWriteStr( memLog : Tmemo; WriteStr : String; bLogSave :boolean );
var
  filename : string;
  i : integer;
begin
  if memLog.Lines.Count > 50 then
  begin
    for i := 1 to 2 do
    begin
      memLog.Lines.Delete(i);
    end;
  end;
  memLog.lines.add(WriteStr);

  if bLogSave then
  begin
    filename := '.\Log\RCP' + FormatDatetime('YYYYMMDD', now) + '.log';
    LogWrite(filename,WriteStr);
  end;

end;


//-----------------------------------------------------------------------------
//  ShowMessage(HexStrToDecStr('FFA1'));
//  Returns 1111111110100001
//-----------------------------------------------------------------------------
Function  HexStrToDecStr( HexStr : String) : String;        // 'FFA1' -> '1111111110100001'
begin
    Result := '' ;

    if HexStr = '' then
        Result := ''
    else
        Result := inttostr(StrToInt('$' + HexStr));
end;


//-----------------------------------------------------------------------------
// Usage:
// AddLeadingZeroes(2005, 10) ;
// Will result in a '0000002005' string value.
//-----------------------------------------------------------------------------
function AddLeadingZeroes(const aNumber, Length : integer) : string;
begin
   result := Format('%.*d', [Length, aNumber]) ;
end;


function ReturnNumber ( Argb :boolean ) : integer;
begin

    if Argb then result := 1
    else  result := 0;
end;

Function CharToHexaChar(Rs : char ) : String;
begin

   case Rs of
     chr($00): Result := '00';
     chr($01): Result := '01';
     chr($02): Result := '02';
     chr($03): Result := '03';
     chr($04): Result := '04';
     chr($05): Result := '05';
     chr($06): Result := '06';
     chr($07): Result := '07';
     chr($08): Result := '08';
     chr($09): Result := '09';
     chr($0A): Result := '0A';
     chr($0B): Result := '0B';
     chr($0C): Result := '0C';
     chr($0D): Result := '0D';
     chr($0E): Result := '0E';
     chr($0F): Result := '0F';

     chr($10): Result := '10';
     chr($11): Result := '11';
     chr($12): Result := '12';
     chr($13): Result := '13';
     chr($14): Result := '14';
     chr($15): Result := '15';
     chr($16): Result := '16';
     chr($17): Result := '17';
     chr($18): Result := '18';
     chr($19): Result := '19';
     chr($1A): Result := '1A';
     chr($1B): Result := '1B';
     chr($1C): Result := '1C';
     chr($1D): Result := '1D';
     chr($1E): Result := '1E';
     chr($1F): Result := '1F';

     chr($20): Result := '20';
     chr($21): Result := '21';
     chr($22): Result := '22';
     chr($23): Result := '23';
     chr($24): Result := '24';
     chr($25): Result := '25';
     chr($26): Result := '26';
     chr($27): Result := '27';
     chr($28): Result := '28';
     chr($29): Result := '29';
     chr($2A): Result := '2A';
     chr($2B): Result := '2B';
     chr($2C): Result := '2C';
     chr($2D): Result := '2D';
     chr($2E): Result := '2E';
     chr($2F): Result := '2F';

     chr($30): Result := '30';
     chr($31): Result := '31';
     chr($32): Result := '32';
     chr($33): Result := '33';
     chr($34): Result := '34';
     chr($35): Result := '35';
     chr($36): Result := '36';
     chr($37): Result := '37';
     chr($38): Result := '38';
     chr($39): Result := '39';
     chr($3A): Result := '3A';
     chr($3B): Result := '3B';
     chr($3C): Result := '3C';
     chr($3D): Result := '3D';
     chr($3E): Result := '3E';
     chr($3F): Result := '3F';

     chr($40): Result := '40';
     chr($41): Result := '41';
     chr($42): Result := '42';
     chr($43): Result := '43';
     chr($44): Result := '44';
     chr($45): Result := '45';
     chr($46): Result := '46';
     chr($47): Result := '47';
     chr($48): Result := '48';
     chr($49): Result := '49';
     chr($4A): Result := '4A';
     chr($4B): Result := '4B';
     chr($4C): Result := '4C';
     chr($4D): Result := '4D';
     chr($4E): Result := '4E';
     chr($4F): Result := '4F';

     chr($50): Result := '50';
     chr($51): Result := '51';
     chr($52): Result := '52';
     chr($53): Result := '53';
     chr($54): Result := '54';
     chr($55): Result := '55';
     chr($56): Result := '56';
     chr($57): Result := '57';
     chr($58): Result := '58';
     chr($59): Result := '59';
     chr($5A): Result := '5A';
     chr($5B): Result := '5B';
     chr($5C): Result := '5C';
     chr($5D): Result := '5D';
     chr($5E): Result := '5E';
     chr($5F): Result := '5F';

     chr($60): Result := '60';
     chr($61): Result := '61';
     chr($62): Result := '62';
     chr($63): Result := '63';
     chr($64): Result := '64';
     chr($65): Result := '65';
     chr($66): Result := '66';
     chr($67): Result := '67';
     chr($68): Result := '68';
     chr($69): Result := '69';
     chr($6A): Result := '6A';
     chr($6B): Result := '6B';
     chr($6C): Result := '6C';
     chr($6D): Result := '6D';
     chr($6E): Result := '6E';
     chr($6F): Result := '6F';

     chr($70): Result := '70';
     chr($71): Result := '71';
     chr($72): Result := '72';
     chr($73): Result := '73';
     chr($74): Result := '74';
     chr($75): Result := '75';
     chr($76): Result := '76';
     chr($77): Result := '77';
     chr($78): Result := '78';
     chr($79): Result := '79';
     chr($7A): Result := '7A';
     chr($7B): Result := '7B';
     chr($7C): Result := '7C';
     chr($7D): Result := '7D';
     chr($7E): Result := '7E';
     chr($7F): Result := '7F';

     chr($80): Result := '80';
     chr($81): Result := '81';
     chr($82): Result := '82';
     chr($83): Result := '83';
     chr($84): Result := '84';
     chr($85): Result := '85';
     chr($86): Result := '86';
     chr($87): Result := '87';
     chr($88): Result := '88';
     chr($89): Result := '89';
     chr($8A): Result := '8A';
     chr($8B): Result := '8B';
     chr($8C): Result := '8C';
     chr($8D): Result := '8D';
     chr($8E): Result := '8E';
     chr($8F): Result := '8F';

     chr($90): Result := '90';
     chr($91): Result := '91';
     chr($92): Result := '92';
     chr($93): Result := '93';
     chr($94): Result := '94';
     chr($95): Result := '95';
     chr($96): Result := '96';
     chr($97): Result := '97';
     chr($98): Result := '98';
     chr($99): Result := '99';
     chr($9A): Result := '9A';
     chr($9B): Result := '9B';
     chr($9C): Result := '9C';
     chr($9D): Result := '9D';
     chr($9E): Result := '9E';
     chr($9F): Result := '9F';

     chr($A0): Result := 'A0';
     chr($A1): Result := 'A1';
     chr($A2): Result := 'A2';
     chr($A3): Result := 'A3';
     chr($A4): Result := 'A4';
     chr($A5): Result := 'A5';
     chr($A6): Result := 'A6';
     chr($A7): Result := 'A7';
     chr($A8): Result := 'A8';
     chr($A9): Result := 'A9';
     chr($AA): Result := 'AA';
     chr($AB): Result := 'AB';
     chr($AC): Result := 'AC';
     chr($AD): Result := 'AD';
     chr($AE): Result := 'AE';
     chr($AF): Result := 'AF';

     chr($B0): Result := 'B0';
     chr($B1): Result := 'B1';
     chr($B2): Result := 'B2';
     chr($B3): Result := 'B3';
     chr($B4): Result := 'B4';
     chr($B5): Result := 'B5';
     chr($B6): Result := 'B6';
     chr($B7): Result := 'B7';
     chr($B8): Result := 'B8';
     chr($B9): Result := 'B9';
     chr($BA): Result := 'BA';
     chr($BB): Result := 'BB';
     chr($BC): Result := 'BC';
     chr($BD): Result := 'BD';
     chr($BE): Result := 'BE';
     chr($BF): Result := 'BF';

     chr($C0): Result := 'C0';
     chr($C1): Result := 'C1';
     chr($C2): Result := 'C2';
     chr($C3): Result := 'C3';
     chr($C4): Result := 'C4';
     chr($C5): Result := 'C5';
     chr($C6): Result := 'C6';
     chr($C7): Result := 'C7';
     chr($C8): Result := 'C8';
     chr($C9): Result := 'C9';
     chr($CA): Result := 'CA';
     chr($CB): Result := 'CB';
     chr($CC): Result := 'CC';
     chr($CD): Result := 'CD';
     chr($CE): Result := 'CE';
     chr($CF): Result := 'CF';

     chr($D0): Result := 'D0';
     chr($D1): Result := 'D1';
     chr($D2): Result := 'D2';
     chr($D3): Result := 'D3';
     chr($D4): Result := 'D4';
     chr($D5): Result := 'D5';
     chr($D6): Result := 'D6';
     chr($D7): Result := 'D7';
     chr($D8): Result := 'D8';
     chr($D9): Result := 'D9';
     chr($DA): Result := 'DA';
     chr($DB): Result := 'DB';
     chr($DC): Result := 'DC';
     chr($DD): Result := 'DD';
     chr($DE): Result := 'DE';
     chr($DF): Result := 'DF';

     chr($E0): Result := 'E0';
     chr($E1): Result := 'E1';
     chr($E2): Result := 'E2';
     chr($E3): Result := 'E3';
     chr($E4): Result := 'E4';
     chr($E5): Result := 'E5';
     chr($E6): Result := 'E6';
     chr($E7): Result := 'E7';
     chr($E8): Result := 'E8';
     chr($E9): Result := 'E9';
     chr($EA): Result := 'EA';
     chr($EB): Result := 'EB';
     chr($EC): Result := 'EC';
     chr($ED): Result := 'ED';
     chr($EE): Result := 'EE';
     chr($EF): Result := 'EF';

     chr($F0): Result := 'F0';
     chr($F1): Result := 'F1';
     chr($F2): Result := 'F2';
     chr($F3): Result := 'F3';
     chr($F4): Result := 'F4';
     chr($F5): Result := 'F5';
     chr($F6): Result := 'F6';
     chr($F7): Result := 'F7';
     chr($F8): Result := 'F8';
     chr($F9): Result := 'F9';
     chr($FA): Result := 'FA';
     chr($FB): Result := 'FB';
     chr($FC): Result := 'FC';
     chr($FD): Result := 'FD';
     chr($FE): Result := 'FE';
     chr($FF): Result := 'FF';
     ELSE      Result := '00';
  end;

end;

Function HexaToChar(Rs : string ) : String; // chr($ff) -> 'FF'
begin

      if (Rs = '') or (Rs = Char($00)) then begin
         Result := '00';
         exit;
      end;
      Result := CharToHexaChar(Rs[1]) ;

end;



Function CharStrToBinStr(Rs : string ) : String;
var
    Str,RStr : String;
    I   : Integer;
begin

    Str   := Rs ;
    RStr  := '' ;
    For i := 1 to Length(Str) do
    begin

        Case Str[I] of
           '0'      : RStr := RStr + '0000';
           '1'      : RStr := RStr + '0001';
           '2'      : RStr := RStr + '0010';
           '3'      : RStr := RStr + '0011';
           '4'      : RStr := RStr + '0100';
           '5'      : RStr := RStr + '0101';
           '6'      : RStr := RStr + '0110';
           '7'      : RStr := RStr + '0111';
           '8'      : RStr := RStr + '1000';
           '9'      : RStr := RStr + '1001';
           'a', 'A' : RStr := RStr + '1010';
           'b', 'B' : RStr := RStr + '1011';
           'c', 'C' : RStr := RStr + '1100';
           'd', 'D' : RStr := RStr + '1101';
           'e', 'E' : RStr := RStr + '1110';
           'f', 'F' : RStr := RStr + '1111';
        end;

    End;


    result := RStr;

end;

function Data16To10(Rs : string) : integer; // 'F' -> 15
begin
   result := 0;
   case Rs[1] of
   'F' :  Result := 15;
   'E' :  Result := 14;
   'D' :  Result := 13;
   'C' :  Result := 12;
   'B' :  Result := 11;
   'A' :  Result := 10;
   '9' :  Result := 9;
   '8' :  Result := 8;
   '7' :  Result := 7;
   '6' :  Result := 6;
   '5' :  Result := 5;
   '4' :  Result := 4;
   '3' :  Result := 3;
   '2' :  Result := 2;
   '1' :  Result := 1;
   end;
end;

end.
