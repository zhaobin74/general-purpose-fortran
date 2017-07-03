[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                               Manual Reference Pages  - getkey (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    getkey(3f) - read single character from keyboard in hot (raw I/O) mode

CONTENTS

    Syntax
    Description
    Example
    How It Works
    Alternatives
    Origins
    Tested

SYNTAX

DESCRIPTION

    GETKEY(3F) is a C/Fortran combination that (hopefully) lets Fortran read one character at a time in raw I/O mode on most
    platforms.

    Unfortunately (as of this writing), there is no universal standard method using the programming languages Fortran or C for
    reading hot (raw I/O) keystrokes. In this document "Hot" or "Raw" mode, also sometimes called "immediate mode" means each
    keystroke is detected immediately, without requiring a carriage return.

    The best way to know if this will work on your platform is to try it.

EXAMPLE

    Sample program

       program test_getkey
       use M_getkey, only : system_getkey
       character :: A
       integer   :: icount
          icount=0
          write(*,*) begin striking keys to demonstrate interactive raw I/O mode 
          write(*,*) q to quit; up to 40 tries allowed 
          do
             A=system_getkey()
             icount=icount+1
             write(*,*)icount,  f03:key= ,A, -> ,ichar(A)
             !flush(6)
             if(A.eq. q )stop
             if(icount.gt.40)stop
          enddo
       end program test_getkey



HOW IT WORKS

    The getkey(3c) C routine uses commonly available routines to set to raw mode, read a keystroke, and reset to normal mode. Once
    this is working, it is typically easy to make a Fortran routine that calls the C routine. How to make Fortran/C interfaces
    still varies if you do not have a Fortran 2003 compiler.

    getkey.c is the core C routine that you must get working.

    The steps to test the GETKEY(3F) procedure are relatively simple.

Test C program

   First you need to make sure the C routine will work by itself ...


      ########################################
      cc -DTESTPRG -DLinux getkey.c -o testit
         or
      cc -DTESTPRG getkey.c -o testit
         or
      cc -DBSD -DTESTPRG  getkey.c -o testit
         then
      ./testit
      ########################################





    Test common Fortran/C interface style

       Once the C program works; just make an object file and then load it with
       one of the Fortran programs, depending on which compilers you have



    Test using Fortran 2003 ISO_C_BINDING

       If you have a Fortran 2003 compiler, there is a standard-based method for
       the Fortran-to-C interface that is preferable that uses the ISO_C_BINDINGS
       modules. Note that most f90+ compilers now support this 2003 feature as
       an extension ...


          ########################################
          cc -DLinux getkey.c -o
          g95 M_getkey.F90 getkey.o -o testit
          ./testit
          ########################################



    Running the Test Program

       The sample program reads one character at a time until the letter "q"
       is entered. If the C program works in stand-alone mode but none of the
       Fortran examples work you will have to find out how your programming
       environment allows Fortran to call C routines. For this intentionally
       simple routine you usually just need to add an underscore to the
       C name (ie "_getkey" or "getkey_" or make it uppercase "GETKEY")
       to make getkeyC(3c) a Fortran-callable procedure.



ALTERNATIVES

    o   Look at the curses(3c) or ncurses(3c) libraries or similar libraries

    o   Look for extensions in your Fortran compiler documentation (Pass examples back -- I d be glad to see them).

    o   In Unix and GNU/Linux look at the system commands

           stty -cread
              or
           stty raw -echo min 0  time 5





        Sometimes you can use a call to SYSTEM() to set and unset raw I/O mode and then use standard I/O routines; This is a simple
        method; but it is highly OS(Operating System) and compiler dependent and has very high overhead.

    o   Routines that allow input-line editing may provide source that has to read in raw mode.

ORIGINS

    This routine has been on a lot of systems over the years; it dates back to a program that was used to read keypresses from a
    Tektronix 4010 and 4014 raster storage graphics terminal (an xterm(1) still can emulate a Tektronix 4010!).

TESTED

    Recently tested with the Intel compilers on Linux, on a MSWindows machine in the CygWin application, on HP-UX and Solaris. Some
    version of it was used on UniCOS, Tru64, AIX, NextStep, ...

    caveat: communication-related characters such as ctrl-S and ctrl-Q are often still intercepted by the system or by terminal
    emulators.

-----------------------------------------------------------------------------------------------------------------------------------

                                                            getkey (3)                                                July 02, 2017

Generated by manServer 1.08 from 16c878f0-622a-4400-94ab-d34b251319be using man macros.
                                                             [getkey]