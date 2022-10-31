unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, System.IOUtils, System.Types, System.Zip;

type
  TForm1 = class(TForm)
    edtPath: TEdit;
    edtFileMask: TEdit;
    btn2: TButton;
    edtSearchPath: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  uDosyaYedekleThread;

procedure TForm1.btn2Click(Sender: TObject);
var
  ZipFileName: string;
  SearchPath: string;
  FileMask: string;
begin
  ZipFileName := edtPath.Text + 'DataBackup_' + FormatDateTime('yyyy_mm_dd', Now) + '.zip';
  SearchPath := edtSearchPath.Text;
  FileMask := edtFileMask.Text;
  TDosyaYedekleThread.DosyalariBulveZiple(ZipFileName, SearchPath, FileMask);
end;

end.

