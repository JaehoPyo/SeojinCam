program RCP;

uses
  Vcl.Forms,
  RCP_Comm in 'RCP_Comm.pas' {frmMain},
  h_ReferLib in 'Lib\h_ReferLib.pas',
  d_MainLib in 'Lib\d_MainLib.pas' {Dm_MainLib: TDataModule},
  h_MainLib in 'Lib\h_MainLib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm_MainLib, Dm_MainLib);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
