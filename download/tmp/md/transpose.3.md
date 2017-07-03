[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                              Manual Reference Pages  - transpose (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    transpose(3f) - [INTRINSIC:ARRAY MANIPULATION] Transpose an array of rank two

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Standard
    Class

SYNTAX

    result = transpose(matrix)

DESCRIPTION

    Transpose an array of rank two. Element (i, j) of the result has the value matrix(j, i), for all i, j.

ARGUMENTS

         MATRIX - Shall be an array of any type and have a rank of two.

RETURN VALUE

    The result has the same type as MATRIX, and has shape (/ m, n /) if MATRIX has shape (/ n, m /).

STANDARD

    Fortran 95 and later

CLASS

    Transformational function

-----------------------------------------------------------------------------------------------------------------------------------

                                                           transpose (3)                                              July 02, 2017

Generated by manServer 1.08 from d84d6118-1664-40c7-9b82-3d14c311da0d using man macros.
                                                            [transpose]