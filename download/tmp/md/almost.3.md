[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                               Manual Reference Pages  - almost (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    almost(3f) - [M_math] return true or false if two numbers agree up to specified number of digits

CONTENTS

    Synopsis
    Description
    Example

SYNOPSIS

    function almost(x,y,digits)
    real,intent(in) :: x,y
    real,intent(in) :: rdigits

DESCRIPTION

    Returns true or false depending on whether the two numbers given agree to within the specified number of digits as calculated
    by ACCDIG(3f).

EXAMPLE

-----------------------------------------------------------------------------------------------------------------------------------

                                                            almost (3)                                                July 02, 2017

Generated by manServer 1.08 from 5d395901-c300-431b-9ae0-e3cb4665fe19 using man macros.
                                                             [almost]