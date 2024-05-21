module hexstring
    implicit none
    contains

    function hex_string(chars, length, static) result(str)
        character(len=16), intent(in) :: chars                      ! Character set
        integer, intent(in) :: length                               ! Length of the string
        character(len=1), intent(in) :: static                      ! Static character set
        character(len=length) :: str                                ! Resulting string
        integer :: i, start                                         ! Loop index
        real :: rnum                                                ! Random number             

        ! Initialize the random number generator
        call random_seed()

        ! Generate the random string
        if (len_trim(static) == 0) then
            start = 1
        else
            str(1:1) = static
            start = 2
        end if

        do i=start,length
            call random_number(rnum)
            rnum = floor(rnum*16) +1
            str(i:i) = chars(int(rnum):int(rnum))
        end do

    end function hex_string


end module hexstring