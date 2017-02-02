find ./ -type f -exec unix2dos {} \;

find ./ -name "*.sln" -exec unix2dos {} \;
find ./ -name "*.csproj" -exec unix2dos {} \;
find ./ -name "*.config" -exec unix2dos {} \;

# http://stackoverflow.com/questions/7068179/convert-line-endlings-for-whole-directory-tree-git

git diff --name-only | grep .csproj | xargs dos2unix
git diff --name-only | grep .config | xargs dos2unix

git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Vermillion Vermillion
git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Packages/WatchGuard/FoxBurner.Abstractions FoxBurner.Abstractions
git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Packages/WatchGuard/BasicPlayer BasicPlayer
git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Packages/vlc vlc-package
git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Packages/WatchGuard/DVR.Configuration DVR.Configuration
git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Packages/WatchGuard/DVR.Event.Xml DVR.Event.Xml
git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Packages/WatchGuard/DVR.Protocol DVR.Protocol
git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Packages/WatchGuard/Vista.Protocol.Serial Vista.Protocol.Serial
git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Packages/WatchGuard/DeviceDiscovery DeviceDiscovery
git svn clone --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/Kangchenjunga/branches/Vancouver Vancouver
git svn clone --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/InstallerProjects InstallerProjects
git svn clone http://phoenix.watchguardvideo.local/reposEng/doc/trunk/Projects/WearableCamera/Requirements WearableCameraRequirements

git svn clone -s --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin/caliburn MDC
git svn clone --prefix=origin/ http://phoenix.watchguardvideo.local/reposWin2/WatchGuard DMU


git branch elx2 remotes/origin/ELX2_0

svn rm http://phoenix/reposWin/Vermillion/tags/sprint_3_review

git svn tag sprint_7_review -m "Sprint 7 Review"

set PATH=%PATH%;Z:\Dropbox\bin

find ./ -name "*.sh" -exec chmod +x {} \;

find ./ -name "*.targets" -exec git add -f {} \;
