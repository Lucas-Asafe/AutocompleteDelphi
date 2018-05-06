program prj_AutoComplete;

uses
  Vcl.Forms,
  uFrmCliente in 'uFrmCliente.pas' {FrmCliente},
  uClienteDAO in 'DAO\uClienteDAO.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uCliente in 'Model\uCliente.pas',
  uCidade in 'Model\uCidade.pas',
  uCidadeDAO in 'DAO\uCidadeDAO.pas',
  uFrmListarClientes in 'uFrmListarClientes.pas' {FrmListarClientes},
  uClienteValidador in 'Validacao\uClienteValidador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown   := (DebugHook <> 0);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmListarClientes, FrmListarClientes);
  Application.Run;
end.
