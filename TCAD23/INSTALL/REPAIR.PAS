{$A+,B-,D-,E-,F-,G+,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V-,X-,Y-}
{$M 5024,1024,655360}
Const
  SectorSize = 512;
  RecSector = 3;
  ReadSector = 2;

procedure Sector (Drive, Head, Track, SSec, NSec: byte; var Buf;
                  Writing: byte); near; assembler;
asm
  LES BX, Buf
  mov DL, Drive
  mov DH, Head
  mov CH, Track
  mov CL, SSec
  mov AL, NSec
  mov AH, Writing
  int 13h
  mov AH, Writing
  int 13h
  mov AH, Writing
  int 13h
END;

Type
  TBPB = array [0..$18] of byte;

Var
  Buffer: pointer;
  BPB: ^TBPB absolute Buffer;

BEGIN
  GetMem(Buffer,SectorSize);
  Sector(1,0,0,1,1,Buffer^,ReadSector);
  BPB^[$15]:=$FB;
  Sector(1,0,0,1,1,Buffer^,RecSector);
  BPB^[$15]:=0;
  Sector(1,0,80,1,1,Buffer^,RecSector);
  BPB^[$13]:=$40;
  BPB^[$15]:=$F0;
  Sector(1,0,0,1,1,Buffer^,RecSector);
  FreeMem(Buffer,SectorSize);
END.