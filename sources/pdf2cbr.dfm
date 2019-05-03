object Form1: TForm1
  Left = 278
  Top = 120
  Width = 715
  Height = 457
  BorderWidth = 1
  Caption = 'PDF2CBR - v1.2br'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 224
    Width = 200
    Height = 13
    Caption = 'Arquivo PDF selecionado para convers'#227'o:'
  end
  object Label2: TLabel
    Left = 8
    Top = 264
    Width = 186
    Height = 13
    Caption = 'Prefixo para os arquivos JPG extra'#237'dos:'
  end
  object Label3: TLabel
    Left = 8
    Top = 304
    Width = 154
    Height = 13
    Caption = 'Nome do arquivo de sa'#237'da CBR:'
  end
  object Label4: TLabel
    Left = 216
    Top = 192
    Width = 119
    Height = 13
    Caption = 'Progresso da Convers'#227'o:'
  end
  object Label5: TLabel
    Left = 592
    Top = 269
    Width = 22
    Height = 25
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 552
    Top = 248
    Width = 111
    Height = 13
    Caption = 'Arquivos Selecionados:'
  end
  object lbl7: TLabel
    Left = 8
    Top = 344
    Width = 249
    Height = 13
    Caption = 'Qtd. Caracteres que ser'#227'o mantidos do nome original'
  end
  object Edit1: TEdit
    Left = 8
    Top = 240
    Width = 521
    Height = 21
    TabOrder = 0
    Text = '*.pdf'
    OnChange = Edit1Change
  end
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 8
    Width = 209
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 1
  end
  object FilterComboBox1: TFilterComboBox
    Left = 8
    Top = 32
    Width = 209
    Height = 21
    FileList = FileListBox1
    Filter = 'Pdf Files (*.pdf)|*.pdf|All files (*.*)|*.*|'
    TabOrder = 2
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 64
    Width = 209
    Height = 113
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 3
  end
  object FileListBox1: TFileListBox
    Left = 224
    Top = 8
    Width = 441
    Height = 169
    FileEdit = Edit1
    ItemHeight = 13
    Mask = '*.pdf'
    MultiSelect = True
    TabOrder = 4
    OnChange = FileListBox1Change
    OnClick = FileListBox1Click
  end
  object BitBtn1: TBitBtn
    Left = 544
    Top = 304
    Width = 113
    Height = 33
    Caption = 'Converter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 280
    Width = 521
    Height = 21
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 8
    Top = 320
    Width = 521
    Height = 21
    TabOrder = 7
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 192
    Width = 97
    Height = 17
    Caption = 'Apagar JPGs'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object CheckBox2: TCheckBox
    Left = 104
    Top = 192
    Width = 97
    Height = 17
    Caption = 'Apagar PDF(s)'
    TabOrder = 9
  end
  object ProgressBar1: TProgressBar
    Left = 344
    Top = 192
    Width = 321
    Height = 16
    TabOrder = 10
  end
  object edt4: TEdit
    Left = 8
    Top = 360
    Width = 81
    Height = 21
    TabOrder = 11
    OnChange = Edit1Change
  end
  object XPManifest1: TXPManifest
    Left = 640
  end
end
