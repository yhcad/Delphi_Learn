unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TAbout_Form = class(TForm)
    Panel1: TPanel;
    lblName: TLabel;
    lblVer: TLabel;
    lblRight: TLabel;
    Image1: TImage;
    bbtnclose: TBitBtn;
    lbRUL: TLabel;
    Label1: TLabel;
    procedure bbtncloseClick(Sender: TObject);
    procedure lbRULClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure lblRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About_Form: TAbout_Form;

implementation

{$R *.dfm}
uses ShellAPI,clipbrd; //������Ҫ����  //����clipbrd��Ԫ
procedure TAbout_Form.bbtncloseClick(Sender: TObject);
begin
 Close;
end;

procedure TAbout_Form.lbRULClick(Sender: TObject);
begin
   Shellexecute(0,'open',PChar(lbRUL.caption),nil,nil,SW_SHOWNORMAL);   //����...��ҳ
end;

procedure TAbout_Form.Label1Click(Sender: TObject);
begin
   ShellExecute(handle,nil,pchar('mailto:yhcad@163.com'),nil,nil,SW_SHOWNORMAL); //����...����
end;

procedure TAbout_Form.lblRightClick(Sender: TObject);
begin
  ClipBoard.AsText := '18649501';
  ShowMessage('QQ��18649501�ѳɹ����Ƶ������壡')
end;
end.
