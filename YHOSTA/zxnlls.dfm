object zxnlls_Form5: Tzxnlls_Form5
  Left = 296
  Top = 174
  BorderStyle = bsDialog
  Caption = #19987#39033#33021#21147#21382#21490#25968#25454#31649#29702
  ClientHeight = 724
  ClientWidth = 1178
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 63
    Height = 14
    Caption = #36523#20221#35777#21495':'
  end
  object Label2: TLabel
    Left = 248
    Top = 56
    Width = 63
    Height = 14
    Caption = #32771#29983#22995#21517':'
  end
  object Label3: TLabel
    Left = 448
    Top = 56
    Width = 49
    Height = 14
    Caption = #35777#20070#21495':'
  end
  object Label4: TLabel
    Left = 672
    Top = 56
    Width = 35
    Height = 14
    Caption = #32844#19994':'
  end
  object Label5: TLabel
    Left = 840
    Top = 56
    Width = 63
    Height = 14
    Caption = #37492#23450#32423#21035':'
  end
  object Label6: TLabel
    Left = 16
    Top = 88
    Width = 35
    Height = 14
    Caption = #24180#24230':'
  end
  object Label7: TLabel
    Left = 248
    Top = 88
    Width = 63
    Height = 14
    Caption = #39041#35777#26085#26399':'
  end
  object Label8: TLabel
    Left = 432
    Top = 80
    Width = 14
    Height = 14
    Caption = '--'
  end
  object Label9: TLabel
    Left = 592
    Top = 80
    Width = 63
    Height = 14
    Caption = #32852#31995#30005#35805':'
  end
  object Label10: TLabel
    Left = 800
    Top = 80
    Width = 63
    Height = 14
    Caption = #30003#25253#21333#20301':'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1178
    Height = 41
    ButtonHeight = 31
    ButtonWidth = 96
    Caption = 'ToolBar1'
    TabOrder = 0
    object qk_Button4: TButton
      Left = 0
      Top = 2
      Width = 113
      Height = 31
      Hint = #28165#31354#22521#35757#23398#26657#30003#25253#21517#21333
      Caption = #9312#28165#31354#21517#21333
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = qk_Button4Click
    end
    object dl_Button1: TButton
      Left = 113
      Top = 2
      Width = 129
      Height = 31
      Hint = #23548#20837'Excel'#25991#20214
      Caption = #9313#23548#20837'Excel'#21517#21333
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = dl_Button1Click
      OnExit = dl_Button1Exit
    end
    object xs_Button2: TButton
      Left = 242
      Top = 2
      Width = 104
      Height = 31
      Hint = #26174#31034#22521#35757#23398#26657#37492#23450#30003#25253#21517#21333
      Caption = #9314#26174#31034#21517#21333
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = xs_Button2Click
    end
    object ToolButton2: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 354
      Top = 2
      Width = 97
      Height = 31
      Caption = #9317#21517#21333#20445#23384
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object ToolButton1: TToolButton
      Left = 451
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object qu_Button5: TButton
      Left = 459
      Top = 2
      Width = 96
      Height = 31
      Hint = #36864#20986#26597#35810#31995#32479
      Caption = #36864#20986#31995#32479
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = qu_Button5Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 703
    Width = 1178
    Height = 21
    Panels = <
      item
        Text = '   '#27426#36814#20351#29992#32844#19994#36164#26684#35777#20070#26597#35810#31995#32479
        Width = 220
      end
      item
        Text = '    '#31243#24207#35774#35745#65306#38472#23450#28799
        Width = 180
      end
      item
        Width = 320
      end
      item
        Width = 90
      end>
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 105
    Width = 1161
    Height = 680
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'kh'
        Title.Alignment = taCenter
        Title.Caption = #32771#21495
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sfzh'
        Title.Alignment = taCenter
        Title.Caption = #36523#20221#35777#21495
        Width = 136
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ksxm'
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'zygz'
        Title.Alignment = taCenter
        Title.Caption = #32844#19994
        Width = 151
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'jdjb'
        Title.Alignment = taCenter
        Title.Caption = #31561#32423
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'xb'
        Title.Alignment = taCenter
        Title.Caption = #24615#21035
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gl'
        Title.Alignment = taCenter
        Title.Caption = #24037#40836
        Width = 32
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'whcd'
        Title.Alignment = taCenter
        Title.Caption = #25991#21270#31243#24230
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'lxdh'
        Title.Alignment = taCenter
        Title.Caption = #32852#31995#30005#35805
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'bmdw'
        Title.Alignment = taCenter
        Title.Caption = #21407#30003#25253#21333#20301
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'zsh'
        Title.Alignment = taCenter
        Title.Caption = #35777#20070#21495
        Width = 128
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'kspc'
        Title.Alignment = taCenter
        Title.Caption = #32771#35797#25209#27425
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'bzrq'
        Title.Alignment = taCenter
        Title.Caption = #39041#35777#26085#26399
        Width = 91
        Visible = True
      end>
  end
  object Edit1sfzh: TEdit
    Left = 88
    Top = 48
    Width = 145
    Height = 22
    TabOrder = 3
  end
  object Edit2ksxm: TEdit
    Left = 328
    Top = 48
    Width = 97
    Height = 22
    TabOrder = 4
  end
  object Edit3zsh: TEdit
    Left = 512
    Top = 48
    Width = 137
    Height = 22
    TabOrder = 5
  end
  object Edit4zygz: TEdit
    Left = 720
    Top = 48
    Width = 105
    Height = 22
    TabOrder = 6
  end
  object ComboBox1: TComboBox
    Left = 912
    Top = 48
    Width = 65
    Height = 22
    ItemHeight = 14
    TabOrder = 7
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
  end
  object Edit5nd: TEdit
    Left = 88
    Top = 80
    Width = 145
    Height = 22
    TabOrder = 8
  end
  object Edit6sbzrq: TEdit
    Left = 328
    Top = 80
    Width = 89
    Height = 22
    TabOrder = 9
  end
  object Edit7ebzrq: TEdit
    Left = 456
    Top = 80
    Width = 105
    Height = 22
    TabOrder = 10
  end
  object DateTimePicker1: TDateTimePicker
    Left = 328
    Top = 80
    Width = 97
    Height = 25
    Date = 36890.700962268520000000
    Time = 36890.700962268520000000
    TabOrder = 11
    OnCloseUp = DateTimePicker1CloseUp
  end
  object DateTimePicker2: TDateTimePicker
    Left = 456
    Top = 80
    Width = 105
    Height = 22
    Date = 42088.307600000000000000
    Time = 42088.307600000000000000
    TabOrder = 12
    OnCloseUp = DateTimePicker2CloseUp
  end
  object Edit8lxdh: TEdit
    Left = 664
    Top = 80
    Width = 113
    Height = 22
    TabOrder = 13
  end
  object Edit9bmdw: TEdit
    Left = 872
    Top = 80
    Width = 105
    Height = 22
    TabOrder = 14
  end
  object Button1: TButton
    Left = 992
    Top = 56
    Width = 73
    Height = 33
    Caption = #26597#35810
    TabOrder = 15
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 1088
    Top = 56
    Width = 65
    Height = 33
    Caption = #28165#31354#25628#32034
    TabOrder = 16
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 600
    Top = 776
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT  * FROM T_yhks_tmp ORDER BY kh ASC')
    Left = 96
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 136
    Top = 144
  end
  object ADOConnection2: TADOConnection
    LoginPrompt = False
    Left = 96
    Top = 208
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection2
    Parameters = <>
    Left = 136
    Top = 208
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Excel'#25991#20214'(*.xls)|*.xls'
    Left = 56
    Top = 208
  end
end
