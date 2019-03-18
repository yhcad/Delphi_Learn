object Form1: TForm1
  Left = 483
  Top = 202
  Width = 506
  Height = 347
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = #24494#36719#31616
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 21
  object Panel1: TPanel
    Left = 24
    Top = 16
    Width = 449
    Height = 153
    BevelOuter = bvLowered
    BevelWidth = 3
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 40
      Height = 21
      Caption = #23398#21495
    end
    object Label2: TLabel
      Left = 32
      Top = 72
      Width = 40
      Height = 21
      Caption = #22995#21517
    end
    object Edit1: TEdit
      Left = 88
      Top = 24
      Width = 273
      Height = 29
      TabOrder = 0
      OnEnter = Edit1Enter
    end
    object Edit2: TEdit
      Left = 88
      Top = 72
      Width = 273
      Height = 29
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 24
    Top = 176
    Width = 449
    Height = 81
    BevelWidth = 3
    Color = clActiveCaption
    TabOrder = 1
    object Label3: TLabel
      Left = 32
      Top = 24
      Width = 40
      Height = 21
      Caption = #36755#20986
    end
    object Edit3: TEdit
      Left = 88
      Top = 16
      Width = 337
      Height = 29
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 64
    Top = 272
    Width = 137
    Height = 33
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 272
    Width = 169
    Height = 33
    Caption = #36864#20986
    TabOrder = 3
    OnClick = Button2Click
  end
end
