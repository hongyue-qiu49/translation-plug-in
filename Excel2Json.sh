{"payload":{"allShortcutsEnabled":false,"fileTree":{"Excel2Json":{"items":[{"name":"Excel2Json.sh","path":"Excel2Json/Excel2Json.sh","contentType":"file"},{"name":"LevelOne.csv","path":"Excel2Json/LevelOne.csv","contentType":"file"},{"name":"LevelTwo.csv","path":"Excel2Json/LevelTwo.csv","contentType":"file"},{"name":"README.md","path":"Excel2Json/README.md","contentType":"file"}],"totalCount":4},"":{"items":[{"name":"Excel2Json","path":"Excel2Json","contentType":"directory"},{"name":"addUserWithSudo","path":"addUserWithSudo","contentType":"directory"},{"name":"buildSSHtunnel","path":"buildSSHtunnel","contentType":"directory"},{"name":"docker","path":"docker","contentType":"directory"},{"name":"install_redis","path":"install_redis","contentType":"directory"},{"name":"java","path":"java","contentType":"directory"},{"name":"upgrade-docker","path":"upgrade-docker","contentType":"directory"},{"name":"README.md","path":"README.md","contentType":"file"},{"name":"install_apr.tar.gz","path":"install_apr.tar.gz","contentType":"file"},{"name":"install_pyenv.sh","path":"install_pyenv.sh","contentType":"file"}],"totalCount":10}},"fileTreeProcessingTime":8.755704,"foldersToFetch":[],"reducedMotionEnabled":null,"repo":{"id":35647757,"defaultBranch":"master","name":"ShellScripts","ownerLogin":"opscolin","currentUserCanPush":false,"isFork":false,"isEmpty":false,"createdAt":"2015-05-15T02:03:40.000Z","ownerAvatar":"https://avatars.githubusercontent.com/u/11386088?v=4","public":true,"private":false,"isOrgOwned":false},"symbolsExpanded":false,"treeExpanded":true,"refInfo":{"name":"master","listCacheKey":"v0:1508134771.0","canEdit":false,"refType":"branch","currentOid":"361e6748ff8bddfa489ec9730e068073d17c6e95"},"path":"Excel2Json/Excel2Json.sh","currentUser":null,"blob":{"rawLines":["#!/usr/bin/env bash","","## ","## Modified by Colin at 2015-05-15","## support two level convertion","## ","","LevelOne(){","    echo \"[\"","    i=1","    for line in `cat ${file} |sed 's/\"//g'|awk -F ','  'BEGIN{OFS=\",\"}{print $1,$2}'`","    do","        num=`cat ${file}|wc -l`","        a1=`echo ${line}|awk -F ',' '{print $1}'`","        a2=`echo ${line}|awk -F ',' '{print $2}'`","        if [ $i -ne ${num} ]","        then","            echo -e \"\\t{\"","            echo -e \"\\t\\t\\\"id\\\":${a1},\"","            echo -e \"\\t\\t\\\"name\\\":\\\"${a2}\\\"\"","            echo -e \"\\t},\"","        else","            echo -e \"\\t{\"","            echo -e \"\\t\\t\\\"id\\\":${a1},\"","            echo -e \"\\t\\t\\\"name\\\":\\\"${a2}\\\"\"","            echo -e \"\\t}\"","        fi","    done","    echo \"]\"","}","","LevelTwo(){","    echo \"[\"","    number=`cat ${file}|sed 's/\"//g'|awk -F ','  'BEGIN{OFS=\",\"}{print $1,$2}'|uniq -c|awk 'BEGIN{OFS=\",\"}{print $1,$2}'|wc -l`","    for line in `cat ${file}|sed 's/\"//g'|awk -F ','  'BEGIN{OFS=\",\"}{print $1,$2}'|uniq -c|awk 'BEGIN{OFS=\",\"}{print $1,$2}'`","    do","        a0=`echo ${line}|awk -F ',' '{print $1}'`","        a1=`echo ${line}|awk -F ',' '{print $2}'`","        a2=`echo ${line}|awk -F ',' '{print $3}'`","        if [ ${a1} -eq ${a1} ]","        then","            echo -e \"\\t{\"","            echo -e \"\\t\\t\\\"id\\\": ${a1},\"","            echo -e \"\\t\\t\\\"name\\\": \\\"${a2}\\\",\"","            echo -e \"\\t\\t\\\"List\\\": [\"","            i=1","            for line2 in `cat ${file}|sed 's/\"//g' |grep \",${a2},\"|awk -F ',' 'BEGIN{OFS=\",\"}{print $3,$4}'`","            do","                a3=`echo ${line2}|awk -F ',' '{print $1}'`","                a4=`echo ${line2}|awk -F ',' '{print $2}'`","                #echo ${a4}","                if [ $i -ne ${a0} ]","                then","                    echo -e \"\\t\\t\\t{\"","                    echo -e \"\\t\\t\\t\\t \\\"id\\\": ${a3},\"","                    echo -e \"\\t\\t\\t\\t \\\"name\\\": \\\"${a4}\\\"\"","                    echo -e \"\\t\\t\\t},\"","                else","                    echo -e \"\\t\\t\\t{\"","                    echo -e \"\\t\\t\\t\\t \\\"id\\\": ${a3},\"","                    echo -e \"\\t\\t\\t\\t \\\"name\\\": \\\"${a4}\\\"\"","                    echo -e \"\\t\\t\\t}\"","                fi","                let i=$(($i + 1))","            done","            echo -e \"\\t\\t]\"","            if [ ${a1} -eq ${number} ]","            then","                echo -e \"\\t}\"","            else","                echo -e \"\\t},\"","            fi","        fi","    done","    echo \"]\"","}","","if [ $# -eq 1 ]","then","  file=$1","  LevelOne","elif [ $# -eq 2 ] && [ $1 -eq 2 ]","then","  level=$1","  file=$2","  LevelTwo","else","    echo \"====================================================\"","    echo \"Usage:\"","    echo -e \"\\t#convert Level one\"","    echo -e \"\\t`basename $0` LevelOne.xlsx > LevelOne.txt\"","    echo -e \"\\t#convert Level two\"","    echo -e \"\\t`basename $0` 2 LevelTwo.xlsx > LevelTwo.txt\"","    echo \"====================================================\"","fi"],"stylingDirectives":[[{"start":0,"end":19,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[],[{"start":0,"end":3,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":34,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":31,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":3,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[],[{"start":0,"end":8,"cssClass":"pl-en"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":9,"end":12,"cssClass":"pl-s"},{"start":9,"end":10,"cssClass":"pl-pds"},{"start":11,"end":12,"cssClass":"pl-pds"}],[],[{"start":4,"end":7,"cssClass":"pl-k"},{"start":8,"end":12,"cssClass":"pl-smi"},{"start":13,"end":15,"cssClass":"pl-k"},{"start":16,"end":85,"cssClass":"pl-s"},{"start":16,"end":17,"cssClass":"pl-pds"},{"start":21,"end":28,"cssClass":"pl-smi"},{"start":29,"end":30,"cssClass":"pl-k"},{"start":34,"end":42,"cssClass":"pl-s"},{"start":34,"end":35,"cssClass":"pl-pds"},{"start":41,"end":42,"cssClass":"pl-pds"},{"start":42,"end":43,"cssClass":"pl-k"},{"start":50,"end":53,"cssClass":"pl-s"},{"start":50,"end":51,"cssClass":"pl-pds"},{"start":52,"end":53,"cssClass":"pl-pds"},{"start":55,"end":84,"cssClass":"pl-s"},{"start":55,"end":56,"cssClass":"pl-pds"},{"start":83,"end":84,"cssClass":"pl-pds"},{"start":84,"end":85,"cssClass":"pl-pds"}],[{"start":4,"end":6,"cssClass":"pl-k"}],[{"start":12,"end":31,"cssClass":"pl-s"},{"start":12,"end":13,"cssClass":"pl-pds"},{"start":17,"end":24,"cssClass":"pl-smi"},{"start":24,"end":25,"cssClass":"pl-k"},{"start":30,"end":31,"cssClass":"pl-pds"}],[{"start":11,"end":49,"cssClass":"pl-s"},{"start":11,"end":12,"cssClass":"pl-pds"},{"start":17,"end":24,"cssClass":"pl-smi"},{"start":24,"end":25,"cssClass":"pl-k"},{"start":32,"end":35,"cssClass":"pl-s"},{"start":32,"end":33,"cssClass":"pl-pds"},{"start":34,"end":35,"cssClass":"pl-pds"},{"start":36,"end":48,"cssClass":"pl-s"},{"start":36,"end":37,"cssClass":"pl-pds"},{"start":47,"end":48,"cssClass":"pl-pds"},{"start":48,"end":49,"cssClass":"pl-pds"}],[{"start":11,"end":49,"cssClass":"pl-s"},{"start":11,"end":12,"cssClass":"pl-pds"},{"start":17,"end":24,"cssClass":"pl-smi"},{"start":24,"end":25,"cssClass":"pl-k"},{"start":32,"end":35,"cssClass":"pl-s"},{"start":32,"end":33,"cssClass":"pl-pds"},{"start":34,"end":35,"cssClass":"pl-pds"},{"start":36,"end":48,"cssClass":"pl-s"},{"start":36,"end":37,"cssClass":"pl-pds"},{"start":47,"end":48,"cssClass":"pl-pds"},{"start":48,"end":49,"cssClass":"pl-pds"}],[{"start":8,"end":10,"cssClass":"pl-k"},{"start":13,"end":15,"cssClass":"pl-smi"},{"start":16,"end":19,"cssClass":"pl-k"},{"start":20,"end":26,"cssClass":"pl-smi"}],[{"start":8,"end":12,"cssClass":"pl-k"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":25,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":24,"end":25,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":39,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-cce"},{"start":29,"end":31,"cssClass":"pl-cce"},{"start":32,"end":37,"cssClass":"pl-smi"},{"start":38,"end":39,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":44,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-cce"},{"start":31,"end":33,"cssClass":"pl-cce"},{"start":34,"end":36,"cssClass":"pl-cce"},{"start":36,"end":41,"cssClass":"pl-smi"},{"start":41,"end":43,"cssClass":"pl-cce"},{"start":43,"end":44,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":26,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":25,"end":26,"cssClass":"pl-pds"}],[{"start":8,"end":12,"cssClass":"pl-k"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":25,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":24,"end":25,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":39,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-cce"},{"start":29,"end":31,"cssClass":"pl-cce"},{"start":32,"end":37,"cssClass":"pl-smi"},{"start":38,"end":39,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":44,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-cce"},{"start":31,"end":33,"cssClass":"pl-cce"},{"start":34,"end":36,"cssClass":"pl-cce"},{"start":36,"end":41,"cssClass":"pl-smi"},{"start":41,"end":43,"cssClass":"pl-cce"},{"start":43,"end":44,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":25,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":24,"end":25,"cssClass":"pl-pds"}],[{"start":8,"end":10,"cssClass":"pl-k"}],[{"start":4,"end":8,"cssClass":"pl-k"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":9,"end":12,"cssClass":"pl-s"},{"start":9,"end":10,"cssClass":"pl-pds"},{"start":11,"end":12,"cssClass":"pl-pds"}],[],[],[{"start":0,"end":8,"cssClass":"pl-en"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":9,"end":12,"cssClass":"pl-s"},{"start":9,"end":10,"cssClass":"pl-pds"},{"start":11,"end":12,"cssClass":"pl-pds"}],[{"start":11,"end":127,"cssClass":"pl-s"},{"start":11,"end":12,"cssClass":"pl-pds"},{"start":16,"end":23,"cssClass":"pl-smi"},{"start":23,"end":24,"cssClass":"pl-k"},{"start":28,"end":36,"cssClass":"pl-s"},{"start":28,"end":29,"cssClass":"pl-pds"},{"start":35,"end":36,"cssClass":"pl-pds"},{"start":36,"end":37,"cssClass":"pl-k"},{"start":44,"end":47,"cssClass":"pl-s"},{"start":44,"end":45,"cssClass":"pl-pds"},{"start":46,"end":47,"cssClass":"pl-pds"},{"start":49,"end":78,"cssClass":"pl-s"},{"start":49,"end":50,"cssClass":"pl-pds"},{"start":77,"end":78,"cssClass":"pl-pds"},{"start":78,"end":79,"cssClass":"pl-k"},{"start":86,"end":87,"cssClass":"pl-k"},{"start":91,"end":120,"cssClass":"pl-s"},{"start":91,"end":92,"cssClass":"pl-pds"},{"start":119,"end":120,"cssClass":"pl-pds"},{"start":120,"end":121,"cssClass":"pl-k"},{"start":126,"end":127,"cssClass":"pl-pds"}],[{"start":4,"end":7,"cssClass":"pl-k"},{"start":8,"end":12,"cssClass":"pl-smi"},{"start":13,"end":15,"cssClass":"pl-k"},{"start":16,"end":126,"cssClass":"pl-s"},{"start":16,"end":17,"cssClass":"pl-pds"},{"start":21,"end":28,"cssClass":"pl-smi"},{"start":28,"end":29,"cssClass":"pl-k"},{"start":33,"end":41,"cssClass":"pl-s"},{"start":33,"end":34,"cssClass":"pl-pds"},{"start":40,"end":41,"cssClass":"pl-pds"},{"start":41,"end":42,"cssClass":"pl-k"},{"start":49,"end":52,"cssClass":"pl-s"},{"start":49,"end":50,"cssClass":"pl-pds"},{"start":51,"end":52,"cssClass":"pl-pds"},{"start":54,"end":83,"cssClass":"pl-s"},{"start":54,"end":55,"cssClass":"pl-pds"},{"start":82,"end":83,"cssClass":"pl-pds"},{"start":83,"end":84,"cssClass":"pl-k"},{"start":91,"end":92,"cssClass":"pl-k"},{"start":96,"end":125,"cssClass":"pl-s"},{"start":96,"end":97,"cssClass":"pl-pds"},{"start":124,"end":125,"cssClass":"pl-pds"},{"start":125,"end":126,"cssClass":"pl-pds"}],[{"start":4,"end":6,"cssClass":"pl-k"}],[{"start":11,"end":49,"cssClass":"pl-s"},{"start":11,"end":12,"cssClass":"pl-pds"},{"start":17,"end":24,"cssClass":"pl-smi"},{"start":24,"end":25,"cssClass":"pl-k"},{"start":32,"end":35,"cssClass":"pl-s"},{"start":32,"end":33,"cssClass":"pl-pds"},{"start":34,"end":35,"cssClass":"pl-pds"},{"start":36,"end":48,"cssClass":"pl-s"},{"start":36,"end":37,"cssClass":"pl-pds"},{"start":47,"end":48,"cssClass":"pl-pds"},{"start":48,"end":49,"cssClass":"pl-pds"}],[{"start":11,"end":49,"cssClass":"pl-s"},{"start":11,"end":12,"cssClass":"pl-pds"},{"start":17,"end":24,"cssClass":"pl-smi"},{"start":24,"end":25,"cssClass":"pl-k"},{"start":32,"end":35,"cssClass":"pl-s"},{"start":32,"end":33,"cssClass":"pl-pds"},{"start":34,"end":35,"cssClass":"pl-pds"},{"start":36,"end":48,"cssClass":"pl-s"},{"start":36,"end":37,"cssClass":"pl-pds"},{"start":47,"end":48,"cssClass":"pl-pds"},{"start":48,"end":49,"cssClass":"pl-pds"}],[{"start":11,"end":49,"cssClass":"pl-s"},{"start":11,"end":12,"cssClass":"pl-pds"},{"start":17,"end":24,"cssClass":"pl-smi"},{"start":24,"end":25,"cssClass":"pl-k"},{"start":32,"end":35,"cssClass":"pl-s"},{"start":32,"end":33,"cssClass":"pl-pds"},{"start":34,"end":35,"cssClass":"pl-pds"},{"start":36,"end":48,"cssClass":"pl-s"},{"start":36,"end":37,"cssClass":"pl-pds"},{"start":47,"end":48,"cssClass":"pl-pds"},{"start":48,"end":49,"cssClass":"pl-pds"}],[{"start":8,"end":10,"cssClass":"pl-k"},{"start":13,"end":18,"cssClass":"pl-smi"},{"start":19,"end":22,"cssClass":"pl-k"},{"start":23,"end":28,"cssClass":"pl-smi"}],[{"start":8,"end":12,"cssClass":"pl-k"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":25,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":24,"end":25,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":40,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-cce"},{"start":29,"end":31,"cssClass":"pl-cce"},{"start":33,"end":38,"cssClass":"pl-smi"},{"start":39,"end":40,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":46,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-cce"},{"start":31,"end":33,"cssClass":"pl-cce"},{"start":35,"end":37,"cssClass":"pl-cce"},{"start":37,"end":42,"cssClass":"pl-smi"},{"start":42,"end":44,"cssClass":"pl-cce"},{"start":45,"end":46,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":37,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-cce"},{"start":31,"end":33,"cssClass":"pl-cce"},{"start":36,"end":37,"cssClass":"pl-pds"}],[],[{"start":12,"end":15,"cssClass":"pl-k"},{"start":16,"end":21,"cssClass":"pl-smi"},{"start":22,"end":24,"cssClass":"pl-k"},{"start":25,"end":108,"cssClass":"pl-s"},{"start":25,"end":26,"cssClass":"pl-pds"},{"start":30,"end":37,"cssClass":"pl-smi"},{"start":37,"end":38,"cssClass":"pl-k"},{"start":42,"end":50,"cssClass":"pl-s"},{"start":42,"end":43,"cssClass":"pl-pds"},{"start":49,"end":50,"cssClass":"pl-pds"},{"start":51,"end":52,"cssClass":"pl-k"},{"start":57,"end":66,"cssClass":"pl-s"},{"start":57,"end":58,"cssClass":"pl-pds"},{"start":59,"end":64,"cssClass":"pl-smi"},{"start":65,"end":66,"cssClass":"pl-pds"},{"start":66,"end":67,"cssClass":"pl-k"},{"start":74,"end":77,"cssClass":"pl-s"},{"start":74,"end":75,"cssClass":"pl-pds"},{"start":76,"end":77,"cssClass":"pl-pds"},{"start":78,"end":107,"cssClass":"pl-s"},{"start":78,"end":79,"cssClass":"pl-pds"},{"start":106,"end":107,"cssClass":"pl-pds"},{"start":107,"end":108,"cssClass":"pl-pds"}],[{"start":12,"end":14,"cssClass":"pl-k"}],[{"start":19,"end":58,"cssClass":"pl-s"},{"start":19,"end":20,"cssClass":"pl-pds"},{"start":25,"end":33,"cssClass":"pl-smi"},{"start":33,"end":34,"cssClass":"pl-k"},{"start":41,"end":44,"cssClass":"pl-s"},{"start":41,"end":42,"cssClass":"pl-pds"},{"start":43,"end":44,"cssClass":"pl-pds"},{"start":45,"end":57,"cssClass":"pl-s"},{"start":45,"end":46,"cssClass":"pl-pds"},{"start":56,"end":57,"cssClass":"pl-pds"},{"start":57,"end":58,"cssClass":"pl-pds"}],[{"start":19,"end":58,"cssClass":"pl-s"},{"start":19,"end":20,"cssClass":"pl-pds"},{"start":25,"end":33,"cssClass":"pl-smi"},{"start":33,"end":34,"cssClass":"pl-k"},{"start":41,"end":44,"cssClass":"pl-s"},{"start":41,"end":42,"cssClass":"pl-pds"},{"start":43,"end":44,"cssClass":"pl-pds"},{"start":45,"end":57,"cssClass":"pl-s"},{"start":45,"end":46,"cssClass":"pl-pds"},{"start":56,"end":57,"cssClass":"pl-pds"},{"start":57,"end":58,"cssClass":"pl-pds"}],[{"start":16,"end":27,"cssClass":"pl-c"},{"start":16,"end":17,"cssClass":"pl-c"}],[{"start":16,"end":18,"cssClass":"pl-k"},{"start":21,"end":23,"cssClass":"pl-smi"},{"start":24,"end":27,"cssClass":"pl-k"},{"start":28,"end":33,"cssClass":"pl-smi"}],[{"start":16,"end":20,"cssClass":"pl-k"}],[{"start":20,"end":24,"cssClass":"pl-c1"},{"start":28,"end":37,"cssClass":"pl-s"},{"start":28,"end":29,"cssClass":"pl-pds"},{"start":36,"end":37,"cssClass":"pl-pds"}],[{"start":20,"end":24,"cssClass":"pl-c1"},{"start":28,"end":53,"cssClass":"pl-s"},{"start":28,"end":29,"cssClass":"pl-pds"},{"start":38,"end":40,"cssClass":"pl-cce"},{"start":42,"end":44,"cssClass":"pl-cce"},{"start":46,"end":51,"cssClass":"pl-smi"},{"start":52,"end":53,"cssClass":"pl-pds"}],[{"start":20,"end":24,"cssClass":"pl-c1"},{"start":28,"end":58,"cssClass":"pl-s"},{"start":28,"end":29,"cssClass":"pl-pds"},{"start":38,"end":40,"cssClass":"pl-cce"},{"start":44,"end":46,"cssClass":"pl-cce"},{"start":48,"end":50,"cssClass":"pl-cce"},{"start":50,"end":55,"cssClass":"pl-smi"},{"start":55,"end":57,"cssClass":"pl-cce"},{"start":57,"end":58,"cssClass":"pl-pds"}],[{"start":20,"end":24,"cssClass":"pl-c1"},{"start":28,"end":38,"cssClass":"pl-s"},{"start":28,"end":29,"cssClass":"pl-pds"},{"start":37,"end":38,"cssClass":"pl-pds"}],[{"start":16,"end":20,"cssClass":"pl-k"}],[{"start":20,"end":24,"cssClass":"pl-c1"},{"start":28,"end":37,"cssClass":"pl-s"},{"start":28,"end":29,"cssClass":"pl-pds"},{"start":36,"end":37,"cssClass":"pl-pds"}],[{"start":20,"end":24,"cssClass":"pl-c1"},{"start":28,"end":53,"cssClass":"pl-s"},{"start":28,"end":29,"cssClass":"pl-pds"},{"start":38,"end":40,"cssClass":"pl-cce"},{"start":42,"end":44,"cssClass":"pl-cce"},{"start":46,"end":51,"cssClass":"pl-smi"},{"start":52,"end":53,"cssClass":"pl-pds"}],[{"start":20,"end":24,"cssClass":"pl-c1"},{"start":28,"end":58,"cssClass":"pl-s"},{"start":28,"end":29,"cssClass":"pl-pds"},{"start":38,"end":40,"cssClass":"pl-cce"},{"start":44,"end":46,"cssClass":"pl-cce"},{"start":48,"end":50,"cssClass":"pl-cce"},{"start":50,"end":55,"cssClass":"pl-smi"},{"start":55,"end":57,"cssClass":"pl-cce"},{"start":57,"end":58,"cssClass":"pl-pds"}],[{"start":20,"end":24,"cssClass":"pl-c1"},{"start":28,"end":37,"cssClass":"pl-s"},{"start":28,"end":29,"cssClass":"pl-pds"},{"start":36,"end":37,"cssClass":"pl-pds"}],[{"start":16,"end":18,"cssClass":"pl-k"}],[{"start":16,"end":19,"cssClass":"pl-c1"},{"start":22,"end":33,"cssClass":"pl-s"},{"start":22,"end":25,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-smi"},{"start":28,"end":29,"cssClass":"pl-k"},{"start":30,"end":31,"cssClass":"pl-c1"},{"start":31,"end":33,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-k"}],[{"start":12,"end":16,"cssClass":"pl-c1"},{"start":20,"end":27,"cssClass":"pl-s"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":26,"end":27,"cssClass":"pl-pds"}],[{"start":12,"end":14,"cssClass":"pl-k"},{"start":17,"end":22,"cssClass":"pl-smi"},{"start":23,"end":26,"cssClass":"pl-k"},{"start":27,"end":36,"cssClass":"pl-smi"}],[{"start":12,"end":16,"cssClass":"pl-k"}],[{"start":16,"end":20,"cssClass":"pl-c1"},{"start":24,"end":29,"cssClass":"pl-s"},{"start":24,"end":25,"cssClass":"pl-pds"},{"start":28,"end":29,"cssClass":"pl-pds"}],[{"start":12,"end":16,"cssClass":"pl-k"}],[{"start":16,"end":20,"cssClass":"pl-c1"},{"start":24,"end":30,"cssClass":"pl-s"},{"start":24,"end":25,"cssClass":"pl-pds"},{"start":29,"end":30,"cssClass":"pl-pds"}],[{"start":12,"end":14,"cssClass":"pl-k"}],[{"start":8,"end":10,"cssClass":"pl-k"}],[{"start":4,"end":8,"cssClass":"pl-k"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":9,"end":12,"cssClass":"pl-s"},{"start":9,"end":10,"cssClass":"pl-pds"},{"start":11,"end":12,"cssClass":"pl-pds"}],[],[],[{"start":0,"end":2,"cssClass":"pl-k"},{"start":5,"end":7,"cssClass":"pl-smi"},{"start":8,"end":11,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-k"}],[{"start":7,"end":9,"cssClass":"pl-smi"}],[],[{"start":0,"end":4,"cssClass":"pl-k"},{"start":7,"end":9,"cssClass":"pl-smi"},{"start":10,"end":13,"cssClass":"pl-k"},{"start":18,"end":20,"cssClass":"pl-k"},{"start":23,"end":25,"cssClass":"pl-smi"},{"start":26,"end":29,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-k"}],[{"start":8,"end":10,"cssClass":"pl-smi"}],[{"start":7,"end":9,"cssClass":"pl-smi"}],[],[{"start":0,"end":4,"cssClass":"pl-k"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":9,"end":63,"cssClass":"pl-s"},{"start":9,"end":10,"cssClass":"pl-pds"},{"start":62,"end":63,"cssClass":"pl-pds"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":9,"end":17,"cssClass":"pl-s"},{"start":9,"end":10,"cssClass":"pl-pds"},{"start":16,"end":17,"cssClass":"pl-pds"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":12,"end":34,"cssClass":"pl-s"},{"start":12,"end":13,"cssClass":"pl-pds"},{"start":33,"end":34,"cssClass":"pl-pds"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":12,"end":58,"cssClass":"pl-s"},{"start":12,"end":13,"cssClass":"pl-pds"},{"start":15,"end":28,"cssClass":"pl-s"},{"start":15,"end":16,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-smi"},{"start":27,"end":28,"cssClass":"pl-pds"},{"start":57,"end":58,"cssClass":"pl-pds"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":12,"end":34,"cssClass":"pl-s"},{"start":12,"end":13,"cssClass":"pl-pds"},{"start":33,"end":34,"cssClass":"pl-pds"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":12,"end":60,"cssClass":"pl-s"},{"start":12,"end":13,"cssClass":"pl-pds"},{"start":15,"end":28,"cssClass":"pl-s"},{"start":15,"end":16,"cssClass":"pl-pds"},{"start":25,"end":27,"cssClass":"pl-smi"},{"start":27,"end":28,"cssClass":"pl-pds"},{"start":59,"end":60,"cssClass":"pl-pds"}],[{"start":4,"end":8,"cssClass":"pl-c1"},{"start":9,"end":63,"cssClass":"pl-s"},{"start":9,"end":10,"cssClass":"pl-pds"},{"start":62,"end":63,"cssClass":"pl-pds"}],[{"start":0,"end":2,"cssClass":"pl-k"}]],"csv":null,"csvError":null,"dependabotInfo":{"showConfigurationBanner":false,"configFilePath":null,"networkDependabotPath":"/opscolin/ShellScripts/network/updates","dismissConfigurationNoticePath":"/settings/dismiss-notice/dependabot_configuration_notice","configurationNoticeDismissed":null,"repoAlertsPath":"/opscolin/ShellScripts/security/dependabot","repoSecurityAndAnalysisPath":"/opscolin/ShellScripts/settings/security_analysis","repoOwnerIsOrg":false,"currentUserCanAdminRepo":false},"displayName":"Excel2Json.sh","displayUrl":"https://github.com/opscolin/ShellScripts/blob/master/Excel2Json/Excel2Json.sh?raw=true","headerInfo":{"blobSize":"2.77 KB","deleteInfo":{"deleteTooltip":"You must be signed in to make or propose changes"},"editInfo":{"editTooltip":"You must be signed in to make or propose changes"},"ghDesktopPath":"https://desktop.github.com","gitLfsPath":null,"onBranch":true,"shortPath":"a6df992","siteNavLoginPath":"/login?return_to=https%3A%2F%2Fgithub.com%2Fopscolin%2FShellScripts%2Fblob%2Fmaster%2FExcel2Json%2FExcel2Json.sh","isCSV":false,"isRichtext":false,"toc":null,"lineInfo":{"truncatedLoc":"95","truncatedSloc":"91"},"mode":"file"},"image":false,"isCodeownersFile":null,"isPlain":false,"isValidLegacyIssueTemplate":false,"issueTemplateHelpUrl":"https://docs.github.com/articles/about-issue-and-pull-request-templates","issueTemplate":null,"discussionTemplate":null,"language":"Shell","languageID":346,"large":false,"loggedIn":false,"newDiscussionPath":"/opscolin/ShellScripts/discussions/new","newIssuePath":"/opscolin/ShellScripts/issues/new","planSupportInfo":{"repoIsFork":null,"repoOwnedByCurrentUser":null,"requestFullPath":"/opscolin/ShellScripts/blob/master/Excel2Json/Excel2Json.sh","showFreeOrgGatedFeatureMessage":null,"showPlanSupportBanner":null,"upgradeDataAttributes":null,"upgradePath":null},"publishBannersInfo":{"dismissActionNoticePath":"/settings/dismiss-notice/publish_action_from_dockerfile","dismissStackNoticePath":"/settings/dismiss-notice/publish_stack_from_file","releasePath":"/opscolin/ShellScripts/releases/new?marketplace=true","showPublishActionBanner":false,"showPublishStackBanner":false},"rawBlobUrl":"https://github.com/opscolin/ShellScripts/raw/master/Excel2Json/Excel2Json.sh","renderImageOrRaw":false,"richText":null,"renderedFileInfo":null,"shortPath":null,"tabSize":8,"topBannersInfo":{"overridingGlobalFundingFile":false,"globalPreferredFundingPath":null,"repoOwner":"opscolin","repoName":"ShellScripts","showInvalidCitationWarning":false,"citationHelpUrl":"https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-citation-files","showDependabotConfigurationBanner":false,"actionsOnboardingTip":null},"truncated":false,"viewable":true,"workflowRedirectUrl":null,"symbols":{"timedOut":false,"notAnalyzed":false,"symbols":[{"name":"LevelOne","kind":"function","identStart":97,"identEnd":105,"extentStart":97,"extentEnd":719,"fullyQualifiedName":"LevelOne","identUtf16":{"start":{"lineNumber":7,"utf16Col":0},"end":{"lineNumber":7,"utf16Col":8}},"extentUtf16":{"start":{"lineNumber":7,"utf16Col":0},"end":{"lineNumber":29,"utf16Col":1}}},{"name":"LevelTwo","kind":"function","identStart":721,"identEnd":729,"extentStart":721,"extentEnd":2378,"fullyQualifiedName":"LevelTwo","identUtf16":{"start":{"lineNumber":31,"utf16Col":0},"end":{"lineNumber":31,"utf16Col":8}},"extentUtf16":{"start":{"lineNumber":31,"utf16Col":0},"end":{"lineNumber":75,"utf16Col":1}}}]}},"copilotInfo":null,"copilotAccessAllowed":false,"csrf_tokens":{"/opscolin/ShellScripts/branches":{"post":"vWlgJUgTfW8xlYadtwIZkWtjOFb_qeWi1t93iHhgNSjllchKCUneyelsWZArKMMkmTRJ-UUzhGuNiRF08FDYGg"},"/repos/preferences":{"post":"1YTwKsAkyGdKWWFyesk5I1iX4khFcQpLOwR03z4G6bZvuAewBJ3FX69NcDtZy46DYqkI4xgf128l7W3Sw0sCyA"}}},"title":"ShellScripts/Excel2Json/Excel2Json.sh at master · opscolin/ShellScripts"}