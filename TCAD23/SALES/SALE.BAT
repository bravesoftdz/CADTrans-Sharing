rem lh c:\tools\800
rem format b: /t:81 /n:18 /u /V:TCAD
repair
format b: /u /q /V:TCAD
copy install.exe b:
rem bpc cad.pas
b:
md data
d:
rem copy CAD.EXE B:\DATA
rem copy CAD.OVR B:\DATA
rem copy v23.res B:\DATA
rem copy TCAD.HLP B:\DATA
rem copy *.DBF B:\DATA
rem copy credits.txt+credits.inc credits.txt