FC=gfortran
#FFLAGS=-O3 -Wall -Wextra
SRC=unixtime.f90 hexstring.f90 uuidgenerator.f90
OBJ=${SRC:.f90=.o}
BASE=${SRC:.f90=}

%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

uuidgenerator: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

clean:
	rm -f *.o *.mod $(BASE)
