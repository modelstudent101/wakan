object fKanji: TfKanji
  Left = 591
  Top = 473
  BorderStyle = bsSizeToolWin
  Caption = '#00117^eCharacter list'
  ClientHeight = 348
  ClientWidth = 630
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnHide = FormHide
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splDockCompounds: TSplitter
    Left = 0
    Top = 345
    Width = 630
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    Visible = False
    ExplicitTop = 330
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 345
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    FullRepaint = False
    TabOrder = 0
    DesignSize = (
      630
      345)
    object RxLabel15: TLabel
      Left = 8
      Top = 8
      Width = 75
      Height = 16
      Caption = 'RxLabel15'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSearchSort: TSpeedButton
      Left = 8
      Top = 320
      Width = 113
      Height = 17
      Hint = '#00119^eSearch & change sort order'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 2
      Caption = '#00120^eSearch && sort'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSearchSortClick
      ExplicitTop = 321
    end
    object btnKanjiDetails: TSpeedButton
      Left = 559
      Top = 320
      Width = 65
      Height = 17
      Hint = '#00123^eDetails (Ctrl-D)'
      AllowAllUp = True
      Anchors = [akRight, akBottom]
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
      ExplicitTop = 321
    end
    object btnCompounds: TSpeedButton
      Left = 128
      Top = 320
      Width = 81
      Height = 17
      Hint = '#00125^eCompounds'
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
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
      ExplicitTop = 321
    end
    object BlankPanel1: TBlankPanel
      Left = 7
      Top = 32
      Width = 618
      Height = 281
      Anchors = [akLeft, akTop, akRight, akBottom]
      TextLeft = 8
      TextTop = 8
      Text = '#00118^eNo characters were found.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
    end
    object DrawGrid1: TDrawGrid
      Left = 8
      Top = 33
      Width = 616
      Height = 279
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      ColCount = 10
      DefaultColWidth = 59
      DefaultRowHeight = 59
      DefaultDrawing = False
      FixedCols = 0
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goThumbTracking]
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
    object btnPrintCards: TButton
      Left = 495
      Top = 4
      Width = 128
      Height = 21
      Hint = '#00127^ePrint Kanji cards (for memorizing) (Ctrl-F6)'
      Anchors = [akTop, akRight]
      Caption = '#00128^ePrint cards'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = btnPrintCardsClick
    end
  end
  object pnlDockCompounds: TPanel
    Left = 0
    Top = 348
    Width = 630
    Height = 0
    Align = alBottom
    BevelOuter = bvNone
    UseDockManager = False
    DockSite = True
    TabOrder = 1
  end
  object pnlDockSearch: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 0
    Align = alTop
    BevelOuter = bvNone
    UseDockManager = False
    DockSite = True
    TabOrder = 2
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Text file (*.txt)|*.txt'
    Left = 152
    Top = 40
  end
  object UpdateTimer: TTimer
    Enabled = False
    OnTimer = UpdateTimerTimer
    Left = 222
    Top = 40
  end
end
