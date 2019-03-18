unit lszs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, ImgList, DB, ADODB, Grids, DBGrids,StdCtrls,IniFiles,
 Buttons, Mask;

type
    Tlszs_Form4 = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    dl_Button1: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    xs_Button2: TButton;
    qk_Button4: TButton;
    ADOConnection2: TADOConnection;
    ADOQuery2: TADOQuery;
    OpenDialog1: TOpenDialog;
    qu_Button5: TButton;
    DBGrid1: TDBGrid;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1sfzh: TEdit;
    Label2: TLabel;
    Edit2ksxm: TEdit;
    Label3: TLabel;
    Edit3zsh: TEdit;
    Label4: TLabel;
    Edit4zygz: TEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    Edit5nd: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit6sbzrq: TEdit;
    Edit7ebzrq: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label9: TLabel;
    Edit8lxdh: TEdit;
    Label10: TLabel;
    Edit9bmdw: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure xs_Button2Click(Sender: TObject);
    procedure qk_Button4Click(Sender: TObject);
    procedure dl_Button1Click(Sender: TObject);
    procedure qu_Button5Click(Sender: TObject);
    procedure dl_Button1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lszs_Form4: Tlszs_Form4;
   MyInifile: TInifile;
implementation

uses zxnl,About;

{$R *.dfm}

 procedure Tlszs_Form4.FormCreate(Sender: TObject); //�����崴��ʱ���������ļ��ж�ȡ���ݿ����Ӳ���
Var
        Filename,server,database,user,password: String;

begin
          DateTimePicker1.Date:= Now;
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


 procedure Tlszs_Form4.qk_Button4Click(Sender: TObject);   //���������T_yhlszs_tmp
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'DELETE FROM T_yhlszs_tmp';
   ADOquery1.ExecSQL;
end;


 procedure Tlszs_Form4.dl_Button1Click(Sender: TObject);  //�ڵ���Excel����
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
  ADOquery1.Sql.Text := 'SELECT * FROM T_yhlszs_tmp';  //�򿪼�¼����������� insert,����append
  ADOquery1.Open;

  if ADOquery2.RecordCount > 0 then
  begin

    ADOquery2.First;
    for i := 0 to ADOquery2.RecordCount do
    begin
        ADOquery1.Append;
        ADOquery1.FieldValues['id']:=ADOquery2.FieldValues['���'];
        ADOquery1.FieldValues['sfzh']:=ADOquery2.FieldValues['���֤��'];
        ADOquery1.FieldValues['ksxm']:=ADOquery2.FieldValues['��������'];
        ADOquery1.FieldValues['zygz']:=ADOquery2.FieldValues['ְҵ(����)'];
        ADOquery1.FieldValues['jdjb']:=ADOquery2.FieldValues['��������'];
        ADOquery1.FieldValues['zsh']:=ADOquery2.FieldValues['֤���'];
        ADOquery1.FieldValues['bmdw']:=ADOquery2.FieldValues['���ڵ�λ'];
        ADOquery1.FieldValues['csrq']:=ADOquery2.FieldValues['��������'];
        ADOquery1.FieldValues['xb']:=ADOquery2.FieldValues['�Ա�'];
        ADOquery1.FieldValues['whcd']:=ADOquery2.FieldValues['�Ļ��̶�'];
        ADOquery1.FieldValues['lrcj']:=ADOquery2.FieldValues['���۳ɼ�'];
        ADOquery1.FieldValues['sccj']:=ADOquery2.FieldValues['ʵ�ٳɼ�'];
        ADOquery1.FieldValues['pdcj']:=ADOquery2.FieldValues['�����ɼ�'];
        ADOquery1.FieldValues['bzrq']:=ADOquery2.FieldValues['��֤����'];
        ADOquery1.FieldValues['jdbm']:=ADOquery2.FieldValues['��������'];
        ADOquery1.FieldValues['dybj']:=ADOquery2.FieldValues['��ӡ���'];
        ADOquery1.FieldValues['kspc']:=ADOquery2.FieldValues['��������'];
        ADOquery1.FieldValues['cdrq']:=ADOquery2.FieldValues['�浵����'];
        ADOquery1.FieldValues['nd']:=ADOquery2.FieldValues['���'];
        ADOquery1.ExecSQL;
        ADOquery2.Next;
     end;
    end;
         MessageBox(Handle,'���ݵ���ɹ���','�����ʾ��',MB_OK+MB_ICONINFORMATION);
    except
        MessageBox(Handle,'���ݵ���ʧ�ܣ����顾���֤�š��Ƿ��ظ���'+ #13 +'��������д��������뵼��������ظ���','ʧ����ʾ��',MB_OK+MB_ICONINFORMATION);

    end;
  end;


procedure Tlszs_Form4.xs_Button2Click(Sender: TObject);  //����ʾ����,��ʾ��T_yhlszs_tmp
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'SELECT  * FROM T_yhlszs_tmp ORDER BY id';
   ADOquery1.Open;
end;

procedure Tlszs_Form4.BitBtn1Click(Sender: TObject); //���������浽T_yhlszs��
  var
   sqlstr1,sqlstr2 :string;


begin
      sqlstr1:='Insert into  T_yhlszs(sfzh,ksxm,zygz,jdjb,zsh,bmdw,csrq,xb,whcd,lrcj,sccj,pdcj,bzrq,jdbm,dybj,kspc,cdrq,nd) Select sfzh,ksxm,zygz,jdjb,zsh,bmdw,csrq,xb,whcd,lrcj,sccj,pdcj,bzrq,jdbm,dybj,kspc,cdrq,nd From  T_yhlszs_tmp a ';
      sqlstr2:= 'where not exists (select 1 From T_yhlszs b where sfzh=a.sfzh and zygz=a.zygz and jdjb=a.jdjb)';

      if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //�ж��Ƿ�����
      ADOquery1.Close;
      ADOquery1.Sql.Clear;
      ADOquery1.sql.add(sqlstr1+sqlstr2);
      ADOquery1.ExecSQL;
      ShowMessage('�����ѳɹ����棡')

end;




procedure Tlszs_Form4.qu_Button5Click(Sender: TObject);  //�˳�ϵͳ
begin
  ADOquery1.Close;
  ADOquery2.Close;
  Application.Terminate; //��ֹӦ�ó���
end;


procedure Tlszs_Form4.Timer1Timer(Sender: TObject);
   begin
   StatusBar1.Panels[3].Text := '��ǰʱ�䣺'+ DateTimeToStr(Now); //��״̬������ʾ��ǰʱ��
   end;


procedure Tlszs_Form4.dl_Button1Exit(Sender: TObject);
           var
             R_RecordCount:String;  //��ѯͳ�Ƶļ�¼����ֵ������R_RecordCount
           begin
            ADOquery1.Close;
            ADOquery1.SQL.Clear;
            ADOquery1.Sql.Text := 'SELECT COUNT(*)  AS  R_RecordCount  FROM  T_yhlszs_tmp';
            ADOquery1.Open;
            R_RecordCount:=ADOQuery1.FieldByName('R_RecordCount').asString;
            StatusBar1.Panels[2].Text := '���У�'+ R_RecordCount +'����¼';     //��״̬������ʾ��ѯ��¼��
           end;

procedure Tlszs_Form4.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if messagedlg('�Ƿ��˳���',Mtconfirmation,[mbYes,mbNo],0)=mrYes then
end;



procedure Tlszs_Form4.DateTimePicker1CloseUp(Sender: TObject);
begin
  Edit6sbzrq.Text:= ForMatDateTime('yyyy-MM-dd', DateTimePicker1.Date);
end;

procedure Tlszs_Form4.DateTimePicker2CloseUp(Sender: TObject);
begin
  Edit7ebzrq.Text := DateToStr(DateTimePicker2.Date);
end;

procedure Tlszs_Form4.Button1Click(Sender: TObject);
 var
   sqlstr:string;

begin

    sqlstr:='SELECT  * FROM T_yhlszs Where 1=1 ';
    if  Edit1sfzh.Text<>''  then  sqlstr:=sqlstr + ' AND sfzh like'+''''+'%'+Trim(Edit1sfzh.Text)+'%'+'''';     //���֤��ģ����ѯ
    if  Edit2ksxm.Text<>''  then  sqlstr:=sqlstr + ' AND ksxm like'+''''+'%'+Trim(Edit2ksxm.Text)+'%'+'''';      //��������ģ����ѯ
    if  Edit3zsh.Text<>''   then  sqlstr:=sqlstr + ' AND zsh like'+''''+'%'+Trim(Edit3zsh.Text)+'%'+'''';        //֤���ģ����ѯ
    if  Edit4zygz.Text<>''  then  sqlstr:=sqlstr + ' AND zygz like'+''''+'%'+Trim(Edit4zygz.Text)+'%'+'''';     //ְҵģ����ѯ
    if  ComboBox1.Text<>''  then  sqlstr:=sqlstr + ' AND jdjb like'+''''+'%'+Trim(ComboBox1.Text)+'%'+'''';     //��������ģ����ѯ
    if  Edit9bmdw.Text<>''   then  sqlstr:=sqlstr + ' AND bmdw like'+''''+'%'+Trim(Edit9bmdw.Text)+'%'+'''';      //������λģ����ѯ
    if  Edit8lxdh.Text<>''  then  sqlstr:=sqlstr + ' AND lxdh like'+''''+'%'+Trim(Edit8lxdh.Text)+'%'+'''';     //��ϵ�绰
  // if   DateToStr(DateTimePicker1.Date) <>'' AND  DateToStr(DateTimePicker2.Date) <>''   then  sqlstr:=sqlstr + ' AND bzrq  between  '''+DateToStr(DateTimePicker1.Date)+''' AND  '''+DateToStr(DateTimePicker2.Date)+'''';
 // if  Edit6sbzrq.Text<>'' AND Edit7ebzrq.Text<> ''   then  sqlstr:=sqlstr + ' AND bzrq  between  ''+StrToDate(Edit6sbzrq.Text)+'' AND ''+StrToDate(Edit7ebzrq.Text)+''';


    sqlstr:=sqlstr+'order by id desc';
    if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;
    ADOquery1.Close;
    ADOquery1.Sql.Clear;
    ADOquery1.Sql.Add(sqlstr);
    ADOquery1.Open;
end;

end.
