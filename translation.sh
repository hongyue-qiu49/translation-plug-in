# cd ~ && cd -

read -p "Please input file path that needs to be translated? " pendingTransPath

pendingTransPath=$([ ! "$pendingTransPath" ] && echo -n 'pendingTrans/example.json' || echo -n $pendingTransPath)
echo "The file path to be translated is: , $pendingTransPath"

read -p "Please input file path that translation reference file? " translated

translated=$([ ! "$translated" ] && echo -n 'translated/examplezh.json' || echo -n $translated)
echo "The translation reference file path is: , $translated"

count=$( jq '.| length' $pendingTransPath )
for i in {0..$((count - 1))}; do
  valueEn=$(cat $pendingTransPath | jq '.[keys['${i}']]')
  valueTranslated=$(cat $translated | jq '.'${valueEn}'?')
  if ["null" = "$valueTranslated"]; then
    echo 'not find translation:' + $valueEn
  else
    sed -i '' 's/'$valueEn'/'$valueTranslated'/g'
  fi
done

echo 'translation finished!'