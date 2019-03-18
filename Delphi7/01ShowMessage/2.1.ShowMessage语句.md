#2.1.ShowMessage语句
实例：

![AmbAhT.jpg](https://s2.ax1x.com/2019/03/18/AmbAhT.jpg)

1.新建一个窗体Form1, 设置字体Font为隶书，小四号 <br/>
2.在窗体上添加Panel1容器，设置Bevelovter:bvLowered,BevelWidth:3<br/>
3.在窗体上添加Panel2容器, 设置Color:clActiveCaption<br/>
4.添加Label1、Label2和Label3   <br/>
5.添加Edit1、Edit2和Edit3   <br/>
5.添加Button1、Button2   <br/>

【确定】事件代码

    procedure TForm1.Button1Click(Sender: TObject);
    var
      sno, sname: string;
    begin
      if edit1.Text = '' then
      begin
    showmessage('没有输入数据！');
    exit;
      end;

      sno := edit1.Text;
      sname := edit2.Text;
      edit3.Text := '欢迎' + sno + sname;
    end;


【退出】事件代码

    procedure TForm1.Button2Click(Sender: TObject);
    begin
      form1.Close;
    end;
    
    procedure TForm1.Edit1Enter(Sender: TObject);
    begin
      edit1.Clear;
      edit2.Clear;
      edit3.Clear;
    end;