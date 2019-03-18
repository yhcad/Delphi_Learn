unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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
  V: Variant; //定义变体型变量
  S: string; //定义字符串变量
begin
  V := '变体型变量测试：';    //v为字符串
  S := V;
  V := 2;                     //v为整数
  V := V * 3.14;              //v为实数
  Edit1.Text := S + FloatToStr(V);  //v中实型值转换为字符型
end;

end.

