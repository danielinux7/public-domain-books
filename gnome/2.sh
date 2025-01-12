python3 mark.py
sed -i -f mark.script ab.po
sed -r '/^\[start\]|\[ok\]|\[stop\]$/d' ab.po
sed -i -r '/^\[start\]|\[ok\]|\[stop\]$/d' ab.po
sed -i -f mark.script ru.po
sed -r '/^\[start\]|\[ok\]|\[stop\]$/d' ru.po
sed -i -r '/^\[start\]|\[ok\]|\[stop\]$/d' ru.po
msgmerge -N ru.po ab.po > ru2.po
sed -i -r '/#~/d' ru2.po
sed -r 's/(msgstr\[0\]) "/\1 "\1 /g' ab.po > ab2.po
sed -i -r 's/(msgstr\[1\]) "/\1 "\1 /g' ab2.po 
sed -i -r 's/(msgid_plural) "/\1 "\1 /g' ab2.po
sed -i -r 's/(msgstr\[0\]) "/\1 "\1 /g'  ru2.po
sed -i -r 's/(msgstr\[1\]) "/\1 "\1 /g'  ru2.po
sed -i -r 's/(msgid_plural) "/\1 "\1 /g' ru2.po
sed -i -r 's/([^\\])\\"/\1@%&/g' ab2.po
sed -i -r 's/([^\\])\\"/\1@%&/g' ru2.po
po2csv ab2.po > ab.csv
po2csv ru2.po > ru.csv
sed -i -r '/msgstr\[0\]/d'  ab.csv
sed -i -r '/msgstr\[1\]/d'  ru.csv
rm ab2.po ru2.po
