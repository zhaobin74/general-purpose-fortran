[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                 Manual Reference Pages  - lle (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    lle(3f) - [INTRINSIC:CHARACTER] Lexical less than or equal

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Standard
    Class
    See Also

SYNTAX

    result = lle(string_a, string_b)

DESCRIPTION

    Determines whether one string is lexically less than or equal to another string, where the two strings are interpreted as
    containing ASCII character codes. If the String A and String B are not the same length, the shorter is compared as if spaces
    were appended to it to form a value that has the same length as the longer.

    In general, the lexical comparison intrinsics LGE, LGT, LLE, and LLT differ from the corresponding intrinsic operators .ge.,
    .gt., .le., and .lt., in that the latter use the processor s character ordering (which is not ASCII on some targets), whereas
    the former always use the ASCII ordering.

ARGUMENTS

        string_a - Shall be of default CHARACTER type.

        string_b - Shall be of default CHARACTER type.

RETURN VALUE

    Returns .true. if string_a < string_b, and .false. otherwise, based on the ASCII ordering.

STANDARD

    [[FORTRAN 77]] and later

CLASS

    [[Elemental procedure|Elemental function]]

SEE ALSO

    [[lge]], [[lgt]], [[llt]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                              lle (3)                                                 July 02, 2017

Generated by manServer 1.08 from 96e86f74-faa6-48ca-8627-1c3b78d6069f using man macros.
                                                               [lle]
