unit fmClipInfoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TClipInfoForm = class(TForm)
    MemoClipInfo: TMemo;
    ButtonOk: TButton;
    EditClipName: TEdit;
    Label1: TLabel;
    LabelClipInfo: TLabel;
    ButtonCancel: TButton;
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClipInfoForm: TClipInfoForm;

implementation

{$R *.dfm}

procedure TClipInfoForm.ButtonCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TClipInfoForm.ButtonOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
