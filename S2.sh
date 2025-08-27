#Copy the base directory with a set up case 
for i in {1..50}
do
  if [ "$i" -ne 1 ]; then
    cp -r 1/* "$i"/
  fi
done
