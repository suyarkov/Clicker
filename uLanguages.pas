unit uLanguages;

interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.JSON, System.Net.HTTPClient,
  System.NetEncoding;

  type TLanguage = record
      Id  	    : integer; // номер по порядку
      LnCode	  : string;
      EnterName	: string;
      ReadName  : string;
  end;
  type TListLanguages = Array [1..1000] of TLanguage;

  function Languages(const AValue, ConstSourceLang, ConstTargetLang: String): String;

implementation

end.
