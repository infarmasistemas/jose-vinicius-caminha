program GeekDelphi;

uses
  Forms,
  uGeekDelphi in 'uGeekDelphi.pas' {FormMain},
  UCliente in 'UCliente.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
