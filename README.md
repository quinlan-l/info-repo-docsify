git init

git add .

git commit -m 'init'

git remote add eb-chinese-philosophy-history https://github.com/quinlan-l/eb-chinese-philosophy-history

git push --set-upstream eb-chinese-philosophy-history master

https://github.com/git-lfs/git-lfs

* Linux安装：yum install git-lfs
* Mac 安装：brew instal git-lfs


git lfs track "*.epub"

git lfs ls-files


git lfs migrate import --include="*.epub" --everything

git lfs migrate import --exclude="*.epub" --everything

git lfs migrate info

git lfs help <subcommand>
