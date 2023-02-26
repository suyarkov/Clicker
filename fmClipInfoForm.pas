unit fmClipInfoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TClipInfoForm = class(TForm)
    MemoClipName: TMemo;
    MemoClipInfo: TMemo;
    ButtonOk: TButton;
    procedure ButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClipInfoForm: TClipInfoForm;

implementation

{$R *.dfm}

procedure TClipInfoForm.ButtonOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
