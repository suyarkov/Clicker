unit fmListLanguages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids;

type
  TfLanguages = class(TForm)
    LanguagesGrid: TStringGrid;
    procedure FormActivate(Sender: TObject);
///    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
 //   function Set() integer;
  end;

var
  fLanguages: TfLanguages;

implementation

{$R *.dfm}



procedure TfLanguages.FormActivate(Sender: TObject);
begin
//
end;

end.
