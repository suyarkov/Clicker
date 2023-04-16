unit frmFirst;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons,
  DataSQLite, Vcl.DBCtrls, fmProfile, MainForm,
  FireDAC.Comp.DataSet, Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.Menus;

type
  TFirstForm = class(TForm)
    BitBtnOk: TBitBtn;
    ImageList1: TImageList;
    BitBtnAddProfile: TBitBtn;
    Button1: TButton;
    Label1: TLabel;
    ListBox1: TListBox;
    SQLDataSet1: TSQLDataSet;
    PopupMenu1: TPopupMenu;
    DelProfile: TMenuItem;
    EditProfile: TMenuItem;
    procedure BitBtnAddProfileClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DelProfileClick(Sender: TObject);
    procedure EditProfileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FirstForm: TFirstForm;

implementation

{$R *.dfm}

procedure TFirstForm.BitBtnAddProfileClick(Sender: TObject);
var
  vRes: integer;
begin
  vRes := ProfileForm.ShowModal;
  Button1Click(Sender);
end;

procedure TFirstForm.BitBtnOkClick(Sender: TObject);
begin
  FirstForm.Visible := false;
  Main.ShowModal();
  FirstForm.Visible := true;
end;

procedure TFirstForm.Button1Click(Sender: TObject);
var
  i: integer;
  results: TDataSet;
begin

  // Label1.Caption := SQLiteModule.ClickConnection.ExecSQLScalar
  // ('select name from Profile where id = :id', [1]);
  ListBox1.Items.Clear;
  try
    SQLiteModule.ClickConnection.ExecSQL('select NAME from Profile',
      nil, results);
  except
    on E: Exception do
      showmessage('Exception raised with message: ' + E.Message);
  end;
  // ListBox1.Items.Add('test');
  if not results.IsEmpty then
  begin
    results.First;
    while not results.Eof do
    begin

      ListBox1.Items.Add(results.FieldByName('Name').AsString);
      // myid:=results.FieldByName('ID').AsString;
      // mystart:=results.FieldByName('START ').AsInteger;
      // mystart:=results.Fields[1].AsInteger;
      results.Next;
    end;
    SQLiteModule.ClickConnection.Close;
  end;
  {
    if SQLiteModule.ClickConnection.Messages <> nil then
    for i := 0 to SQLiteModule.ClickConnection.Messages.ErrorCount - 1 do
    begin
    ListBox1.Items.Add(SQLiteModule.ClickConnection.Messages[i].Message);
    end;
    // Memo1.Lines.Add(FDConnection1.Messages[i].Message); }

end;

procedure TFirstForm.DelProfileClick(Sender: TObject);
begin
  //
  showmessage(ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TFirstForm.EditProfileClick(Sender: TObject);
var
  vRes: integer;
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    ProfileForm.Edit1.Text := ListBox1.Items[ListBox1.ItemIndex];
    ProfileForm.Edit2.Text := ListBox1.Items[ListBox1.ItemIndex];
    ProfileForm.Edit3.Text := ListBox1.Items[ListBox1.ItemIndex];
    vRes := ProfileForm.ShowModal;
    Button1Click(Sender);
  end;
end;

procedure TFirstForm.FormActivate(Sender: TObject);
begin
  // SQLiteModule.ClickConnection.Enable();
end;

procedure TFirstForm.FormShow(Sender: TObject);
begin
  Button1Click(Sender);
end;

end.
