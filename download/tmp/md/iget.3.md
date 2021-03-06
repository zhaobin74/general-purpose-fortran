[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - iget (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    iget - [ARGUMENTS:M_kracken]given keyword fetch integer value from command argument

CONTENTS

    Synopsis
    Description
    Options
    Returns
    Example

SYNOPSIS

    function iget(keyword) result(value)


        character(len=*),intent(in)  :: keyword
        integer              :: value



DESCRIPTION

    The iget(3f) function returns a scalar integer value from a command line argument using the M_kracken(3fm) module.

OPTIONS

             KEYWORD the dictionary keyword (in form VERB_KEYWORD) to retrieve. The VERB name comes from the first argument of the
             KRACKEN(3f) call. The KEYWORD is a keyword from the KRACKEN(3f) call that should be interpreted as a integer value.

RETURNS

        VALUE integer value returned by function

EXAMPLE

    Sample program

       program demo_iget
       use M_kracken, only: kracken, iget
       implicit none
       integer :: val
         ! define command arguments and parse user command
         call kracken( demo , -val 31416  )
         val=iget( demo_val ) ! get any values specified on -val option
         write(*,*)val        ! print the value
       end program demo_iget



    Example program runs:

       $ demo_iget
          31416


       $ demo_iget -val 10
          10


       $ demo_iget -val 3.000
          3

-----------------------------------------------------------------------------------------------------------------------------------

                                                             iget (3)                                                 July 02, 2017

Generated by manServer 1.08 from 336ea9ba-fcff-416a-9f75-b71681d64bb0 using man macros.
                                                              [iget]
