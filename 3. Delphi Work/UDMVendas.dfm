object DMVendas: TDMVendas
  OldCreateOrder = False
  Left = 691
  Top = 319
  Height = 286
  Width = 404
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from vendas')
    Left = 504
    Top = 56
    object ADOQuery1Dat_Venda: TStringField
      FieldName = 'Dat_Venda'
      Size = 10
    end
    object ADOQuery1Cod_Cliente: TIntegerField
      FieldName = 'Cod_Cliente'
    end
    object ADOQuery1Des_Client: TStringField
      FieldName = 'Des_Client'
      Size = 50
    end
    object ADOQuery1Cod_Produto: TIntegerField
      FieldName = 'Cod_Produto'
    end
    object ADOQuery1Des_Produt: TStringField
      FieldName = 'Des_Produt'
      Size = 150
    end
    object ADOQuery1Qtd_Produto: TIntegerField
      FieldName = 'Qtd_Produto'
    end
    object ADOQuery1Vlr_TotItem: TBCDField
      FieldName = 'Vlr_TotItem'
      Precision = 18
    end
  end
end
