count=$( jq '.| length' pendingTrans/example.json )
for i in {0..$((count - 1))}; do
  valueEn=$(cat pendingTrans/example.json | jq '.[keys['${i}']]')
  valueTranslated=$(cat translated/examplezh.json | jq '.'${valueEn}'?')
  if ["null" = "$valueTranslated"]; then
    echo 'not find translation:' + $valueEn
  else
    sed -i '' 's/'$valueEn'/'$valueTranslated'/g'
  fi
done
