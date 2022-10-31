object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 114
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 65
    Width = 47
    Height = 13
    Caption = 'Zip Folder'
  end
  object Label3: TLabel
    Left = 16
    Top = 38
    Width = 40
    Height = 13
    Caption = 'FileMask'
  end
  object Label2: TLabel
    Left = 16
    Top = 11
    Width = 58
    Height = 13
    Caption = 'Search Path'
  end
  object edtPath: TEdit
    Left = 81
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'C:\Git\BackupFile\'
  end
  object edtFileMask: TEdit
    Left = 81
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '*.ini'
  end
  object btn2: TButton
    Left = 207
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Zip'
    TabOrder = 2
    OnClick = btn2Click
  end
  object edtSearchPath: TEdit
    Left = 81
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'c:\Git\Data\'
  end
end
