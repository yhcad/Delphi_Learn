program Project1;

uses
  Forms,
  lately in 'lately.pas' {lately_Form3},
  zxnl in 'zxnl.pas' {zxnl_Form2},
  About in 'About.pas' {About_Form},
  Main in 'Main.pas' {Main_Form1},
  lszs in 'lszs.pas' {lszs_Form4},
  zxnlls in 'zxnlls.pas' {zxnlls_Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '玉环县职业资格证书查询系统V1.2';
  Application.CreateForm(TMain_Form1, Main_Form1);
  Application.CreateForm(Tlately_Form3, lately_Form3);
  Application.CreateForm(Tzxnl_Form2, zxnl_Form2);
  Application.CreateForm(TAbout_Form, About_Form);
  Application.CreateForm(Tlszs_Form4, lszs_Form4);
  Application.CreateForm(Tzxnlls_Form5, zxnlls_Form5);
  Application.Run;
end.
