FOLDER_NAME=images

echo \"id\",\"Name\(no import\)\",\"image\" > $2

while IFS="|" read f1 f2 f3; do

    # Add the header in the output csv
    echo -n $f1,\"$f2\", >> $2

    # If third column represents the picture's filename (not the key), please use this command
    cat "$(echo ${f3} | tr -d '\r' | tr -d '"')" | base64 --wrap=0 >> $2

    # If third column represents the key to match with the filename, please use this command
    # cat ${FOLDER_NAME}/"$(echo ${f3} | tr -d '\r' | tr -d '"').jpg" | base64 --wrap=0 >> $2

    #Carrier return at end of line
    echo  >> $2
done < $1