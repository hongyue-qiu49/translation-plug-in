# cd ~ && cd -

readFilePath() {
  read -p "${1}" path

  path=$([ ! "$path" ] && echo -n "${2}" || echo -n $path)

  echo $path
}

pendingPathInputTip="Please input file path that needs to be translated? "
pendingDefaultPath="pendingTrans/example.json"
pendingPathConfirmTip="The file path to be translated is: "

referencePathInputTip="Please input file path that translation reference file? "
referenceDefaultPath="translated/examplezh.json"
referencePathConfirmTip="The translation reference file path is: "

pendingTransPath=$(readFilePath "${pendingPathInputTip}" "${pendingDefaultPath}" | tail -1)
echo $pendingPathConfirmTip $pendingTransPath

translated=$(readFilePath "${referencePathInputTip}" "${referenceDefaultPath}" | tail -1)
echo $referencePathConfirmTip $translated

count=$( jq '.| length' $pendingTransPath )
for (( i=0; i < $count; i++ ))
do
  valueEn=$(cat $pendingTransPath | jq '.[keys['${i}']]')
  valueTranslated=$(cat $translated | jq '.['"${valueEn}"']?')
  if [ "null" = "$valueTranslated" ]; then
    echo 'not find translation:' + $valueEn
  else
    # todo: need change to regex
    sed -i '' 's/'": ${valueEn}"'/'": ${valueTranslated}"'/g' $pendingTransPath
  fi
done

echo 'translation finished!'