program zadanie;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  umMain in 'umMain.pas' {dmMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
end.
