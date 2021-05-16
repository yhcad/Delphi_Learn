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
   Application.Terminate; {��ֹӦ�ó����˳�ϵͳ }
end;

procedure TFrmMain.ActDeleteExecute(Sender: TObject);
const
  vsql: String = 'DELETE FROM T_yhks_tmp'; { ��ձ�T_yhks_tmp }
begin
  if not dm.FDConnection1.Connected then
    dm.FDConnection1.Connected := True; { �ж��Ƿ����� }
  dm.FDQuery1.Close;
  dm.FDQuery1.Sql.Clear;
  dm.FDQuery1.Sql.Text := vsql;
  dm.FDQuery1.ExecSQL;
end;

procedure TFrmMain.ActImportExcelExecute(Sender: TObject);
var
  xls: TXLSReadWriteII5; { ����Excel }
  openFile: TOpenDialog;
  Rows, Cols: Integer; // rows����,cols����
begin
  xls := TXLSReadWriteII5.Create(Self); // ����ʵ��
  openFile := TOpenDialog.Create(Self);
  openFile.DefaultExt := 'xlsx'; // ѡ��Ĭ��xlsx�ļ�

  // openFileDialog.Filter = "*|*";   {ѡ����������}
  // openFile.Filter := 'Excel|*.xlsx';  {ѡ������}
  openFile.Filter := 'Excel�ļ�|*.xlsx|Excel2003�ļ�|*.xls'; { ѡ��������� }

  try
    if openFile.Execute() then
    begin
      xls.Filename := openFile.Filename; // ��ȡ�ļ���
      xls.Clear;
      xls.Read;
      // StringGrid1.RowCount := xls.Sheets[0].LastRow + 1;     //����stringgrid������
      // StringGrid1.ColCount := xls.Sheets[0].LastCol + 1;     //����stringgrid������

      dm.FDQuery1.Close;
      dm.FDQuery1.Sql.Clear;
      dm.FDQuery1.Sql.Text := 'SELECT * FROM T_yhks_tmp';
      dm.FDQuery1.Open;

      for Rows := 3 to xls.Sheets[0].LastRow do { Excel������ӵ����п�ʼ���� }

      begin
        dm.FDQuery1.Append;
        dm.FDQuery1.FieldbyName('kh').Asstring := xls.Sheets[0].Asstring[0, Rows]; { ���� }
        dm.FDQuery1.FieldbyName('sfzh').Asstring := xls.Sheets[0].Asstring[1, Rows]; { ���֤�� }
        dm.FDQuery1.FieldbyName('ksxm').Asstring := xls.Sheets[0].Asstring[2, Rows]; { ���� }
        dm.FDQuery1.FieldbyName('zygz').Asstring := xls.Sheets[0].Asstring[3, Rows]; { ְҵ }
        dm.FDQuery1.FieldbyName('jdjb').Asstring := xls.Sheets[0].Asstring[4, Rows]; { �ȼ� }
        dm.FDQuery1.FieldbyName('xb').Asstring := xls.Sheets[0].Asstring[5, Rows]; { �Ա� }
        dm.FDQuery1.FieldbyName('csrq').AsDateTime := xls.Sheets[0].AsDateTime[6, Rows]; { �������� }
        dm.FDQuery1.FieldbyName('bmdw').Asstring := xls.Sheets[0].Asstring[7, Rows]; { ������λ }
        dm.FDQuery1.FieldbyName('gl').Asstring := xls.Sheets[0].Asstring[8, Rows]; { ���� }
        dm.FDQuery1.FieldbyName('whcd').Asstring := xls.Sheets[0].Asstring[9, Rows]; { �Ļ��̶� }
        dm.FDQuery1.FieldbyName('ksly').Asstring := xls.Sheets[0].Asstring[10, Rows]; { ������Դ }
        dm.FDQuery1.FieldbyName('lrcj').Asstring := xls.Sheets[0].Asstring[11, Rows]; { ���۳ɼ� }
        dm.FDQuery1.FieldbyName('sccj').Asstring := xls.Sheets[0].Asstring[12, Rows]; { ʵ�ٳɼ� }
        dm.FDQuery1.FieldbyName('lxdh').Asstring := xls.Sheets[0].Asstring[13, Rows]; { ��ϵ�绰 }
        dm.FDQuery1.FieldbyName('bz').Asstring := xls.Sheets[0].Asstring[14, Rows];; { ��ע }
        dm.FDQuery1.FieldbyName('addtime').AsDateTime := Date ; { �걨���� }
        dm.FDQuery1.Open;
      end;

    end;
    ShowMessage(Format('����' + '%s' + '�����ݳɹ�����!', [IntTOStr(Rows)]));
    // StatusBar1.Panels[2].Text := '����' + IntTOStr(Rows) +  '������';
    StatusBar1.Panels[2].Text := Format('����' + '%s' + '������', [IntTOStr(Rows)]);

  finally
    xls.Free;
    openFile.Free;

  end;
end;

procedure TFrmMain.ActNewsRepeatExecute(Sender: TObject);

 {���ڲ�ѯ���������֤�š�ְҵ�͵ȼ���ͬ������}

 const
 Str1: String ='SELECT  a.kh as ����, a.sfzh as ���֤��,a.ksxm as ����,a.zygz as ְҵ,a.jdjb as �ȼ�, ';
 Str2: String =' b.bmdw as ������λ,  b.addtime  as  �걨���� ';
 Str3: String ='FROM  T_yhks_tmp a INNER  JOIN  T_yhks b  ON  a.sfzh = b.sfzh   And  a.zygz = b.zygz   And a.jdjb = b.jdjb  ORDER BY a.kh';
 //�������ѯINNER  JOIN  .... ON ...
   begin
      if not dm.FDConnection1.Connected then
        dm.FDConnection1.Connected := True; {�ж��Ƿ�����}
      dm.FDQuery1.Close;
      dm.FDQuery1.Sql.Clear;
      dm.FDQuery1.Sql.add(Str1 + Str2 + Str3);
      //dm.FDQuery1.Sql.Text := Str1  + Str2 + Str3;{�����ظ���ѯ }
      dm.FDQuery1.Open;

        DBGrid1.Fields[3].DisplayWidth:= 10;  {������}
        DBGrid1.Fields[4].DisplayWidth:= 6;  {������}
        DBGrid1.Fields[5].DisplayWidth:= 18;  {������}
        DBGrid1.Fields[6].DisplayWidth:= 12;  {������}
         var i,j:Integer;
       begin
         j:=DBGrid1.Columns.Count-1;
        for i:=0 to j do
        begin
          DBGrid1.Columns.Items[i].Title.Alignment :=taCenter; {�������}
          DBGrid1.Columns.Items[i].Title.Color := clYellow;
          DBGrid1.Columns.Items[i].Alignment  := taCenter; {���ݾ���}
        end;

       end;




      end;

procedure TFrmMain.ActOpenAboutExecute(Sender: TObject);
begin
  About_Form.ShowModal; {�򿪹���...�Ӵ���}
end;

procedure TFrmMain.ActRepeatExecute(Sender: TObject);

{��ѯ���������֤�š�ְҵ�͵ȼ���ͬ������}

const
 Str1: String ='SELECT  a.kh as ����,a.sfzh as ���֤��,a.ksxm as ����,a.zygz as ְҵ,a.jdjb as �ȼ�,';
 Str2: String =' b.zsh as ֤���, b.bmdw as ������λ,b.kspc as ��������, b.bzrq as ��֤����   ';
 Str3: String ='FROM  T_yhks_tmp a INNER  JOIN  T_yhlszs b   ON  a.sfzh = b.sfzh   And  a.zygz = b.zygz    And a.jdjb = b.jdjb  ORDER BY kh';
 //�������ѯINNER  JOIN  .... ON ...
 //Vsql : String = 'SELECT  a.kh as ����,a.sfzh as ���֤��,a.ksxm as ����,a.zygz as ְҵ,a.jdjb as �ȼ�, b.zsh as ֤���,b.bmdw as ������λ,b.kspc as ��������, b.bzrq as ��֤����    FROM  T_yhks_tmp a,T_yhlszs b   WHERE a.sfzh = b.sfzh   And  a.zygz = b.zygz    And a.jdjb = b.jdjb';


  begin
  if not dm.FDConnection1.Connected then
    dm.FDConnection1.Connected := True; { �ж��Ƿ����� }
    dm.FDQuery1.Close;
    dm.FDQuery1.Sql.Clear;
    //dm.FDQuery1.Sql.Text := Vsql; { �ظ�֤���ѯ }
    dm.FDQuery1.Sql.add(Str1 + Str2 + Str3);
    //dm.FDQuery1.Sql.Text := Str1  + Str2 + Str3; { �ظ�֤���ѯ }
    // ShowMessage(Str1 + Str2 + Str3);
    dm.FDQuery1.Open;

      DBGrid1.Fields[3].DisplayWidth:= 10;  {������}
      DBGrid1.Fields[5].DisplayWidth:= 20;  {������}
      DBGrid1.Fields[6].DisplayWidth:= 10;  {������}
      DBGrid1.Fields[7].DisplayWidth:= 10;  {������}
      DBGrid1.Fields[8].DisplayWidth:= 10;  {������}
        var i,j:Integer;
     begin
     j:=DBGrid1.Columns.Count-1;
    for i:=0 to j do
      begin
      DBGrid1.Columns.Items[i].Title.Alignment :=taCenter; {�������}
      DBGrid1.Columns.Items[i].Title.Color := clYellow;
      DBGrid1.Columns.Items[i].Alignment  := taCenter; {���ݾ���}
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
    dm.FDConnection1.Connected := True; {�ж��Ƿ�����}
    dm.FDQuery1.Close;
    dm.FDQuery1.Sql.Clear;
    dm.FDQuery1.Sql.add(sqlstr1 + sqlstr2);{ ������������T_yhks }
    dm.FDQuery1.ExecSQL;
    ShowMessage('��' + IntToStr(dm.FDQuery1.RecordCount) + '�������ѳɹ����棡')
end;


procedure TFrmMain.ActDisplayExecute(Sender: TObject);
const
  vsql: String = 'SELECT  kh as ����,sfzh  as ���֤��, ksxm  as ����, zygz  as ְҵ, jdjb as �ȼ�, xb  as �Ա�, csrq   as  ��������, whcd  as �Ļ��̶� , bmdw  as  ������λ,lxdh   as ��ϵ�绰, gl  as ����  FROM T_yhks_tmp';
begin
  try
    if not dm.FDConnection1.Connected then
    dm.FDConnection1.Connected := True; { �ж��Ƿ����� }
    dm.FDQuery1.Close;
    dm.FDQuery1.Sql.Clear;
    dm.FDQuery1.Sql.Text := vsql; { ��ʾ��T_yhks_tmp }
    dm.FDQuery1.Open;


      DBGrid1.Fields[1].DisplayWidth:= 20;  {������}
      DBGrid1.Fields[3].DisplayWidth:= 10;  {������}
      DBGrid1.Fields[5].DisplayWidth:= 10;  {������}
      DBGrid1.Fields[6].DisplayWidth:= 10;  {������}
      DBGrid1.Fields[7].DisplayWidth:= 10;  {������}
      DBGrid1.Fields[8].DisplayWidth:= 30;  {������}
      var i,j:Integer;
    begin
     j:=DBGrid1.Columns.Count-1;
      for i:=0 to j do
      begin
      DBGrid1.Columns.Items[i].Title.Alignment :=taCenter; {�������}
      DBGrid1.Columns.Items[i].Title.Color := clYellow;
      DBGrid1.Columns.Items[i].Alignment  := taCenter; {���ݾ���}
      end;

  end;



  finally
    if dm.FDQuery1.RecordCount =0 then
     ShowMessage('�Բ������ڴ˱������ݣ�');
  end;


end;

procedure TFrmMain.ActExportExcelExecute(Sender: TObject);
var
  i, k: Integer;
  xls: TXLSReadWriteII5; {����Excel}

begin
  xls := TXLSReadWriteII5.Create(Self);
  SaveDialog1 := TSaveDialog.Create(Self);
  // SaveDialog1.InitialDir := ExtractFileDir(ParamStr(0)); {Ĭ��Ŀ¼��Ӧ�ó���ľ���·�� }
  SaveDialog1.Title := '����EXCEL�ļ�·��'; {��������Ի��������}
  SaveDialog1.Filter := 'EXCEL�ļ�(*.xlsx)|*.xlsx';{���ñ����ļ�����չ��}
  SaveDialog1.DefaultExt := '.xlsx'; {Ϊ�����ļ����Զ������չ��}

  try

    if SaveDialog1.Execute then
      xls.Filename := SaveDialog1.Filename
    else
      xls.Filename := SaveDialog1.Filename + '����.xlsx';

    xls.Clear;
    xls.Sheets[0].Name := 'Sheet1';

    dm.FDQuery1.Close;
    dm.FDQuery1.Sql.Clear;
    dm.FDQuery1.Sql.Text := 'SELECT * FROM T_yhks_tmp'; {�����ݼ�}
    dm.FDQuery1.Open;
    dm.FDQuery1.First;

    xls.Sheets[0].Asstring[0, 0] := 'ID'; {����}
    xls.Sheets[0].Asstring[1, 0] := '����';
    xls.Sheets[0].Asstring[2, 0] := '���֤��';
    xls.Sheets[0].Asstring[3, 0] := '����';
    xls.Sheets[0].Asstring[4, 0] := 'ְҵ';
    xls.Sheets[0].Asstring[5, 0] := '�ȼ�';
    xls.Sheets[0].Asstring[6, 0] := '�Ա�';
    xls.Sheets[0].Asstring[7, 0] := '��������';
    xls.Sheets[0].Asstring[8, 0] := '������λ';
    xls.Sheets[0].Asstring[9, 0] := '����';
    xls.Sheets[0].Asstring[10, 0] := '�Ļ��̶�';
    xls.Sheets[0].Asstring[11, 0] := '������Դ';
    xls.Sheets[0].Asstring[12, 0] := '���۳ɼ�';
    xls.Sheets[0].Asstring[13, 0] := 'ʵ�ٳɼ�';
    xls.Sheets[0].Asstring[14, 0] := '��ϵ�绰';
    xls.Sheets[0].Asstring[15, 0] := '��ע';

    for i := 1 to dm.FDQuery1.RecordCount do {ȡ��}
    begin
      for k := 0 to dm.FDQuery1.Fields.Count - 1 do {ȡ��}
      begin
      //XLS.Sheets[0].AsString[k,0]  := dm.FDQuery1.Fields[k].FieldName; {�б���ֱ��ȡ�����ֶ���}
        xls.Sheets[0].Asstring[k, i] := dm.FDQuery1.Fields[k].Asstring;
        xls.Sheets[0].AutoWidthCol(k); {ÿ��Ϊ�Զ����}
      end;
      dm.FDQuery1.Next;
    end;

    xls.Write;

    ShowMessage(Format('����EXcel�ļ�' + #13#10 +'��ǰ·����'+ '%s' + #13#10 + '�ѱ���ɹ�!', [xls.Filename]));
  finally
    xls.Free;
    SaveDialog1.Free;

  end;

end;

procedure TFrmMain.Timer1Timer(Sender: TObject);
{ ʱ�Ӵ����¼� }
begin
  StatusBar1.Panels[0].Text := '  ��ӭʹ�á�ְҵ�ʸ�֤���ѯϵͳ��';
  StatusBar1.Panels[0].Width := 220;
  StatusBar1.Panels[1].Text := ' ���򿪷����¶���';
  StatusBar1.Panels[1].Width := 120;
  // StatusBar1.Panels[2].Text := '';
  StatusBar1.Panels[2].Width := 300;
  StatusBar1.Panels[3].Text := '��ǰʱ�䣺' + DateTimeToStr(Now); { ��״̬��3����ʾ��ǰʱ�� }
end;

end.
