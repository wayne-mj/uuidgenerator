## Random UUID Generator

Basic UUID generator written in Fortran.

I intend on expanding it as I reacquaint myself with Fortran programming.

### Updated

Added the timestamp feature by way of using the epoch time.  Adding the left side of the decimal, and the right side * 10^6
and converting to HEX to create a timestamp.

Sample output:
```shell
./uuidgenerator
 3664f7e9-0587-4353-0dfe-20C338518f79
```

All UUIDs are random.

