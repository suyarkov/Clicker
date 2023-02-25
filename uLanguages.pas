unit uLanguages;

interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.JSON, System.Net.HTTPClient,
  System.NetEncoding;

  type TLanguage = record
      Id  	        : integer; // номер по порядку
      LnCode	      : string;
      NameForEnter	: string;
      NameForRead   : string;
  end;
  type TListLanguages = Array [1..1000] of TLanguage;

  function InitListLanguages(): TListLanguages;

implementation

  function InitListLanguages(): TListLanguages;
  var
    vList : TListLanguages;
    i   : integer;
  begin
    i := 1;
    vList[i].Id := i;
    vList[i].LnCode := 'ru';
    vList[i].NameForEnter := 'ru';
    vList[i].NameForRead := 'ru';


    result := vList;
  end;

end.
