[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                               Manual Reference Pages  - shiftr (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    shiftr(3f) - [INTRINSIC:BIT MANIPULATION] shift bits right

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Standard
    Class
    See Also

SYNTAX

    result = SHIFTR(I, SHIFT)

DESCRIPTION

    Returns a value corresponding to I with all of the bits shifted right by SHIFT places. If the absolute value of SHIFT is
    greater than BIT_SIZE(I), the value is undefined. Bits shifted out from the right end are lost, and bits shifted in from the
    left end are set to 0.

ARGUMENTS

    o I - The type shall be INTEGER.

    o SHIFT - The type shall be INTEGER.

RETURN VALUE

    The return value is of type INTEGER and of the same kind as I.

STANDARD

    [[Fortran 2008]] and later

CLASS

    [[Elemental function]]

SEE ALSO

    [[shifta]], [[shiftl]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                            shiftr (3)                                                July 02, 2017

Generated by manServer 1.08 from b5300ac5-e64e-4699-8d64-818f0638745b using man macros.
                                                             [shiftr]