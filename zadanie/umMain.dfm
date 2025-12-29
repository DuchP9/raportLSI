object dmMain: TdmMain
  OldCreateOrder = False
  Height = 278
  Width = 463
  object dsDane: TDataSource
    DataSet = qryDane
    Left = 56
    Top = 152
  end
  object adoCon: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL;Data Source=PDUCH\SQLEXPRESS;Initial Catalog' +
      '=duchlsi;Integrated Security=SSPI;Encrypt=True;Trust Server Cert' +
      'ificate=True;'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 56
    Top = 40
  end
  object qryDane: TADOQuery
    Connection = adoCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'LocationName'
        Size = -1
        Value = Null
      end
      item
        Name = 'DateFrom'
        Size = -1
        Value = Null
      end
      item
        Name = 'DateTo'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM dbo.ExportHistory'
      'WHERE'
      '  LocationName = COALESCE(:LocationName, LocationName)'
      '  AND ExportDateTime >= COALESCE(:DateFrom, '#39'19000101'#39')'
      '  AND ExportDateTime <  COALESCE(:DateTo,   '#39'99991231'#39')')
    Left = 56
    Top = 88
    object qryDaneID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryDaneExportName: TWideStringField
      FieldName = 'ExportName'
      Size = 200
    end
    object qryDaneExportDateTime: TDateTimeField
      FieldName = 'ExportDateTime'
    end
    object qryDaneUserName: TWideStringField
      FieldName = 'UserName'
      Size = 100
    end
    object qryDaneLocationName: TWideStringField
      FieldName = 'LocationName'
      Size = 150
    end
  end
  object qryLokal: TADOQuery
    Connection = adoCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT DISTINCT'
      '  dbo.ExportHistory.LocationName'
      'FROM dbo.ExportHistory')
    Left = 152
    Top = 88
    object qryLokalLocationName: TWideStringField
      FieldName = 'LocationName'
      Size = 150
    end
  end
  object dsLokal: TDataSource
    DataSet = qryLokal
    Left = 152
    Top = 152
  end
end
