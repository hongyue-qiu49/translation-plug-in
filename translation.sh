# cd ~ && cd -

pendingPathInputTip="Please input file path that needs to be translated? "
pendingDefaultPath="pendingTrans/example.json"
pendingPathConfirmTip="The file path to be translated is: "

referencePathInputTip="Please input file path that translation reference file? "
referenceDefaultJsonPath="translated/examplezh.json"
referenceDefaultExcelPath="translatedExcel/LevelOne.csv"
referencePathConfirmTip="The translation reference file path is: "

readFilePath() {
  read -p "${1}" path

  path=$([ ! "$path" ] && echo -n "${2}" || echo -n $path)

  echo $path
}

read -p "Which is your translated file type? [excel/json]: " translatedFileType

if [ $translatedFileType = "json" ]; then
  pendingTransPath=$(readFilePath "${pendingPathInputTip}" "${pendingDefaultPath}" | tail -1)
  echo $pendingPathConfirmTip $pendingTransPath
  echo '------------------------------------------------------'
  translatedFile=$(readFilePath "${referencePathInputTip}" "${referenceDefaultJsonPath}" | tail -1)
  echo $referencePathConfirmTip $translatedFile
  echo '------------------------------------------------------'
else
  pendingTransPath=$(readFilePath "${pendingPathInputTip}" "${pendingDefaultPath}" | tail -1)
  echo $pendingPathConfirmTip $pendingTransPath
  echo '------------------------------------------------------'
  translatedExcelFile=$(readFilePath "${referencePathInputTip}" "${referenceDefaultExcelPath}" | tail -1)
  echo $referencePathConfirmTip $translatedExcelFile
  echo '------------------------------------------------------'
  
  touch pendingTrans/test.json
  translatedFile=pendingTrans/test.json
  # | .[1:] ignore the table header
  jq --slurp --raw-input \
    'split("\r\n") | map(split(",") | {"key":.[0],"value":.[1]}) | from_entries'  \
    $translatedExcelFile  > pendingTrans/test.json
fi

count=$( jq '.| length' $pendingTransPath )
for (( i=0; i < $count; i++ ))
do
  valueEn=$(cat $pendingTransPath | jq '.[keys['${i}']]')
  valueTranslated=$(cat $translatedFile | jq '.['"${valueEn}"']?')
  if [ "null" = "$valueTranslated" ]; then
    echo 'not find translation:' + $valueEn
  else
    valueEnCur=$(echo $valueEn | sed 's#\\#\\\\#g')
    sed -i '' 's#'":[ \t]*${valueEnCur}"'#'": ${valueTranslated}"'#g' $pendingTransPath
  fi
done

echo 'translation finished!'