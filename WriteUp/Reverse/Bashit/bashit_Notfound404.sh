for i in {A..z} {0..9} '{' '}'; do 
	echo -n "$i:"
	bash ba_shit.sh <<< $(echo -ne $i)
done > dico
sed -i -re 's/ //g' dico
while read l; do 
	p=${l#*:}
	r=${l%:*}
	grep -q "${l#*:}" enc && sed -i -re "s/$p/2f${r}2f/g" enc
done < dico
cat enc|sed -re 's/2f]2f//g'
