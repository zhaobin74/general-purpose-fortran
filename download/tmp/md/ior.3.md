[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                 Manual Reference Pages  - ior (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    ior(3f) - [INTRINSIC:BIT MANIPULATION] Bitwise logical inclusive or

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Standard
    Class
    See Also

SYNTAX

    result = ior(i, j)

DESCRIPTION

    IOR returns the bitwise Boolean inclusive-OR of I and J.

ARGUMENTS

         I - The type shall be INTEGER.

         J - The type shall be INTEGER, of the same kind as I.

RETURN VALUE

    The return type is INTEGER, of the same kind as the arguments. (If the argument kinds differ, it is of the same kind as the
    larger argument.)

STANDARD

    [[Fortran 95]] and later

CLASS

    [[Elemental procedure|Elemental function]]

SEE ALSO

    [[ieor]], [[iand]], [[ibits]], [[ibset]], [[ibclr]], [[not]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                              ior (3)                                                 July 02, 2017

Generated by manServer 1.08 from e09e8248-5ece-4eaa-a30e-e069f0c29d59 using man macros.
                                                               [ior]
