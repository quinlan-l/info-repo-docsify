#!/bin/bash

echo '' > _sidebar.md

find . -type d -o -type f -name "*.md" | 
awk -F '[/]' 'NF>1{
    if(match($NF, "_sidebar") || match($NF, "README")){
    }else{
        for(i=2;i<NF;i++){
            printf "    " >> "_sidebar.md"
        }
        if (match($NF, ".md")){
            printf "* [%s](%s)\n", substr($NF,1,length($NF)-3), substr($0,3) >> "_sidebar.md"
        } else{
            printf "* [%s](%s)\n", $NF, $0 >> "_sidebar.md"
        }
    }
}'

#find . -type f -name "*.md" |
#awk -F '[/]' '{
#    for(i=2;i<NF;i++){
#        printf("    ")
#    }
#    printf "* [%s](%s)\n", substr($NF,1,length($NF)-3), substr($0,3)
#}'
