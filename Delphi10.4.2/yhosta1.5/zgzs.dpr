program zgzs;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FrmMain},
  Udm in 'Udm.pas' {dm: TDataModule},
  About in 'About.pas' {About_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TAbout_Form, About_Form);
  Application.Run;
end.
