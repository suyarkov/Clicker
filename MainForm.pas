unit MainForm;

interface

uses
  uCodeKey,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

  // Настройка, наименование, языки, разрешение экрана, основной язык канала.
  type TProfile = record
    Id    	              : integer;
    Name	                : string;
    MainLanguage	        : string;
    LanguagesTranslation	: string;
    ScreenResolution   	  : string;
  end;

  type TRecord = record
      TypeComand	: integer;
      IntPar1	: integer;
      IntPar2	: integer;
      StrPar1 : string;
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
    Button2: TButton;
    Button3: TButton;
    LabelCountLanguages: TLabel;
    LabelMainLanguage: TLabel;
    LoadTask: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    EditFileName: TEdit;
    Start: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure MemoClipNameChange(Sender: TObject);
    procedure MemoClipInfoChange(Sender: TObject);
    procedure LoadTaskClick(Sender: TObject);
    procedure StartClick(Sender: TObject);
  private
    { Private declarations }
    Profile : TProfile;

    vTmpX, vTmpY : integer;
    i: integer;
    Rec: Array [1..1000] of TRecord;
    CountRec : integer;
    StringGrid1 : TStringGrid;

    procedure RecordFree (var pRecord : TRecord);
    procedure RecFree (var pRec : Array of TRecord; var pCountRec :Integer);

    procedure GridFree (var pGrid : TStringGrid);

    procedure RecToGrid ( pRec : Array of TRecord;
                          pCountRec :Integer;
                          var pGrid : TStringGrid);

    procedure MemoToRec ( pMemo: TMemo;
                          var pRec : Array of TRecord;
                          var pCountRec :Integer);

    procedure RecToMemo ( pRec : Array of TRecord;
                          pCountRec :Integer;
                          var pMemo : TMemo);
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.RecordFree (var pRecord : TRecord);
begin
      pRecord.TypeComand  := 0;
      pRecord.IntPar1     := 0;
      pRecord.IntPar2     := 0;
      pRecord.StrPar1     := '';
end;


function ProfileGet(pId: integer) : TProfile;
var vProfile : TProfile;
begin
    vProfile.Id                   := 1;
    vProfile.Name	                := 'Основной';
    vProfile.MainLanguage	        := '/pl';
    vProfile.LanguagesTranslation	:= '/ru/en';
    vProfile.ScreenResolution   	:= '1366 х 768';
    ProfileGet := vProfile;
end;

procedure TMain.RecFree(var pRec : Array of TRecord; var pCountRec : Integer);
  var i:integer;
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

procedure TMain.GridFree(var pGrid : TStringGrid);
begin
  pGrid.Cols[0].Clear;
  pGrid.ColCount := 1;
  pGrid.RowCount := 0;
end;

procedure TMain.RecToGrid (  pRec : Array of TRecord;
                              pCountRec :Integer;
                              var pGrid : TStringGrid);
var
  i: integer;
begin
  GridFree(pGrid);
  if pCountRec > 2 then
  begin
    pGrid.RowCount := pCountRec - 2;

    for i:=2 to pCountRec-1 do
    begin
      pGrid.Cells[ 0, i-2]:=IntToStr((pRec[i].TypeComand));
    end;
  end;


end;


procedure TMain.LoadTaskClick(Sender: TObject);
begin
if OpenDialog1.Execute then
  begin
      Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
      EditFileName.Text := ExtractFileName(OpenDialog1.FileName);
  end;
  CountRec := 0;
  MemoToRec( Memo1, Rec, CountRec);
  RecToGrid( Rec, CountRec, StringGrid1);
end;


procedure TMain.MemoToRec (  pMemo : TMemo;
                              var pRec : Array of TRecord;
                              var pCountRec :Integer);
var
  vPos, i: integer;
  vStr, vStrPart: string;

  vRecord : TRecord;
begin
  RecFree(pRec, pCountRec);
  if pMemo.Lines.Count > 0 then
  begin
    for i:=0 to pMemo.Lines.Count-1 do
    begin
      vStr := pMemo.Lines.Strings[i];
      vPos := Pos('-', vStr);
      RecordFree(vRecord);
      vRecord.TypeComand := StrToInt(Copy(vStr,1,vPos-1));
      pCountRec := pCountRec + 1;
      case vRecord.TypeComand of
          1: begin   // перемещение
            vStrPart := Copy(vStr, vPos +1, Length(vStr)- (vPos));
            vPos := Pos('-', vStrPart); // координаты Х
            vRecord.IntPar1 := StrToInt(Copy(vStrPart,1,vPos-1));
            vStrPart := Copy(vStrPart, vPos +1, Length(vStrPart)- (vPos));
            vRecord.IntPar2 := StrToInt(vStrPart);
          end;

          2: begin   // клик
          end;

          3: begin   // пауза
            vStrPart := Copy(vStr, vPos +1, Length(vStr)- (vPos));
            vRecord.IntPar1 := StrToInt(vStrPart);
          end;

          4: begin   // скрол
            vStrPart := Copy(vStr, vPos +1, Length(vStr)- (vPos));
            vRecord.IntPar1 := StrToInt(vStrPart); // сдвиг с - и без него
          end;

          5: begin   // текст
            vStrPart := Copy(vStr, vPos +1, Length(vStr)- (vPos));
            vRecord.StrPar1 := vStrPart; // сдвиг с - и без него
          end;

          10: begin   // Признак один раз или несколько выполнять
            vStrPart := Copy(vStr, vPos +1, Length(vStr)- (vPos));
            vRecord.StrPar1 := vStrPart; // число
            Edit1.Text := vStrPart;
          end;
      end;
      pRec[i] := vRecord;
    end;
  end;
end;

procedure TMain.RecToMemo (  pRec : Array of TRecord;
                              pCountRec :Integer;
                              var pMemo : TMemo);
var
  i: integer;
  vStr: string;
  vRecord : TRecord;
begin
  pMemo.Clear;
  if pCountRec = null then pCountRec := 0;
  vStr := '10-2';
  pMemo.Lines.add(vStr);
  vStr := '11-';
  pMemo.Lines.add(vStr);
  if pCountRec > 2 then
  begin
    for i:=2 to pCountRec-1 do
    begin
      case pRec[i].TypeComand of
          1: begin   // перемещение
            vStr := '1-' + IntToStr(pRec[i].IntPar1) + '-'
              + IntToStr(pRec[i].IntPar2);
            pMemo.Lines.add(vStr)
          end;

          2: begin   // клик
            pMemo.Lines.add('2-');
          end;

          3: begin   // пауза
            vStr := '3-' + IntToStr(pRec[i].IntPar1);
            pMemo.Lines.add(vStr)
          end;

          4: begin   // скрол
            vStr := '4-' + IntToStr(pRec[i].IntPar1);
            pMemo.Lines.add(vStr);
          end;

          5: begin   // текст
            vStr := '5-' + pRec[i].StrPar1;
            pMemo.Lines.add(vStr);
          end;
      end;
       StringGrid1.Cells[ 0, i]:=(pMemo.Lines.Strings[i]);
    end;
  end;
end;


procedure Delay (dwMilliseconds: Longint);
var iStart, iStop: DWORD;
begin
iStart := GetTickCount;
repeat
iStop := GetTickCount;
Sleep(1); // Значительно уменьшает загрузку процессора
Application.ProcessMessages;
until (iStop - iStart) >= dwMilliseconds;
end;

procedure KeyEm(pKey: char);
var CodeKey : integer;
begin
        CodeKey := InVK(pKey);
        keybd_event(CodeKey, 0, 0, 0);
        keybd_event(CodeKey, 0, KEYEVENTF_KEYUP, 0);
End;

procedure TMain.StartClick(Sender: TObject);

var i, j,  vX, vY, vX2, vY2: integer;
  MyMouse: TMouse;
  Layout: array[0.. KL_NAMELENGTH] of char;
  vKey : char;
begin
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
  Delay( 1000);

  repeat
  for i:= 2 to CountRec-1 do
  begin
    case Rec[i].TypeComand of
      1: begin   // перемещение
         SetCursorPos(Rec[i].IntPar1, Rec[i].IntPar2);
      end;

      2: begin   // клик
         Mouse_Event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);//левый клик
         Mouse_Event(MOUSEEVENTF_LEFTUP,0,0,0,0);
      end;

      3: begin   // пауза
          Delay(Rec[i].IntPar1 * 1000);
//          sleep(Rec[i].IntPar1 * 1000);
      end;

      4: begin   // скрол
          Mouse_Event(MOUSEEVENTF_WHEEL, 0, 0, Rec[i].IntPar1, 0);
      end;

      5: begin   // набор текста
          sleep(500);
          mouse_event(MOUSEEVENTF_WHEEL,0,0, Cardinal(-12000),0);
//          Delay(500);
          sleep(500);
          for j:= 1 to Length(Rec[i].StrPar1) do
          begin
            vKey := Rec[i].StrPar1[j];
            KeyEm(vKey);
          end;
        keybd_event(VK_RETURN, 0, 0, 0); //Нажатие 's'.
//                sleep(1000);
        keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0); //Отпускание 's'.
//                Delay( 1000);

      end;
    end;
  end;

  vX := MyMouse.CursorPos.x;
  vY := MyMouse.CursorPos.y;

  Delay( 2000);
  vX2 := MyMouse.CursorPos.x;
  vY2 := MyMouse.CursorPos.y;
  label2.Caption := inttostr(vX) + '=' + inttostr(vX2) + ':'
                    + inttostr(vY) + '=' + inttostr(vY2);
  until (vX2 <> vX) or (vY2 <> vY);
end;

procedure TMain.FormCreate(Sender: TObject);
begin
   Profile := ProfileGet(1);

   //Инициализация надписей согласной профилю
   Main.Caption :=
   Profile.Name + ' ' +
   Profile.ScreenResolution + ' ' +
   '( актуальное ' + IntToStr(screen.Width) + ' х ' + IntToStr(screen.Height) + ')';
   LabelMainLanguage.Caption := 'Язык канала ' + Profile.MainLanguage;
   LabelCountLanguages.Caption := 'Перевод на ' +
   IntToStr(Trunc(length(Profile.LanguagesTranslation)/3)) + ' языка';
end;

procedure TMain.MemoClipInfoChange(Sender: TObject);
var countLetters : integer;
    i : integer;
begin
  countLetters := 0;
  for i := 0 To  MemoClipInfo.Lines.Count-1 Do
    begin
      countLetters := countLetters + Length(MemoClipInfo.Lines.Strings[i]);
    end;

    EditCountInfoLetters.Text := IntToStr(countLetters);
end;

procedure TMain.MemoClipNameChange(Sender: TObject);
var countLetters : integer;
    i : integer;
begin
  countLetters := 0;
  for i := 0 To MemoClipName.Lines.Count-1 Do
    begin
      countLetters := countLetters + Length(MemoClipName.Lines.Strings[i]);
    end;

    EditCountNameLetters.Text := IntToStr(countLetters);
end;

end.
