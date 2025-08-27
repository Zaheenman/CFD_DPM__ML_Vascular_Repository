#Copy mesh files to directories (rename mesh files from 1 to 50)
for i in {1..50};
do
    mv "$i.msh" "$i/"
done
