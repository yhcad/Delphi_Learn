unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
sno,sname:string; //���������ַ��ͱ���
begin
  if Edit1.Text =''  then
   begin
   showmessage('��û���������ݣ���¼��ѧ�ź�������');
   exit;
   end;

  
    sno := Edit1.Text; // ��ѧ�ű�������ֵ
    sname := Edit2.Text; // ��������������ֵ
    Edit3.Text := '��ӭ��' + sno + sname; // ��ѧ�ű�������ֵ

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
Edit1.Clear;  //��������༭��ʱԤ�壨��գ��༭���е�����
Edit2.Clear;
Edit3.Clear;
end;

end.
