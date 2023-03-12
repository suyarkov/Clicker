unit fmProfile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, DataSQLite;

type
  TProfileForm = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
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
  {
    vQuery := 'insert into profile (NAME, SIZE, MAINLNG)'
    + ' VALUES (''' + Memo1.Text +
    ''', ' +  Memo2.Text +
    ''', ''' + Memo3.Text + ''')'; }
  vQuery := 'insert into profile (NAME, SIZE, MAINLNG) VALUES (''Проба 2'', ''333[34'', ''pl'')';
  SQLiteModule.ClickConnection.ExecSQL(vQuery);
  // SQLiteModule.ClickConnection.ExecSQL('select NAME from Profile', nil,  results);
  SQLiteModule.ClickConnection.Commit;
  ModalResult := mrOk;
end;

end.
