#add each topic folder to fpath so that they can add functions and completion scripts
setopt extendedglob
for topic_folder ($ZSH/(^*.disabled/)#) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;
