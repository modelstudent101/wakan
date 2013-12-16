inherited fWordLookup: TfWordLookup
  Left = 57
  Top = 137
  BorderStyle = bsSizeToolWin
  Caption = '#00642^eDictionary lookup'
  ClientHeight = 214
  ClientWidth = 704
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  Scaled = False
  ShowHint = True
  OnShow = FormShow
  ExplicitWidth = 720
  ExplicitHeight = 248
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel: TPanel
    Width = 704
    Height = 214
    TabOrder = 2
    ExplicitWidth = 704
    ExplicitHeight = 214
    inherited btnGoToVocab: TSpeedButton
      Left = 425
      Top = 185
      ExplicitTop = 185
    end
    inherited btnAddToVocab: TSpeedButton
      Left = 521
      Top = 185
      ExplicitTop = 185
    end
    inherited btnCopyToClipboard: TSpeedButton
      Left = 617
      Top = 185
      ExplicitTop = 185
    end
    object btnLookupJtoE: TSpeedButton [3]
      Left = 11
      Top = 4
      Width = 110
      Height = 22
      Hint = '#00643^eSearch by japanese reading (F2)'
      AllowAllUp = True
      GroupIndex = 1
      Down = True
      Caption = '#00644^eJ -> E'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLookupJtoEClick
    end
    object btnLookupEtoJ: TSpeedButton [4]
      Left = 123
      Top = 4
      Width = 107
      Height = 22
      Hint = '#00645^eSearch by english meaning (F3)'
      AllowAllUp = True
      GroupIndex = 1
      Caption = '#00646^e&E -> J'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLookupJtoEClick
    end
    object btnLookupClip: TSpeedButton [5]
      Left = 232
      Top = 4
      Width = 73
      Height = 22
      Hint = '#00647^eSearch by Kanji stored in clipboard (F4)'
      AllowAllUp = True
      GroupIndex = 1
      Caption = '#00289^eBy clipboard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLookupJtoEClick
    end
    object SpeedButton10: TSpeedButton [6]
      Left = 311
      Top = 4
      Width = 23
      Height = 22
      Hint = '#00656^eSearch exact word (F5)'
      GroupIndex = 7
      Down = True
      Caption = 'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton10Click
    end
    object SpeedButton11: TSpeedButton [7]
      Left = 335
      Top = 4
      Width = 23
      Height = 22
      Hint = '#00657^eSearch beginning (F6)'
      GroupIndex = 7
      Caption = 'A+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton10Click
    end
    object SpeedButton12: TSpeedButton [8]
      Left = 359
      Top = 4
      Width = 23
      Height = 22
      Hint = '#00658^eSearch end (F7)'
      GroupIndex = 7
      Caption = '+A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton10Click
    end
    object SpeedButton18: TSpeedButton [9]
      Left = 383
      Top = 4
      Width = 25
      Height = 22
      Hint = '#00930^eSearch middle'
      GroupIndex = 7
      Caption = '+A+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton10Click
    end
    object SpeedButton4: TSpeedButton [10]
      Left = 414
      Top = 4
      Width = 23
      Height = 22
      Hint = '#00661^eSearch for inflected words / conjugated verbs'
      AllowAllUp = True
      GroupIndex = 8
      Caption = 'Inf'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLookupJtoEClick
    end
    object sbAutoPreview: TSpeedButton [11]
      Left = 438
      Top = 4
      Width = 33
      Height = 22
      Hint = 
        '#00662^eAuto-preview while typing (full search with arrow button' +
        ')'
      AllowAllUp = True
      GroupIndex = 9
      Caption = 'Auto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLookupJtoEClick
    end
    object SpeedButton14: TSpeedButton [12]
      Left = 478
      Top = 4
      Width = 25
      Height = 22
      Hint = '#00663^eUse dictionaries in group 1 (Ctrl-1)'
      GroupIndex = 10
      Down = True
      Caption = 'D1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLookupJtoEClick
    end
    object SpeedButton15: TSpeedButton [13]
      Left = 504
      Top = 4
      Width = 25
      Height = 22
      Hint = '#00664^eUse dictionaries in group 2 (Ctrl-2)'
      GroupIndex = 10
      Caption = 'D2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLookupJtoEClick
    end
    object SpeedButton16: TSpeedButton [14]
      Left = 530
      Top = 4
      Width = 25
      Height = 22
      Hint = '#00665^eUse dictionaries in group 3 (Ctrl-3)'
      GroupIndex = 10
      Caption = 'D3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLookupJtoEClick
    end
    object Label2: TLabel [15]
      Left = 604
      Top = 37
      Width = 92
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '#00666^eAll visible'
      Enabled = False
    end
    object Label3: TLabel [16]
      Left = 688
      Top = 17
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '0'
    end
    object SpeedButton6: TSpeedButton [17]
      Left = 8
      Top = 189
      Width = 123
      Height = 17
      Hint = '#00650^eCharacters in word'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 6
      Caption = '#00651^eChar. in word'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton6Click
    end
    object SpeedButton9: TSpeedButton [18]
      Left = 136
      Top = 189
      Width = 130
      Height = 17
      Hint = '#00062^eAdd to vocabulary'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 4
      Caption = '#00315^eExamples'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton9Click
    end
    inherited BlankPanel: TBlankPanel
      Top = 62
      Width = 687
      Height = 123
      ExplicitTop = 62
      ExplicitWidth = 687
      ExplicitHeight = 123
    end
    inherited StringGrid: TWakanWordGrid
      Top = 63
      Width = 685
      Height = 121
      ExplicitTop = 63
      ExplicitWidth = 685
      ExplicitHeight = 121
      ColWidths = (
        110
        138
        413)
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 616
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnChange = Edit1Change
      OnClick = Edit1Click
    end
    object BitBtn1: TBitBtn
      Left = 626
      Top = 32
      Width = 70
      Height = 25
      Hint = 
        '#00668^eSearch results did not fit one page, click to display ev' +
        'erything'
      Anchors = [akTop, akRight]
      Caption = '#00669^eSearch'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object pnlDockExamples: TPanel [1]
    Left = 0
    Top = 214
    Width = 704
    Height = 0
    Align = alBottom
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
  end
  object Panel3: TPanel [2]
    Left = 704
    Top = 0
    Width = 0
    Height = 214
    Align = alRight
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 1
  end
end
