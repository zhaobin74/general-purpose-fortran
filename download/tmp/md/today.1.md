[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - today (1)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    today(1f) - [TIME] output current time for uses such as file suffixes.

CONTENTS

    Synopsis
    Description
    Options
    Example

SYNOPSIS

    today [format]

DESCRIPTION

    Outputs the current date using the specified format. Typically used to generate a string to be used in building filenames
    containing date information.

OPTIONS

            format any allowable format for the fmtdate(3) routine. Enter "-" to get a list on stdout. defaults to "YMD".

EXAMPLE

    Sample commands:

            cp myfile myfile. today 
            find . -ls >MANIFEST. today epoch 
            mkdir  today YMDhms 
            today -  # show formatting options

-----------------------------------------------------------------------------------------------------------------------------------

                                                             today (1)                                                July 02, 2017

Generated by manServer 1.08 from 2fe80873-aef3-48c7-b625-bb80bde54a51 using man macros.
                                                              [today]