unit MainForm;

interface

uses
  uCodeKey, uLanguages,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

// ���������, ������������, �����, ���������� ������, �������� ���� ������.
type
  TProfile = record
    Id: integer;
    Name: string;
    MainLanguage: string;
    LanguagesTranslation: string;
    ScreenResolution: string;
  end;

type
  TRecord = record
    TypeComand: integer;
    IntPar1: integer;
    IntPar2: integer;
    StrPar1: string;
  end;

type
  TMain = class(TForm)
    MemoClipName: TMemo;
    MemoClipInfo: TMemo;
    LabelClipName: TLabel;
    LabelClipInfo: TLabel;
    EditCountNameLetters: TEdit;
    EditCountInfoLetters: TEdit;
    ButtonStep1: TButton;
    ButtonStep2: TButton;
    ButtonStep3: TButton;
    LabelCountLanguages: TLabel;
    LabelMainLanguage: TLabel;
    LoadTask: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Start: TButton;
    Label2: TLabel;
    CountRepeatCicleEdit: TEdit;
    TestButton: TButton;
    GetXYMouse: TButton;
    XYMouse: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure MemoClipNameChange(Sender: TObject);
    procedure MemoClipInfoChange(Sender: TObject);
    procedure LoadTaskClick(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure TestButtonClick(Sender: TObject);
    procedure ButtonStep1Click(Sender: TObject);
    procedure GetXYMouseClick(Sender: TObject);
    procedure ButtonStep2Click(Sender: TObject);
  private
    { Private declarations }
    Profile: TProfile;  // ��������� ������� ��� ������ ����������, ������ �������.
    ListLanguages: TListLanguages; // ������ ���� ��������� ������ � �������
    vTmpX, vTmpY: integer;  // ���������� ����� ��� �� ���������
    Rec: Array [1 .. 1000] of TRecord; // ������ ��� ��������, ��������� �� �����
    CountRec: integer; // ���������� ��������
    CountRepeatCicle: integer; // ���������� ������ ��������

    procedure RecordFree(var pRecord: TRecord);
    procedure RecFree(var pRec: Array of TRecord; var pCountRec: integer);

    procedure GridFree(var pGrid: TStringGrid);

    procedure MemoToRec(pMemo: TMemo; var pRec: Array of TRecord;
      var pCountRec: integer);

    procedure RecToMemo(pRec: Array of TRecord; pCountRec: integer;
      var pMemo: TMemo);
    procedure  Delay(dwMilliseconds: Longint);
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.RecordFree(var pRecord: TRecord);
begin
  pRecord.TypeComand := 0;
  pRecord.IntPar1 := 0;
  pRecord.IntPar2 := 0;
  pRecord.StrPar1 := '';
end;

function ProfileGet(pId: integer): TProfile;
var
  vProfile: TProfile;
begin
  vProfile.Id := 1;
  vProfile.Name := '��������';
  vProfile.MainLanguage := '/pl';
  vProfile.LanguagesTranslation := '/ru/en';
  vProfile.ScreenResolution := '1366 � 768';
  ProfileGet := vProfile;
end;

procedure TMain.RecFree(var pRec: Array of TRecord; var pCountRec: integer);
var
  i: integer;
begin
  for i := 0 to pCountRec do
  begin
    pRec[i].TypeComand := 0;
    pRec[i].IntPar1 := 0;
    pRec[i].IntPar1 := 0;
    pRec[i].StrPar1 := '';
  end;
  pCountRec := 0;
end;

procedure TMain.GridFree(var pGrid: TStringGrid);
begin
  pGrid.Cols[0].Clear;
  pGrid.ColCount := 1;
  pGrid.RowCount := 0;
end;

procedure TMain.LoadTaskClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
  CountRec := 0;
  MemoToRec(Memo1, Rec, CountRec);
end;

procedure TMain.MemoToRec(pMemo: TMemo; var pRec: Array of TRecord;
  var pCountRec: integer);
var
  vPos, i: integer;
  vStr, vStrPart: string;

  vRecord: TRecord;
begin
  RecFree(pRec, pCountRec);
  if pMemo.Lines.Count > 0 then
  begin
    for i := 0 to pMemo.Lines.Count - 1 do
    begin
      vStr := pMemo.Lines.Strings[i];
      vPos := Pos('-', vStr);
      RecordFree(vRecord);
      vRecord.TypeComand := StrToInt(Copy(vStr, 1, vPos - 1));
      pCountRec := pCountRec + 1;
      case vRecord.TypeComand of
        1:
          begin // �����������
            vStrPart := Copy(vStr, vPos + 1, Length(vStr) - (vPos));
            vPos := Pos('-', vStrPart); // ���������� �
            vRecord.IntPar1 := StrToInt(Copy(vStrPart, 1, vPos - 1));
            vStrPart := Copy(vStrPart, vPos + 1, Length(vStrPart) - (vPos));
            vRecord.IntPar2 := StrToInt(vStrPart);
          end;

        2:
          begin // ����
          end;

        3:
          begin // �����
            vStrPart := Copy(vStr, vPos + 1, Length(vStr) - (vPos));
            vRecord.IntPar1 := StrToInt(vStrPart);
          end;

        4:
          begin // �����
            vStrPart := Copy(vStr, vPos + 1, Length(vStr) - (vPos));
            vRecord.IntPar1 := StrToInt(vStrPart); // ����� � - � ��� ����
          end;

        5:
          begin // �����
            vStrPart := Copy(vStr, vPos + 1, Length(vStr) - (vPos));
            vRecord.StrPar1 := vStrPart; // ����� � - � ��� ����
          end;

        10:
          begin // ������� ���� ��� ��� ��������� ���������
            vStrPart := Copy(vStr, vPos + 1, Length(vStr) - (vPos));
            vRecord.StrPar1 := vStrPart; // �����
            CountRepeatCicleEdit.Text := vStrPart;
            CountRepeatCicle := StrToInt(vStrPart);
          end;
      end;
      pRec[i] := vRecord;
    end;
  end;
end;

procedure TMain.RecToMemo(pRec: Array of TRecord; pCountRec: integer;
  var pMemo: TMemo);
var
  i: integer;
  vStr: string;
  vRecord: TRecord;
begin
  pMemo.Clear;
  if pCountRec = null then
    pCountRec := 0;
  vStr := '10-2';
  pMemo.Lines.add(vStr);
  vStr := '11-';
  pMemo.Lines.add(vStr);
  if pCountRec > 2 then
  begin
    for i := 2 to pCountRec - 1 do
    begin
      case pRec[i].TypeComand of
        1:
          begin // �����������
            vStr := '1-' + IntToStr(pRec[i].IntPar1) + '-' +
              IntToStr(pRec[i].IntPar2);
            pMemo.Lines.add(vStr)
          end;

        2:
          begin // ����
            pMemo.Lines.add('2-');
          end;

        3:
          begin // �����
            vStr := '3-' + IntToStr(pRec[i].IntPar1);
            pMemo.Lines.add(vStr)
          end;

        4:
          begin // �����
            vStr := '4-' + IntToStr(pRec[i].IntPar1);
            pMemo.Lines.add(vStr);
          end;

        5:
          begin // �����
            vStr := '5-' + pRec[i].StrPar1;
            pMemo.Lines.add(vStr);
          end;
      end;
    end;
  end;
end;

procedure TMain.Delay(dwMilliseconds: Longint);
var
  iStart, iStop: DWORD;
begin
  iStart := GetTickCount;
  repeat
    iStop := GetTickCount;
    Sleep(1); // ����������� ��������� �������� ����������
    Application.ProcessMessages;
  until (iStop - iStart) >= dwMilliseconds;
end;

procedure TMain.GetXYMouseClick(Sender: TObject);
var
  MyMouse: TMouse;
begin
  Delay(2000);
  XYMouse.Text := IntToStr(MyMouse.CursorPos.x) + ':'
      + IntToStr(MyMouse.CursorPos.y);
end;

procedure KeyEm(pKey: char);
var
  CodeKey: integer;
begin
  CodeKey := InVK(pKey);
  keybd_event(CodeKey, 0, 0, 0);
  keybd_event(CodeKey, 0, KEYEVENTF_KEYUP, 0);
End;

procedure TMain.StartClick(Sender: TObject);

var
  i, j, vX, vY, vX2, vY2: integer;
  MyMouse: TMouse;
  Layout: array [0 .. KL_NAMELENGTH] of char;
  vKey: char;
  vCountCicle : integer;
begin
  LoadKeyboardLayout(StrCopy(Layout, '00000419'), KLF_ACTIVATE);
  Delay(1000);
  vCountCicle := 0;
  repeat
    vCountCicle := vCountCicle + 1;
    vX := 0; vY:= 0; vX2:= 0; vY2:= 0;
    for i := 2 to CountRec - 1 do
    begin
      case Rec[i].TypeComand of
        1:
          begin // �����������
            SetCursorPos(Rec[i].IntPar1, Rec[i].IntPar2);
          end;

        2:
          begin // ����
            Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
            Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
          end;

        3:
          begin // �����
            Delay(Rec[i].IntPar1);
            // sleep(Rec[i].IntPar1 * 1000);
          end;

        4:
          begin // �����
            Mouse_Event(MOUSEEVENTF_WHEEL, 0, 0, Rec[i].IntPar1, 0);
          end;

        5:
          begin // ����� ������
            Sleep(500);
            Mouse_Event(MOUSEEVENTF_WHEEL, 0, 0, Cardinal(-12000), 0);
            // Delay(500);
            Sleep(500);
            for j := 1 to Length(Rec[i].StrPar1) do
            begin
              vKey := Rec[i].StrPar1[j];
              KeyEm(vKey);
            end;
            keybd_event(VK_RETURN, 0, 0, 0); // ������� 's'.
            // sleep(1000);
            keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0); // ���������� 's'.
            // Delay( 1000);

          end;
      end;
    end;

    // ���� ��� �� ��������� ���� �� ����� ����� �� �������� �����
    if vCountCicle < CountRepeatCicle then
    begin
      vX := MyMouse.CursorPos.x;
      vY := MyMouse.CursorPos.y;
      Delay(2000);
      vX2 := MyMouse.CursorPos.x;
      vY2 := MyMouse.CursorPos.y;
      Label2.Caption := IntToStr(vX) + '=' + IntToStr(vX2) + ':' + IntToStr(vY) +
      '=' + IntToStr(vY2);
    end;

  until (vX2 <> vX) or (vY2 <> vY) or (vCountCicle >= CountRepeatCicle);

  showmessage('��������� '+ IntToStr(vCountCicle) + ' = ' + IntToStr(CountRepeatCicle));
end;

procedure TMain.TestButtonClick(Sender: TObject);
var
  vPath: string;
begin

  vPath := GetCurrentDir();
  ShowMessage(vPath);
end;

procedure TMain.ButtonStep2Click(Sender: TObject);
const
  cNameFile: string = 'Step2.cls';
var
  vPath: string;
  vFullNameFile: string;
begin
  vPath := GetCurrentDir();
  vFullNameFile := vPath + '/' + cNameFile;
  // ������ ��������� ���������� �� ����
  if FileExists(vFullNameFile) then
  begin
    Memo1.Lines.LoadFromFile(vFullNameFile);
    CountRec := 0;
    MemoToRec(Memo1, Rec, CountRec);
    //ShowMessage(vFullNameFile + ' ��������!');
    Start.Click();
  end
  else
    ShowMessage(vFullNameFile + ' �� ����������');

end;

procedure TMain.ButtonStep1Click(Sender: TObject);
const
  cNameFile: string = 'Step1.cls';
var
  vPath: string;
  vFullNameFile: string;
begin
  vPath := GetCurrentDir();
  vFullNameFile := vPath + '/' + cNameFile;
  // ������ ��������� ���������� �� ����
  if FileExists(vFullNameFile) then
  begin
    Memo1.Lines.LoadFromFile(vFullNameFile);
    CountRec := 0;
    MemoToRec(Memo1, Rec, CountRec);
    //ShowMessage(vFullNameFile + ' ��������!');
    Start.Click();
  end
  else
    ShowMessage(vFullNameFile + ' �� ����������');
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  Profile := ProfileGet(1);
  ListLanguages := InitListLanguages();
  // ������������� �������� ��������� �������
  Main.Caption := Profile.Name + ' ' + Profile.ScreenResolution + ' ' +
    '( ���������� ' + IntToStr(screen.Width) + ' � ' +
    IntToStr(screen.Height) + ')';
  LabelMainLanguage.Caption := '���� ������ ' + Profile.MainLanguage;
  LabelCountLanguages.Caption := '������� �� ' +
    IntToStr(Trunc(Length(Profile.LanguagesTranslation) / 3)) + ' �����';
end;

procedure TMain.MemoClipInfoChange(Sender: TObject);
var
  countLetters: integer;
  i: integer;
begin
  countLetters := 0;
  for i := 0 To MemoClipInfo.Lines.Count - 1 Do
  begin
    countLetters := countLetters + Length(MemoClipInfo.Lines.Strings[i]);
  end;

  EditCountInfoLetters.Text := IntToStr(countLetters);
end;

procedure TMain.MemoClipNameChange(Sender: TObject);
var
  countLetters: integer;
  i: integer;
begin
  countLetters := 0;
  for i := 0 To MemoClipName.Lines.Count - 1 Do
  begin
    countLetters := countLetters + Length(MemoClipName.Lines.Strings[i]);
  end;

  EditCountNameLetters.Text := IntToStr(countLetters);
end;

end.
