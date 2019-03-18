object lately_Form3: Tlately_Form3
  Left = 228
  Top = 132
  Width = 1120
  Height = 745
  Caption = #36817#26399#30003#25253#37492#23450#21517#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1112
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
      TabOrder = 3
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
    object cf_Button3: TButton
      Left = 346
      Top = 2
      Width = 119
      Height = 31
      Hint = #26597#35810#30003#25253#21517#21333#19982#21382#21490#35777#20070#37325#22797#30340#20449#24687
      Caption = #9315#35777#20070#37325#22797#26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = cf_Button3Click
    end
    object ToolButton2: TToolButton
      Left = 465
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object tq_Button6: TButton
      Left = 473
      Top = 2
      Width = 119
      Height = 31
      Hint = #26597#35810#30003#25253#21517#21333#19982#21382#21490#35777#20070#19982#21516#26399#30003#25253#30340#20449#24687
      Caption = #9316#21516#26399#37325#22797#26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = tq_Button6Click
    end
    object ToolButton3: TToolButton
      Left = 592
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 600
      Top = 2
      Width = 97
      Height = 31
      Caption = #9317#21517#21333#20445#23384
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object ToolButton1: TToolButton
      Left = 697
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object qu_Button5: TButton
      Left = 705
      Top = 2
      Width = 96
      Height = 31
      Hint = #36864#20986#26597#35810#31995#32479
      Caption = #36864#20986#31995#32479
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = qu_Button5Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 690
    Width = 1112
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
    Left = 0
    Top = 41
    Width = 1112
    Height = 649
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'kh'
        Title.Alignment = taCenter
        Title.Caption = #32771#21495
        Width = 30
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
        Width = 126
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
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 584
    Top = 664
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT  * FROM T_yhks_tmp ORDER BY kh ASC')
    Left = 112
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 152
    Top = 128
  end
  object ADOConnection2: TADOConnection
    LoginPrompt = False
    Left = 88
    Top = 200
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection2
    Parameters = <>
    Left = 120
    Top = 200
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Excel'#25991#20214'(*.xls)|*.xls'
    Left = 48
    Top = 200
  end
end
