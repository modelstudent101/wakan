unit JWBDictCoding;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfDictCoding = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    succeeded:boolean;
    { Public declarations }
  end;

var
  fDictCoding: TfDictCoding;

implementation

uses JWBMenu;

{$R *.DFM}

procedure TfDictCoding.BitBtn1Click(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex>0) and (not FileExists('UniConv.exe')) then
  begin
    Application.MessageBox(pchar(_l('#00070^eUNICONV.EXE was not found. It is required for encoding conversion.^cSoubor UNICONV.EXE nebyl nalezen. Je vy�adov�n pro konverzi k�dov�n�.')),pchar(_l('#00020^eError^cChyba')),MB_ICONERROR or MB_OK);
    exit;
  end;
  succeeded:=true;
  close;
end;

procedure TfDictCoding.BitBtn2Click(Sender: TObject);
begin
  succeeded:=false;
  close;
end;

end.