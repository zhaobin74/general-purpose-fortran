[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                 Manual Reference Pages  - f2c (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    f2c - [M_units]convert Fahrenheit to Celsius

CONTENTS

    Synopsis
    Description
    Options
    Example

SYNOPSIS

    elemental real function f2c(fahrenheit)


        class(*),intent(in) :: fahrenheit

DESCRIPTION

    Converts Fahrenheit temperatures to Celsius using the formula:

        celsius=(fahrenheit+40.0)*5.0/9.0 - 40.0

OPTIONS

          fahrenheit any standard scalar value supported by anyscalar_to_real(3f).

EXAMPLE

    Sample program

       program f2c_demo
       use M_units, only :  f2c
       implicit none
          write(*,*) With REAL array input     , f2c([ -40.0,32.0, 212.0 ])
          write(*,*) With INTEGER array input  , f2c([ -40,  32,   212   ])
          write(*,*) With DOUBLEPRECISION      , f2c(-40.0d0),f2c(32.0d0),f2c(212.0d0)
       end program f2c_demo



    Results

       With REAL array input      -40.0000000       0.00000000       100.000000
       With INTEGER array input   -40.0000000       0.00000000       100.000000
       With DOUBLEPRECISION       -40.0000000       0.00000000       100.000000



-----------------------------------------------------------------------------------------------------------------------------------

                                                              f2c (3)                                                 July 02, 2017

Generated by manServer 1.08 from c0843a05-c300-4ec0-bae8-91f4d0423bd7 using man macros.
                                                               [f2c]