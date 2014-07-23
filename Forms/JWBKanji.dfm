object fKanji: TfKanji
  Left = 591
  Top = 473
  BorderStyle = bsSizeToolWin
  Caption = '#00117^eCharacter list'
  ClientHeight = 406
  ClientWidth = 584
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnCreate = FormCreate
  OnHide = FormHide
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 172
    Top = 0
    Width = 412
    Height = 406
    Align = alClient
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    object splDockCompounds: TSplitter
      Left = 0
      Top = 404
      Width = 412
      Height = 2
      Cursor = crVSplit
      Align = alBottom
      AutoSnap = False
      Beveled = True
      Visible = False
      ExplicitLeft = 3
      ExplicitTop = 552
      ExplicitWidth = 535
    end
    object BlankPanel1: TBlankPanel
      Left = 0
      Top = 27
      Width = 412
      Height = 350
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextLeft = 8
      TextTop = 8
      Text = '#00118^eNo characters were found.'
    end
    object DrawGrid1: TDrawGrid
      AlignWithMargins = True
      Left = 3
      Top = 30
      Width = 406
      Height = 344
      Align = alClient
      BorderStyle = bsNone
      ColCount = 10
      DefaultColWidth = 59
      DefaultRowHeight = 59
      DefaultDrawing = False
      FixedCols = 0
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goThumbTracking]
      PopupMenu = PopupMenu
      ScrollBars = ssVertical
      TabOrder = 0
      OnClick = DrawGrid1Click
      OnDblClick = DrawGrid1DblClick
      OnDrawCell = DrawGrid1DrawCell
      OnKeyDown = DrawGrid1KeyDown
      OnKeyPress = DrawGrid1KeyPress
      OnKeyUp = DrawGrid1KeyUp
      OnMouseDown = DrawGrid1MouseDown
      OnMouseMove = DrawGrid1MouseMove
      OnMouseUp = DrawGrid1MouseUp
      OnSelectCell = DrawGrid1SelectCell
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 412
      Height = 21
      Margins.Left = 0
      Margins.Right = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        AlignWithMargins = True
        Left = 159
        Top = 0
        Width = 76
        Height = 21
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 6
        Margins.Bottom = 0
        Align = alRight
        Caption = '#00197^Sort by'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object rgSortBy: TComboBox
        AlignWithMargins = True
        Left = 241
        Top = 0
        Width = 168
        Height = 21
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alRight
        Style = csDropDownList
        ItemIndex = 4
        TabOrder = 0
        Text = 'Gakken Kanji'
        OnChange = SearchFilterChanged
        Items.Strings = (
          '#00146^eRadical'
          '#00147^eStroke count'
          '#00148^eFrequency'
          '#00198^eLearner index'
          'Gakken Kanji'
          'Remembering Kanji'
          '#00149^eRandom')
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 159
        Height = 21
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object cbInClipboard: TJwbCheckbox
          Left = 115
          Top = 0
          Width = 123
          Height = 21
          Margins.Top = 0
          Margins.Bottom = 0
          Action = aClipboard
          Align = alLeft
          Caption = '#00189^eIn clipboard'
          TabOrder = 0
        end
        object cbOnlyCommon: TJwbCheckbox
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 109
          Height = 21
          Margins.Top = 0
          Margins.Bottom = 0
          Action = aCommon
          Align = alLeft
          Caption = '#00187^eCommon'
          TabOrder = 1
        end
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 380
      Width = 406
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      object btnCompounds: TSpeedButton
        Left = 0
        Top = 0
        Width = 112
        Height = 21
        Hint = '#00125^eCompounds'
        Align = alLeft
        AllowAllUp = True
        GroupIndex = 5
        Caption = '#00125^eCompounds'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCompoundsClick
        ExplicitLeft = 137
      end
      object btnKanjiDetails: TSpeedButton
        Left = 277
        Top = 0
        Width = 129
        Height = 21
        Hint = '#00123^eDetails (Ctrl-D)'
        Align = alRight
        AllowAllUp = True
        GroupIndex = 4
        Caption = '#00124^eDetails'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnKanjiDetailsClick
        ExplicitLeft = 499
        ExplicitHeight = 17
      end
      object btnPrintCards: TButton
        Left = 148
        Top = 0
        Width = 129
        Height = 21
        Action = aPrint
        Align = alRight
        Caption = '#00128^ePrint cards'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = False
      end
    end
    object pnlDockCompounds: TPanel
      Left = 0
      Top = 404
      Width = 412
      Height = 0
      Align = alBottom
      BevelOuter = bvNone
      UseDockManager = False
      DockSite = True
      TabOrder = 4
    end
  end
  object pnlDockSearch: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 169
    Height = 406
    Margins.Left = 0
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alLeft
    BevelEdges = [beBottom]
    BevelOuter = bvNone
    UseDockManager = False
    DockSite = True
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object sbClearFilters: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 376
      Width = 163
      Height = 27
      Margins.Top = 5
      Action = aResetFilters
      Align = alBottom
      AllowAllUp = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 0
      ExplicitWidth = 219
    end
    object Panel7: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 163
      Height = 212
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        163
        212)
      object sbPinYin: TSpeedButton
        Left = 0
        Top = 0
        Width = 57
        Height = 22
        Hint = '#00175^eFilter by PinYin (chinese reading) (Ctrl-I)'
        AllowAllUp = True
        GroupIndex = 10
        Caption = '#00964^e&PinYin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbYomi: TSpeedButton
        Left = 0
        Top = 24
        Width = 57
        Height = 22
        Hint = '#00176^eFilter by japanese reading (Ctrl-Y)'
        AllowAllUp = True
        GroupIndex = 11
        Caption = '#00965^eYomi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbDefinition: TSpeedButton
        Left = 0
        Top = 48
        Width = 57
        Height = 22
        Hint = '#00179^eFilter by definition (meaning) (Ctrl-M)'
        AllowAllUp = True
        GroupIndex = 12
        Caption = '#00180^eDefinition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbStrokeCount: TSpeedButton
        Left = 0
        Top = 72
        Width = 57
        Height = 22
        Hint = 
          '#00190^eFilter by stroke count (you can search by range, ex. 1-6' +
          ')'
        AllowAllUp = True
        GroupIndex = 14
        Caption = '#00191^eStroke #'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbJouyou: TSpeedButton
        Left = 0
        Top = 143
        Width = 57
        Height = 22
        Hint = '#00194^eFilter by Jouyou grade (Japanese school grade)'
        AllowAllUp = True
        GroupIndex = 18
        Caption = '#00963^eJouyou'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbListRadicals: TSpeedButton
        Left = 100
        Top = 96
        Width = 63
        Height = 22
        Hint = '#00177^eFilter by radical (Ctrl-R)'
        AllowAllUp = True
        Anchors = [akTop, akRight]
        Caption = '#00195^eList...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 116
      end
      object sbOther: TSpeedButton
        Left = 0
        Top = 167
        Width = 57
        Height = 22
        Hint = '#00192^eFilter by Unicode / Nelson index / Halpern index'
        AllowAllUp = True
        GroupIndex = 13
        Caption = '#00193^eOther'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbRadicals: TSpeedButton
        Left = 0
        Top = 95
        Width = 57
        Height = 22
        Hint = '#00177^eFilter by radical (Ctrl-R)'
        AllowAllUp = True
        GroupIndex = 15
        Caption = '#00178^eRadical'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbSKIP: TSpeedButton
        Left = 0
        Top = 119
        Width = 57
        Height = 22
        Hint = '#00181^eFilter by SKIP code (see KANJIDIC for explanation)'
        AllowAllUp = True
        GroupIndex = 16
        Caption = '#00962^eSKIP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edtPinYin: TEdit
        Left = 56
        Top = 0
        Width = 107
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edtYomi: TEdit
        Left = 56
        Top = 24
        Width = 107
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edtDefinition: TEdit
        Left = 56
        Top = 48
        Width = 107
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object cbOtherType: TComboBox
        Left = 56
        Top = 191
        Width = 107
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object edtOther: TEdit
        Left = 56
        Top = 169
        Width = 107
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object edtSkip: TEdit
        Left = 56
        Top = 120
        Width = 107
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
      object pbRadicals: TWakanPaintbox
        Left = 57
        Top = 96
        Width = 43
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DoubleBuffered = True
        OnPaint = pbRadicalsPaint
      end
      object edtStrokeCount: TRangeSpinEdit
        Left = 56
        Top = 73
        Width = 107
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        MaxValue = 100
        MinValue = 0
        TabOrder = 7
        LowValue = 0
        HighValue = 0
      end
      object edtJouyou: TRangeSpinEdit
        Left = 56
        Top = 143
        Width = 107
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        MaxValue = 100
        MinValue = 0
        TabOrder = 8
        LowValue = 0
        HighValue = 0
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 225
      Width = 169
      Height = 141
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 257
      ExplicitHeight = 109
      object lbCategories: TCheckListBox
        AlignWithMargins = True
        Left = 3
        Top = 28
        Width = 163
        Height = 113
        Margins.Bottom = 0
        OnClickCheck = lbCategoriesClickCheck
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        PopupMenu = pmCategories
        TabOrder = 0
        OnClick = lbCategoriesClick
        OnDblClick = lbCategoriesDblClick
        OnDrawItem = lbCategoriesDrawItem
        ExplicitHeight = 81
      end
      object cbOrAnd: TComboBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 163
        Height = 21
        Align = alTop
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 1
        Text = 'In all of:'
        Items.Strings = (
          'In any of:'
          'In all of:'
          'Not in any of:')
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Text file (*.txt)|*.txt'
    Left = 264
    Top = 48
  end
  object UpdateTimer: TTimer
    Enabled = False
    OnTimer = UpdateTimerTimer
    Left = 342
    Top = 48
  end
  object Actions: TActionList
    Left = 264
    Top = 104
    object aSearch: TCheckAction
      AutoCheck = True
      Caption = '#00230^e&Search'
      OnExecute = aSearchExecute
      OnChecked = aSearchChecked
    end
    object aResetFilters: TAction
      Caption = '#00278^eDisplay all'
      Hint = '#00182^eDisplay all characters (Ctrl-N)'
      ShortCut = 16469
      OnExecute = aResetFiltersExecute
    end
    object aClipboard: TAction
      AutoCheck = True
      Caption = '#00281^eIn clipboard only'
      Hint = '#00188^eDisplay only characters in clipboard'
      OnExecute = SearchFilterChanged
    end
    object aCommon: TAction
      AutoCheck = True
      Caption = '#00280^eCommon only'
      Hint = '#00186^eDisplay only common characters'
      OnExecute = SearchFilterChanged
    end
    object aPinYin: TAction
      Caption = '#00282^eSearch by PinYin'
      ShortCut = 16457
      OnExecute = aPinYinExecute
    end
    object aYomi: TAction
      Caption = '#00283^eSearch by Yomi'
      ShortCut = 16473
      OnExecute = aYomiExecute
    end
    object aRadical: TAction
      Caption = '#00284^eSearch by radical...'
      ShortCut = 16466
      OnExecute = aRadicalExecute
    end
    object aMeaning: TAction
      Caption = '#00295^eSearch by meaning'
      ShortCut = 16461
      OnExecute = aMeaningExecute
    end
    object aPrint: TAction
      Caption = '#00234^e&Print cards...'
      Hint = '#00127^ePrint Kanji cards (for memorizing) (Ctrl-F6)'
      ShortCut = 16501
      OnExecute = aPrintExecute
    end
    object aSaveToFile: TAction
      Caption = '#00944^eSave characters to file...'
      OnExecute = aSaveToFileExecute
    end
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 344
    Top = 112
    object miCopyAs: TMenuItem
      Caption = '#01102^Copy As'
      object N1: TMenuItem
      end
    end
  end
  object ilCategoryActions: TImageList
    Left = 88
    Top = 288
    Bitmap = {
      494C010104000800C40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00007F7F7F007F7F7F007F7F7F0000FFFF0000FFFF007F7F7F007F7F7F007F7F
      7F007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000FF000000
      FF0000000000000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F00000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000007F7F7F00000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF0000000000000000000000FF00000000000000
      FF000000FF000000FF007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F00000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000FFFF0000FFFF000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF000000000000FF
      FF000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F0000000000000000000000
      FF000000FF000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7EFC00FC00FFFF9001F000FC00F83F
      C003C0002000E00FE00300000000CC47E003000000008463E00300000000A073
      E0030000000031F900010000000038F98000000000003C79E007000000003C39
      E00F0001E0003C19E00F0003F8009C0BE0270007F0008C43C073001FE001C467
      9E79007FC403E00F7EFE01FFEC07F83F00000000000000000000000000000000
      000000000000}
  end
  object pmCategories: TPopupMenu
    Images = ilCategoryActions
    Left = 32
    Top = 288
    object miAddCategory: TMenuItem
      Caption = '#00881^eAdd category'
      ImageIndex = 0
      OnClick = miAddCategoryClick
    end
    object miUncheckAllCategories: TMenuItem
      Caption = '#00880^eUncheck all categories'
      ImageIndex = 1
      OnClick = miUncheckAllCategoriesClick
    end
    object miEditCategory: TMenuItem
      Caption = '#00030^eEdit category'
      ImageIndex = 2
      OnClick = miEditCategoryClick
    end
    object miDeleteCategory: TMenuItem
      Caption = '#00031^eDelete category'
      ImageIndex = 3
      OnClick = miDeleteCategoryClick
    end
  end
end
