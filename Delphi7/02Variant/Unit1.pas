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
  V: Variant; //��������ͱ���
  S: string; //�����ַ�������
begin
  V := '�����ͱ������ԣ�';    //vΪ�ַ���
  S := V;
  V := 2;                     //vΪ����
  V := V * 3.14;              //vΪʵ��
  Edit1.Text := S + FloatToStr(V);  //v��ʵ��ֵת��Ϊ�ַ���
end;

end.

