unit zxnlls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, ImgList, DB, ADODB, Grids, DBGrids,StdCtrls,IniFiles,
 Buttons, Mask;

type
    Tzxnlls_Form5 = class(TForm)
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
    procedure FormShow(Sender: TObject);
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
  zxnlls_Form5: Tzxnlls_Form5;
   MyInifile: TInifile;
implementation

uses zxnl,About;

{$R *.dfm}

 procedure Tzxnlls_Form5.FormCreate(Sender: TObject); //主窗体创建时，从配置文件中读取数据库连接参数
Var
        Filename,server,database,user,password: String;

begin
          DateTimePicker1.Date:= Now;
         Filename:= ExtractFilePath(paramstr(0))+'config.ini';   //配置文件config.ini存放在应用程序当前目录中
         MyInifile:= TInifile.Create(Filename);   //从配置文件中读取数据库连接参数
         server := MyInifile.ReadString('DBConn','Data Source','');        {SQL服务器名}
         database :=  MyInifile.ReadString('DBConn','Initial Catalog','');  {SQL数据库名}
         user :=    MyInifile.ReadString('DBConn','User ID','');          {SQL数据库用户名}
         password := MyInifile.ReadString('DBConn','Password','');        {SQL数据库密码}
         MyInifile.Free;
         ADOConnection1.Connected := False;        //连接SQL参数
         ADOConnection1.ConnectionString := 'Provider=SQLOLEDB.1; Password= ' + Password +';Persist Security Info=False;User ID=' + user + ';Initial Catalog=' + database + ';Data Source=' + server +';Tag with column collation when possible=True;';
         ADOConnection1.Connected := True;
end;


 procedure Tzxnlls_Form5.qk_Button4Click(Sender: TObject);   //①清空名单 T_yhks_tmp
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //判断是否连接
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'DELETE FROM T_yhks_tmp';
   ADOquery1.ExecSQL;
end;


 procedure Tzxnlls_Form5.dl_Button1Click(Sender: TObject);  //②导入Excel名单
  var
  sFileName, sTableName: string;
  sl: TStringList;
  i: integer;
 begin
  if not OpenDialog1.Execute then  Exit;
  if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //判断是否连接
 try
  sFileName := OpenDialog1.FileName;
  ADOConnection2.Connected := False;    //连接EXCEL参数
  ADOConnection2.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=' + sFileName + ';Extended Properties="Excel 8.0;HDR=YES;IMEX=1";Persist Security Info=False';
  ADOConnection2.Connected := True;

  sl := TStringList.Create;
  ADOConnection2.GetTableNames(sl);   //Excel工作表名
  sTableName := sl[0];
  if Pos('$', sTableName) > 0 then sTableName := '[' + sTableName + ']';

  ADOquery2.Close;
  ADOquery2.SQL.Clear;
  ADOquery2.SQL.Text := 'SELECT * FROM ' + sTableName;
  ADOquery2.Open;
  sl.Free;


  ADOquery1.Close;
  ADOquery1.SQL.Clear;
  ADOquery1.Sql.Text := 'SELECT * FROM T_yhks_tmp';  //打开记录表这里可以用 insert,不用append
  ADOquery1.Open;

  if ADOquery2.RecordCount > 0 then
  begin

    ADOquery2.First;
    for i := 1 to ADOquery2.RecordCount do
    begin
        ADOquery1.Append;
        ADOquery1.FieldValues['kh']:=ADOquery2.FieldValues['考号'];
        ADOquery1.FieldValues['sfzh']:=ADOquery2.FieldValues['身份证号'];
        ADOquery1.FieldValues['ksxm']:=ADOquery2.FieldValues['姓名'];
        ADOquery1.FieldValues['zygz']:=ADOquery2.FieldValues['职业'];
        ADOquery1.FieldValues['jdjb']:=ADOquery2.FieldValues['等级'];
        ADOquery1.FieldValues['xb']:=ADOquery2.FieldValues['性别'];
        ADOquery1.FieldValues['csrq']:=ADOquery2.FieldValues['出生日期'];
        ADOquery1.FieldValues['bmdw']:=ADOquery2.FieldValues['报名单位'];
        ADOquery1.FieldValues['gl']:=ADOquery2.FieldValues['工龄'];
        ADOquery1.FieldValues['whcd']:=ADOquery2.FieldValues['文化程度'];
        ADOquery1.FieldValues['ksly']:=ADOquery2.FieldValues['考生来源'];
        ADOquery1.FieldValues['lrcj']:=ADOquery2.FieldValues['理论成绩'];
        ADOquery1.FieldValues['sccj']:=ADOquery2.FieldValues['实操成绩'];
        ADOquery1.FieldValues['lxdh']:=ADOquery2.FieldValues['联系电话'];
        ADOquery1.FieldValues['bz']:=ADOquery2.FieldValues['备注'];
        ADOquery1.ExecSQL;
        ADOquery2.Next;
     end;
    end;
         MessageBox(Handle,'数据导入成功！','完成提示！',MB_OK+MB_ICONINFORMATION);
    except
        MessageBox(Handle,'数据导入失败，请检查【身份证号】是否重复？'+ #13 +'或表中已有存在数据与导入的数据重复！','失败提示！',MB_OK+MB_ICONINFORMATION);

    end;
  end;


procedure Tzxnlls_Form5.xs_Button2Click(Sender: TObject);  //③显示名单,显示表T_yhks
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //判断是否连接
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'SELECT  * FROM T_yhks_tmp ORDER BY kh';
   ADOquery1.Open;
end;

procedure Tzxnlls_Form5.BitBtn1Click(Sender: TObject); //⑥名单保存到T_yhks表
  var
   sqlstr1,sqlstr2 :string;


begin
      sqlstr1:='Insert into  T_yhks(kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz) Select kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz From  T_yhks_tmp a ';
      sqlstr2:= 'where not exists (select 1 From T_yhks b where sfzh=a.sfzh and zygz=a.zygz and jdjb=a.jdjb)';

      if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //判断是否连接
      ADOquery1.Close;
      ADOquery1.Sql.Clear;
      ADOquery1.sql.add(sqlstr1+sqlstr2);
      ADOquery1.ExecSQL;
      ShowMessage('数据已成功保存！')

end;




procedure Tzxnlls_Form5.qu_Button5Click(Sender: TObject);  //退出系统
begin
  ADOquery1.Close;
  ADOquery2.Close;
  Application.Terminate; //终止应用程序
end;
procedure Tzxnlls_Form5.FormShow(Sender: TObject);

begin
   StatusBar1.Panels[3].Text := '当前时间：'+ DateTimeToStr(Now);
end;


procedure Tzxnlls_Form5.Timer1Timer(Sender: TObject);
   begin
   StatusBar1.Panels[3].Text := '当前时间：'+ DateTimeToStr(Now); //在状态栏上显示当前时间
   end;


procedure Tzxnlls_Form5.dl_Button1Exit(Sender: TObject);
           var
             R_RecordCount:String;  //查询统计的记录数赋值给变量R_RecordCount
           begin
            ADOquery1.Close;
            ADOquery1.SQL.Clear;
            ADOquery1.Sql.Text := 'SELECT COUNT(*)  AS  R_RecordCount  FROM  T_yhks_tmp';
            ADOquery1.Open;
            R_RecordCount:=ADOQuery1.FieldByName('R_RecordCount').asString;
            StatusBar1.Panels[2].Text := '共有：'+ R_RecordCount +'条记录';     //在状态栏上显示查询记录数
           end;

procedure Tzxnlls_Form5.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if messagedlg('是否退出？',Mtconfirmation,[mbYes,mbNo],0)=mrYes then
end;



procedure Tzxnlls_Form5.DateTimePicker1CloseUp(Sender: TObject);
begin
  Edit6sbzrq.Text:= ForMatDateTime('yyyy-MM-dd', DateTimePicker1.Date);
end;

procedure Tzxnlls_Form5.DateTimePicker2CloseUp(Sender: TObject);
begin
  Edit7ebzrq.Text := DateToStr(DateTimePicker2.Date);
end;

procedure Tzxnlls_Form5.Button1Click(Sender: TObject);
 var
   sqlstr:string;

begin

    sqlstr:='SELECT  * FROM T_yhks Where 1=1 ';
    if  Edit1sfzh.Text<>''  then  sqlstr:=sqlstr + ' AND sfzh like'+''''+'%'+Trim(Edit1sfzh.Text)+'%'+'''';     //身份证号模糊查询
    if  Edit2ksxm.Text<>''  then  sqlstr:=sqlstr + ' AND ksxm like'+''''+'%'+Trim(Edit2ksxm.Text)+'%'+'''';      //考生姓名模糊查询
    if  Edit3zsh.Text<>''   then  sqlstr:=sqlstr + ' AND zsh like'+''''+'%'+Trim(Edit3zsh.Text)+'%'+'''';        //证书号模糊查询
    if  Edit4zygz.Text<>''  then  sqlstr:=sqlstr + ' AND zygz like'+''''+'%'+Trim(Edit4zygz.Text)+'%'+'''';     //职业模糊查询
    if  ComboBox1.Text<>''  then  sqlstr:=sqlstr + ' AND jdjb like'+''''+'%'+Trim(ComboBox1.Text)+'%'+'''';     //鉴定级别模糊查询
    if  Edit9bmdw.Text<>''   then  sqlstr:=sqlstr + ' AND bmdw like'+''''+'%'+Trim(Edit9bmdw.Text)+'%'+'''';      //报名单位模糊查询
    if  Edit8lxdh.Text<>''  then  sqlstr:=sqlstr + ' AND lxdh like'+''''+'%'+Trim(Edit8lxdh.Text)+'%'+'''';     //联系电话
  //  if   DateToStr(DateTimePicker1.Date) <>'' AND  DateToStr(DateTimePicker2.Date) <>''   then  sqlstr:=sqlstr + ' AND bzrq  between  '''+DateToStr(DateTimePicker1.Date)+''' AND  '''+DateToStr(DateTimePicker2.Date)+'''';
 // if  Edit6sbzrq.Text<>'' AND Edit7ebzrq.Text<> ''   then  sqlstr:=sqlstr + ' AND bzrq  between  ''+StrToDate(Edit6sbzrq.Text)+'' AND ''+StrToDate(Edit7ebzrq.Text)+''';


    sqlstr:=sqlstr+'order by id desc';
    if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;
    ADOquery1.Close;
    ADOquery1.Sql.Clear;
    ADOquery1.Sql.Add(sqlstr);
    ADOquery1.Open;
end;

end.
