unit fmListLanguages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Data.DB, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfLanguages = class(TForm)
    LanguagesGrid: TStringGrid;
    DataSource1: TDataSource;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    Label1: TLabel;
    LabelCount: TLabel;
    Label2: TLabel;
    LabelActiv: TLabel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure LanguagesGridDblClick(Sender: TObject);
    procedure LabelActivClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LanguagesGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
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

procedure TfLanguages.FormShow(Sender: TObject);
begin
  LabelActiv.OnClick(Sender);
end;

procedure TfLanguages.LabelActivClick(Sender: TObject);
var
  i, vCount: Integer;
begin
  vCount := 0;
  for i := 1 to LanguagesGrid.RowCount - 1 do
  begin
    if LanguagesGrid.Cells[4, i] = '1' then
      vCount := vCount + 1;
  end;
  LabelActiv.Caption := IntToStr(vCount);
  LabelCount.Caption := IntToStr(LanguagesGrid.RowCount - 1);
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

  LabelActiv.OnClick(Sender);
end;

procedure TfLanguages.LanguagesGridDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  var vRect: TRect;
begin
  vRect.Create(Rect.Left,Rect.Top,Rect.Left+25,Rect.Top+25);
  if (ACol = 4) or (ACol = 5) then
  begin
    if (LanguagesGrid.Cells[4, ARow] = '1') then
    begin
      LanguagesGrid.Canvas.StretchDraw(vRect, Image1.Picture.Graphic);
    end;
  end;

end;

end.
