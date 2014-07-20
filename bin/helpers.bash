find ./ -type f -exec unix2dos {} \;

find ./ -name "*.config" -exec unix2dos {} \;
find ./ -name "*.csproj" -exec unix2dos {} \;

http://stackoverflow.com/questions/7068179/convert-line-endlings-for-whole-directory-tree-git

git diff --name-only | grep .csproj | xargs dos2unix
git diff --name-only | grep .config | xargs dos2unix

git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Vermillion Vermillion
git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Packages/WatchGuard/FoxBurner.Abstractions FoxBurner.Abstractions

git branch elx2 remotes/origin/ELX2_0

svn rm http://phoenix/reposWin/Vermillion/tags/sprint_3_review

git svn tag sprint_7_review -m "Sprint 7 Review"

set PATH=%PATH%;Z:\Dropbox\bin

find ./ -name "*.sh" -exec chmod +x {} \;

find ./ -name "*.targets" -exec git add -f {} \;
