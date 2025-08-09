unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls, ExtCtrls, XPMan;


type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StatusBar1: TStatusBar;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button4: TButton;
    Button5: TButton;
    Bevel1: TBevel;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private-Deklarationen }

  public
    { Public-Deklarationen }
  end;



var
  Form1: TForm1;

type
  TWordTriple = Array[0..2] of Word;

function FileEncrypt(InFile, OutFile: String; Key: TWordTriple): boolean;
function FileDecrypt(InFile, OutFile: String; Key: TWordTriple): boolean;
function TextEncrypt(const s: string; Key: TWordTriple): string;
function TextDecrypt(const s: string; Key: TWordTriple): string;
function MemoryEncrypt(Src: Pointer; SrcSize: Cardinal; Target: Pointer; TargetSize: Cardinal; Key: TWordTriple): boolean;
function MemoryDecrypt(Src: Pointer; SrcSize: Cardinal; Target: Pointer; TargetSize: Cardinal; Key: TWordTriple): boolean;

implementation

{$R *.dfm}
function MemoryEncrypt(Src: Pointer; SrcSize: Cardinal; Target: Pointer; TargetSize: Cardinal; Key: TWordTriple): boolean;
var
  pIn, pOut: ^byte;
  i : Cardinal;
begin
  if SrcSize = TargetSize then
  begin
    pIn := Src;
    pOut := Target;
    Form1.ProgressBar1.Max := SrcSize;
    for i := 1 to SrcSize do
    begin
      pOut^ := pIn^ xor (Key[2] shr 8);
      Key[2] := Byte(pIn^ + Key[2]) * Key[0] + Key[1];
      inc(pIn);
      inc(pOut);
      Form1.ProgressBar1.Position := i;
    end;
    Result := True;
  end else
    Result := False;
end;

function MemoryDecrypt(Src: Pointer; SrcSize: Cardinal; Target: Pointer; TargetSize: Cardinal; Key: TWordTriple): boolean;
var
  pIn, pOut: ^byte;
  i : Cardinal;
begin
  if SrcSize = TargetSize then
  begin
    pIn := Src;
    pOut := Target;
    Form1.ProgressBar1.Max := SrcSize;
    for i := 1 to SrcSize do
    begin
      pOut^ := pIn^ xor (Key[2] shr 8);
      Key[2] := byte(pOut^ + Key[2]) * Key[0] + Key[1];
      inc(pIn);
      inc(pOut);
      Form1.ProgressBar1.Position := i;
    end;
    Result := True;
  end else
    Result := False;
end;

function TextCrypt(const s: string; Key: TWordTriple; Encrypt: Boolean): string;
var
  bOK: Boolean;
begin
  SetLength(Result, Length(s));
  if Encrypt then
    bOK := MemoryEncrypt(PChar(s), Length(s), PChar(Result), Length(Result), Key)
  else
    bOK := MemoryDecrypt(PChar(s), Length(s), PChar(Result), Length(Result), Key);
  if not bOK then Result := '';
end;

function FileCrypt(InFile, OutFile: String; Key: TWordTriple; Encrypt: Boolean): boolean;
var
  MIn, MOut: TMemoryStream;
begin
  MIn := TMemoryStream.Create;
  MOut := TMemoryStream.Create;
  Try
    MIn.LoadFromFile(InFile);
    MOut.SetSize(MIn.Size);
    if Encrypt then
      Result := MemoryEncrypt(MIn.Memory, MIn.Size, MOut.Memory, MOut.Size, Key)
    else
      Result := MemoryDecrypt(MIn.Memory, MIn.Size, MOut.Memory, MOut.Size, Key);
    MOut.SaveToFile(OutFile);
  finally
    MOut.Free;
    MIn.Free;
  end;
end;

function TextEncrypt(const s: string; Key: TWordTriple): string;
begin
  Result := TextCrypt(s, Key, True);
end;

function TextDecrypt(const s: string; Key: TWordTriple): string;
begin
  Result := TextCrypt(s, Key, False);
end;

function FileEncrypt(InFile, OutFile: String; Key: TWordTriple): boolean;
begin
  Result := FileCrypt(InFile, OutFile, Key, True);
end;

function FileDecrypt(InFile, OutFile: String; Key: TWordTriple): boolean;
begin
  Result := FileCrypt(InFile, OutFile, Key, False);
end;

procedure TForm1.Button1Click(Sender: TObject);
var Key : TWordTriple;
begin
  Key[0] := SpinEdit1.Value;
  Key[1] := SpinEdit2.Value;
  Key[2] := SpinEdit3.Value;
  StatusBar1.SimpleText := 'Crypting please wait...';
  FileEncrypt(Edit1.Text,Edit2.Text,Key);
  StatusBar1.SimpleText := 'Crypting done.';
  StatusBar1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var Key : TWordTriple;
begin
  Key[0] := SpinEdit1.Value;
  Key[1] := SpinEdit2.Value;
  Key[2] := SpinEdit3.Value;
  StatusBar1.SimpleText := 'Decrypting please wait...';
  FileDecrypt(Edit2.Text,Edit1.Text,Key);
  StatusBar1.SimpleText := 'Decrypting done.';
  StatusBar1.SetFocus;
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then begin
    if OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.FileName;
    Edit2.Text := OpenDialog1.FileName + '.crypt';
  end;

  if RadioGroup1.ItemIndex = 1 then begin
    if SaveDialog1.Execute then
    Edit1.Text := SaveDialog1.FileName;
  end;

  StatusBar1.SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then begin
  if SaveDialog1.Execute then Edit2.Text := SaveDialog1.FileName; end;

  if RadioGroup1.ItemIndex = 1 then begin
  if OpenDialog1.Execute then Edit2.Text := OpenDialog1.FileName; end;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   SpinEdit1.Value := Random(99);
   SpinEdit2.Value := Random(99);
   SpinEdit3.Value := Random(99);
   StatusBar1.SetFocus;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then begin
  Button3.Caption := 'Open';
  Button4.Caption := 'Save';
  Button1.Enabled := true;
  Button2.Enabled := false;
  Edit1.Clear; Edit2.Clear;
  Label4.Caption := 'Load any File to Crypt.';
  Label5.Caption := 'Save Crypted File.';
  end;

  if RadioGroup1.ItemIndex = 1 then begin
  Button4.Caption := 'Open';
  Button3.Caption := 'Save';
  Button2.Enabled := true;
  Button1.Enabled := false;
  Edit1.Clear; Edit2.Clear;
  Label4.Caption := 'Load Crypted File to Decrypt.';
  Label5.Caption := 'Save Decrypted File.';
  end;
  StatusBar1.SetFocus;
end;

end.
