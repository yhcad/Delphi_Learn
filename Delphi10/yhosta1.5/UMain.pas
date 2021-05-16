unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinOffice2007Blue,
  cxClasses, cxLookAndFeels, dxSkinsForm, dxBar, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ExtCtrls, XLSSheetData5, XLSReadWriteII5, System.Actions,
  Vcl.ActnList, Vcl.ExtDlgs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmMain = class(TForm)
    dxSkinController1: TdxSkinController;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarManager1Bar2: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton13: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    XLSReadWriteII51: TXLSReadWriteII5;
    ActionList1: TActionList;
    DBGrid1: TDBGrid;
    ActDelete: TAction;
    ActImportExcel: TAction;
    ActDisplay: TAction;
    ActRepeat: TAction;
    ActNewsRepeat: TAction;
    ActSave: TAction;
    ActExportExcel: TAction;
    ActClose: TAction;
    ActOpenAbout: TAction;
    SaveDialog1: TSaveDialog;

    procedure Timer1Timer(Sender: TObject);
    procedure ActDeleteExecute(Sender: TObject);
    procedure ActImportExcelExecute(Sender: TObject);
    procedure ActDisplayExecute(Sender: TObject);
    procedure ActRepeatExecute(Sender: TObject);
    procedure ActNewsRepeatExecute(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure ActExportExcelExecute(Sender: TObject);
    procedure ActCloseExecute(Sender: TObject);
    procedure ActOpenAboutExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  Udm,About;

{$R *.dfm}

procedure TFrmMain.ActCloseExecute(Sender: TObject);
begin
   dm.FDQuery1.Close;
   Application.Terminate; {终止应用程序，退出系统 }
end;

procedure TFrmMain.ActDeleteExecute(Sender: TObject);
const
  vsql: String = 'DELETE FROM T_yhks_tmp'; { 清空表T_yhks_tmp }
begin
  if not dm.FDConnection1.Connected then
    dm.FDConnection1.Connected := True; { 判断是否连接 }
  dm.FDQuery1.Close;
  dm.FDQuery1.Sql.Clear;
  dm.FDQuery1.Sql.Text := vsql;
  dm.FDQuery1.ExecSQL;
end;

procedure TFrmMain.ActImportExcelExecute(Sender: TObject);
var
  xls: TXLSReadWriteII5; { 导入Excel }
  openFile: TOpenDialog;
  Rows, Cols: Integer; // rows行数,cols列数
begin
  xls := TXLSReadWriteII5.Create(Self); // 创建实例
  openFile := TOpenDialog.Create(Self);
  openFile.DefaultExt := 'xlsx'; // 选择默认xlsx文件

  // openFileDialog.Filter = "*|*";   {选择所有类型}
  // openFile.Filter := 'Excel|*.xlsx';  {选择单类型}
  openFile.Filter := 'Excel文件|*.xlsx|Excel2003文件|*.xls'; { 选择多种类型 }

  try
    if openFile.Execute() then
    begin
      xls.Filename := openFile.Filename; // 读取文件名
      xls.Clear;
      xls.Read;
      // StringGrid1.RowCount := xls.Sheets[0].LastRow + 1;     //设置stringgrid总行数
      // StringGrid1.ColCount := xls.Sheets[0].LastCol + 1;     //设置stringgrid总列数

      dm.FDQuery1.Close;
      dm.FDQuery1.Sql.Clear;
      dm.FDQuery1.Sql.Text := 'SELECT * FROM T_yhks_tmp';
      dm.FDQuery1.Open;

      for Rows := 3 to xls.Sheets[0].LastRow do { Excel工作表从第四行开始导入 }

      begin
        dm.FDQuery1.Append;
        dm.FDQuery1.FieldbyName('kh').Asstring := xls.Sheets[0].Asstring[0, Rows]; { 考号 }
        dm.FDQuery1.FieldbyName('sfzh').Asstring := xls.Sheets[0].Asstring[1, Rows]; { 身份证号 }
        dm.FDQuery1.FieldbyName('ksxm').Asstring := xls.Sheets[0].Asstring[2, Rows]; { 姓名 }
        dm.FDQuery1.FieldbyName('zygz').Asstring := xls.Sheets[0].Asstring[3, Rows]; { 职业 }
        dm.FDQuery1.FieldbyName('jdjb').Asstring := xls.Sheets[0].Asstring[4, Rows]; { 等级 }
        dm.FDQuery1.FieldbyName('xb').Asstring := xls.Sheets[0].Asstring[5, Rows]; { 性别 }
        dm.FDQuery1.FieldbyName('csrq').AsDateTime := xls.Sheets[0].AsDateTime[6, Rows]; { 出生日期 }
        dm.FDQuery1.FieldbyName('bmdw').Asstring := xls.Sheets[0].Asstring[7, Rows]; { 报名单位 }
        dm.FDQuery1.FieldbyName('gl').Asstring := xls.Sheets[0].Asstring[8, Rows]; { 工龄 }
        dm.FDQuery1.FieldbyName('whcd').Asstring := xls.Sheets[0].Asstring[9, Rows]; { 文化程度 }
        dm.FDQuery1.FieldbyName('ksly').Asstring := xls.Sheets[0].Asstring[10, Rows]; { 考生来源 }
        dm.FDQuery1.FieldbyName('lrcj').Asstring := xls.Sheets[0].Asstring[11, Rows]; { 理论成绩 }
        dm.FDQuery1.FieldbyName('sccj').Asstring := xls.Sheets[0].Asstring[12, Rows]; { 实操成绩 }
        dm.FDQuery1.FieldbyName('lxdh').Asstring := xls.Sheets[0].Asstring[13, Rows]; { 联系电话 }
        dm.FDQuery1.FieldbyName('bz').Asstring := xls.Sheets[0].Asstring[14, Rows];; { 备注 }
        dm.FDQuery1.FieldbyName('addtime').AsDateTime := Date ; { 申报日期 }
        dm.FDQuery1.Open;
      end;

    end;
    ShowMessage(Format('共有' + '%s' + '条数据成功导入!', [IntTOStr(Rows)]));
    // StatusBar1.Panels[2].Text := '共有' + IntTOStr(Rows) +  '条数据';
    StatusBar1.Panels[2].Text := Format('共有' + '%s' + '条数据', [IntTOStr(Rows)]);

  finally
    xls.Free;
    openFile.Free;

  end;
end;

procedure TFrmMain.ActNewsRepeatExecute(Sender: TObject);

 {近期查询两表中身份证号、职业和等级相同的数据}

 const
 Str1: String ='SELECT  a.kh as 考号, a.sfzh as 身份证号,a.ksxm as 姓名,a.zygz as 职业,a.jdjb as 等级, ';
 Str2: String =' b.bmdw as 报名单位,  b.addtime  as  申报日期 ';
 Str3: String ='FROM  T_yhks_tmp a INNER  JOIN  T_yhks b  ON  a.sfzh = b.sfzh   And  a.zygz = b.zygz   And a.jdjb = b.jdjb  ORDER BY a.kh';
 //内联结查询INNER  JOIN  .... ON ...
   begin
      if not dm.FDConnection1.Connected then
        dm.FDConnection1.Connected := True; {判断是否连接}
      dm.FDQuery1.Close;
      dm.FDQuery1.Sql.Clear;
      dm.FDQuery1.Sql.add(Str1 + Str2 + Str3);
      //dm.FDQuery1.Sql.Text := Str1  + Str2 + Str3;{近期重复查询 }
      dm.FDQuery1.Open;

        DBGrid1.Fields[3].DisplayWidth:= 10;  {标题宽度}
        DBGrid1.Fields[4].DisplayWidth:= 6;  {标题宽度}
        DBGrid1.Fields[5].DisplayWidth:= 18;  {标题宽度}
        DBGrid1.Fields[6].DisplayWidth:= 12;  {标题宽度}
         var i,j:Integer;
       begin
         j:=DBGrid1.Columns.Count-1;
        for i:=0 to j do
        begin
          DBGrid1.Columns.Items[i].Title.Alignment :=taCenter; {标题居中}
          DBGrid1.Columns.Items[i].Title.Color := clYellow;
          DBGrid1.Columns.Items[i].Alignment  := taCenter; {内容居中}
        end;

       end;




      end;

procedure TFrmMain.ActOpenAboutExecute(Sender: TObject);
begin
  About_Form.ShowModal; {打开关于...子窗口}
end;

procedure TFrmMain.ActRepeatExecute(Sender: TObject);

{查询两表中身份证号、职业和等级相同的数据}

const
 Str1: String ='SELECT  a.kh as 考号,a.sfzh as 身份证号,a.ksxm as 姓名,a.zygz as 职业,a.jdjb as 等级,';
 Str2: String =' b.zsh as 证书号, b.bmdw as 报名单位,b.kspc as 考试批次, b.bzrq as 颁证日期   ';
 Str3: String ='FROM  T_yhks_tmp a INNER  JOIN  T_yhlszs b   ON  a.sfzh = b.sfzh   And  a.zygz = b.zygz    And a.jdjb = b.jdjb  ORDER BY kh';
 //内联结查询INNER  JOIN  .... ON ...
 //Vsql : String = 'SELECT  a.kh as 考号,a.sfzh as 身份证号,a.ksxm as 姓名,a.zygz as 职业,a.jdjb as 等级, b.zsh as 证书号,b.bmdw as 报名单位,b.kspc as 考试批次, b.bzrq as 颁证日期    FROM  T_yhks_tmp a,T_yhlszs b   WHERE a.sfzh = b.sfzh   And  a.zygz = b.zygz    And a.jdjb = b.jdjb';


  begin
  if not dm.FDConnection1.Connected then
    dm.FDConnection1.Connected := True; { 判断是否连接 }
    dm.FDQuery1.Close;
    dm.FDQuery1.Sql.Clear;
    //dm.FDQuery1.Sql.Text := Vsql; { 重复证书查询 }
    dm.FDQuery1.Sql.add(Str1 + Str2 + Str3);
    //dm.FDQuery1.Sql.Text := Str1  + Str2 + Str3; { 重复证书查询 }
    // ShowMessage(Str1 + Str2 + Str3);
    dm.FDQuery1.Open;

      DBGrid1.Fields[3].DisplayWidth:= 10;  {标题宽度}
      DBGrid1.Fields[5].DisplayWidth:= 20;  {标题宽度}
      DBGrid1.Fields[6].DisplayWidth:= 10;  {标题宽度}
      DBGrid1.Fields[7].DisplayWidth:= 10;  {标题宽度}
      DBGrid1.Fields[8].DisplayWidth:= 10;  {标题宽度}
        var i,j:Integer;
     begin
     j:=DBGrid1.Columns.Count-1;
    for i:=0 to j do
      begin
      DBGrid1.Columns.Items[i].Title.Alignment :=taCenter; {标题居中}
      DBGrid1.Columns.Items[i].Title.Color := clYellow;
      DBGrid1.Columns.Items[i].Alignment  := taCenter; {内容居中}
    end;

    end;


end;

procedure TFrmMain.ActSaveExecute(Sender: TObject);
var
  sqlstr1, sqlstr2: string;
begin
  sqlstr1 := 'Insert into  T_yhks(kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz,addtime) Select kh,sfzh,ksxm,zygz,jdjb,xb,csrq,bmdw,gl,whcd,ksly,lrcj,sccj,lxdh,bz,addtime  ';
  sqlstr2 := 'From  T_yhks_tmp a where not exists (select 1 From T_yhks b where sfzh=a.sfzh and zygz=a.zygz and jdjb=a.jdjb)';

  if not dm.FDConnection1.Connected then
    dm.FDConnection1.Connected := True; {判断是否连接}
    dm.FDQuery1.Close;
    dm.FDQuery1.Sql.Clear;
    dm.FDQuery1.Sql.add(sqlstr1 + sqlstr2);{ 保存数据至表T_yhks }
    dm.FDQuery1.ExecSQL;
    ShowMessage('有' + IntToStr(dm.FDQuery1.RecordCount) + '条数据已成功保存！')
end;


procedure TFrmMain.ActDisplayExecute(Sender: TObject);
const
  vsql: String = 'SELECT  kh as 考号,sfzh  as 身份证号, ksxm  as 姓名, zygz  as 职业, jdjb as 等级, xb  as 性别, csrq   as  出生日期, whcd  as 文化程度 , bmdw  as  报名单位,lxdh   as 联系电话, gl  as 工龄  FROM T_yhks_tmp';
begin
  try
    if not dm.FDConnection1.Connected then
    dm.FDConnection1.Connected := True; { 判断是否连接 }
    dm.FDQuery1.Close;
    dm.FDQuery1.Sql.Clear;
    dm.FDQuery1.Sql.Text := vsql; { 显示表T_yhks_tmp }
    dm.FDQuery1.Open;


      DBGrid1.Fields[1].DisplayWidth:= 20;  {标题宽度}
      DBGrid1.Fields[3].DisplayWidth:= 10;  {标题宽度}
      DBGrid1.Fields[5].DisplayWidth:= 10;  {标题宽度}
      DBGrid1.Fields[6].DisplayWidth:= 10;  {标题宽度}
      DBGrid1.Fields[7].DisplayWidth:= 10;  {标题宽度}
      DBGrid1.Fields[8].DisplayWidth:= 30;  {标题宽度}
      var i,j:Integer;
    begin
     j:=DBGrid1.Columns.Count-1;
      for i:=0 to j do
      begin
      DBGrid1.Columns.Items[i].Title.Alignment :=taCenter; {标题居中}
      DBGrid1.Columns.Items[i].Title.Color := clYellow;
      DBGrid1.Columns.Items[i].Alignment  := taCenter; {内容居中}
      end;

  end;



  finally
    if dm.FDQuery1.RecordCount =0 then
     ShowMessage('对不起，现在此表无数据！');
  end;


end;

procedure TFrmMain.ActExportExcelExecute(Sender: TObject);
var
  i, k: Integer;
  xls: TXLSReadWriteII5; {导出Excel}

begin
  xls := TXLSReadWriteII5.Create(Self);
  SaveDialog1 := TSaveDialog.Create(Self);
  // SaveDialog1.InitialDir := ExtractFileDir(ParamStr(0)); {默认目录是应用程序的绝对路径 }
  SaveDialog1.Title := '保存EXCEL文件路径'; {设置浏览对话框标题名}
  SaveDialog1.Filter := 'EXCEL文件(*.xlsx)|*.xlsx';{设置保存文件的扩展名}
  SaveDialog1.DefaultExt := '.xlsx'; {为保存文件名自动添加扩展名}

  try

    if SaveDialog1.Execute then
      xls.Filename := SaveDialog1.Filename
    else
      xls.Filename := SaveDialog1.Filename + '导出.xlsx';

    xls.Clear;
    xls.Sheets[0].Name := 'Sheet1';

    dm.FDQuery1.Close;
    dm.FDQuery1.Sql.Clear;
    dm.FDQuery1.Sql.Text := 'SELECT * FROM T_yhks_tmp'; {打开数据集}
    dm.FDQuery1.Open;
    dm.FDQuery1.First;

    xls.Sheets[0].Asstring[0, 0] := 'ID'; {列名}
    xls.Sheets[0].Asstring[1, 0] := '考号';
    xls.Sheets[0].Asstring[2, 0] := '身份证号';
    xls.Sheets[0].Asstring[3, 0] := '姓名';
    xls.Sheets[0].Asstring[4, 0] := '职业';
    xls.Sheets[0].Asstring[5, 0] := '等级';
    xls.Sheets[0].Asstring[6, 0] := '性别';
    xls.Sheets[0].Asstring[7, 0] := '出生日期';
    xls.Sheets[0].Asstring[8, 0] := '报名单位';
    xls.Sheets[0].Asstring[9, 0] := '工龄';
    xls.Sheets[0].Asstring[10, 0] := '文化程度';
    xls.Sheets[0].Asstring[11, 0] := '考生来源';
    xls.Sheets[0].Asstring[12, 0] := '理论成绩';
    xls.Sheets[0].Asstring[13, 0] := '实操成绩';
    xls.Sheets[0].Asstring[14, 0] := '联系电话';
    xls.Sheets[0].Asstring[15, 0] := '备注';

    for i := 1 to dm.FDQuery1.RecordCount do {取行}
    begin
      for k := 0 to dm.FDQuery1.Fields.Count - 1 do {取列}
      begin
      //XLS.Sheets[0].AsString[k,0]  := dm.FDQuery1.Fields[k].FieldName; {列表名直接取表中字段名}
        xls.Sheets[0].Asstring[k, i] := dm.FDQuery1.Fields[k].Asstring;
        xls.Sheets[0].AutoWidthCol(k); {每列为自动宽度}
      end;
      dm.FDQuery1.Next;
    end;

    xls.Write;

    ShowMessage(Format('导出EXcel文件' + #13#10 +'当前路径：'+ '%s' + #13#10 + '已保存成功!', [xls.Filename]));
  finally
    xls.Free;
    SaveDialog1.Free;

  end;

end;

procedure TFrmMain.Timer1Timer(Sender: TObject);
{ 时钟触发事件 }
begin
  StatusBar1.Panels[0].Text := '  欢迎使用【职业资格证书查询系统】';
  StatusBar1.Panels[0].Width := 220;
  StatusBar1.Panels[1].Text := ' 程序开发：陈定灿';
  StatusBar1.Panels[1].Width := 120;
  // StatusBar1.Panels[2].Text := '';
  StatusBar1.Panels[2].Width := 300;
  StatusBar1.Panels[3].Text := '当前时间：' + DateTimeToStr(Now); { 在状态栏3上显示当前时间 }
end;

end.
