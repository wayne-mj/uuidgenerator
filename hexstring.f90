module hexstring
    implicit none
    contains

    function hex_string(chars, length, static) result(str)
        character(len=16), intent(in) :: chars                      ! Character set
        integer, intent(in) :: length                               ! Length of the string
        character(len=*), intent(in) :: static                     ! Static character set
        character(len=length) :: str                                ! Resulting string
        integer :: i, start                                         ! Loop index
        real :: rnum                                                ! Random number       
        
        ! Initialize the random number generator
        call random_seed()

        ! Generate the random string
        if (len_trim(static) == 0) then
            start = 1
        else if (len_trim(static) == 1) then
            str(1:1) = static
            start = 2
        else if (len_trim(static) > 1) then
            str(1:len_trim(static)) = static(1:len_trim(static))
            start = len_trim(static) + 1
        end if

        do i=start,length
            call random_number(rnum)
            rnum = floor(rnum*16) +1
            str(i:i) = chars(int(rnum):int(rnum))
        end do

    end function hex_string

    function int2hex(num) result(str)
        integer, intent(in) :: num                                  ! Integer number
        character(len=16) :: str                                    ! Resulting string

        ! Convert the integer to a hex string
        write(str, '(Z10)') num
    end function int2hex

end module hexstring