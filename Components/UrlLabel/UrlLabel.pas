unit UrlLabel;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TUrlLabel = class(TLabel)
  protected
    FURL: string;
    procedure Click; override;
  published
    property URL: string read FURL write FURL;
  end;

procedure Register;

implementation
uses ShellApi, Windows;

procedure TUrlLabel.Click;
begin
  if URL<>'' then
    ShellExecute(0, PChar('open'), PChar(URL), nil, nil, SW_SHOW);
end;

procedure Register;
begin
  RegisterComponents('Samples', [TUrlLabel]);
end;

end.
