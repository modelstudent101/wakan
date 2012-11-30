unit MemSource;

interface

uses SysUtils, Classes, Forms, Controls, Dialogs;

const
  MemSource_verMajor=2;
  MemSource_verMinor=11;
  MemSource_verBuild=1;
  MemSource_date='25/02/2001';
  MemSource_copy='(C) LABYRINTH 1999-2001';

type
  EMemorySourceError=class(Exception);
  TMemoryLoadMode=(mlPermanentLoad, mlAutoLoad, mlDemandLoad, mlTemporaryLoad);
  TMemorySource=class;

  TMemoryFile=class
  private
    fLoadMode:TMemoryLoadMode;
    fLoaded:boolean;
    fLockCount:longint;
    fSize:longint;
    fFileName:string;
    fParent:TMemoryFile;
  protected
    Source:TMemorySource;
    Locator:variant;
    Stream:TMemoryStream;
    constructor Create( MSource:TMemorySource; MName:string; MSize:longint;
    const MLocator:variant; MLoadMode:TMemoryLoadMode; MParent:TMemoryFile );
    procedure Load;
    procedure Unload;
    procedure Refresh;
    procedure SetLoadMode( LM:TMemoryLoadMode );
    property LockCount:longint read fLockCount;
    property Loaded:boolean read fLoaded;
    property LoadMode:TMemoryLoadMode read fLoadMode write SetLoadMode;
    property Parent:TMemoryFile read fParent;
  public
    function Lock:TMemoryStream;
    procedure Unlock;
    procedure WriteToDisk(path:string);
    destructor Destroy; override;
    property Size:longint read fSize;
    property Name:string read fFileName;
    property Position:variant read Locator;
  end;
  TMemoryFileClass=class of TMemoryFile;

  TMemorySource=class
  private
    fFiles:TStringList;
    fDirectories:TList;
    fMemoryUsed,fMemoryFloor,fMemoryLimit,fMemoryCeiling:longint;
    fTree:TStringList;
    function GetFile( const Name:string ):TMemoryFile;
    procedure Add( Name:string;BF:TMemoryFile );
  protected
    procedure Fill( MFile:TMemoryFile; Stream:TStream ); virtual; abstract;
    procedure CreateTree;
  public
    constructor Create;
    destructor Destroy; override;
    function GetFileList:TStringList;
    procedure SetMemoryFloor( mFloor:longint );
    procedure SetMemoryLimit( mLimit:longint );
    procedure SetMemoryCeiling( mCeiling:longint );
    procedure RefreshAll;
    property Files[ const Name:string ]:TMemoryFile read GetFile; default;
    property MemoryFloor:longint read fMemoryFloor write SetMemoryFloor;
    property MemoryLimit:longint read fMemoryLimit write SetMemoryLimit;
    property MemoryCeiling:longint read fMemoryCeiling write SetMemoryCeiling;
    property MemoryUsed:longint read fMemoryUsed;
    property FileList:TStringList read GetFileList;
    property Tree:TStringList read fTree;
  end;
  TMemorySourceClass=class of TMemorySource;

  TPackageSource=class(TMemorySource)
  private
    PackageF:file;
    fCryptCode,fHeaderCode,fFileSysCode:longint;
    fFileName:string;
    fName:string;
    fActStart:longint;
  protected
    procedure Fill( MFile:TMemoryFile; Stream:TStream ); override;
  public
    procedure SetCryptCode( MCryptCode:longint );
    constructor Create( PKGFileName:string; MHeaderCode,MFileSysCode,MCryptCode:longint );
    destructor Destroy; override;
    property CryptCode:longint write SetCryptCode;
    property FileName:string read fFileName;
    property Name:string read fName;
    procedure ReadRawData(var x;position,length:integer);
  end;
  TPackageSourceClass=class of TPackageSource;

procedure PKG_EnableCryptedHeader;

implementation

type
  PKGHeader=packed record
    PKGTag:array[0..7] of AnsiChar;
    MemoryLimit:longint;
    HeaderLength:longint;
    PKGName:string[25];
  end;
  PKGFile=packed record
    PKGTag:array[0..3] of AnsiChar;
    FileName:string[128];
    FileExt:string[16];
    Directory:longint;
    LoadMode:byte;
    CryptMode:byte;
    PackMode:byte;
    CRCMode:byte;
    FileLength:longint;
    PackedLength:longint;
    HeaderCRC:byte;
  end;
  PKGCryptHeader=packed record
    PKGTag:array[0..2] of AnsiChar;
    MemoryLimit:longint;
    HeaderLength:longint;
  end;
  PKGCryptStarter=packed record
    ActualStart:longint;
    PKGTag:word;
  end;
  PKGHuffRec=record
    parent,bit1,bit0:integer;
    count:longint;
    active:boolean;
  end;
  PKGHuffArray=array[0..511] of PKGHuffRec;

var CryptedHeaderEnabled:boolean;

//      **********   MEMORY SOURCE   ***********

constructor TMemoryFile.Create( MSource:TMemorySource; MName:string; MSize:longint;
  const MLocator:variant; MLoadMode:TMemoryLoadMode; MParent:TMemoryFile );
function ComputeName(mf:TMemoryFile):string;
begin
  if mf.fParent<>nil then result:=ComputeName(mf.fParent)+mf.fFileName else
   result:=mf.fFileName;
end;
begin
  if MSource=nil then raise EMemorySourceError.Create('Unassigned memory source.');
  Source:=MSource;
  Locator:=MLocator;
  Stream:=nil;
  fSize:=MSize;
  fLoaded:=false;
  fLockCount:=0;
  fLoadMode:=MLoadMode;
  fFileName:=MName;
  fParent:=MParent;
  if MParent<>nil then
  Source.Add(ComputeName(MParent)+MName,self)
  else Source.Add(MName,self);
end;

destructor TMemoryFile.Destroy;
begin
  if LockCount>0 then raise EMemorySourceError.Create('Cannot destroy locked memory file ('+fFileName+').');
  Unload;
  inherited Destroy;
end;

procedure TMemoryFile.Load;
begin
  if Loaded then exit;
  Stream:=TMemoryStream.Create;
  Stream.SetSize(fSize);
  Source.Fill(self,Stream);
  Source.fMemoryUsed:=Source.fMemoryUsed+Size;
  fLoaded:=true;
  if Source.MemoryUsed>Source.MemoryLimit then
  begin
    //add temporary lock to prevent unloading
    fLockCount:=1;
    Source.RefreshAll;
    fLockCount:=0;
  end;
end;

procedure TMemoryFile.Unload;
begin
  if not Loaded then exit;
  if LockCount>0 then exit;
  Stream.Free;
  Source.fMemoryUsed:=Source.fMemoryUsed-Size;
  fLoaded:=false;
end;

procedure TMemoryFile.Refresh;
begin
  case LoadMode of
    mlPermanentLoad:
      begin
        if (not Loaded) and (Source.MemoryUsed+Size<Source.MemoryCeiling) then Load;
        if (Loaded) and (Source.MemoryUsed>Source.MemoryCeiling) then Unload;
      end;
    mlAutoLoad:
      begin
        if (not Loaded) and (Source.MemoryUsed+Size<Source.MemoryLimit) then Load;
        if (Loaded) and (Source.MemoryUsed>Source.MemoryLimit) then Unload;
      end;
    mlDemandLoad:
      begin
        if (not Loaded) and (Source.MemoryUsed+Size<Source.MemoryFloor) then Load;
        if (Loaded) and (Source.MemoryUsed>Source.MemoryLimit) then Unload;
      end;
    mlTemporaryLoad:
        if (Loaded) and (Source.MemoryUsed>Source.MemoryFloor) then Unload;
  end;
end;

procedure TMemoryFile.SetLoadMode( LM:TMemoryLoadMode );
begin
  fLoadMode:=LM;
  Refresh;
end;

function TMemoryFile.Lock:TMemoryStream;
begin
  if not Loaded then Load;
  fLockCount:=fLockCount+1;
  Stream.Seek(0,soFromBeginning);
  result:=Stream;
end;

procedure TMemoryFile.Unlock;
begin
  if fLockCount=0 then raise EMemorySourceError.Create('Cannot unlock already unlocked memory file.');
  fLockCount:=fLockCount-1;
  if fLockCount=0 then Refresh;
end;

procedure TMemoryFile.WriteToDisk(path:string);
var pt:string;
    FS:TFileStream;
    SL:TStringList;
    i:integer;
    s,fn,fns:string;
begin
  pt:=path;
  if (length(pt)<>0) and (pt[length(pt)]<>'\') then pt:=pt+'\';
  SL:=Source.FileList;
  SL.Sort;
  for i:=0 to SL.Count-1 do if Source[SL[i]]=self then fn:=SL[i];
  fns:=fn; if fns[length(fns)]='\' then delete(fns,length(fns),1);
  while (pos('\',fns)>0) do delete(fns,1,pos('\',fns));
  fns:=copy(fn,1,length(fn)-length(fns)-1);
  for i:=0 to SL.Count-1 do
    if (SL[i]=fn) or ((fn[length(fn)]='\') and (length(SL[i])>length(fn)) and
       (copy(SL[i],1,length(fn))=fn)) then
    begin
      s:=SL[i];
      if s[length(s)]='\' then
      begin
        {$I-} mkdir(copy(s,length(fns)+1,length(s)-length(fns))); {$I+} ioresult;
      end else
      begin
        FS:=TFileStream.Create(pt+copy(s,length(fns)+1,length(s)-length(fns)),fmCreate);
        Source.Fill(Source[s],FS);
        FS.Free;
      end;
    end;
  SL.Free;
end;

constructor TMemorySource.Create;
begin
  fMemoryUsed:=0;
  fMemoryFloor:=0;
  fMemoryCeiling:=1024*1024*32; // 32 MB standard ceiling
  fMemoryLimit:=1024*1024; // 1 MB standard limit
  fFiles:=TStringList.Create;
  fDirectories:=TList.Create;
  fTree:=TStringList.Create;
end;

destructor TMemorySource.Destroy;
var i:integer;
begin
  for i:=0 to fFiles.Count-1 do if fFiles.Objects[i]<>nil then
    TMemoryFile(fFiles.Objects[i]).Free;
  fFiles.Free;
  fDirectories.Free;
  inherited Destroy;
end;

function TMemorySource.GetFileList:TStringList;
var i:integer;
begin
  result:=TStringList.Create;
  for i:=0 to fFiles.Count-1 do
    if (length(fFiles[i])>0) and (fFiles[i][1]<>'$') then result.Add(fFiles[i]);
end;

procedure TMemorySource.CreateTree;
var tl,tt:TStringList;
    cp,ncp,nrd,xcp:string;
    i,j,id:integer;
begin
  tt:=TStringList.Create;
  tl:=GetFileList;
//  for i:=0 to tl.Count-1 do if tl[i][length(tl[i])]='\' then tl[i]:='!'+tl[i];
  tl.Sort;
//  for i:=0 to tl.Count-1 do if tl[i][1]='!' then tl[i]:=copy(tl[i],2,length(tl[i])-1);
  cp:='';
  for i:=0 to tl.Count-1 do
  begin
    id:=0;
    ncp:=cp; nrd:=tl[i];
    while ncp<>'' do
    begin
      xcp:=ncp; if pos('\',xcp)>0 then delete(xcp,pos('\',xcp),length(xcp)-pos('\',xcp)+1);
      if xcp=ncp then ncp:='' else
      begin
        delete(ncp,1,length(xcp)+1);
        if copy(nrd,1,length(xcp))=xcp then
        begin
          inc(id);
          delete(nrd,1,length(xcp)+1);
        end else ncp:='';
      end;
    end;
    for j:=1 to id do nrd:=#9+nrd;
    tt.Add(nrd);
    cp:=tl[i];
  end;
  tl.Free;
  fTree:=tt;
end;

function TMemorySource.GetFile( const Name:string ):TMemoryFile;
var foundno:integer;
begin
  if not fFiles.Find(Name,foundno) then
  begin
    result:=nil;
    exit;
  end;
  result:=TMemoryFile(fFiles.Objects[foundno]);
end;

procedure TMemorySource.Add( Name:string;BF:TMemoryFile );
var foundno:integer;
begin
  if fFiles.Find(Name,foundno) then raise EMemorySourceError.Create('Duplicate file name.');
  fFiles.InsertObject(foundno,Name,BF);
end;

procedure TMemorySource.SetMemoryFloor( mFloor:longint );
begin
  fMemoryFloor:=mFloor;
  RefreshAll;
end;

procedure TMemorySource.SetMemoryLimit( mLimit:longint );
begin
  fMemoryLimit:=mLimit;
  RefreshAll;
end;

procedure TMemorySource.SetMemoryCeiling( mCeiling:longint );
begin
  fMemoryCeiling:=mCeiling;
  RefreshAll;
end;

procedure TMemorySource.RefreshAll;
var i:longint;
begin
  if fMemoryUsed>fMemoryLimit then
    for i:=0 to fFiles.Count-1 do with TMemoryFile(fFiles.Objects[i]) do
      if LoadMode=mlTemporaryLoad then Refresh;
  if fMemoryUsed>fMemoryLimit then
    for i:=0 to fFiles.Count-1 do with TMemoryFile(fFiles.Objects[i]) do
      if LoadMode=mlDemandLoad then Refresh;
  if fMemoryUsed>fMemoryLimit then
    for i:=0 to fFiles.Count-1 do with TMemoryFile(fFiles.Objects[i]) do
      if LoadMode=mlAutoLoad then Refresh;
  if fMemoryUsed>fMemoryCeiling then
    for i:=0 to fFiles.Count-1 do with TMemoryFile(fFiles.Objects[i]) do
      if LoadMode=mlPermanentLoad then Refresh;
  if fMemoryUsed<fMemoryCeiling then
    for i:=0 to fFiles.Count-1 do with TMemoryFile(fFiles.Objects[i]) do
      if LoadMode=mlPermanentLoad then Refresh;
  if fMemoryUsed<fMemoryLimit then
    for i:=0 to fFiles.Count-1 do with TMemoryFile(fFiles.Objects[i]) do
      if LoadMode=mlAutoLoad then Refresh;
  if fMemoryUsed<fMemoryFloor then
    for i:=0 to fFiles.Count-1 do with TMemoryFile(fFiles.Objects[i]) do
      if LoadMode=mlDemandLoad then Refresh;
  if fMemoryUsed<fMemoryFloor then
    for i:=0 to fFiles.Count-1 do with TMemoryFile(fFiles.Objects[i]) do
      if LoadMode=mlTemporaryLoad then Refresh;
end;

//      **********   PACKAGE SOURCE   ***********

constructor TPackageSource.Create( PKGFileName:string; MHeaderCode,MFileSysCode,MCryptCode:longint );
var ph:PKGHeader;
    pcs:PKGCryptStarter;
    pch:PKGCryptHeader;
    pf:PKGFile;
    reat:longint;
    b:byte;
    loc:longint;
    pkghfarr:array[1..sizeof(PKGFile)*2] of byte;
    i:integer;
    crc:byte;
    lm:TMemoryLoadMode;
    lng:longint;
    pft:array[0..5] of AnsiChar;
    savecurs:TCursor;
    totfsize:longint;
    mf:TMemoryFile;
    s:string;
    cryptedheader:boolean;
function corr(s:string):string;
var j:integer;
begin
  randseed:=fFileSysCode+totfsize;
  result:='';
  for j:=1 to length(s) do
    case s[j] of
      'A'..'Z':result:=result+chr((((ord(s[j])-ord('A'))+random(26)) mod 26)+ord('A'));
      'a'..'z':result:=result+chr((((ord(s[j])-ord('a'))+random(26)) mod 26)+ord('a'));
    else result:=result+s[j];
  end;
end;
begin
  inherited Create;
  savecurs:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
  // open package file and read header
  assignfile(PackageF,PKGFileName);
  try
    filemode:=0;
    reset(PackageF,1);
  except
    raise EMemorySourceError.Create('Unable to open package file '+PKGFileName+'. Error: '+(ExceptObject as Exception).Message);
  end;
  blockread(PackageF,ph,sizeof(ph),reat);
  if reat<sizeof(ph) then raise EMemorySourceError.Create('Package file is corrupt (#1).');
  if (ph.PKGTag[5]<>'.') and (CryptedHeaderEnabled) then
  begin
    cryptedheader:=true;
    seek(PackageF,FileSize(PackageF)-sizeof(pcs));
    blockread(PackageF,pcs,sizeof(pcs),reat);
    if pcs.pkgtag<>65279 then raise EMemorySourceError.Create('Unrecognized package file format.');
    seek(PackageF,pcs.ActualStart);
    blockread(PackageF,pch,sizeof(pch),reat);
    if reat<sizeof(pch) then raise EMemorySourceError.Create('Package file is corrupt (#1).');
    if (pch.PKGTag[0]<>'g') then raise EMemorySourceError.Create('Unrecognized package file format.');
    if (pch.PKGTag[1]<>'2') then raise EMemorySourceError.Create('Package file major version is not supported.');
    if (pch.PKGTag[2]<>'1') then raise EMemorySourceError.Create('Package file minor version is not supported.');
    fName:='Confidential';
    fFileName:=PKGFileName;
    fMemoryLimit:=pch.MemoryLimit;
    fFileSysCode:=MFileSysCode;
    fCryptCode:=MCryptCode;
    fHeaderCode:=MHeaderCode;
    seek(PackageF,filepos(PackageF)+pch.HeaderLength);
  end else
  begin
    cryptedheader:=false;
    if (ph.PKGTag[0]<>'P') or (ph.PKGTag[1]<>'K') or (ph.PKGTag[2]<>'G')
      or (ph.PKGTag[3]<>'v') or (ph.PKGTag[5]<>'.') then
        raise EMemorySourceError.Create('Unrecognized package file format.');
    if (ph.PKGTag[4]<>'2') then raise EMemorySourceError.Create('Package file major version is not supported.');
    if (ph.PKGTag[6]<>'1') then raise EMemorySourceError.Create('Package file minor version is not supported.');
    fName:=ph.PKGName;
    fFileName:=PKGFileName;
    fMemoryLimit:=ph.MemoryLimit;
    fFileSysCode:=MFileSysCode;
    fCryptCode:=MCryptCode;
    fHeaderCode:=MHeaderCode;
    seek(PackageF,sizeof(ph)+ph.HeaderLength);
  end;
  // read file headers and register files
  blockread(PackageF,b,1,reat);
  if reat<1 then raise EMemorySourceError.Create('Package file is corrupt (#3).');
  if (b<>125) and (b<>233) then raise EMemorySourceError.Create('Package file is corrupt (#4).');
  totfsize:=123;
  fActStart:=filepos(PackageF);
  while b=125 do
  begin
    totfsize:=123-fActStart+filepos(PackageF);
    loc:=filepos(PackageF);
    blockread(PackageF,pkghfarr,sizeof(pkghfarr),reat);
    if reat<sizeof(pkghfarr) then raise EMemorySourceError.Create('Package file is corrupt (#5).');
    randseed:=totfsize+fHeaderCode;
    for i:=1 to sizeof(pkghfarr) do pkghfarr[i]:=pkghfarr[i] xor random(256);
    for i:=1 to sizeof(pf) do
      pkghfarr[i]:=pkghfarr[i*2];
    crc:=0;
    for i:=1 to sizeof(pf)-1 do crc:=crc+pkghfarr[i];
    move(pkghfarr,pf,sizeof(pf));
    if (crc<>pf.HeaderCRC) then raise EMemorySourceError.Create('Package file is corrupt or incorrect header code.');
    if (pf.PKGtag[0]<>'P') or (pf.PKGtag[1]<>'K') or (pf.PKGtag[2]<>'G') or (pf.PKGtag[3]<>'F') then
      raise EMemorySourceError.Create('Package file is corrupt (#7).');
    lm:=mlAutoLoad;;
    case pf.LoadMode of
      0:lm:=mlPermanentLoad;
      1:lm:=mlAutoLoad;
      2:lm:=mlDemandLoad;
      3:lm:=mlTemporaryLoad;
      else raise EMemorySourceError.Create('Unsupported load mode in package file.');
    end;
    if fDirectories.Count<=pf.Directory then EMemorySourceError.Create('Package file is corrupt (#13).');
    pf.FileName:=corr(pf.FileName); if pf.FileExt<>'*DIR*' then pf.FileExt:=corr(pf.FileExt);
    if pf.FileExt='*DIR*' then s:=pf.FileName+'\' else s:=pf.FileName+'.'+pf.FileExt;
    if pf.Directory=0 then
      mf:=TMemoryFile.Create(self,s,pf.FileLength,loc,lm,nil) else
      mf:=TMemoryFile.Create(self,s,pf.FileLength,loc,lm,fDirectories[pf.Directory-1]);
    if pf.FileExt='*DIR*' then fDirectories.Add(mf);
    lng:=0;
    case pf.CRCMode of
      0:lng:=pf.PackedLength;
      1:lng:=pf.PackedLength+(((pf.PackedLength-1) div 2000)+1)*4;
      else raise EMemorySourceError.Create('Unsupported CRC mode in package file.');
    end;
    if pf.FileLength=0 then lng:=0;
    seek(PackageF,loc+sizeof(pkghfarr)+lng);
    blockread(PackageF,b,1,reat);
    if reat<1 then raise EMemorySourceError.Create('Package file is corrupt (#3).');
    if (b<>125) and (b<>233) then raise EMemorySourceError.Create('Package file is corrupt (#4).');
  end;
  if not cryptedheader then
  begin
    blockread(PackageF,pft,sizeof(pft),reat);
    if reat<sizeof(pft) then raise EMemorySourceError.Create('Package file is corrupt (#8).');
    if pft<>'PKGEOF' then raise EMemorySourceError.Create('Package file is corrupt (#9).');
  end;
  seek(PackageF,0);
  RefreshAll;
  CreateTree;
  finally
  Screen.Cursor:=savecurs;
  end;
end;

destructor TPackageSource.Destroy;
begin
  try
    closefile(PackageF);
  except end;
  inherited Destroy;
end;

procedure TPackageSource.Fill( MFile:TMemoryFile; Stream:TStream );
procedure CalculateHuffmanCode(var ha:PKGHuffArray);
var actcnt:word;
    lasthuff:word;
    max1n,max2n:integer;
    max1,max2:longint;
    i:integer;
begin
  actcnt:=256;
  lasthuff:=255;
  for i:=0 to 511 do ha[i].active:=false;
  for i:=0 to 255 do
  begin
    ha[i].parent:=-1; ha[i].bit1:=-1; ha[i].bit0:=-1;
    ha[i].active:=true;
  end;
  while actcnt>1 do
  begin
    max1:=-1;
    max2:=-1;
    max1n:=0;
    max2n:=0;
    for i:=0 to lasthuff do
    begin
      if ha[i].active then
      begin
        if (max1=-1) or (ha[i].count<max1) then
        begin
          max2:=max1;
          max2n:=max1n;
          max1:=ha[i].count;
          max1n:=i;
        end else if (max2=-1) or (ha[i].count<max2) then
        begin
          max2:=ha[i].count;
          max2n:=i;
        end;
      end;
    end;
    inc(lasthuff);
    ha[max1n].parent:=lasthuff;
    ha[max1n].active:=false;
    ha[max2n].parent:=lasthuff;
    ha[max2n].active:=false;
    ha[lasthuff].count:=ha[max1n].count+ha[max2n].count;
    ha[lasthuff].active:=true;
    ha[lasthuff].bit0:=max1n;
    ha[lasthuff].bit1:=max2n;
    ha[lasthuff].parent:=-1;
    dec(actcnt);
  end;
end;
var pf:PKGFile;
    reat:longint;
    b:byte;
    pkghfarr:array[1..sizeof(PKGFile)*2] of byte;
    i:integer;
    crc,testcrc:cardinal;
    actread,curread:longint;
    buf:array[1..2000] of byte;
    huffbuf:array[1..16000] of byte;
    rotbuf:array[1..2048] of byte;
    totfsize:longint;
    Huff:PKGHuffArray;
    HuffReat:boolean;
    bufpos,huffpos,huffroot,huffwrote,huffbufpos,rotbufpos,rotbufsrc:integer;
    state:integer;
    bitmul,inbitmul:byte;
    curbit:boolean;
    countdiff,countlen:integer;
begin
  if MFile=nil then exit;
  HuffReat:=false;
  HuffWrote:=0;
  seek(PackageF,longint(MFile.Locator));
  totfsize:=MFile.Locator-fActStart+123;
  blockread(PackageF,pkghfarr,sizeof(pkghfarr),reat);
  if reat<sizeof(pkghfarr) then raise EMemorySourceError.Create('Package file is corrupt (#5).');
  randseed:=totfsize+fHeaderCode;
  for i:=1 to sizeof(pkghfarr) do pkghfarr[i]:=pkghfarr[i] xor random(256);
  for i:=1 to sizeof(pf) do
    pkghfarr[i]:=pkghfarr[i*2];
  move(pkghfarr,pf,sizeof(pf));
  actread:=0;
  totfsize:=totfsize+1+sizeof(pkghfarr);
  randseed:=fCryptCode+totfsize;
  while actread<pf.PackedLength do
  begin
    curread:=pf.PackedLength-actread;
    if curread>2000 then curread:=2000;
    blockread(PackageF,buf,curread,reat);
    if reat<curread then raise EMemorySourceError.Create('Package file is corrupt (#10).');
    case pf.CRCMode of
      0:begin end;
      1:begin
          crc:=0;
          for i:=1 to curread do crc:=(crc+(buf[i] xor i)) mod 12345678;
          blockread(PackageF,testcrc,sizeof(testcrc),reat);
          if reat<sizeof(testcrc) then raise EMemorySourceError.Create('Package file is corrupt (#11).');
          if testcrc<>crc then raise EMemorySourceError.Create('Package file is corrupt (#12).');
        end;
      else raise EMemorySourceError.Create('Unsupported CRC mode.');
    end;
    case pf.CryptMode of
      0:begin end;
      1:begin
          randseed:=fCryptCode+random(1000);
          for i:=1 to curread do buf[i]:=buf[i] xor random(256);
        end;
      2:for i:=1 to curread do buf[i]:=buf[i] xor ((fCryptCode*i) mod 256);
      else raise EMemorySourceError.Create('Unsupported crypt mode.');
    end;
    case pf.PackMode of
      0:Stream.Write(buf,curread);
      1:begin
          bufpos:=1;
          huffbufpos:=1;
          if not HuffReat then
          begin
            for i:=0 to 255 do Huff[i].count:=0;
            while buf[bufpos]=1 do
            begin
              inc(bufpos);
              move(buf[bufpos+1],Huff[buf[bufpos]].count,4);
              inc(bufpos,5);
            end;
//            if buf[bufpos]<>0 then raise EMemorySourceError.Create('Invalid huffman table.');
            CalculateHuffmanCode(Huff);
            for i:=0 to 511 do if Huff[i].active then huffroot:=i;
            huffpos:=huffroot;
            inc(bufpos);
            HuffReat:=true;
          end;
          while (bufpos<=curread) and (HuffWrote<pf.FileLength) do
          begin
            bitmul:=1;
            repeat
              if (buf[bufpos] and bitmul)>0 then
                huffpos:=Huff[huffpos].bit1 else huffpos:=Huff[huffpos].bit0;
              if (Huff[huffpos].bit0=-1) then
              begin
                huffbuf[huffbufpos]:=huffpos;
                inc(huffbufpos);
                huffpos:=huffroot;
                inc(HuffWrote);
              end;
              bitmul:=bitmul*2;
            until (bitmul=0) or (HuffWrote=pf.FileLength);
            inc(bufpos);
          end;
          Stream.Write(huffbuf,huffbufpos-1);
        end;
      2:begin
          bufpos:=1;
          huffbufpos:=1;
          if not HuffReat then
          begin
            for i:=0 to 255 do Huff[i].count:=0;
            while buf[bufpos]=1 do
            begin
              inc(bufpos);
              move(buf[bufpos+1],Huff[buf[bufpos]].count,4);
              inc(bufpos,5);
            end;
//            if buf[bufpos]<>0 then raise EMemorySourceError.Create('Invalid huffman table.');
            CalculateHuffmanCode(Huff);
            for i:=0 to 511 do if Huff[i].active then huffroot:=i;
            huffpos:=huffroot;
            inc(bufpos);
            HuffReat:=true;
            rotbufpos:=1;
            state:=1;
          end;
          while (bufpos<=curread) and (HuffWrote<pf.FileLength) do
          begin
            bitmul:=1;
            repeat
              curbit:=(buf[bufpos] and bitmul)>0;
              case state of
                1:begin
                    countdiff:=0;
                    countlen:=0;
                    if curbit then state:=3 else state:=2;
                  end;
                2:begin
                    if curbit then huffpos:=Huff[huffpos].bit1 else huffpos:=Huff[huffpos].bit0;
                    state:=2;
                    if (Huff[huffpos].bit0=-1) then
                    begin
                      huffbuf[huffbufpos]:=huffpos;
                      inc(huffbufpos);
                      rotbuf[rotbufpos]:=huffpos;
                      inc(rotbufpos);
                      if rotbufpos>2048 then rotbufpos:=1;
                      if huffbufpos>15000 then
                      begin
                        Stream.Write(huffbuf,huffbufpos-1);
                        huffbufpos:=1;
                      end;
                      huffpos:=huffroot;
                      state:=1;
                      inc(HuffWrote);
                    end;
                  end;
                3:if curbit then inc(countdiff,128) else
                  begin
                    state:=4;
                    inbitmul:=64;
                  end;
                4:begin
                    if curbit then inc(countdiff,inbitmul);
                    inbitmul:=inbitmul div 2;
                    if inbitmul=0 then
                    begin
                      inbitmul:=128;
                      state:=5;
                    end;
                  end;
                5:begin
                    if curbit then inc(countlen,inbitmul);
                    inbitmul:=inbitmul div 2;
                    if inbitmul=0 then
                    begin
                      countlen:=countlen+4;
                      if rotbufpos<=countdiff then rotbufsrc:=2048-countdiff+rotbufpos else rotbufsrc:=rotbufpos-countdiff;
                      while countlen>0 do
                      begin
                        huffbuf[huffbufpos]:=rotbuf[rotbufsrc];
                        inc(huffbufpos);
                        rotbuf[rotbufpos]:=rotbuf[rotbufsrc];
                        inc(rotbufpos);
                        if rotbufpos>2048 then rotbufpos:=1;
                        inc(rotbufsrc);
                        if rotbufsrc>2048 then rotbufsrc:=1;
                        if huffbufpos>15000 then
                        begin
                          Stream.Write(huffbuf,huffbufpos-1);
                          huffbufpos:=1;
                        end;
                        dec(countlen);
                        inc(HuffWrote);
                      end;
                      state:=1;
                    end;
                  end;
              end;
              bitmul:=bitmul*2;
            until (bitmul=0) or (HuffWrote=pf.FileLength);
            inc(bufpos);
          end;
          Stream.Write(huffbuf,huffbufpos-1);
        end;
      else raise EMemorySourceError.Create('Unsupported pack mode.');
    end;
    actread:=actread+curread;
  end;
  blockread(PackageF,b,1,reat);
  if reat<1 then raise EMemorySourceError.Create('Package file is corrupt (#3).');
  if (b<>125) and (b<>233) then raise EMemorySourceError.Create('Package file is corrupt (#4).');
end;

procedure TPackageSource.ReadRawData(var x;position,length:integer);
begin
  seek(packagef,position+sizeof(pkgfile)*2);
  blockread(packagef,x,length);
end;

procedure TPackageSource.SetCryptCode( MCryptCode:longint );
begin
  fCryptCode:=MCryptCode;
end;

procedure PKG_EnableCryptedHeader;
begin
  CryptedHeaderEnabled:=true;
end;

begin
  CryptedHeaderEnabled:=false;
end.
