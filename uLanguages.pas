unit uLanguages;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  System.JSON, System.Net.HTTPClient,
  System.NetEncoding;

type
  TLanguage = record
    Id: integer; // ����� �� �������
    LnCode: string;
    NameForEnter: string;
    NameForRead: string;
  end;

type
  TListLanguages = Array [1 .. 1000] of TLanguage;

function InitListLanguages(): TListLanguages;
function GetLnCode(NameRead: String): String;
function GetLnCodeFromList(NameRead: String; ListLanguages : TListLanguages): String;

implementation

function InitListLanguages(): TListLanguages;
var
  vList: TListLanguages;
  i: integer;
begin
  i := 1;
  vList[i].Id := i;
  vList[i].LnCode := 'az';
  vList[i].NameForEnter := '���������������';
  vList[i].NameForRead := '���������������';

  i := 2;
  vList[i].Id := i;
  vList[i].LnCode := 'ar';
  vList[i].NameForEnter := '��������';
  vList[i].NameForRead := '��������';

  i := 3;
  vList[i].Id := i;
  vList[i].LnCode := 'hy';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 4;
  vList[i].Id := i;
  vList[i].LnCode := 'be';
  vList[i].NameForEnter := '�����������';
  vList[i].NameForRead := '�����������';

  i := 5;
  vList[i].Id := i;
  vList[i].LnCode := 'bn';
  vList[i].NameForEnter := '�����������';
  vList[i].NameForRead := '�����������';

  i := 6;
  vList[i].Id := i;
  vList[i].LnCode := 'bg';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 7;
  vList[i].Id := i;
  vList[i].LnCode := 'bs';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 8;
  vList[i].Id := i;
  vList[i].LnCode := 'hu';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 9;
  vList[i].Id := i;
  vList[i].LnCode := 'el';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 10;
  vList[i].Id := i;
  vList[i].LnCode := 'ka';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 11;
  vList[i].Id := i;
  vList[i].LnCode := 'da';
  vList[i].NameForEnter := '�������';
  vList[i].NameForRead := '�������';

  i := 12;
  vList[i].Id := i;
  vList[i].LnCode := 'iw';
  vList[i].NameForEnter := '�����';
  vList[i].NameForRead := '�����';

  i := 13;
  vList[i].Id := i;
  vList[i].LnCode := 'ga';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 14;
  vList[i].Id := i;
  vList[i].LnCode := 'is';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 15;
  vList[i].Id := i;
  vList[i].LnCode := 'es';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 16;
  vList[i].Id := i;
  vList[i].LnCode := 'it';
  vList[i].NameForEnter := '�����������';
  vList[i].NameForRead := '�����������';

  i := 17;
  vList[i].Id := i;
  vList[i].LnCode := 'kk';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 18;
  vList[i].Id := i;
  vList[i].LnCode := 'ky';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 19;
  vList[i].Id := i;
  vList[i].LnCode := 'zh-CN';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 20;
  vList[i].Id := i;
  vList[i].LnCode := 'ko';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 21;
  vList[i].Id := i;
  vList[i].LnCode := 'la';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 22;
  vList[i].Id := i;
  vList[i].LnCode := 'lv';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 23;
  vList[i].Id := i;
  vList[i].LnCode := 'lt';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 24;
  vList[i].Id := i;
  vList[i].LnCode := 'lb';
  vList[i].NameForEnter := '�������������';
  vList[i].NameForRead := '�������������';

  i := 25;
  vList[i].Id := i;
  vList[i].LnCode := 'ms';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 26;
  vList[i].Id := i;
  vList[i].LnCode := 'mn';
  vList[i].NameForEnter := '�����������';
  vList[i].NameForRead := '�����������';

  i := 27;
  vList[i].Id := i;
  vList[i].LnCode := 'de';
  vList[i].NameForEnter := '��������';
  vList[i].NameForRead := '��������';

  i := 28;
  vList[i].Id := i;
  vList[i].LnCode := 'nl';
  vList[i].NameForEnter := '�������������';
  vList[i].NameForRead := '�������������';

  i := 29;
  vList[i].Id := i;
  vList[i].LnCode := 'no';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 30;
  vList[i].Id := i;
  vList[i].LnCode := 'pl';
  vList[i].NameForEnter := '��������';
  vList[i].NameForRead := '��������';

  i := 31;
  vList[i].Id := i;
  vList[i].LnCode := 'pt';
  vList[i].NameForEnter := '�������������';
  vList[i].NameForRead := '�������������';

  i := 32;
  vList[i].Id := i;
  vList[i].LnCode := 'ro';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 33;
  vList[i].Id := i;
  vList[i].LnCode := 'ru';
  vList[i].NameForEnter := '�������';
  vList[i].NameForRead := '�������';

  i := 34;
  vList[i].Id := i;
  vList[i].LnCode := 'sr';
  vList[i].NameForEnter := '��������';
  vList[i].NameForRead := '��������';

  i := 35;
  vList[i].Id := i;
  vList[i].LnCode := 'si';
  vList[i].NameForEnter := '�����������';
  vList[i].NameForRead := '�����������';

  i := 36;
  vList[i].Id := i;
  vList[i].LnCode := 'sk';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 37;
  vList[i].Id := i;
  vList[i].LnCode := 'so';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 38;
  vList[i].Id := i;
  vList[i].LnCode := 'tr';
  vList[i].NameForEnter := '��������';
  vList[i].NameForRead := '��������';

  i := 39;
  vList[i].Id := i;
  vList[i].LnCode := 'uz';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 40;
  vList[i].Id := i;
  vList[i].LnCode := 'uk';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 41;
  vList[i].Id := i;
  vList[i].LnCode := 'ur';
  vList[i].NameForEnter := '����';
  vList[i].NameForRead := '����';

  i := 42;
  vList[i].Id := i;
  vList[i].LnCode := 'fi';
  vList[i].NameForEnter := '�������';
  vList[i].NameForRead := '�������';

  i := 43;
  vList[i].Id := i;
  vList[i].LnCode := 'fr';
  vList[i].NameForEnter := '�����������';
  vList[i].NameForRead := '�����������';

  i := 44;
  vList[i].Id := i;
  vList[i].LnCode := 'hi';
  vList[i].NameForEnter := '�����';
  vList[i].NameForRead := '�����';

  i := 45;
  vList[i].Id := i;
  vList[i].LnCode := 'hr';
  vList[i].NameForEnter := '����������';
  vList[i].NameForRead := '����������';

  i := 46;
  vList[i].Id := i;
  vList[i].LnCode := 'cs';
  vList[i].NameForEnter := '�������';
  vList[i].NameForRead := '�������';

  i := 47;
  vList[i].Id := i;
  vList[i].LnCode := 'sv';
  vList[i].NameForEnter := '��������';
  vList[i].NameForRead := '��������';

  i := 48;
  vList[i].Id := i;
  vList[i].LnCode := 'et';
  vList[i].NameForEnter := '���������';
  vList[i].NameForRead := '���������';

  i := 49;
  vList[i].Id := i;
  vList[i].LnCode := 'ja';
  vList[i].NameForEnter := '��������';
  vList[i].NameForRead := '��������';

  result := vList;
end;

function GetLnCode(NameRead: String): String;
var
  vList: TListLanguages;
  i: integer;
begin
  result := 'unknown';
  vList := InitListLanguages();
  i := 1;
  repeat
    if NameRead = vList[i].NameForRead then
    begin
      result := vList[i].LnCode;
      i:=1000;
      break;
    end;
    inc(i);
  until i> 1000 or vList[i].Id = null;
end;

function GetLnCodeFromList(NameRead: String; ListLanguages : TListLanguages): String;
var
  i: integer;
begin
  result := 'unknown';
  i := 1;
  repeat
    if NameRead = ListLanguages[i].NameForRead then
    begin
      result := ListLanguages[i].LnCode;
      i:=1000;
      break;
    end;
    inc(i);
  until i> 1000 or ListLanguages[i].Id = null;
end;

end.
