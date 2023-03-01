unit uTasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  Winapi.Windows, Vcl.Forms,
  uCodeKey;

function Task_1(const pX, pY: integer): integer;
// ����������� ������� � ����������
function Task_2(): integer; // ������ ��������� ���� ������
function Task_3(pMilliseconds: LongInt): integer;
// ����� � ������ � �������������
function Task_4(pPixels: integer): integer; // �����
function Task_5(pString: string): integer;
// ����� ����������� ������ � � ����� ����
function Task_6(): integer;
function Task_7(): integer;
function Task_8(): integer;
function Task_9(): integer;
function Task_100(): integer;

procedure Delay(dwMilliseconds: LongInt);

implementation

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
    Sleep(500); // � ��������� ������ ��������
    Mouse_Event(MOUSEEVENTF_WHEEL, 0, 0, Cardinal(-12000), 0);
    // Delay(500); -- ��� �������� ������ ��������
    Sleep(500);  // � ��������� ������ ��������
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

// ����������� �������
function Task_6(): integer;
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
function Task_7(): integer;
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

// ����������� �������
function Task_100(): integer;
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

procedure Delay(dwMilliseconds: LongInt);
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

end.
