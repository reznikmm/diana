@echo off
rem -- run Diana front end -- for IBM PC DOS
rem -- note that there is no way to test for prior crash (as in unix)
rem --rm -f *.TMP
if exist *.tmp del *.tmp
rem --if test ! -s $1
rem --then
rem --  echo "**** NO SUCH FILE ****"
rem --  exit 
rem --fi
if exist %1 goto exists
    echo "**** NO SUCH FILE ****"
    goto endup
:exists
rem --ln $1 \$\$\$PGM.TMP
copy %1 $$$pgm.tmp > nul
rem --cp PARSE.VM "\$\$\$.TMP"
copy parse.vm $$$.tmp > nul
rem --chmod 644 "\$\$\$.TMP"
rem --keepgoing=0
rem --if exe/parphase
rem --then keepgoing=0
rem --else keepgoing=1
rem --fi
PARPHASE > runlog.tmp
rem --if test $keepgoing -eq 0
rem --then
rem --  if exe/libphase
rem --  then keepgoing=0
rem --  else keepgoing=1
rem --  fi
rem --fi
LIBPHASE >> runlog.tmp
rem --if test $keepgoing -eq 0
rem --then
rem --  cp \$\$\$.TMP SEMPHASE.TMP
rem --  if exe/semphase
rem --  then keepgoing=0
rem --  else keepgoing=1
rem --  fi
rem --fi
SEMPHASE >> runlog.tmp
rem --if test -s \$\$\$.TMP
rem --then
rem --  if exe/errphase
rem --  then keepgoing=$keepgoing
rem --  else keepgoing=1
rem --  fi
rem --fi
ERRPHASE
rem --if test $keepgoing -eq 0
rem --then
rem --  cp \$\$\$.TMP WRITELIB.TMP
rem --  mv ADA__LIB.TMP ADA__LIB.CTL
rem --  if exe/writelib
rem --  then keepgoing=0
rem --  else keepgoing=1
rem --  fi
rem --  mv WRITELIB.TMP \$\$\$.TMP
rem --fi
copy ADA__LIB.TMP ADA__LIB.CTL > nul
copy $$$.TMP WRITELIB.TMP > nul
WRITELIB
del $$$.TMP
ren WRITELIB.TMP $$$.TMP
