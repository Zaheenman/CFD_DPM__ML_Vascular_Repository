# Loop through all folders to solve for the fluid phase.
for i in {1..50}; do
    echo "Entering folder $i"

    cd "$i"
    bash S4.sh
    bash S5.sh
    cd ..

    echo "Finished folder $i"
    echo "--------------------------"
done
