unit uTasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Winapi.Windows, Vcl.Forms, ClipBrd, Vcl.Controls,Vcl.Dialogs,
  uCodeKey, uLanguages, uTranslate;
// var
// LnCodeForTranslation : string; // ��� ����� ���� ���������� ����������
function Task_1(const pX, pY: integer): integer;
// ����������� ������� � ����������
function Task_2(): integer; // ������ ��������� ���� ������
function Task_3(pMilliseconds: LongInt): integer;
// ����� � ������ � �������������
function Task_4(pPixels: integer): integer; // �����
function Task_5(pString: string): integer;
// ����� ����������� ������ � � ����� ����
function Task_6(LnCodeForTranslation: string; ListLanguages: TListLanguages;
  pIntControl: integer): integer;
function Task_7(pIntControl: integer; pClipName, pStrTranslate, pLnFrom,
  pLnCodeForTranslation: string): integer;
function Task_8(): integer;
function Task_9(): integer;
function Task_101(pX, pY, pRepeat: integer; pListLanguages: TListLanguages;
  var pLastLng: string): integer;

procedure Delay(dwMilliseconds: LongInt);

implementation

procedure GetPosXY(var pX, pY: integer);
var
  MyMouse: TMouse;
begin
  pX := MyMouse.CursorPos.x;
  pY := MyMouse.CursorPos.y;
end;

// ����������� �������
function Task_1(const pX, pY: integer): integer;
begin
  try
    SetCursorPos(pX, pY);
    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

// ����������� �������
function Task_2(): integer;
begin
  try
    Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
    Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);

    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

// �����
function Task_3(pMilliseconds: LongInt): integer;
begin
  try
    Delay(pMilliseconds);
    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

// ��������� ������ ����, �����
function Task_4(pPixels: integer): integer;
begin
  try
    Mouse_Event(MOUSEEVENTF_WHEEL, 0, 0, Cardinal(-pPixels), 0);

    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

// ����� ������ � � ����� ������� ����
function Task_5(pString: string): integer;
var
  i: integer;
  vKey: char;
  CodeKey: integer;
begin
  try
    Delay(500);
    // Sleep(500); // � ��������� ������ ��������
    Mouse_Event(MOUSEEVENTF_WHEEL, 0, 0, Cardinal(-12000), 0);
    Delay(500); // ��� �������� ������ ��������
    // Sleep(500); // � ��������� ������ ��������
    for i := 1 to Length(pString) do
    begin
      vKey := pString[i];
      // ������������ ��� ����� ������� ������
      CodeKey := InVK(vKey);
      // �������� � ��������� ������
      keybd_event(CodeKey, 0, 0, 0);
      keybd_event(CodeKey, 0, KEYEVENTF_KEYUP, 0);
    end;
    keybd_event(VK_RETURN, 0, 0, 0); // ������� 'Enter'.
    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0); // ���������� 'Enter'.
    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

// ������� ����, � ����������� � ����� ������ ����������� � � ����
// � ����� �� ������ ������ � ����
function Task_6(LnCodeForTranslation: string; ListLanguages: TListLanguages;
  pIntControl: integer): integer;
var
  vIntControl: integer;
  vStrOld, vStrNew: string;

begin
  try
    vIntControl := 0;
    Clipboard.AsText := ' ';
    vStrOld := Clipboard.AsText;
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
    vStrNew := Clipboard.AsText;
    if vStrNew <> vStrOld then
    begin
      vIntControl := 1;
      LnCodeForTranslation := GetLnCodeFromList(vStrNew, ListLanguages);
    end;

    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

// ����������� �������
function Task_7(pIntControl: integer; pClipName, pStrTranslate, pLnFrom,
  pLnCodeForTranslation: string): integer;
var
  vStr: string;
begin
  try
    if pIntControl > 0 then
    begin
      vStr := GoogleTranslate(pClipName, pLnFrom, pLnCodeForTranslation);
      vStr := StringReplace(vStr, #13, '', [rfReplaceAll, rfIgnoreCase]);
      if Length(vStr) > 100 then // � ������ �������
        vStr := Copy(vStr, 1, 100);

      pStrTranslate := vStr;
      // ��������� �� ���� � ����� �����
      Clipboard.AsText := vStr; // TranslateText.Text[0];
      // ���������� ���� ������� ������
      Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
      Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
      // �������� �� ������ � ����
      keybd_event(VK_LCONTROL, 0, 0, 0); // ������� ������ Ctrl.
      keybd_event(Ord('V'), 0, 0, 0); // ������� 'C'.
      keybd_event(Ord('V'), 0, KEYEVENTF_KEYUP, 0); // ���������� 'C'.
      keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0);
      // ���������� ������ Ctrl.
    end;

    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

// ����������� �������
function Task_8(): integer;
begin
  try
    Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
    Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);

    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

// ����������� �������
function Task_9(): integer;
begin
  try
    Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); // ����� ����
    Mouse_Event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);

    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

// ���������� ���� ������
function Task_101(pX, pY, pRepeat: integer; pListLanguages: TListLanguages;
  var pLastLng: string): integer;
const
  cMaxCicle: integer = 300;
var
  vCicle: integer; // ������ ������������
  vRet: integer;
  vPausePosClick: integer;
  vPause1: integer;
  vPause2: integer;
  vNameLenguage: string;
  vNextLng: string;
  vX, vY: integer; // ��������� ����������

begin
  if pLastLng = 'unknown' then
  begin
    Exit;
  end;

  try
    vPausePosClick := 150;
    vPause1 := 700;
    vPause2 := 850;
    vCicle := 0;
    // ����� ������ - ����� ����� �� ������! � ������� �� �����
    repeat
      // ������ ����� ��� �����
      vNextLng := GetNextLnCodeForEnter(pLastLng, pListLanguages);
      // ������ ���� ����� ��������� ����
      if vNextLng <> '' then
      begin
        // ���������� ������ ������� ���� � ������� ������
        vRet := Task_1(pX, pY);
        // �����
        vRet := Task_3(vPausePosClick);
        // ����
        vRet := Task_2();
        // �����
        vRet := Task_3(vPause1);

        // ������ ����� ��� �����
        vNextLng := GetNextLnCodeForEnter(pLastLng, pListLanguages);

        // ���� ������ ����� ����� ���� ���������� ����
        GetPosXY(vX, vY);
        if (pX <> vX) or (pY <> vY) then
        begin
          showmessage(intToStr(pX) + ':' + intToStr(pY) + ' != '
                      + intToStr(vX) + ':' + intToStr(vY));
          Exit;
        end;

        vNameLenguage := GetNameEnterOnLnCodeFromList(vNextLng, pListLanguages);
        vRet := Task_5(vNameLenguage);
        pLastLng := vNextLng;
        // ����� 2
        vRet := Task_3(vPause2);
        // �����
        vRet := Task_4(20000);
        // ����� ����������������
        vRet := Task_3(vPausePosClick);
      end;
      inc(vCicle);
    until ((vNextLng = '') or (pRepeat = 0) or (vCicle >= cMaxCicle));
    result := 1;
  except
    result := -1;
    Exit;
  end;
end;

procedure Delay(dwMilliseconds: LongInt);
var
  iStart, iStop: DWORD;
begin
  iStart := GetTickCount;
  repeat
    iStop := GetTickCount;
    Sleep(1); // ����������� ��������� �������� ����������
    // ��������� �������� �������� ������ ������ �����
    Application.ProcessMessages;
  until (iStop - iStart) >= dwMilliseconds;
end;

end.
