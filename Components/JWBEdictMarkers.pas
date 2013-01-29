unit JWBEdictMarkers;

interface
uses JWBStrings;

{ EDict processing }
{ Marker IDs are stored in dictionaries so we have to keep absolute backward
 compability.
 Do not change marker IDs.
 Do not deleted markers (even deprecated ones).
 Only add marker IDs after the last one.
 New marker IDs have no effect on previously compiled dictionaries. }

type
 { There's a reason we declare markers as AnsiString.
  Marker codes include invalid chars which would eventually be lost if allowed
  to be converted between Ansi and Unicode. (Such as #129 'derog').
  And since markers are stored in dictionaries as Ansi since long ago,
  we try to keep that exact format when reading. }
  TMarkers = AnsiString;
  TMarker = AnsiChar;

  TEdictMarkerFlag = (
    mfPos,   //it's important to distinguish POS markers from non-POS markers:
      //they are handled differently (see JWBEdictReader.pas)
      //other marker types are not so important, but they are kept separately by JMDic
    mfField, //field of application
    mfDial   //dialect
  );
  TEdictMarkerFlags = set of TEdictMarkerFlag;

  TEdictMarkerDef = record
    m: string;
    id: TMarker;
    f: TEdictMarkerFlags;
    ab: string; //type + expanded name. If name is the same as m, it's not specified
    { Supported types: 1, g, s }
    abl: string; { localized type + expanded name.
     Loaded each time application language changes. Can be empty, ab is used then }
  end;
  PEdictMarkerDef = ^TEdictMarkerDef;

{$J+}
const
  EdictMarkers: array[0..113] of TEdictMarkerDef = (
   //Part of Speech Marking
    (m: 'adj-i'; id: #99; f: [mfPos]; ab: 'g';),
    (m: 'adj-na'; id: #45; f: [mfPos]; ab: 'gna-adj'),
    (m: 'adj-no'; id: #46; f: [mfPos]; ab: 'gno-adj'),
    (m: 'adj-pn'; id: #47; f: [mfPos]; ab: 'gpren-adj'),
    (m: 'adj-s'; id: #48; f: [mfPos]; ab: 'gspec-adj'), //deprecated
    (m: 'adj-t'; id: #49; f: [mfPos]; ab: 'gtaru-adj'),
    (m: 'adj-f'; id: #100; f: [mfPos]; ab: 'g'),
    (m: 'adj'; id: #43; f: [mfPos]; ab: 'g'),
    (m: 'adv'; id: #44; f: [mfPos]; ab: 'g'),
    (m: 'adv-n'; id: #101; f: [mfPos]; ab: 'g'),
    (m: 'adv-to'; id: #102; f: [mfPos]; ab: 'g'),
    (m: 'aux'; id: #50; f: [mfPos]; ab: 'g'),
    (m: 'aux-v'; id: #51; f: [mfPos]; ab: 'g'),
    (m: 'aux-adj'; id: #103; f: [mfPos]; ab: 'g'),
    (m: 'conj'; id: #52; f: [mfPos]; ab: 'g'),
    (m: 'ctr'; id: #104; f: [mfPos]; ab: 'g'),
    (m: 'exp'; id: #53; f: [mfPos]; ab: 'gexpr'),
    (m: 'int'; id: #57; f: [mfPos]; ab: 'g'),
    (m: 'iv'; id: #105; f: [mfPos]; ab: 'g'),
    (m: 'n'; id: #58; f: [mfPos]; ab: 'g'),
    (m: 'n-adv'; id: #59; f: [mfPos]; ab: 'g'),
    (m: 'n-pref'; id: #106; f: [mfPos]; ab: 'g'),
    (m: 'n-suf'; id: #61; f: [mfPos]; ab: 'g'),
    (m: 'n-t'; id: #60; f: [mfPos]; ab: 'g'),
    (m: 'neg'; id: #62; f: [mfPos]; ab: 'g'), //deprecated
    (m: 'neg-v'; id: #63; f: [mfPos]; ab: 'gneg-verb'), //deprecated
    (m: 'num'; id: #107; f: [mfPos]; ab: 'g'),
    (m: 'pn'; id: #108; f: [mfPos]; ab: 'g'),
    (m: 'pref'; id: #64; f: [mfPos]; ab: 'g'),
    (m: 'prt'; id: #109; f: [mfPos]; ab: 'g'),
    (m: 'suf'; id: #65; f: [mfPos]; ab: 'g'),
    (m: 'v1'; id: #66; f: [mfPos]; ab: 'gru-v'),
    (m: 'v2a-s'; id: #110; f: [mfPos]; ab: 'g'),
    (m: 'v4h'; id: #111; f: [mfPos]; ab: 'g'),
    (m: 'v4r'; id: #112; f: [mfPos]; ab: 'g'),
    (m: 'v5'; id: #67; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5aru'; id: #79; f: [mfPos]; ab: 'garu-v'),
    (m: 'v5b'; id: #74; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5g'; id: #70; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5k'; id: #69; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5k-s'; id: #77; f: [mfPos]; ab: 'gIku-v'),
    (m: 'v5m'; id: #75; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5n'; id: #73; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5r'; id: #76; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5r-i'; id: #113; f: [mfPos]; ab: 'g'),
    (m: 'v5s'; id: #71; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5t'; id: #72; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5u'; id: #68; f: [mfPos]; ab: 'gu-v'),
    (m: 'v5u-s'; id: #114; f: [mfPos]; ab: 'g'),
    (m: 'v5uru'; id: #80; f: [mfPos]; ab: 'guru-v'),
    (m: 'v5z'; id: #78; f: [mfPos]; ab: 'gzuru-v'),
    (m: 'vz'; id: #115; f: [mfPos]; ab: 'g'),
    (m: 'vi'; id: #81; f: [mfPos]; ab: 'gintrans-verb'),
    (m: 'vk'; id: #84; f: [mfPos]; ab: 'gkuru-v'),
    (m: 'vn'; id: #116; f: [mfPos]; ab: 'g'),
    (m: 'vs'; id: #82; f: [mfPos]; ab: 'gp-suru'),
    (m: 'vs-c'; id: #117; f: [mfPos]; ab: 'g'),
    (m: 'vs-i'; id: #118; f: [mfPos]; ab: 'g'),
    (m: 'vs-s'; id: #83; f: [mfPos]; ab: 'gsuru-v'),
    (m: 'vt'; id: #85; f: [mfPos]; ab: 'gtrans-verb'),

   //Field of Application
    (m: 'Buddh'; id: #119; f: [mfField]),
    (m: 'MA'; id: #37; f: [mfField]; ab: '1martial-arts'),
    (m: 'comp'; id: #120; f: [mfField]),
    (m: 'food'; id: #121; f: [mfField]),
    (m: 'geom'; id: #122; f: [mfField]),
    (m: 'gram'; id: #55; f: [mfField]; ab: 'g'),
    (m: 'ling'; id: #123; f: [mfField]),
    (m: 'math'; id: #124; f: [mfField]),
    (m: 'mil'; id: #125; f: [mfField]),
    (m: 'physics'; id: #126; f: [mfField]),

   //Miscellaneous Markings
    (m: 'X'; id: #41; ab: '1rude'),
    (m: 'abbr'; id: #33; ab: '1'),
    (m: 'arch'; id: #34; ab: '1archaic'),
    (m: 'ateji'; id: #127; ab: '1'),
    (m: 'chn'; id: #128; ab: '1child'),
    (m: 'col'; id: #42; ab: '1'),
    (m: 'derog'; id: #129; ab: '1'),
    (m: 'eK'; id: #130),
    (m: 'ek'; id: #131),
    (m: 'fam'; id: #35; ab: '1familiar'),
    (m: 'fem'; id: #36; ab: '1female'),
    (m: 'gikun'; id: #54; ab: 'g'),
    (m: 'hon'; id: #86; ab: 'shonor'),
    (m: 'hum'; id: #87; ab: 's'),
    (m: 'ik'; id: #88; ab: 'sirreg-kana'),
    (m: 'iK'; id: #89; ab: 'sirreg-kanji'),
    (m: 'id'; id: #56; ab: 'gidiom'),
    (m: 'io'; id: #90; ab: 'sirreg-okurigana'),
    (m: 'm-sl'; id: #39; ab: '1manga-slang'),
    (m: 'male'; id: #38; ab: '1'),
    (m: 'male-sl'; id: #132; ab: '1'),
    (m: 'oK'; id: #94; ab: 'soutdated-kanji'),
    (m: 'obs'; id: #91; ab: 'sobsolete'),
    (m: 'obsc'; id: #92; ab: 'sobscure'),
    (m: 'ok'; id: #93; ab: 'soutdated-kana'),
    (m: 'on-mim'; id: #133),
    (m: 'poet'; id: #134; ab: '1'),
    (m: 'pol'; id: #95; ab: 'spolite'),
    (m: 'rare'; id: #135; ab: 's'),
    (m: 'sens'; id: #136; ab: '1'),
    (m: 'sl'; id: #137; ab: '1slang'),
    (m: 'uK'; id: #97; ab: 'skanji'),
    (m: 'uk'; id: #96; ab: 'skana'),
    (m: 'vulg'; id: #40; ab: '1vulgar'),

   //Word Priority Marking
    (m: 'P'; id: #98; ab: 'spop'),

   //Regional Words
    (m: 'kyb'; id: #138; f: [mfDial]),
    (m: 'osb'; id: #139; f: [mfDial]),
    (m: 'ksb'; id: #140; f: [mfDial]),
    (m: 'ktb'; id: #141; f: [mfDial]),
    (m: 'tsb'; id: #142; f: [mfDial]),
    (m: 'thb'; id: #143; f: [mfDial]),
    (m: 'tsug'; id: #144; f: [mfDial]),
    (m: 'kyu'; id: #145; f: [mfDial]),
    (m: 'rkb'; id: #146; f: [mfDial])
  );

  LastMarkerID = #146;
 { There's also an empty ID space #01..#32 }

  MarkPop: TMarker = #98;

type
  TMarkersByType = record
    pop: boolean;
    m_pos: string;
    m_field: string;
    m_dial: string;
    m_misc: string;
  end;
  PMarkersByType = ^TMarkersByType;

{ Only for debug -- tests that there are no ID duplicates. }
procedure TestMarkersIntegrity;

function FindMarkDef(m:string):PEdictMarkerDef; //returns marker definition or nil
function FindMark(m:string):TMarker; //returns marker ID or 0
function TestMarkers(const mark,test:TMarkers): boolean;
function GetMarkDef(mark:TMarker):PEdictMarkerDef;
function GetMarkEdict(mark:TMarker):string;
function GetMarkAbbr(mark:TMarker):string;
function ConvertMarkers(const s:string; out unrecog:string):TMarkers;
function MarkersToStr(const s:TMarkers; out pop: boolean):string;
function MarkersToStrEx(const s:TMarkers):TMarkersByType;

function ConvertEdictEntry(const s:string;var mark:TMarkers):string;
function FConvertEdictEntry(const s:FString;var mark:TMarkers):FString; deprecated
function EnrichDictEntry(const s:string;const mark:TMarkers):string;
function DropEdictMarkers(const s:string):string;

implementation
uses SysUtils, StrUtils;

procedure TestMarkersIntegrity;
var i, j: integer;
begin
  for i := 0 to Length(EdictMarkers) - 1 do begin
    if EdictMarkers[i].id=#00 then
      raise Exception.Create('TestMarkersIntegrity: Markers with zero ID detected('+EdictMarkers[i].m+')');
    for j := 0 to Length(EdictMarkers) - 1 do
      if (i<>j) and (EdictMarkers[i].id=EdictMarkers[j].id) then
        raise Exception.Create('TestMarkersIntegrity: Duplicate marker IDs detected ('+EdictMarkers[i].m+', '+EdictMarkers[j].m+')');
  end;
end;

function FindMarkDef(m:string):PEdictMarkerDef;
var i: integer;
begin
  Result := nil;
  for i := 0 to Length(EdictMarkers) - 1 do
    if EdictMarkers[i].m=m then begin
      Result := @EdictMarkers[i];
      break;
    end;
end;

function FindMark(m:string):TMarker;
var i: integer;
begin
  Result := #00;
  for i := 0 to Length(EdictMarkers) - 1 do
    if EdictMarkers[i].m=m then begin
      Result := EdictMarkers[i].id;
      break;
    end;
end;

{ Returns true if mark contains at least one of the characters from test. }
function TestMarkers(const mark, test:TMarkers): boolean;
var i,j: integer;
begin
  Result := false;
  for i := 1 to Length(mark) do
    for j := 1 to Length(test) do
      if mark[i]=test[j] then begin
        Result := true;
        break;
      end;
end;

function GetMarkDef(mark:TMarker):PEdictMarkerDef;
var i: integer;
begin
  Result := nil;
  for i := 0 to Length(EdictMarkers) - 1 do
    if EdictMarkers[i].id=mark then begin
      Result := @EdictMarkers[i];
      break;
    end;
end;

function GetMarkEdict(mark:TMarker):string;
var i: integer;
begin
  Result := '';
  for i := 0 to Length(EdictMarkers) - 1 do
    if EdictMarkers[i].id=mark then begin
      Result := EdictMarkers[i].m;
      break;
    end;
end;

function GetMarkAbbr(mark:TMarker):string;
var i: integer;
begin
  Result := '1?';
  for i := 0 to Length(EdictMarkers) - 1 do
    if EdictMarkers[i].id=mark then begin
      Result := EdictMarkers[i].abl;
      if Result='' then Result := EdictMarkers[i].ab;
      if Result='' then Result := 's'+EdictMarkers[i].m else
      if Length(Result)=1 {only type} then Result := Result + EdictMarkers[i].m;
      break;
    end;
end;

{ Accepts marker list in the form "mark1,mark2,mark3". Converts it to Wakan
 marker list format.
 Returns those markers which weren't recognized (to be added back to the string) }
function ConvertMarkers(const s:string; out unrecog:string):TMarkers;
var tmp, m: string;
  mi: TMarker;
begin
  Result := '';
  unrecog := '';
  tmp := s;
  m := strqpop(tmp,',');
  while m<>'' do begin
    mi := FindMark(m);
    if mi<>#00 then
      Result := Result + mi
    else
      if unrecog<>'' then
        unrecog := unrecog + ',' + m
      else
        unrecog := m;
    m := strqpop(tmp,',');
  end;
end;

{ Converts a Wakan dictionary markers field to EDICT markers string  }
function MarkersToStr(const s:TMarkers; out pop: boolean):string;
var i: integer;
begin
  pop := false;
  Result := '';
  for i := 1 to Length(s) do begin
    if s[i]=MarkPop then
      pop := true
    else
      Result := Result + ',' + GetMarkEdict(s[i]);
  end;
  delete(Result,1,1);
end;

function MarkersToStrEx(const s:TMarkers):TMarkersByType;
var i: integer;
  def: PEdictMarkerDef;
begin
  Result.pop := false;
  Result.m_pos := '';
  Result.m_field := '';
  Result.m_dial := '';
  Result.m_misc := '';
  for i := 1 to Length(s) do
    if s[i]=MarkPop then
      Result.pop := true
    else begin
      def := GetMarkDef(s[i]);
      if mfPos in def.f then
        Result.m_pos := Result.m_pos + ',' + def.m
      else
      if mfField in def.f then
        Result.m_field := Result.m_field + ',' + def.m
      else
      if mfDial in def.f then
        Result.m_dial := Result.m_dial + ',' + def.m
      else
        Result.m_misc := Result.m_misc + ',' + def.m
    end;
  delete(Result.m_pos,1,1);
  delete(Result.m_field,1,1);
  delete(Result.m_dial,1,1);
  delete(Result.m_misc,1,1);
end;


{ EDict processing }

function ConvertEdictEntry(const s:string;var mark:TMarkers):string;
var s2:string;
    inmarker:boolean;
    curm,marker:string;
    i:integer;
    markerd:boolean;
    oldm:string;
    mm:TMarker;
    insection:boolean;
begin
  s2:='';
  marker:='';
  markerd:=false;
  mark:='';
  insection:=false;
  inmarker:=false;
  for i:=1 to length(s) do
  begin
    if s[i]='/'then
    begin
      s2:=s2+', ';
      insection:=false;
    end
    else if s[i]=' 'then
    begin
      if markerd then markerd:=false else if inmarker then marker:=marker+' 'else s2:=s2+' ';
    end
    else if s[i]='('then inmarker:=true
    else if s[i]=')'then
    begin
      oldm:=marker;
      while length(marker)>0 do
      begin
        if pos(',',marker)>0 then curm:=copy(marker,1,pos(',',marker)-1) else curm:=marker;
        delete(marker,1,length(curm));
        if (length(marker)>0) and (marker[1]=',') then delete(marker,1,1);
        markerd:=true;
        mm:=FindMark(curm);
        if mm=#00 then
        begin
          if (oldm='1') or (oldm='2') or (oldm='3') then insection:=true;
          s2:=s2+'('+oldm+')'; mm:=#00; markerd:=false;
          marker:='';
        end;
        if insection then mm:=#00;
        if mm<>#00 then mark:=mark+mm;
      end;
      marker:='';
      inmarker:=false;
    end else if inmarker then marker:=marker+s[i] else s2:=s2+s[i];
  end;
  if copy(s2,length(s2)-1,2)=', 'then delete(s2,length(s2)-1,2);
  s2:=trim(s2);
  result:=s2;
end;

{
We are too lazy to implement a proper FString version for ConvertEdictEntry,
especiall since it's only used in two cases now:
  1. When importing chinese dictionaries on Ansi
  2. When working with VERY OLD dictionaries which have no separate markers field.
In the second case, the articles are without exception stored in Ansi,
and in the first case we just don't have a multilingual chinese dic support yet.
}
function FConvertEdictEntry(const s:FString;var mark:TMarkers):FString;
begin
  Result := fstr(ConvertEdictEntry(string(fstrtouni(s)),mark))
end;

function EnrichDictEntry(const s:string;const mark:TMarkers):string;
var s2:string;
    i:integer;
    s3:string;
    mar1,marg,mars:string;
begin
  s2:=s;
  mar1:=''; marg:=''; mars:='';
  for i:=1 to length(mark) do
  begin
    s3:=GetMarkAbbr(mark[i]);
    if s3[1]='s'then mars:=mars+' '+UH_LBEG+s3+UH_LEND;
    if s3[1]='g'then marg:=marg+UH_LBEG+s3+UH_LEND+' ';
    if s3[1]='1'then mar1:=mar1+UH_LBEG+s3+UH_LEND+' ';
  end;
  result:=marg+mar1+s2+mars;
end;

function DropEdictMarkers(const s:string):string;
var lst, lcnt: integer;
  i: integer;
begin
 //Count entries
  lst := -1; //LBEG marker pos
  lcnt := 0;
  for i := 1 to Length(s) - 1 do
    if s[i]=UH_LBEG then
      lst := i
    else
    if (s[i]=UH_LEND) and (lst>=0) then begin
      Inc(lcnt, i-lst+1);
      lst := -1;
    end;

 //Allocate memory and process
  SetLength(Result, Length(s)-lcnt);
  lst := -1;
  lcnt := 0;
  for i := 1 to Length(s) - 1 do
    if s[i]=UH_LBEG then
      lst := i
    else
    if (s[i]=UH_LEND) and (lst>=0) then begin
      Inc(lcnt, i-lst+1);
      lst := -1;
    end else
    if lst>=0 then begin
     //skip char
    end else
      Result[i+lcnt] := s[i];
end;


initialization
{$IFDEF DEBUG}
  TestMarkersIntegrity;
{$ENDIF}

end.
