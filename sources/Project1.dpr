program Project1;

uses
  Forms,
  pdf2cbr in 'pdf2cbr.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PDF2CBR';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
