unit fmListLanguages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Data.DB, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfLanguages = class(TForm)
    LanguagesGrid: TStringGrid;
    DataSource1: TDataSource;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure LanguagesGridDblClick(Sender: TObject);
    /// procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    // function Set() integer;
  end;

var
  fLanguages: TfLanguages;

implementation

{$R *.dfm}

procedure TfLanguages.ButtonCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfLanguages.ButtonOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfLanguages.LanguagesGridDblClick(Sender: TObject);
begin
  if LanguagesGrid.Row > 0 then
  begin

    if LanguagesGrid.Cells[4, LanguagesGrid.Row] = '0' then
    begin
      LanguagesGrid.Cells[4, LanguagesGrid.Row] := '1'
    end
    else
    begin
      LanguagesGrid.Cells[4, LanguagesGrid.Row] := '0'
    end;
  end;

end;

end.
