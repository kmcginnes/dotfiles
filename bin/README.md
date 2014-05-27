bash-extensions
===============

I've been using git with TFS successfully for years. I've developed a workflow that works well for me. This is a repository of some of the git extensions for bash that have reduced my carpal tunnel.

I started with a toolset consisting of GitHub for Windows, poshgit, and console2 for Windows. This worked great, until my git repos grew in size from a couple hundred megs to over 700 MB of tracked files. Then performance suffered to the point that I didn't want to use git any more.

That's when I moved my git repos onto a shared network drive between my Windows VM and OS X. This allowed me to use the OS X version of git (and GitHub for OS X). Performance is worlds better in this environment.

## Installation

### Mac

On the Mac, you can put these scripts into any folder on your path. You may have to add the executable flag to the files. For example:

```
sudo chmod +x git-tupdate
```

### Windows

On Windows you can copy the bash scripts into your git directory:

```
C:\Program Files (x86)\Git\libexec\git-core
```

## Workflow

I have greatly reduced my source control struggles by following one simple rule: keep master clean. I never commit manually to master. The master branch is my mirror of TFS. Therefore it is holy.

This means that all of my changes happen in a local feature/bug branch. Naming doesn't matter as long as it's descriptive to you. These branches will never see the light of day.

## git-tupdate

Using [git-tf](http://gittf.codeplex.com), this will switch to master (if not already there), perform a pull from TFS, switch back to your working branch, and finish with a rebase.

From a clean feature branch or master:
```
git tupdate
```

From any clean branch:
```
git tupdate some_kick_ass_feature
```

## git-tship

Using [git-tf](http://gittf.codeplex.com), this will merge the latest TFS changes first to resolve conflicts, then squash the branch into master, delete the now merged branch, then push it to TFS. It can optionally associate a changeset to a TFS work item.

From a clean feature branch:
```
git tship "Commit message"
```

From a clean feature branch with TFS work item 345123:
```
git tship "Commit message" 345123
```
