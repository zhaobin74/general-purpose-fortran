[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                             Manual Reference Pages  - invert_3x3 (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    invert_3x3(3f) - [M_math] directly invert 3x3 matrix

CONTENTS

    Synopsis
    Description
    Options
    Example

SYNOPSIS



    pure function invert_3x3(A) result(B)


       ! integer,real,double,complex
       integer,parameter         :: wp=kind(0|0.0|0.0d|(0.0,0.0))
       NNNNNN(kind=wp), intent(in) :: A(2,2)   !! Matrix
       NNNNNN(kind=wp)             :: B(2,2)   !! Inverse matrix
        where
       NNNNNN may be INTEGER,REAL,DOUBLEPRECISION,COMPLEX



DESCRIPTION

    Directly invert 3x3 matrix for speed (versus using, e.g. LAPACK)

OPTIONS

         A original 3x3 matrix, may be INTEGER, REAL, DOUBLE, or COMPLEX

         B inverted 3x3 matrix, of same type as input matrix A

EXAMPLE

-----------------------------------------------------------------------------------------------------------------------------------

                                                          invert_3x3 (3)                                              July 02, 2017

Generated by manServer 1.08 from 71fe4846-0db5-4346-bd9f-2b17764b5039 using man macros.
                                                           [invert_3x3]