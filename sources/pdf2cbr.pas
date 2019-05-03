unit pdf2cbr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, FileCtrl, ExtCtrls, XPMan, ComCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    Edit3: TEdit;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt4: TEdit;
    lbl7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
   private
    { Private declarations }

  public
    { Public declarations }


  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure ExecNewProcess(ProgramName : String; Wait: Boolean);
var
  StartInfo : TStartupInfo;
  ProcInfo : TProcessInformation;
  CreateOK : Boolean;
begin
  FillChar(StartInfo,SizeOf(TStartupInfo),#0);
  FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
  StartInfo.cb := SizeOf(TStartupInfo);
  StartInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  StartInfo.wShowWindow := SW_HIDE;

  CreateOK := CreateProcess(nil, PChar(ProgramName), nil, nil,False,
              CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS,
              nil, nil, StartInfo, ProcInfo);
  if CreateOK then
    begin
      if Wait then
        WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    end
  else
    begin
      ShowMessage('Impossível Executar '+ProgramName);
     end;
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
end;



procedure TForm1.BitBtn1Click(Sender: TObject);

var
  arqtoconvert : string;
  prefixo : string;
  nomesaida : string;
  Cmd_Line : string;
  i : integer;

begin
  if fileListBox1.SelCount > 1 then
    begin
     for i := 0 to fileListBox1.SelCount -1 do
     begin
       arqtoconvert := FileListBox1.Items[i];
       prefixo := FileListBox1.Items[i];

       if (edt4.Text <> '') then
       begin
         nomesaida := copy(arqtoconvert, 1, StrToInt(edt4.Text))
       end
       else
       begin
         nomesaida := edit3.Text + IntToStr(i)
       end;

       Cmd_Line := 'pdfimages -j ' + '"' + arqtoconvert + '"' + ' ' + '"' + prefixo + '"';
       ExecNewProcess( cmd_line, true );  {True = espera, false = continua }
       ProgressBar1.Position := 30;
       Cmd_Line := 'rar a ' + '"' + nomesaida + '"' + '.cbr' + ' *.jpg';
       ExecNewProcess( cmd_line, true );  {True = espera, false = continua }
       ProgressBar1.Position := 80;
       if CheckBox1.Checked = True then
         begin
            Cmd_Line := 'cmd /c del *.jpg';
            ExecNewProcess( cmd_line, true );  {True = espera, false = continua }
            ProgressBar1.Position := 90;
         end;
       if CheckBox2.Checked = True then
         begin
           DeleteFile(arqtoconvert);
           ProgressBar1.Position := 95;
         end;
     end;
    end
  else
    begin
      arqtoconvert := edit1.Text;
      prefixo := edit2.Text;
      nomesaida := edit3.Text;
      Cmd_Line := 'pdfimages -j ' + '"' + arqtoconvert + '"' + ' ' + '"' + prefixo + '"';
      ExecNewProcess( cmd_line, true );  {True = espera, false = continua }
      ProgressBar1.Position := 30;
      Cmd_Line := 'rar a ' + '"' + nomesaida + '"' + '.cbr' + ' *.jpg';
      ExecNewProcess( cmd_line, true );  {True = espera, false = continua }
      ProgressBar1.Position := 80;
      if CheckBox1.Checked = True then
        begin
           Cmd_Line := 'cmd /c del *.jpg';
           ExecNewProcess( cmd_line, true );  {True = espera, false = continua }
           ProgressBar1.Position := 90;
        end;
      if CheckBox2.Checked = True then
        begin
          DeleteFile(arqtoconvert);
          ProgressBar1.Position := 95;
          edit1.Text := '*.pdf';
          edit2.Text := '';
          edit3.Text := '';
      end;
    end;
    ProgressBar1.Position := 100;
    ShowMessage('Concluído. Selecione outro(s) arquivos.');
    FileListBox1.Mask := '*.*';
    FileListBox1.Mask := '*.pdf';
    edit2.Text := '';
    edit3.Text := '';
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
    edit2.Text := edit1.Text;
    ProgressBar1.Position := 0;
end;

procedure TForm1.FileListBox1Click(Sender: TObject);
begin
  label5.Caption := inttostr(fileListBox1.SelCount);
  if fileListBox1.SelCount = 1 then
  begin
       edit1.Enabled := True;
       edit2.Enabled := True;
       edit3.Enabled := True;
       edit1.Text := FileListBox1.Items[0];
       edit2.Text := edit1.Text;
       edit3.Text := edit1.Text;
  end
  else
  begin
       edit1.Text := 'Auto';
       edit1.Enabled := False;
       edit2.Enabled := False;
  end;
  ProgressBar1.Position := 0;
end;


procedure TForm1.FileListBox1Change(Sender: TObject);
begin
  if fileListBox1.SelCount > 1 then
  begin
       edit1.Text := 'Auto';
       edit1.Enabled := False;
       edit2.Enabled := False;
  end
end;

end.

