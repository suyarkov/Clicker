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
  fmListLanguages in 'fmListLanguages.pas' {fLanguages},
  Vcl.Themes,
  Vcl.Styles,
  frmFirst in 'frmFirst.pas' {FirstForm},
  DataSQLite in 'DataSQLite.pas' {SQLiteModule: TDataModule},
  Unit1 in 'Unit1.pas' {EditProfileForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Silver');
  Application.CreateForm(TFirstForm, FirstForm);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TClipInfoForm, ClipInfoForm);
  Application.CreateForm(TProfileForm, ProfileForm);
  Application.CreateForm(TfLanguages, fLanguages);
  Application.CreateForm(TSQLiteModule, SQLiteModule);
  Application.CreateForm(TEditProfileForm, EditProfileForm);
  Application.Run;
end.
