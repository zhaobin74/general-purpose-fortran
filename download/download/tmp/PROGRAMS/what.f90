!-----------------------------------------------------------------------------------------------------------------------------------
program pedigree                               ! display file metadata embedded using SCCS identification strings
use M_kracken, only: kracken,lget,sget         ! command argument parser
use M_strings, only: split, substitute
use M_debug,   only: stderr, debug
implicit none

character(len=*),parameter :: ident="@(#) what(1f): extract SCCS-style identification strings from a file"

character(len=409600),allocatable :: filename(:) ! array of filenames to read
character(len=256)              :: message     ! message field for returned messages
logical             :: stop_on_first = .FALSE. ! switch to show only first string found or all
logical             :: html          = .FALSE. ! switch to output as an HTML document with a table
logical             :: table         = .FALSE. ! switch to output as an HTML table
logical             :: quiet         = .FALSE. ! switch to suppress error messages
integer             :: fd                      ! file descriptor for file currently being read
integer             :: found = 0               ! command return status
integer             :: ios                     ! hold I/O error flag
integer             :: i                       ! loop counter
logical             :: iquit=.FALSE.           ! flag to quit after help and/or version number displayed
!-----------------------------------------------------------------------------------------------------------------------------------
! define command arguments and parse command line
call kracken('what','-s .F. -version .F. -help .F. -html .F. -table .F. -q .F. -debug .F.')
!-----------------------------------------------------------------------------------------------------------------------------------
if(lget('what_help'))then                      ! if -help was specified on command line, display help and set flag to exit
   call help()
   iquit=.true.
endif
if(lget('what_version'))then                   ! if -version was specified on command line, display version and set flag to exit
   call what__print_version()                  ! auto-generated routine generated at compilation time
   iquit=.true.
endif
if(iquit) stop                                 ! exit if either the help text or version number was requested
!-----------------------------------------------------------------------------------------------------------------------------------
debug=lget('what_debug')                       ! get value of command line switch -debug
html=lget('what_html')                         ! get value of command line switch -html
table=lget('what_table')                       ! get value of command line switch -table
quiet=lget('what_q')                           ! get value of command line switch -q to switch whether to report error messages
!-----------------------------------------------------------------------------------------------------------------------------------
stop_on_first=lget('what_s')                   ! if selected on command line, only display one string per file
!-----------------------------------------------------------------------------------------------------------------------------------
call split(sget('what_oo'),filename)           ! get filenames to scan from command line
if(size(filename).eq.0)then
   filename=['-']
endif
!-----------------------------------------------------------------------------------------------------------------------------------

if(html)then                                       ! if html output is selected print beginning of a simple HTML document
   write(*,'(a)')'<html><head><title></title></head><body><table border="1">'
elseif(table)then
   write(*,'(a)')'<table border="1">'
endif

FILES: do i=1,size(filename)                       ! step thru filenames to scan
   if(filename(i).eq.'-'.or.filename(i).eq.'')then ! input file is standard input, but currently cannot be opened as a stream
      fd=5
   else                                            ! open stream file
      fd=10
      !-------- KLUDGE TO GET AROUND ERROR IN gfortran GNU Fortran (GCC) 4.9.3 20150826
      !-------- Get no error on opening files like directories, but then a READ crashes
      !-------- Open as regular file
      open(unit=fd,file=trim(filename(i)),status='old',iostat=ios,iomsg=message)
      if(ios.ne.0)then
         if(.not.quiet)then
            call stderr('error: could not open '//trim(filename(i)))
            call stderr('error: '//trim(message))
         endif
         close(unit=fd,iostat=ios)
         cycle FILES
      else
         close(unit=fd,iostat=ios)
      endif
      !--------
      open(unit=fd,file=trim(filename(i)),access='stream',status='old',iostat=ios,action='read',form='unformatted',iomsg=message)
      if(debug)then
         write(*,*)'*what* open unit=',fd,'i= ',i,' file=',trim(filename(i)),'iostat=',ios
      endif
      if(ios.ne.0)then
         if(.not.quiet)then
            call stderr('error: could not open '//trim(filename(i)))
            call stderr('error: '//trim(message))
         endif
         if(debug)then
            write(*,*)'*what* close on bad open unit=',fd,'iostat=',ios
         endif
         flush(unit=fd,iostat=ios)
         close(unit=fd,iostat=ios)
         cycle FILES
      endif
   endif
   if(html.or.table)then
      write(*,'(3a)',advance='no') '<tr><td><a href="',trim(filename(i)),'">'
      write(*,'(a,"</a></td>")') trim(filename(i))
   else
      if(stop_on_first)then
         write(*,'(a,":")',advance='no')trim(filename(i))
      else
         write(*,'(a,":")',advance='yes')trim(filename(i))
      endif
   endif
   found = found + process_file()
   if(debug)then
      write(*,*)'*what* close unit=',fd,'iostat=',ios
   endif
   flush(unit=fd,iostat=ios)
   close(unit=fd,iostat=ios)
enddo FILES
if(html)then
   write(*,'(a)')'</table></body></html>'
elseif(table)then
   write(*,'(a)')'</table>'
endif
select case (found)
case(:0) ; stop ! 1
case(1:) ; stop
end select
!-----------------------------------------------------------------------------------------------------------------------------------
contains
! include "what__print_version.h"
subroutine what__print_version()  ! automatically generated QA routine; may be removed if desired
!@(#)what__print_version(3f) - print the command name, version and owner strings, and compiler information
   use ISO_FORTRAN_ENV, only: compiler_options,compiler_version,error_unit,input_unit,output_unit
   use M_strings, only: split
   implicit none
   integer,parameter  :: io=OUTPUT_UNIT                                    ! pre-attached standard output for this PE
!-----------------------------------------------------------------------------------------------------------------------------------
!  strings contain prefix @(#) and suffix " so strings should show up via what(1) command; trimmed when printed by this procedure
!-----------------------------------------------------------------------------------------------------------------------------------
   character(len=4096),allocatable :: options(:)                           ! array to hold tokenized compiler options
!-----------------------------------------------------------------------------------------------------------------------------------
   write(io,'(80("="))')
!-----------------------------------------------------------------------------------------------------------------------------------
!  DEVELOPER-SUPPLIED INFORMATION (USUALLY)
   ! Dublin Core Metadata Element Set (supplemented)
   call sccs_id('@(#)title            :: what(1f)>')
   call sccs_id('@(#)description      :: extract SCCS-style metadata from files>')
   ! used to tie this code (and compilation) to a unique key that can be used in QA records, as a database key, ...
   ! FYI        : depending on what key type you use, it may be able to extract the time the key was generated from the key value

  !call sccs_id('@(#)identifier       :: VERSION=1.0.2 UUID=e5b12225-6b11-4425-917f-c027aefb25ae>')
   call sccs_id('@(#)identifier       :: VERSION=2.0.0 UUID=cc787735-fed2-42d3-8cb2-515ea7599873>')
   ! Birth        : 2015-07-12 12:24:04 Change: 2015-07-19 23:33:46
   call sccs_id('@(#)date             :: 2015/07/17  1:23:28 PM>')  ! creation, modification, registration
   call sccs_id('@(#)status           :: PRODUCTION 20160202>') ! development, test, production

   call sccs_id('@(#)rights           :: Public Domain>')
   call sccs_id('@(#)creator          :: John S. Urban>')
   call sccs_id('@(#)publisher        :: CONTACT=urbanjost@comcast.net>')
   call sccs_id('@(#)contributor      :: >')
   call sccs_id('@(#)subject          :: metadata,SCCS identification string>')

   call sccs_id('@(#)type             :: executable command>')
   call sccs_id('@(#)format           :: Fortran program>')

   ! stat(3c) / stat(1)        :file(1):ls(1) info. at time of compilation, useful even if INCLUDE/MODULE/PREPROCESSOR used
   call sccs_id('@(#)source           :: LIBRARY/libjust4/EXE/WHAT/what.html>') ! typically cpp(1) macro __FILE__
   call sccs_id('@(#)language         :: english>')
   call sccs_id('@(#)relation         :: ISO/IEC DIS 9945-2:1992, Information technology - POSIX-Part 2: Shell and Utilities>')
   call sccs_id('@(#)coverage         :: ORIGIN=Pennsylvania,USA ORIGIN_TGN=7007710>')
!  COMPILATION HOST
   call sccs_id('@(#)origin           :: CYGWIN_NT-6.3 buzz 2.0.3(0.287/5/3) 2015-06-03 13:57 x86_64 Cygwin>') !uname(3c)
!-----------------------------------------------------------------------------------------------------------------------------------
   write(io,'("=================:: ")')
!  COMPILER-RELATED COMPILATION INFORMATION
   write(io,'("Compiler version :: ",a)') COMPILER_VERSION()
   ! source_file_name  most compilers have predefined buildit macros such as ,__DATE__, __FILE__ that preprocessors expand
   write(io,'("Compilation Date :: ",a)') '2015/07/17 11:32:57 PM' !__DATE__
                                                      ! (hopefully) pretty-print compiler options
   call split(COMPILER_OPTIONS(),options)             ! parse compiler options on ' ' (likely delimiter)
   write(io,'("Compiler options ::")',advance='no')   ! only start new lines when a - begins the option
   do i=1,size(options)
      if(options(i)(1:1).eq.'-'.and.i.ne.1)then
         write(io,'(a)')
         write(io,'("                 :: ",a)',advance='no') trim(options(i))
      else
         write(io,'(" ",a)',advance='no') trim(options(i))
      endif
   enddo
   write(io,'(/,80("="))')
end subroutine what__print_version
!-----------------------------------------------------------------------------------------------------------------------------------
subroutine help()
implicit none
character(len=80),allocatable  :: usage(:)
! could add search for '$keyword: description$' as used by RCS too. See ident(command)
! '@'+'('+'#'+')' originated with SCCS (probably). See SCCS what(1) command
usage=[&
'NAME                                                                            ',&
'     what - [DEVELOPER] extract SCCS-style metadata from a file                 ',&
'                                                                                ',&
'SYNOPSIS                                                                        ',&
'     what [ filename(s) [-s] [-q] [-html|-table] ] | [ [-help] [-version] ]     ',&
'                                                                                ',&
'DESCRIPTION                                                                     ',&
'     The what(1) utility searches each filename for occurrences of the          ',&
'     SCCS identification string @### and prints what follows up to a            ',&
'     ",>,\, or non-printable ASCII character(NULL,NEWLINE,TAB,.....).           ',&
'                                                                                ',&
'     This allows files to quickly be scanned for metadata such as simple        ',&
'     descriptions, versions and pedigree placed in the files.                   ',&
'                                                                                ',&
'OPTIONS                                                                         ',&
'     The following options are supported:                                       ',&
'                                                                                ',&
'     -s        Stops after the first occurrence of the pattern in each file.    ',&
'     -html     Print output as a table in an HTML document.                     ',&
'     -table    Print output as a HTML table.                                    ',&
'     -q        Quiet mode (do not report errors when opening filenames)         ',&
'     -help     Print description of this program.                               ',&
'     -version  Print version information for this program                       ',&
'                                                                                ',&
'EXAMPLES                                                                        ',&
'     Example 1: Extracting SCCS version information                             ',&
'                                                                                ',&
'     Text files are generally easy to place a @### string into by using the     ',&
'     appropriate format for a comment in the language being used.               ',&
'     Exactly how to place a string into an object file or executable may        ',&
'     vary depending on your compiler or optimization level. Generally the       ',&
'     following strings will work:                                               ',&
'       o C/C++    #ident "@###identification info"                              ',&
'       o C:       char sccsid[] = "@###identification info"                     ',&
'                  /* must be global scope or optimization usually removes it */ ',&
'       o C++:     #pragma ident "@###identification info"                       ',&
'                  /* many references say this should work, but unreliable */    ',&
'       o Fortran: character(len=*),parameter::sccsid= ''@###identification info'' ',&
'                  be careful it is not removed by high optimization levels      ',&
'                                                                                ',&
'     For example, if program.f90 were compiled to yield program.o and           ',&
'     executable a.out, the command:                                             ',&
'        what program.f90 program.o a.out                                        ',&
'     should produce:                                                            ',&
'                                                                                ',&
'        program.f90:                                                            ',&
'              identification info                                               ',&
'        program.o:                                                              ',&
'              identification info                                               ',&
'        a.out:                                                                  ',&
'              identification info                                               ',&
'                                                                                ',&
'     A few tips for common interpreted file types:                              ',&
'       o shell script:  #@###identification info                                ',&
'       o HTML:   <!--"@###identification info"-->                               ',&
'                                                                                ',&
'EXIT STATUS                                                                     ',&
'     The following exit values are returned:                                    ',&
'        0     Any matches were found.                                           ',&
'        1     No matches found.                                                 ',&
'                                                                                ',&
'ENVIRONMENT VARIABLES                                                           ',&
'                                                                                ',&
'SEE ALSO                                                                        ',&
'   The following commands can help identify file contents                       ',&
'     file(1), strings(1), nm(1), ldd(1), cpp(1), fpp(1),                        ',&
'     ident(1), ar(1), objdump(1), ranlib(1),                                    ',&
'     [if SCCS installed ] sccs(1), sccs-admin(1), sccs-get(1), ...              ',&
'                                                                                ',&
'   Related topics: schema, IDL (Information Description Language), ...          ',&
'                                                                                ',&
'BUGS                                                                            ',&
'     There is a remote possibility that a spurious occurrence of the "@###"     ',&
'     pattern could be found by what(1).                                         ',&
'                                                                                ',&
'     If standard input is processed it must be a text file with line width less ',&
'     than 4,096 characters or errors may occur.                                 ',&
'                                                                                ',&
'     The length of the file arguments may be limited depending on what          ',&
'     command-line argument parser is used.                                      ',&
'                                                                                ']
!-----------------------------------------------------------------------------------------------------------------------------------
   do i=1,size(usage)
      call substitute(usage(i),'###','(#)')  ! Picky. Do not want the lines to show if do a what(1) of the what(1) binary
      write(*,'(a)')trim(usage(i))
   enddo
end subroutine help
!-----------------------------------------------------------------------------------------------------------------------------------
function process_file() RESULT (ifound_total_back)
! @(#)process_file - process the supplied file as a stream, and write output to stdout.
   implicit none
   integer,save       :: ifound_total=0          ! total number of SCCS ID strings found in current program execution
   integer            :: ifound_total_back       ! copy of ifound_total returned (one compiler confused by returning saved value)
   character          :: c                       ! current character read
   integer,parameter  :: got_nothing=0, got_at=1, got_open=2,got_hash=3,got_all=4
   integer            :: status                  ! use to determine if found SCCS ID string
   integer            :: ios                     ! hold I/O error flag
   integer            :: icount                  ! number of characters read from file
   integer            :: ifound_in_this_file     ! number of SCCS ID strings found in current file
   logical            :: reset

   status = got_nothing                          ! what part of @(#) found so far
   icount=0                                      ! number of characters read in this file
   ifound_in_this_file=0                         ! number of ID strings found in this file
   reset=.true.

   if(html.or.table)then                         ! if writing a table write out HTML
      write(*,'(a)')'<td>'
   endif

   LOOK_FOR_PREFIX: do                           ! loop through read of file one character at a time

      select case(fd)
      case(5)                                    ! cannot find a way to read from pre-assigned stdin as a stream so far in Fortran
         read(*,'(a1)',iostat=ios,advance='no') c   ! read stdin with non-advancing I/O as next-best approach
         if(is_iostat_eor(ios))then              ! if get end-of-record status pretend got char(10) from a stream
            c=char(10)
            ios=0
         endif
      case default                               ! read character from stream
         call getnextchar(fd,c,ios,reset)
         !read(fd,iostat=ios) c
      end select

      if( ios.ne.0 )exit LOOK_FOR_PREFIX         ! stop on error or end-of-file

      icount=icount+1                            ! increment count of characters read

      select case(c)
      case('@')
         status = got_at
      case('(')
         if (status == got_at) status = got_open
      case('#')
         if (status == got_open) status = got_hash
      case(')')
         if (status == got_hash) then           ! got all of prefix so start outputting characters
            status=got_all
                                                ! Output tab and ident string followed by a new line.
            ifound_total = ifound_total + 1
            ifound_in_this_file = ifound_in_this_file + 1
            write(*,'(a)',advance='no')achar(9) ! output tab before string being found
            if(debug)then
               write(*,*)'*process_file*: FOUND METADATA STARTING AT ICOUNT =',ICOUNT
            endif
            OUTPUT: do

               if(fd.eq.5)then
                  read(*,'(a1)',iostat=ios,advance='no') c
                  if(is_iostat_eor(ios))then
                     c=char(10)
                    ios=0
                  endif
               else
                  call getnextchar(fd,c,ios,reset)
                  !read(fd,iostat=ios) c
               endif

               if( ios.ne.0)then
                   exit LOOK_FOR_PREFIX
               endif

               icount=icount+1

               select case(c)
               case('"','>','\')
                  exit OUTPUT
               case(:achar(31),achar(127):)     ! end on non-printable character
                  exit OUTPUT
               case default
                  write(*,'(a)',advance='no')c
               end select

            enddo OUTPUT

            if(html.or.table)then
               write (*, '(a)')'<br/>'          ! newline
            else
               write(*,*)                       ! newline
            endif

            if (stop_on_first)then
               exit LOOK_FOR_PREFIX
            endif

         endif
     case default
        status = got_nothing                    ! start looking for new prefix
     end select

   enddo LOOK_FOR_PREFIX

   if(html.or.table)then
      write(*,'(a)')'</td>'
   endif

   if(ifound_in_this_file.eq.0.and.stop_on_first)then       ! need a line advance because no SCCS ID string found
      write(*,*)
   endif

   if(debug)then
      write(*,*)'*process_file*: ICOUNT       =',ICOUNT
      write(*,*)'*process_file*: STOP_ON_FIRST=',STOP_ON_FIRST
      write(*,*)'*process_file*: STATUS       =',STATUS
      write(*,*)'*process_file*: FOUND        =',FOUND
   endif

   ifound_total_back=ifound_total

end function process_file
!-----------------------------------------------------------------------------------------------------------------------------------
subroutine getnextchar(fd,c,ios,reset)
! replace "read(fd,iostat=ios) c" because gfortran on CygWin sixty times slower with plain read (no system buffering?)
! quick buffering read
implicit none

integer,intent(in)          :: fd
character,intent(out)       :: c
integer,intent(out)         :: ios
logical,intent(inout)       :: reset

!integer,parameter           :: bufsize=65536
integer,parameter           :: bufsize=1048576
character(len=1),save       :: buff(bufsize)
integer,save                :: point=0
integer,save                :: filepoint=1
integer,save                :: sz=bufsize

ios=0

if(reset)then
   filepoint=1
   point=0
   reset=.false.
   buff=' '
   sz=bufsize
   if(debug)then
           write(*,*)'*getnextchar* reset'
   endif
endif

100 continue
select case(point)
case(0)                                            ! read a buffer
   read(fd,iostat=ios,pos=filepoint) buff(1:sz)
   if(is_iostat_end(ios))then                      ! this is the last buffer
      if(sz.ne.1)then                              ! try again with a smaller buffer
         sz=sz/2
         sz=max(1,sz)
         goto 100
      endif
   elseif(ios.eq.0)then                            ! no error occurred so successfully read a buffer
      c=buff(1)
      filepoint=filepoint+sz
      point=sz-1
   endif
case(1:)                                           ! getting a character from a previous buffer
   point=point-1
   c=buff(sz-point)
case default
   write(*,*)'*getnextchar* internal error '
   read(fd,iostat=ios) c
end select
! assume if IOS is not zero, not called again until new file is started
!write(*,*)'JSU: BOT ['//c//'] POINT=',point,' IOS=',ios,' FILEPOINT=',filepoint
   if(ios.ne.0)then
      filepoint=1
      point=0
      sz=bufsize
   endif
end subroutine getnextchar
!-----------------------------------------------------------------------------------------------------------------------------------
end program pedigree
!-----------------------------------------------------------------------------------------------------------------------------------
subroutine sccs_id(string) ! keep optimization from removing otherwise-unused variable, at cost of overhead of call
   character(len=*),intent(in) :: string
   ii=len_trim(string)
   write(*,'(a)')trim(string(5:ii-1))
end subroutine sccs_id
!-----------------------------------------------------------------------------------------------------------------------------------
