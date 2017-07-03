[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                              Manual Reference Pages  - splitname (1)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    splitname(1f) - [FUNIX]strip pathname into components {dir,name,basename,extension}

CONTENTS

    Synopsis
    Description
    Options
    Examples
    See Also

SYNOPSIS

    splitname [NAME1 NAME2 ... |-help|-version]

DESCRIPTION

    Output each pathname broken into components dir, name, basename, extension

OPTIONS

        NAMES pathnames to split

        -help display this help and exit

        -version output version information and exit

EXAMPLES

    Sample program executions:

         splitname /usr/bin/          -> "/usr/bin" "" "" ""
         splitname /usr/bin           -> "/usr" "bin" "" ""
         splitname stdio.h            -> "" "studio.h" "studio" ".h"



SEE ALSO

    splitname(1), basename(1), readlink(1), realpath(1)

-----------------------------------------------------------------------------------------------------------------------------------

                                                           splitname (1)                                              July 02, 2017

Generated by manServer 1.08 from d8dda621-536b-4285-b6f2-d9d50dc7dc2b using man macros.
                                                            [splitname]