unit SimpleControls;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, Messages;

type
 { Adds Autosize like in TLabel }
  TJwbCheckbox = class(TCheckBox)
  protected
    FAutoSize: Boolean;
    procedure AdjustBounds; dynamic;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure SetAutoSize(Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
  end;

 { Label which opens URL when clicked; blue and hand-pointed by default }
  TUrlLabel = class(TLabel)
  protected
    FURL: string;
    procedure Click; override;
    procedure CMParentFontChanged(var Message: TCMParentFontChanged);
      message CM_PARENTFONTCHANGED;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property URL: string read FURL write FURL;
  end;


procedure Register;

implementation
uses Graphics, Windows,
{$IFDEF MSWINDOWS}
  ShellAPI
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
  Posix.Stdlib
{$ENDIF POSIX};

procedure Register;
begin
  RegisterComponents('Wakan', [TJwbCheckbox]);
  RegisterComponents('Wakan', [TUrlLabel]);
end;


{ JwbCheckbox }

constructor TJwbCheckbox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAutoSize := True;
end;

//See TCustomLabel.SetAutoSize
procedure TJwbCheckbox.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    AdjustBounds;
  end;
end;

procedure TJwbCheckbox.CMTextChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
  AdjustBounds;
end;

//See TCustomLabel.AdjustBounds
procedure TJwbCheckbox.AdjustBounds;
const
  WordWraps: array[Boolean] of Word = (0, DT_WORDBREAK);
var
  X, W: Integer;
  Canvas: TControlCanvas;
begin
  if not (csReading in ComponentState) and FAutoSize then
  begin
    X := Left;
    Canvas := TControlCanvas.Create;
    try
      Canvas.Control := Self;
      Canvas.Font := Self.Font;
      W := GetSystemMetrics(SM_CXMENUCHECK) + 4 + Canvas.TextWidth(Self.Caption);
      SetBounds(X, Top, W, Height);
    finally
      FreeAndNil(Canvas);
    end;
  end;
end;


{ URL label }

constructor TUrlLabel.Create(AOwner: TComponent);
begin
  inherited;
  Self.Cursor := crHandPoint;
  Self.Font.Style := Self.Font.Style + [fsBold, fsUnderline];
  Self.Font.Color := clHighlight;
end;

procedure TUrlLabel.CMParentFontChanged(var Message: TCMParentFontChanged);
var ChangeEvent: TNotifyEvent;
begin
  inherited; //copies font from parent; sets FParentFont := true;
  if Self.ParentFont then begin
   //Auto-upgrade font but try not to break FParentFont==true
    ChangeEvent := Self.Font.OnChange;
    Self.Font.OnChange := nil;
    try
      Self.Font.Style := Self.Font.Style + [fsBold, fsUnderline];
      Self.Font.Color := clHighlight;
    finally
      Self.Font.OnChange := ChangeEvent;
    end;
  end;
end;

procedure ShellOpen(const sCommand: string; const sParams: string = '');
begin
{$IFDEF MSWINDOWS}
  ShellExecute(0, 'open', PChar(sCommand), PChar(sParams), '', SW_SHOW);
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
  if sParams<>'' then
    _system(PAnsiChar('open ' + AnsiString(sCommand)+' '+AnsiString(sParams)))
  else
    _system(PAnsiChar('open ' + AnsiString(sCommand)));
{$ENDIF POSIX}
end;

procedure TUrlLabel.Click;
begin
  if URL<>'' then
    ShellOpen(URL);
  inherited;
end;


end.
