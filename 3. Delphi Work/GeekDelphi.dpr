program GeekDelphi;

uses
  Forms,
  uGeekDelphi in 'uGeekDelphi.pas' {FormMain},
  UVendas in 'UVendas.pas' {frmMostraVendas},
  UDMVendas in 'UDMVendas.pas' {DMVendas: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TfrmMostraVendas, frmMostraVendas);
  Application.CreateForm(TDMVendas, DMVendas);
  Application.Run;
end.
