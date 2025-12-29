unit umMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MSAccDef,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc, Data.Win.ADODB, System.DateUtils;

type
  TdmMain = class(TDataModule)
    dsDane: TDataSource;
    adoCon: TADOConnection;
    qryDane: TADOQuery;
    qryDaneID: TAutoIncField;
    qryDaneExportName: TWideStringField;
    qryDaneExportDateTime: TDateTimeField;
    qryDaneUserName: TWideStringField;
    qryDaneLocationName: TWideStringField;
    qryLokal: TADOQuery;
    qryLokalLocationName: TWideStringField;
    dsLokal: TDataSource;
    qryDanecTime: TDateField;
    procedure qryDaneCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMain.qryDaneCalcFields(DataSet: TDataSet);
begin
  qryDane.FieldByName('cTime').AsDateTime := qryDane.FieldByName('ExportDateTime').AsDateTime;
end;

end.
