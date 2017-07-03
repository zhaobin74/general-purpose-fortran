[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                              Manual Reference Pages  - extremum (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    extremum(3f) - [M_math:statistics]Finds the minimum and maximum value in a REAL array.

CONTENTS

    Synopsis
    Description
    Options
    Returns
    Example
    See Also

SYNOPSIS

    subroutine extremum(array,small,big)


       real,intent(in)    :: array(:)
       real,intent(out)   :: small
       real,intent(out)   :: big



DESCRIPTION

    Finds the minimum and maximum value in a REAL array.

OPTIONS

        array The array to find the extremes of

RETURNS

      small least value found

      big largest value found

EXAMPLE

    Sample program:

       program testit
       use M_math, only : extremum
       real,allocatable :: arr(:)
       arr=[-10.0,8.8,-5.0,0.0,5.0,10.0,-0.3]
       call extremum(arr,small,big)
       write(*,*) SMALL= ,small
       write(*,*) BIG= ,big
       end program testit



SEE ALSO

    minval(3f), maxval(3f)

-----------------------------------------------------------------------------------------------------------------------------------

                                                           extremum (3)                                               July 02, 2017

Generated by manServer 1.08 from e0823de2-7876-474b-8f27-14f29e9dd467 using man macros.
                                                            [extremum]