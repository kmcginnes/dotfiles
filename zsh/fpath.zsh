#add each topic folder to fpath so that they can add functions and completion scripts
shopt -s extglob
for topic_folder ($ZSH/!(*.disabled)) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;
