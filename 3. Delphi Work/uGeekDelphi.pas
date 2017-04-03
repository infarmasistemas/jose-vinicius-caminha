unit uGeekDelphi;

interface

uses
  Windows, Messages,  Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, jpeg, ExtCtrls, WebAdapt, WebComp,
  DBAdapt, DBClient, Grids, DBGrids,UVendas, RpCon, RpConDS, RpDefine,SysUtils,
  RpRave, RpBase, RpSystem;

type
  TFormMain = class(TForm)
    Cnn_DMD: TADOConnection;
    QryDMD: TADOQuery;
    Log: TMemo;
    Shape1: TShape;
    Image1: TImage;
    Image2: TImage;
    dsVendas: TDataSource;
    cdsVendas: TClientDataSet;
    dsaVendas: TDataSetAdapter;
    ADOQuery1: TADOQuery;
    ADOQuery1Dat_Venda: TStringField;
    ADOQuery1Cod_Cliente: TIntegerField;
    ADOQuery1Des_Client: TStringField;
    ADOQuery1Cod_Produto: TIntegerField;
    ADOQuery1Des_Produt: TStringField;
    ADOQuery1Qtd_Produto: TIntegerField;
    ADOQuery1Vlr_TotItem: TBCDField;
    btnMostraVendas: TButton;
    btnMedia: TButton;
    DataSource1: TDataSource;
    txtMedia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditServer: TEdit;
    btnConectar: TBitBtn;
    EditBanco: TEdit;
    EditUsuario: TEdit;
    EditSenha: TEdit;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    qrMedia: TADOQuery;
    rvprjVendas: TRvProject;
    rvdsVendas: TRvDataSetConnection;
    Button1: TButton;
    rvsysVendas: TRvSystem;
    qrRelatorio: TADOQuery;
    Label6: TLabel;
    procedure btnMostraVendasClick(Sender: TObject);
    procedure btnMediaClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure EscreveLog(PMsg: String);
    { Private declarations }
  public
    { Public declarations }
    procedure geramedia;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}


procedure TFormMain.btnConectarClick(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  try
    Cnn_DMD.Connected := False;
    EscreveLog('Conectando ao servidor DMD');
    EscreveLog('------------------------------------------------------------------------------------');
    try
      Cnn_DMD.ConnectionString := 'Provider=SQLOLEDB.1;Password='+EditSenha.Text+
                                  ';Persist Security Info=True;User ID='+EditUsuario.Text+
                                  ';Initial Catalog='+EditBanco.Text+
                                  ';Data Source='+EditServer.Text;
      Cnn_DMD.Connected := True;
      EscreveLog('Conexão realizada com sucesso!');
      EscreveLog('------------------------------------------------------------------------------------');
      btnConectar.Enabled := False;

      //Exemplo Consulta SQL
      QryDMD.Close;
      QryDMD.SQL.Clear;
      QryDMD.SQL.Add('select getdate(), @@SERVERNAME ');
      QryDMD.Open;
      EscreveLog( QryDMD.Fields[0].AsString +' - '+ QryDMD.Fields[1].AsString);
      QryDMD.Close;
      

    except
      btnConectar.Enabled := True;
      EditServer.SetFocus;
      EscreveLog('Erro ao conectar com o servidor');
      EscreveLog('------------------------------------------------------------------------------------');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormMain.EscreveLog(PMsg: String);
begin
  Log.Lines.Add(PMsg + ' : '+ DateTimeToStr(Now));
  Log.Repaint;
end;

procedure TFormMain.geramedia;
begin
   qrMedia.Close;
   qrMedia.SQL.Clear;
   qrMedia.SQL.Text :='select ((SUM(Qtd_Produto)  /30) * 5) total from VENDAS where Des_Produt =''NARIDRIN GTS AD 15 ML''';
   qrMedia.Open;

   txtMedia.Text := qrMedia.FieldByName('total').AsString;
end;

procedure TFormMain.btnMostraVendasClick(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text :=  'Select * From VENDAS';
  ADOQuery1.Open;

end;


procedure TFormMain.btnMediaClick(Sender: TObject);
begin
   geramedia;
end;



procedure TFormMain.FormCreate(Sender: TObject);
begin
txtMedia.Enabled := false;
end;

procedure TFormMain.Button1Click(Sender: TObject);
begin
//RvProject1.ExecuteReport();
  rvprjVendas.Execute;
end;

end.
