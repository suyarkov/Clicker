program Translater;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Main},
  uLanguages in 'uLanguages.pas',
  uCodeKey in 'uCodeKey.pas',
  uTranslate in 'uTranslate.pas',
  fmClipInfoForm in 'fmClipInfoForm.pas' {ClipInfoForm},
  uTasks in 'uTasks.pas',
  fmProfile in 'fmProfile.pas' {ProfileForm},
  fmListLanguages in 'fmListLanguages.pas' {fLanguages};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TClipInfoForm, ClipInfoForm);
  Application.CreateForm(TProfileForm, ProfileForm);
  Application.CreateForm(TfLanguages, fLanguages);
  Application.Run;
end.
