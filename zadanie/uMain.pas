unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.DB, cxDBData, cxContainer, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxDropDownEdit, cxCalendar, dxLayoutContainer,
  dxLayoutControl, cxTextEdit, cxMaskEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, System.DateUtils, cxDBEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfMain = class(TForm)
    panGrid: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dDataOd: TcxDateEdit;
    dDataDo: TcxDateEdit;
    btZatwierdz: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    cxGrid1DBTableView1ExportName: TcxGridDBColumn;
    cxGrid1DBTableView1ExportDateTime: TcxGridDBColumn;
    cxGrid1DBTableView1UserName: TcxGridDBColumn;
    cxGrid1DBTableView1LocationName: TcxGridDBColumn;
    lcbLokal: TcxLookupComboBox;
    procedure btZatwierdzClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses umMain;

{$R *.dfm}

procedure TfMain.btZatwierdzClick(Sender: TObject);
var
  Loc: string;
  DtFrom, DtTo: TDateTime;
begin
  if (not VarIsNull(dDataOd.EditValue)) and (not VarIsNull(dDataDo.EditValue)) then
  begin
    DtFrom := Trunc(VarToDateTime(dDataOd.EditValue));
    DtTo   := Trunc(VarToDateTime(dDataDo.EditValue));

    if DtFrom > DtTo then
    begin
      MessageDlg('B³êdny zakres dat.',
        mtWarning, [mbOK], 0);
      Exit;
    end;
  end;

  with dmMain.qryDane do
  begin
    Close;

    Loc := Trim(lcbLokal.Text);
    if Loc = '' then
      Parameters.ParamByName('LocationName').Value := Null
    else
      Parameters.ParamByName('LocationName').Value := Loc;

    if VarIsNull(dDataOd.EditValue) then
      Parameters.ParamByName('DateFrom').Value := Null
    else
      Parameters.ParamByName('DateFrom').Value := Trunc(VarToDateTime(dDataOd.EditValue));

    if VarIsNull(dDataDo.EditValue) then
      Parameters.ParamByName('DateTo').Value := Null
    else
      Parameters.ParamByName('DateTo').Value := IncDay(Trunc(VarToDateTime(dDataDo.EditValue)), 1);

    Open;
  end;
end;

procedure TfMain.FormShow(Sender: TObject);
begin

  with dmMain.qryDane.Parameters do
  begin
    ParamByName('LocationName').DataType := ftWideString;
    ParamByName('LocationName').Size := 150;

    ParamByName('DateFrom').DataType := ftDateTime;
    ParamByName('DateTo').DataType := ftDateTime;
  end;

  dmMain.qryDane.Parameters.ParamByName('LocationName').Value := Null;
  dmMain.qryDane.Parameters.ParamByName('DateFrom').Value := Null;
  dmMain.qryDane.Parameters.ParamByName('DateTo').Value := Null;

  dmMain.qryLokal.Close;
  dmMain.qryLokal.Open;
end;

end.
