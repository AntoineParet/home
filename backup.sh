#!/bin/bash

touch $3/changement2.txt
touch $3/changement1.txt
touch $3/liste1.txt
touch $3/liste2.txt
rsync -rltgoDv $1 $2 --exclude='firefox' --exclude='.steam'
#diff -r $1 $2 > $3/changement1.txt
ls -R $1 >$3/liste1.txt
ls -R $2 >$3/liste2.txt
#diff $3/liste1.txt $3/liste2.txt>$3/changement1.txt
diff -Naur $1 $2>$3/changement1.txt
#echo $3/changement1.txt | cut -d' ' -f 3- | sed 's/:/\/\ /g'|sed 's/ //g' > $3/changement2.txt
#echo "fin edition changement 1"
#echo "changement.txt :"
#cat $3/changement.txt
#nbchmt=`wc -l $3/changement.txt | cut -d'/' -f1`
#echo "il y a $nbchmt a effectuer"
#
#for i in `seq 1 $nbchmt`;
#do
#    echo "changement $i :"
#    fichiertmp=`head -n $i $3/changement.txt | tail -n 1`
#    echo "essai"
#    nom=`echo $fichiertmp | sed "s/'$2'//g"`
#    echo "debug : $2 et $fichiertmp"
#    echo "le fichier $nom est a supprime "
#    mv $fichiertmp $3/$nom
#done
