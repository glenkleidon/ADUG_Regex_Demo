object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 519
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 169
    Width = 861
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -17
    ExplicitTop = 110
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 372
    Width = 861
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 369
    ExplicitWidth = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 172
    Width = 861
    Height = 197
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 64
    ExplicitTop = 169
    DesignSize = (
      861
      197)
    object lblExpression: TLabel
      Left = 16
      Top = 6
      Width = 52
      Height = 13
      Caption = 'Expression'
    end
    object lblFlags: TLabel
      Left = 480
      Top = 6
      Width = 25
      Height = 13
      Caption = 'Flags'
    end
    object clbFlags: TCheckListBox
      Left = 428
      Top = 25
      Width = 416
      Height = 152
      Anchors = [akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 23
      Items.Strings = (
        '(i) Case Insensitive'
        '(g) Global'
        '(m) Multiline use $ and ^ on each line'
        '(s) DotAll fullstop matches ANY char'
        '(x) Literal space is ignored'
        '(u) Ungreedy')
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 423
    end
    object memExpression: TMemo
      Left = 16
      Top = 25
      Width = 401
      Height = 112
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Consolas'
      Font.Style = []
      Lines.Strings = (
        'word')
      ParentFont = False
      TabOrder = 1
    end
    object Search: TButton
      Left = 325
      Top = 143
      Width = 97
      Height = 34
      Anchors = [akTop, akRight]
      Caption = 'Search'
      TabOrder = 2
      OnClick = SearchClick
    end
  end
  object memDocument: TMemo
    Left = 0
    Top = 0
    Width = 861
    Height = 169
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'Words '
      'Tell me a word and I'#39'll tell you some other words.'
      '')
    ParentFont = False
    TabOrder = 1
    ExplicitTop = -3
    ExplicitWidth = 794
  end
  object memResults: TMemo
    Left = 0
    Top = 375
    Width = 861
    Height = 144
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
