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
sno,sname:string; //定义两个字符型变量
begin
  if Edit1.Text =''  then
   begin
   showmessage('您没有输入数据！请录入学号和姓名。');
   exit;
   end;

  
    sno := Edit1.Text; // 对学号变量名赋值
    sname := Edit2.Text; // 对姓名变量名赋值
    Edit3.Text := '欢迎您' + sno + sname; // 对学号变量名赋值

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
Edit1.Clear;  //当光标进入编辑框时预清（清空）编辑框中的内容
Edit2.Clear;
Edit3.Clear;
end;

end.
