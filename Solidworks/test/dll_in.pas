unit dll_in;

interface
uses Windows;
// _d0- диаметр вала
// _d_sh- наружный диаметр
// _b- ширина венца
// _n- количество канавок
// _type_size- тип профиля канавки (о,а, б, в, г, д, е, уо, уа, уб)
function Klin_Skiv(_d0, _d_sh, _b: Real; _n: Byte; _type_size, SavePath: PChar): Boolean; external 'dll.dll';

// _d0- диаметр вала
// _d_sh- наружный диаметр
// _b- ширина венца
function Plosk_Skiv(_d0, _d_sh, _b: Real; SavePath: PChar): Boolean; external 'dll.dll';

// _d0- диаметр вала
// _d_sh- наружный диаметр
// _b- ширина венца
// _n- количество канавок
// _type_size- тип профиля канавки (к, л, м)
function PoliKlin_Skiv(_d0, _d_sh, _b: Real; _n: Byte; _type_size, SavePath: PChar): Boolean; external 'dll.dll';

// _d_sh- наружный диаметр
// _z- количество зубьев
// _m- модуль
// _d0- диаметр вала
// _b- ширина венца
function Zub_Skiv(_d0, _d_sh, _b,_m: Real; _z: Byte; SavePath: PChar): Boolean; external 'dll.dll';

// _z- количество зубьев
// _m- модуль
// _d0- диаметр вала
// _b- ширина венца
function KZub(_z: integer; _m, _d0, _b:real; SavePath: PChar): Boolean; external 'dll.dll';
// _z- количество зубьев
// _m- модуль
// _d0- диаметр вала
// _b- ширина венца
function KosZub(_z: integer; _m, _d0, _b, _anz:real; SavePath: PChar): Boolean; external 'dll.dll';

// звездочка для зубчатых цепей
// _z- количество зубьев
// _p- шаг цепи
// _d0- диаметр вала
// _n- число рядов цепи (всегда = 2)
function ZubchZv(_d0, _p: Real; _n, _z: integer; SavePath: PChar): Boolean; external 'dll.dll';

// звездочка для зубчатых цепей
// _z- количество зубьев
// _p- шаг цепи
// _d0- диаметр вала
// _n- число рядов цепи 
function RolicZv(_d0, _p: Real; _n, _z: integer; SavePath: PChar): Boolean; external 'dll.dll';

// возвращает строку последней ошибки построения
function GetModelLastErrMsg(msg: PChar; strlen: UINT): UINT; external 'dll.dll';

implementation

end.
