#Set up fluentMeshToFoam command for 1 to 50 mesh files
for i in {1..50}
do
  echo "fluentMeshToFoam ${i}.msh"
done
