[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - size (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    size(3f) - [INTRINSIC:ARRAY INQUIRY] Determine the size of an array

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

    result = size(array[, dim [, kind]])

DESCRIPTION

    Determine the extent of ARRAY along a specified dimension DIM, or the total number of elements in ARRAY if DIM is absent.

ARGUMENTS

             ARRAY - Shall be an array of any type. If ARRAY is a pointer it must be associated and allocatable arrays must be
             allocated.

             DIM - (Optional) shall be a scalar of type INTEGER and its value shall be in the range from 1 to n, where n equals the
             rank of ARRAY.

             KIND - (Optional) An INTEGER initialization expression indicating the kind parameter of the result.

RETURN VALUE

    The return value is of type INTEGER and of kind KIND. If KIND is absent, the return value is of default integer kind.

EXAMPLE

    Sample program:

        program test_size
          write(*,*) size((/ 1, 2 /))    ! 2
        end program



STANDARD

    [[Fortran 95]] and later, with KIND argument [[Fortran 2003]] and later

CLASS

    [[Inquiry function]]

SEE ALSO

    [[shape]], [[reshape]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                             size (3)                                                 July 02, 2017

Generated by manServer 1.08 from 9b44f314-524b-45c8-835e-18d45fef66ae using man macros.
                                                              [size]
