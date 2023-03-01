program Translater;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Main},
  uLanguages in 'uLanguages.pas',
  uCodeKey in 'uCodeKey.pas',
  uTranslate in 'uTranslate.pas',
  fmClipInfoForm in 'fmClipInfoForm.pas' {ClipInfoForm},
  uTasks in 'uTasks.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TClipInfoForm, ClipInfoForm);
  Application.Run;
end.
