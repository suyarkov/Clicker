unit uCodeKey;

interface

function InVK(pKey: char) : word;
implementation

function InVK(pKey: char) : word;
var vCode : word;
begin
  begin
    case pKey of
    '�', '�':  vCode := 70;
    '�', '�':  vCode := 188;
    '�', '�':  vCode := 68;
    '�', '�':  vCode := 85;
    '�', '�':  vCode := 76;
    '�', '�':  vCode := 84;
    '�', '�':  vCode := 186;
    '�', '�':  vCode := 80;
    '�', '�':  vCode := 66;
    '�', '�':  vCode := 81;
    '�', '�':  vCode := 82;
    '�', '�':  vCode := 75;
    '�', '�':  vCode := 86;
    '�', '�':  vCode := 89;
    '�', '�':  vCode := 74;
    '�', '�':  vCode := 71;
    '�', '�':  vCode := 72;
    '�', '�':  vCode := 67;
    '�', '�':  vCode := 78;
    '�', '�':  vCode := 69;
    '�', '�':  vCode := 65;
    '�', '�':  vCode := 219;
    '�', '�':  vCode := 87;
    '�', '�':  vCode := 80;
    '�', '�':  vCode := 73;
    '�', '�':  vCode := 79;
    '�', '�':  vCode := 221;
    '�', '�':  vCode := 83;
    '�', '�':  vCode := 77;
    '�', '�':  vCode := 222;
    '�', '�':  vCode := 190;
    '�', '�':  vCode := 90;
    end;

  end;
   Result := vCode;
end;

end.
