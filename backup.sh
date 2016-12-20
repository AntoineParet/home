#!/bin/bash

touch $3/changement.txt
rsync -rltgoDv $1 $2
diff -r $1 $2 | cut -d' ' -f 3- | sed 's/:/\/\ /g'|sed 's/ //g' > $3/changement.txt

echo "changement.txt :"
cat $3/changement.txt
nbchmt=`wc -l $3/changement.txt | cut -d'/' -f1`
echo "il y a $nbchmt a effectuer"

for i in `seq 1 $nbchmt`;
do
    echo "changement $i :"
    fichiertmp=`head -n $i $3/changement.txt | tail -n 1`
    echo "essai"
    nom=`echo $fichiertmp | sed "s/'$2'//g"`
    echo "debug : $2 et $fichiertmp"
    echo "le fichier $nom est a supprime "
    mv $fichiertmp $3/$nom
done
