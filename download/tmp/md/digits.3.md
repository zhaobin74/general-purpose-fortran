[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                               Manual Reference Pages  - digits (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    digits(3f) - [INTRINSIC] Significant digits function

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Example
    Standard
    Class

SYNTAX

    result = digits(x)

DESCRIPTION

    digits(x) returns the number of significant digits of the internal model representation of X. For example, on a system using a
    32-bit floating point representation, a default real number would likely return 24.

ARGUMENTS

       X - The type may be INTEGER or REAL.

RETURN VALUE

    The return value is of type INTEGER.

EXAMPLE

    Sample program:

        program test_digits
            integer :: i = 12345
            real :: x = 3.143
            real(8) :: y = 2.33
            print *, digits(i)
            print *, digits(x)
            print *, digits(y)
        end program test_digits



STANDARD

    [[Fortran 95]] and later

CLASS

    [[Inquiry function]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                            digits (3)                                                July 02, 2017

Generated by manServer 1.08 from adb0306d-b8d0-4b9a-865f-4846b9f4198d using man macros.
                                                             [digits]