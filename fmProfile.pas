unit fmProfile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, DataSQLite;

type
  TProfileForm = class(TForm)
    Yfbv: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProfileForm: TProfileForm;

implementation

{$R *.dfm}

procedure TProfileForm.BitBtnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TProfileForm.BitBtnOkClick(Sender: TObject);
var
  vQuery: string;

begin
  // сохраненние введенного
  vQuery := 'insert into profile (NAME, SIZE, MAINLNG)' + ' VALUES (''' +
    Edit1.Text + ''', ''' +  Edit2.Text +''', ''' + Edit3.Text + ''')';
  // vQuery := 'insert into profile (NAME, SIZE, MAINLNG) VALUES (''Проба 2'', ''333[34'', ''pl'')';
  SQLiteModule.ClickConnection.ExecSQL(vQuery);
  // SQLiteModule.ClickConnection.ExecSQL('select NAME from Profile', nil,  results);
  SQLiteModule.ClickConnection.Close;
  ModalResult := mrOk;
end;

procedure TProfileForm.FormShow(Sender: TObject);
begin
  if Edit2.Text = '' then
    Edit2.Text := IntToStr(screen.Width) + ' х ' + IntToStr(screen.Height);
end;

end.
