object frmMostraVendas: TfrmMostraVendas
  Left = 222
  Top = 253
  Width = 1001
  Height = 400
  Align = alCustom
  Caption = 'Vendas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 153
    Width = 985
    Height = 209
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qrVendas: TADOQuery
    Active = True
    Connection = FormMain.Cnn_DMD
    CursorType = ctStatic
    DataSource = FormMain.dsVendas
    Parameters = <>
    SQL.Strings = (
      'select * from vendas')
    Left = 32
    Top = 40
    object qrVendasDat_Venda: TStringField
      FieldName = 'Dat_Venda'
      Size = 10
    end
    object qrVendasCod_Cliente: TIntegerField
      FieldName = 'Cod_Cliente'
    end
    object qrVendasDes_Client: TStringField
      FieldName = 'Des_Client'
      Size = 50
    end
    object qrVendasCod_Produto: TIntegerField
      FieldName = 'Cod_Produto'
    end
    object qrVendasDes_Produt: TStringField
      FieldName = 'Des_Produt'
      Size = 150
    end
    object qrVendasQtd_Produto: TIntegerField
      FieldName = 'Qtd_Produto'
    end
    object qrVendasVlr_TotItem: TBCDField
      FieldName = 'Vlr_TotItem'
      Precision = 18
    end
  end
  object DataSource1: TDataSource
    DataSet = qrVendas
    Left = 80
    Top = 40
  end
end
