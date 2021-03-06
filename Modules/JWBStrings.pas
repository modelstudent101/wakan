﻿unit JWBStrings;
{ Wakan string types and routines + some other basic stuff (JWBBasicTypes if you wish).
 This one is lower level unit, do not make any circular references (this kills inlining)
 or put stuff here which requires those references.
 Use JWBUnit for that. }

interface
uses SysUtils, Classes, Windows;

{$IF NOT Defined(IntPtr)}
type
 {$IF Defined(WIN64)}
  IntPtr = int64;
 {$ELSEIF Defined(WIN32)}
  IntPtr = integer;
 {$ELSE}
  {$MESSAGE Error 'Cannot declare IntPtr for this target platform'}
 {$IFEND}
{$IFEND}

{$IF CompilerVersion < 21}
type
{ For cases when we need a HARD unicode string ("unicode on any versions"):
  On older compilers we don't have a new, faster UnicodeString,
  but we can safely use a slower WideString in its stead. }
  UnicodeString = WideString;
  PUnicodeString = PWideString;
{$IFEND}

{ One day we're going to enable typechecks so that you can't mix strings and FStrings
 without proper conversion }
//{$DEFINE STRICT_FSTRING}

{ Wakan uses a special Ansi string format, where each unicode symbol is kept
 as a 4 character (four-char) hex code.
 On Unicode it's replaced with normal unicode string.
 Please use a special set of functions defined further below when working with
 such strings. }
type
 {$IFDEF UNICODE}
 //Wired to WideChar and not Char because who knows,
 //we might want to compile on Ansi with UNICODE set!
  FChar = WideChar;
  PFChar = {$IFDEF STRICT_FSTRING}type{$ENDIF} PWideChar;
  FString = {$IFDEF STRICT_FSTRING}type{$ENDIF} UnicodeString;
 {$ELSE}
  FChar = AnsiString; //because one 4-character takes 4 AnsiChars
  PFChar = {$IFDEF STRICT_FSTRING}type{$ENDIF} PAnsiChar;
  FString = {$IFDEF STRICT_FSTRING}type{$ENDIF} AnsiString;
  //Useful for looking into FChars
  FCharData = array[1..4] of AnsiChar;
  PFCharData = ^FCharData;
 {$ENDIF}

  PFString = ^FString;

 { Hex FChars on both Ansi and Unicode. Used to read/write data from formats which store it as hex }
  FHex = {$IFDEF STRICT_FSTRING}type{$ENDIF} string;


const
 { Some character constants used throught the program
  Names MUST be descriptive. If you name something 'UH_SPACE' it means it FUNCTIONS as space,
  not just looks like one. }
 {$IFNDEF UNICODE}
  UH_NOCHAR:FChar = ''; //for initializing stuff with it
  UH_ZERO:FChar = '0000'; //when you need zero char
  UH_LF: FChar = '000A'; //linefeed
  UH_CR: FChar = '000D'; //carriage return
  UH_SPACE:FChar = '0020';
  UH_HYPHEN:FChar = '002D'; //-
  UH_LOWLINE:FChar = '005F'; //_
  UH_ELLIPSIS:FChar = '2026'; //
  UH_IDG_SPACE:FChar = '3000'; //Ideographic space (full-width)
  UH_IDG_COMMA:FChar = '3001';

  UH_AORUBY_TEXTBREAK:FChar = 'FF5C';
  UH_AORUBY_OPEN:FChar = '300A';
  UH_AORUBY_CLOSE:FChar = '300B';
  UH_AORUBY_COMM_OPEN:FChar = 'FF3B';
  UH_AORUBY_COMM_CLOSE:FChar = 'FF3D';
  UH_AORUBY_TAG_OPEN:FChar = '003C';
  UH_AORUBY_TAG_CLOSE:FChar = '003E';

  UH_RUBY_PLACEHOLDER:FChar = 'E100'; //when ruby has nothing to be attached to,
    //but we still have to store it in the decoded form

 {$ELSE}
  UH_NOCHAR:FChar = #$0000;
  UH_ZERO:FChar = #$0000;
  UH_LF: FChar = #$000A;
  UH_CR: FChar = #$000D;
  UH_SPACE:FChar = #$0020;
  UH_HYPHEN:FChar = '-';
  UH_LOWLINE:FChar = '_';
  UH_ELLIPSIS:FChar = #$2026;
  UH_IDG_SPACE:FChar = #$3000;
  UH_IDG_COMMA:FChar = #$3001;

  UH_AORUBY_TEXTBREAK:FChar = '｜';
  UH_AORUBY_OPEN:FChar = '《';
  UH_AORUBY_CLOSE:FChar = '》';
  UH_AORUBY_COMM_OPEN:FChar = '［';
  UH_AORUBY_COMM_CLOSE:FChar = '］';
  UH_AORUBY_TAG_OPEN:FChar = '<';
  UH_AORUBY_TAG_CLOSE:FChar = '>';

  UH_RUBY_PLACEHOLDER:FChar = #$E100;
 {$ENDIF}


{ Files }

function GetModuleFilenameStr(hModule: HMODULE = 0): string;
function GetFileVersionInfoStr(Filename: string): string;
function GetTempPathStr: string;
function CreateGuidStr: string;
function CreateRandomTempDirName: string;
function CreateRandomTempDir: string;
procedure DeleteDirectory(dir:string);
function AppFolder: string;
function GetSpecialFolderPath(folderId: integer): string;
function ForceDirectories2(Dir: string): Boolean;


{ FChar string functions.
Please use these when working with FChars! They resolve to proper manipulations,
whether we are working with UnicodeStrings or 4-character hex AnsiStrings.
If you need a general purpose string function which works differently
on Ansi and Unicode builds, add it here.

In particular:
  (length(s) div 4)-1   --> flength(s)-1
  copy(s,i*4-3,4)       --> fgetch(s,i)            but note that fgetch requires the symbol to exist, copy doesn't
  copy(s,i*4+1,4)       --> fgetch(s,i+1)
  copy(s,i*4+5,4)       --> fgetch(s,i+2)
  copy(s,i*4+1,len*4)   --> fcopy(s,i+1,len)
  delete(s,i*4+1,len*4) --> fdelete(s,i+1,len)
  HexToUnicode(unistr)  --> fstr(unistr)           when converting to FStrings

As a rule, any "length()" inside of "fcopy()" MUST be "flength()".

When working with normal strings, or when accessing control characters in FStrings,
please continue to use normal functions:
  var sample: FString;
  if (Length(sample)>0) and (sample[1]='~')  --- keep intact!

It is very important that in release builds these functions are all inlined.
Therefore if you're doing the building, READ THIS:
  http://docwiki.embarcadero.com/RADStudio/XE/en/Calling_Procedures_and_Functions#Using_the_inline_Directive
Note the list of cases when the inlining is not done.
Enable inlining.
Disable Compiling> String format checking in Delphi Project Options:
  http://www.micro-isv.asia/2008/10/needless-string-checks-with-ensureunicodestring/
}

function flength(const s:FString): integer; inline;
function flenfc(lenn:integer): integer; inline;
function flenn(lenfc:integer): integer; inline;
function fcopy(const s: FString; Index, Count: Integer):FString; inline;
procedure fdelete(var s: FString; Index, Count: Integer); inline;
function fpos(const substr: FString; const str:FString):integer; inline;
function fgetch(const s: FString; Index: integer): FChar; inline;
function fgetchl(const s: FString; Index: integer): FChar; inline;
procedure fputch(var s: FString; Index: integer; const ch: FChar); inline;
function fstr(const s: AnsiString): FString; overload; inline;
function fstr(const s: UnicodeString): FString; overload; inline;
function fstrtouni(const s: FString): UnicodeString; inline;
function hextofstr(const s: FHex): FString; inline;
function fstrtohex(const s: FString): FHex; inline;
function autohextofstr(const text: string): FString;

{$IFNDEF UNICODE}
function FcharCmp(a, b: PFChar; cnt: integer): boolean; inline;
{$ENDIF}
function EatOneFChar(var pc: PAnsiChar): boolean; inline;
function EatOneFCharW(var pc: PWideChar): boolean; inline;

function fch(const c: AnsiChar): FChar; overload; inline;
function fch(const c: WideChar): FChar; overload; inline;
function ftoansi(c: FChar; out ac: AnsiChar): boolean; overload;
function ftoansi(c: FChar): AnsiChar; overload;
function ftowide(c: FChar): WideChar; inline;

{
Unicode versions of some function which are unavailable/inefficient on Ansi builds.
On Unicode builds all resolve to default Unicode equivalents.
}
function upos(const substr, str: UnicodeString):integer; {$IFDEF UNICODE}inline;{$ENDIF}
function UTrim(const S: UnicodeString): UnicodeString; {$IFDEF UNICODE}inline;{$ENDIF} overload;
function UTrimLeft(const S: UnicodeString): UnicodeString; {$IFDEF UNICODE}inline;{$ENDIF} overload;
function UTrimRight(const S: UnicodeString): UnicodeString; {$IFDEF UNICODE}inline;{$ENDIF} overload;
function ULowerCase(const S: UnicodeString): UnicodeString; {$IFDEF UNICODE}inline;{$ENDIF}
function UUpperCase(const S: UnicodeString): UnicodeString; {$IFDEF UNICODE}inline;{$ENDIF}
function UCharPos(const Ch: WideChar; const Str: UnicodeString): integer; inline;
function UTrim(const S: UnicodeString; const Chars: UnicodeString): UnicodeString; overload;
function UTrimLeft(const S: UnicodeString; const Chars: UnicodeString): UnicodeString; overload;
function UTrimRight(const S: UnicodeString; const Chars: UnicodeString): UnicodeString; overload;

{ Delphi implementations are slow, so we roll out our own. Binary comparisons. }
function SameStr(const substr, str: string): boolean; overload; inline;
function SameStr(substr, str: PChar): boolean; overload;
function StartsStr(const substr, str: string): boolean; overload; inline;
function StartsStr(substr, str: PChar): boolean; overload;
function EndsStr(const substr, str: string): boolean; overload;
function EndsStr(substr, str: PChar): boolean; overload;

{ General purpose string functions }

function IsHexChar(wc: WideChar): boolean;
function HexCharCode(c:AnsiChar): byte; inline;
function HexCharCodeW(c:WideChar): byte; inline;
function HexToUnicode(ps:PAnsiChar; maxlen: integer): UnicodeString; overload;
function HexToUnicodeW(ps:PWideChar; maxlen: integer): UnicodeString; overload;
function HexToUnicode(const s:string):UnicodeString; overload;
function BytesToHex(pb:PByte;sz:integer):string;
function UnicodeToHex(pc:PWideChar; len: integer):string; overload;
function UnicodeToHex(const s:UnicodeString):string; overload;
function AnsiToHex(const s:AnsiString):string; inline;
function UnicodeToML(s:widestring):string;

function Utf16ToUnicodeIndex(const c: WideChar): integer; inline;

type
  TStringArray = array of string;

procedure SplitAdd(sl:TStringList;s:string;cnt:integer);
function SplitStr(s: string; cnt: integer; ch: char=','): TStringArray; overload;
function SplitStr(s: string; ch: char=','): TStringArray; overload;
function SplitStr(s: string; sep: string): TStringArray; overload;
function split(s: string; sep: string): TStringArray; overload;
function JoinStr(const AParts: TStringArray; const ASep: string = ', '): string; inline;
function join(const a: TStringArray; const sep: string): string;
procedure Append(var ATo: TStringArray; const AFrom: TStringArray);

procedure StrListAdd(sl: TStringList; sa: TStringArray);

function countc(const s:string;const c:char): integer;

function repl(const s: string; const sub, repl: string): string; overload;
function strqpop(var s:string;c:char):string; overload;
function strqpop(var s:string;const cs:string):string; overload;
function ustrqpop(var s:UnicodeString;c:WideChar):UnicodeString; overload;
function spancopy(ps, pe: PChar): string;

procedure MakeFixedLen(var s: AnsiString; len: integer; pad_ch: AnsiChar); overload; inline;
procedure MakeFixedLen(var s: UnicodeString; len: integer; pad_ch: WideChar); overload; inline;


{ Filename list }

type
  TFilenameList = array of string;
  TFileList = TFilenameList;

procedure AddFilename(var list: TFilenameList; const filename: string);
function MakeFilenameList(const filenames: array of string): TFilenameList;
function IsFileInList(const filename: string; const list: TFilenameList): boolean;
function FilenameListToString(const list: TFilenameList; const sep: string = ', '): string;


{ Character processing }

type //Character types for EvalChar
  TEvalCharType = (
    EC_UNKNOWN          = 0, // unrecognized
    EC_IDG_CHAR         = 1, // ideographic char
    EC_HIRAGANA         = 2, // hiragana
    EC_KATAKANA         = 3, // katakana
    EC_IDG_PUNCTUATION  = 4, // ideographic punctuation
    EC_IDG_OTHER        = 5, // ideographic other
    EC_LATIN_FW         = 6, // full-width latin
    EC_LATIN_HW         = 7, // half-width latin
    EC_KATAKANA_HW      = 8, // half-width katakana
    EC_BOPOMOFO         = 9  // bopomofo
  );
  TEvalCharTypes = set of TEvalCharType;

function EvalChar(char: WideChar): TEvalCharType; overload; inline;
{$IFDEF UNICODE}
function EvalChar(const char: FString): TEvalCharType; overload; inline;
{$ELSE}
function EvalChar(const char: FString): TEvalCharType; overload;
{$ENDIF}

//Returns a set of (1 shl EC_*) flags indicating some chars are present in string
function EvalChars(const chars: FString): TEvalCharTypes;
function TestCharsAre(const chars: FString; ec: TEvalCharTypes): boolean; inline;

function IsUpcaseLatin(ch: AnsiChar): boolean; overload; inline;
function IsUpcaseLatin(ch: WideChar): boolean; overload; inline;
function IsLocaseLatin(ch: AnsiChar): boolean; overload; inline;
function IsLocaseLatin(ch: WideChar): boolean; overload; inline;
function LoCase(ch: AnsiChar): AnsiChar; overload; inline; //Delphi has UpCase but not LoCase for chars
function LoCase(ch: WideChar): WideChar; overload; inline;
function IsDigit(ch: AnsiChar): boolean; overload; inline;
function IsDigit(ch: WideChar): boolean; overload; inline;

//Shit sucks. We have to have a ton of versions!
function IsLatinLetter(c:char): boolean; inline;
function IsLatinLetterW(c:WideChar): boolean; inline;
function IsLatinLetterF(c:FChar): boolean; inline;
function IsHalfWidthChar(c:FChar): boolean;
function IsLatinDigit(c:char):boolean;
function IsLatinDigitF(c:FChar):boolean;

function IsKanaCharKatakana(c:FString; i:integer): boolean;
function IsSokuon(const c: FChar): boolean; inline;
function IsSmallKanaVowel(const c: FChar): boolean; inline;

function AsciiToFullwidth(const c: char): char; overload;
function AsciiToFullwidth(const s: string): string; overload;
function AsciiToHalfwidth(const c: char): char; overload;
function AsciiToHalfwidth(const s: string): string; overload;

type
  TUrlEncodeOption = (
    ueNoSpacePlus //Encode space as %20, not "+"
  );
  TUrlEncodeOptions = set of TUrlEncodeOption;

function UrlEncode(const s: UnicodeString; options: TUrlEncodeOptions): AnsiString; overload;
function UrlEncode(const s: UTF8String; options: TUrlEncodeOptions): AnsiString; overload;
function HtmlEscape(const s: string): string;

function ExtractFileNameURL(const URL: string): string;

implementation
uses WideStrUtils, ShlObj;


{ Files }

(*
  Returns full image address for specified module
  If hModule is zero, returns full executable image address
*)
function GetModuleFilenameStr(hModule: HMODULE = 0): string;
const MAX_PATH_LEN = 8192; //Max length, in symbols, of supported image path size.
var nSize, nRes: dword;
begin
 (*
   MSDN:
    If the length of the path is less than nSize characters, the function succeeds
    and the path is returned as a null-terminated string.

    If the length of the path exceeds nSize, the function succeeds and the string
    is truncated to nSize characters including the terminating null character.

    Windows XP/2000: The string is truncated to nSize characters and is not null terminated.
 *)

  nSize := 256;
  SetLength(Result, nSize);

  nRes := GetModuleFilename(hModule, @Result[1], nSize);
  while (nRes <> 0) and (nRes >= nSize) and (nSize < MAX_PATH_LEN) do begin
    nSize := nSize * 2;
    SetLength(Result, nSize+1);
    nRes := GetModuleFilename(hModule, @Result[1], nSize);
  end;

  if nRes = 0 then begin
    Result := ''; //cannot retrieve path, return null
    exit;
  end;

  if nRes >= nSize then begin
    Result := ''; //path too long, exceeded MAX_PATH_LEN and still not enough, return null
    exit;
  end;

  SetLength(Result, nRes); //else truncate the string, set terminating null
end;

function GetFileVersionInfoStr(Filename: string): string;
var verSize: dword;
  verHandle: dword;
  verData: array of byte;
  buf: pointer;
  len: cardinal;
begin
  verSize := GetFileVersionInfoSize(PChar(Filename), verHandle);
  if verSize=0 then begin
    Result := '';
    exit;
  end;

  buf := nil;
  len := 0;
  SetLength(verData, verSize);
  if not GetFileVersionInfo(PChar(Filename), verHandle, verSize, @verData[0]) then begin
    Result := '';
    exit;
  end;

  if not VerQueryValue(@verData[0], '\', buf, len)
  or (len=0) then begin
    Result := '';
    exit;
  end;

  with PVSFixedFileInfo(buf)^ do begin
   //dwFileVersionMS: Major version (HIWORD) + Minor version (LOWORD)
   //dwFileVersionLS: Release (HIWORD) + Build (LOWORD)
    Result :=
      IntToStr(HIWORD(dwFileVersionMS)) + '.' + IntToStr(LOWORD(dwFileVersionMS));
    if dwFileFlags and VS_FF_PRERELEASE = VS_FF_PRERELEASE then
      Result := Result + ' (dev)';
    if dwFileFlags and VS_FF_DEBUG = VS_FF_DEBUG then
      Result := Result + ' (debug)';
    if dwFileFlags and VS_FF_SPECIALBUILD = VS_FF_SPECIALBUILD then
      Result := Result + ' (special build)';
  end;
end;

function GetTempPathStr: String;
var tempFolder: array[0..MAX_PATH+1] of Char; //MAX_PATH+2 characters
begin
  GetTempPath(MAX_PATH+1, @tempFolder); //supports at most maxpath+1 characters + null, per documentation
  result := tempFolder;
end;

function CreateGuidStr: string;
var g: TGuid;
begin
  CreateGuid(g);
  Result := GuidToString(g);
end;

function CreateRandomTempDirName: string;
begin
 //Let's be nice and mark all our temp folders with "wakan_", so that they're identifiable
  Result := GetTempPathStr() + '\wakan_' + CreateGuidStr();
end;

function CreateRandomTempDir: string;
begin
  Result := CreateRandomTempDirName();
  ForceDirectories(Result);
end;

procedure DeleteDirectory(dir:string);
var sRec: TSearchRec;
begin
  if dir='' then exit; //just in case! don't delete random files
  if not FindFirst(dir + '\*.*', faAnyFile, sRec) = 0 then
    exit;
  repeat
    if sRec.Attr and faDirectory <> 0 then
      if (sRec.Name = '.') or (sRec.Name = '..') then begin
       //Nothing
      end else
        DeleteDirectory(dir + '\' + sRec.Name)
    else
      DeleteFile(PChar(dir + '\' + sRec.Name));
  until FindNext(sRec) <> 0;
  SysUtils.FindClose(sRec);
  Windows.RemoveDirectory(PChar(dir));
end;

function AppFolder: string;
begin
  Result := ExtractFileDir(GetModuleFilenameStr(0));
end;

function GetSpecialFolderPath(folderId: integer): string;
const SHGFP_TYPE_CURRENT = 0;
var hr: HRESULT;
begin
  SetLength(Result, MAX_PATH+1);
  hr := SHGetFolderPath(0, folderId or CSIDL_FLAG_CREATE, 0, SHGFP_TYPE_CURRENT, @Result[1]);
  if FAILED(hr) then
    raise Exception.Create('Cannot obtain special folder path: error 0x'+IntToHex(hr,8));

 //Truncate result
  SetLength(Result, WStrLen(PWideChar(Result)));
end;

{ Same as ForceDirectories, only considers relative paths such as:
    test/some/dir
 ...okay instead of failing on them. }
function ForceDirectories2(Dir: string): Boolean;
begin
  Result := True;
  if Dir = '' then begin
    Result := true;
    exit;
  end;
  Dir := ExcludeTrailingPathDelimiter(Dir);
{$IFDEF MSWINDOWS}
  if (Length(Dir) < 3) or DirectoryExists(Dir)
    or (ExtractFilePath(Dir) = Dir) then Exit; // avoid 'xyz:\' problem.
{$ENDIF}
{$IFDEF LINUX}
  if (Dir = '') or DirectoryExists(Dir) then Exit;
{$ENDIF}
  Result := ForceDirectories2(ExtractFilePath(Dir)) and CreateDir(Dir);
end;


{ Strings }

//returns length of the string in 4-characters
function flength(const s:FString):integer;
begin
 {$IFDEF UNICODE}
  Result := Length(s);
 {$ELSE}
  Result := Length(s) div 4;
 {$ENDIF}
end;

//returns length in Native characters by length in 4-characters
//  i.e. 3 four-chars == 12 native characters on non-unicode
//       3 four-chars == 3 native characters on unicode
function flenn(lenfc:integer): integer;
begin
 {$IFDEF UNICODE}
  Result := lenfc;
 {$ELSE}
  Result := lenfc * 4;
 {$ENDIF}
end;

//returns length in 4-characters by length in native characters
function flenfc(lenn:integer): integer;
begin
 {$IFDEF UNICODE}
  Result := lenn;
 {$ELSE}
  Result := lenn div 4;
 {$ENDIF}
end;

//a version of copy for FChars where you specify length in FChars
//spares us multiplying by four every time, and on Unicode resolves to simpler version
function fcopy(const s: FString; Index, Count: Integer):FString;
begin
{$IFDEF UNICODE}
  Result := copy(s, Index, Count);
{$ELSE}
  Result := copy(s, (Index-1)*4+1, Count*4);
{$ENDIF}
end;

procedure fdelete(var s: FString; Index, Count: Integer);
begin
{$IFDEF UNICODE}
  delete(s, Index, Count);
{$ELSE}
  delete(s, (Index-1)*4+1, Count*4);
{$ENDIF}
end;

function fpos(const substr: FString; const str:FString):integer;
begin
  Result := pos(substr,str){$IFNDEF UNICODE}div 4{$ENDIF};
end;

//Returns a character from the string
function fgetch(const s: FString; Index: integer): FChar;
begin
{$IFDEF UNICODE}
  Result := s[Index];
{$ELSE}
  Result := fcopy(s, Index, 1);
{$ENDIF}
end;

//Safe fgetch: if Index<1 or Index>Length it's guaranteed to not fail (return UH_NOCHAR, in fact)
function fgetchl(const s: FString; Index: integer): FChar;
begin
{$IFDEF UNICODE}
  if (Index<1) or (Index>Length(s)) then
    Result := UH_NOCHAR
  else
    Result := s[Index];
{$ELSE}
  Result := fcopy(s, Index, 1); //UH_NOCHAR='' on non-unicode, so it's okay
{$ENDIF}
end;

procedure fputch(var s: FString; Index: integer; const ch: FChar);
begin
{$IFDEF UNICODE}
  s[index] := ch;
{$ELSE}
  s[4*(Index-1)+1] := ch[1];
  s[4*(Index-1)+2] := ch[2];
  s[4*(Index-1)+3] := ch[3];
  s[4*(Index-1)+4] := ch[4];
{$ENDIF}
end;

function fstr(const s: AnsiString): FString;
begin
  Result := fstr(UnicodeString(s));
end;

//Converts raw (unicode) data to FString. On unicode does nothing!
//Only Unicode input is accepted because Ansi MUST be converted to Unicode.
//We can't do AnsiToHex, that would leave us with 2-byte and not 4-byte symbols.
function fstr(const s: UnicodeString): FString;
begin
 {$IFDEF UNICODE}
  Result := FString(s);
 {$ELSE}
  Result := UnicodeToHex(s);
 {$ENDIF}
end;

//Converts FString to raw UnicodeString. On unicode does nothing!
//Call when you want to pass FString to someone who accepts UnicodeStrings
function fstrtouni(const s: FString): UnicodeString;
begin
 {$IFDEF UNICODE}
  Result := UnicodeString(s);
 {$ELSE}
  Result := HexToUnicode(s);
 {$ENDIF}
end;

//Converts Hex to FString. On Ansi builds does nothing!
//Call when you want to parse Ansi Hex data (ex. from file) to FString
function hextofstr(const s: FHex): FString;
begin
 {$IFDEF UNICODE}
  Result := HexToUnicode(s);
 {$ELSE}
  Result := FHex(s);
 {$ENDIF}
end;

//Converts FString to Hex. On Ansi builds does nothing
//Call when you want to store FString as Ansi Hex data (ex. in file of such format)
function fstrtohex(const s: FString): FHex;
begin
 {$IFDEF UNICODE}
  Result := UnicodeToHex(s);
 {$ELSE}
  Result := FString(s);
 {$ENDIF}
end;

{ Many formats in support both FHex and direct Unicode entries when loading
 configuration for backward compability.
 This function decodes such strings appropriately. }
function autohextofstr(const text: string): FString;
begin
  if EvalChars(text) = [EC_LATIN_HW] then
    Result := hextofstr(text)
  else
    Result := fstr(text); //on non-unicode convert to hex
end;


{$IFNDEF UNICODE}
//Compares a cnt of 4-characters
//There should be at least this number of 4-characters in at least one of a, b
function FcharCmp(a, b: PFChar; cnt: integer): boolean;
var ia: PInteger absolute a;
  ib: PInteger absolute b;
begin
  while (cnt>0) and (ia^=ib^) do begin
    Inc(ia);
    Inc(ib);
    Dec(cnt);
  end;
  Result := cnt<=0;
end;                                        
{$ENDIF}

{ Converts one character to FChar }
function fch(const c: AnsiChar): FChar;
begin
{$IFDEF UNICODE}
  Result := FChar(c);
{$ELSE}
  Result := BytesToHex(@c, SizeOf(AnsiChar));
{$ENDIF}
end;

function fch(const c: WideChar): FChar;
begin
{$IFDEF UNICODE}
  Result := FChar(c);
{$ELSE}
  Result := UnicodeToHex(@c, SizeOf(WideChar));
{$ENDIF}
end;

{ Converts FChar to AnsiChar, returns false if it was impossible.
 Only for simple transformations, else use WideCharToMultiByte(fstrtouni(s)) }
function ftoansi(c: FChar; out ac: AnsiChar): boolean;
begin
 {$IFDEF UNICODE}
  Result := (ord(c)<256);
  if Result then ac := AnsiChar(c);
 {$ELSE}
  Result := (Length(c)=4) and (c[1]='0') and (c[2]='0');
  if Result then
    ac := Chr((HexCharCode(c[3]) shl 4) + HexCharCode(c[4]));
 {$ENDIF}
end;

//Same but it's your problem if the input wasn't ansi
function ftoansi(c: FChar): AnsiChar;
begin
{$IFDEF UNICODE}
  Result := AnsiChar(c);
{$ELSE}
  Result := Chr((HexCharCode(c[3]) shl 4) + HexCharCode(c[4]));
{$ENDIF}
end;

function ftowide(c: FChar): WideChar;
begin
{$IFDEF UNICODE}
  Result := c;
{$ELSE}
  Result := WideChar(
    (HexCharCode(c[1]) shl 12)
    (HexCharCode(c[2]) shl 8)
    (HexCharCode(c[3]) shl 4)
    + HexCharCode(c[4]));
{$ENDIF}
end;


{
Unicode equivalents of common functions, missing on Ansi
}

{ Unicode version of pos() -- resolves to whatever is best on the platform }
function upos(const substr, str: UnicodeString):integer;
{$IFDEF UNICODE}
begin
  Result := pos(substr,str);
end;
{$ELSE}
var pw: PWideChar;
begin
  if str='' then begin
    Result := 0;
    exit;
  end;
  pw := WStrPos(PWideChar(str),PWideChar(substr)); //this one has reverse argument order!
  Result := (IntPtr(pw)-IntPtr(str)) div 2 - 1;
end;
{$ENDIF}

function UTrim(const S: UnicodeString): UnicodeString;
{$IFDEF UNICODE}
begin
  Result := Trim(S);
end;
{$ELSE}
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] <= ' ') do Inc(I);
  if I > L then Result := '' else
  begin
    while S[L] <= ' ' do Dec(L);
    if (I>1) or (L<Length(S)) then
      Result := Copy(S, I, L - I + 1)
    else
      Result := S;
  end;
end;
{$ENDIF}


function UTrimLeft(const S: UnicodeString): UnicodeString;
{$IFDEF UNICODE}
begin
  Result := TrimLeft(S);
end;
{$ELSE}
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] <= ' ') do Inc(I);
  if I>1 then
    Result := Copy(S, I, Maxint)
  else
    Result := S;
end;
{$ENDIF}

function UTrimRight(const S: UnicodeString): UnicodeString;
{$IFDEF UNICODE}
begin
  Result := TrimRight(S);
end;
{$ELSE}
var
  I: Integer;
begin
  I := Length(S);
  while (I > 0) and (S[I] <= ' ') do Dec(I);
  if I<Length(S) then
    Result := Copy(S, 1, I)
  else
    Result := S;
end;
{$ENDIF}

//<= 0 if not found
function UCharPos(const Ch: WideChar; const Str: UnicodeString): integer;
begin
  Result := 1;
  while Result<=Length(Str) do begin
    if Ch=Str[Result] then
      exit;
    Inc(Result);
  end;
  Result := -1;
end;

function UTrim(const S: UnicodeString; const Chars: UnicodeString): UnicodeString;
var i_l, i_r: integer;
begin
 //Left side
  i_l:=1;
  while i_l<=Length(s) do begin
    if UCharPos(s[i_l], Chars)<=0 then
      break;
    Inc(i_l);
  end;
 //Right side
  i_r:=Length(s);
  while i_r>=1 do begin
    if UCharPos(s[i_r], Chars)<=0 then
      break;
    Dec(i_r);
  end;

  if (i_l=1) and (i_r=Length(s)) then
    Result := S
  else
  if i_r<i_l then
    Result := ''
  else
    Result := Copy(S,i_l,i_r-i_l+1);
end;

function UTrimLeft(const S: UnicodeString; const Chars: UnicodeString): UnicodeString;
var i: integer;
begin
  i:=1;
  while i<=Length(s) do begin
    if UCharPos(s[i], Chars)<=0 then
      break;
    Inc(i);
  end;
  if i=1 then
    Result := S
  else
    Result := Copy(s,i,MaxInt);
end;

function UTrimRight(const S: UnicodeString; const Chars: UnicodeString): UnicodeString;
var i: integer;
begin
  i:=Length(s);
  while i>=1 do begin
    if UCharPos(s[i], Chars)<=0 then
      break;
    Dec(i);
  end;
  if i=Length(S) then
    Result := S
  else
    Result := Copy(s,1,i);
end;

function ULowerCase(const S: UnicodeString): UnicodeString;
{$IFDEF UNICODE}
begin
  Result := lowercase(S);
end;
{$ELSE}
begin
  Result := WideLowerCase(S);
end;
{$ENDIF}

function UUpperCase(const S: UnicodeString): UnicodeString;
{$IFDEF UNICODE}
begin
  Result := uppercase(S);
end;
{$ELSE}
begin
  Result := WideUpperCase(S);
end;
{$ENDIF}


//True if substr and str are binary equal.
function SameStr(const substr, str: string): boolean;
begin
  Result := SameStr(PChar(substr), PChar(str));
end;

function SameStr(substr, str: PChar): boolean;
begin
  if substr=nil then
    Result := str=nil
  else
  if str=nil then
    Result := false
  else begin
    while (substr^<>#00) and (str^=substr^) do begin
      Inc(substr);
      Inc(str);
    end;
    Result := (substr^=#00) and (str^=#00);
  end;
end;

//True if str starts with substr. Delphi version is slow.
function StartsStr(const substr, str: string): boolean;
begin
  Result := StartsStr(PChar(substr), PChar(str));
end;

function StartsStr(substr, str: PChar): boolean;
begin
  if substr=nil then
    Result := true
  else
  if str=nil then
    Result := false
  else begin
    while (substr^<>#00) and (substr^=str^) do begin
      Inc(substr);
      Inc(str);
    end;
    Result := (substr^=#00);
  end;
end;

//True if str ends with substr. Not sure how fast this is.
function EndsStr(const substr, str: string): boolean;
var i_pos: integer;
begin
  i_pos := Length(str)-Length(substr)+1;
  if (i_pos<1) or (i_pos>Length(str)) then
    Result := false
  else
    Result := SameStr(PChar(substr), @str[i_pos]);
end;

function EndsStr(substr, str: PChar): boolean;
var i_pos: integer;
begin
  if substr=nil then
    Result := true
  else
  if str=nil then
    Result := false //because substr<>nil
  else begin
    i_pos := StrLen(str)-StrLen(substr);
    if (i_pos<0) or (i_pos>=Length(str)) then
      Result := false
    else
      Result := SameStr(substr, str+i_pos);
  end;
end;


{
HexToUnicode() is used in RomajiToKana() so it can be a bottleneck.
We'll try to do it fast.
}

//Increments a valid PChar pointer 4 characters or returns false if the string ends before that
function EatOneFChar(var pc: PAnsiChar): boolean;
begin
  Result := false;
  if pc^=#00 then exit;
  Inc(pc);
  if pc^=#00 then exit;
  Inc(pc);
  if pc^=#00 then exit;
  Inc(pc);
  if pc^=#00 then exit;
  Inc(pc);
  Result := true;
end;

function EatOneFCharW(var pc: PWideChar): boolean;
begin
  Result := false;
  if pc^=#00 then exit;
  Inc(pc);
  if pc^=#00 then exit;
  Inc(pc);
  if pc^=#00 then exit;
  Inc(pc);
  if pc^=#00 then exit;
  Inc(pc);
  Result := true;
end;

function IsHexChar(wc: WideChar): boolean;
begin
  Result := ((wc>='a') and (wc<='f'))
    or ((wc>='A') and (wc<='F'))
    or ((wc>='0') and (wc<='9'));
end;

//Returns a value in range 0..15 for a given hex character, or throws an exception
function HexCharCode(c:AnsiChar): byte;
begin
  if (ord(c)>=ord('0')) and (ord(c)<=ord('9')) then
    Result := ord(c)-ord('0')
  else
  if (ord(c)>=ord('A')) and (ord(c)<=ord('F')) then
    Result := 10 + ord(c)-ord('A')
  else
  if (ord(c)>=ord('a')) and (ord(c)<=ord('f')) then
    Result := 10 + ord(c)-ord('a')
  else
    raise Exception.Create('Invalid hex character "'+c+'"');
end;

function HexCharCodeW(c:WideChar): byte;
begin
  if (ord(c)>=ord('0')) and (ord(c)<=ord('9')) then
    Result := ord(c)-ord('0')
  else
  if (ord(c)>=ord('A')) and (ord(c)<=ord('F')) then
    Result := 10 + ord(c)-ord('A')
  else
  if (ord(c)>=ord('a')) and (ord(c)<=ord('f')) then
    Result := 10 + ord(c)-ord('a')
  else
    raise Exception.Create('Invalid hex character "'+c+'"');
end;

//Converts up to maxlen hex characters into unicode symbols.
//Maxlen ought to be a multiplier of 4.
function HexToUnicode(ps:PAnsiChar; maxlen: integer): UnicodeString; overload;
var pn: PAnsiChar; //next symbol pointer
  cc: word; //character code
begin
  Result := '';
  if (ps=nil) or (ps^=#00) then exit;
 {$IFNDEF UNICODE}
  if ps^=UH_UNKNOWN_KANJI then Inc(ps);
 {$ENDIF}
  pn := ps;
  while (maxlen>=4) and EatOneFChar(pn) do begin
    cc := HexCharCode(ps^) shl 12;
    Inc(ps);
    Inc(cc, HexCharCode(ps^) shl 8);
    Inc(ps);
    Inc(cc, HexCharCode(ps^) shl 4);
    Inc(ps);
    Inc(cc, HexCharCode(ps^));
    Result := Result + WideChar(cc);
    ps := pn;
  end;
end;

function HexToUnicodeW(ps:PWideChar; maxlen: integer): UnicodeString; overload;
var pn: PWideChar; //next symbol pointer
  cc: word; //character code
begin
  Result := '';
  if (ps=nil) or (ps^=#00) then exit;
 {$IFNDEF UNICODE}
  if ps^=WideChar(UH_UNKNOWN_KANJI) then Inc(ps);
 {$ENDIF}
  pn := ps;
  while (maxlen>=4) and EatOneFCharW(pn) do begin
    cc := HexCharCodeW(ps^) shl 12;
    Inc(ps);
    Inc(cc, HexCharCodeW(ps^) shl 8);
    Inc(ps);
    Inc(cc, HexCharCodeW(ps^) shl 4);
    Inc(ps);
    Inc(cc, HexCharCodeW(ps^));
    Result := Result + WideChar(cc);
    ps := pn;
    Dec(maxlen,4);
  end;
end;

function HexToUnicode(const s:string): UnicodeString; overload;
begin
  if s='' then
    Result := ''
  else
   {$IFDEF UNICODE}
    Result := HexToUnicodeW(PWideChar(pointer(s)), Length(s));
   {$ELSE}
    Result := HexToUnicode(PAnsiChar(pointer(s)), Length(s));
   {$ENDIF}
end;

function BytesToHex(pb:PByte;sz:integer):string;
const HexChars: string = '0123456789ABCDEF';
var i:integer;
begin
  if pb=nil then begin
    Result := '';
    exit;
  end;

  SetLength(Result, sz*2);
  for i := 0 to sz - 1 do begin
    Result[i*2+1] := HexChars[1 + PByte(pb)^ shr 4];
    Result[i*2+2] := HexChars[1 + PByte(pb)^ and $0F];
    Inc(pb);
  end;
end;

{
This is NOT equiualent to BytesToHex(s, Length(s)*2).
We're translating text in CHARS which are two-byte. I.e.
  BytesToHex:   01 02 03 04 05 06 07 08 09 10...
  UnicodeToHex: 02 01 04 03 06 05 08 07 10 09...
}
function UnicodeToHex(pc:PWideChar; len: integer):string;
const HexChars: string = '0123456789ABCDEF';
var i:integer;
begin
  if pc=nil then begin
    Result := '';
    exit;
  end;

  SetLength(Result, len*4);
  for i := 0 to len - 1 do begin
    Result[i*4+1] := HexChars[1 + PWord(pc)^ shr 12];
    Result[i*4+2] := HexChars[1 + (PWord(pc)^ shr 8) and $0F];
    Result[i*4+3] := HexChars[1 + (PWord(pc)^ shr 4) and $0F];
    Result[i*4+4] := HexChars[1 + PWord(pc)^ and $0F];
    Inc(pc);
  end;
end;

function UnicodeToHex(const s:UnicodeString):string;
begin
  Result := UnicodeToHex(PWideChar(s), Length(s));
end;

function AnsiToHex(const s:AnsiString):string;
begin
  Result := BytesToHex(PByte(s), Length(s));
end;

function UnicodeToML(s:widestring):string;
var i:integer;
    c:widechar;
    d:word;
    s2,s3:string;
begin
  s2:='';
  for i:=1 to length(s) do
  begin
    c:=s[i];
    d:=word(c);
    s3:=format('&#%d,',[d]);
    s2:=s2+s3;
  end;
  result:=s2;
end;

//For now WideChar-only. Someday we should account for multi-word characters too.
function Utf16ToUnicodeIndex(const c: WideChar): integer;
begin
  Result := Word(c);
end;


//If there's more than cnt separators, the rest of the string is added
//to the last part
procedure SplitAdd(sl:TStringList;s:string;cnt:integer);
var i:integer;
begin
  i:=0;
  while i<cnt do
  begin
    inc(i);
    if pos(',',s)>0 then
    begin
      sl.Add(copy(s,1,pos(',',s)-1));
      delete(s,1,pos(',',s));
    end else
    begin
      sl.Add(s);
      s:='';
    end;
  end;
end;

//Same but doesn't add it anywhere
function SplitStr(s: string; cnt: integer; ch:char): TStringArray;
var i:integer;
begin
  SetLength(Result, cnt);
  i:=0;
  while i<cnt do
  begin
    if pos(ch,s)>0 then
    begin
      Result[i] := copy(s,1,pos(ch,s)-1);
      delete(s,1,pos(ch,s));
    end else
    begin
      Result[i] := s;
      s:='';
    end;
    inc(i);
  end;
end;

//Same but does not use fixed number of parts
function SplitStr(s: string; ch: char=','): TStringArray;
var i: integer;
begin
  SetLength(Result, 0);
  i := pos(ch,s);
  while i>0 do begin
    SetLength(Result, Length(Result)+1);
    Result[Length(Result)-1] := copy(s, 1, i-1);
    delete(s, 1, i);
    i := pos(ch,s);
  end;
  if s<>'' then begin
    SetLength(Result, Length(Result)+1);
    Result[Length(Result)-1] := s;
  end;
end;

//Same but with random length sep
function SplitStr(s: string; sep: string): TStringArray;
var i: integer;
begin
  SetLength(Result, 0);
  i := pos(sep,s);
  while i>0 do begin
    SetLength(Result, Length(Result)+1);
    Result[Length(Result)-1] := copy(s, 1, i-1);
    delete(s, 1, i+Length(sep)-1);
    i := pos(sep,s);
  end;
  if s<>'' then begin
    SetLength(Result, Length(Result)+1);
    Result[Length(Result)-1] := s;
  end;
end;

function split(s: string; sep: string): TStringArray;
begin
  Result := SplitStr(s, sep);
end;

function JoinStr(const AParts: TStringArray; const ASep: string = ', '): string;
begin
  Result := join(AParts, ASep)
end;

function join(const a: TStringArray; const sep: string): string;
var i: integer;
begin
  if Length(a)<=0 then
    Result := ''
  else
    Result := a[0];
  for i := 1 to Length(a) - 1 do
    Result := Result + sep + a[i];
end;

procedure Append(var ATo: TStringArray; const AFrom: TStringArray);
var base, i: integer;
begin
  if Length(AFrom)<=0 then exit;
  base := Length(ATo);
  SetLength(ATo, base+Length(AFrom));
  for i := 0 to Length(AFrom)-1 do
    ATo[base+i] := AFrom[i];
end;

procedure StrListAdd(sl: TStringList; sa: TStringArray);
var i: integer;
begin
  for i := 0 to Length(sa) - 1 do
    sl.Add(sa[i]);
end;


function repl(const s:string;const sub,repl:string):string;
var i_pos: integer;
begin
  Result := s;
  i_pos := pos(sub, Result);
  while i_pos>0 do begin
    Result:=copy(Result,1,i_pos-1) + repl
      +copy(Result,i_pos+length(sub),length(Result)-i_pos+1-length(sub));
    i_pos := pos(sub,Result);
  end;
end;


{ Returns part of the string from the start to the first occurence of "c",
 and cuts that part, up to and including "c".
 If no "c" is found, returns the remainder of the string. }
function strqpop(var s:string;c:char):string;
var i: integer;
begin
  i := pos(c,s);
  if i=0 then
  begin
    Result:=s;
    s:='';
  end else
  begin
    Result:=copy(s,1,i-1);
    delete(s,1,i);
  end;
end;

function strqpop(var s:string;const cs:string):string; overload;
var i: integer;
begin
  i := pos(cs,s);
  if i=0 then
  begin
    Result:=s;
    s:='';
  end else
  begin
    Result:=copy(s,1,i-1);
    delete(s,1,i+Length(cs)-1);
  end;
end;

//Inefficient, so use strqpop where available
function ustrqpop(var s:UnicodeString;c:WideChar):UnicodeString;
{$IFDEF UNICODE}
begin
  Result := strqpop(s,c);
end;
{$ELSE}
var i: integer;
begin
  i := upos(c,s);
  if i=0 then
  begin
    Result:=s;
    s:='';
  end else
  begin
    Result:=copy(s,1,i-1);
    delete(s,1,i);
  end;
end;
{$ENDIF}

{ Copies a span of characters between ps inclusive and pe not inclusive }
function spancopy(ps, pe: PChar): string;
var i: integer;
begin
  SetLength(Result, (NativeUInt(pe)-NativeUInt(ps)) div SizeOf(char));
  for i := 1 to Length(Result) do begin
    Result[i] := ps^;
    Inc(ps);
  end;
end;

//Число вхождений символа в строку
function countc(const s:string;const c:char): integer;
var i: integer;
begin
  Result := 0;
  for i := 1 to Length(s) do
    if s[i]=c then Inc(Result);
end;

{ Makes the string fixed length -- cuts if it's too long or pads if it's too short }
procedure MakeFixedLen(var s: AnsiString; len: integer; pad_ch: AnsiChar);
var old_len: integer;
begin
  old_len := length(s);
  if old_len<>len then SetLength(s,len);
  while old_len<len do begin
    s[old_len+1] := pad_ch;
    Inc(old_len);
  end;
end;

procedure MakeFixedLen(var s: UnicodeString; len: integer; pad_ch: WideChar);
var old_len: integer;
begin
  old_len := length(s);
  if old_len<>len then SetLength(s,len);
  while old_len<len do begin
    s[old_len+1] := pad_ch;
    Inc(old_len);
  end;
end;


{ Filename list }

procedure AddFilename(var list: TFilenameList; const filename: string);
begin
  SetLength(list, Length(list)+1);
  List[Length(list)-1] := lowercase(filename);
end;

function MakeFilenameList(const filenames: array of string): TFilenameList;
var i,l: integer;
begin
  SetLength(Result, Length(filenames));
  l := Low(filenames);
  for i := l to High(filenames) do
    Result[i-l] := filenames[i];
end;

function IsFileInList(const filename: string;const list: TFilenameList): boolean;
var l_filename: string;
  i: integer;
begin
  Result := false;
  l_filename := lowercase(filename);
  for i := 0 to Length(list)-1 do
    if lowercase(list[i])=l_filename then begin
      Result := true;
      break;
    end;
end;

function FilenameListToString(const list: TFilenameList; const sep: string = ', '): string;
var i: integer;
begin
  if Length(list)<=0 then begin
    Result := '';
    exit;
  end;

  Result := list[0];
  for i := 1 to Length(list) - 1 do
    Result := Result + sep + list[i];
end;


{ Character processing }

function EvalChar(char: WideChar): TEvalCharType;
var ch: Word absolute char;
begin
  if ch=$3005 then result:=EC_IDG_CHAR else // kurikaeshi
  if (ch>=$3000) and (ch<=$303F) then result:=EC_IDG_PUNCTUATION else
  if (ch>=$3040) and (ch<=$309F) then result:=EC_HIRAGANA else
  if (ch>=$30A0) and (ch<=$30FF) then result:=EC_KATAKANA else
  if (ch>=$3100) and (ch<=$312F) then result:=EC_BOPOMOFO else
  if (ch>=$3200) and (ch<=$33FF) then result:=EC_IDG_OTHER else
  if (ch>=$3400) and (ch<=$9FFF) then result:=EC_IDG_CHAR else
  if (ch>=$F900) and (ch<=$FAFF) then result:=EC_IDG_CHAR else
  if (ch>=$FE30) and (ch<=$FE4F) then result:=EC_IDG_PUNCTUATION else
  if (ch>=$FF00) and (ch<=$FF5F) then result:=EC_LATIN_FW else
  if (ch>=$FF60) and (ch<=$FF9F) then result:=EC_KATAKANA_HW else
  if {(ch>=$0000) and} (ch<=$007F) then result:=EC_LATIN_HW else //first part always true
  result:=EC_UNKNOWN;
end;

{$IFDEF UNICODE}
function EvalChar(const char:FString): TEvalCharType;
begin
  Result := EvalChar(WideChar(PWideChar(char)^));
end;
{$ELSE}
function EvalChar(const char:FString): TEvalCharType;
begin
  if char='3005' then result:=EC_IDG_CHAR else // kurikaeshi
  if (char>='3000') and (char<='303F') then result:=EC_IDG_PUNCTUATION else
  if (char>='3040') and (char<='309F') then result:=EC_HIRAGANA else
  if (char>='30A0') and (char<='30FF') then result:=EC_KATAKANA else
  if (char>='3100') and (char<='312F') then result:=EC_BOPOMOFO else
  if (char>='3200') and (char<='33FF') then result:=EC_IDG_OTHER else
  if (char>='3400') and (char<='9FFF') then result:=EC_IDG_CHAR else
  if (char>='F900') and (char<='FAFF') then result:=EC_IDG_CHAR else
  if (char>='FE30') and (char<='FE4F') then result:=EC_IDG_PUNCTUATION else
  if (char>='FF00') and (char<='FF5F') then result:=EC_LATIN_FW else
  if (char>='FF60') and (char<='FF9F') then result:=EC_KATAKANA_HW else
  if (char>='0000') and (char<='007F') then result:=EC_LATIN_HW else
  result:=EC_UNKNOWN;
end;
{$ENDIF}

function EvalChars(const chars: FString): TEvalCharTypes;
var i: integer;
begin
  Result := [];
  for i := 1 to flength(chars) do
    Result := Result + [EvalChar(fgetch(chars,i))];
end;

function TestCharsAre(const chars: FString; ec: TEvalCharTypes): boolean;
var i: integer;
begin
  Result := true;
  for i:=1 to flength(chars) do
    if not (EvalChar(fgetch(chars,i)) in ec) then begin
      Result := false;
      break;
    end;
end;

function IsUpcaseLatin(ch: AnsiChar): boolean;
begin
  Result := ch in ['A'..'Z'];
end;

function IsUpcaseLatin(ch: WideChar): boolean;
begin
  Result := (Word(ch) and $FF00 = 0) and (AnsiChar(ch) in ['A'..'Z']);
end;

function IsLocaseLatin(ch: AnsiChar): boolean;
begin
  Result := ch in ['a'..'z'];
end;

function IsLocaseLatin(ch: WideChar): boolean;
begin
  Result := (Word(ch) and $FF00 = 0) and (AnsiChar(ch) in ['a'..'z']);
end;

function LoCase(ch: AnsiChar): AnsiChar;
begin
  Result := Ch;
  if Result in ['A'..'Z'] then
    Inc(Result, Ord('a')-Ord('A'));
end;

function LoCase(Ch: WideChar): WideChar;
begin
  Result := Ch;
  case Ch of
    'A'..'Z':
      Result := WideChar(Word(Ch) or $0020);
  end;
end;

function IsDigit(ch: AnsiChar): boolean;
begin
  Result := (Ord(ch)>=Ord('0')) and (Ord(ch)<=Ord('9'));
end;

function IsDigit(ch: WideChar): boolean;
begin
  Result := (Ord(ch)>=Ord('0')) and (Ord(ch)<=Ord('9'));
end;

//Ansi/Default version
function IsLatinLetter(c:char): boolean;
begin
  Result := ((c>='a') and (c<='z')) or ((c>='A') and (c<='Z'));
end;

//Strict Wide
function IsLatinLetterW(c:WideChar): boolean;
begin
  Result := ((c>='a') and (c<='z')) or ((c>='A') and (c<='Z'));
end;

//FChar
function IsLatinLetterF(c:FChar): boolean;
begin
{$IFDEF UNICODE}
  Result := IsLatinLetterW(c);
{$ELSE}
  Result := ((c>='0041') and (c<='005A')) or ((c>='0061') and (c<='007A'));
{$ENDIF}
end;

function IsHalfWidthChar(c:FChar):boolean;
begin
 {$IFNDEF UNICODE}
  Result:=(c[1]='0') and (c[2]='0');
 {$ELSE}
  Result := (Word(c) and $FF00 = 0);
 {$ENDIF}
end;

function IsLatinDigit(c:char):boolean;
begin
  Result := (Ord(c)>=Ord('0')) and (Ord(c)<=Ord('9'));
end;

function IsLatinDigitF(c:FChar):boolean;
begin
 {$IFDEF UNICODE}
  Result := (Ord(c)>=Ord('0')) and (Ord(c)<=Ord('9'));
 {$ELSE}
  Result := (c>='0030') and (c<='0039');
 {$ENDIF}
end;

{ True if a specified kana character is katakana. Doesn't check if it is kana to begin with. }
function IsKanaCharKatakana(c:FString; i:integer): boolean;
begin
 {$IFDEF UNICODE}
  Result := (Length(c)>=i) and ((ord(c[i]) and $00F0)>$A0);
 {$ELSE}
  i := (i-1)*4+3;
  Result := (Length(c)>i) and (c[i]>='A');
 {$ENDIF}
end;

//True if a char is a doubling character from any kana
function IsSokuon(const c: FChar): boolean;
begin
 {$IFDEF UNICODE}
  Result := (c='ッ') or (c='っ');
 {$ELSE}
  Result := (c='30C3') or (c='3063');
 {$ENDIF}
end;

function IsSmallKanaVowel(const c: FChar): boolean;
begin
 {$IFDEF UNICODE}
  Result :=
       (c='ぁ') or (c='ぃ') or (c='ぅ') or (c='ぇ') or (c='ぉ') or (c='ゃ') or (c='ゅ') or (c='ょ')
    or (c='ァ') or (c='ィ') or (c='ゥ') or (c='ェ') or (c='ォ') or (c='ャ') or (c='ュ') or (c='ョ');
 {$ELSE}
  Result :=
       (c='3041') or (c='3043') or (c='3045') or (c='3047') or (c='3049') or (c='3083') or (c='3085') or (c='3087')
    or (c='30A1') or (c='30A3') or (c='30A5') or (c='30A7') or (c='30A9') or (c='30E3') or (c='30E5') or (c='30E7');
 {$ENDIF}
end;

function AsciiToFullwidth(const c: char): char;
begin
  if c=' ' then
    Result := #$3000 //space is the exception
  else
 //Two char blocks are equal: 0021..007E <-> FF01..FF5E
  if (c>#$0020) and (c<#$0080) then
    Result := Chr(Ord(c)-$0020+$FF00)
  else
    Result := c;
end;

function AsciiToFullwidth(const s: string): string;
var i: integer;
begin
  Result := s;
  for i := 1 to Length(Result) do
    Result[i] := AsciiToFullwidth(Result[i]);
end;

function AsciiToHalfwidth(const c: char): char;
begin
  if c=#$3000 then
    Result := ' ' //space is the exception
  else
 //Two char blocks are equal: 0021..007E <-> FF01..FF5E
  if (c>#$FF00) and (c<#$FF60) then
    Result := Chr(Ord(c)-$FF00+$0020)
  else
    Result := c;
end;

function AsciiToHalfwidth(const s: string): string;
var i: integer;
begin
  Result := s;
  for i := 1 to Length(Result) do
    Result[i] := AsciiToFullwidth(Result[i]);
end;


//Not UTF16-surrogate safe as of now
function UrlEncode(const s: UnicodeString; options: TUrlEncodeOptions): AnsiString;
var i, j: integer;
  U: UTF8String;
begin
  Result := '';
  for i := 1 to Length(s) do
    if CharInSet(s[i], ['a'..'z', 'A'..'Z', '1'..'9', '0']) then
      Result := Result + AnsiChar(s[i])
    else
    if s[i]=' ' then
      if ueNoSpacePlus in options then
        Result := Result + '%20'
      else
        Result := Result + '+'
    else begin
      U := UTF8String(s[i]); // explicit Unicode->UTF8 conversion
      for j := 1 to Length(U) do
        Result := Result + '%' + AnsiString(IntToHex(Ord(U[j]), 2));
    end;
end;

function UrlEncode(const s: UTF8String; options: TUrlEncodeOptions): AnsiString;
var i: integer;
begin
  Result := '';
  for i := 1 to Length(s) do
    if CharInSet(s[i], ['a'..'z', 'A'..'Z', '1'..'9', '0']) then
      Result := Result + AnsiChar(s[i])
    else
    if s[i]=' ' then
      if ueNoSpacePlus in options then
        Result := Result + '%20'
      else
        Result := Result + '+'
    else
     //This is already UTF8 so it's ok
      Result := Result + '%' + AnsiString(IntToHex(Ord(s[i]), 2));
end;

function HtmlEscape(const s: string): string;
var i: integer;
begin
  Result := '';
  for i := 1 to Length(s) do
    if s[i]='&' then Result := Result + '&amp;' else
    if s[i]='''' then Result := Result + '&apos;' else
    if s[i]='"' then Result := Result + '&quot;' else
    if s[i]='<' then Result := Result + '&lt;' else
    if s[i]='>' then Result := Result + '&gt;' else
    Result := Result + s[i];
end;

const
  URLDelim  = '/';

function ExtractFileNameURL(const URL: string): string;
var
  I: Integer;
begin
  I := URL.LastDelimiter(PathDelim + DriveDelim + URLDelim);
  Result := URL.SubString(I + 1);
end;

end.
