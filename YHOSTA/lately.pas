unit lately;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, ImgList, DB, ADODB, Grids, DBGrids,StdCtrls,IniFiles,
 Buttons;

type
    Tlately_Form3 = class(TForm)
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
    tq_Button6: TButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    BitBtn1: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure xs_Button2Click(Sender: TObject);
    procedure cf_Button3Click(Sender: TObject);
    procedure qk_Button4Click(Sender: TObject);
    procedure dl_Button1Click(Sender: TObject);
    procedure qu_Button5Click(Sender: TObject);
    procedure tq_Button6Click(Sender: TObject);
    procedure dl_Button1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lately_Form3: Tlately_Form3;
   MyInifile: TInifile;
implementation

uses zxnl,About;

{$R *.dfm}

 procedure Tlately_Form3.FormCreate(Sender: TObject); //�����崴��ʱ���������ļ��ж�ȡ���ݿ����Ӳ���
Var
        Filename,server,database,user,password: String;
begin
         Filename:= ExtractFilePath(paramstr(0))+'config.ini';   //�����ļ�config.ini�����Ӧ�ó���ǰĿ¼��
         MyInifile:= TInifile.Create(Filename);   //�������ļ��ж�ȡ���ݿ����Ӳ���
         server := MyInifile.ReadString('DBConn','Data Source','');        {SQL��������}
         database :=  MyInifile.ReadString('DBConn','Initial Catalog','');  {SQL���ݿ���}
         user :=    MyInifile.ReadString('DBConn','User ID','');          {SQL���ݿ��û���}
         password := MyInifile.ReadString('DBConn','Password','');        {SQL���ݿ�����}
         MyInifile.Free;
         ADOConnection1.Connected := False;        //����SQL����
         ADOConnection1.ConnectionString := 'Provider=SQLOLEDB.1; Password= ' + Password +';Persist Security Info=False;User ID=' + user + ';Initial Catalog=' + database + ';Data Source=' + server +';Tag with column collation when possible=True;';
         ADOConnection1.Connected := True;
end;


 procedure Tlately_Form3.qk_Button4Click(Sender: TObject);   //��������� T_yhks_tmp
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'DELETE FROM T_yhks_tmp';
   ADOquery1.ExecSQL;
end;


 procedure Tlately_Form3.dl_Button1Click(Sender: TObject);  //�ڵ���Excel����
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
    for i := 1 to ADOquery2.RecordCount do
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


procedure Tlately_Form3.xs_Button2Click(Sender: TObject);  //����ʾ����,��ʾ��T_yhks_tmp
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'SELECT  * FROM T_yhks_tmp ORDER BY kh';
   ADOquery1.Open;
end;

procedure Tlately_Form3.cf_Button3Click(Sender: TObject); //��֤���ظ���ѯ
begin
     if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
      ADOquery1.Close;
      ADOquery1.Sql.Clear;
      ADOquery1.Sql.Text := 'Select  a.kh, a.sfzh,  a.ksxm, a.zygz, a.jdjb, a.xb, a.csrq, a.gl, a.whcd, a.lxdh,b.bmdw, b.zsh,b.kspc, b.bzrq From  T_yhks_tmp a,T_yhlszs b   Where a.sfzh = b.sfzh   And  a.zygz = b.zygz  And a.jdjb = b.jdjb   order by kh' ;
     //ADOquery1.Sql.Text := 'SELECT * FROM T_yhks_tmp INNER JOIN T_yhlszs ON T_yhks_tmp.sfzh = T_yhlszs.sfzh AND T_yhks_tmp.zygz = T_yhlszs.zygz AND T_yhks_tmp.jdjb = T_yhlszs.jdjb  ORDER BY a.kh' ;
     ADOquery1.Open;
end;


 procedure Tlately_Form3.tq_Button6Click(Sender: TObject); //��ͬ���ظ���ѯ
begin
      if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
      ADOquery1.Close;
      ADOquery1.Sql.Clear;
      ADOquery1.Sql.Text := 'Select  a.kh, a.sfzh,  a.ksxm, a.zygz, a.jdjb, a.xb, a.csrq, a.gl, a.whcd, a.lxdh, b.bmdw  From  T_yhks_tmp a, T_yhks b   Where a.sfzh = b.sfzh   And  a.zygz = b.zygz  And a.jdjb = b.jdjb   order by a.kh' ;
      ADOquery1.Open;
end;

 procedure Tlately_Form3.BitBtn1Click(Sender: TObject); //���������浽T_yhks��
  var
   sqlstr1,sqlstr2 :string;


begin
      sqlstr1:='Insert into  T_yhks(kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz) Select kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz From  T_yhks_tmp a ';
      sqlstr2:= 'where not exists (select 1 From T_yhks b where sfzh=a.sfzh and zygz=a.zygz and jdjb=a.jdjb)';

      if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
      ADOquery1.Close;
      ADOquery1.Sql.Clear;
      ADOquery1.sql.add(sqlstr1+sqlstr2);
      ADOquery1.ExecSQL;
      ShowMessage('�����ѳɹ����棡')

end;




procedure Tlately_Form3.qu_Button5Click(Sender: TObject);  //�˳�ϵͳ
begin
  ADOquery1.Close;
  ADOquery2.Close;
  Application.Terminate; //��ֹӦ�ó���
end;
procedure Tlately_Form3.FormShow(Sender: TObject);

begin
   StatusBar1.Panels[3].Text := '��ǰʱ�䣺'+ DateTimeToStr(Now);
end;


procedure Tlately_Form3.Timer1Timer(Sender: TObject);
   begin
   StatusBar1.Panels[3].Text := '��ǰʱ�䣺'+ DateTimeToStr(Now); //��״̬������ʾ��ǰʱ��
   end;


procedure Tlately_Form3.dl_Button1Exit(Sender: TObject);
           var
             R_RecordCount:String;  //��ѯͳ�Ƶļ�¼����ֵ������R_RecordCount
           begin
            ADOquery1.Close;
            ADOquery1.SQL.Clear;
            ADOquery1.Sql.Text := 'SELECT COUNT(*)  AS  R_RecordCount  FROM  T_yhks_tmp';
            ADOquery1.Open;
            R_RecordCount:=ADOQuery1.FieldByName('R_RecordCount').asString;
            StatusBar1.Panels[2].Text := '���У�'+ R_RecordCount +'����¼';     //��״̬������ʾ��ѯ��¼��
           end;

procedure Tlately_Form3.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if messagedlg('�Ƿ��˳���',Mtconfirmation,[mbYes,mbNo],0)=mrYes then
end;



end.
