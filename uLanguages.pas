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
    vList[i].LnCode := 'az';
    vList[i].NameForEnter := 'АЗЕРБАЙДЖАНСКИЙ';
    vList[i].NameForRead := 'Азербайджанский';


    i := 2;
    vList[i].Id := i;
    vList[i].LnCode := 'ar';
    vList[i].NameForEnter := 'АРАБСКИЙ';
    vList[i].NameForRead := 'Арабский';

    i := 3;
    vList[i].Id := i;
    vList[i].LnCode := 'hy';
    vList[i].NameForEnter := 'АРМЯНСКИЙ';
    vList[i].NameForRead := 'Армянский';

    i := 4;
    vList[i].Id := i;
    vList[i].LnCode := 'be';
    vList[i].NameForEnter := 'БЕЛОРУССКИЙ';
    vList[i].NameForRead := 'Белорусский';

    i := 5;
    vList[i].Id := i;
    vList[i].LnCode := 'bn';
    vList[i].NameForEnter := 'БЕНГАЛЬСКИЙ';
    vList[i].NameForRead := 'Бенгальский';

    i := 6;
    vList[i].Id := i;
    vList[i].LnCode := 'bg';
    vList[i].NameForEnter := 'БОЛГАРСКИЙ';
    vList[i].NameForRead := 'Болгарский';

    i := 7;
    vList[i].Id := i;
    vList[i].LnCode := 'bs';
    vList[i].NameForEnter := 'БОСНИЙСКИЙ';
    vList[i].NameForRead := 'Боснийский';

    i := 8;
    vList[i].Id := i;
    vList[i].LnCode := 'hu';
    vList[i].NameForEnter := 'ВЕНГЕРСКИЙ';
    vList[i].NameForRead := 'Венгерский';

    i := 9;
    vList[i].Id := i;
    vList[i].LnCode := 'el';
    vList[i].NameForEnter := 'ГРЕЧЕСКИЙ';
    vList[i].NameForRead := 'Греческий';

    i := 10;
    vList[i].Id := i;
    vList[i].LnCode := 'ka';
    vList[i].NameForEnter := 'ГРУЗИНСКИЙ';
    vList[i].NameForRead := 'Грузинский';

    i := 11;
    vList[i].Id := i;
    vList[i].LnCode := 'da';
    vList[i].NameForEnter := 'ДАТСКИЙ';
    vList[i].NameForRead := 'Датский';

    i := 12;
    vList[i].Id := i;
    vList[i].LnCode := 'iw';
    vList[i].NameForEnter := 'ИВРИТ';
    vList[i].NameForRead := 'Иврит';

    i := 13;
    vList[i].Id := i;
    vList[i].LnCode := 'ga';
    vList[i].NameForEnter := 'ИРЛАНДСКИЙ';
    vList[i].NameForRead := 'Ирландский';

    i := 14;
    vList[i].Id := i;
    vList[i].LnCode := 'is';
    vList[i].NameForEnter := 'ИСЛАНДСКИЙ';
    vList[i].NameForRead := 'Исландский';

    i := 15;
    vList[i].Id := i;
    vList[i].LnCode := 'es';
    vList[i].NameForEnter := 'ИСПАНСКИЙ';
    vList[i].NameForRead := 'Испанский';

    i := 16;
    vList[i].Id := i;
    vList[i].LnCode := 'it';
    vList[i].NameForEnter := 'ИТАЛЬЯНСКИЙ';
    vList[i].NameForRead := 'Итальянский';

    i := 17;
    vList[i].Id := i;
    vList[i].LnCode := 'kk';
    vList[i].NameForEnter := 'КАЗАХСКИЙ';
    vList[i].NameForRead := 'Казахский';

    i := 18;
    vList[i].Id := i;
    vList[i].LnCode := 'ky';
    vList[i].NameForEnter := 'КИРГИЗСКИЙ';
    vList[i].NameForRead := 'Киргизский';

    i := 19;
    vList[i].Id := i;
    vList[i].LnCode := 'zh-CN';
    vList[i].NameForEnter := 'КИТАЙСКИЙ';
    vList[i].NameForRead := 'Китайский';

    i := 20;
    vList[i].Id := i;
    vList[i].LnCode := 'ko';
    vList[i].NameForEnter := 'КОРЕЙСКИЙ';
    vList[i].NameForRead := 'Корейский';

    i := 21;
    vList[i].Id := i;
    vList[i].LnCode := 'la';
    vList[i].NameForEnter := 'ЛАТИНСКИЙ';
    vList[i].NameForRead := 'Латинский';

    i := 22;
    vList[i].Id := i;
    vList[i].LnCode := 'lv';
    vList[i].NameForEnter := 'ЛАТЫШСКИЙ';
    vList[i].NameForRead := 'Латышский';

    i := 23;
    vList[i].Id := i;
    vList[i].LnCode := 'lt';
    vList[i].NameForEnter := 'ЛИТОВСКИЙ';
    vList[i].NameForRead := 'Литовский';


    i := 24;
    vList[i].Id := i;
    vList[i].LnCode := 'lb';
    vList[i].NameForEnter := 'ЛЮКСЕМБУРСКИЙ';
    vList[i].NameForRead := 'Люксембурский';

    i := 25;
    vList[i].Id := i;
    vList[i].LnCode := 'ms';
    vList[i].NameForEnter := 'МАЛАЙСКИЙ';
    vList[i].NameForRead := 'Малайский';

    i := 26;
    vList[i].Id := i;
    vList[i].LnCode := 'mn';
    vList[i].NameForEnter := 'МОНГОЛЬСКИЙ';
    vList[i].NameForRead := 'Монгольский';

    i := 27;
    vList[i].Id := i;
    vList[i].LnCode := 'de';
    vList[i].NameForEnter := 'НЕМЕЦКИЙ';
    vList[i].NameForRead := 'Немецкий';

    i := 28;
    vList[i].Id := i;
    vList[i].LnCode := 'nl';
    vList[i].NameForEnter := 'НИДЕРЛАНДСКИЙ';
    vList[i].NameForRead := 'Нидерландский';

    i := 29;
    vList[i].Id := i;
    vList[i].LnCode := 'no';
    vList[i].NameForEnter := 'НОРВЕЖСКИЙ';
    vList[i].NameForRead := 'Норвежский';

    i := 30;
    vList[i].Id := i;
    vList[i].LnCode := 'pl';
    vList[i].NameForEnter := 'ПОЛЬСКИЙ';
    vList[i].NameForRead := 'Польский';

    i := 31;
    vList[i].Id := i;
    vList[i].LnCode := 'pt';
    vList[i].NameForEnter := 'ПОРТУГАЛЬСКИЙ';
    vList[i].NameForRead := 'Португальский';

    i := 32;
    vList[i].Id := i;
    vList[i].LnCode := 'ro';
    vList[i].NameForEnter := 'РУМЫНСКИЙ';
    vList[i].NameForRead := 'Румынский';

    i := 33;
    vList[i].Id := i;
    vList[i].LnCode := 'ru';
    vList[i].NameForEnter := 'РУССКИЙ';
    vList[i].NameForRead := 'Русский';

    i := 34;
    vList[i].Id := i;
    vList[i].LnCode := 'sr';
    vList[i].NameForEnter := 'СЕРБСКИЙ';
    vList[i].NameForRead := 'Сербский';

    i := 35;
    vList[i].Id := i;
    vList[i].LnCode := 'si';
    vList[i].NameForEnter := 'СИГНАЛЬСКИЙ';
    vList[i].NameForRead := 'Сигнальский';

    i := 36;
    vList[i].Id := i;
    vList[i].LnCode := 'sk';
    vList[i].NameForEnter := 'СЛОВАЦКИЙ';
    vList[i].NameForRead := 'Словацкий';

    i := 37;
    vList[i].Id := i;
    vList[i].LnCode := 'so';
    vList[i].NameForEnter := 'СЛОВЕНСКИЙ';
    vList[i].NameForRead := 'Словенский';

    i := 38;
    vList[i].Id := i;
    vList[i].LnCode := 'tr';
    vList[i].NameForEnter := 'ТУРЕЦКИЙ';
    vList[i].NameForRead := 'Турецкий';

    i := 39;
    vList[i].Id := i;
    vList[i].LnCode := 'uz';
    vList[i].NameForEnter := 'УЗБЕКСКИЙ';
    vList[i].NameForRead := 'Узбекский';

    i := 40;
    vList[i].Id := i;
    vList[i].LnCode := 'uk';
    vList[i].NameForEnter := 'УКРАИНСКИЙ';
    vList[i].NameForRead := 'Украинский';

    i := 41;
    vList[i].Id := i;
    vList[i].LnCode := 'ur';
    vList[i].NameForEnter := 'УРДУ';
    vList[i].NameForRead := 'Урду';

    i := 42;
    vList[i].Id := i;
    vList[i].LnCode := 'fi';
    vList[i].NameForEnter := 'ФИНСКИЙ';
    vList[i].NameForRead := 'Финский';

    i := 43;
    vList[i].Id := i;
    vList[i].LnCode := 'fr';
    vList[i].NameForEnter := 'ФРАНЦУЗСКИЙ';
    vList[i].NameForRead := 'Французский';

    i := 44;
    vList[i].Id := i;
    vList[i].LnCode := 'hi';
    vList[i].NameForEnter := 'ХИНДИ';
    vList[i].NameForRead := 'Хинди';

    i := 45;
    vList[i].Id := i;
    vList[i].LnCode := 'hr';
    vList[i].NameForEnter := 'ХОРВАТСКИЙ';
    vList[i].NameForRead := 'Хорватский';

    i := 46;
    vList[i].Id := i;
    vList[i].LnCode := 'cs';
    vList[i].NameForEnter := 'ЧЕШСКИЙ';
    vList[i].NameForRead := 'Чешский';

    i := 47;
    vList[i].Id := i;
    vList[i].LnCode := 'sv';
    vList[i].NameForEnter := 'ШВЕДСКИЙ';
    vList[i].NameForRead := 'Шведский';

    i := 48;
    vList[i].Id := i;
    vList[i].LnCode := 'et';
    vList[i].NameForEnter := 'ЭСТОНСКИЙ';
    vList[i].NameForRead := 'Эстонский';

    i := 49;
    vList[i].Id := i;
    vList[i].LnCode := 'ja';
    vList[i].NameForEnter := 'ЯПОНСКИЙ';
    vList[i].NameForRead := 'Японский';


    result := vList;
  end;

end.
