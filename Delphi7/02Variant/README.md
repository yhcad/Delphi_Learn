#常量、变量及数据类型
##常量
    const
       TaxRate = 0.075;
##变量
变量名1，变量名2，...：类型名；

    var
       age:Integer; 		//整型
       cnt:word;		//无符号16位整型
       sal:Real;			//实型
       eno,ename:String;		//字符串型（隐含最大长度256个字符）
       dep:String[50]; 		//字符串型（最大长度50个字符）
       ch:Char;			//字符串型（变量只存放一个字符）
       married:Boolean;		//布尔型

##常用类型转换函数

    IntToStr() 	 //整型转字符串
    StrToInt()   //字符串转整型
    StrToFloat()   //字符串转实型

##3-1　变体型变量定义与使用
如图所示：

![AnpqfA.jpg](https://s2.ax1x.com/2019/03/18/AnpqfA.jpg)

【显示】按钮单击事件代码：

    procedure TForm1.Button1Click(Sender: TObject);
    var
      V: Variant; //定义变体型变量
      S: string; //定义字符串变量
    begin
      V := '变体型变量测试：';//v为字符串
      S := V;
      V := 2; //v为整数
      V := V * 3.14;  //v为实数
      Edit1.Text := S + FloatToStr(V);  //v中实型值转换为字符型
    end;