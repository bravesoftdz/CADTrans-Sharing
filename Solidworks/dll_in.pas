unit dll_in;

interface
uses Windows;
// _d0- ������� ����
// _d_sh- �������� �������
// _b- ������ �����
// _n- ���������� �������
// _type_size- ��� ������� ������� (�,�, �, �, �, �, �, ��, ��, ��)
function Klin_Skiv(_d0, _d_sh, _b: Real; _n: Byte; _type_size, SavePath: PChar): Boolean; external 'dll.dll';

// _d0- ������� ����
// _d_sh- �������� �������
// _b- ������ �����
function Plosk_Skiv(_d0, _d_sh, _b: Real; SavePath: PChar): Boolean; external 'dll.dll';

// _d0- ������� ����
// _d_sh- �������� �������
// _b- ������ �����
// _n- ���������� �������
// _type_size- ��� ������� ������� (�, �, �)
function PoliKlin_Skiv(_d0, _d_sh, _b: Real; _n: Byte; _type_size, SavePath: PChar): Boolean; external 'dll.dll';

// _d_sh- �������� �������
// _z- ���������� ������
// _m- ������
// _d0- ������� ����
// _b- ������ �����
function Zub_Skiv(_d0, _d_sh, _b,_m: Real; _z: Byte; SavePath: PChar): Boolean; external 'dll.dll';

// _z- ���������� ������
// _m- ������
// _d0- ������� ����
// _b- ������ �����
function KZub(_z: integer; _m, _d0, _b:real; SavePath: PChar): Boolean; external 'dll.dll';
// _z- ���������� ������
// _m- ������
// _d0- ������� ����
// _b- ������ �����
function KosZub(_z: integer; _m, _d0, _b, _anz:real; SavePath: PChar): Boolean; external 'dll.dll';

// ��������� ��� �������� �����
// _z- ���������� ������
// _p- ��� ����
// _d0- ������� ����
// _n- ����� ����� ���� (������ = 2)
function ZubchZv(_d0, _p: Real; _n, _z: integer; SavePath: PChar): Boolean; external 'dll.dll';

// ��������� ��� �������� �����
// _z- ���������� ������
// _p- ��� ����
// _d0- ������� ����
// _n- ����� ����� ���� 
function RolicZv(_d0, _p: Real; _n, _z: integer; SavePath: PChar): Boolean; external 'dll.dll';

// ���������� ������ ��������� ������ ����������
function GetModelLastErrMsg(msg: PChar; strlen: UINT): UINT; external 'dll.dll';

implementation

end.
