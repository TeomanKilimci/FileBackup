unit uDosyaYedekleThread;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, System.IOUtils, System.Types,
  System.Zip;

type
  TDosyaYedekleThread = class(TThread)
  private
    FFileMask: string;
    FSearchPath: string;
    FZipFileName: string;
    procedure BulVeZiple;
  protected
    procedure Execute; override;
    constructor Create(CreateSuspended: Boolean);
  public
    property FileMask: string read FFileMask write FFileMask;
    property SearchPath: string read FSearchPath write FSearchPath;
    property ZipFileName: string read FZipFileName write FZipFileName;
    class procedure DosyalariBulveZiple(const AZipFileName, ASearchPath, AFileMask: string);
  end;

implementation

{ TDosyaYedekleThread }

procedure TDosyaYedekleThread.BulVeZiple;
var
  FromPath, ToPath: string;
  FileList: TStringDynArray;
  LSearchOption: TSearchOption;
  I: Integer;
  AZipFile: TZipFile;
begin
  if not FileExists(ZipFileName) then
  begin
    LSearchOption := TSearchOption.soAllDirectories;
    FileList := TDirectory.GetFiles(SearchPath, FileMask, LSearchOption);

    if Length(FileList) > 0 then
    begin
      AZipFile := TZipFile.Create;
      try
        AZipFile.Open(ZipFileName, zmWrite);
        for I := 0 to Length(FileList) - 1 do
        begin
          FromPath := FileList[I];
          ToPath := copy(FromPath, Length(SearchPath) + 1, length(FromPath));
          ToPath := StringReplace(ToPath, '\', '/', [rfReplaceAll]);
          AZipFile.Add(FromPath, ToPath);
        end;
        AZipFile.Close;
      finally
        AZipFile.Free;
      end;
    end;
  end;

end;

procedure TDosyaYedekleThread.Execute;
begin
  try
    BulVeZiple;
  except
    on E: Exception do
    begin
      //
    end;
  end;
end;

constructor TDosyaYedekleThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  Self.FreeOnTerminate := True;
end;


class procedure TDosyaYedekleThread.DosyalariBulveZiple(const AZipFileName, ASearchPath, AFileMask: string);
var
  DosyaYedekleThread: TDosyaYedekleThread;
begin
  DosyaYedekleThread := TDosyaYedekleThread.Create(False);
  DosyaYedekleThread.SearchPath := ASearchPath;
  DosyaYedekleThread.ZipFileName := AZipFileName;
  DosyaYedekleThread.FileMask := AFileMask;
  DosyaYedekleThread.Resume;
end;

end.

