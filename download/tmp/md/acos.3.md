[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - acos (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    ACOS(3f) - [INTRINSIC:TRIGONOMETRIC] Arccosine function

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

    result = ACOS(X)

DESCRIPTION

    ACOS(X) computes the arccosine of X (inverse of cos(x)).

ARGUMENTS

         X - The type shall be REAL with a magnitude that is less than one.

RETURN VALUE

    The return value is of the same type and kind as X. The real part of the result is in radians and lies in the range

    0 <= ACOS(X) <= PI.

EXAMPLE

    Sample program:

        program test_acos
          real(8) :: x = 0.866_8
          x = acos(x)
        end program test_acos



STANDARD

    [[FORTRAN 77]] and later, for a complex argument [[Fortran 2008]] and later

CLASS

    Elemental function

SEE ALSO

    Inverse function: [[cos]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                             acos (3)                                                 July 02, 2017

Generated by manServer 1.08 from e8c114ed-e664-4ee7-8f37-1e36d662269b using man macros.
                                                              [acos]