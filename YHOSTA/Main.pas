unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, ImgList, DB, ADODB, Grids, DBGrids,StdCtrls,IniFiles,
  Menus, Buttons;       //引用IniFiles单元

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

 procedure TMain_Form1.FormCreate(Sender: TObject); //主窗体创建时，从配置文件中读取数据库连接参数
Var
      Filename,server,database,user,password: String;
begin
     try
         Filename:= ExtractFilePath(paramstr(0))+'config.ini';   //配置文件config.ini存放在应用程序当前目录中
         MyInifile:= TInifile.Create(Filename);   //打开INI文件
         server := MyInifile.ReadString('DBConn','Data Source','');        {SQL服务器名}
         database :=  MyInifile.ReadString('DBConn','Initial Catalog','');  {SQL数据库名}
         user :=    MyInifile.ReadString('DBConn','User ID','');          {SQL数据库用户名}
         password := MyInifile.ReadString('DBConn','Password','');        {SQL数据库密码}
         MyInifile.Free;
         ADOConnection1.Connected := False;        //连接SQL参数
         ADOConnection1.ConnectionString := 'Provider=SQLOLEDB.1; Password= ' + Password +';Persist Security Info=False;User ID=' + user + ';Initial Catalog=' + database + ';Data Source=' + server +';Tag with column collation when possible=True;';
         ADOConnection1.Connected := True;
   except
        MessageBox(Handle,'数据库连接失败！'+ #13 +'请正确配置数据库连接！','失败提示！',MB_OK+MB_ICONINFORMATION);
        ADOquery1.Close;
        Application.Terminate;
   end;
end;


 procedure TMain_Form1.qk_Button4Click(Sender: TObject);   //①清空名单 T_yhks_tmp
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //判断是否连接
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'DELETE FROM T_yhks_tmp';
   ADOquery1.ExecSQL;
end;


 procedure TMain_Form1.dl_Button1Click(Sender: TObject);  //②导入Excel名单
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
    for i := 0 to ADOquery2.RecordCount do
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


procedure TMain_Form1.xs_Button2Click(Sender: TObject);  //③显示名单,显示T_yhks_tmp表数据
begin
   if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //判断是否连接
   ADOquery1.Close;
   ADOquery1.Sql.Clear;
   ADOquery1.Sql.Text := 'SELECT  * FROM T_yhks_tmp ORDER BY kh';
   ADOquery1.Open;
end;

procedure TMain_Form1.cf_Button3Click(Sender: TObject); //④证书重复查询
begin
     if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //判断是否连接
      ADOquery1.Close;
      ADOquery1.Sql.Clear; //查询两表中身份证号、职业和等级相同的数据
      ADOquery1.Sql.Text := 'Select  a.kh, a.sfzh,  a.ksxm, a.zygz, a.jdjb, a.xb, a.csrq, a.gl, a.whcd, a.lxdh,b.bmdw, b.zsh,b.kspc, b.bzrq From  T_yhks_tmp a,T_yhlszs b   Where a.sfzh = b.sfzh   And  a.zygz = b.zygz  And a.jdjb = b.jdjb   order by kh' ;
      ADOquery1.Open;
end;


 procedure TMain_Form1.tq_Button6Click(Sender: TObject); //⑤同期重复查询
begin
      if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //判断是否连接
      ADOquery1.Close;
      ADOquery1.Sql.Clear; //查询两表中身份证号、职业和等级相同的数据
      ADOquery1.Sql.Text := 'Select  a.kh, a.sfzh,  a.ksxm, a.zygz, a.jdjb, a.xb, a.csrq, a.gl, a.whcd, a.lxdh, b.bmdw  From  T_yhks_tmp a, T_yhks b   Where a.sfzh = b.sfzh   And  a.zygz = b.zygz  And a.jdjb = b.jdjb   order by a.kh' ;
      ADOquery1.Open;
end;



 procedure TMain_Form1.BitBtn1Click(Sender: TObject); //⑥名单保存至T_yhks表
  var
   sqlstr1,sqlstr2 :string;
begin
      sqlstr1:='Insert into  T_yhks(kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz) Select kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz';
      sqlstr2:= ' From  T_yhks_tmp a where not exists (select 1 From T_yhks b where sfzh=a.sfzh and zygz=a.zygz and jdjb=a.jdjb)';

      if not ADOConnection1.Connected then  ADOConnection1.Connected:=True;  //判断是否连接
      ADOquery1.Close;
      ADOquery1.Sql.Clear;
      ADOquery1.sql.add(sqlstr1+sqlstr2);
      ADOquery1.ExecSQL;
      ShowMessage('数据已成功保存！')
end;




procedure TMain_Form1.qu_Button5Click(Sender: TObject);  //退出系统
begin
  ADOquery1.Close;
  ADOquery2.Close;
  Application.Terminate; //终止应用程序
end;




//-------在状态栏上显示-----------
procedure TMain_Form1.Timer1Timer(Sender: TObject); //时钟触发事件
begin
   StatusBar1.Panels[3].Text := '当前时间：'+ DateTimeToStr(Now); //在状态栏上显示当前时间
end;
procedure TMain_Form1.dl_Button1Exit(Sender: TObject); //导入Excel文件按钮退出事件
  var
    R_RecordCount:String;  //字符串变量R_RecordCount
  begin
  ADOquery1.Close;
  ADOquery1.SQL.Clear;
  ADOquery1.Sql.Text := 'SELECT COUNT(*)  AS  R_RecordCount  FROM  T_yhks_tmp';
  ADOquery1.Open;
  R_RecordCount:=ADOQuery1.FieldByName('R_RecordCount').asString;   //统计记录数赋值给变量R_RecordCount
  StatusBar1.Panels[2].Text := '共有：'+ R_RecordCount +'条记录';    //在状态栏上显示查询记录数
 end;




procedure TMain_Form1.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if messagedlg('是否退出？',Mtconfirmation,[mbYes,mbNo],0)=mrYes then
end;


//----------------菜单内容---------------
procedure TMain_Form1.N9Click(Sender: TObject);
begin
   qk_Button4Click(Sender);   //①清空名单
end;

procedure TMain_Form1.Excel1Click(Sender: TObject);
begin
   dl_Button1Click(Sender);    //②导入Excel名单
end;

procedure TMain_Form1.N10Click(Sender: TObject);
begin
   xs_Button2Click(Sender);  //③显示名单
end;

procedure TMain_Form1.N11Click(Sender: TObject);
begin
    cf_Button3Click(Sender);  //④证书重复查询
end;

procedure TMain_Form1.N13Click(Sender: TObject);
begin
   zxnl_Form2.ShowModal; //打开专项能力查询窗口
end;


  procedure TMain_Form1.N17Click(Sender: TObject);
begin
    tq_Button6Click(Sender); //⑤同期重复查询
end;


procedure TMain_Form1.N16Click(Sender: TObject);
begin
  About_Form.ShowModal;    //打开关于...子窗口
end;

procedure TMain_Form1.N18Click(Sender: TObject);
begin
    BitBtn1Click(Sender); //⑥名单保存

end;



procedure TMain_Form1.N2Click(Sender: TObject);
begin
  lszs_Form4.ShowModal; //历史证书管理
end;

procedure TMain_Form1.N5Click(Sender: TObject);
begin
   lately_Form3.ShowModal;    //近期申报鉴定名单
end;

procedure TMain_Form1.N3Click(Sender: TObject);
begin
  zxnlls_Form5.ShowModal;    //近期申报鉴定名单
end;

end.
