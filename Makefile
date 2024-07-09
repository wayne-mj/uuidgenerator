FC=gfortran
FFLAGS=-O3 -Wall -Wextra
MODULES=unixtime.f90 hexstring.f90
PROG=uuidgenerator.f90
#SRC=unixtime.f90 hexstring.f90 uuidgenerator.f90
SRC=$(MODULES) $(PROG)
OBJ=${SRC:.f90=.o}
BASE=${SRC:.f90=}

all: clean $(PROG:.f90=)

%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

$(PROG:.f90=): $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

clean:
	rm -f *.o *.mod $(BASE)
