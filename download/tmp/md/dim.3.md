[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                 Manual Reference Pages  - dim (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    DIM(3f) - [INTRINSIC:NUMERIC] Positive difference

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Example
    Standard
    Class

SYNTAX

    result = DIM(X, Y)

DESCRIPTION

    DIM(X,Y) returns the difference X-Y if the result is positive; otherwise returns zero.

ARGUMENTS

        X - The type shall be INTEGER or REAL

        Y - The type shall be the same type and kind as X.

RETURN VALUE

    The return value is of type INTEGER or REAL.

EXAMPLE

    Sample program:

        program test_dim
            integer :: i
            real(8) :: x
            i = dim(4, 15)
            x = dim(4.345_8, 2.111_8)
            print *, i
            print *, x
        end program test_dim



STANDARD

    [[FORTRAN 77]] and later

CLASS

    [[Elemental procedure|Elemental function]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                              dim (3)                                                 July 02, 2017

Generated by manServer 1.08 from 0b793433-6be9-4582-8c53-da67b3d0a46d using man macros.
                                                               [dim]