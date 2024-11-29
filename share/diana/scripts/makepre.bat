rem -- set up diana front end -- for IBM PC DOS
rem -- assumes table files in \EXPORT
rem -- following should be compiled and linked before running this:
rem --   LOADGRMR, FIXPRE, PARPHASE, LIBPHASE, SEMPHASE, WRITELIB, ERRPHASE
rem -------------------------------
rem -- (Following corresponds to step 9 in front.doc)
if exist *.tmp del *.tmp
MD ADA__LIB
if exist ADA__LIB\*.DCL del ADA__LIB\*.DCL
if exist ADA__LIB\*.BDY del ADA__LIB\*.BDY
if exist ADA__LIB\*.SUB del ADA__LIB\*.SUB
ECHO P ADA__LIB\> ADA__LIB.CTL
TYPE \EXPORT\ADA__LIB.INI >> ADA__LIB.CTL
copy \EXPORT\DIANA.TBL
copy \EXPORT\PARSE.TBL
LOADGRMR
ren $$$.TMP PARSE.VM
rem -------------------------------
rem -- (Following corresponds to unix script makepre)
rem --rm -f *.TMP
if exist *.tmp del *.tmp
rem --ln _standrd.aa "\$\$\$PGM.TMP"
copy \export\_standrd.aa $$$PGM.TMP
rem --cp PARSE.VM "\$\$\$.TMP"
copy PARSE.VM $$$.TMP
rem --chmod 644 "\$\$\$.TMP"
rem --exe/parphase
PARPHASE
rem --exe/fixpre
FIXPRE
rem --exe/writelib
WRITELIB
rem -------------------------------
rem -- (Following compiles the predefined environment)
call front \export\IO__EXC.AA 
call front \export\SYSTEM.AA 
call front \export\CALENDAR.AA 
call front \export\DIR__IO.AA 
call front \export\SEQ__IO.AA 
call front \export\TEXT_IO.AA 
call front \export\UNC__CON.AA 
call front \export\UNC__DEA.AA 
