bash S5.sh
decomposePar
mpirun -np 48 simpleFoam -parallel
reconstructPar
