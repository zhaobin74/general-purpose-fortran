[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - rget (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    rget - [ARGUMENTS:M_kracken]given keyword fetch real value from command argument

CONTENTS

    Synopsis
    Description
    Options
    Returns
    Example

SYNOPSIS

    function rget(keyword) result(value)


        character(len=*),intent(in)  :: keyword
        real                         :: value

DESCRIPTION

    The rget(3f) function returns a scalar real value from a command line argument using the M_kracken(3fm) module.

OPTIONS

             KEYWORD the dictionary keyword (in form VERB_KEYWORD) to retrieve. The VERB name comes from the first argument of the
             KRACKEN(3f) call. The KEYWORD is a keyword from the KRACKEN(3f) call that should be interpreted as a REAL value.

RETURNS

       VALUE real value returned by function

EXAMPLE

    Sample program

       program demo_rget
       use M_kracken, only: kracken, rget
       implicit none
       real :: val
         ! define command arguments and parse user command
         call kracken( demo , -val 3.1416  )
         val=rget( demo_val ) ! get any values specified on -val option
         write(*,*)val        ! print the value
       end program demo_rget



    Example program runs:

       $ demo_rget
          3.14159989


       $ demo_rget -val 10
          10.0000000


       $ demo_rget -val 3.000
          3.00000000

-----------------------------------------------------------------------------------------------------------------------------------

                                                             rget (3)                                                 July 02, 2017

Generated by manServer 1.08 from bd0230cd-4381-4ad9-be5c-7000badb3197 using man macros.
                                                              [rget]
