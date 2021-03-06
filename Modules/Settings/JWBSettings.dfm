object fSettings: TfSettings
  Left = 451
  Top = 131
  BorderStyle = bsDialog
  Caption = '#00397^eSettings'
  ClientHeight = 503
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcPages: TPageControl
    Left = 187
    Top = 0
    Width = 473
    Height = 462
    Margins.Left = 9
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = tsCharacterCardPrinting
    Align = alClient
    MultiLine = True
    Style = tsButtons
    TabOrder = 1
    OnChange = pcPagesChange
    object tsGeneral: TTabSheet
      Caption = 'General'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbGeneral: TScrollBox
        Left = 0
        Top = 0
        Width = 465
        Height = 452
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object Label41: TLabel
          Left = 3
          Top = 212
          Width = 206
          Height = 13
          Caption = '#00399^eDictionary entries grid font height:'
        end
        object Label47: TLabel
          Left = 275
          Top = 324
          Width = 85
          Height = 13
          Caption = '#00400^eminutes'
        end
        object cbSaveSearchParams: TCheckBox
          Left = 3
          Top = 418
          Width = 417
          Height = 17
          Hint = '#00999^eKanji search params will be preserved on program restart'
          Caption = '#00998^eSave kanji search params'
          TabOrder = 14
        end
        object CheckBox26: TCheckBox
          Left = 3
          Top = 116
          Width = 401
          Height = 17
          Hint = 
            '#00401^eSaves statistical information to disk, filename is gener' +
            'ated by date so you can check your progress'
          Caption = '#00402^eSave statistics to disk (folder STAT)'
          TabOrder = 0
        end
        object CheckBox10: TCheckBox
          Left = 3
          Top = 140
          Width = 433
          Height = 17
          Hint = '#00403^eShows words with non-learned kanji in different color'
          Caption = '#00404^eDifferentiate words with non-learned characters'
          TabOrder = 1
        end
        object cbStatusColors: TCheckBox
          Left = 3
          Top = 188
          Width = 433
          Height = 17
          Hint = 
            '#00405^eColors: green - mastered, yellow - learned, cyan - unlea' +
            'rned, red - problematic'
          Caption = '#00406^eShow word learned-status by different background color'
          TabOrder = 2
        end
        object CheckBox46: TCheckBox
          Left = 3
          Top = 300
          Width = 433
          Height = 17
          Hint = 
            '#00405^eColors: green - mastered, yellow - learned, cyan - unlea' +
            'rned, red - problematic'
          Caption = '#00407^eAuto-save user data on exit'
          TabOrder = 3
        end
        object Edit25: TEdit
          Left = 219
          Top = 212
          Width = 121
          Height = 21
          TabOrder = 4
          Text = 'Edit25'
        end
        object CheckBox49: TCheckBox
          Left = 3
          Top = 236
          Width = 417
          Height = 17
          Caption = '#00408^eLoad dictionaries on demand'
          TabOrder = 5
        end
        object cbMultilineGrids: TCheckBox
          Left = 3
          Top = 260
          Width = 353
          Height = 17
          Caption = '#00409^eMulti-line word grids'
          TabOrder = 6
        end
        object cbAutosave: TCheckBox
          Left = 3
          Top = 324
          Width = 193
          Height = 17
          Caption = '#00410^eAuto-save user database every '
          TabOrder = 7
        end
        object edtAutoSavePeriod: TEdit
          Left = 203
          Top = 324
          Width = 65
          Height = 21
          TabOrder = 8
          Text = 'edtAutoSavePeriod'
        end
        object CheckBox55: TCheckBox
          Left = 3
          Top = 348
          Width = 417
          Height = 17
          Caption = '#00411^eMake backup of user file into BACKUP folder every day'
          TabOrder = 9
        end
        object RadioGroup5: TRadioGroup
          Left = 3
          Top = 0
          Width = 353
          Height = 85
          Hint = '#00432^eSelects what chinese characters are displayed'
          Caption = '#00883^eChinese character mode && character conversion'
          ItemIndex = 0
          Items.Strings = (
            '#00434^eTraditional (Big5) only'
            '#00435^eSimplified (GB2312) only'
            '#00436^eAll characters (Unicode)')
          TabOrder = 10
        end
        object CheckBox70: TCheckBox
          Left = 3
          Top = 92
          Width = 417
          Height = 17
          Caption = '^eDisplay message when word is added to vocabulary'
          TabOrder = 11
        end
        object cbShowSplashscreen: TCheckBox
          Left = 3
          Top = 371
          Width = 417
          Height = 17
          Caption = '#00986^eShow splashscreen when program starts'
          TabOrder = 12
        end
        object cbSaveColumnWidths: TCheckBox
          Left = 3
          Top = 395
          Width = 417
          Height = 17
          Hint = 
            '#00996^eColumn width changes in dictionary and vocabulary will b' +
            'e preserved on program restart'
          Caption = '#00995^eSave column widths'
          TabOrder = 13
        end
      end
    end
    object tsRomanization: TTabSheet
      Tag = 1
      Caption = 'Romanization'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox6: TGroupBox
        Left = 3
        Top = 3
        Width = 457
        Height = 218
        Caption = '#00413^eRomanization of japanese'
        TabOrder = 0
        DesignSize = (
          457
          218)
        object Label16: TLabel
          Left = 232
          Top = 20
          Width = 163
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '#00414^eRomanization test:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblKanaToRomajiHint: TLabel
          Left = 194
          Top = 185
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'click ->'
        end
        object rgShowKana: TRadioGroup
          Left = 232
          Top = 110
          Width = 193
          Height = 61
          Anchors = [akTop, akRight]
          Caption = '#00423^eShow phonetic in'
          ItemIndex = 0
          Items.Strings = (
            '#00424^eHiragana / Katakana'
            '#00425^eRomaji')
          TabOrder = 0
          OnClick = RadioGroup1Click
        end
        object edtTestRomaji: TEdit
          Left = 232
          Top = 39
          Width = 209
          Height = 21
          Hint = '#01098^Input some text to see how it converts to kana'
          Anchors = [akTop, akRight]
          TabOrder = 1
          OnChange = edtTestRomajiChange
        end
        object pbRomajiAsHiragana: TWakanPaintbox
          Left = 232
          Top = 61
          Width = 209
          Height = 20
          Anchors = [akTop, akRight]
          Color = clBtnFace
          OnPaint = pbRomajiAsHiraganaPaint
        end
        object pbRomajiAsKatakana: TWakanPaintbox
          Left = 232
          Top = 80
          Width = 209
          Height = 20
          Anchors = [akTop, akRight]
          Color = clBtnFace
          OnPaint = pbRomajiAsKatakanaPaint
        end
        object cbMultipleRoma: TCheckBox
          Left = 15
          Top = 185
          Width = 163
          Height = 17
          Hint = '#01095^Use multiple romanization schemes at the same time'
          Anchors = [akLeft, akRight, akBottom]
          Caption = '#01094^Multiple'
          TabOrder = 4
          OnClick = cbMultipleRomaClick
        end
        object btnRomaSystemUp: TBitBtn
          Left = 184
          Top = 20
          Width = 32
          Height = 32
          Hint = '#01096^Give the romanization more priority'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
            3333333333777F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
            3333333777737777F333333099999990333333373F3333373333333309999903
            333333337F33337F33333333099999033333333373F333733333333330999033
            3333333337F337F3333333333099903333333333373F37333333333333090333
            33333333337F7F33333333333309033333333333337373333333333333303333
            333333333337F333333333333330333333333333333733333333}
          NumGlyphs = 2
          TabOrder = 5
          Visible = False
          OnClick = btnRomaSystemUpClick
        end
        object btnRomaSystemDown: TBitBtn
          Left = 184
          Top = 58
          Width = 32
          Height = 32
          Hint = '#01097^Give the romanization less priority'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337F33333333333333033333333333333373F333333333333090333
            33333333337F7F33333333333309033333333333337373F33333333330999033
            3333333337F337F33333333330999033333333333733373F3333333309999903
            333333337F33337F33333333099999033333333373333373F333333099999990
            33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333300033333333333337773333333}
          NumGlyphs = 2
          TabOrder = 6
          Visible = False
          OnClick = btnRomaSystemDownClick
        end
        object lbRomaSystems: TRearrangeCheckListBox
          Left = 15
          Top = 20
          Width = 163
          Height = 159
          Anchors = [akLeft, akTop, akRight, akBottom]
          DragMode = dmAutomatic
          ItemHeight = 13
          TabOrder = 7
          OnClick = lbRomaSystemsClick
          AutoDragItems = True
          AutoCtrlMove = True
          OnSelectionChanged = lbRomaSystemsSelectionChanged
        end
        object pbKanaAsRomaji: TWakanPaintbox
          Left = 232
          Top = 182
          Width = 209
          Height = 20
          Hint = 
            '#01100^An example of how the phonetic would look. Click to see a' +
            'nother example.'
          Anchors = [akTop, akRight]
          Color = clBtnFace
          OnPaint = pbKanaAsRomajiPaint
          OnClick = pbKanaAsRomajiClick
        end
      end
      object GroupBox7: TGroupBox
        Left = 3
        Top = 227
        Width = 457
        Height = 218
        Caption = '#00426^eRomanization of chinese'
        TabOrder = 1
        DesignSize = (
          457
          218)
        object Label27: TLabel
          Left = 232
          Top = 20
          Width = 163
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '#00414^eRomanization test:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 194
          Top = 185
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'click ->'
        end
        object rgShowBopomofo: TRadioGroup
          Left = 232
          Top = 110
          Width = 208
          Height = 61
          Anchors = [akTop, akRight]
          Caption = '#00423^eShow phonetic in'
          ItemIndex = 0
          Items.Strings = (
            '#01092^Bopomofo'
            '#01093^Romaji')
          TabOrder = 0
          OnClick = rgShowBopomofoClick
        end
        object edtTestPinyin: TEdit
          Left = 232
          Top = 39
          Width = 209
          Height = 21
          Hint = '#01099^Input some text to see how it converts to bopomofo'
          Anchors = [akTop, akRight]
          TabOrder = 1
          OnChange = edtTestPinyinChange
        end
        object pbPinyinAsBopomofo: TWakanPaintbox
          Left = 232
          Top = 61
          Width = 209
          Height = 20
          Anchors = [akTop, akRight]
          Color = clBtnFace
          OnPaint = pbPinyinAsBopomofoPaint
        end
        object pbBopomofoAsPinyin: TWakanPaintbox
          Left = 232
          Top = 182
          Width = 209
          Height = 20
          Hint = 
            '#01100^An example of how the phonetic would look. Click to see a' +
            'nother example.'
          Anchors = [akTop, akRight]
          Color = clBtnFace
          OnPaint = pbBopomofoAsPinyinPaint
          OnClick = pbBopomofoAsPinyinClick
        end
        object btnPinyinSystemUp: TBitBtn
          Left = 184
          Top = 20
          Width = 32
          Height = 32
          Hint = '#01096^Give the romanization more priority'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
            3333333333777F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
            3333333777737777F333333099999990333333373F3333373333333309999903
            333333337F33337F33333333099999033333333373F333733333333330999033
            3333333337F337F3333333333099903333333333373F37333333333333090333
            33333333337F7F33333333333309033333333333337373333333333333303333
            333333333337F333333333333330333333333333333733333333}
          NumGlyphs = 2
          TabOrder = 4
          Visible = False
          OnClick = btnPinyinSystemUpClick
        end
        object btnPinyinSystemDown: TBitBtn
          Left = 184
          Top = 58
          Width = 32
          Height = 32
          Hint = '#01097^Give the romanization less priority'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337F33333333333333033333333333333373F333333333333090333
            33333333337F7F33333333333309033333333333337373F33333333330999033
            3333333337F337F33333333330999033333333333733373F3333333309999903
            333333337F33337F33333333099999033333333373333373F333333099999990
            33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333300033333333333337773333333}
          NumGlyphs = 2
          TabOrder = 5
          Visible = False
          OnClick = btnPinyinSystemDownClick
        end
        object lbPinyinSystems: TRearrangeCheckListBox
          Left = 15
          Top = 20
          Width = 163
          Height = 159
          Anchors = [akLeft, akTop, akRight, akBottom]
          DragMode = dmAutomatic
          ItemHeight = 13
          TabOrder = 6
          OnClick = lbPinyinSystemsClick
          AutoDragItems = True
          AutoCtrlMove = True
          OnSelectionChanged = lbPinyinSystemsSelectionChanged
        end
        object cbMultiplePinyin: TCheckBox
          Left = 15
          Top = 185
          Width = 163
          Height = 17
          Hint = '#01095^Use multiple romanization schemes at the same time'
          Anchors = [akLeft, akRight, akBottom]
          Caption = '#01094^Multiple'
          TabOrder = 7
          OnClick = cbMultiplePinyinClick
        end
      end
    end
    object tsColors: TTabSheet
      Tag = 3
      Caption = 'Colors'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        465
        452)
      object Shape2: TShape
        Left = 3
        Top = 353
        Width = 105
        Height = 25
        Anchors = [akLeft, akBottom]
        ExplicitTop = 326
      end
      object Label42: TLabel
        Left = 3
        Top = 3
        Width = 91
        Height = 13
        Caption = '#00552^eCategory'
      end
      object ListBox3: TListBox
        Left = 3
        Top = 67
        Width = 457
        Height = 283
        Anchors = [akLeft, akTop, akBottom]
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox3Click
      end
      object Button12: TButton
        Left = 115
        Top = 353
        Width = 217
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '#00553^eChange'
        TabOrder = 1
        OnClick = Button12Click
      end
      object Button14: TButton
        Left = 339
        Top = 353
        Width = 121
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '#00554^eRevert to default'
        TabOrder = 2
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 331
        Top = 3
        Width = 129
        Height = 25
        Caption = '#00555^eSet all to default'
        TabOrder = 3
        OnClick = Button15Click
      end
      object ComboBox2: TComboBox
        Left = 3
        Top = 19
        Width = 313
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnChange = ComboBox2Change
        Items.Strings = (
          '#00298^eCharacter list'
          '#00556^eWord grids'
          '#00557^eWord markers'
          '#00558^eEditor & translator'
          '#00559^ePopup tool')
      end
      object cbNoCharColors: TCheckBox
        Left = 8
        Top = 49
        Width = 457
        Height = 17
        Caption = 
          '#00560^eDo not use colors in character list, use Windows default' +
          ' colors instead'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = cbNoCharColorsClick
      end
      object cbNoEditorColors: TCheckBox
        Left = 8
        Top = 49
        Width = 457
        Height = 17
        Caption = 
          '#00561^eDo not use colors in editor, use Windows default colors ' +
          'instead'
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = cbNoEditorColorsClick
      end
      object cbNoWordGridColors: TCheckBox
        Left = 3
        Top = 45
        Width = 433
        Height = 17
        Hint = 
          '#00562^eColors: black - common, grey - uncommon, blue - learned,' +
          ' green - only in names'
        Caption = 
          '#00563^eDo not use colors in word grids, use Windows default col' +
          'ors instead'
        TabOrder = 7
        OnClick = cbNoWordGridColorsClick
      end
    end
    object tsCharacterList: TTabSheet
      Tag = 5
      Caption = 'Character list'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label35: TLabel
        Left = 3
        Top = 87
        Width = 132
        Height = 13
        Caption = '#00427^eDisplayed radical:'
      end
      object Label52: TLabel
        Left = 2
        Top = 182
        Width = 348
        Height = 13
        Caption = 
          '#00920^eHow many most frequent compounds to display in "Freq" mo' +
          'de:'
      end
      object rgKanjiGridSize: TRadioGroup
        Left = 3
        Top = 3
        Width = 401
        Height = 77
        Caption = '#00428^eCharacter size in grid'
        ItemIndex = 0
        Items.Strings = (
          '#00429^eSmall'
          '#00430^eMedium'
          '#00431^eLarge')
        TabOrder = 0
      end
      object CheckBox1: TCheckBox
        Left = 3
        Top = 135
        Width = 305
        Height = 17
        Caption = '#00437^eShow stroke count in grid'
        TabOrder = 1
      end
      object cbRadicalType: TComboBox
        Left = 3
        Top = 103
        Width = 233
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        Items.Strings = (
          'Bushu'
          'Unicode'
          '#00438^eJapanese'
          'KanWa'
          'KangXi'
          '#00439^eKorean')
      end
      object CheckBox51: TCheckBox
        Left = 3
        Top = 384
        Width = 433
        Height = 17
        Caption = '#00440^eUse grid font for displaying stroke order'
        TabOrder = 3
        Visible = False
      end
      object cbYomiIgnoreOkurigana: TCheckBox
        Left = 3
        Top = 159
        Width = 433
        Height = 17
        Caption = '#00891^eSearch by yomi can ignore okurigana'
        TabOrder = 4
      end
      object Edit34: TEdit
        Left = 323
        Top = 183
        Width = 121
        Height = 21
        TabOrder = 5
        Text = '0'
      end
    end
    object tsCharacterDetailsGeneral: TTabSheet
      Tag = 19
      Caption = 'Character details'
      ImageIndex = 19
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cbDetailsShowKanjiClass: TCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 422
        Height = 17
        Caption = '#01120^Show kanji class over kanji (Learned/Rare/etc)'
        TabOrder = 0
      end
      object cbDetailsKanjiInColor: TCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 26
        Width = 422
        Height = 17
        Caption = '#01121^Color kanji according to its class (Learned/Rare/etc)'
        TabOrder = 1
      end
      object rgDetailsCategoryEditorType: TRadioGroup
        Left = 2
        Top = 57
        Width = 319
        Height = 82
        Caption = '#01126^Category editor'
        ItemIndex = 0
        Items.Strings = (
          '#01127^"Add category" button'
          '#01128^"Add/remove category" combobox'
          '#01129^Both')
        TabOrder = 2
      end
      object cbDetailsShowLinks: TCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 154
        Width = 422
        Height = 17
        Caption = '#01123^Show links'
        TabOrder = 3
      end
    end
    object tsCharacterDetailsItems: TTabSheet
      Tag = 6
      Caption = 'Character details items'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        465
        452)
      object Label34: TLabel
        Left = 2
        Top = 9
        Width = 125
        Height = 13
        Caption = '#00531^eDisplayed items:'
      end
      object SpeedButton11: TSpeedButton
        Left = 436
        Top = 99
        Width = 23
        Height = 79
        Hint = '#00532^eMove up'
        Anchors = [akTop, akRight]
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
          3333333333777F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
          3333333777737777F333333099999990333333373F3333373333333309999903
          333333337F33337F33333333099999033333333373F333733333333330999033
          3333333337F337F3333333333099903333333333373F37333333333333090333
          33333333337F7F33333333333309033333333333337373333333333333303333
          333333333337F333333333333330333333333333333733333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton11Click
        ExplicitLeft = 454
      end
      object SpeedButton12: TSpeedButton
        Left = 436
        Top = 235
        Width = 23
        Height = 79
        Hint = '#00533^eMove down'
        Anchors = [akTop, akRight]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton12Click
        ExplicitLeft = 454
      end
      object ListBox2: TListBox
        Left = 2
        Top = 25
        Width = 432
        Height = 334
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox2Click
      end
      object Button7: TButton
        Left = 2
        Top = 366
        Width = 113
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '#00534^eAdd...'
        TabOrder = 1
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 170
        Top = 366
        Width = 113
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '#00535^eChange...'
        TabOrder = 2
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 337
        Top = 366
        Width = 97
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '#00536^eDelete'
        TabOrder = 3
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 284
        Top = 3
        Width = 150
        Height = 22
        Anchors = [akTop, akRight]
        Caption = '#00537^eReset to default'
        TabOrder = 4
        OnClick = Button10Click
      end
    end
    object tsDictionary: TTabSheet
      Tag = 7
      Caption = 'Dictionary'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        465
        452)
      object Label26: TLabel
        Left = 3
        Top = 411
        Width = 161
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '#00441^eNot used dictionary files'
        Visible = False
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 3
        Width = 441
        Height = 137
        Caption = '#00442^eSearch results order'
        TabOrder = 0
        object cbPreferUserWords: TCheckBox
          Left = 8
          Top = 16
          Width = 401
          Height = 17
          Caption = '#00443^ePrefer words in user dictionary'
          TabOrder = 0
        end
        object cbPreferNounsAndVerbs: TCheckBox
          Left = 8
          Top = 40
          Width = 401
          Height = 17
          Caption = '#00444^ePrefer nouns and verbs'
          TabOrder = 1
        end
        object cbPreferPolite: TCheckBox
          Left = 8
          Top = 64
          Width = 385
          Height = 17
          Caption = '#00445^ePrefer polite words'
          TabOrder = 2
        end
        object cbPreferPopular: TCheckBox
          Left = 8
          Top = 88
          Width = 377
          Height = 17
          Caption = '#00446^ePrefer popular words (marked by "pop")'
          TabOrder = 3
        end
        object cbOrderFreq: TCheckBox
          Left = 8
          Top = 112
          Width = 417
          Height = 17
          Caption = '#00921^eOrder by word frequency (where available)'
          TabOrder = 4
        end
      end
      object cbReplaceKanji: TCheckBox
        Left = 3
        Top = 147
        Width = 433
        Height = 17
        Caption = '#00447^eReplace kanji with kana for words marked "kana"'
        TabOrder = 1
      end
      object Edit19: TEdit
        Left = 3
        Top = 427
        Width = 441
        Height = 21
        Anchors = [akLeft, akRight, akBottom]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
        Text = 'Edit19'
        Visible = False
      end
      object cbDictLimitAutoResults: TCheckBox
        Left = 3
        Top = 171
        Width = 433
        Height = 17
        Caption = '#00448^eDisplay only results that fit one page in "Auto" mode'
        TabOrder = 3
      end
      object CheckBox50: TCheckBox
        Left = 3
        Top = 195
        Width = 433
        Height = 17
        Caption = '#00449^eAuto-switch to Examples panel'
        TabOrder = 4
      end
      object cbShowFreq: TCheckBox
        Left = 3
        Top = 219
        Width = 441
        Height = 17
        Caption = '#00922^eDisplay word count for each word'
        TabOrder = 5
      end
      object cbDictRefLinksInSubmenu: TCheckBox
        Left = 3
        Top = 250
        Width = 441
        Height = 17
        Hint = 
          '#01131^If checked, shows reference links in submenu rather than ' +
          'in main right-click menu'
        Caption = '#01130^Show reference links in submenu'
        TabOrder = 6
      end
    end
    object tsPopupTool: TTabSheet
      Tag = 8
      Caption = 'Popup tool'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label36: TLabel
        Left = 3
        Top = 75
        Width = 159
        Height = 13
        Caption = '#00539^ePopup delay (x100 ms):'
      end
      object Label37: TLabel
        Left = 3
        Top = 107
        Width = 164
        Height = 13
        Caption = '#00540^eText scan range (pixels):'
      end
      object Label38: TLabel
        Left = 146
        Top = 107
        Width = 67
        Height = 13
        Caption = '#00541^eLeft'
      end
      object Label39: TLabel
        Left = 307
        Top = 107
        Width = 74
        Height = 13
        Caption = '#00542^eRight'
      end
      object Label40: TLabel
        Left = 3
        Top = 139
        Width = 207
        Height = 13
        Caption = '#00543^eMax. number of dictionary entries:'
      end
      object Label43: TLabel
        Left = 3
        Top = 171
        Width = 173
        Height = 13
        Caption = '#00544^eCharacter card size factor:'
      end
      object Label44: TLabel
        Left = 3
        Top = 203
        Width = 455
        Height = 13
        Caption = 
          '#00545^eNumber of characters reserved for compounds on a card (a' +
          'ffects overall popup width):'
      end
      object Label45: TLabel
        Left = 99
        Top = 219
        Width = 93
        Height = 13
        Caption = '#00546^eMinimum:'
      end
      object Label46: TLabel
        Left = 259
        Top = 219
        Width = 96
        Height = 13
        Caption = '#00547^eMaximum:'
      end
      object cbScreenTipForJapanese: TCheckBox
        Left = 3
        Top = 3
        Width = 353
        Height = 17
        Caption = '#00548^eShow translation for japanese/chinese text'
        TabOrder = 0
      end
      object cbScreenTipForEnglish: TCheckBox
        Left = 3
        Top = 27
        Width = 353
        Height = 17
        Caption = '#00549^eShow translation for english text (only for screen)'
        TabOrder = 1
      end
      object cbScreenTipForKanji: TCheckBox
        Left = 3
        Top = 51
        Width = 361
        Height = 17
        Caption = '#00550^eShow character details'
        TabOrder = 2
      end
      object Edit21: TEdit
        Left = 155
        Top = 75
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'Edit21'
      end
      object Edit22: TEdit
        Left = 219
        Top = 107
        Width = 81
        Height = 21
        TabOrder = 4
        Text = 'Edit22'
      end
      object Edit23: TEdit
        Left = 371
        Top = 107
        Width = 81
        Height = 21
        TabOrder = 5
        Text = 'Edit23'
      end
      object edtScreenTipMaxDictEntries: TEdit
        Left = 219
        Top = 139
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object edtScreenTipSizeFactor: TEdit
        Left = 219
        Top = 171
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object edtScreenTipMinCompounds: TEdit
        Left = 187
        Top = 219
        Width = 65
        Height = 21
        TabOrder = 8
      end
      object edtScreenTipMaxCompounds: TEdit
        Left = 339
        Top = 219
        Width = 65
        Height = 21
        TabOrder = 9
      end
    end
    object tsWordListPrinting: TTabSheet
      Tag = 9
      Caption = 'Word list printing'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label11: TLabel
        Left = 3
        Top = 339
        Width = 202
        Height = 13
        Caption = '#00466^eNumber of lines on square page:'
      end
      object cbInsideLines: TCheckBox
        Left = 3
        Top = 291
        Width = 241
        Height = 17
        Caption = '#00467^ePrint horizontal lines'
        TabOrder = 0
      end
      object cbOutsideLines: TCheckBox
        Left = 211
        Top = 291
        Width = 241
        Height = 17
        Caption = '#00468^ePrint vertical lines'
        TabOrder = 1
      end
      object CheckBox16: TCheckBox
        Left = 3
        Top = 315
        Width = 241
        Height = 17
        Caption = '#00469^eVary colors'
        TabOrder = 2
      end
      object CheckBox17: TCheckBox
        Left = 211
        Top = 315
        Width = 313
        Height = 17
        Caption = '#00470^eDo not print unlearned kanji'
        TabOrder = 3
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 3
        Width = 433
        Height = 281
        Caption = '#00471^eColumns'
        TabOrder = 4
        object Label23: TLabel
          Left = 16
          Top = 248
          Width = 113
          Height = 13
          Caption = '#00472^eUser settings:'
        end
        object lbWordPrintFormat: TListBox
          Left = 16
          Top = 24
          Width = 401
          Height = 217
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 14
          Items.Strings = (
            '#00473^ePhonetic            |Meaning'
            '#00474^eWritten             |Meaning'
            '#00475^ePhonetic |Written   |Meaning'
            '#00476^eWritten  |Phonetic  |Meaning'
            '#00477^eRomaji   |Kana      |Meaning'
            '#00478^ePhonetic1           |Phonetic2'
            '#00479^eWritten1            |Written2'
            '#00480^eMeaning1            |Meaning2'
            '#00481^ePhonetic1|Phonetic2 |Phonetic3|Phonetic4'
            '#00482^eWritten1 |Written2  |Written3 |Written4'
            '#00483^eMeaning1 |Meaning2  |Meaning3 |Meaning4'
            '#00484^ePhonetic1|Written1  |Phonetic2|Written2'
            '#00485^ePhonetic1|Meaning1  |Phonetic2|Meaning2'
            '#00486^eWritten1 |Meaning1  |Written2 |Meaning2'
            '#00487^eUser settings')
          ParentFont = False
          TabOrder = 0
          OnClick = lbWordPrintFormatClick
        end
        object Edit16: TEdit
          Left = 144
          Top = 248
          Width = 273
          Height = 21
          TabOrder = 1
          Text = 'Edit16'
        end
      end
      object Edit10: TEdit
        Left = 3
        Top = 355
        Width = 161
        Height = 21
        TabOrder = 5
        Text = 'Edit10'
      end
    end
    object tsCharacterCardPrinting: TTabSheet
      Tag = 10
      Caption = 'Character cards printing'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label12: TLabel
        Left = 3
        Top = 0
        Width = 267
        Height = 13
        Caption = '#00489^eVertical number of characters on square page:'
      end
      object Label13: TLabel
        Left = 3
        Top = 48
        Width = 281
        Height = 13
        Caption = '#00952^eSpace for vocabulary compounds (in characters):'
      end
      object Label14: TLabel
        Left = 3
        Top = 96
        Width = 250
        Height = 13
        Caption = '#00953^eVertical number of vocabulary compounds:'
      end
      object Label15: TLabel
        Left = 3
        Top = 144
        Width = 124
        Height = 13
        Caption = '#00492^eCalligraphy font:'
      end
      object SpeedButton10: TSpeedButton
        Left = 131
        Top = 160
        Width = 73
        Height = 23
        Caption = '#00452^eChoose'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton10Click
      end
      object Label53: TLabel
        Left = 203
        Top = 96
        Width = 175
        Height = 13
        Caption = '#00951^eNumber of full compounds:'
      end
      object edtKanjiCardRowsOnPage: TEdit
        Left = 3
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edtKanjiCardAdditionalWidth: TEdit
        Left = 3
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtKanjiCardCharSize: TEdit
        Left = 3
        Top = 112
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object cbKanjiCardPrintCompounds: TCheckBox
        Left = 3
        Top = 192
        Width = 217
        Height = 17
        Caption = '#00493^ePrint vocabulary compounds'
        TabOrder = 3
      end
      object cbKanjiCardPrintRadical: TCheckBox
        Left = 227
        Top = 216
        Width = 209
        Height = 17
        Caption = '#00494^ePrint radical'
        TabOrder = 4
      end
      object cbKanjiCardPrintAlternate: TCheckBox
        Left = 227
        Top = 240
        Width = 225
        Height = 17
        Caption = '#00495^ePrint alternate form'
        TabOrder = 5
      end
      object cbKanjiCardPrintOuterLines: TCheckBox
        Left = 3
        Top = 264
        Width = 257
        Height = 17
        Caption = '#00496^ePrint outer lines'
        TabOrder = 6
      end
      object cbKanjiCardPrintReadings: TCheckBox
        Left = 3
        Top = 216
        Width = 209
        Height = 17
        Caption = '#00497^ePrint readings'
        TabOrder = 7
      end
      object cbKanjiCardPrintInnerLines: TCheckBox
        Left = 3
        Top = 288
        Width = 225
        Height = 17
        Caption = '#00498^ePrint inner lines'
        TabOrder = 8
      end
      object edtKanjiCardFont: TEdit
        Left = 3
        Top = 160
        Width = 129
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 9
        Text = 'MingLiU'
      end
      object cbKanjiCardPrintVertical: TCheckBox
        Left = 3
        Top = 312
        Width = 241
        Height = 17
        Caption = '#00499^ePrint vertically (right to left)'
        TabOrder = 10
      end
      object cbKanjiCardColumnSpace: TCheckBox
        Left = 3
        Top = 336
        Width = 241
        Height = 17
        Caption = '#00500^eLeave space between columns'
        TabOrder = 11
        Visible = False
      end
      object cbKanjiCardPrintDefinition: TCheckBox
        Left = 3
        Top = 240
        Width = 217
        Height = 17
        Caption = '#00501^ePrint definition'
        TabOrder = 12
      end
      object cbKanjiCardPrintStrokeCount: TCheckBox
        Left = 227
        Top = 264
        Width = 217
        Height = 17
        Caption = '#00502^ePrint stroke count'
        TabOrder = 13
      end
      object cbKanjiCardPrintStrokeOrder: TCheckBox
        Left = 227
        Top = 288
        Width = 225
        Height = 17
        Caption = '#00503^ePrint stroke order'
        TabOrder = 14
      end
      object cbKanjiCardPrintFullComp: TCheckBox
        Left = 227
        Top = 192
        Width = 217
        Height = 17
        Caption = '#00954^ePrint full compounds'
        TabOrder = 15
      end
      object cbKanjiCardSortFrequency: TCheckBox
        Left = 227
        Top = 312
        Width = 217
        Height = 17
        Caption = '#00956^eSort compounds by frequency'
        TabOrder = 16
      end
      object edtKanjiCardFullCompounds: TEdit
        Left = 203
        Top = 112
        Width = 121
        Height = 21
        TabOrder = 17
      end
    end
    object tsDatabaseMaintenance: TTabSheet
      Tag = 12
      Caption = 'Database maintenance'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        465
        452)
      object Button2: TButton
        Left = 3
        Top = 368
        Width = 451
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = '#00505^eCheck dictionary database indexes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = Button2Click
      end
      object Button1: TButton
        Left = 3
        Top = 0
        Width = 451
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = '#00506^eExport user database into delimited text file'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 3
        Top = 32
        Width = 451
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = '#00507^eImport user database from delimited text file'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 3
        Top = 80
        Width = 451
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = '#00508^eCheck user dictionary categories'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button11: TButton
        Left = 3
        Top = 128
        Width = 451
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = '#00509^eShow memory allocation stats'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Button11Click
      end
      object btnImportKanjidic: TButton
        Left = 3
        Top = 175
        Width = 451
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = '#01079^eImport character data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnImportKanjidicClick
      end
    end
    object tsEditor: TTabSheet
      Tag = 13
      Caption = 'Editor'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label48: TLabel
        Left = 3
        Top = 3
        Width = 95
        Height = 13
        Caption = '#01070^eEditor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 4
        Top = 183
        Width = 224
        Height = 13
        Caption = '#00510^eNumber of lines reserved to meaning:'
      end
      object Label54: TLabel
        Left = 3
        Top = 277
        Width = 88
        Height = 13
        Caption = '#00978^eMisc:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CheckBox43: TCheckBox
        Left = 3
        Top = 22
        Width = 433
        Height = 17
        Caption = '#00524^eBreak lines only at word boundaries'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbDisplayLines: TCheckBox
        Left = 3
        Top = 45
        Width = 401
        Height = 17
        Caption = '#00516^eDisplay lines'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cbNoMeaningLearned: TCheckBox
        Left = 3
        Top = 68
        Width = 353
        Height = 17
        Caption = '#00517^eDo not display meaning in learned words'
        TabOrder = 2
      end
      object cbNoReadingLearned: TCheckBox
        Left = 3
        Top = 91
        Width = 377
        Height = 17
        Caption = '#00519^eDo not display reading of learned kanji'
        TabOrder = 3
      end
      object cbReadingKatakana: TCheckBox
        Left = 3
        Top = 114
        Width = 393
        Height = 17
        Caption = '#00884^eDisplay transcript above kana'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object CheckBox41: TCheckBox
        Left = 3
        Top = 239
        Width = 401
        Height = 17
        Caption = '#00526^eDisplay non-japanese chars in grey'
        Checked = True
        State = cbChecked
        TabOrder = 5
        Visible = False
      end
      object cbSpaceBetweenLines: TCheckBox
        Left = 3
        Top = 137
        Width = 225
        Height = 17
        Caption = '#00523^eLeave space between lines'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object cbReserveSpaceForReading: TCheckBox
        Left = 236
        Top = 137
        Width = 217
        Height = 17
        Caption = '#00529^eLeave space even when reading is off'
        TabOrder = 7
      end
      object cbUserBold: TCheckBox
        Left = 3
        Top = 160
        Width = 401
        Height = 17
        Caption = '#00522^eDisplay words with user-defined translation in bold'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object edtMeaningLines: TEdit
        Left = 220
        Top = 183
        Width = 121
        Height = 21
        TabOrder = 9
        Text = '2'
      end
      object CheckBox27: TCheckBox
        Left = 348
        Top = 183
        Width = 97
        Height = 17
        Caption = '#00525^eDouble size'
        TabOrder = 10
      end
      object cbHintMeaning: TCheckBox
        Left = 211
        Top = 216
        Width = 225
        Height = 17
        Caption = '#00528^eDisplay meaning on hint'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object cbShowEditorHint: TCheckBox
        Left = 3
        Top = 216
        Width = 202
        Height = 17
        Caption = '#00527^eShow editor hint'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object cbAdjustCharPriorities: TCheckBox
        Left = 3
        Top = 296
        Width = 457
        Height = 17
        Caption = '#00979^eAdjust character priorities based on editor usage'
        TabOrder = 13
      end
      object rgReleaseCursorMode: TRadioGroup
        Left = 3
        Top = 319
        Width = 457
        Height = 66
        Caption = '#00982^eHow to behave in insert mode'
        Items.Strings = (
          '#00983^eDo not let the cursor out until you choose a suggestion'
          '#00984^eAuto-cancel insert if you move the cursor out')
        TabOrder = 14
      end
    end
    object tsEditorSaving: TTabSheet
      Tag = 14
      Caption = 'Editor: Saving and loading:'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblSavingAndLoading: TLabel
        Left = 3
        Top = 3
        Width = 171
        Height = 13
        Caption = '#00968^eSaving and loading:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbEditorAutosave: TCheckBox
        Left = 3
        Top = 22
        Width = 457
        Height = 17
        Caption = '#00969^eAuto-save file on exit'
        TabOrder = 0
      end
      object cbEditorAutoloadLast: TCheckBox
        Left = 3
        Top = 46
        Width = 457
        Height = 17
        Caption = '#00970^eAuto-load last opened file on start'
        TabOrder = 1
      end
      object cbNoSaveChangesWarning: TCheckBox
        Left = 3
        Top = 70
        Width = 457
        Height = 17
        Caption = 
          '#00971^eDo not ask to save changes on exit (WARNING: Use at your' +
          ' own risk)'
        TabOrder = 2
      end
    end
    object tsEditorPrinting: TTabSheet
      Tag = 15
      Caption = 'Editor: Printing'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label57: TLabel
        Left = 3
        Top = 3
        Width = 105
        Height = 13
        Caption = '#01069^ePrinting:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 3
        Top = 73
        Width = 202
        Height = 13
        Caption = '#00512^eNumber of lines on square page:'
      end
      object cbPrintReading: TCheckBox
        Left = 3
        Top = 22
        Width = 210
        Height = 17
        Caption = '#00272^eDisplay reading'
        TabOrder = 0
      end
      object cbPrintMeaning: TCheckBox
        Left = 219
        Top = 22
        Width = 209
        Height = 17
        Caption = '#00513^eDisplay meaning'
        TabOrder = 1
      end
      object cbVerticalPrint: TCheckBox
        Left = 219
        Top = 47
        Width = 276
        Height = 17
        Caption = '#00515^ePrint vertically in columns'
        TabOrder = 2
      end
      object cbNoPrintColors: TCheckBox
        Left = 3
        Top = 46
        Width = 210
        Height = 17
        Caption = '#00514^eDo not use colors'
        TabOrder = 3
      end
      object edtPrintLines: TEdit
        Left = 203
        Top = 70
        Width = 121
        Height = 21
        TabOrder = 4
        Text = '20'
      end
    end
    object tsTextTranslator: TTabSheet
      Tag = 16
      Caption = 'Editor: Text translator'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label58: TLabel
        Left = 3
        Top = 3
        Width = 144
        Height = 13
        Caption = '#01068^eText translator:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbNoSearchParticles: TCheckBox
        Left = 3
        Top = 22
        Width = 353
        Height = 17
        Caption = '#00518^eDo not search for particles'
        TabOrder = 0
      end
      object cbNoTranslateHiragana: TCheckBox
        Left = 3
        Top = 46
        Width = 377
        Height = 17
        Caption = '#00521^eDo not translate hiragana-only words'
        TabOrder = 1
      end
      object cbTranslateNoLongTextWarning: TCheckBox
        Left = 3
        Top = 69
        Width = 457
        Height = 17
        Hint = 
          '#01063^eDisable the "You are about to translate a large text blo' +
          'ck" warning'
        Caption = '#01062^eDo not warn when translating large text blocks'
        TabOrder = 2
      end
      object cbMultithreadedTranslation: TCheckBox
        Left = 3
        Top = 91
        Width = 457
        Height = 17
        Caption = '#01064^eMultithreaded translation'
        TabOrder = 3
      end
    end
    object tsEditorAozoraRuby: TTabSheet
      Tag = 17
      Caption = 'Editor: Aozora Ruby:'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblAozoraRuby: TLabel
        Left = 3
        Top = 3
        Width = 134
        Height = 13
        Caption = '#00972^eAozora Ruby:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAozoraTagsInColor: TLabel
        Left = 11
        Top = 68
        Width = 211
        Height = 13
        Caption = '#00975^eYou can set colors on Colors page'
      end
      object lblSaveAnnotationsToRubyDesc: TLabel
        Left = 11
        Top = 112
        Width = 352
        Height = 13
        Caption = 
          '#00977^eIf not, you'#39'll have the option of choosing that when you' +
          ' save file.'
      end
      object cbLoadAozoraRuby: TCheckBox
        Left = 3
        Top = 22
        Width = 457
        Height = 17
        Caption = '#00973^eShow Aozora-Ruby as annotations (requires text reload)'
        TabOrder = 0
      end
      object cbAozoraTagsInColor: TCheckBox
        Left = 3
        Top = 45
        Width = 457
        Height = 17
        Caption = '#00974^eShow Aozora-Ruby tags in color'
        TabOrder = 1
      end
      object cbSaveAnnotationsToRuby: TCheckBox
        Left = 3
        Top = 89
        Width = 457
        Height = 17
        Caption = '#00976^eSave annotations as Aozora-Ruby tags by default'
        TabOrder = 2
      end
    end
    object tsExprCopyFormats: TTabSheet
      Tag = 18
      Caption = 'Dictionary: Copy Formats'
      ImageIndex = 18
      TabVisible = False
      OnShow = tsExprCopyFormatsShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        465
        452)
      object Label18: TLabel
        Left = 3
        Top = 3
        Width = 276
        Height = 13
        Caption = '#01104^When you press Ctrl-C, copy dictionary entries as:'
      end
      object lblExprCopyFormatsEdit: TUrlLabel
        Left = 228
        Top = 33
        Width = 176
        Height = 13
        Cursor = crHandPoint
        Caption = '#01105^Edit available formats'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lblExprCopyFormatsDocs: TUrlLabel
        Left = 228
        Top = 52
        Width = 136
        Height = 13
        Cursor = crHandPoint
        Caption = '#01106^Documentation'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lbExprCopyFormats: TListBox
        Left = 3
        Top = 22
        Width = 211
        Height = 203
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbExprCopyFormatsClick
      end
      object mmExprCopyFormatExample: TMemo
        Left = 3
        Top = 240
        Width = 459
        Height = 209
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsKanjiCopyFormats: TTabSheet
      Tag = 20
      Caption = 'Character list: Copy Formats'
      ImageIndex = 20
      TabVisible = False
      OnShow = tsKanjiCopyFormatsShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        465
        452)
      object Label19: TLabel
        Left = 3
        Top = 3
        Width = 276
        Height = 13
        Caption = '#01104^When you press Ctrl-C, copy dictionary entries as:'
      end
      object lblKanjiCopyFormatsEdit: TUrlLabel
        Left = 228
        Top = 33
        Width = 173
        Height = 13
        Cursor = crHandPoint
        Caption = '#01105^Edit available formats'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lblKanjiCopyFormatsDocs: TUrlLabel
        Left = 228
        Top = 52
        Width = 136
        Height = 13
        Cursor = crHandPoint
        Caption = '#01106^Documentation'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lbKanjiCopyFormats: TListBox
        Left = 3
        Top = 22
        Width = 211
        Height = 203
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbKanjiCopyFormatsClick
      end
      object mmKanjiCopyFormatExample: TMemo
        Left = 3
        Top = 240
        Width = 459
        Height = 209
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 462
    Width = 660
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      660
      41)
    object btnChangeLanguage: TButton
      Left = 12
      Top = 12
      Width = 177
      Height = 21
      Anchors = [akLeft, akBottom]
      Caption = '#00929^eChange language'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnChangeLanguageClick
    end
    object btnOk: TBitBtn
      Left = 519
      Top = 8
      Width = 130
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'OK'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
  object tvContents: TTreeView
    Left = 0
    Top = 0
    Width = 177
    Height = 462
    Align = alLeft
    HideSelection = False
    Indent = 12
    ParentShowHint = False
    ReadOnly = True
    RowSelect = True
    ShowButtons = False
    ShowHint = True
    ShowLines = False
    TabOrder = 0
    OnChange = tvContentsChange
    OnCollapsing = tvContentsCollapsing
    Items.NodeData = {
      03070000003C000000000000000000000000000000FFFFFFFF00000000000000
      0002000000010F2300300030003300390038005E006500470065006E00650072
      0061006C0046000000000000000000000001000000FFFFFFFF00000000000000
      000000000001142300300030003400310032005E00650052006F006D0061006E
      0069007A006100740069006F006E003A000000000000000000000003000000FF
      FFFFFF000000000000000000000000010E2300300030003500350031005E0065
      0043006F006C006F00720073004A000000000000000000000005000000FFFFFF
      FF00000000000000000300000001162300300030003200390038005E00650043
      006800610072006100630074006500720020006C006900730074004E00000000
      0000000000000013000000FFFFFFFF0000000000000000000000000118230030
      0030003500330030005E00430068006100720061006300740065007200200064
      0065007400610069006C0073004A000000000000000000000006000000FFFFFF
      FF00000000000000000000000001162300300031003100320032005E00440069
      00730070006C00610079006500640020006900740065006D0073004600000000
      0000000000000014000000FFFFFFFF0000000000000000000000000114230030
      0031003100300031005E00650043006F0070007900200046006F0072006D0061
      007400730042000000000000000000000007000000FFFFFFFF00000000000000
      000100000001122300300030003200310037005E006500440069006300740069
      006F006E0061007200790046000000000000000000000012000000FFFFFFFF00
      000000000000000000000001142300300031003100300031005E00650043006F
      0070007900200046006F0072006D006100740073004200000000000000000000
      0008000000FFFFFFFF0000000000000000000000000112230030003000350033
      0038005E00650050006F00700075007000200074006F006F006C003A00000000
      000000000000000D000000FFFFFFFF000000000000000004000000010E230030
      0030003900360036005E00650045006400690074006F00720054000000000000
      00000000000E000000FFFFFFFF000000000000000000000000011B2300300031
      003000360036005E00650053006100760069006E006700200061006E00640020
      006C006F006100640069006E0067003A003E00000000000000000000000F0000
      00FFFFFFFF00000000000000000000000001102300300031003000360035005E
      0065005000720069006E00740069006E0067004C000000000000000000000010
      000000FFFFFFFF00000000000000000000000001172300300030003300300030
      005E006500540065007800740020007400720061006E0073006C00610074006F
      00720044000000000000000000000011000000FFFFFFFF000000000000000000
      00000001132300300031003000360037005E00650041006F007A006F00720061
      00200052007500620079003E0000000000000000000000FFFFFFFFFFFFFFFF00
      000000000000000200000001102300300031003000360031005E006500530074
      0075006400790069006E00670052000000000000000000000009000000FFFFFF
      FF000000000000000000000000011A2300300030003400360035005E00650057
      006F007200640020006C0069007300740020007000720069006E00740069006E
      0067005E00000000000000000000000A000000FFFFFFFF000000000000000000
      00000001202300300030003400380038005E0065004300680061007200610063
      0074006500720020006300610072006400730020007000720069006E00740069
      006E0067005600000000000000000000000C000000FFFFFFFF00000000000000
      0000000000011C2300300030003500300034005E006500440061007400610062
      0061007300650020006D00610069006E00740065006E0061006E0063006500}
  end
  object Spacer: TPanel
    Left = 177
    Top = 0
    Width = 10
    Height = 462
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '.wbk'
    Filter = 'WaKan User Data Backup|*.wbk'
    Options = [ofHideReadOnly, ofNoChangeDir, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 16
    Top = 408
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = '.wbk'
    Filter = 'WaKan User Data Bakup|*.wbk'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 80
    Top = 408
  end
  object ColorDialog1: TColorDialog
    Left = 148
    Top = 352
  end
end
