bash S4.sh
decomposePar
mpirun -np 48 simpleFoam -parallel
reconstructPar
