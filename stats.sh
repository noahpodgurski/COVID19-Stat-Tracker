clear
val=$(tail -2 $1 | head -1);
val2=$(tail -1 $1);
while :
do
curl $val > stats.html;
java -jar tagsoup-1.2.jar --files stats.html;
rm stats.html;
python3 parser.py stats.xhtml;

curl $val2 > michigan.html;
java -jar tagsoup-1.2.jar --files michigan.html;
rm michigan.html;
python3 michigan.py michigan.xhtml;
sleep 30m;
done
