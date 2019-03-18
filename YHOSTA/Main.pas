unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, ImgList, DB, ADODB, Grids, DBGrids,StdCtrls,IniFiles,
  Menus, Buttons;       //����IniFiles��Ԫ

type
    TMain_Form1 = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    dl_Button1: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    xs_Button2: TButton;
    cf_Button3: TButton;
    qk_Button4: TButton;
    ADOConnection2: TADOConnection;
    ADOQuery2: TADOQuery;
    OpenDialog1: TOpenDialog;
    qu_Button5: TButton;
    DBGrid1: TDBGrid;
    ToolButton1: TToolButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Excel1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    tq_Button6: TButton;
    ToolButton2: TToolButton;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    ToolButton3: TToolButton;
    BitBtn1: TBitBtn;
    N18: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure xs_Button2Click(Sender: TObject);
    procedure cf_Button3Click(Sender: TObject);
    procedure qk_Button4Click(Sender: TObject);
    procedure dl_Button1Click(Sender: TObject);
    procedure qu_Button5Click(Sender: TObject);
    procedure tq_Button6Click(Sender: TObject);
    procedure dl_Button1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N9Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   Main_Form1: TMain_Form1;
   MyInifile: TInifile;
implementation

uses zxnl,About,lately,lszs,zxnlls;

{$R *.dfm}

 procedure TMain_Form1.FormCreate(Sender: TObject); //�����崴��ʱ���������ļ��ж�ȡ���ݿ����Ӳ���
Var
      Filename,server,database,user,password: String;
begin
     try
         Filename:= ExtractFilePath(paramstr(0))+'config.ini';   //�����ļ�config.ini�����Ӧ�ó���ǰĿ¼��
         MyInifile:= TInifile.Create(Filename);   //��INI�ļ�
         server := MyInifile.ReadString('DBConn','Data Source','');        {SQL��������}
         database :=  MyInifile.ReadString('DBConn','Initial Catalog','');  {SQL���ݿ���}
         user :=    MyInifile.ReadString('DBConn','User ID','');          {SQL���ݿ��û���}
         password := MyInifile.ReadString('DBConn','Password','');        {SQL���ݿ�����}
         MyInifile.Free;
         ADOConnection1.Connected := False;        //����SQL����
         ADOConnection1.ConnectionString := 'Provider=SQLOLEDB.1; Password= ' + Password +';Persist Security Info=False;User ID=' + user + ';Initial Catalog=' + database + ';Data Source=' + server +';Tag with column collation when possible=True;';
         ADOConnection1.Connected := True;
   except
        MessageBox(Handle,'���ݿ�����ʧ�ܣ�'+ #13 +'����ȷ�������ݿ����ӣ�','ʧ����ʾ��',MB_OK+MB_ICONINFORMATION);
        ADOquery1.Close;
        Application.Terminate;
   end;
end;


 procedure TMain_Form1.qk_Button4Click(Sender: TObject);   //��������� T_yhks_tmp
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'DELETE FROM T_yhks_tmp';
   ADOquery1.ExecSQL;
end;


 procedure TMain_Form1.dl_Button1Click(Sender: TObject);  //�ڵ���Excel����
  var
  sFileName, sTableName: string;
  sl: TStringList;
  i: integer;
 begin
  if not OpenDialog1.Execute then  Exit;
  if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
 try
  sFileName := OpenDialog1.FileName;
  ADOConnection2.Connected := False;    //����EXCEL����
  ADOConnection2.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=' + sFileName + ';Extended Properties="Excel 8.0;HDR=YES;IMEX=1";Persist Security Info=False';
  ADOConnection2.Connected := True;

  sl := TStringList.Create;
  ADOConnection2.GetTableNames(sl);   //Excel��������
  sTableName := sl[0];
  if Pos('$', sTableName) > 0 then sTableName := '[' + sTableName + ']';

  ADOquery2.Close;
  ADOquery2.SQL.Clear;
  ADOquery2.SQL.Text := 'SELECT * FROM ' + sTableName;
  ADOquery2.Open;
  sl.Free;


  ADOquery1.Close;
  ADOquery1.SQL.Clear;
  ADOquery1.Sql.Text := 'SELECT * FROM T_yhks_tmp';  //�򿪼�¼����������� insert,����append
  ADOquery1.Open;

  if ADOquery2.RecordCount > 0 then
  begin

    ADOquery2.First;
    for i := 0 to ADOquery2.RecordCount do
    begin
        ADOquery1.Append;
        ADOquery1.FieldValues['kh']:=ADOquery2.FieldValues['����'];
        ADOquery1.FieldValues['sfzh']:=ADOquery2.FieldValues['���֤��'];
        ADOquery1.FieldValues['ksxm']:=ADOquery2.FieldValues['����'];
        ADOquery1.FieldValues['zygz']:=ADOquery2.FieldValues['ְҵ'];
        ADOquery1.FieldValues['jdjb']:=ADOquery2.FieldValues['�ȼ�'];
        ADOquery1.FieldValues['xb']:=ADOquery2.FieldValues['�Ա�'];
        ADOquery1.FieldValues['csrq']:=ADOquery2.FieldValues['��������'];
        ADOquery1.FieldValues['bmdw']:=ADOquery2.FieldValues['������λ'];
        ADOquery1.FieldValues['gl']:=ADOquery2.FieldValues['����'];
        ADOquery1.FieldValues['whcd']:=ADOquery2.FieldValues['�Ļ��̶�'];
        ADOquery1.FieldValues['ksly']:=ADOquery2.FieldValues['������Դ'];
        ADOquery1.FieldValues['lrcj']:=ADOquery2.FieldValues['���۳ɼ�'];
        ADOquery1.FieldValues['sccj']:=ADOquery2.FieldValues['ʵ�ٳɼ�'];
        ADOquery1.FieldValues['lxdh']:=ADOquery2.FieldValues['��ϵ�绰'];
        ADOquery1.FieldValues['bz']:=ADOquery2.FieldValues['��ע'];
        ADOquery1.ExecSQL;
        ADOquery2.Next;
     end;
    end;
         MessageBox(Handle,'���ݵ���ɹ���','�����ʾ��',MB_OK+MB_ICONINFORMATION);
    except
        MessageBox(Handle,'���ݵ���ʧ�ܣ����顾���֤�š��Ƿ��ظ���'+ #13 +'��������д��������뵼��������ظ���','ʧ����ʾ��',MB_OK+MB_ICONINFORMATION);

    end;
  end;


procedure TMain_Form1.xs_Button2Click(Sender: TObject);  //����ʾ����,��ʾT_yhks_tmp������
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'SELECT  * FROM T_yhks_tmp ORDER BY kh';
   ADOquery1.Open;
end;

procedure TMain_Form1.cf_Button3Click(Sender: TObject); //��֤���ظ���ѯ
begin
     if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
      ADOquery1.Close;
      ADOquery1.Sql.Clear; //��ѯ���������֤�š�ְҵ�͵ȼ���ͬ������
      ADOquery1.Sql.Text := 'Select  a.kh, a.sfzh,  a.ksxm, a.zygz, a.jdjb, a.xb, a.csrq, a.gl, a.whcd, a.lxdh,b.bmdw, b.zsh,b.kspc, b.bzrq From  T_yhks_tmp a,T_yhlszs b   Where a.sfzh = b.sfzh   And  a.zygz = b.zygz  And a.jdjb = b.jdjb   order by kh' ;
      ADOquery1.Open;
end;


 procedure TMain_Form1.tq_Button6Click(Sender: TObject); //��ͬ���ظ���ѯ
begin
      if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
      ADOquery1.Close;
      ADOquery1.Sql.Clear; //��ѯ���������֤�š�ְҵ�͵ȼ���ͬ������
      ADOquery1.Sql.Text := 'Select  a.kh, a.sfzh,  a.ksxm, a.zygz, a.jdjb, a.xb, a.csrq, a.gl, a.whcd, a.lxdh, b.bmdw  From  T_yhks_tmp a, T_yhks b   Where a.sfzh = b.sfzh   And  a.zygz = b.zygz  And a.jdjb = b.jdjb   order by a.kh' ;
      ADOquery1.Open;
end;



 procedure TMain_Form1.BitBtn1Click(Sender: TObject); //������������T_yhks��
  var
   sqlstr1,sqlstr2 :string;
begin
      sqlstr1:='Insert into  T_yhks(kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz) Select kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz';
      sqlstr2:= ' From  T_yhks_tmp a where not exists (select 1 From T_yhks b where sfzh=a.sfzh and zygz=a.zygz and jdjb=a.jdjb)';

      if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
      ADOquery1.Close;
      ADOquery1.Sql.Clear;
      ADOquery1.sql.add(sqlstr1+sqlstr2);
      ADOquery1.ExecSQL;
      ShowMessage('�����ѳɹ����棡')
end;




procedure TMain_Form1.qu_Button5Click(Sender: TObject);  //�˳�ϵͳ
begin
  ADOquery1.Close;
  ADOquery2.Close;
  Application.Terminate; //��ֹӦ�ó���
end;




//-------��״̬������ʾ-----------
procedure TMain_Form1.Timer1Timer(Sender: TObject); //ʱ�Ӵ����¼�
begin
   StatusBar1.Panels[3].Text := '��ǰʱ�䣺'+ DateTimeToStr(Now); //��״̬������ʾ��ǰʱ��
end;
procedure TMain_Form1.dl_Button1Exit(Sender: TObject); //����Excel�ļ���ť�˳��¼�
  var
    R_RecordCount:String;  //�ַ�������R_RecordCount
  begin
  ADOquery1.Close;
  ADOquery1.SQL.Clear;
  ADOquery1.Sql.Text := 'SELECT COUNT(*)  AS  R_RecordCount  FROM  T_yhks_tmp';
  ADOquery1.Open;
  R_RecordCount:=ADOQuery1.FieldByName('R_RecordCount').asString;   //ͳ�Ƽ�¼����ֵ������R_RecordCount
  StatusBar1.Panels[2].Text := '���У�'+ R_RecordCount +'����¼';    //��״̬������ʾ��ѯ��¼��
 end;




procedure TMain_Form1.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if messagedlg('�Ƿ��˳���',Mtconfirmation,[mbYes,mbNo],0)=mrYes then
end;


//----------------�˵�����---------------
procedure TMain_Form1.N9Click(Sender: TObject);
begin
   qk_Button4Click(Sender);   //���������
end;

procedure TMain_Form1.Excel1Click(Sender: TObject);
begin
   dl_Button1Click(Sender);    //�ڵ���Excel����
end;

procedure TMain_Form1.N10Click(Sender: TObject);
begin
   xs_Button2Click(Sender);  //����ʾ����
end;

procedure TMain_Form1.N11Click(Sender: TObject);
begin
    cf_Button3Click(Sender);  //��֤���ظ���ѯ
end;

procedure TMain_Form1.N13Click(Sender: TObject);
begin
   zxnl_Form2.ShowModal; //��ר��������ѯ����
end;


  procedure TMain_Form1.N17Click(Sender: TObject);
begin
    tq_Button6Click(Sender); //��ͬ���ظ���ѯ
end;


procedure TMain_Form1.N16Click(Sender: TObject);
begin
  About_Form.ShowModal;    //�򿪹���...�Ӵ���
end;

procedure TMain_Form1.N18Click(Sender: TObject);
begin
    BitBtn1Click(Sender); //����������

end;



procedure TMain_Form1.N2Click(Sender: TObject);
begin
  lszs_Form4.ShowModal; //��ʷ֤�����
end;

procedure TMain_Form1.N5Click(Sender: TObject);
begin
   lately_Form3.ShowModal;    //�����걨��������
end;

procedure TMain_Form1.N3Click(Sender: TObject);
begin
  zxnlls_Form5.ShowModal;    //�����걨��������
end;

end.
