unit MainForm;

interface

uses
  uCodeKey, uLanguages, uTranslate, fmClipInfoForm, uTasks,
  fmListLanguages, //frmFirst,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  ClipBrd, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.DBCtrls, Data.DB, Vcl.Mask, Vcl.ExtCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
    IntPar3: integer;
    StrPar1: string;
  end;

type
  TMain = class(TForm)
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
    GetXYMouse: TButton;
    XYMouse: TEdit;
    ButtonStep3_1: TButton;
    EditLanguages: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure LoadTaskClick(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure ButtonStep1Click(Sender: TObject);
    procedure GetXYMouseClick(Sender: TObject);
    procedure ButtonStep2Click(Sender: TObject);
    procedure ButtonStep3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonStep3_1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditLanguagesClick(Sender: TObject);
    procedure ReShowInfoProfile(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  var
    verProgram: string;
    Profile: TProfile;
    // ��������� ������� ��� ������ ����������, ������ �������.
    ListLanguages: TListLanguages; // ������ ���� ��������� ������ � �������
    Rec: Array [1 .. 1000] of TRecord;
    // ������ ��� ��������, ��������� �� �����
    CountRec: integer; // ���������� ��������
    CountRepeatCicle: integer; // ���������� ������ ��������
    LnCodeForTranslation: string; // ��� ����� �� ������� ����� �������
    ClipInfo: TStringList;
    ClipName: string;
    TranslateText: TStringList; // Tstrings;
    // function ProfileLoad(pId: integer; var pProfile : TProfile): TProfile;
    procedure RecordFree(var pRecord: TRecord);
    procedure RecFree(var pRec: Array of TRecord; var pCountRec: integer);

    procedure GridFree(var pGrid: TStringGrid);

    procedure MemoToRec(pMemo: TMemo; var pRec: Array of TRecord;
      var pCountRec: integer);

    procedure RecToMemo(pRec: Array of TRecord; pCountRec: integer;
      var pMemo: TMemo);
    procedure Delay(dwMilliseconds: Longint);
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

function ProfileLoad(pId: integer; var pProfile: TProfile): TProfile;
const
  cNameFile: string = 'Profile1';
var
  // vProfile: TProfile;
  vPath: string;
  vFullNameFile: string;
  vFileText: TStringList;
  i: integer;
begin
  // vProfile := pProfile;
  vPath := GetCurrentDir();
  vFullNameFile := vPath + '/' + cNameFile;
  // ������ ��������� ���������� �� ����
  if FileExists(vFullNameFile) then
  begin
    vFileText := TStringList.Create;
    vFileText.LoadFromFile(vFullNameFile);

    if vFileText.Count >= 5 then
    begin
      pProfile.Id := StrToInt(vFileText.Strings[0]);
      pProfile.Name := vFileText.Strings[1];
      pProfile.MainLanguage := vFileText.Strings[2];
      pProfile.LanguagesTranslation := vFileText.Strings[3];
      pProfile.ScreenResolution := vFileText.Strings[4];
    end;
  end;
  if pProfile.MainLanguage = '' then
  begin
    showmessage('��������! �������� ���� �� ���������! ������������� � PL');
    pProfile.MainLanguage := 'pl';
  end;
  ProfileLoad := pProfile;
end;

procedure ProfileSave(pProfile: TProfile);
const
  cNameFile: string = 'Profile1';
var
  // vProfile: TProfile;
  vPath: string;
  vFullNameFile: string;
  vFileText: TStringList;
  i: integer;
begin
  if pProfile.MainLanguage <> '' then
  begin
    vPath := GetCurrentDir();
    vFullNameFile := vPath + '/' + cNameFile;
    vFileText := TStringList.Create;
    vFileText.Add(IntToStr(pProfile.Id));
    vFileText.Add(pProfile.Name);
    vFileText.Add(pProfile.MainLanguage);
    vFileText.Add(pProfile.LanguagesTranslation);
    vFileText.Add(pProfile.ScreenResolution);
    // ���������
    vFileText.SaveToFile(vFullNameFile);
  end
  else
    showmessage('������� �� ���������!');
end;

function ProfileGet(pId: integer): TProfile;
var
  vProfile: TProfile;
begin
  // ��� ��������� ��� ���������� ����������
  vProfile.Id := 1;
  vProfile.Name := '��������';
  vProfile.MainLanguage := 'pl';
  vProfile.LanguagesTranslation := '/ru/en';
  vProfile.ScreenResolution := '1366 � 768';
  ProfileGet := vProfile;

  ProfileGet := ProfileLoad(pId, vProfile);
end;

procedure TMain.RecFree(var pRec: Array of TRecord; var pCountRec: integer);
var
  i: integer;
begin
  for i := 0 to pCountRec do
  begin
    pRec[i].TypeComand := 0;
    pRec[i].IntPar1 := 0;
    pRec[i].IntPar2 := 0;
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
          begin // �����, ������� �� ���� ������
            vStrPart := Copy(vStr, vPos + 1, Length(vStr) - (vPos));
            vRecord.StrPar1 := vStrPart; // ����� � - � ��� ����
          end;

        6:
          begin // ������� ����, � ����������� � ����� ������ �����������
            // � ����� �� ������ ������ � ����
          end;

        7:
          begin // ������� ���� ��������
          end;

        8:
          begin // ������� ���� ��������
          end;

        9:
          begin // ������� �� ���� � �����, � ����� � �������
          end;

        10:
          begin // ������� ���� ��� ��� ��������� ���������
            vStrPart := Copy(vStr, vPos + 1, Length(vStr) - (vPos));
            vRecord.StrPar1 := vStrPart; // �����
            CountRepeatCicleEdit.Text := vStrPart;
            CountRepeatCicle := StrToInt(vStrPart);
          end;

        101:
          begin // �����������
            vStrPart := Copy(vStr, vPos + 1, Length(vStr) - (vPos));
            vPos := Pos('-', vStrPart); // ���������� �
            vRecord.IntPar1 := StrToInt(Copy(vStrPart, 1, vPos - 1));
            vStrPart := Copy(vStrPart, vPos + 1, Length(vStrPart) - (vPos));
            vPos := Pos('-', vStrPart); // ���������� Y
            vRecord.IntPar2 := StrToInt(Copy(vStrPart, 1, vPos - 1));
            vStrPart := Copy(vStrPart, vPos + 1, Length(vStrPart) - (vPos));
            // ��������� � ����� ��� ���������� ������
            vRecord.IntPar3 := StrToInt(vStrPart);
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
begin
  pMemo.Clear;
  if pCountRec = null then
    pCountRec := 0;
  vStr := '10-2';
  pMemo.Lines.Add(vStr);
  vStr := '11-';
  pMemo.Lines.Add(vStr);
  if pCountRec > 2 then
  begin
    for i := 2 to pCountRec - 1 do
    begin
      case pRec[i].TypeComand of
        1:
          begin // �����������
            vStr := '1-' + IntToStr(pRec[i].IntPar1) + '-' +
              IntToStr(pRec[i].IntPar2);
            pMemo.Lines.Add(vStr)
          end;

        2:
          begin // ����
            pMemo.Lines.Add('2-');
          end;

        3:
          begin // �����
            vStr := '3-' + IntToStr(pRec[i].IntPar1);
            pMemo.Lines.Add(vStr)
          end;

        4:
          begin // �����
            vStr := '4-' + IntToStr(pRec[i].IntPar1);
            pMemo.Lines.Add(vStr);
          end;

        5:
          begin // �����, ������� �� ���� ������
            vStr := '5-' + pRec[i].StrPar1;
            pMemo.Lines.Add(vStr);
          end;

        6:
          begin // ������� ����, � ����������� � ����� ������ �����������
            pMemo.Lines.Add('6-'); // � ����� �� ������ ������ � ����
          end;

        7:
          begin // ������� ����
            pMemo.Lines.Add('7-');
          end;

        8:
          begin // ������� ����2
            pMemo.Lines.Add('8-');
          end;

        9:
          begin // ������� �� ���� � �����, � ����� � �������
            pMemo.Lines.Add('9-');
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
  XYMouse.Text := IntToStr(MyMouse.CursorPos.x) + ':' +
    IntToStr(MyMouse.CursorPos.y);
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
  i, j, vX, vY, vX2, vY2, i7: integer;
  MyMouse: TMouse;
  Layout: array [0 .. KL_NAMELENGTH] of char;
  vKey: char;
  vCountCicle: integer;
  vStrFor6: string;
  vStrFor7: string;
  vIntControl: integer;
  vLnFrom, LnFor: string;
  vRetTask: integer; // ����������� ��������� ���������� ������, ������ =1
  vLastLng: string;
begin
  vLnFrom := Profile.MainLanguage;
  // vLnFrom := 'ru'; // ���� �� �����!!!
  LoadKeyboardLayout(StrCopy(Layout, '00000419'), KLF_ACTIVATE);
  Delay(1000);
  vCountCicle := 0;
  vIntControl := 0;
  vLastLng := '';
  repeat
    vCountCicle := vCountCicle + 1;
    vX := 0;
    vY := 0;
    vX2 := 0;
    vY2 := 0;
    for i := 3 to CountRec do
    begin
      vY2 := Rec[i].TypeComand;
      case Rec[i].TypeComand of
        1:
          begin // �����������
            vRetTask := Task_1(Rec[i].IntPar1, Rec[i].IntPar2);
          end;

        2:
          begin // ����
            vRetTask := Task_2();
          end;

        3:
          begin // �����
            vRetTask := Task_3(Rec[i].IntPar1);
          end;

        4:
          begin // �����
            vRetTask := Task_4(Rec[i].IntPar1);
          end;

        5:
          begin // ����� ������ , ������� �� ���� ������
            vRetTask := Task_5(Rec[i].StrPar1);
          end;

        6:
          begin // ������� ����, � ����������� � ����� ������ ����������� � � ����
            // � ����� �� ������ ������ � ����
            // vRetTask := Task_6(LnCodeForTranslation, ListLanguages,
            // vIntControl);

            vIntControl := 0;
            Clipboard.AsText := ' ';
            vStrFor7 := Clipboard.AsText;
            Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
            Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
            Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
            Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
            // Delay(150);
            keybd_event(VK_LCONTROL, 0, 0, 0); // ������� ������ Ctrl.
            keybd_event(Ord('C'), 0, 0, 0); // ������� 'C'.
            keybd_event(Ord('C'), 0, KEYEVENTF_KEYUP, 0); // ���������� 'C'.
            keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0);
            // ���������� ������ Ctrl.
            Delay(100);
            vStrFor6 := Clipboard.AsText;
            if vStrFor6 <> vStrFor7 then
            begin
              vIntControl := 1;
              Label2.Caption := vStrFor6;
              LnCodeForTranslation := GetLnCodeFromList(vStrFor6,
                ListLanguages);
            end;

            // showmessage('�� ������ ������' + vStrFor6 + ' ' + LnCodeForTranslation);
          end;

        7:
          begin // ������� ClipName � ������� � ����
            if vIntControl > 0 then
            begin
              vStrFor7 := GoogleTranslate(ClipName, vLnFrom,
                LnCodeForTranslation);
              vStrFor7 := StringReplace(vStrFor7, #13, '',
                [rfReplaceAll, rfIgnoreCase]);
              if Length(vStrFor7) > 100 then // � ������ �������
                vStrFor7 := Copy(vStrFor7, 1, 100);

              TranslateText.Text := vStrFor7;
              // ��������� �� ���� � ����� �����

              vStrFor6 :='';

              Clipboard.AsText := '';
              // ��������, ��� ���� ���� ������ �� �������
              // ������� ����, ����������� � ����� � ������� ���� ���� �����

              Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
              Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
              Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
              Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);

              // Delay(150);
              keybd_event(VK_LCONTROL, 0, 0, 0); // ������� ������ Ctrl.
              keybd_event(Ord('C'), 0, 0, 0); // ������� 'C'.
              keybd_event(Ord('C'), 0, KEYEVENTF_KEYUP, 0); // ���������� 'C'.
              keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0);
              // ���������� ������ Ctrl.
              Delay(100);

              vStrFor6 := Clipboard.AsText;

              IF vStrFor6 = '' THEN // ���� ���� ������
              begin
                // ��������� �� ���� � ����� �����
                Clipboard.AsText := vStrFor7; // TranslateText.Text[0];

                // �������� �� ������ � ����
                keybd_event(VK_LCONTROL, 0, 0, 0); // ������� ������ Ctrl.
                keybd_event(Ord('V'), 0, 0, 0); // ������� 'V'.
                keybd_event(Ord('V'), 0, KEYEVENTF_KEYUP, 0); // ���������� 'V'.
                keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0);
                // ���������� ������ Ctrl.
                Delay(100);
              end;
            end;
          end;

        8:
          begin // ������� ����Info 2
            if vIntControl > 0 then
            begin
              TranslateText.Text := GoogleTranslate(ClipInfo.Text, vLnFrom,
                LnCodeForTranslation);
              if Length(TranslateText.Text) > 5000 then // � ������ �������
                TranslateText.Text := Copy(TranslateText.Text, 1, 5000);

              Clipboard.AsText := '';
              // ��������, ��� ���� ���� ������ �� �������
              // ������� ����, ����������� � ����� � ������� ���� ���� �����
              vStrFor7 := Clipboard.AsText;
              Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
              Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
              Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
              Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);

              // Delay(150);
              keybd_event(VK_LCONTROL, 0, 0, 0); // ������� ������ Ctrl.
              keybd_event(Ord('C'), 0, 0, 0); // ������� 'C'.
              keybd_event(Ord('C'), 0, KEYEVENTF_KEYUP, 0); // ���������� 'C'.
              keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0);
              // ���������� ������ Ctrl.
              Delay(100);

              vStrFor6 := Clipboard.AsText;

              IF vStrFor6 = '' THEN // ���� ���� ������
              begin
                // ��������� �� ���� � ����� �����
                Clipboard.AsText := TranslateText.Text;
                // �������� �� ������ � ����
                keybd_event(VK_LCONTROL, 0, 0, 0); // ������� ������ Ctrl.
                keybd_event(Ord('V'), 0, 0, 0); // ������� 'C'.
                keybd_event(Ord('V'), 0, KEYEVENTF_KEYUP, 0); // ���������� 'C'.
                keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0);
                // ���������� ������ Ctrl.
              end;
            end;
          end;

        9:
          begin // ������� �� ���� � �����, � ����� � �������
          end;

        101:
          begin // ������� �� ���� � �����, � ����� � �������
            vRetTask := Task_101(Rec[i].IntPar1, Rec[i].IntPar2, Rec[i].IntPar3,
              ListLanguages, vLastLng);
            vLastLng := vLastLng;
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
      // Label2.Caption := IntToStr(vX) + '=' + IntToStr(vX2) + ':' + IntToStr(vY)
      // + '=' + IntToStr(vY2);
    end;
    Label2.Caption := IntToStr(vCountCicle);
  until (vX2 <> vX) or (vY2 <> vY) or (vCountCicle >= CountRepeatCicle);

  showmessage('��������� ' + IntToStr(vCountCicle) + ' = ' +
    IntToStr(CountRepeatCicle));
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
    // ShowMessage(vFullNameFile + ' ��������!');
    Start.Click();
  end
  else
    showmessage(vFullNameFile + ' �� ����������');

end;

procedure TMain.ButtonStep3Click(Sender: TObject);
const
  cNameFile: string = 'Step3.cls';
  cFileWithNameClip: string = 'NameClip.cls';
  cFileWithInfoClip: string = 'InfoClip.cls';
var
  resultForm: word;
  vPath: string;
  vFullNameFile: string;
  i: integer;
  vNumberLanguage: integer;

begin
  vNumberLanguage := 0;
  // ��������� box ����������
  for i := 1 to 1000 do
  begin
    // ������ ��� �� ���������
    if ListLanguages[i].LnCode = '' then
      break;

    ClipInfoForm.LanguageComboBox.Items.Add(ListLanguages[i].LnCode + ' | ' +
      ListLanguages[i].NameForRead);
    // �������� ��� ������� �������
    if ListLanguages[i].LnCode = Profile.MainLanguage then
      vNumberLanguage := ClipInfoForm.LanguageComboBox.Items.Count - 1;
    // ������ ��� ������ � -1

  end;

  if vNumberLanguage > 0 then
    ClipInfoForm.LanguageComboBox.ItemIndex := vNumberLanguage;
  {
    ���� ����� ������ �� ������, �� ��������, ��� � Items ���� ������ Txt, �� ���:
    ComboBox.ItemIndex:=ComboBox.Items.IndexOf(Txt);
  }
  // ���������� �������� ���� �� �����
  vPath := GetCurrentDir();
  vFullNameFile := vPath + '/' + cFileWithNameClip;
  if FileExists(vFullNameFile) then
  begin
    ClipInfo.LoadFromFile(vFullNameFile);
    ClipName := ClipInfo.Strings[0];
    ClipInfo.Text := '';
    // ShowMessage(vFullNameFile + ' ��������!');
  end
  else
    ClipName := '';

  vFullNameFile := vPath + '/' + cFileWithInfoClip;
  if FileExists(vFullNameFile) then
  begin
    ClipInfo.LoadFromFile(vFullNameFile);
    // ShowMessage(vFullNameFile + ' ��������!');
  end
  else
    ClipInfo.Text := '';

  ClipInfoForm.EditClipName.Text := ClipName;
  ClipInfoForm.MemoClipInfo.Text := ClipInfo.Text;

  resultForm := ClipInfoForm.ShowModal;

  if resultForm = mrOK then
  begin
    if ListLanguages[(ClipInfoForm.LanguageComboBox.ItemIndex) + 1].LnCode <> ''
    then
    begin
      Profile.MainLanguage := ListLanguages
        [(ClipInfoForm.LanguageComboBox.ItemIndex) + 1].LnCode;
    end;
    // ��������� ������� �� ����� �������� �������
    ReShowInfoProfile(Sender);
    // ���� �� ����� ���������� � �������

    ClipName := ClipInfoForm.EditClipName.Text;
    // ��������� ��� � ����
    ClipInfo.Text := ClipName;
    vFullNameFile := vPath + '/' + cFileWithNameClip;
    ClipInfo.SaveToFile(vFullNameFile);

    ClipInfo.Text := ClipInfoForm.MemoClipInfo.Text;
    // ���������� �������� � ����
    vFullNameFile := vPath + '/' + cFileWithInfoClip;
    ClipInfo.SaveToFile(vFullNameFile);

    // �������� ����������
    vFullNameFile := vPath + '/' + cNameFile;
    // ������ ��������� ���������� �� ����
    if FileExists(vFullNameFile) then
    begin
      Memo1.Lines.LoadFromFile(vFullNameFile);
      CountRec := 0;
      MemoToRec(Memo1, Rec, CountRec);
      Start.Click(); // **************************************������ ����������
    end
    else
      showmessage(vFullNameFile + ' �� ����������');

  end
  else
    MessageDlg('�������� ��������.', mtInformation, [mbYes], 0);
end;

procedure TMain.ButtonStep3_1Click(Sender: TObject);
const
  cNameFile: string = 'Step3_1.cls';
  cFileWithNameClip: string = 'NameClip.cls';
  cFileWithInfoClip: string = 'InfoClip.cls';
var
  resultForm: word;
  vPath: string;
  vFullNameFile: string;
  i: integer;
  vNumberLanguage: integer;

begin
  vNumberLanguage := 0;
  // ��������� box ����������
  for i := 1 to 1000 do
  begin
    // ������ ��� �� ���������
    if ListLanguages[i].LnCode = '' then
      break;

    ClipInfoForm.LanguageComboBox.Items.Add(ListLanguages[i].LnCode + ' | ' +
      ListLanguages[i].NameForRead);
    // �������� ��� ������� �������
    if ListLanguages[i].LnCode = Profile.MainLanguage then
      vNumberLanguage := ClipInfoForm.LanguageComboBox.Items.Count - 1;
    // ������ ��� ������ � -1

  end;

  if vNumberLanguage > 0 then
    ClipInfoForm.LanguageComboBox.ItemIndex := vNumberLanguage;
  {
    ���� ����� ������ �� ������, �� ��������, ��� � Items ���� ������ Txt, �� ���:
    ComboBox.ItemIndex:=ComboBox.Items.IndexOf(Txt);
  }
  // ���������� �������� ���� �� �����
  vPath := GetCurrentDir();
  vFullNameFile := vPath + '/' + cFileWithNameClip;
  if FileExists(vFullNameFile) then
  begin
    ClipInfo.LoadFromFile(vFullNameFile);
    ClipName := ClipInfo.Strings[0];
    ClipInfo.Text := '';
    // ShowMessage(vFullNameFile + ' ��������!');
  end
  else
    ClipName := '';

  vFullNameFile := vPath + '/' + cFileWithInfoClip;
  if FileExists(vFullNameFile) then
  begin
    ClipInfo.LoadFromFile(vFullNameFile);
    // ShowMessage(vFullNameFile + ' ��������!');
  end
  else
    ClipInfo.Text := '';

  ClipInfoForm.EditClipName.Text := ClipName;
  ClipInfoForm.MemoClipInfo.Text := ClipInfo.Text;

  resultForm := ClipInfoForm.ShowModal;

  if resultForm = mrOK then
  begin

    if ListLanguages[(ClipInfoForm.LanguageComboBox.ItemIndex) + 1].LnCode <> ''
    then
    begin
      Profile.MainLanguage := ListLanguages
        [(ClipInfoForm.LanguageComboBox.ItemIndex) + 1].LnCode;
    end;

    ClipName := ClipInfoForm.EditClipName.Text;
    // ��������� ��� � ����
    ClipInfo.Text := ClipName;
    vFullNameFile := vPath + '/' + cFileWithNameClip;
    ClipInfo.SaveToFile(vFullNameFile);

    ClipInfo.Text := ClipInfoForm.MemoClipInfo.Text;
    // ���������� �������� � ����
    vFullNameFile := vPath + '/' + cFileWithInfoClip;
    ClipInfo.SaveToFile(vFullNameFile);

    // �������� ����������
    vFullNameFile := vPath + '/' + cNameFile;
    // ������ ��������� ���������� �� ����
    if FileExists(vFullNameFile) then
    begin
      Memo1.Lines.LoadFromFile(vFullNameFile);
      CountRec := 0;
      MemoToRec(Memo1, Rec, CountRec);
      // showmessage(vFullNameFile + ' ��������!');
      Start.Click(); // **************************************������ ����������
    end
    else
      showmessage(vFullNameFile + ' �� ����������');
  end
  else
    MessageDlg('�������� ��������.', mtInformation, [mbYes], 0);
end;

procedure TMain.EditLanguagesClick(Sender: TObject);
var
  i, vCountLanguages: integer;
  vRes: integer;
begin
  fLanguages.LanguagesGrid.ColWidths[0] := 30;
  fLanguages.LanguagesGrid.ColWidths[1] := 50;
  fLanguages.LanguagesGrid.ColWidths[2] := 200;
  fLanguages.LanguagesGrid.ColWidths[3] := 200;
  fLanguages.LanguagesGrid.ColWidths[4] := 20;

  // ���������
  vCountLanguages := 0;
  fLanguages.LanguagesGrid.Cells[0, 0] := 'Id';
  fLanguages.LanguagesGrid.Cells[1, 0] := '���';
  fLanguages.LanguagesGrid.Cells[2, 0] := '��� �����';
  fLanguages.LanguagesGrid.Cells[3, 0] := '��� ������';
  // ��������� StringGrid ����������
  for i := 1 to 1000 do
  begin
    // ������ ��� �� ��������� � ���������
    if ListLanguages[i].LnCode = '' then
    begin
      fLanguages.LanguagesGrid.RowCount := vCountLanguages + 1;
      break;
    end
    else
    begin
      fLanguages.LanguagesGrid.Cells[0, i] := IntToStr(ListLanguages[i].Id);
      fLanguages.LanguagesGrid.Cells[1, i] := ListLanguages[i].LnCode;
      fLanguages.LanguagesGrid.Cells[2, i] := ListLanguages[i].NameForEnter;
      fLanguages.LanguagesGrid.Cells[3, i] := ListLanguages[i].NameForRead;
      fLanguages.LanguagesGrid.Cells[4, i] := IntToStr(ListLanguages[i].Activ);
      vCountLanguages := i;
    end;
  end;

  vRes := fLanguages.ShowModal;
  if vRes = mrOK then
  begin
    for i := 1 to vCountLanguages do
    begin
      if (fLanguages.LanguagesGrid.Cells[0, i] = IntToStr(ListLanguages[i].Id))
        and (fLanguages.LanguagesGrid.Cells[1, i] = ListLanguages[i].LnCode)
      then
      begin
        ListLanguages[i].Activ :=
          StrToInt(fLanguages.LanguagesGrid.Cells[4, i]);
      end;

    end;
    SaveListLanguages(ListLanguages);
  end;

end;

// ������������� �������� ����� ��������� �������
procedure TMain.ReShowInfoProfile(Sender: TObject);
begin
  Main.Caption := Profile.Name + ' ' + Profile.ScreenResolution + ' ' +
    '( ���������� ' + IntToStr(screen.Width) + ' � ' +
    IntToStr(screen.Height) + ')';
  LabelMainLanguage.Caption := '���� ������ ' + Profile.MainLanguage;
  LabelCountLanguages.Caption := '������� �� ' +
    IntToStr(Trunc(Length(Profile.LanguagesTranslation) / 3)) + ' �����';
end;

procedure TMain.Button1Click(Sender: TObject);
begin
  showmessage(IntToStr(Profile.Id) + '_' + Profile.MainLanguage + '  ' +
    IntToStr(InVK('�')));
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
    // ShowMessage(vFullNameFile + ' ��������!');
    Start.Click();
  end
  else
    showmessage(vFullNameFile + ' �� ����������');
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ProfileSave(Profile);
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  verProgram := '0.1';
  ListLanguages := InitListLanguages();
  Profile := ProfileGet(1);
  // ��������� ������� �� ����� �������� �������
  ReShowInfoProfile(Sender);

  LnCodeForTranslation := 'unknow';
  ClipInfo := TStringList.Create;
  TranslateText := TStringList.Create;

  //FirstForm.ShowModal;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  //
end;

end.
