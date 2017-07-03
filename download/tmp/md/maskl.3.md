[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - maskl (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    maskl(3f) - [INTRINSIC] Left justified mask

result = maskl(i[, kind])

CONTENTS

    Description
    Syntax
    Arguments
    Return Value
    Standard
    Class
    See Also

DESCRIPTION

    maskl(i[, kind]) has its leftmost I bits set to 1, and the remaining bits set to 0.

SYNTAX

ARGUMENTS

         I - Shall be of type INTEGER.

         KIND - Shall be a scalar constant expression of type INTEGER.

RETURN VALUE

    The return value is of type INTEGER. If KIND is present, it specifies the kind value of the return type; otherwise, it is of
    the default integer kind.

STANDARD

    [[Fortran 2008]] and later

CLASS

    [[Elemental procedure|Elemental function]]

SEE ALSO

    [[maskr]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                             maskl (3)                                                July 02, 2017

Generated by manServer 1.08 from 2d68c1da-7c06-4aae-ae4e-7d8f6a9cdb9b using man macros.
                                                              [maskl]