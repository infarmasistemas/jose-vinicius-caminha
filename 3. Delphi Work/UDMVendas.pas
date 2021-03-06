unit UDMVendas;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMVendas = class(TDataModule)
    ADOQuery1: TADOQuery;
    ADOQuery1Dat_Venda: TStringField;
    ADOQuery1Cod_Cliente: TIntegerField;
    ADOQuery1Des_Client: TStringField;
    ADOQuery1Cod_Produto: TIntegerField;
    ADOQuery1Des_Produt: TStringField;
    ADOQuery1Qtd_Produto: TIntegerField;
    ADOQuery1Vlr_TotItem: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVendas: TDMVendas;

implementation

uses uGeekDelphi, UVendas;

{$R *.dfm}

end.
