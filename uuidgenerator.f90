! Randomly generate a UUID
program uuidgenerator
    use unixtime
    use hexstring

    implicit none

    ! Define the kind of real numbers to use
    !integer, parameter :: sp = selected_real_kind(p=6) !kind(1.0)
    integer, parameter :: dp = selected_real_kind(p=15) !kind(1.0d0)
    !integer, parameter :: qp = selected_real_kind(p=33) !kind(1.0q0)
    
    ! Local variables
    character(len=16) :: hex_chars = "0123456789abcdef"                 ! Hexadecimal character set
    character(len=16) :: timestamp_str                                  ! Timestamp as a string in hex
    real(dp) :: my_seconds_since_epoch                                  ! Seconds since epoch
    integer  :: left, right, timestamp                                  ! Timestamp
    character(len=1) :: version
    character(len=36) :: uuid
    
    ! Generate a timestamp                                              ! Planned feature
    my_seconds_since_epoch = get_unixtime()                             ! I was going to do something
    left = int(floor(my_seconds_since_epoch))                           ! with this that included the
    right = int((my_seconds_since_epoch - real(left, dp)) * 10**6)      ! timestamp in the generation
    timestamp = left + right                                            ! of the UUID. But I have not yet.
    timestamp_str = trim(adjustl(int2hex(timestamp)))

    ! print *, timestamp_str

    ! Generate a UUID
    version = ''
    uuid(1:8) = hex_string(hex_chars, 8,version)
    uuid(9:9) = '-'
    uuid(10:13) = hex_string(hex_chars, 4,version)
    uuid(14:14) = '-'
    version = '4'
    uuid(15:18) = hex_string(hex_chars, 4,version)
    uuid(19:19) = '-'
    version = ''
    uuid(20:23) = hex_string(hex_chars, 4,version)
    uuid(24:24) = '-'
    uuid(25:36) = hex_string(hex_chars, 12,timestamp_str)

    print *, uuid

end program uuidgenerator