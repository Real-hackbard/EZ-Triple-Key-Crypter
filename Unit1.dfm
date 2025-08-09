object Form1: TForm1
  Left = 528
  Top = 155
  Caption = 'EZ Triple Key File Crypter'
  ClientHeight = 392
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 25
    Top = 171
    Width = 30
    Height = 13
    Caption = 'Key I :'
  end
  object Label2: TLabel
    Left = 22
    Top = 195
    Width = 33
    Height = 13
    Caption = 'Key II :'
  end
  object Label3: TLabel
    Left = 19
    Top = 219
    Width = 36
    Height = 13
    Caption = 'Key III :'
  end
  object Bevel1: TBevel
    Left = 24
    Top = 148
    Width = 369
    Height = 2
  end
  object Label4: TLabel
    Left = 17
    Top = 29
    Width = 105
    Height = 13
    Caption = 'Load any File to Crypt.'
  end
  object Label5: TLabel
    Left = 17
    Top = 93
    Width = 86
    Height = 13
    Caption = 'Save Crypted File.'
  end
  object Button1: TButton
    Left = 248
    Top = 330
    Width = 75
    Height = 25
    Caption = 'Crypt'
    TabOrder = 0
    TabStop = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 328
    Top = 330
    Width = 75
    Height = 25
    Caption = 'Decrypt'
    Enabled = False
    TabOrder = 1
    TabStop = False
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 48
    Width = 337
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 8
    Top = 112
    Width = 337
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 3
  end
  object SpinEdit1: TSpinEdit
    Left = 64
    Top = 168
    Width = 129
    Height = 22
    TabStop = False
    MaxLength = 2
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
  object SpinEdit2: TSpinEdit
    Left = 64
    Top = 192
    Width = 129
    Height = 22
    TabStop = False
    MaxLength = 2
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
  end
  object SpinEdit3: TSpinEdit
    Left = 64
    Top = 216
    Width = 129
    Height = 22
    TabStop = False
    MaxLength = 2
    MaxValue = 0
    MinValue = 0
    TabOrder = 6
    Value = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 373
    Width = 434
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Load  any File..'
    ExplicitTop = 333
    ExplicitWidth = 449
  end
  object Button3: TButton
    Left = 351
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 8
    TabStop = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 351
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 9
    TabStop = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 64
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Generate'
    TabOrder = 10
    TabStop = False
    OnClick = Button5Click
  end
  object RadioGroup1: TRadioGroup
    Left = 208
    Top = 168
    Width = 209
    Height = 70
    Caption = ' Crypt Mode '
    ItemIndex = 0
    Items.Strings = (
      'Crypt'
      'Decrypt')
    TabOrder = 11
    OnClick = RadioGroup1Click
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 296
    Width = 401
    Height = 17
    TabOrder = 12
  end
  object OpenDialog1: TOpenDialog
    Left = 160
    Top = 72
  end
  object SaveDialog1: TSaveDialog
    Left = 232
    Top = 72
  end
end
