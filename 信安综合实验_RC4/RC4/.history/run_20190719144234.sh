echo $1

if [ $1="-en" ]
    then
        echo "encrypt"
        ./out.exe -en test.txt 1234234
elif [ $1= "-de"]
    then   
        echo "decrypt"
        ./out.exe -de test.txt 1234234
fi