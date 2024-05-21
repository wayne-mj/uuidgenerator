module unixtime
    implicit none
    
    contains

    ! Function to return the current time in seconds since the Unix epoch
    function get_unixtime() result(seconds_since_epoch)
        ! Define the kind of real number to use
        integer, parameter :: sp = selected_real_kind(p=6)  ! (4)  !kind(1.0)
        integer, parameter :: dp = selected_real_kind(p=15) ! (8)  !kind(1.0d0)
        integer, parameter :: qp = selected_real_kind(p=33) ! (16) !kind(1.0q0)
        
        real(dp) :: seconds_since_epoch
        integer :: count, count_rate, count_max
        
        call system_clock(count, count_rate, count_max)
        seconds_since_epoch = real(count) / real(count_rate)
    end function get_unixtime
end module unixtime