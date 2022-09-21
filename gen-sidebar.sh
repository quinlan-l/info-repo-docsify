#!/bin/bash

echo '' > _sidebar.md

find . -path ./.git -prune -o -type d -o -type f -name "*.md" | 
awk -F '[/]' 'NF>1{
    if(substr($NF, 1, 1)=="_" || match($NF, "README") || substr($NF, 1, 1)=="."){
        # 不作处理
    }else{
        for(i=2;i<NF;i++){
            # 按目录层级设置缩进格式
            printf "  " >> "_sidebar.md"
        }
        if (match($NF, ".md")){
            # 如果是md文件，则不需要尾部的“.md”和头部"./"
            printf "* [%s](%s)\n", substr($NF,1,length($NF)-3), substr($0,3) >> "_sidebar.md"
        } else{
            # 如果是目录，则不需要头部"./"
            printf "* [%s](%s)\n", $NF, substr($0,3) >> "_sidebar.md"
        }
    }
}'
#awk -F '[/]' '{
#    for(i=2;i<NF;i++){
#        printf("    ")
#    }
#    printf "* [%s](%s)\n", substr($NF,1,length($NF)-3), substr($0,3)
#}'
