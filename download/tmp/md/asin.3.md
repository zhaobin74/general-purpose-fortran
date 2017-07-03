[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - asin (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    asin(3f) - [INTRINSIC:TRIGONOMETRIC] Arcsine function

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Example
    Standard
    Class
    See Also

SYNTAX

    result = asin(x)

DESCRIPTION

    asin(x) computes the arcsine of its X (inverse of sin(x)).

ARGUMENTS

           X - The type shall be either REAL and a magnitude that is less than or equal to one or be COMPLEX.

RETURN VALUE

    The return value is of the same type and kind as X. The real part of the result is in radians and lies in the range -PI/2 <=
    asin(x) <= PI/2.

EXAMPLE

    Sample program:

        program test_asin
          real(8) :: x = 0.866_8
          x = asin(x)
        end program test_asin



STANDARD

    [[FORTRAN 77]] and later, for a complex argument [[Fortran 2008]] or later

CLASS

    [[Elemental procedure|Elemental function]]

SEE ALSO

    Inverse function: [[sin]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                             asin (3)                                                 July 02, 2017

Generated by manServer 1.08 from 290cfad5-e260-4e4a-b5c8-6b756552d995 using man macros.
                                                              [asin]