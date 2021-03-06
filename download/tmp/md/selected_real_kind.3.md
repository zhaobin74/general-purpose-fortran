[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                         Manual Reference Pages  - selected_real_kind (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    selected_real_kind(3f) - [INTRINSIC] Choose real kind

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Example
    Standard
    Class
    See Also

SYNTAX

    result = selected_real_kind([p, r, radix])

DESCRIPTION

    selected_real_kind(p, r, radix) return the kind value of a real data type with decimal precision of at least P digits, exponent
    range of at least R, and with a radix of RADIX.

ARGUMENTS

         P - (Optional) shall be a scalar and of type INTEGER.

         R - (Optional) shall be a scalar and of type INTEGER.

         RADIX - (Optional) shall be a scalar and of type INTEGER.

    Before [[Fortran 2008]], at least one of the arguments R or P shall be present; since [[Fortran 2008]], they are assumed to be
    zero if absent.

RETURN VALUE

    selected_real_kind returns the value of the kind type parameter of a real data type with decimal precision of at least P
    digits, a decimal exponent range of at least R, and with the requested RADIX. If the RADIX parameter is absent, real kinds with
    any radix can be returned. If more than one real data type meet the criteria, the kind of the data type with the smallest
    decimal precision is returned. If no real data type matches the criteria, the result is

o    -1 if the processor does not support a real data type with a precision greater than or equal to P, but the R and RADIX
     requirements can be fulfilled

     o    -2 if the processor does not support a real type with an exponent range greater than or equal to R, but P and RADIX are
          fulfillable

     o    -3 if RADIX but not P and R requirements are fulfillable

     o    -4 if RADIX and either P or R requirements are fulfillable

     o    -5 if there is no real type with the given RADIX

EXAMPLE

    Sample program:

       program real_kinds
         integer,parameter :: p6 = selected_real_kind(6)
         integer,parameter :: p10r100 = selected_real_kind(10,100)
         integer,parameter :: r400 = selected_real_kind(r=400)
         real(kind=p6) :: x
         real(kind=p10r100) :: y
         real(kind=r400) :: z


         print *, precision(x), range(x)
         print *, precision(y), range(y)
         print *, precision(z), range(z)
       end program real_kinds



STANDARD

    [[Fortran 95]] and later; with RADIX [[Fortran 2008]] and later

CLASS

    Transformational function

SEE ALSO

    [[precision]], [[range]], [[radix]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                      selected_real_kind (3)                                          July 02, 2017

Generated by manServer 1.08 from a3cf3d18-29f5-4bd6-b55c-a3207f21aa64 using man macros.
                                                           [selected_r]
