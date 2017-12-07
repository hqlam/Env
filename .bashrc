
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
export PS1="\u@\h:\w\\$ "
export PATH=$PATH:.

### HELPERS
repw () {      w=$1; jot -s '' -b "$w" ${2:-80} ; }
line () {      echo `seq  -f = -s '' ${1:-80} ` ; }
ech2 () {      echo;echo $* ; }
ech3 () {      echo "mmmmmmmmmmmmmmmmmmmmmm";echo "mmm  $*"; echo "mmmmmmmmmmmmmmmmmmmmmm" ; }
alias grep='   grep    --color=auto'
alias egrep='  egrep   --color=auto'
ht () {        history | tail -n ${1:-20} ; }
fgh  ()  {     HISTTIMEFORMAT=%c ; history | egrep $*  ; }

# File .bashrc
fgbC ()   {    grep -i "$1" $2 $3 $4  $HOME/checkouts/hl/Env/bashrc_CSV ;}
fgbZ ()   {    grep -i "$1" $2 $3 $4  $HOME/checkouts/hl/Env/bashrc_ZBRA ;}
fgbH ()   {    grep -i "$1" $2 $3 $4  $HOME/checkouts/hl/Env/bashrc_H    ;}
alias vicC='   view   $HOME/checkouts/hl/Env/bashrc_CSV'
alias vicZ='   view   $HOME/checkouts/hl/Env/bashrc_ZBRA'
alias vicH='   view   $HOME/checkouts/hl/Env/bashrc_H   '
fgb  ()  {     egrep -i "$1" $2 $3 $4  $HOME/.bashrc ; }
fgbi ()  {     egrep    "$1" $2 $3 $4  $HOME/.bashrc ; }
fgbs ()  {     egrep -rin "$1" $2 $3 $4  $HOME/Help/bash_rcFiles/sub_bashrc/* ; }
alias vic='    vi        $HOME/.bashrc'
vics () {      vis $HOME/.bashrc $* ; }
alias soc='    source $HOME/.bashrc'
alias soc0='   unalias -a && source $HOME/.bashrc '

alias vicore=' vi        $HOME/Help/bash_rcFiles/sub_bashrc/core_bashrc'
alias vidbb='  vi        $HOME/Help/bash_rcFiles/sub_bashrc/db_bashrc'
alias visplunk='vi      $HOME/Help/splunk/hl_spl.txt '

vion () {      filename=$1; old="$2"; new=$3; vi -bc ":%s/$old/$new/c|:q" $filename ; }
vid  () {      filename=$1; pat="$2";         vi -bc ":g/$pat/d|:q"       $filename ; }
vin  () {      filename=$1; num=$2;           vi      +$num               $filename ; }
vis  () {      filename=$1; pat=$2;           vi      +/$pat              $filename ; }
vih  () {      cmd=$*; bash $HOME/proj/shell/hterm.sh basic  vis $cmd ; }

# smoketest drivers boxerconfig
#alias drx='   vih      $HOME/checkouts/xpc-test/boxertest_client/smoketest-xpc.py'
alias bcx='    subl     $HOME/checkouts/xpc-test/boxertest_client/config-xpc.boxerconfig'
alias bco='    subl     $HOME/checkouts/xpc-test/boxertest_client/config-xap.boxerconfig'
alias vihelper='vis $HOME/checkouts/xpc-test/boxertest_client/util/xpc_helpers.py compare_response_data'

# cdutil at xt master only
alias cdutilities=' ech2 util only exists in branch master of xpc-testm/xpc-test repos; d="$HOME/checkouts/xpc-testm/xpc-test/xpcfunctionaltest/utilities"; cd $d; p '
alias cdutil='cd   $HOME/checkouts/xpc-test/boxertest_client/util'
alias ocurls=' open https://github.comcast.com/xpcs/xpc-test/tree/master/testscripts/curlscripts'

# scp bashrc to core hosts
c2h () {       h=$1; scp $HOME/Help/bash_rcFiles/sub_bashrc/core_bashrc  clduser@$h:~/ ; }
h2c () {       h=$1; scp clduser@$h:~/.bashrc $HOME/Help/bash_rcFiles/sub_bashrc/core_bashrc ; }
b2b () {       h=$1; cp  $HOME/.bashrc        $HOME/Help/bash_rcFiles/.bashrc ; }
C2hk () {      for i in  $lhkR $lhkA $lhkY; do ech2 $h; c2h $i ; done ; } 

# Timing
alias t1='     starttime=$(date +"%s")'
alias t2='     date; echo seconds=$(($(date +"%s")-$starttime)) | egrep "=[0-9]+" '
alias dateT='  date    "+%FT%T"'
alias dateU='  date -u "+%FT%T"'
alias now='    echo UTC: `dateU`|cat09; echo Now: `dateT`|cat09 '

alias pjson='  python -m json.tool'
j122 () {      tr "\'"  "\"" ; }
c2j () {           csvf=$1; python $HOME/proj/py/csv2json/c2j.py $csvf ; echo "Go check $(basename $csvf).json file" ; }

### ALIASES_AND_FUNCTIONS
# tcl expect: sup () {       s=$1; u=$2; p=$3; ~/proj/tclex/ssh.exp $s $u $p ; }
# web share a local folder
ipad () {      python -c 'import socket; print (socket.gethostbyname(socket.gethostname())); ' ; }
webshare () {  p=$1; p=${p:-5777}; ech2 `ipad`:$p; python -m SimpleHTTPServer $p ; }
alias pyshare='echo Will share at localhost port 8888; python -m SimpleHTTPServer 8888 & '

alias ipdrop=' python $HOME/proj/py/iDropped.py |cat09'
ipdr () {      python -c 'import socket; print ("IP=", socket.gethostbyname(socket.gethostname()) , "If IP==127.0.0.1, Then Internet connection was dropped."  ) ' ; }

blink () {     python -c 'from django.utils.termcolors import colorize; msg=" HELLO "*8; print colorize(msg, fg="red", bg="white", opts=("bold", "blink", "underscore",)) ; ' ; }


# cd cmds
alias cdthum=' cd /Volumes && ls -ltr && ech2 "diskutil info <a storage>; for detailed info" '
alias cdapps=' cd /Applications/'
alias cddesk=' cd $HOME/Desktop/'
alias cddoc='  cd $HOME/Documents/'
alias cddown=' cd $HOME/Downloads/'
alias cddrop=' cd $HOME/Dropbox/; ls -ltra'
alias cdbox='  cd $HOME/box_sync; ls -ltra'
alias cdhelp=' cd $HOME/Help/;p'
alias cdbash=' cd $HOME/Help/bash_rcFiles;p'
alias cdsubbash='cd $HOME/Help/bash_rcFiles/sub_bashrc;p'
#alias cdDaniel='cd $HOME/Help/Daniel;p'
alias cdsplunk=' cd $HOME/Help/splunk;p'
alias cdsi='     cd $HOME/Documents/si'

alias cdlogs=' cd $HOME/logs/; ls -ltraF|tail'
alias cdpy='   cd $HOME/proj/py'
alias cdsh='   cd $HOME/proj/shell'

#alias oarch=' open /Users/hlam001c/Google\ Drive/cc/si/xpc/xpc_architecture.pptx '
alias cddoca=' cd $HOME/Documents/si/api_docs; open $HOME/Documents/si/api_docs'
alias cdbx='   cdco; cd boxer '

alias cdco='   cd $HOME/checkouts  '
alias cdhl='   cd $HOME/checkouts/hl; llr '
alias cdvb='   cd $HOME/checkouts/hl/verify_bugs; llr '
alias cdenv='  cd $HOME/checkouts/hl/Env; llr '
alias cddevop='cd $HOME/checkouts/xpc-testm/devops'

### TIG_COMMANDS
#   brew install tig; tig --help; tig //current branch;
#   tig  grep hlam; --all //allbranches; develop //a specific branch; ; test..develop //diff between; 
#   tig  refs             //all references like branches, remotes and tags
#   git  show |tig ; git log | tig;
#   tig  blame file ; tig master ; tig test..master; tig myFile; tig v0.0.3:README
alias t1w='       tig --all  --since=1.week -- '

# file history with tig command
catt () {         f=$1;  tig blame $f ; }
gitbby () {       f=$1;  git blame $f |head -1 ; }

### GIT_COMMANDS
gith () {         runh "git help $*" ; }

# Save fragments: git stash; then later:  git stash pop; list; drop
gitsc () {        commit=$1; git show $commit ; }

# git log --no-merges -p 1.12.0..v1.13.0 |egrep -A4 "^commit" # git log --since="2 days ago"
gitlastcommit () { git pull; commit=$1; commit=${commit:-1}; git log -p -$commit ; }
gitlastcom () {    git pull 2> /dev/null; commit=$1; commit=${commit:-1}; echo "commit: $commit"; git log -p -$commit | egrep "commit [0-9a-f]{7}" |cut -c8-14 ; }

# recent commits
git1lmerge () {   git pull;                       git log --oneline --graph ; }
gitoneline () {   git pull;                       git log --pretty=oneline ; }
gitby () {        n=$1;                           git log --author=$n ; }

# grep text from git_log
gitgl () {        git pull;                       git log |egrep -i "$1" $2  ; }

# Review history: show history of a file
gitfilehist () {  f=$1 ; git pull;                git log -p -- $f ; }
alias gitfilehist2='                              git log -p --since="7 days ago" '
alias gitll='     echo "*LATEST LOG ... :";       git log |head -7;  echo '

gitdirhist () {   git pull; for f in `ls`; do echo  `gitfilehist $f|head -5|grep Date` $f ; done ; }
gitdirsort ()   { gitdirhist > ~/fh; cat ~/fh | sort -k 3 ; rm -f ~/fh ; }

# Diff the commit to its parents: git diff efe1243^! ; OR git diff --staged;
gitdif () {       f=$1 ; git diff  $f ; }
alias gitdiff='   git diff HEAD HEAD^1 ; git diff HEAD HEAD^1 --stat'
alias gitmod='    git diff `git status|grep modified:|cut: -f2` '
gitdirty () {     topic=$1;                             echo $topic; upstr=$2; git diff --name-status $topic $upstr ; }
gitdirty1 () {    topic=`git branch|grep "*"|cuts -f2`; echo $topic; upstr=$1; git diff --name-status $topic $upstr ; }

# status, branch, last log, last commit
alias gits='      echo "    ****STATUS:";     git status; echo '
alias gitb='      echo -ne "****BRANCH: \t "; git branch; echo '
alias gitst='     echo "    ****BRANCH ...:"; git status; echo; git branch -vv; ech2 "****THE LATEST LOG ... :"; git log |head -7;  echo '
alias cbr='                                   git branch | grep "*" | cuts -f2'
alias gitallb='   echo "All branches: ";      git pull;          git branch -av; pwd'

### git pull all
alias gitp='      t1;  git pull;  t2 '
fgitp () {        soc; for d in `ls ..`; do echo -n "**** $d : "; cd ../$d; gitp ; done ; }
fgitb () {        soc; for d in `ls ..`; do echo -n "**** $d : "; cd ../$d; cbr  ; done ; }
alias newxa='     cdxa   && gitp '

alias gitpusho='  git push   origin ' 

### Steps XPC check-in process:
# add then commit new files; pull uptodate; git push origin henry_ticket_branch....
# co_b henry && git reset --hard develop OR reset_b develop OR git checkout origin develop: to have same commit as develop && git push origin henry  to make branch "origin/henry" to have the same commit as "henry" 
# ogp; New PR; set compare to base:"henry" v/s compare:henry_ticket_br; write note to reviewer; button "Create"; email to followup.

### Branch create/checkout/delete/force_delete: -D 
created2b () {    git checkout -b $1 origin/develop ; }
createm2b () {    git checkout -b $1 origin/master  ; }
createh2b () {    git checkout -b $1 origin/henry  ; }

alias co_resetd=' git reset --hard origin/develop; date; gitst '
alias co_reset='  git reset --hard;                date; gitst '
reset_b () {      bORc=$1; git reset --hard  $bORc; git pull; date; gitst ; }
delete_b () {     bORc=$1; git branch -d     $bORc; date; gitst ; }
co_b () {         git checkout ${1:-master}; date && echo ___NEW_PULL__&& git pull ; }
alias co_d='      co_b develop '
alias co_m='      co_b master '
alias co_h='      co_b henry  '

alias co_bx='     cdxt;    ech2 co_xt_boxerclient branch...; co_b boxerclient'
alias co_ma='     cdxtm;   ech2 co_xt_master  branch...;     co_m '

alias co_resetd=' git reset --hard origin/develop; date; gitst '
alias co_reset='  git reset --hard;                date; gitst '

# merge develop
alias gitmd='line;ech2 "MERGE from develop branch ...";git merge develop; line && now && git branch '

# re-fetch a file
alias gitco='     git checkout '

# Refactor filenames: rm, mv; #git mv [file-ori] [file-renamed]
alias gitrm='     git rm --cached '

# List files # git ls-files --other --ignored --exclude-standard
alias gitlist='   git ls-files'

# Open github ogh: #oghqlam () {   open https://github.com/hqlam/ ; } # cdEnv
ogh  () {              open https://github.comcast.com/xpcs/${1:-xap} ; }
ogc () {               open https://github.comcast.com/xpcs/${1:-xap}/commits ; }
ogr  () {              open https://github.comcast.com/xpcs/${1:-xap}/releases ; }
ogp  () {              open https://github.comcast.com/xpcs/${1:-xap}/pulls ; }
ogb  () {              open https://github.comcast.com/xpcs/${1:-xap}/branches ; }

# open ogh branches: /active; /yours;
#oab () {              rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/branches/active ; } 

# open ogh pull: /files; /commits
opr  () { pr=$1;       open https://github.comcast.com/xpcs/${2:-xap}/pull/$pr ; }
oprf () { pr=$1;       open https://github.comcast.com/xpcs/${2:-xap}/pull/$pr/files ; }
oprc () { pr=$1;       open https://github.comcast.com/xpcs/${2:-xap}/pull/$pr/commits ; }

# open ogh commit, commit1 or the latest commit
ogcc  () { commit=$1;  open https://github.comcast.com/xpcs/${2:-xap}/commit/$commit?diff=split ; }
ogcc1 () {             c=`cd $HOME/checkouts/$rt && git log -n1|gc2 commit|cut -c8-14`; ogcc $c ${1:-xap} ; }

# open ogh compare
compare_b  () {        open https://github.comcast.com/xpcs/${3:-xap}/compare/$1...$2 ; }
cmpd_b () { branch=$1; compare_b develop $branch ${2:-xap} ; }
cmph_b () { branch=$1; compare_b henry   $branch ${2:-xap} ; }

# xpc-test $           cat .git/config url = git@github.comcast.com:xpcs/xpc-test.git
#gcln () {             repo=$1;                           git clone git@github.comcast.com:xpcs/$repo ; } 
gitcln () {            repo=$1; repo=${repo:-xpc-test};   git clone https://github.comcast.com/xpcs/$repo ; }
# https://magneto.sys.comcast.net/xb_cloud/powercloud
gitclnpc () {          repo=$1; repo=${repo:-powercloud}; git clone https://magneto.sys.comcast.net/xb_cloud/$repo.git ; }

### Redis server:
alias cdredis='    cd /app/redis/bin/     ; ls -ltr '
alias r-c='        /app/redis/bin/redis-cli '
alias status_serv='service redis status '

### REDIS-CLI_COMMANDS
# redis-cli --version; --stat --scan  
# redis-cli KEYS    map*; redis-cli KEYS rf*; redis-cli KEYS  "*" ; echo keys map*|redis-cli
# redis-cli DEL     testing_key
# redis-cli FLUSHALL           
alias oredishelp=' open http://redis.io/commands/hgetall'
alias redmo='      redis-cli          MONITOR   '
alias redif='      redis-cli          INFO      '

### cowsay -l|grep -v : ;   for more pics
cowR () {      cowsay -f dragon-and-cow      " TEST! $1 : `date` " ; }
cowS () {      cowsay -f stegosaurus         " DONE! $1 : `date` " ; }
cowT () {      cowsay -f turtle              " INFO: $1 : `date` " ; }

# Steps to Reset XPC Red Splunk: sshcor to root@96.119.99.46; cd /opt/splunk/bin/; ./splunk stop; ./splunk clean eventdata; ./splunk start 
resetrx () {    runh runcor 96.119.99.46 /root/reset_splunk.sh ; }
resetro () {    runh runcor 96.118.29.46 /root/splunk/reset_splunk_license.sh ; }
alias os_rx='   echo "u:p=admin:changeme";          open http://96.119.99.46:8000/en-US/app/search/search?q=search%20index%3Dsmart_internet%20044E5A9AE8EC&display.page.search.mode=smart&earliest=-60m%40m&latest=now&sid=1492824317.4 '
alias os_ro='   echo "u:p=admin:changeme";          open http://96.118.29.46:8000/en-US/app/search/search?q=search%20index%3Dsmart_internet%20044E5A9AE8EC&display.page.search.mode=smart&earliest=-60m%40m&latest=now&sid=1492824317.4 '

alias os_sync=' echo "u:p=xpc_splunk:XPC_$plunk123"; open https://splunk.ccp.cable.comcast.com/en-US/app/search/syncnotification '
alias os_dash=' echo "u:p=xpc_splunk:XPC_\$plunk123";open https://splunk.ccp.cable.comcast.com/en-US/app/search/dashboards '
alias os_='     echo "u:p=xpc_splunk:XPC_\$plunk123";open https://splunk.ccp.cable.comcast.com/en-US/app/search/search '

alias os_stoyv='echo "hlam01:LDAP"; open "https://splunk.ccp.cable.comcast.com/en-US/app/search/report?s=%2FservicesNS%2Fhlam01%2Fsearch%2Fsaved%2Fsearches%2Fstoyv" '

# 1/ os_ Specific CPE:  index=smart_internet 044E5A9AE8CE request_end cluster=green|stats count  by status_code
# 2/ os_ 30 mins follow-up monitor: given AS is the first DC: earliest=-30m index=smart_internet host=xpccore-as* request_end cluster=green|stats count  by status_code
alias os_stogv='echo "hlam01:LDAP"; open "https://splunk.ccp.cable.comcast.com/en-US/app/search/report?s=%2FservicesNS%2Fhlam01%2Fsearch%2Fsaved%2Fsearches%2Fstogv" '

#Jira; Conf; github; git pull; slack; outlook henry_lam@cc.c /NT ID ; magneto; #Howto change NTid pwd: 1/on wired 2/Open system pref > User & Groups > Change pwd  3/(still on wired network) logout/log in back/restart/wait/cross-finger
alias oop5='    open https://op5-os1.sys.comcast.net/monitor/index.php/auth/login?uri=tac%2Findex'
oop5h () {      h=$1; h=${h:-96.118.50.52}; ech2 "u:p=hlam01:ccLdap"; ech2 "$h @ XPC:"; cdpc; grin -C1 $h; ech2 "$h @ ODP:"; cdpcxa; grin -C1 $h; open https://op5-os1.sys.comcast.net/monitor/index.php/search/lookup?query=$h ; }

# open apps: /Applications/FaceTime.app/ /Applications/Photos.app/ /Applications/QuickTime\ Player.app/
alias oAVrec=' open /Applications/QuickTime\ Player.app/ '
alias te='     open -a textedit '
#alias opy='   open    /Applications/PyCharm\ CE.app/ '
alias opc='    open -a /Applications/PyCharm\ CE.app '
alias ocamera='open /Applications/Photo\ Booth.app/ '

### JIRA filters:
# 17.7.1:      project in (XPC, ODP) AND status in (Open,'Reopened','In Progress', 'BLOCKED', 'Blocked') AND assignee = hlam001c AND sprint in (17.7.1) ORDER BY assignee ASC
#aJ () {        echo "text ~ device_mac AND project in (XPC, ODP) AND status in ('Open', 'Reopened', 'Closed', 'Resolved') AND assignee in (pillin200, hramba583, yteng200, cchao200, zyao200, dketch201, hmaddu200,  gye200, nbhatt201, tnguye011c, tkisho001c, pveera003c, skumar064c, mreddy011c, mpital200, mdhand200, lolbri001c, rairre160 ) ORDER BY createdDate DESC" ; }
# project      in ("Operational Data Platform", "xPC Platform", "Cross Platform Services") AND sprint = 17.3.2 AND assignee not in (kshah007c, hye201, vchitr014, jludwi941, ddicke001c, mabrah200, kpatel205, sthang001c, kshea200, jthuru200) AND Status not in (Resolved, Closed) ORDER BY assignee ASC
# project      in (ODP,XPC)
# sprint       = 17.3.2  ; in openSprints(); closedSprints();  futureSprints()
# status       in (Open, Reopened, Blocked, Closed, Resolved, "At Risk", "In Progress")
# assignee     = currentUser() 
# Priority     = P0
# reporter     currentUser(); in (vmiran200, aubale200, dsunde001c, kpatel01, rkumar10c, hlam001c, kshah007c,     yteng200, cchao200, zyao200, dketch201, hmaddu200, nguye011c, gye200) 
# resolution   = Unresolved
# issuekey     in issueHistory() 
# reporter     = hlam001c   OR  assignee    = currentUser() ORDER BY Priority DESC
# text         ~ "Security"      ORDER BY createdDate DESC ; ORDER BY updated DESC
# summary      ~ "Security"
# issuetype    != "Epic Story"
ojtx () {      t=$1; t=${t:-3435}; echo "Browsing JIRA XPC ticket $t"; open https://ccp.sys.comcast.net/browse/XPC-$t ; }
ojto () {      t=$1; t=${t:-2380}; echo "Browsing JIRA ODP ticket $t"; open https://ccp.sys.comcast.net/browse/ODP-$t ; }
alias cur4qa=' echo "available 4 qa to verify";   open https://ccp.sys.comcast.net/issues/?filter=74508'

# curReport 
alias curPoints='open https://ccp.sys.comcast.net/issues/?filter=85098'
alias curSpr='   open https://ccp.sys.comcast.net/secure/RapidBoard.jspa?rapidView=2846&quickFilter=12617'
alias tester_HL='open https://ccp.sys.comcast.net/issues/?filter=87671'
alias bp11.2='   open https://jira-report.service.asb.devops.odpaws.comcast.net/jira-reports/sprint/17.11.2; ech2 "(UserID - devops Password - dNX7aJA4)" '
alias oji='      open https://ccp.sys.comcast.net/browse/XPC '
alias ojira='    open http://jira.csv.comcast.com/secure/Dashboard.jspa '
alias ojf='      open https://ccp.sys.comcast.net/secure/ManageFilters.jspa?filterView=my' # open my Jira filters
alias iju='      open https://onejira.cable.comcast.com/up ' # is Jira up?

### Confluence
alias osi='      open https://www.teamccp.com/confluence/display/SMARTINT'
alias orunbook=' open https://www.teamccp.com/confluence/display/SMARTINT/XPC+Runbook'
alias ocheatsheet_oncall='open https://etwiki.sys.comcast.net/pages/viewpage.action?pageId=325125791'

### EOG
alias E1='     echo EOG One stop page:               ; open "https://etwiki.sys.comcast.net/pages/viewpage.action?spaceKey=SMARTINT&title=One+Stop+Page" '
alias E2='     echo EOG Monitoring cheat sheet:      ; open "https://etwiki.sys.comcast.net/display/SMARTINT/xPC+Production+Support+%28EOG+Monitoring%29+Cheatsheet" '
alias E3='     echo EOG runbook                      ; open "https://etwiki.sys.comcast.net/display/SMARTINT/XPC+Runbook" '
alias E4='     echo EOG splunk dashboards:           ; open "https://etwiki.sys.comcast.net/display/SMARTINT/xPC+OPS+Dashboards" '
alias E5='     echo EOG On-call support cheat sheet: ; open "https://etwiki.sys.comcast.net/pages/viewpage.action?pageId=325125791" '
alias E6='     echo EOG Graphana: LDAP login:        ; open "https://dashboard.io.comcast.net/dashboard/db/xpc?orgId=7" '
alias E7='     echo EOG OP5 monitor:                 ; open "https://op5-os1.sys.comcast.net/monitor/index.php/search/lookup?query=96.118.50.52" '
alias E8='     echo EOG OIV xFi Summary :            ; open "https://oiv.xcal.tv/service/hsd-application-xfi/tabs/xfi-summary" '
alias E403='   echo EOG top: 403 SAT:'
alias E500='   echo EOG top: 500    :               ; open "https://etwiki.sys.comcast.net/display/xcal/%5BxFi%5D+-+SOP%3A+Automated+Alert+Handling" '
alias E0='     echo EOG handling alert:              ; open "https://etwiki.sys.comcast.net/display/xcal/%5BxFi%5D+-+SOP%3A+Automated+Alert+Handling" '

# open web apps
alias obox='    open https://comcast.account.box.com/login'
alias odropbox='cddrop; open Screenshots'
#alias osmb='   open smb://10.172.52.221/Share'
alias owebmail='open http://webmail.comcast.com'

### smoketest slave nodes of app=build , red/amber specific usage: production-96.119.83.200 red-smoketest-server-agent-96.118.55.6 
# smoketest run details at /opt/<the smoketest name>; $ [root@smoketest-server-agent smoketest-XB6-on-amber]# ls -ltra /opt
# all SMO_SLAVES= https://jenkins.awsxpc.comcast.net/computer/
SMO_SLAVES="96.118.63.53 96.118.63.54 96.118.63.55 96.118.63.60 96.118.63.251 96.118.27.124"
projTied () {  for i in $SMO_SLAVES ; do echo `date`; echo -n  "===== $i : "; runcor $i "cd /opt;ls -ltra;ls|wc;" ; done ; }
projTiedh () { runh projTied ; }
alias oprojTired='open https://jenkins.awsxpc.comcast.net/computer/smoketest-server-96.118.63.54/'
alias ojenodes='  open https://jenkins.awsxpc.comcast.net/computer'
alias oje='       open https://jenkins.awsxpc.comcast.net'
alias ojenkin='   open http://ci2.csv.comcast.com'

### ALIAS_FOR_COMMON_USE
alias a='         alias'
alias clr='       cd;printf "\033c"' # or just click Ctrl k on mac os
alias cp='        cp -i'

alias duh='       pwd; du -shc'
alias dush='      pwd; du -sh'
alias dusk='      pwd; du -sk'

alias speedtest=' python $HOME/Help/speedtest.py --share | cat09 '
alias sptlog='    python $HOME/Help/speedtest.py --share | ftee1 speedtest_$(hostname) '
spt () {          echo WIFI: ; cwf; system_profiler SPAirPortDataType |egrep -A10 'Current Network Information:'  ; ifconfig|gip ; line;t1;speedtest|egrep 'load:.*s$'; t2;line ; }
ospt () {         oterm "line;t1;speedtest|egrep 'load:.*s$'; t2;line; echo WIFI: ; cwf; system_profiler SPAirPortDataType |egrep -A10 'Current Network Information:' ; blink " ; }

alias gmac4='     egrep -io  "[0-9a-f]{1,2}\:[0-9a-f]{1,2}\:[0-9a-f]{1,2}\:[0-9a-f]{1,2}\:[0-9a-f]{1,2}\:[0-9a-f]{1,2}" '
alias gmac:='     egrep -io  "([0-9a-f]{0,4}\:){5,7}[0-9a-f]{0,4}" '
alias gmac='      egrep -io  "[0-9a-f]{12}" '

alias gxver='     grep  -Eo  "17.[a-f0-9.-]+" '
alias xver='      ls -ltr /app|grep "\->"|tail -1|grep -Eo 17.[a-f0-9.-]+'

alias gip='       egrep      "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" '
alias gipo='      grep  -Eo  "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" '
alias gip6='      egrep -i   "[a-f0-9:]+" '
gipo1 () {        gipo|a1line ; }
gmac1 () {        gmac|a1line ; }

### format strings: TODO add if p in [0-9a-fA-F]
format_cm () { p=$1; echo $p| UCtr |sed 's/://g' ; }

# Testing ip:  def validate_ip(my_ip): p=my_ip.split(".") ; return len(p)==4 and all( 0<= int(i) < 256 for i in p)' 
pyisip () {      ip=$1; python -c 'import ipaddr,sys; print(ipaddr.ip_address(sys.argv[1]) ); ' ; }

gii () {          p=$1; f=$2; if [ `egrep -co "$p" $f` -gt 0 ] ; then echo YES|grep YES; else echo Noooo|grep No; fi ; }
alias gateway='   netstat -nr '
alias dnsgateway='cat /etc/sysconfig/network-scripts/ifcfg-eth0'
alias dnsip='     cat /etc/resolv.conf'
alias pingdns='   dnsip|grep nameserver|rights; pingf `dnsip|grep nameserver|tail -1|cuts -f2`|egrep -B5 "%.*"'

alias nslu='      nslookup '
alias hostip='    cat /etc/hosts '
# host ip using python HOST_IP = os.popen('ifconfig eth0 | grep "inet\ addr" | cut -d: -f2 | cut -d" " -f1').read().strip()

# Networksetup
# Steps to create shorcuts MacOSX1. an alias; 2. Automator: File>New>Service>nwu.workflow... Define a new service;  3.System Preferences > Keyboard > Shortcuts > Services 
alias nwu='    open         /System/Library/CoreServices/Applications/Network\ Utility.app/'
alias nwpref=' open         /System/Library/PreferencePanes/Network.prefPane/'
alias cwf='    networksetup -getairportnetwork  en0   | right: '
alias cnw='    cwf; system_profiler SPAirPortDataType | egrep -A10 "Current Network Information:" '
alias wifi='   networksetup -setairportpower    airport '

alias mon='    ech2 "Monitor process status and jobs running ..."; ps -ef|egrep "webshare|python|tail"; jobs; date '
alias monkp='  pkill python && mon'

left:  () {    egrep  ".*:" ; }
right: () {    egrep  ":.*" ; }
lefts  () {    egrep  ".*\s" ; }
rights () {    egrep  "\s.*" ; }
catl () {      cat $1 | left: ; }
catr () {      cat $1 | right: ; }

# cut last field: awk '{$NF=""}1'
# cut field 1: sed 's/[^:]*://' OR cut -d: -f2-
#alias cutf1=' cut -d:    -f2- '
alias cut:='   cut -d ":"  '
#alias cut,='  cut -d ","  '
#alias cut.='  cut -d "."  '

alias cuts='   cut -d " "  '
#alias cutb='  cut -d "#"  '
#alias cutp='  cut -d "|"  '
#alias cutsc=' cut -d ";"  '
#alias cutbf=' cut -d "\""  '
alias cutff='  cut -d "/"  '

#alias ducc='   cut -d"," -f'
alias duc='    cut -d" " -f'

#apfield () {  awk               '{print $'$1'}'; }
fduc   () {    awk -v n=$1 -F"," '{print $n }'  ; }
fduc1 () {     awk               '{print $1 }'  ; }
alias lkh='    cat ~/.ssh/known_hosts | fduc1 '
alias d='      date '
alias df='     df -h'

# pipe to color fonts
alias cred='   $HOME/proj/nodejs/colour.js --red '
alias cgreen=' $HOME/proj/nodejs/colour.js --green'
alias cblue='  $HOME/proj/nodejs/colour.js --blue'
alias cyellow='$HOME/proj/nodejs/colour.js --yellow'
alias camber=' $HOME/proj/nodejs/colour.js --amber'
alias cpink='  $HOME/proj/nodejs/colour.js --pink '
alias ccyan='  $HOME/proj/nodejs/colour.js --cyan '
alias cwhite=' $HOME/proj/nodejs/colour.js --white '
alias cblack=' $HOME/proj/nodejs/colour.js --black '

### Yaml
f2y () {       f=$1; mv $f $f.yaml; ls -ltra; pwd ; }
viy () {       f2y $1 ; vi $1.yaml ; }

alias catco='  egrep         -C1 [a-z]+ '
alias cat09='  egrep         -C1 [0-9]+ '

alias ge1='    sed -e 1,/fail/d |head '			# grep error 1; grep from fine 1 to the first fail 
alias ldir='   ls -ltraF | egrep "^d" '
alias dir='    llr -F |egrep "^d" '
alias dirs='   find . -type d -d 1 -print0 | xargs -0 du -sc | sort -n '

alias l.='     ls -ld .* '				# hidden, dot files
#alias lR='    ls -Rh'					# ls *
alias lh='     ls -tra | egrep "^\."'			# hidden
alias ll='     ls -lhF'					# ls -l *
#alias llR='   ls -lRh'					# ls -l *
alias lla='    ls -ltrahF'				# all    
alias llr='    ls -ltrh'				# mostly used
alias llrr='   ls -ltrhF|tail '				# mostly used
alias lls='    ls -sh '
alias llss='   ls -lShF '
#alias llsd='  sudo find ./ -type d -exec du -sb {} \; | sort -g '
alias llt='    tree -L 1 '				# 4 long filenames
alias tre1='   tree -L 1 '				# tree 1 level
alias tre2='   tree -L 2 '				# tree 2 level
alias ll0+='   find . -maxdepth 1    -size +0 -ls'	# all non-empty files
alias ll0='    find . -maxdepth 1    -size  0 -ls'	# all     empty files
alias pathname='greadlink -f '
fpath () {     greadlink -f $1 ; }

alias mv='     mv -i'
alias o='      open '
alias p='      pwd; tree -L 1 '

alias ping_v6='/sbin/ping6   -c2  '
alias pingf='  ping -a -c 2  '
ping2 () {     i=$1; r=`echo $i|gip`; if [ $? -eq 0 ] ; then ping -a -c 2 $i; else /sbin/ping6 -c2 $i; fi ; }
alias ports='  netstat -tulan'

alias py='     python '
alias py27='   python2.7 '

alias repeatls='watch -t ls '

alias rm='     rm -i'
alias rmblank='sed "/^$/d;s/^[ \t]*//;s/[ \t]*$//" '
alias rmbline='sed "/^$/d" '

alias tree_='  find . -type d | ls -lARG'

cpwithtar () { src=$1; des=$2; cd $src ; tar cvf - ./* | (cd $des ; tar xvf - ) ; }

alias tarextract=' tar   -xzf '
alias tarcompress='tar   -czf '
alias tarappend='  tar   -czfvr '
alias tarlist='    tar   -tzfv '
alias unziplist='  unzip -l '

ffnotexec () { d=$1; d=${d:-.}; find $d -type f ! -perm -111 -ls ; }

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

alias u='      cd ..;ls; echo Current_dir is `pwd` '
alias cdu='    cd        ..;ls; echo Current_dir is `pwd` '
alias cdu2='   cd    ../..;ls; echo Current_dir is `pwd` '
alias cdu3='   cd ../../..;ls; echo Current_dir is `pwd` '

frep1 () {     while sleep 1;      do date;            $* ; echo ; done; }
frep () {      while sleep $1;     do date;  $2 $3 $4  $5 ; echo ; done; }
#loop150 () {  t1; for i in `seq 150`; do date; echo  $i:; $* ; echo ;            done; t2 ; } 
loop6 () {     t1; for i in `seq 6`;   do date; ech2 "Loop $i:"; bash -ic $* ; echo ; sleep 60;  done; t2 ; } 
loop () {      t1; for i in `seq 5`;   do date; ech2 "Loop $i:"; bash -ic $* ; echo ; sleep 5;   done; t2 ; } 

# NW dynamic IP
alias dynip='  curl -s http://checkip.dyndns.org | grep "\d*\d" '

##  grep dups
gdup () {      LCtr |sort|uniq -d ; }

a1line () {    tr '\n' ' '  ; }
alias anline=' perl -pe "s/,/\n/g" '

## Back up
fbu  () {      cp -rfp $1 ./$(date '+%Y_%m_%d_%H_%M')_$1 ; ll|grep $1 ; }
fori () {      cp -rfp $1 $1.ori                         ; ll|grep $1 ; }
fstash () {    f=$1; cp -p $f $HOME/checkouts/hl/valid_respjson/  ; }
funsta () {    f=$1; cp -p $HOME/checkouts/hl/valid_respjson/$f . ; }

alias cdvr='   cd $HOME/checkouts/hl/valid_respjson/; llr'

cpwithtar () { src=$1; des=$2; cd $src ; tar cvf - ./* | (cd $des ; tar xvf - ) ; }

### USE_PYTHON: influxdb, httplib2, pip
alias instinfluxdb='sudo pip install influxdb --ignore-installed python-dateutil '
instMod () {    ech2 "Install module $1"; mod=$1; mod=${mod:-ipaddr}; pip2.7 install $mod ; } 
pystestloop () { pyscript=$*; while read ; do python $pyscript ; done ; }
pyh ()   {     python -c "help( '$1' )" ; }
pydoc () {     python -m pydoc $1 ; }
pyd ()   {     python -c "import $1;   print  dir($1)" ; }

##  Convert
# ddate 20:08:05 21:59:
ddate () {     t1="$1"; t2="$2"; echo $t1 $t2; date -ujf%s $(($(date -jf%T "$t2" +%s) - $(date -jf%T "$t1" +%s)))     +'%-Hh %-Mm %-Ss' | sed "s/[[:<:]]0[hms] *//g" ; }

#nonmacdates () { t=$1; echo $t " == " `date --date=@$1` ; };  #nonmacdateu () { t=$1; echo $t " == " `date -d             "$t" +%s ` ; }
dates () {       t=$1; echo $t " == " `date -r              $t `      ; }
dateu () {       t=$1; echo $t " == " `date -jf "%Y-%m-%d" "$t" +%s ` ; }

h2d () {       echo $((0x$1)) ; }
d2h () {       printf '%x\n' $1 ; }
UCtr () {      tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'   ; }
LCtr () {      tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'   ; }

lastjsli () {  name=$1; tail -1  `ls -1 -th $name* | head -1` | python -m json.tool ; }
lastfili () {  name=$1; tail -1  `ls -1 -th $name* | head -1` ; }

lastline () {  sed '$!d' $1 ; }
lastfile () {  ls -At $1* |head -1 ; } 
vilf () {      d=$1; d=${d:-.}; cd $d; lf=`lastfile`; ech2 "The last file: $lf"; vih $lf ; }
lastdropb () { cd $HOME/Dropbox/Screenshots; lastfile          ; }
lastbox () {   cd $HOME/box_sync/;           lastfile          ; }

lastlog () {     cd $HOME/logs; ls -ltrh |tail -1 ; }
lastloghead () { cd $HOME/logs; ls -tr   |tail -1|xargs head -20 ; }
lastlogmore () { cd $HOME/logs; ls -tr   |tail -1|xargs more     ; }

ftee  () {     tee -a $HOME/logs/$1_$(date '+%Y.%m.%d').log ; }
ftee1 () {     tee    $HOME/logs/$(date '+%Y.%m.%d_%H.%M')_$1.log ; }
fteey () {     tee    $HOME/logs/$(date '+%H.%M_%m%d%Y')_$1.yaml ; }
fman () {      cmd=$1; man $cmd | col -b > $HOME/man_$1.txt; cat -n $HOME/man_$1.txt; ls -l $HOME/man_$1.txt  ; }

### clipboard: copy and paste
# pbcopy < file.txt; pbpaste; 
alias teec='   tee >(pbcopy)'
alias conc='   pbcopy'
alias conv='   echo `pbpaste` '

### USE_TERMINALS
hterm () {     colour=$1; cmd=$2; bash $HOME/proj/shell/hterm.sh $colour $cmd ; }
runh () {      hterm novel " $*" ; }
runhb () {     hterm basic " $*" ; }
runhp () {     hterm pro   " $*" ; }

oterm () {     cmd=$*;   bash $HOME/proj/shell/oterm.sh "date;pwd;$cmd" ; } 
topo   () {    osascript -e 'tell application "Terminal" to do script  "clear;echo hello; top " ' ; }

### MACBOOKPRO_TIPS 
alias chk_security='launchctl list | grep com.era*'
alias smartdisk='diskutil info disk0  | egrep -C5 "SMART|Verified"  '
alias smartSSD='smartctl -a    disk0  | egrep -i  "fail|smart|pass" '
alias vcamera1='lsof  |head -1; lsof  | egrep -i  "AppleCamera|VDC" '
alias vcamera2='ps -ef|head -1; ps -ef| egrep -i  "AppleCamera|VDC" '
alias vcamera=' vcamera1'

alias w2h='     open https://goo.gl/maps/3mU5Nybps632'
#alias w2noi='  open https://goo.gl/maps/EQKr9SM9RF72 '
#alias w2dai='  open https://goo.gl/maps/CB8P52LSk8Q2 '
#alias w2tem='  open https://goo.gl/maps/zPmk69q7NW82'

alias people='  opes https://budget.my.salesforce.com/_ui/core/chatter/ui/ChatterPage?deepLinkType=listView&deepLinkInfo=people'
alias timesh='  echo hlam001c; open             http://budget.cable.comcast.com'
#alias timesh='  echo hlam001c; open -a "Safari" http://budget.cable.comcast.com'
alias adp='     echo adphenrylam save34; open http://myAccess.adp.com'
alias omai='    opes http://mail.yahoo.com http://www.hotmail.com http://gmail.com https://www.linkedin.com/feed/ '
alias e_v='     open https://goo.gl/kY9EoV '				
e2v  () {       open http://dictionary.cambridge.org/us/dictionary/english-vietnamese/$1 ; }
alias kippbb='  open https://goo.gl/7BnUqU'
alias cccache=' echo chrome://settings/clearBrowserData'
alias godr='    open https://drive.google.com/drive/my-drive'
alias opec='    open -a "Google Chrome" '
alias opef='    open -a "Firefox" '
alias opes='    open -a "Safari" '

### Printers
PRT1="10.172.73.1"; PRT2="10.172.73.126"; PRTGREENLATERN="10.172.73.188"

### SI IP hosts
TFTP_IP="10.255.246.110"; XMGR="96.118.36.213"

hostRed="red.awsxpc.comcast.net"
hostYel="yellow.awsxpc.comcast.net"

hostOYel="odpyellowuiorch.odpaws.comcast.net"
hostORed="odpreduiorch.odpaws.comcast.net"

lic13R="96.118.57.10   96.118.57.12   96.118.27.107  96.118.27.106"
lic13A="96.119.227.189 96.119.227.222                               96.118.23.53   96.118.23.52  "
lic13Y="96.119.225.205                96.118.16.113  96.118.16.111  96.118.165.224               "

LISTALLCPE="$HOME/devices/cpe/List_All_CPEs_OdpJenkins_052517.csv"
CPRO_A2="$HOME/devices/cpe/cpro_a2.json"
CDEV_ec="$HOME/devices/cpe/cdev_ec.json"
CCIS_ef="$HOME/devices/cpe/ccis_ef.json"
CCIS_28="$HOME/devices/cpe/ccis_28.json"
CXB6="$HOME/devices/cpe/xb6.json"
CXB6A="$HOME/devices/cpe/xb6a.json"
CCIS_ef="$HOME/devices/cpe/ccis_ef.json"
CRA="$HOME/devices/smkRA.json"

# Desk CPEs:
M1="ACB3130356A2"       ;  I1="2001:0558:4000:001a:aeb3:13ff:fe03:56a2"  ; Rm1    () { now;sReboot $I1  I1 ; }
M2="044E5A9AE8EC"       ;  I2="10.255.244.34"                            ; Rm2    () { now;sReboot $I2  I2 ; }
M30="F44B2A77BBEF"      ;  I30="10.255.244.197"                          ; Rm30   () { now;sReboot $I30 I30 ; }
M3="F44B2A77BE1A"       ;  I3="2001:0558:4000:001a:f64b:2aff:fe77:be1a"  ; Rm3    () { now;sReboot $I3  I3 ; }
M4="9C34263F989A"       ;  I4="10.255.244.12"                            ; Rm4    () { now;sReboot $I4  I4 ; }
M5="5C8FE0AE5B42"       ;  I5="10.255.244.52"                            ; Rm5    () { now;sReboot $I5  I5 ; }
_M4="9C34263F989A"      ;  _I4="10.255.244.12"                           ; R_m4   () { now;sReboot $_I4 _I4 ; }
_M5="5C8FE0AE5B42"      ;  _I5="10.255.244.52"                           ; R_m5   () { now;sReboot $_I5 _I5 ; }
M6="F8A097EF091F"       ;  I6="2001:0558:4000:001a:faa0:97ff:feef:091f"  ; Rm6    () { now;sReboot $I6  I6 ; }
M7="3C7A8A53DDF2"       ;  I7="10.255.244.53"                            ; Rm7  () { now;sReboot $I7  I7  ; }
M6A="F8A097EF0CDA"      ;  I6A="2001:0558:4000:001a:faa0:97ff:feef:0cda" ; Rm6a   () { now;sReboot $I6A I6A ; }

# Red
_Mssr="5C8FE0D3C508"	;  _Issr="10.255.244.15"	; R_ssr () {  now;sReboot $_Issr  _ssr ; } #telnet in failed..may need mso
Mssr="3C7A8A376BCC"	;  Issr="10.255.244.114"	; Rssr () {   now;sReboot $Issr   ssr ; } 

_Mnrn="3C7A8A376B9A"	;  _Inrn="10.255.244.49"	; R_nrn  () { now;sReboot $_Inrn  _nrn   ; } 
Mnrn="5C8FE0A1BC2A"	;  Inrn="10.255.244.61"   	; Rnrn   () { now;sReboot $Inrn   nrn   ; }
#Mnrn="5C8FE0A1BE32"	;  Inrn="10.255.244.126"   	; Rnrn   () { now;sReboot $Inrn   nrn   ; }

_Mn1rn="3C7A8A3328C8"	;  _In1rn="10.255.244.14"	; R_n1rn  () { now;sReboot $_In1rn  _n1rn  ; }
Mn1rn="3C7A8A3328C8"	;  In1rn="10.255.244.14"	; Rn1rn  () { now;sReboot $In1rn  n1rn  ; }

_Mnrn1="3C7A8A3346AA"	;  _Inrn1="10.255.244.109"	; R_nrn1 () { now;sReboot $_Inrn1 _nrn1  ; }
Mnrn1="3C7A8A32A3E4"	;  Inrn1="2001:558:ff23:a:6527:cb38:5b1:7884" 	; Rnrn1  () { now;sReboot $Inrn1  nrn1  ; }

_Mn1rn1="3C7A8A376B54"	;  _In1rn1="10.255.244.112"	; R_n1rn1 () { now;sReboot $_In1rn1 _n1rn1 ; }
Mn1rn1="3C7A8A376B54"	;  In1rn1="10.255.244.112"	; Rn1rn1 () { now;sReboot $In1rn1 n1rn1 ; }

Msrn="9C34263F989A"     ;  Isrn="10.255.244.12"         ; Rsrn   () { now;sReboot $Isrn   srn   ; }

Rred () {      Rssr; Rnrn; Rn1rn; Rnrn1 ; }
RRed () {      Rred;                     Rn1rn1 ; }

# Yellow
Mssy="5C8FE0CF3F2E"     ;  Issy="10.255.244.238"        ; Rssy () {   now;sReboot $Issy   ssy ; }
Mstoy="14CFE2146492"	;  Istoy="10.255.244.85" 	; Rstoy  () { now;sReboot $Istoy  stoy  ; }
Mstoyv="14CFE2146492"	;  Istoyv="10.255.244.85" 	; Rstoyv () { now;sReboot $Istoyv stoy  ; }

# Amber
Mnan="5C8FE0A1BC2A"	;  Inan="10.255.244.61"		; Rnan   () { now;sReboot $Inan   nan   ; } # telnet in failed..may need mso
Mssa="3C7A8A376BCC"     ;  Issa="10.255.244.114"        ; Rssa () {   now;sReboot $Issa   ssa ; }

# Green:
Mstog="ACB3130362F2"	;  Istog="2001:0558:4000:001a:2eb3:13ff:fe03:62f2" ; Rstog  () { now;sReboot $Istog  stog  ; }
Mstogv="044E5A9AE8CE"	;  Istogv="10.255.244.106"	                   ; Rstogv () { now;sReboot $Istogv stogv ; }
Mssg="3C7A8A547AE6"     ;  Issg="10.255.244.68"		                   ; Rssg   () { now;sReboot $Issg   ssg   ; }

# Cisco:
Mcisr="F44B2A77BFBE"    ;  Icisr="10.255.244.24"			   ; Rcisr  () { now;sReboot $Icisr cisr ; } # telnet in failed..may need mso
Mcisy="F44B2A77BE79"    ;  Icisy="2001:0558:4000:001a:764b:2aff:fe77:be79" ; Rcisy  () { now;sReboot $Icisy cisy ; }
Mxb6="F8A097EEF795"	;  Ixb6="2001:0558:4000:001a:faa0:97ff:feee:f795"  ; Rxb6   () { now;sReboot $Ixb6  xb6  ; }

MVm="5C8FE07EE442"	;  IVm="10.255.244.93"	
MVm2="14CFE2146802"	;  IVm2="10.255.245.117"	
MVmcis="F44B2A77BE79" 	;  IVmcis="2001:558:4000:1a:764b:2aff:fe77:be79"
MVmpro="ACB31302F7B2" 	;  IVmpro="2001:558:4000:1a:2eb3:13ff:fe02:f7b2"

MAu="5C8FE07EDE92"	;  IAu="10.255.244.58"	
MAuprod="10868C6D5F1E"  ;  IAuprod="2001:558:4000:1a:1286:8cff:fe6d:5f1e" 

MDan="9C34263FAA06"	;  IDan="10.255.244.151"

MMy="ACB313035F82"	;  IMy="10.255.244.39";   
MMy_prod="ACB31302BEF2"	;  IMy_prod="2001:558:4000:1a:2eb3:13ff:fe02:bef2";	 UM_prod="SI_XPC_UID18"	

MKs_122="5C8FE07EE122"	;  IKs_122="10.255.244.89"
MKevin="3C7A8A3933BC"	;  IKevin="10.255.244.155"
MKunal="10868CE5972C"	;  IKunal="2001:558:4033:36:1286:8cff:fee5:972c"

alias cpro_acct='open https://customertimeline.cable.comcast.com/#/account/8155100181702543'
alias cpro='   pjson  $HOME/devices/cpe/cpro_a2.json | right: '
alias cdev='   pjson  $HOME/devices/cpe/cdev_ec.json | right: '
alias ccis='   pjson  $HOME/devices/cpe/ccis_1a.json | right: '
alias cxb5='   pjson  $HOME/devices/cpe/5B42.json    | left: '
alias cxb6='   pjson  $HOME/devices/cpe/xb6.json     | left: '
alias cxb6a='  pjson  $HOME/devices/cpe/xb6a.json    | left: '
alias ccisR='  pjson  $HOME/devices/cpe/ccis_ef.json | right: '
alias c_RA='   pjson  $HOME/devices/cpe/smkRA.json   | right: '

gmif () {      egrep "CMAC|IPv|UID" ; }
alias m10if='  cpro1 | gmif ; ech2 "fwcpe=`wp_rdkb $M10|gc2   value` " '
alias m1if='   cpro  | gmif ; ech2 "fwcpe=`wp_rdkb $M1 |gc2   value` " '
alias m2if='   cdev  | gmif ; ech2 "fwcpe=`wp_rdkb $M2 |gc2   value` " '
alias m3if='   ccis  | gmif ; ech2 "fwcpe=`wp_rdkb $M3 |gc2   value` " ' 
alias m5if='   cxb5  | gmif ; ech2 "fwcpe=`wp_rdkb $M5 |gc2   value` " '
alias m6if='   cxb6  | gmif ; ech2 "fwcpe=`wp_rdkb $M6 |gc2   value` " '
alias m6aif='  cxb6a | gmif ; ech2 "fwcpe=`wp_rdkb $M6A|gc2   value` " '

### UI links:
# https://customer.xfinity.com/#/services/internet
# https://internet.xfinity.com/devices; /help; /people; /more;
# https://internet.xfinity.com/more/portforwarding
# Cloud UI and FW: https://internet.xfinity.com/more/deviceinfo u:p=SI_XPC_UID65:Csv1050xPC
# Cloud UI and FW: https://internet.xfinity.com/more/networkusage u:p=9:Csv1050xPC
# https://internet.staging.xfinity.com/no-configset
# https://internet.staging.xfinity.com/devices/device/D4BED919A337

# soft launch - cpe UI - Xfinity Cloud Portal / Production/ Green     https://internet.xfinity.com/
# soft launch - cpe UI - Xfinity Cloud Portal / Production/ lui       https://my.xfinity.com/
# soft launch - cpe UI - Xfinity Cloud Portal / Staging   / Yellow    https://internet.staging.xfinity.com/
#cui () {      i=$1;  ech2 "Comcast  UI: u:p=SI_XPC_UID65:Csv1050xPC";  open https://login.comcast.net/login ; } 
# ACB3130356A2  BLASTTEST7 u:p=xpcstonecutter5@comcast.net:Csv1050xPC
Cui () {       i=$1;        ech2 "Cloud          UI: ACB31302F7B2 BLASTTEST3 u:p=xpcstonecutter5@comcast.net:Csv1050xPC";  open https://si-components-amber.g1.app.cloud.comcast.net ; }
Gui () {       i=${1:-$I1}; ech2 "Green $i       UI: u:p=xpcstonecutter9@comcast.net:Csv1050xPC";  open https://internet.xfinity.com/ ; }
Mui () {       i=$1;        ech2 "My             UI: u:p=xpcstonecutter9@comcast.net:Csv1050xPC";  open https://my.xfinity.com/ ; }
Sui () {       i=$1;        ech2 "Staging/Yellow UI: u:p=xpcstonecutter5@comcast.net:Csv1050xPC";  open https://internet.staging.xfinity.com/ ; }
alias Gui3='   ech2 "internet.xfinity.com Gui for M3: $M3 $I3"; Gui $I3'

### Local UI: u:p=cusadmin:Xfinity; lui factory reset; open http://10.255.244.34/restore_reboot.php
lui4 () {      ech2 "Local UI: u:p=cusadmin:Xfinity"; open http://${1:-$I2} ; }
lui_v6 () {    ech2 "Local UI: u:p=cusadmin:Xfinity"; open http://[${1:-$I2}] ; }
lui    () {    i=$1; i=${i:-$I2}; ech2 "Local UI: u:p=cusadmin:Xfinity"; r=`echo $i|gip`; if [ $? -eq 0 ] ; then echo $i;open http://$i; else echo $i; open http://[$i] ; fi ; }
alias lui5='   ech2 "Local UI lui for M5: $M5 $I5"; lui $I5 '
alias lui_stg='ech2 "User:PWD = xpcstonecutter9@comcast.net   Csv1050xPC CMMAC=$M1";  open https://internet.staging.xfinity.com/'

### Portal: 1/General>App>NWModem: Modem device info; 2/General>App>POD: Pwd of the day for mso
iportal_POD="http://ip-edge-portal.cable.comcast.com/index.php"
alias oPOD='   open $iportal_POD '
alias modemIP='echo "View cpro_a2 device info at: General>Apps>NW modems and CM_MAC" ; open http://ip-edge-portal.cable.comcast.com/login.php'

# Go iportal to 1.get POD: navigate menu General > POD > vendor= ArrisWG, copy the POD
# Go iportal to 2.get info of modem/CPE, similar info get from Kevin's spreadsheet 
# enable telnet at local ui> Advanced > Remote Mgmt, must use u:p=mso/POD
lui_mso () {   cpeip=$1; echo "Browse CPE_IP: $cpeip, u:p= mso/POD "; open http://$cpeip ; }
alias lui_dev_mso='lui_mso $M2 '

### boxer: checkout github; install boxer
alias installboxer='cdbx  ; echo Python should be 2.7; python setup.py develop'

# Jenkins monitor jobs
alias oje='    open https://jenkins.awsxpc.comcast.net/'

# Webex room
alias owebex=' open https://icollaborate.webex.com/meet/henry_lamcomcast.com'

# telnet works with both IPv4 and IPv6; cpe_al 2: ps|grep webpa; kill -9 webpa process; cd ./fss/gw/usr/ccsp/webpa; ./webpa -subsys eRT. &
cpe_al () {    echo " alias cfg='cat /nvram/syscfg.db' && alias llr='ls -ltraF' && alias cdlr='cd /rdklogs/logs && llr' && alias tlr='tail  -f /rdklogs/logs/WEBPAlog.txt.0' && alias mi='ifconfig -a wan0' && alias catcfg='cat /nvram/webpa_cfg.json'  " ; }
teli  () {     hterm ${2:-basic} "cpe_al && telnet ${1:-$I2}" ; }
cpe_log="/rdklogs/logs/WEBPAlog.txt.0"

alias tlwpa='  tail -n200 -f /rdklogs/logs/WEBPAlog.txt.0 '
alias cpe_log_download='open https://sitools.sys.comcast.net/RDKBWebApplication/; ech2 "with Production CPE MACs only" ' 	
alias cpe_log_realtime='open https://prodlogs.teamccp.com/searchsuite/browselogfirst.action; ech2 "with WAN_MAC=MAC number + 2" '

### Non-xmanage: start magneto 051117
alias odpR='   open http://repos.awsxpc.comcast.net/version/env_info.py?color=red'
alias odpY='   open http://repos.awsxpc.comcast.net/version/env_info.py?color=yellow'
alias odpG='   open http://repos.awsxpc.comcast.net/version/env_info.py?color=green'
alias mag='    open https://magneto.sys.comcast.net/xb_cloud/powercloud/tree/dev/hiera'
alias magR='   open https://magneto.sys.comcast.net/xb_cloud/powercloud/blob/dev/hiera/red.yaml'
alias magA='   open https://magneto.sys.comcast.net/xb_cloud/powercloud/blob/dev/hiera/amber.yaml'
alias magY='   open https://magneto.sys.comcast.net/xb_cloud/powercloud/blob/dev/hiera/yellow.yaml'
alias magG='   open https://magneto.sys.comcast.net/xb_cloud/puppet_xpc/blob/master/hiera/xpc.yaml'

alias magO='   open https://magneto.sys.comcast.net/xb_cloud/powercloud_xap/tree/dev/hiera'
alias magOR='  open https://magneto.sys.comcast.net/xb_cloud/powercloud_xap/blob/dev/hiera/red.yaml'
alias magOA='  open https://magneto.sys.comcast.net/xb_cloud/powercloud_xap/blob/dev/hiera/amber.yaml'
alias magOY='  open https://magneto.sys.comcast.net/xb_cloud/powercloud_xap/blob/dev/hiera/yellow.yaml'

alias magpc='  open https://magneto.sys.comcast.net/xb_cloud/powercloud'
alias magxa='  open https://magneto.sys.comcast.net/xb_cloud/powercloud_xap'

# One Stop Page (https://etwiki.sys.comcast.net/pages/viewpage.action?spaceKey=SMARTINT&title=One+Stop+Page) > Production servers:
alias magP='   open https://magneto.sys.comcast.net/xb_cloud/puppet_xpc/tree/master/hiera'

### Steps to tail log WebPA aka rdk log aka RDKB device log aka cpe_log: 1/ telnet to CPE_IP, pwd=arristi, type quit to enter cli; 2/ cdlr;tlwpa 
# Steps to check env host: 1/env host (api curl get, api postman, pingf, dig, sshcor, runcor, tail logs, ps-ef, servive, supervisorctl); 2/celeRflower tasks; 3/

### Xmanage shows servers ip, hostname xpccore*, or odpcore*, 24=N, 13=N-1, 
# alias_cxi_red='curl -s http://$hostR:9900/env'
cxi_ () {      c=$1; c=${c:-red} ; curl -s http://96.118.36.213:8000/api/v1/xmanage/env/list-new/$c | python -m json.tool ; }

# replace xmanage by magneto
cxi () {       c=$1; c=${c:-red} ; cat $HOME/checkouts/powercloud/hiera/$c.yaml ; } 
cxI () {       c=$1; c=${c:-red} ; cat $HOME/checkouts/powercloud_xap/hiera/$c.yaml ; } 

# use node 2,4 as code N level, node 1,3 as code N-1
alias gx24='   egrep -A1   "core.*-[24]" '
alias gx13='   egrep -A1   "core.*-[13]" '

# use node 2 as xpc celery flower, node 1 as ODP celery flower
alias gxflower='egrep -A4   "xpccore.*-2d" '
alias goflower='egrep -A4   "odpcore.*-1d" '

# list apps nodes
gx () {         egrep -A1 "$*" ; }
#alias gxredis=' gx           redis- '
#alias gxsparkm='gx           sprkm- '
#gx xpc/red/xpcproxy- 	5
#gx xpc/red/xpcconsul- 	6
#gx xpc/red/xpccore- 	8
#gx xpc/red/xpccworker-	8
#gx xpc/red/xpcdb- 	10
#gx xpc/red/xpcsync-    8
#gx xpc/red/xpcsprkm-   4
#gx xpc/red/xpcsprkw-   12
#gx xpc/red/xpchook- 	4
#gx xpc/red/xpcque- 	6
#gx xpc/red/xpczoo-     6
#gx xpc/red/xpcrabbit- 	6
#gx xpc/red/xpcredis- 	6
#gx xpc/red/xpclb-      4 	EQUIV $ dig red.awsxpc.comcast.net ; 
#gx xpc/red/xpcrdkc-    3
### xpcbuild as slave nodes

### godx red "db|redis" ~ ean
godx () {      e=$1; a=$2; ech2 "Env=$e, App=$a"; cxi $e| gx $a ; }

### god command: show env, App (core) , Version { host ODP, IP, SHA = odpcore-ch2f-1d-yellow 96.119.228.111 17.3.1-58.8136fb2 }
god () {       c=$1; c=${c:-red}; a=$2; a=${a:-core}; u="http://repos.awsxpc.comcast.net/version/god_command_with_versions.py?color=$c&app=$a"; ech2 "$u u:p=devops:onlydevops"; open $u ; }

### Env_info command: http://repos.awsxpc.comcast.net/version/env_info.py?color=green&app=core,sync&region=e1a,e1b

# Newton lb nodes
lbNewton="96.118.146.82"
lbNewton1="96.118.146.57"

### Nodes within lb, XPC_INSTANCE
lbRED="https://red.awsxpc.comcast.net"
lbYELLOW="https://yellow.awsxpc.comcast.net"
lbSTAGING="https://xpcapi-stg.xpc.comcast.net"
lbGREEN="https://xpcapi-si.xpc.comcast.net"
GREEN2="https://xpcanalytics.gslb2.comcast.com"

lbyellow_xpc="https://yellow.awsxpc.comcast.net"
lbyellow_odp="https://odpyellowapi.odpaws.comcast.net/"

alias lbRAY='  dig red.awsxpc.comcast.net                          yellow.awsxpc.comcast.net'

nodee () {     for x in proxy consul core db sync sprkm sprkw hook que zoo rabbit redis lb rdkc; do echo;echo $x; cxi $1 |grep xpc$x- ; done ; }

### celery flower ; 1/to get IP, 2/of5 on dashboards and task, check for status="FAILURE", or chk if hob celery workers not running for RED, due to rabbit-hob-3d had its queue full
of5 () {       i=${1:-$hostR}; ech2 "u:p=color:color or u:p=admin:xpc/odpadmin"; open http://$i:5555/tasks     ; }

# celery flower:5555 xpc core 2d $ ean red xpccore 2; Flower:5555 odp core 1d $ eaN red odpcore 1;
licf  () {     cxi $1 | grep -A1 xpccore-.*-2d ; }
licfO () {     cxI $1 | grep -A1 odpcore-.*-1d ; }

# celery flower (@2d, both Red envs), celery task test, celery worker: on red - asb - xpc: $echo "u:p= red/red"; open http://96.118.57.11:5555/tasks
cwk () {       runh "dfn ${1:-red} cworker 1234" ; }
ctt () {       runh "now && cPcelery ${1:-$hostR}" ; }
cfr () {       h=${1:-$hostR}; ech3 CeleryFlower_5555; of5  $h; ech3 Celery_Task_Test; now && cPcelery $h ; }
cfR () {       licf         ; for i in `licf        |gipo|a1line`; do ech2 $i; of5 $i; done ; cwk ${1:-red}; ctt ${2:-$hostR} ; }
cfOR () {      licfO        ; for i in `licfO       |gipo|a1line`; do ech2 $i; of5 $i; done ; dfN ${1:-red} cworker 1234 ; }

# celery flower Yellow
cfY () {       licf   yellow; for i in `licf  yellow|gipo|a1line`; do ech2 $i; of5 $i; done ; open http://68.87.33.80:5555/tasks     ; t1 && cPcelery $hostY && t2 ; }
cfOY () {      licfO  yellow; for i in `licfO yellow|gipo|a1line`; do ech2 $i; of5 $i; done ; }

# celery flower Green 76.96.27.96:5555 or 76.96.26.193:5555
alias cfG='    ech2 "u:p=admin:xpcadmin for AS  "; open http://xpccore-as-01.sys.comcast.net:5555/tasks'
alias cfOG='   ech2 "u:p=admin:odpadmin for AS  "; open http://odpcore-as-01.sys.comcast.net:5555/tasks'

# broad celery flower:5555 u:p=admin/xpcadmin OR admin/odpadmin
alias celeflower=' ech2 u:p=admin:xpcadmin; open http://68.87.33.80:5555/tasks    '

### Env_App_NodeNum1234 ~ godx
ean () {       e=$1; e=${e:-red}; a=$2; a=${a:-core}; d=$4; d=${d:-ch2h}; n=$3; n=${n:-24}; echo $e xpc $a $n :; cxi $e | egrep -A1 $a-$d.*-[$n]d ; }
eaN () {       e=$1; e=${e:-red}; a=$2; a=${a:-core}; d=$4; d=${d:-ch2h}; n=$3; n=${n:-24}; echo $e xpc $a $n :; cxI $e | egrep -A1 $a-$d.*-[$n]d ; }

ipcR () {      n=$1; n=${n:-24}; d=$4; echo red_xpccore $n :; ean red    core    $n  $d| cred   ; }
ipcY () {      n=$1; n=${n:-24}; d=$4; echo yel_xpccore $n :; ean yellow core    $n  $d| cyellow ; }

# utilities$ vih rdkb_auto_upgrade.py : def get_rdkb_last_successful_build(): u:p= base_url = https://xpcjenkins:rYxK8TeU)2@jenkins.ccp.xcal.tv/jenkins/job/ARRISXB3-Yocto-Build

### sitools
# upgrade fw rdkb for cisco/XB6/Green/Production: use sitools: (Acct num + fw image)
#alias ofwup_sitools='  echo "Use NTid to login, input: MAC, image, http/tfpt to proceed"; open https://sitools.sys.comcast.net/siweb/'
alias sit_='   ech2 "sitools, u:p = hlam001c:NTid pwd" ; open https://sitools.sys.comcast.net/siweb/'            
alias sit_wpa='ech2 "Input with cpe mac, make sure cpe online"; open https://sitools.sys.comcast.net/RDKBWebApplication/deviceLogs'
alias sit_spl='ech2 "Input with cpe mac"; open https://sitools.sys.comcast.net/SplunkQuery/'                 
alias sii_api='ech2 "$OBJ"| tr " " "\n" ; open https://sitools.sys.comcast.net/api/api-docs'
# Contact Karthik Sundaram: https://sitools.sys.comcast.net/api/api-docs/#!/WebPA/get_webpa_find_mac; https://sitools.sys.comcast.net/api/webpa/find/044E5A9AE8EC; 

yn () { echo Are u sure?; read x; if [ $x != yes ]; then ech2 Exiting; else ech2 YES_GO; fi; ech3 "option_CtrlC_now_to_abort"; ptmr 10 ; }

# jenkins job for latency report, runs everyday at 7am - https://jenkins.awsxpc.comcast.net/job/latency_test
# script: utilities/latency.py aka sshDan d /root/webpa-restart; run $ ./latency.py 9C34263FAA06
ptmr () {      s=$1; l=${2:-80}; now; (python ~/progressbar.py $s $l) | cred; blink ; }
tmr () {       s=$1; s=${s:-5}; p="* * "; echo -n `date`; for i in `seq \$s`; do echo -n "$p"|cred; sleep 1; done; echo ; }
tmer () {      s=$1; s=${s:-480}; now; ech2 "START WAITING $s SECONDS ... "; sleep $s ; echo -n "DONE $s SECONDS SLEEP... "; blink; cowT $2 |cgreen  ; } 
timer () {     runh tmer $1 $2 ; }

### Dawg-house tool: to reboot CPE, beside 1/powercycle; 2/snmp sReboot; 3/SItools; 4/telnet CPE run OS reboot -f 5/webpa and obj?
odhm () {      m=$1; n=$2; n=${n:-reboot_}; echo "1GO: link Open; 2MAC=$m right?; 3REBOOT: CPE $n"; open http://dawg-house.cvs-a.ula.comcast.net:8080/dawg-house/webpa/?q=$m ; tmer 1000  Dawg_House_reboot; ech2 Check online; gowpa $m ; }
odh () {       now;runh "odhm $1 $2" ; }

### Manual sync test in ENV: 1/trigger a change on CPE (either snmpset new ssid, or local UI change) then 2/wait then check DB thru API call priv wifi 3/Splunk 4/cmc_cid match thru APIs webpa vs sync_info 5/RDK log aka webpa log aka cpe log
ms_cpe    () { i=$1; i=${i:-$I2}; NEW_NAME="HLsync_sS_2g"; sSSID $i && ech2 "=== TRIGGER ==="; ssSSID $i $NEW_NAME|cred && ptmr 30 80 && sSSID $i ; }
#ms_cpe    () { i=$1; i=${i:-$I2}; NEW_NAME="HLsync_sS_2g"; sSSID $i && ech2 "=== TRIGGER ==="; ssSSID $i $NEW_NAME|cred && tmer 30 60sec_spot_sync_sS_2g && sSSID $i ; }
db_cloud () {  m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; b=`bmh $m $h|grep 200`; if [ $? -eq 0 ]; then ech2 "=== DB shows ==="; apw $m $h; smh $m $h; wp_syn $m; else ech2 "bmh failed onboard"; fi ; }
#db_cloud () {  m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; b=`bmh $m $h|grep 200`; if [ $? -eq 0 ]; then ech2 "=== DB shows ==="; apw $m $h; smh $m $h; wp_syn $m; fi ; }

ms_  () {      m=$1; m=${m:-$M2}; i=$2; i=${i:-$I2}; h=$3; h=${h:-$hostR}; ms_cpe $i && db_cloud $m $h ; }
#ms_reset () {  m=$1; m=${m:-$M2}; i=$2; i=${i:-$I2}; RESET_NAME="HLsync_reset_2g"; ssSSID $i $RESET_NAME|cpink ; echo "red yellow"|cle $m  ; }
ms_reset () {  m=$1; m=${m:-$M2}; i=$2; i=${i:-$I2}; RESET_NAME="HLsync_reset_2g"; ssSSID $i $RESET_NAME|cpink ; }

msy () {       m=$1; m=${m:-$M2}; i=$2; i=${i:-$I2}; h=$3; h=${h:-$hostR}; ms_reset $m $i && cmh0 $m $h && ms_cpe $i && db_cloud $m $h && sleep 5 && ms_reset $m $i ; }

ms_R () {      ms_cpe        && db_cloud            ; }
#ms_A () {     ms_cpe    $I3 && db_cloud $M3 $hostA ; }
ms_Y () {      msy   $M1 $I1                 $hostY ; }

ms_G () {      m=${1:-$M1}; i=${2:-$I1}; cle0 $m; ech3 Onboard; onb $m green; ech3 PW_t0; Gapw $m; ech3 SB_trig; lui $i && now ; } # trigger lui (southbound) change && tmr 30 && Gapw $M1 ; the API will check on cloud (or DB)
ms_G2 () {     m=${1:-$M1}; open https://xpcapi-si.xpc.comcast.net/api/v1/gateway-cpe/$m/configuration?group_id=group_private_wifi_configuration ; }

### #force sync: 1/learn cmc cid: api/v1/internal/gateway-cpe/<cpe>/synccsidcmc; 2/post noti /syncnotification with the 2 values: notification/gateway-cpe/<cpe>/syncnotification

### SNMP and OID

# talk2cpe: [snmp] sFW $I2; [WebPA] wp_ $M2; olob $M2; [Cloud API, XPC DB] aws $M2
# check if webpa servive pointing/running right…snmpget -v2c -c hDaFHJG7 10.255.244.38 .1.3.6.1.4.1.17270.50.4.1.2.0
# check if correct web server="fabric.webpa.comcast.net" : 1/ telnet in to view file: /nvram/webpa_cfg.json OR 2/ snmpget cli: # snmpget -v2c -c hDaFHJG7 10.255.244.93 .1.3.6.1.4.1.17270.50.4.1.2.0 SNMPv2-SMI::enterprises.17270.50.4.1.2.0 = STRING: "fabric.webpa.comcast.net"

OID_SSID=".1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001"
alias oOIDsnmp='open https://www.teamccp.com/confluence/display/SMARTINT/SNMP'

# set/get ssid 2g/5g pwd: "snmpset -v2c -c hDaFHJG7 %s .1.3.6.1.4.1.17270.50.2.2.3.1.1.2.10001 s %s" ...10101
sS_ssid () {      cip=$1; n=$2;snmpset -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001  s "$n" ; }
sS_ssid_v6 () {   cip=$1; n=$2;snmpset -v2c -c hDaFHJG7 udp6:$cip .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001  s "$n" ; }
sS_ssid_5g () {   cip=$1; n=$2;snmpset -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10101  s "$n" ; }
sS_ssid_5g_v6 () { cip=$1;n=$2;snmpset -v2c -c hDaFHJG7 udp6:$cip .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10101  s "$n" ; }
ssSSID () {       cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sS_ssid   $cip $2; else      sS_ssid_v6   $cip $2; fi ; }

sG_ssid () {      cip=$1;      snmpget -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001         ; }
sG_ssid_v6 () {   cip=$1;      snmpget -v2c -c hDaFHJG7 udp6:$cip .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001         ; }
sG_ssid_5g () {   cip=$1;      snmpget -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10101         ; }
sG_ssid_5g_v6 () { cip=$1;     snmpget -v2c -c hDaFHJG7 udp6:$cip .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10101         ; }
sSSID () {        cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sG_ssid   $cip   ; else      sG_ssid_v6   $cip   ; fi ; }

sS_UIenab () {    cip=$1;      snmpset -v2c -c hDaFHJG7      $cip  .1.3.6.1.4.1.4115.1.3.4.1.2.6.0   i  1 ; }
sS_UIenab_v6 () { cip=$1;      snmpset -v2c -c hDaFHJG7 udp6:$cip  .1.3.6.1.4.1.4115.1.3.4.1.2.6.0   i  1 ; }

sG_UIenab () {    cip=$1;      snmpget -v2c -c hDaFHJG7      $cip  .1.3.6.1.4.1.4115.1.3.4.1.2.6.0        ; }
sG_UIenab_v6 () { cip=$1;      snmpget -v2c -c hDaFHJG7 udp6:$cip  .1.3.6.1.4.1.4115.1.3.4.1.2.6.0        ; }

#sS_telnet_v6 () { cip=$1;     snmpset -v2c -c hDaFHJG7 udp6:$cip  1.3.6.1.4.1.1429.78.1.1001.1.0    i  1 ; }
sS_enaTel () {    i=$1 pod=$2; snmpset -v2c -c hDaFHJG7 $i 1.3.6.1.4.1.4115.1.3.4.1.2.1.0 s $pod 1.3.6.1.4.1.4115.1.3.4.1.2.2.0 i 1 ; }   

sS_factor () {    cip=$1;      snmpset -v2c -c hDaFHJG7      $cip  1.3.6.1.4.1.17270.50.2.1.1.1002.0 i  1 && tmer 600 SNMP_REBOOT_$2_$cip ; }
sS_reboot () {    cip=$1;      snmpset -v2c -c hDaFHJG7      $cip  1.3.6.1.2.1.69.1.1.3.0            i  1 && tmer 600 SNMP_REBOOT_$2_$cip ; }
sS_reboot_v6 () { cip=$1;      snmpset -v2c -c hDaFHJG7 udp6:$cip  1.3.6.1.2.1.69.1.1.3.0            i  1 && tmer 600 SNMP_REBOOT_$2_$cip ; }
sReboot () {      cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then runh sS_reboot $cip $2; else runh sS_reboot_v6       $cip $2; fi  ; }
#sFactory () {     cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then runh sS_factor $cip $2; else runh sS_factor     udp6:$cip $2; fi  ; }
#sRebootm () {     m=$1; cip=`getip $m`; sReboot $i && gowpa $m ; }  

sS_wpastart () {  cip=$1;      snmpset -v2c -c hDaFHJG7      $cip  .1.3.6.1.4.1.17270.50.4.1.1.0     i  1 ; now ; }
sS_wpastop  () {  cip=$1;      snmpset -v2c -c hDaFHJG7      $cip  .1.3.6.1.4.1.17270.50.4.1.1.0     i  2 ; now ; }

sG_wpa      () {  cip=$1;      snmpget -v2c -c hDaFHJG7      $cip  .1.3.6.1.4.1.17270.50.4.1.2.0          ; }
sG_wpa_v6   () {  cip=$1;      snmpget -v2c -c hDaFHJG7 udp6:$cip  .1.3.6.1.4.1.17270.50.4.1.2.0          ; }
sWPA () {         cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sG_wpa    $cip   ; else      sG_wpa_v6    $cip   ; fi ; }

sG_wan () {       cip=$1;      snmpget -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.17270.50.2.3.9.2.1.0                                 ; }
sG_wan_v6 () {    cip=$1;      snmpget -v2c -c hDaFHJG7 udp6:$cip .1.3.6.1.4.1.17270.50.2.3.9.2.1.0 | tr ';<<' '\n' | column -s: -t ; }
sWAN () {         cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sG_wan    $cip   ; else      sG_wan_v6    $cip   ; fi ; }

sG_fw  () {       cip=$1;      snmpget -v2c -c hDaFHJG7      $cip  1.3.6.1.2.1.1.1.0 | tr ';<<' '\n' | column -s: -t |cred ; }
sG_fw_v6 () {     cip=$1;      snmpget -v2c -c hDaFHJG7 udp6:$cip  1.3.6.1.2.1.1.1.0 | tr ';<<' '\n' | column -s: -t |cred ; }
sFW () {          cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sG_fw     $cip   ; else      sG_fw_v6     $cip   ; fi ; }

sG_lan () {       cip=$1;      snmpget -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.17270.50.2.3.2.1.3.32                                ; }
sLAN () {         cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sG_lan    $cip   ; else      sG_lan  udp6:$cip   ; fi ; }

sG_r2g () {       cip=$1;      snmpget -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.17270.50.2.2.7.1.1.1.10000                           ; }
sR2G () {         cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sG_r2g    $cip   ; else      sG_r2g  udp6:$cip   ; fi ; }

sG_r5g () {       cip=$1;      snmpget -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.17270.50.2.2.7.1.1.1.10100                           ; }
sR5G () {         cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sG_r5g    $cip   ; else      sG_r5g  udp6:$cip   ; fi ; }

# cisco share sWPA, sFW, sWAN, get sSSID
sc_factor () {    cip=$1;      snmpset -v2c -c hDaFHJG7      $cip  1.3.6.1.4.1.1429.77.1.3.18.0      i  1 && tmer 600 SNMP_REBOOT_$2_$cip ; }
sc_reboot () {    cip=$1;      snmpset -v2c -c hDaFHJG7      $cip  .1.3.6.1.4.1.1429.77.1.3.17.0     i  1 && tmer 600 SNMP_REBOOT_$2_$cip ; }
scReboot () {     cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then runh sc_reboot $cip $2; else runh sc_reboot     udp6:$cip $2; fi  ; }
#scFactory () {    cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then runh sc_factor $cip $2; else runh sc_factor     udp6:$cip $2; fi  ; }

#sc_lan () {       cip=$1;      snmpget -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.1429.79.2.3.2.1.3.32                                 ; }
#scLAN () {        cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sc_lan    $cip   ; else      sc_lan  udp6:$cip   ; fi ; }

sc_r2g () {       cip=$1;      snmpget -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.1429.79.2.2.7.1.1.1.32                               ; }
scR2G () {        cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sc_r2g    $cip   ; else      sc_r2g  udp6:$cip   ; fi ; }

sc_r5g () {       cip=$1;      snmpget -v2c -c hDaFHJG7      $cip .1.3.6.1.4.1.1429.79.2.2.7.1.1.1.112                              ; }
scR5G () {        cip=$1;      r=`echo $cip|gip`; if [ $? -eq 0 ] ; then      sc_r5g    $cip   ; else      sc_r5g  udp6:$cip   ; fi ; }

sc_enaTel () {    i=$1 pod=$2; snmpset -v2c -c hDaFHJG7      $i   1.3.6.1.4.1.1429.78.1.1001.1.0     i  1                           ; }

### Upgrade FW via SNMP 4x - https://etwiki.sys.comcast.net/display/SMARTINT/QA+Cheat+Sheet
#set the server:    snmpset -v2c -c hDaFHJG7 <CM IP of your XB3> .1.3.6.1.2.1.69.1.3.1.0 a 10.255.246.110
#set the image:     snmpset -v2c -c hDaFHJG7 <CM IP of your XB3> .1.3.6.1.2.1.69.1.3.2.0 s <image name>
#start the upgrade: snmpset -v2c -c hDaFHJG7 <CM IP address> .1.3.6.1.2.1.69.1.3.3.0 i 1 
#check the version: snmpget -v2c -c hDaFHJG7 <CM IP of your XB3> 1.3.6.1.2.1.1.1.0

### thru WebPA/SATtoken
wp_ () {       m=$1;   o=$2; o=${o:-Device.DeviceInfo.X_COMCAST-COM_WAN_IP}; ech2 "$o: "; py ~/get_thru_webpa.py  $m   $o ; }
wp_rdkb () {   cip=$1; ech2 "RDKB FW at CPE  (thru WebPA/SATtoken):  $cip "; python ~/get_fwcpe_thru_webpa.py     $cip ; }
wp_wan () {    m=$1;   ech2 "WAN IP for CPE  (thru WebPA/SATtoken):  $m ";   python ~/get_wan_thru_webpa.py       $m   ; }

wp_syn () {    m=$1;   ech2 "(thru WebPA/SATtoken):  $m ";   python ~/get_syn_thru_webpa.py   $m   ; }

#xpc-test/xpcfunctionaltest/utilities/cleanup_cpe.py
cle () {       m=$1; ech2 "Clean CPE $m from envs"; cd; python cleanup_cpe.py  --cpe $m ; line ; }
cle0 () {      m=$1; echo "red yellow green"| cle $m ; }

onb () {       m=$1; e=$2; ech2 "Onboard CPE $m to env $e."; cd; (python onboard_cpe.py   --cpe $m --env $e)|cblue; line ; }

# check if CPE mac is online thru webpa, and if onboard on any host/env
getipv4 () {   m=$1; python $HOME/get_ipcpe_thru_webpa.py   $m |gc2 value ; }
getipv6 () {   m=$1; python $HOME/get_ipv6cpe_thru_webpa.py $m |gc2 value ; }
goWPA () {     m=$1; ech2 "Chk CPE (thru WebPA/SATtoken)"; line; bash ~/check_device_webpa_2.sh $m $2 ;ech2 ; }
gowpa () {     m=$1; ech2 "Chk CPE (thru WebPA/SATtoken)"; line; bash ~/checkouts/xpc-testm/xpc-test/xpcfunctionaltest/utilities/check_device_webpa.sh $m;ech2 ; }

olob () {      m=$1; ech2 "Check if ONLINE thru WebPA ..."; gowpa $m|cblue; ech2 "Check if ONBOARD ..."; now; cle $m ; }
# olob GREEN: 1/postman 2/GET https://xpclb-ch2-01.sys.comcast.net/api/v1/gateway-cpe/044E5A9AE8EC/association 3/NTid:pwd
# apw  GREEN: $ GXgi $M2 group_private_wifi_configuration;  https://xpclb-ch2-01.sys.comcast.net/api/v1/gateway-cpe/044E5A9AE8EC/configuration?group_id=group_private_wifi_configuration

### Repositories:
se="xpc-solutions-eng"
xt="xpc-test"

### cd
#alias sxa='    subl  $HOME/checkouts/xap'; alias sse='    subl  $HOME/checkouts/$se     '; alias sxt='    subl  $HOME/checkouts/xpc-test'
alias cdxa='   cd    $HOME/checkouts/xap'
alias cdse='   cd    $HOME/checkouts/xpc-solutions-eng;  cbr|cblue;  pwd'
alias cdxt='   cd    $HOME/checkouts/xpc-test;           cbr|ccyan;  pwd|grep test '
alias cdxtm='  cd    $HOME/checkouts/xpc-testm/xpc-test; cbr|cgreen; pwd|grep test '
alias cdpc='   cd    $HOME/checkouts/powercloud;         cbr|cgreen; pwd'
alias cdpcxa=' cd    $HOME/checkouts/powercloud_xap;     cbr|cgreen; pwd'
alias cdhi='   cdpc;   cd hiera; p '
alias cdhixa=' cdpcxa; cd hiera; p '

alias cdrunodp='cd   $HOME/checkouts/xap/smoketests/test_odp;   ech2 Current branch is `cbr|ccyan`; p '
alias cdrunat='cd    $HOME/checkouts/xpc-test/boxertest_client; ech2 Current branch is `cbr|ccyan`; p '

alias cdcurls='cd    $HOME/checkouts/xpc-testm/xpc-test/testscripts/curlscripts; ech2 Current branch is `cbr|ccyan`; ls; pwd '
alias cdcerts='cd    $HOME/checkouts/xpc-testm/xpc-test/testscripts/signed_cert; ech2 Current branch is `cbr|ccyan`; ls; pwd '

alias runat='  subl  $HOME/checkouts/xpc-test/boxertest_client/run_any.sh'

#ssrcf="https://jenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-sync-on-red/configure"
je_j="https://jenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job"
jssr="$je_j/smoketest-sync-on-red"
jnrn="$je_j/smoketest-n-on-red-n"
jn1rn="$je_j/smoketest-n-1-on-red-n"
jnrn1="$je_j/smoketest-n-on-red-n-1"          
jn1rn1="$je_j/smoketest-n-1-on-red-n-1"

jssy="$je_j/smoketest-sync-yellow"
jstoyv="$je_j/smoketest-on-yellow-validation"
jstoy="$je_j/smoketest-on-yellow"

#ssrcf="https://jenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-sync-on-red"
#nrncf="https://jenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-n-on-red-n/configure"
#n1rncf="https://jenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-n-1-on-red-n/configure"
#nrn1cf="https://jenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-n-on-red-n-1/configure"
#n1rn1cf="https://jenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-n-1-on-red-n-1/configure"

oyst () {      a=$1; open $jssy/$a $jstoy/$a $jstoyv/$a ; }
orst () {      a=$1; open $jssr/$a $jnrn/$a  $jn1rn/$a  $jnrn1/$a $jn1rn1/$a ; }
alias orcf='   orst "configure" '
alias orch='   orst "jobConfigHistory" '
alias orlb='   orst "lastBuild/consoleFull" '
alias orbu='   orst "build" '
alias orrb='   orst "lastCompletedBuild/rebuild" '


alias onrn='   open https://jenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-n-on-red-n'

alias run0='   grep python2 $HOME/checkouts/xpc-test/boxertest_client/run_any.sh |grep -v "\#"|cpink && runat && lastbox && p && onrn ; hterm pro "msy"; runh "msy $M5 $I5 $hostA"; hterm basic "msy $M1 $I1 $hostY"; verR; verA; verY '

runl () {      cdrunat; c=$1; c=${c:-basic}; hterm $c "now;echo $2;run_any.sh|fteey && cowS $2 |cgreen" ; }
alias run1='   runl           basic'
alias run2='   runl           pro '
alias run3='   runl           homebrew'

# cd smoketest locations
alias cdlat='  cd     $HOME/checkouts/xap/smoketests/test_xpc/latency/  ; p '    
alias cdlatmm='cdlat; cd test_case_latency_moca_mode;p '
alias cdlatbm='cdlat; cd test_case_latency_bridge_mode;p '
alias cdlatr5='cdlat; cd test_case_latency_radio_5g; p '
alias cdr2='   cd     $HOME/checkouts/hl/latency/r2; p '
alias cdr5='   cd     $HOME/checkouts/hl/latency/r5; p '
alias cdsts='  cd     $HOME/checkouts/xap/smoketests/test_xpc/xpc_tests/; p '      
alias cdst='   cd     $HOME/checkouts/xap/smoketests ; p '           

### BOX API
APIX="XPC-Platform-API-V2.0.9.5-LifecycleAndConfigSetManagement_Phase2.1MVP_M0.1v1.2s.pdf"
alias boxobj=' echo Platform_CloudParameters_V-2.1.docx; open https://comcast.app.box.com/files/0/f/5008533769/1/f_196941031837'
alias boxapio='open https://comcast.app.box.com/files/0/f/9067651730/1/f_76978037221; ech2 ODP-Platform-API-V1-OperationalDataManagement_Phase1v0 8.3.31.pdf'
alias boxapix='open https://comcast.app.box.com/files/0/f/9067651730/1/f_98327234961; ech2 XPC-Platform-API-V2.0.9.5-LifecycleAndConfigSetManagement_Phase2.1MVP_M0.1v1.2s.pdf'
alias boxapi=' open https://comcast.app.box.com/files/0/f/9067651730/SprintN;         ech2 XPC/OPD-Platform-API.*.pdf'

gc2 () {       egrep $*|cut -d: -f2- |tr ',\"' ' ' ; }
gbx  () {      egrep -n "context|Starting|expect|status|method|-|endpoint|query|before|after"; }
gbx2 () {      egrep -n "action|request|response|context|Starting|expect|status|method|-|endpoint|query|before|after"; }
cgbx () {      tc=$1; cat $tc|gbx ; }

### check association and get csid:
isa () {       m=$1; h=$2; curl -s -X GET                                http://$h:8080/api/v1/gateway-cpe/$m/association   |pjson|cblue ; }
isA () {       m=$1; h=$2; u="http://$h:8080/api/v1/gateway-cpe/$m/association"; echo "GET $u"; python -c "import sys,json,os,requests; resp = json.loads(requests.get('$u',cert='./client.pem',verify=False).text); print json.dumps(resp)" | python -m json.tool |cgreen ; }

### create new csid (empty body) via curl POST API configset, via Python requests.post()
cPcsid0 () {   h=$1; h=${h:-$hostR}; csid  $h ; } # empty

### create new csid (with  body) via curl POST API configset
cPcsid () {    h=$1; h=${h:-$hostR}; u="http://$h:8080$a1c";    b=${2:-b_csid1.json}; ech2 $b; bjp $b && cP $u ; } # b_csid1.json
cDcsid () {    c=$1; h=$2;           u="http://$h:8080$a1c/$c"; cDel $u ; }
ach () {       c=$1; h=$2; h=${h:-$hostR};              aco0         $c  $h ; }

### func a, b, c, d, p, l, i, s, f, g, t, r, x for Asso, onB, Clean, Detach/Disasso, Clean, Purge/Delete CPE, Log, Info, Sync, forget, grep, tailgrep, resetClean, x
amh () {       m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; isA          $m  $h ; }
csid () {      h=$1; h=${h:-$hostR}; u="http://$h:8080$a1c"; ech2 "POST $u"; curl -s -X POST $u |pjson|cblue ; }
aaa () {       m=$1; h=$2; c=$3; python $HOME/aaa.py                 $m  $h $c |cblue ; }
bmh () {       m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; python $HOME/onboard.py $m  $h |cblue ; }
cmh () {       m=$1; h=$2;       python $HOME/clean_ac.py            $m  $h    ; }
cmh0 () {      m=$1; h=$2;       python $HOME/clean_ac_emptycsid.py  $m  $h    ; }
dmh () {       m=$1; h=$2;       python $HOME/detach.py              $m  $h    ; }
swapmhc () {   m=$1; h=$2; c=$3; python $HOME/swap_onb.py            $m  $h $c |cblue ; }
pmh () {       m=$1; h=$2;       python $HOME/purge_cpe_frDB.py      $m  $h    ; }
Fmh () {       m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; ho=$3; ho=${ho:-$hostOR}; ech3 CLEAN; cle0 $m; tmr 3; ech2 ONB; bmh $m $h; apl $m $h; ech3 DEVICE; ods $m $ho; nrx2 $m $h; crx $m $h; nro2 $m $ho; cro $m $ho; tmr 5; now; ech3 XPC_FORGETDEV; bjp b_forget.json && cPforget $m $h && ptmr 15; crx $m $h; cro $m $ho; ods $m $ho  ; }
fmh () {       m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR};                           ech3 CLEAN; cle0 $m; tmr 3; ech3 ONB; bmh $m $h; apl $m $h; ech3 DEVICE;             nrx2 $m $h; crx $m $h; tmr 5;                          now; ech3 XPC_FORGETDEV; bjp b_forget.json && cPforget $m $h && ptmr 15; crx $m $h ; }
fmH () {       runh  fmh $1 $2 $3 ; }
lmh () {       m=$1; m=${m:-$M2}; h=$3; h=${h:-$hostR}; i=$2; i=${i:-$I2}; teli $i; gmH ${4:-$m} $h; tmH $m $h ; }
gmh () {       m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; ech3 Grep_xpc_log;        glxph $m       $h ; }
gmH () {       runh  gmh $1 $2  ; }
tfh () {       h=$1; ech3 Tail_f_Log_Xpc; tlx  $h ; }
tmh () {       m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; ech3 Grep_tail_f_xpc_log; ( tlxph $h )| grep -i $m ; } 
tmH () {       hterm pro   " tmh $1 $2"  ; } 
mhi () {       m=$1; h=$2; gowpa $m; rver $h; now ; }
imh () {       m=$1; h=$2; ech3 Info_cpe;  amh $m $h; aci  $m $h; aga  $m $h; agd $m $h; acd  $m $h; mpf $m $h; mmb $m $h; echo; now ; }
imh2 () {      m=$1; h=$2; ech3 Info_cpe;  amh $m $h; aci2 $m $h; aga  $m $h; agd $m $h; acd2 $m $h; mpf $m $h; mmb $m $h; echo; now ; }
smh () {       m=$1; h=$2; ech3 Sync_info; amh $m $h; asi  $m $h; ech3 Sync_asc; asc  $m $h; now ; }
rmh () {       m=$1; h=${2:-$hostR}; ech3 FACTORY_RESET; blink; cle0 $m; ech3 CleaningCPE_Ctrl_C_to_abort_now; ptmr 30; b=`bmh $m $h|grep 200`; if [ $? -eq 0 ]; then ech3 Starting; FacRes $m $h; ptmr 1000; else ech2 "bmh/FacRes failed"; fi; ech3 Done ; }
snmh () {      m=$1; h=$2; ech3 Sync_Now;                asn  $m $h;             now ; }
m2mh () {      m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; cle  $m && bmh $m $h && echo y|bjp b_pw_m2.json && cPpw $m $h &&  imh $m $h  ; }
m3mh () {      m=$1; m=${m:-$M3}; h=$2; h=${h:-$hostR}; cle0 $m && bmh $m $h && echo y|bjp b_pw_m3.json && cPpw $m $h &&  imh $m $h  ; }
m5mh () {      m=$1; m=${m:-$M5}; h=$2; h=${h:-$hostR}; cle0 $m && bmh $m $h && echo y|bjp b_pw_m5.json && cPpw $m $h &&  imh $m $h  ; }
m6mh () {      m=$1; m=${m:-$M6}; h=$2; h=${h:-$hostR}; cle0 $m && bmh $m $h && echo y|bjp b_pw_m6.json && cPpw $m $h &&  imh $m $h  ; }
xmh () {       m=$1; h=$2; n=$3; now; ech3 ONB; bmh $m $h; c=`amh $m $h|gc2 xpc_csid`; nrx2 $m $h; tmr 5; now; ech3 DETACH; dmh $m $h; ptmr 9; now; ech3 SWAP; swapmhc $n $h $c; ptmr 15; crx $n $h; now ; }
xmH () {       runh  xmh $1 $2 $3 ; }
zmh () {       m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; ech3 "Defaul/Reserved_GW_settings"; agd $m $h ; } # cpe t zero setting:

# cirrent: amh $M2 $hostY; bmh ; apwa $M2 $hostY; apwa2 $M2 $hostY; awc $M2 $hostY; 
# GET http://96.119.225.204:8080/api/v1/gateway-info?wan_ip=10.255.245.10&ssid_name=2gTest_SSID_Name&bssid=FC%3A51%3AA4%3A1A%3ABC%3AB3
# xpc> select * from bssid_cpe_mac; 

### Steps firmware and tftp : upgrade fw for Red/Amber/Yellow: jenkins job upgrade-rdkb to CPE: 0/fr Yocto ofw, scp 2Dan_2TFTP 1/smktest job shows CPE MAC 2/gowpa MAC 3/fill jenkins params: cpemac, cpeid, New FW image, document old FW, and running job number. OR 3bis/reboot cpemac, wait and fill params
alias ofwup='  open  https://jenkins.awsxpc.comcast.net/job/upgrade-rdkb/build?delay=0sec'
alias ofw='    ech2 "u:p=hlam01/LDAP_pwd"; open  https://nexus.teamccp.com/nexus/content/repositories/arris_xb3/images/signing_stage/ArrisXB3-Yocto-Release/'
alias ofw6='   ech2 "u:p=hlam01/LDAP_pwd"; open  https://nexus.teamccp.com/nexus/content/repositories/arris_xb6/images/signing_stage/ARRISXB6-Yocto-Release/'
alias ofwc='   ech2 "u:p=hlam01/LDAP_pwd"; open  https://nexus.teamccp.com/nexus/content/repositories/cisco_xb3/images/signing_stage/CISCOXB3-Yocto-Release-2-1/155/' 

# scp image to Dan; scp image from Dan to TFTP
i2d () {       img=$1; cd $HOME/Download; scp -r ./$img root@69.252.255.146:/ ; } 
i2t () {       img=$1; cd /;          scp -r  /$img root@10.255.246.110:/var/www/html/images/  ; }

# Dan's jumper host: lta27 aka 10.1.50.27 aka 69.252.255.146
alias sshDan=' ssh root@69.252.255.146 '
alias sshtftp='ssh root@69.252.255.146 -t "ssh 10.255.246.110" '
alias imgTFTP='sshDan -t "ssh 10.255.246.110 ls -ltr /var/www/html/images" '

### Steps to ssh core as clduser or root # $ brew install csshx; vi $HOME/.ssh/config; identityFile $HOME/.ssh/xpc-openstack-key.txt; identityFile ~/.ssh/id_rsa; csshx --login clduser  96.119.227.248 96.119.227.25; 
dbnew () {     csshx -l hlam001c   96.118.146.116 96.118.146.152 96.118.146.156 96.118.146.151 96.118.253.158 96.118.253.143 96.118.253.154 96.118.253.165 ; }
sshc () {      csshx -l clduser  $* ; }
sshC () {      csshx -l root     $* ; }
sshchk () {    hks=$*; sshc $hks ; }

### sshcore ,  run cmds on ssh core nodes and other apps nodes                
hostG="96.115.78.175"
hostA="96.118.23.51"            # xpccore-hob-2d-amber
hostA1="96.118.23.53"           # xpccore-hob-1d-amber 

# host Red:                     asb-1/2d, hob-1/2d
ahostR="96.118.57.11"           # xpccore-asb-2d-red
ahostR1="96.118.57.10"          # xpccore-asb-1d-red
ahostOR="96.118.61.32"          # odpcore-asb-2d-red
ahostOR1="96.118.61.36"         # odpcore-asb-1d-red

# Newton - red - hoc ch2h
#hostR="96.118.147.40"           # xpccore-ch2h-2d-red
#hostR1="96.118.147.38"          # xpccore-ch2h-1d-red
#hostOR="96.118.145.122"         # odpcore-ch2h-2d-red
#hostOR1="96.118.145.178"        # odpcore-ch2h-1d-red

hostR="96.118.147.40"           # xpccore-ch2h-2d-red
hostR1="96.118.147.38"          # xpccore-ch2h-1d-red
hostOR="96.118.145.122"         # odpcore-ch2h-2d-red
hostOR1="96.118.145.178"        # odpcore-ch2h-1d-red

chostR="96.118.147.40"          # xpccore-ch2h-2d-red
chostR1="96.118.147.38"         # xpccore-ch2h-1d-red
chostOR="96.118.145.122"        # odpcore-ch2h-2d-red
chostOR1="96.118.145.178"       # odpcore-ch2h-1d-red

hhostR="96.118.253.104"         # xpccore-hoc-2d-red
hhostR1="96.118.253.117"        # xpccore-hoc-1d-red
hhostOR="96.118.251.154"        # odpcore-hoc-2d-red
hhostOR1="96.118.251.161"       # odpcore-hoc-1d-red

# host Yellow                   ch2-2d; wcdxx-2d; asb-2d
#_hostY="96.119.225.204"	# xpccore-ch2f-2d-yellow
ahostOY="96.118.58.243"		# odpcore-asb-2d-yellow 
hostY="96.118.157.113"          # xpccore-ch2h-2d-yellow
hostOY="96.118.157.242"         # odpcore-ch2h-2d-yellow
chostY="96.118.157.113"         # xpccore-ch2h-2d-yellow
chostOY="96.118.157.242"        # odpcore-ch2h-2d-yellow
hhostY="96.118.243.253"         # xpccore-hoc-4d-yellow 
hhostOY="96.118.248.132"        # odpcore-hoc-2d-yelloww

# host Orange
hostOr='96.115.227.246'		# xpccore-asd-4d-orange
hostOr1='96.115.255.130'	# xpccore-asd-1d-orange
hostOOr='96.115.229.14'         # odpcore-asd-4d-orange
hostOOr1='96.115.228.251'       # odpcore-asd-1d-orange

# nodes hook, kafka, zoo, sync
hkR="96.118.252.178"	        # xpchook-hoc-2d-red
kkR="96.118.253.120"	        # xpcque-hoc-2d-red
zoR="96.118.253.142"	        # xpczoo-hoc-2d-red
syR="96.118.253.124"		# xpcsync-hoc-2d-red
swR="96.118.253.141"	        # xpcsprkw-hoc-2d-red
smR="96.118.253.136"    	# xpcsprkm-hoc-2d-red
cwR="96.118.251.152"    	# xpccworker-hoc-2d-red
rbR="96.118.253.135"    	# xpcrabbit-hoc-2d-red

chkR="96.118.147.37"            # xpchook-ch2h-2d-red
ckkR="96.118.147.17"            # xpcque-ch2h-2d-red
czoR="96.118.146.160"           # xpczoo-ch2h-2d-red
csyR="96.118.147.44"            # xpcsync-ch2h-2d-red
cswR="96.118.144.94"            # xpcsprkw-ch2h-2d-red
csmR="96.118.144.53"            # xpcsprkm-ch2h-2d-red
ccwR="96.118.145.115"           # xpccworker-ch2h-2d-red
crbR="96.118.147.54"            # xpcrabbit-ch2h-2d-red

# nodes redis
hredisR="96.118.253.144"      	# xpcredis-hoc-2d-red
hredisY="96.118.247.155"	# xpcredis-hoc-2d-yellow
hredisOR="96.118.250.234"       # odpredis-hoc-2d-red
hredisOY="96.118.248.246"       # odpredis-hoc-2d-yellow

redisR="96.118.146.110"         # xpcredis-ch2h-2d-red
redisY="96.118.159.199"         # xpcredis-ch2h-2d-yellow

# DB  nodes                     Red: hob-1/2d; asb; Yellow: ch2-2d; asb
dbR="96.118.253.143"            # xpcdb-hoc-2d-red
dbR1="96.118.253.158"           # xpcdb-hoc-1d-red
dbOR="96.118.251.169"           # odpdb-hoc-2d-red                
dbOR1="96.118.251.240"          # odpdb-hoc-1d-red               
dbY="96.118.242.138"            # xpcdb-hoc-2d-yellow
dbOY="96.118.248.254"           # odpdb-hoc-2d-yellow

cdbR="96.118.146.152"           # xpcdb-ch2h-2d-red
cdbR1="96.118.146.116"          # xpcdb-ch2h-1d-red
cdbOR="96.118.145.243"          # odpdb-ch2h-2d-red                
cdbOR1="96.118.147.152"         # odpdb-ch2h-1d-red
cdbY="96.118.159.207"           # xpcdb-ch2h-2d-yellow
cdbOY="96.118.158.169"          # odpdb-ch2h-2d-yellow

sshhk    () {  ssh -i $HOME/.ssh/xpc-openstack-key.txt    root@${1:-$hkR} ; }
sshkk    () {  ssh -i $HOME/.ssh/xpc-openstack-key.txt    root@${1:-$kkR} ; }
sshzoo   () {  ssh -i $HOME/.ssh/xpc-openstack-key.txt    root@${1:-$zoR} ; }
sshsync  () {  ssh -i $HOME/.ssh/xpc-openstack-key.txt    root@${1:-$syR} ; }
sshsprkw () {  ssh -i $HOME/.ssh/xpc-openstack-key.txt    root@${1:-$swR} ; }
sshredis () {  ssh -i $HOME/.ssh/xpc-openstack-key.txt    root@${1:-$redisR} ; }

sshdbph () {   ssh -i $HOME/.ssh/id_rsa               hlam001c@${1:-$dbR} ; } #ech2 "CLI: nodetool status; to debug DB" 

#sshdb  () {   ssh -i $HOME/.ssh/xpc-openstack-key.txt    root@${1:-$dbR} ; } #ech2 "CLI: nodetool status; to debug DB" 
sshdb   () {   ssh                                             ${1:-$dbR} ; } #ech2 "CLI: nodetool status; to debug DB" 
alias sshdbOR=' sshdb $dbOR'

alias sshdbY='  sshdb $dbY'
alias sshdbOY=' sshdb $dbOY'

# Steps to see DC behind Red GSLB: sshprivh red.awsxpc.comcast.net; xpclb-ch2h-2d-red /etc/haproxy/haproxy.cfg ; grep core; OR 1/dig $rlb; 2/sshph to ea lb node ip; 3/grep node on haproxy.cfg

### ssh node: 1/ public/priv keys; 2/users: root/hlam001x/xplat/clduser
# sshr, sshcld, sshx, sshpx sshph
sshcor  () {   coreip=$1; coreip=${coreip:-$hostR};  ssh -i $HOME/.ssh/xpc-openstack-key.txt    root@$coreip ; }
sshcore () {   coreip=$1; coreip=${coreip:-$hostR};  ssh -i $HOME/.ssh/xpc-openstack-key.txt clduser@$coreip ; }
sshcx () {     coreip=$1; coreip=${coreip:-$hostR};  ssh -i $HOME/.ssh/xpc-openstack-key.txt   xplat@$coreip ; }
alias sshR='   ssh $hostR'
alias sshR1='  ssh $hostR1'
alias sshOR='  ssh $hostOR'
alias sshOR1=' ssh $hostOR1'

alias sshxplat='ssh -i $HOME/.ssh/id_rsa xplat@odpredis-as-01q.sys.comcast.net'
sshprivh () {  coreip=$1; coreip=${coreip:-odpredis-as-01q.sys.comcast.net};  ssh -i $HOME/.ssh/id_rsa hlam001c@$coreip ; }
sshprivx () {  coreip=$1; coreip=${coreip:-odpredis-as-01q.sys.comcast.net};  ssh -i $HOME/.ssh/id_rsa    xplat@$coreip ; }

sshcorh () {   hterm novel "sshcor    $1" ; }
sshph () {     hterm ocean "sshprivh  ${1:-$hostR}" ; }

run    () {    coreip=$1; coreip=${coreip:-$hostR};  ssh                                    hlam001c@$coreip -t "hostname; $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15" ; }
runph  () {    coreip=$1; coreip=${coreip:-$hostR1n};ssh -i $HOME/.ssh/id_rsa               hlam001c@$coreip -t "hostname; $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15" ; }
runcor  () {   coreip=$1; coreip=${coreip:-$hostR};  ssh -i $HOME/.ssh/xpc-openstack-key.txt    root@$coreip -t "hostname; $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15" ; }
runcore () {   coreip=$1; coreip=${coreip:-$hostR};  ssh -i $HOME/.ssh/xpc-openstack-key.txt clduser@$coreip -t "hostname && $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15" ; }

# host name thru connectiton to core node, or grep on hiera/ of repos
hnhi () {      h=$1; r=`echo $h|gip`; if [ $? -eq 0 ] ; then grinhi -B1 $h ; else grinhi -A1 $h; fi ; }
hnph () {      h=$1; h=${h:-$hostR}; runph   $h "hostname" | cpink ; hnhi $h | cgreen ; }
hncohi () {    h=$1; h=${h:-$hostR}; run     $h "hostname" | cpink ; hnhi $h | cgreen ; }
hnco () {      h=$1; h=${h:-$hostR}; run     $h "hostname" | cpink ; }
#hnco () {     h=$1; h=${h:-$hostR}; runcore $h "hostname" | cpink ; }

# dse - cassandra - db
startdse="     sudo service dse    start "
servicedse="   sudo service dse    status"

servicepup="   sudo service puppet status"
serviceAR () { d=$1; (for i in `ean red    core 1234 $d |gipo|a1line`;   do echo;echo $i; runph  $i "df;uptime;supervisorctl status all;" ; done)|cred ; }
serviceAY () { d=$1; (for i in `ean yellow core 1234 $d |gipo|a1line`;   do echo;echo $i; runph  $i "df;uptime;supervisorctl status all;" ; done)|cyellow ; }

### SHA # get the latest SHA, by API version
sha1 () {      rp=$1; rp=${rp:-xap}; echo "@ `date` : "|cblue; cd $HOME/checkouts/$rp; echo -n "The lastest SHA: "; echo -n "/$rp/ <*`cbr`> : "|cpink; git log -p -1 | egrep -o "commit [0-9a-f]{7}" |cut -c8-14 ; }

# get SHA,     by sshcore and check yum log info
coresha () {   coreip=$1; coreip=${coreip:-96.118.57.13}; ssh -i $HOME/.ssh/xpc-openstack-key.txt clduser@$coreip -t "echo `seq  -f = -s '' 20 `; date; hostname; sudo tail -4 /var/log/yum.log" | tee -a $HOME/logs/snn.log ; }
csha () {      coreip=$1; coreip=${coreip:-96.118.57.13}; ssh -i $HOME/.ssh/xpc-openstack-key.txt clduser@$coreip -t "echo `seq  -f = -s '' 20 `; date; hostname; yum info xap      " | tee -a $HOME/logs/snn.log ; }

# get the latest SHA  from github versus current on Red/A/Y hosts
g_c () {       cdxa; git pull 2> /dev/null; commit=$1; commit=${commit:-1}; gc=`git log -p -$commit | egrep -o "commit [0-9a-f]{7}" |cut -c8-14`; echo "GitHub xap repos: SHA=$gc"; echo; for i in `ean red    core 24 $2|gipo|a1line` ; do echo -n red_core_$i: SHA=; cc=`curl -s $i:8080/api/v1/version|pjson|grep commit|tr ',\"' ' '|cut -d. -f4`; echo  $cc ; [ $gc != $cc ] && echo ">>>> NOT_matched `date` <<< " && echo ; done ; }
g_cY () {      cdxa;git pull 2> /dev/null;                                  gc=`git log -p -1       | egrep -o "commit [0-9a-f]{7}" |cut -c8-14`; echo "GitHub xap repos: SHA=$gc"; echo; for i in `ean yellow core 24 $2|gipo|a1line` ; do echo -n yel_core_$i: SHA=; cc=`curl -s $i:8080/api/v1/version|pjson|grep commit|tr ',\"' ' '|cut -d. -f4`; echo  $cc ; [ $gc != $cc ] && echo ">>>> NOT_matched `date` <<< " && echo ; done ; }

### get version SHA
gOver () {     h=$1; u="http://$h:8080/api/v1/operational/version"; ech2 "GET $u"; curl -s -X GET $u|pjson ; }
gverO () {     h=$1; echo -n " $h: "; curl -s -X GET http://$h:8080/api/v1/operational/version|pjson|gc2 commit ; }
gver () {      h=$1;                  curl -s -X GET http://$h:8080/api/v1/version|pjson|gc2 commit ; }
gver2 () {     h=$1; u="http://$h:8080/api/v1/version"; echo $u; curl -s -X GET $u ; ech2 ; }

verOR () {     for i in `eaN red    core-[a] $4|gipo|a1line`  `eaN red   core 13 $4|gipo|a1line` ; do echo -n "ODP_red_core_$i: "; gverO $i; done; }
verOY () {     for h in `eaN yellow core     $4|gipo|a1line`  `eaN yellow core 13 $4|gipo|a1line`; do echo -n "ODP_yel_core_$h: "; gverO $h; done; }

verog () {     open https://xpcapi-si.xpc.comcast.net/api/v1/version; }
verOG () {     for d in as ch2 ho; do ech2 "Grn odplb $d"; open https://odplb-$d-01.sys.comcast.net/api/v1/version; done; verog ; }

verR () {      d=$1; ech3 "Red N $d"; for i in `ean red    core 24 $d|gipo1`; do grinhi -B1 $i; gver $i ; done ; ech3 "Red N-1 $d"; for i in `ean red core 13 $d|gipo1`; do grinhi -B1 $i; gver $i ; done ; } 
verOr () {     for i in `ean orange core 1234|gipo1`; do                       rver $i ; done ; }
verY () {      d=$1; for i in `ean yellow core 24 $d|gipo1`; do grinhi -B1 $i; gver $i ; done ; } 

# ver hot fix on Red N-1:
verR1 () {     h=$1; h=${h:-$hostR1}; runph  $h "rpm -qa|grep --color xap.*;tail /var/log/yum.log|tail -1|grep --color xap.*;"; now ; }

verg () {      open  https://xpcapi-si.xpc.comcast.net/api/v1/version ; }
verG () {      for d in as ch2 ho; do ech2 "Grn xpclb $d"; open https://xpclb-$d-01.sys.comcast.net/api/v1/version; done; verg ; }

# get ver N, N-1
verN () {      ver24R; verOR ; }
verN1 () {     verY;   verOY ; }
 
vern () {      gver    $hostR ; }
vern1() {      gver    $hostY ; }

varl () {      h=$1; h=${h:-$hostR}; runcor $h     "tail /var/log/yum.log;" ; now ; }			# use /var/log/yum.log
rver () {      h=$1; h=${h:-$hostR}; ech2 $h; runph   $h "rpm -qa | grep -Eio --color xap.* ;" ; } 	# use this `rpm -qa | grep xap`
alias rverY='  rver $hostY'

# get current SHA at N, N-1: [xap]$ git pull && git log -n1; curl http://$hostR:8080/api/v1/version;echo
snn1 () {      sha1  xap ; echo "Code level   N : `vern`"|cred; echo "Code level N-1 : `vern1`"|camber  ; }
snn2 () {      (newxa && snn1 ) | tee -a $HOME/logs/snn.log; cdxa; runh fgitp; runh "cdxtm;fgitp" ; }
snn3 () {      (newxa && snn1 ) | tee -a $HOME/logs/snn.log; ech3 Version; verR; ech3 Service_df_supervisorctl; runh serviceAR; ech3 SNMP_FW_CPE_Red; fwcR; ech3 Celery_Flower; cfR; now; ech3 Sync1_SparkM; s1_sparkm; ech3 Manual_Sync; msy; ech3 XPC_Red_Splunk; os_rx ; }

# use this `rpm -qa | grep xap`
rver () {      h=$1; h=${h:-$hostR}; ech2 $h; runph   $h "rpm -qa | grep -Eio --color xap.* ;" ; }
alias xapR='   runph  $hostR "rpm -qa | grep xap;" '
alias rverY='  rver $hostY'

alias oswag_webpa='open https://swagger.webpa.comcast.net/'

### API
a1c="/api/v1/gateway-configset"
a1m="/api/v1/gateway-cpe"

a1tm="/api/v1/tools/gateway-cpe"
a1im="/api/v1/internal/gateway-cpe"
a1nm="/api/v1/notification/gateway-cpe"
a1sm="/api/v1/sns/gateway-cpe"

a1om="/api/v1/operational/gateway-cpe"
a1oc="/api/v1/operational/gateway-configset"

a2dm="/api/v2/device/mac"
a2o="/api/v2/operational"
a2oc="/api/v2/operational/gateway-configset"
a2om="/api/v2/operational/gateway-cpe"

# Green lb XPC
# open $gho$a1m/$M3/webpa_stat
glb="https://xpcapi-si.xpc.comcast.net"
glb2="https://xpcanalytics.gslb2.comcast.com"

glbas="https://xpclb-as-01.sys.comcast.net"
glbch="https://xpclb-ch2-01.sys.comcast.net"
glbho="https://xpclb-ho-01.sys.comcast.net"
glbwc="https://xpclb-wc-01.sys.comcast.net"

# Green lb ODP
glbo="https://odpapi-si.xpc.comcast.net"

glbe1a="https://odplb-e1a-01.odp.comcast.net"
glbe1b="https://odplb-e1b-01.odp.comcast.net"
glbw2a="https://odplb-w2a-01.odp.comcast.net"
glbw2b="https://odplb-w2b-01.odp.comcast.net"

# Yellow lb XPC ODP
ylb="https://yellow.awsxpc.comcast.net"         
ylbo="https://odpyellowuiorch.odpaws.comcast.net"

#ylbch="https://96.119.225.209"				# xpclb-ch2f-1d-yellow
#ylbch2h="https://96.119.225.209"			# xpclb-ch2h-1d-yellow
#ylbhob="https://96.118.16.138"				# xpclb-hob-1d-yellow
#ylbhoc="https://96.118.244.9" 				# xpclb-hoc-1d-yellow
#ylbwc="https://96.118.165.223"				# xpclb-wcdcc-1d-yellow

ylbch="https://96.119.225.48"                           # xpclb-ch2f-2d-yellow
ylbch2h="https://96.119.225.48"                         # xpclb-ch2h-2d-yellow
ylbhob="https://96.118.16.139"                          # xpclb-hob-2d-yellow
ylbhoc="https://96.118.244.13"                          # xpclb-hoc-2d-yellow
ylbwc="https://96.118.165.124"                          # xpclb-wcdcc-2d-yellow

# Red lb XPC ODP
rlb="https://red.awsxpc.comcast.net"
rlbo="odpreduiorch.odpaws.comcast.net"

rlbas="https://96.118.57.23"          			# xpclb-asb-2d-red
rlbch="https://96.118.146.82"         			# xpclb-ch2h-2d-red
rlbho="https://96.118.27.126"                           # xpclb-hob-2d-red

rlbas1="https://96.118.57.22"                           # xpclb-asb-1d-red
rlbch1="https://96.118.146.57"                          # xpclb-ch2h-1d-red
rlbho1="https://96.118.27.130"                          # xpclb-hob-1d-red

### Webpa
wpa="https://api.webpa.comcast.net:8090"
W2 () {        x=$1; a=$2; open $x/api/v2/device/mac/$m/config ; } # /stat  
# webpa reboot: xpc-4582: https://api.webpa.comcast.net:8090/api/v2/device/mac:5C8FE07EDE92/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_xOpsDeviceMgmt.RPC.RebootPendingNotification 
# then: 2/ tail -f /app/logs/hooks/webserver.log | grep -i reboot; 3//app/logs/hooks/producer.log; 3/kafka:  tail -f /app/logs/kafka/hcpe_events_db.log | grep -i rms ; 

### Green ODP APIs= AO; DO=Direct node ODP API; GO=Green ODP API; 
AO () {        eo=$1;  a="$2"; a=${a:-version};        open $eo/api/v1/operational/$a ; }
DO () {        h=$1; e="http://$h:8080"; a=$2; a=${a:-version}; u="$e/api/v1/operational/$a"; echo $u; open $u ; }
GO2 () {       a="$1"; a=${a:-version};                open $glbo/api/v2/operational/$a ; }
GO () {        a="$1"; a=${a:-version};                open $glbo/api/v1/operational/$a ; }
YO () {        a="$1"; a=${a:-version};                AO   $ylbo                    $a ; }
GOc () {       a="$1"; a=${a:-association};            open $glbo$a1oc/$a ; }
GOm () {       m=$1;   a="$2";                         open $glbo$a1om/$m/$a ;                       echo "association meshagent meshstatus xdns_content_filtering" ; }
GOd () {       m=$1;   a=$2;                           open $glbo$CPEo1/$m/devices/$a ;               echo "identity summary device_management_group_configuration device_management* traffic_data/group_limits/activity traffic_data?start_time= &end_time= " ; } 
GOds  () {     m=$1;                                   open $glbo$CPEo1/$m/devices/summary; }                                 # ods, summary w/ filters : ?start_time= or ?device_type= ?acceleration=false
GOid () {      m=$1;                                   open $glbo$CPEo1/$m/devices/interface_data; }                          # interface_data : i_d/latest i_d/latest?device_mac
GOdmg () {     m=$1;                                   open $glbo$CPEo1/$m/devices/device_management_group_configuration  ; } # dev mgmt conf : set_bedtime delete_bt wakeup 
#GOdmc () {    m=$1;                                   open $glbo$CPEo1/$m/devices/device_management_group_configuration  ; } # dev mgmt      : (state) block allow          
GOddl () {     m=$1; d=$2;                             open $glbo$CPEo1/$m/devices?device_macs=$d ;  } # forget device :
GOddm () {     m=$1; d=$2; a=$3;                       open $glbo$CPEo1/$m/devices/$d/$a ;            echo "summary device_management_configuraN device_management_reconciliation" ; }
GOtmo () {     m=$1; o=$2;                             open $glbo/api/v1/internal/gateway-cpe/$m/tunnel?names=$o ; echo "Device.X_Comcast_com_ParentalControl.ManagedDevices.Device." ; }

### Green XPC APIs=AX; DX=Direct XPC API; GX=Green XPC API;
AX () {        e=$1;                     a=$2; a=${a:-version}; u="$e/api/v1/$a"; echo $u; open $u ; } # version; common/sat; common/sat?source=redis&verbose; tools/...; internal/...; notification/...; gateway-info
verrlb () {    for l in $rlb,rlb $rlbch,rlbch $rlbas,rlbas  $rlbho,rlbho   $rlbwc,rlbwc;   do ech2 $l; AX ${l%,*}; done ; }
verylb () {    for l in $ylb,ylb $ylbch,ylbch $ylbhob,ylbas $ylbhoc,ylbhoc $ylbwc,ylbwc;   do ech2 $l; AX ${l%,*}; done ; }
verglb () {    for l in $glb,glb $glbch,glbch $glbas,glbas  $glbho,glbho   $glbwc,glbwc;   do ech2 $l; AX ${l%,*}; done ; }

DX () {        h=$1; e="http://$h:8080"; a=$2; a=${a:-version}; u="$e/api/v1/$a"; echo $u; open $u ; } 
GX    () {     AX $glb   $1 ; }				# GX; GX version; GX    common/sat; sat?source=redis; =local; =current; =current&verbose;
GX_as () {     AX $glbas $1 ; }				# GX_as;          GX_as common/sat; GX_as tools/gateway-cpe/$M2/ping_internet
GX_ch () {     AX $glbch $1 ; }				#                                   GX_ch internal/gateway-cpe/$M1/cmc_cid;
GX_ho () {     AX $glbho $1 ; }
GX_wc () {     AX $glbwc $1 ; }
GX_dc () {     GX_as $1; GX_ch $1; GX_ho $1; GX_wc $1; GX $1 ; }

GXc () {       c=$1; a=$2; a=${a:-association};       u="$glb$a1c/$c/$a"; echo $u; open $u ; }  # echo "association configuration/ webpa_stat gateways device_class wifi_personalN" 
AXm () {       e=$1; m=$2; a=$3; a=${a:-association}; u="$e$a1m/$m/$a";  echo $u; open $u ; }  # echo "association configuration/ webpa_stat gateways device_class wifi_personalN" 
GXm () {       m=$1; a=$2; AXm  $glb $m $a ; }
Gamh () {      m=$1;       GXm       $m association ; }

GXgic () {     c=$1; a=$2;       u="$glb$a1c/$c/configuration?group_id=$a"; echo $u; open $u ; }  # echo "pw pl ga pf mb wc bm mm pwa pws hw hs ci r2 r5 cd pns pws mc sd sr tr wr" 
AXgi () {      e=$1; m=$2; a=$3; u="$e$a1m/$m/configuration?group_id=$a";  echo $u; open $u ; }  # echo "pw pl ga pf mb wc bm mm pwa pws hw hs ci r2 r5 cd pns pws mc sd sr tr wr" 
GXgI () {      m=$1; a=$2;                       AXgi $glb $m group_$a     ; }		# Gaga=GXgi $M1 all;  Gaca=GXgi $M1 cpe_action; Gapws=GXgi $M1 private_wifi_statistics;
GXgii () {     m=$1; a=$2; inf="_information";   AXgi $glb $m group_$a$inf ; }		# Gaci=GXgii $M1 cpe; Gaaci=GXgii $M1 adv_cpe;  Gacd=GXgii $M1 connected_device;      Gaxwi=GXgii $M1 xfinity_wifi_summary;
GXgi    () {   m=$1; a=$2; con="_configuration"; AXgi $glb $m group_$a$con ; }		# Gawc=GXgi $M1 wan;  Gar2=GXgi $M1 radio_2g;   Gamm=GXgi $M1 moca_mode;              Gahsm=GXgi $M1 home_security_wifi; Gaxw=GXgi $M1 xfinity_wifi
Gapw () {      m=$1; GXgi     $m       private_wifi               ; } 

GXctc () {           c=$1; a=$2; u="$glb$a1c/$c/configuration_table/$a"; echo $u; open $u ; echo "pf mb" ; }
AXct () {      e=$1; m=$2; a=$3; u="$e$a1m/$m/configuration_table/$a";  echo $u; open $u ; echo "pf mb" ; } 
Gmpf () {      m=$1; AXct $glb $m portforwarding_configuration ; }
Gmmb () {      m=$1; AXct $glb $m mac_address_binding_configuration ; }
# celery test: for all asynchronous calls like apply_and_associate; http://96.118.147.40:8080/docs/#!/celery/Xpc_Celery_Task_Test_POST
cPcelery () { h=${1:-$hostR}; u="http://$h:8080/api/celery/celery_task_test"; b=${2:-b_empty.json}; ech2 $b; echo y|bjp $b && cP $u ; } # b_empty.json
# need some authorization: flower_header_auth: cGcelerytask () { h=$1; t=$2; u="http://$h:5555/task/$t"; cG $u ; }

# sync API: syncsidcmc == cmc_cid... using Internal API: ia1m
cPpi () {     m=$1; h=$2; u="http://$h:8080/api/v1/tools/gateway-cpe/$m/ping_internet";  ech2 "POST $u"; curl -s -X POST $u -H 'content-type: application/json'       |cpink ; echo ; }
asn () {      m=$1; h=$2; u="http://$h:8080/api/v1/tools/gateway-cpe/$m/syncnow";        ech2 "POST $u"; curl -s -X POST $u -H 'content-type: application/json' |pjson|cpink ; echo ; }
acc () {      m=$1; h=$2; u="http://$h:8080/api/v1/internal/gateway-cpe/$m/cmc_cid";     ech2 "GET  $u"; curl -s -X GET  $u |pjson|ccyan ; }
asc () {      m=$1; h=$2; u="http://$h:8080/api/v1/internal/gateway-cpe/$m/synccsidcmc"; ech2 "GET  $u"; curl -s -X GET  $u |pjson|ccyan ; }
asi () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/sync_info";                         ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }

# rules pf + mb, configuration_table
mpf () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration_table/portforwarding_configuration_table";       ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
mmb () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration_table/mac_address_binding_configuration_table";  ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
cpf () {      c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration_table/portforwarding_configuration_table";        ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
cmb () {      c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration_table/mac_address_binding_configuration_table";   ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }

ainP () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/initialization"; ech2 "POST $u"; curl -s -X POST $u |pjson|cpink ; }
cPin () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/initialization"; b=${3:-b_empty.json}; ech2 $b; echo y|bjp $b && cP $u ; } # b_empty.json

#syncnotification: run once, copy the cid, put in the body for 2nd run: https://96.118.57.13:8080/api/v1/notification/gateway-cpe/044E5A9AE8EC/syncnotification
cPsyno () {   m=$1; h=$2; u="http://$h:8080/api/v1/notification/gateway-cpe/$m/syncnotification"; ech2 "NOTE: 1/empty body OR 2/Onb + Run twice + Need right CID in b_cmccid.json"; b=${3:-b_empty.json}; ech2 $b; bjp $b && cP $u ; } # b_empty.json

aws () {      m=$1; h=$2; h=${h:-$hostR}; u="http://$h:8080$a1m/$m/webpa_stat"; ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }      
adc () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/device_class";               ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }   
agw () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/gateways";                   ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }      
agd () {      m=$1; h=${2:-$hostR}; u="http://$h:8080$a1m/$m/gateway_default_cpe_setting";ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }      
awp () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/wifi_personalization";       ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }      

# configuration?group_id=
aco0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration";                                             ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
aco () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration";                                             ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }

aca () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_cpe_action";                   ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
cPca () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_cpe_action";                   b=${3:-b_acaEnable_cloudui.json}; ech2 $b; bjp $b && cP $u; date ; } # b_acaEnable_cloudui.json
FacRes () {   m=$1; h=$2; cd; cPca $m $h b_acaFactoryReset.json ; }
cDca () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_cpe_action";                   cD $u ; }

aga0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_all";                          ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
aga () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_all";                          ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
aga2 () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_all&refresh";                  ech2 "GET $u"; curl -s -X GET $u |pjson|cred  ; }

aci0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_cpe_information";              ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
aci () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_cpe_information";              ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
aci2 () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_cpe_information&refresh";      ech2 "GET $u"; curl -s -X GET $u |pjson|cred  ; }

aaci () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_adv_cpe_information";             ech2 "GET  $u"; curl -s -X GET $u |pjson|cblue ; }
axwi () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_xfinity_wifi_summary_information";ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }

axw () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_xfinity_wifi_configuration";      ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }
cPxw () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_xfinity_wifi_configuration";      b=${3:-b_xfiWifi.json}; ech2 $b; bjp $b && cP $u ; } # b_xfiWifi.json

agt () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_gre_tunnel_configuration";        ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }
cPgt () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_gre_tunnel_configuration";        b=${3:-b_greTunnel.json}; ech2 $b; bjp $b && cP $u ; } # b_greTunnel.json

acidef () {   m=$1; h=$2; u="http://$h:8080$a1m/$m/gateway_default_cpe_setting";                                  ech2 "GET $u"; curl -s -X GET $u |pjson|cgreen ; }

acd () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_connected_device_information";    ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
acd2 () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_connected_device_information&refresh";        ech2 "GET $u"; curl -s -X GET $u |pjson|cred  ; }

abm0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_bridge_mode_configuration";       ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
abm () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_bridge_mode_configuration";       ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
wp_bm () {    m=$1; o="Device.X_CISCO_COM_DeviceControl.LanManagementEntry.1.LanMode";                            wp_  $m   $o ; }
cPbm () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_bridge_mode_configuration";       b=${3:-b_bridgeF.json}; ech2 $b; echo y|bjp $b && cP $u ; } # b_bridgeF.json

apns () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_network_ethernet_statistics";         ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }

ahsm2 () {    m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_home_security_wifi_configuration&refresh";    ech2 "GET $u"; curl -s -X GET $u |pjson|cred  ; }
ahsm () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_home_security_wifi_configuration";            ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
ahsc () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_home_security_wifi_configuration";             ech2 "GET $u"; curl -s -X GET $u |pjson|cpink ; }
cPhsc () {    c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_home_security_wifi_configuration";  b=${3:-b_hs.json}; ech2 $b; bjp $b && cP $u ; } # b_hs.json
cPhs () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_home_security_wifi_configuration"; b=${3:-b_hs.json}; ech2 $b; bjp $b && cP $u ; } # b_hs.json  


ahwm () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_home_wifi_hotspot_configuration";  ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
cPhw () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_home_wifi_hotspot_configuration";  b=${3:-b_hotspotT.json}; ech2 $b; bjp $b && cP $u ; } # b_hotspotT.json
cDhw () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_home_wifi_hotspot_configuration";  cD $u ; }

apws () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_wifi_statistics";                     ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
apwa () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_wifi_advanced_configuration";         ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
apwa2 () {    m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_wifi_advanced_configuration&refresh"; ech2 "GET $u"; curl -s -X GET $u |pjson|cred  ; }

apw0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_private_wifi_configuration";   ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }
apw () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_wifi_configuration";   ech2 "GET  $u"; curl -s -X GET  $u |pjson|cblue ; }
cPpw () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_wifi_configuration";   cP $u ; } # b_pw.json
cPpwc () {    c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_private_wifi_configuration";   cP $u ; } # b_pw.json
cDpw () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_wifi_configuration";   cD $u ; }

amc0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_mesh_configuration";           ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
amc  () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_mesh_configuration";           ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }

apl0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_private_lan_configuration";    ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
apl () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_lan_configuration";    ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
cPpl () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_lan_configuration";    b=${3:-b_pl.json}; ech2 $b; bjp $b && cP $u ; } # b_pl.json
cDpl () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_lan_configuration";    cD $u ; }


ar20 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_radio_2g_configuration";       ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
ar2 () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_radio_2g_configuration";       ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
cPr2 () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_radio_2g_configuration";       cP $u ; }

ar50 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_radio_5g_configuration";       ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
ar5 () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_radio_5g_configuration";       ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
cPr5 () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_radio_5g_configuration";       cP $u ; }


amm0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_moca_mode_configuration";      ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
amm () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_moca_mode_configuration";      ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
cPmm () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_moca_mode_configuration";      b=${3:-b_mocaT.json}; ech2 $b; bjp $b && cP $u ; } # b_mocaT.json

awc0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_wan_configuration";            ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
awc () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_wan_configuration";            ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
awc2 () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_wan_configuration&refresh";    ech2 "GET $u"; curl -s -X GET $u |pjson|cred  ; }

apf0 () {     c=$1; h=$2; u="http://$h:8080$a1c/$c/configuration?group_id=group_port_forwarding_configuration";ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
apf () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_port_forwarding_configuration";ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }

#asd () {     m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_ssid_scan_data";               ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }

asr () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_network_devices_status_report_configuration"; ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
atr () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_network_devices_traffic_report_configuration";ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }
awr () {      m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_interface_devices_wifi_report_configuration"; ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; }

# 17 groups = 2 group_cpe +  15 group_*_configuration (= 2radio +2mode +1gre +3report +1privLan +2privWifi +1homeSec +1XfiWifi +1wan +1portFwd); For Wifi: 2priv +1lan +1xfi +1report; 
#group_bridge_mode_configuration 
#group_cpe_action 
#group_cpe_information 
#group_gre_tunnel_configuration 
#group_home_security_wifi_configuration 
#group_interface_devices_wifi_report_configuration 
#group_moca_mode_configuration 
#group_network_devices_status_report_configuration 
#group_network_devices_traffic_report_configuration 
#group_port_forwarding_configuration 
#group_private_lan_configuration 
#group_private_wifi_advanced_configuration 
#group_private_wifi_configuration 
#group_radio_2g_configuration 
#group_radio_5g_configuration 
#group_wan_configuration 
#group_xfinity_wifi_configuration

# 9 core grps, 23-16 all 23 paths/XPC api shortcuts: run in 16 secs $ i
coregrps="apw apl ar2 ar5 aci ahsm mpf awc"
aall () {     now; for a in apw apl ar2 ar5 aci ahsm mpf awc   aga mmb abm amm apwa apws ahwm aaci acd apns apws amc  asr atr awr; do echo $a; $a $M2 $hostR; done ; } 

### ODP v1 APIs: oa1m
DHL="5440ADE5515E"; DST="B0DF3A0BF1F6"; DM1="111111111111"
odi () {      m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/identity"                ; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }
ods () {      m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/summary"                 ; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }

oxd () {      m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/xdns_content_filtering"          ; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }
cPxd () {     m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/xdns_content_filtering"          ; cP $u ; } # b_xdnsT.json
cDxd () {     m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/xdns_content_filtering"          ; cD $u ; }

odl () {      m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/xdns_content_filtering"  ; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }
cPdl () {     m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/xdns_content_filtering"  ; cP $u ; } # b_devLevel.json
cDdl () {     m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/xdns_content_filtering"  ; cD $u ; }

# Plume mesh
oma () {      m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/meshagent"                       ; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }
oms () {      m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/meshstatus"                      ; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }
cPma () {     m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/meshagent"                       ; cP $u ; } # b_meshagentT.json
cDma () {     m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/meshagent"                       ; cD $u ; }

# Cujo fingerprint
# curl -H "Content-Type: application/json" -X POST -d '{"enabled": true}' https://96.115.78.225/api/v1/operational/gateway-cpe/ACB3130356A2/fingerprint_agent
ofa () {      m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/fingerprint_agent"               ; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }
cPfa () {     m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/fingerprint_agent"               ; b=${3:-b_fprintT.json}; ech2 $b; bjp $b && cP $u ; } # b_fprintT.json


dm_db () {    m=$1; h=$2; me=$3; me=${me:-GET}; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/device_management"  ; ech2 "GET  $u"; curl -s -X $me  $u | pjson ; }
odsdm () {    m=$1; h=$2; d=$3; d=${d:-$DM1}; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/device_mac/$d/summary"; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }

dm_cpe () {   m=$1;                curl -s -X GET   http://api.webpa.comcast.net:8090/api/v2/device/mac:$m/config?names=Device.X_Comcast_com_ParentalControl.ManagedDevices.Device.  ; }

### bedtime group and single rule:
ogbt () {     m=$1; h=$2;                     u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/device_management_group_configuration";    ech2 "GET  $u"; curl -s -X GET   $u     |pjson|cpink ; }
cPgbt () {    m=$1; h=$2;                     u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/device_management_group_configuration";    cP $u ; } # b_setgbt.json
cDgbt () {    m=$1; h=$2;                     u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/device_management_group_configuration";    cD $u ; }

obt () {      m=$1; h=$2; d=$3; d=${d:-$DM1}; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/$d/device_management_configuration";       ech2 "GET  $u"; curl -s -X GET   $u     |pjson|cpink ; }
cPbt () {     m=$1; h=$2; d=$3; d=${d:-$DM1}; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/$d/device_management_configuration";       b=${3:-b_bt_set.json}; ech2 $b; bjp $b && cP $u ; } # b_bt_set.json
cDbt () {     m=$1; h=$2; d=$3; d=${d:-$DM1}; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/$d/device_management_configuration";       cD $u ; }

# traffic
otg () {      m=$1; h=$2;                     u="http://$h:8080/api/v1/operational/gateway-cpe/$m/traffic_data/group_limits"            ; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }
otgi () {     m=$1; h=$2; i=$3;               u="http://$h:8080/api/v1/operational/gateway-cpe/$m/traffic_data/group_limits/$i"         ; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }
otga () {     m=$1; h=$2; i=$3;               u="http://$h:8080/api/v1/operational/gateway-cpe/$m/traffic_data/group_limits/$i/activity"; ech2 "GET  $u"; curl -s -X GET  $u -H 'content-type: application/json' |pjson|cpink ; }

cPtg () {     m=$1; h=$2;                     u="http://$h:8080/api/v1/operational/gateway-cpe/$m/traffic_data/group_limits"            ; b=${3:-b_traf_grpLim.json}; ech2 $b; bjp $b && cP $u ; } # b_traf_grpLim.json

# odp> SELECT * FROM odp.device_traffic_limit_groups where cpe_mac='044E5A9AE8EC' ;
# GET  https://odpredapi.odpaws.comcast.net/api/v1/operational/gateway-cpe/044E5A9AE8EC/devices/traffic_data/group_limits ; /10b1514f-b7c5-4731-8f1b-f65894c722df; /activity;
# POST https://odpyellowuiorch.odpaws.comcast.net/api/v1/operational/gateway-cpe/044E5A9AE8EC/devices/traffic_data/group_limits ; /group_id;


### Get Post Env: use $M2, onb first: bmh $M2 $hostR; gp_R
gp_Q () {     m=$1; m=${m:-$M2}; h=$2; echo $h; u="http://$h:8080/api/v1/gateway-cpe/$m/configuration?group_id=group_private_wifi_configuration"; echo $u; curl -X GET $u -H 'content-type: application/json' |pjson    ;   curl -X POST $u  -H 'content-type: application/json'  -d '{ "wifi_passphrase_2g": "2gtestssidQUICK" }' |pjson  ; }
gp_R () {     m=$1; m=${m:-$M2}; gp_Q $m $hostR ; }
gp_Y () {     m=$1; m=${m:-$M2}; gp_Q $m $hostY ; }

# POST only  aca 
# GET  only  aci apws awr  awc  asr atr apne
### GET_POST $M $hostE:
gp_abm () {   m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_bridge_mode_configuration";        ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "bridge_mode_enabled": false} ' |pjson ; }
gp_amm () {   m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_moca_mode_configuration";          ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "moca_enabled":true} '          |pjson ; }
gp_apl () {   m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_lan_configuration";        ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "ip_address": "192.168.1.1", "netmask": "255.255.255.0" } ' |pjson ; }
#gp_apwa () { m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_wifi_advanced_configuration";         ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "wifi_passphrase_2g": "Password1_gp_apwa" }' |pjson ; }
gp_apw () {   m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_private_wifi_configuration";       ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "wifi_passphrase_2g": "Password1_gp_apw" }' |pjson ; }

gp_ar2 () {   m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_radio_2g_configuration";           ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "radio_enabled": true, "channel": 2 }'     |pjson ; }
gp_ar5 () {   m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_radio_5g_configuration";           ech2 "GET $u"; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "radio_enabled": true, "channel": -1 }'    |pjson ; }

gp_ahsm () {  m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_home_security_wifi_configuration"; ech2 "GET $u"; curl -s -X GET $u |pjson|cblue; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "wifi_passphrase_2g": "Password1_gp" }' |pjson ; }
gp_apf () {   m=$1; h=$2; u="http://$h:8080$a1m/$m/configuration?group_id=group_port_forwarding_configuration";    ech2 "GET $u"; curl -s -X GET $u |pjson|cblue; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "portforward_enabled": false }'         |pjson ; }

# List, pick or vi b.json
bjll () {             cd; ls     b*json ; }
bjl () {      f=$1;   cd; ls -tr b*json;     ech2 "The json= $f"; python -m json.tool ${1:-b.json} ; }
bjp () {      f=$1;   cd; cp -f $1 b.json;   ech2 "b.json=";      python -m json.tool b.json       ; } 
bjv () {      f=$1;   f=${f:-$HOME/b.json};  ech2 "The json= $f"; vi     $f ; }
bjs () {      p="$*"; f=$HOME/b*.json;       grep -i $p $f ; }

### CURL
cDel () {     u="$1";       ech2 "DELETE $u";                curl -s -X DELETE $u -H "Content-Type: application/json"             | pjson | cred ; }
cPat  () {    u="$1";       ech2 "PATCH  $u";cd; cat b.json; curl -s -X PATCH  $u -H "Content-Type: application/json"  -d @b.json | pjson | cpink ; }
cPut  () {    u="$1";       ech2 "PUT    $u";cd; cat b.json; curl -s -X PUT    $u -H "Content-Type: application/json"  -d @b.json | pjson | cgreen ; }

cPost () {    u="$1"; j=$2; ech2 "POST   $u";  ech2 $j;      curl -s -X POST   $u -H "Content-Type: application/json" --data '$j' | pjson | cblue ; }
cP () {       u="$1";       ech2 "POST   $u";cd; cat b.json; curl -s -X POST   $u -H "Content-Type: application/json"  -d @b.json | pjson | cblue ; }

# DELETE, rePOST, GET, forget, then re GET
cPutpf () {   m=$1; h=$2; u="http://$h:8080/api/v1/gateway-cpe/$m/configuration_table/portforwarding_configuration_table";        cPut $u ; } # b_pfrule.json
cDpf () {     m=$1; h=$2; u="http://$h:8080/api/v1/gateway-cpe/$m/configuration_table/portforwarding_configuration_table";        cDel $u ; }
cDmb () {     m=$1; h=$2; u="http://$h:8080/api/v1/gateway-cpe/$m/configuration_table/mac_address_binding_configuration_table";   cDel $u ; }

cPpf () {     m=$1; h=$2; u="http://$h:8080/api/v1/gateway-cpe/$m/configuration_table/portforwarding_configuration_table";      cP $u ; } # b_pfrule.json
cPmb () {     m=$1; h=$2; u="http://$h:8080/api/v1/gateway-cpe/$m/configuration_table/mac_address_binding_configuration_table"; cP $u ; } # b_mbrule.json

# XPC api forget...related webpa log traces of Device.NAT.PortMapping
cPforget () { m=$1; h=$2; u="http://$h:8080/api/v1/internal/gateway-cpe/$m/configuration_table/forget_devices";                 cP $u ; } # b_forget*.json

# ODP api forget ... DELETE http://{{host}}/api/v1/operational/gateway-cpe/{{CPEMAC2}}/devices?device_macs=D4BED919A337
cDforget () { m=$1; h=$2; d=$3; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices?device_macs=$d";                    cDel $u ; }

# ODP Delete all device mgmt entries (+rules)
cDdm () {     m=$1; h=$2;       u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/device_management";                 cDel $u ; }
cGdm () {     m=$1; h=$2;       u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/device_management";                 cG $u ; }

### CURL GET again to verify $mpf $M2 $hostOR; mmb ....
cG () {       u="$1"; ech2 "GET $u"; curl -s -X GET $u -H "Content-Type: application/json" | pjson | ccyan ; }

cGver () {    h=$1;       u="http://$h:8080/api/v1/version";                cG $u ; }
cGcpe () {    m=$1; h=$2; u="http://$h:8080/api/v1/gateway-cpe/$m";         cG $u ; }
cGcsid () {   c=$1; h=$2; u="http://$h:8080/api/v1/gateway-configset/$c";   cG $u ; }
# learn info of csid: csid2cpemac csidif () {   c=$1; h=$2; cGcsid $c $h ; }

### check smkt sync failed at 1_SparkMaster + 2_Hook + 3_Kafka + (assumed OK at 4_WebPA + 5_RDKB)
#s1_Sparkm () { c=$1; c=${c:-red}; ech2 $c; cxi_ $c |grep -A4 sprkm-|egrep -ni "is_active|sprkm-|ip|ch2f|hob|asb|wcdcc" ; ech2 "Verify spark master sync... active true and false" ; ech2 "@@@ get ip ... to run ow8 next" ; }
#s1_sprkm () {  c=$1; c=${c:-red}; s=`ean $c sprkm 1234|gipo|a1line`; for i in $s; do line;ech2 $i; ow8 $i; done ; }
ow8 () {       i=$1; u="http://$i:8080"; ech2 "verify spark master sync...$u... state: S/B Running, on app id"; opes $u; curl -is $u|egrep -i "runn|waiting" ; }

lsmR="96.118.144.128 96.118.144.53 96.118.253.126 96.118.253.136"
lsmY="96.118.159.183 96.118.159.179 96.118.244.21 96.118.244.22"
s1_sparkm () { l=${1:-$lsmR}; for i in $l; do line; hnco $i; ow8 $i; done ; }

# sync at 2_Hook
hkWeb="/app/logs/hooks/webserver.log"
hkPrd="/app/logs/hooks/producer.log"
hkXpc="/app/logs/hooks/xpc.log"
lhkR="96.118.57.20    96.118.57.21   96.118.27.122  96.118.27.121"
lhkA="96.119.227.248  96.119.227.25                                96.118.23.67  96.118.23.68"
lhkY="96.119.226.171  96.119.226.176 96.118.167.88  96.118.167.89  96.118.16.136 96.118.16.137"

#sshc $lsyR
#lsyR="96.118.57.14    96.118.57.15   96.118.57.16   96.118.57.17   96.118.27.240  96.118.27.245  96.118.27.246  96.118.30.92"
#lsyA="96.119.226.201  96.119.227.230 96.119.226.202 96.119.227.233                               96.118.23.64   96.118.23.65  96.118.23.61  96.118.31.1"
#lsyY="96.119.231.173  96.119.231.171 96.119.224.61  96.119.228.8   96.118.166.129 96.118.166.130 96.118.172.89  96.118.185.22  96.118.18.203 96.118.18.204 96.118.18.205"
#sshsyR () {   sshcor   96.118.57.14   ; }; sshsyY () {   sshcor   96.119.231.173 ; }
#ssyR () {     csshx -l root $lsyR ; }; ssyA () {     csshx -l root $lsyA ; }; ssyY () {     csshx -l root $lsyY ; }
#sshhkR () {   sshcor   96.118.57.20   ; };  sshhkY () {   sshcor   96.119.226.171 ; }
#shkR () {     sshc $lhkR ; }; shkA () {     sshc $lhkA ; }; shkY () {     sshc $lhkY ; }
#sshchk () {   hks=$*; sshc $hks ; }
#s2_hk () {    e=$1; e=${e:-red}; cxi $e |  egrep -A1 xpchook ; }

alias cdhk='  cd      /app/logs/hooks'
alias tlwp='  cdhook; tail -f webserver.log  producer.log '

# sync at 3_Kafka , server named as "xpcque" and related "xpczoo"
# to check messages in kafka: cd /app/kafka/bin; ./kafka-console-consumer.sh --zookeeper 96.118.188.122:2181 --topic hCPE_Events
s3_k () {     e=$1; e=${e:-red}; cxi $e | gx "que|zoo" ; }
alias cdkcons='cd     /app/logs/consumer'
alias cdkxpcl='cd     /app/logs/xpclog'

lkkR="96.118.57.88   96.118.57.89   96.118.57.9    96.118.27.145  96.118.27.149  96.118.27.152"
lkkA="96.119.230.15  96.119.230.151 96.119.230.152 96.118.23.82   96.118.23.80"
lkkY="96.119.226.122 96.119.226.132 96.119.226.161 96.118.167.103 96.118.167.104 96.118.167.105 96.118.16.147 96.118.16.148 96.118.16.149"

# sync at 4_SparkWorker
lswR="96.118.57.26   96.118.57.27   96.118.57.28   96.118.57.29   96.118.27.237  96.118.27.234  96.118.27.235  96.118.30.78"
lswA="96.119.227.240 96.119.227.243 96.119.228.38  96.118.23.60   96.118.23.59   96.118.23.6"
lswY="96.119.226.63  96.119.226.64  96.119.229.91  96.118.167.61  96.118.167.62  96.118.167.63  96.118.18.200  96.118.18.201  96.118.18.202"

### Redis nodes
# log into a xpcredis or odpredis- node; ls /app/redis/; export PATH=$PATH:/app/redis/bin ; /app/redis/bin/redis-cli keys "sat*" ; /app/redis/bin/redis-cli get sat_token_yyyymm..
# find an odpcore node, sshcorh in; run curl on api get resdis sat-token $curSat 
# $ ipc red; #get a core host; then $ curSat 96.118.57.11
# alternately, can get sat-token from sat-server, thru webpa api, line in script get_fwcpe_thru_webpa.py
# ex: for i in $licR; do line; echo $i; runcor $i curl -s localhost:8080/api/v1/common/sat?source=current ; line; done

sat () {       open    https://red.awsxpc.comcast.net/api/v1/common/sat ; }
curSat () {    eh=$1;  runcore $eh  curl -s localhost:8080/api/v1/common/sat?source=current         \| python -m json.tool ; }

### Remedial step: re-create sat-token (if found that it is expired, not refreshed, or invalid) from source CodeBig2
remSat () {    eh=$1; runcore $eh  curl -s localhost:8080/api/v1/common/sat                        \| python -m json.tool ; }

# @core: cdredis-cli  /app/redis/bin/redis-cli
# $ ipr red ; #get a "redis-" host: ex: 96.118.25.55; then $ rcli 96.118.25.55 keys sat*; then $ rcli 96.118.25.55 get  sat_token_2     01704061800
rcli () {      rh=$1; c2=$2; c3=$3; c4=$4; c5=$5; c6=$6; runcor $rh "/app/redis/bin/redis-cli  $c2 $c3 $c4 $c5 $c6;"  ; }

### SNS endpoints: sa1m to notif per changes within CPE. egrep "event|_change"; using /api/v1/sns/gateway-cpe/$m/notifications
#sns1. SSID Change 
#sns2. PWD change 
#sns3. SSID Hide/Unhide 
#sns4. Security change to Open 
#sns5. Lan IP change 
#sns6. FW upgraded 
#sns7. New device connected
RED_HTTP_ENDPOINT="http://ec2-54-213-77-81.us-west-2.compute.amazonaws.com/api/v1/sns/subscribe"
AMBER_HTTP_ENDPOINT="http://ec2-54-186-182-99.us-west-2.compute.amazonaws.com/api/v1/sns/subscribe"
YELLOW_HTTP_ENDPOINT="http://ec2-54-244-5-162.us-west-2.compute.amazonaws.com/api/v1/sns/subscribe"
PURPLE_HTTP_ENDPOINT="http://ec2-54-201-81-78.us-west-2.compute.amazonaws.com//api/v1/sns/subscribe"
RED_SNS_ENDPOINT="http://ec2-54-213-77-81.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/044E5A9AE8EC/notifications"
snsR_endp () { m=$1; $2 $3 http://ec2-54-213-77-81.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/$m/notifications; now  ; }
snsA_endp () { m=$1; $2 $3 http://ec2-54-186-182-99.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/$m/notifications; now  ; }
snsY_endp () { m=$1; $2 $3 http://ec2-54-244-5-162.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/$m/notifications; now  ; }
gsns () {       egrep -i "event|_change" ; }

snsR () {      m=$1; m=${m:-$M2}; snsR_endp $m  open ; }
snsA () {      m=$1; m=${m:-$M2}; snsA_endp $m  open ; }
snsY () {      m=$1; m=${m:-$M2}; snsY_endp $m  open ; }
snsYc () {     m=$1; m=${m:-$M2}; snsY_endp $m  curl -s | pjson | gsns ; }

# POST body { "is_whitelisted": true } ; GET http://ec2-54-213-77-81.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/F8A097EF091F/whitelist
cPwl () {      m=$1; b=${2:-b_whitelist.json}; ech2 $b; echo y|bjp $b && cP http://ec2-54-213-77-81.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/$m/whitelist ; } # b_whitelist.json
cGwl () {      m=$1; cG http://ec2-54-213-77-81.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/$m/whitelist ; }
 
#### Graphana: URL:http://96.119.229.177:8080/dashboard/db/qa-metrics-red; u:p=admin:root12345
alias ographana=' echo "URL:http://96.119.229.177:8080/dashboard/db/qa-metrics-red; u:p=admin:root12345"; open http://96.119.229.177:8080/dashboard/db/qa-metrics-red '

### LB, SparkM nodes, checks out of mem:  df -h; uptime; top; [db] nodetool status [db} service dse status;
# Check red app=( core, db, cworker, sprkm, lb, proxy, hook, redis )  
supn () {      e=${1:-red}; a=$2; l=$3; for i in `ean $e $a $l $4|gc2 ip|a1line`   ; do ech2 "===== $i:"; run    $i "supervisorctl status all;" ; done ; }

#dfn () {      e=$1; a=$2; l=$3; for i in `ean $e $a $l|gc2 ip|a1line`   ; do ech2 "===== $i:"; runcor $i "df;uptime;" ; done ; }
dfn () {       e=${1:-red}; a=$2; l=$3; for i in `ean $e $a $l $4|gc2 ip|a1line`   ; do ech2 "===== $i:"; run    $i "df;uptime;supervisorctl status all;" ; done ; }
dfN () {       e=${1:-red}; a=$2; l=$3; for i in `eaN $e $a $l $4|gc2 ip|a1line`   ; do ech2 "===== $i:"; run    $i "df;uptime;" ; done ; }

dfnph () {     e=${1:-red}; a=$2; l=$3; for i in `ean $e $a $l $4|gc2 ip|a1line`   ; do ech2 "===== $i:"; runph  $i "df;uptime;" ; done ; }
dfNph () {     e=${1:-red}; a=$2; l=$3; for i in `eaN $e $a $l $4|gc2 ip|a1line`   ; do ech2 "===== $i:"; runph  $i "df;uptime;" ; done ; }

dbn () {       e=${1:-red}; for i in `ean $e db 1234 $4|gc2 ip|a1line` ; do ech2 "===== $i:"; run    $i "service dse status;nodetool status;" ; done ; }
dbN () {       e=${1:-red}; for i in `eaN $e db 1234 $4|gc2 ip|a1line` ; do ech2 "===== $i:"; run    $i "service dse status;nodetool status;" ; done ; }

### DB cassandra cql_u:p=cassandra:cassandra    cassandra:c@ss@n6R@    xpcuser:ye!!eNV     odpuser2:Y3LLeNV # DB debugging: use nodetool
dbnode () {    n=$1; n=${n:-$dbR}; run    $n   "nodetool status;" ; }
dblogrm () {   n=$1;               runcor $n   "rm -f /app/db/commitlog/*.log; du -sh; df -h;"  ; }

alias cq='     echo "cqlsh \$(facter ipaddress) -u cassandra -p cassandra --ssl -e " ; echo '
alias cqlRef=' open https://docs.datastax.com/en/dse/5.1/cql/cql/cql_reference/cql_commands/cqlCommandsTOC.html'

### Grep field name in DB table
gft  () {      egrep -i "$1" $2 $3 $4 $HOME/Help/cassandra_db/table*.txt ; }
gftx () {      egrep -i "$1" $2 $3 $4 $HOME/Help/cassandra_db/tablexpc.txt ; }
gfto () {      egrep -i "$1" $2 $3 $4 $HOME/Help/cassandra_db/tableodp.txt ; }

# grep a field name within json response
gfj () {       cdsts; egrep -rin "$1" $2 $3 $4 expected_json_response/* ; cd; bjs $* ; }

### Find file in repos
fin  () {      f=$1; find ./ -name *$f* ; }
finxa () {     cdxa; fin   $1 ; }
finxt () {     cdxt; fin   $1 ; }

### Grep trings in repos
grin  () {     egrep -rin "$1" $2 $3 $4 $5 $6 $7 $8 $9 * ; }
grinxa  () {   cdxa; grin  $*  ; }
grinxt  () {   cdxt; grin  $*  ; }

grind () {     cd ~/Documents/si; egrep -rin "$*" * ; pdfgrep -rin  auto $1 * ; }
grinsp () {    cdsplunk         ; egrep -rin "$*" * ; }
grinhi () {    egrep -rih "$1" $2 $3 $4  $HOME/checkouts/p*/hiera/* ; }

### Vi setting in code repos : ~/checkouts/xap/src/settings/odp_settings.py
alias visettings=' vi      ~/checkouts/xap/src/settings/xpc_settings.py'

### Grep code/pattern/flags:  
# Grep flag XPC
gfX () {       e=${1:-red}; f=$2; l=$3; l=${l:-1234}; d=$4; for i in `ean $e core $l $d|gipo|a1line`; do echo $i; run    $i "grep -rin $f /app/xpc/*;"           ; done ; }
gfx () {       e=${1:-red}; f=$2; l=$3; l=${l:-1234}; d=$4; for i in `ean $e core $l $d|gipo|a1line`; do echo $i; run    $i "grep -rin $f /app/xpc/*;" | grep "="; done ; }
gfxph () {     e=${1:-red}; f=$2; l=$3; l=${l:-1234}; d=$4; for i in `ean $e core $l $d|gipo|a1line`; do echo $i; runph  $i "grep -rin $f /app/xpc/*;" | grep "="; done ; }

gfxph1 () {    h=$1; f=$2; runph  $h "grep -rin $f /app/xpc/*;" ; }
gfx1 () {      h=$1; f=$2; run    $h "grep -rin $f /app/xpc/*;" ; }
gfxR () {      gfx1 $hostR   "$*" ; } 
gfxR1 () {     gfx1 $hostR1  "$*" ; } 
gfxY () {      gfx1 $hostY   "$*" ; } 

# Grep flag ODP
gfo () {       e=${1:-red}; f=$2; l=$3; l=${l:-1234}; for i in `eaN $e core $l $4|gipo|a1line`; do echo $i; run    $i "grep -rin $f /app/xap/*;" | grep "="; done ; }       
gfoph () {     e=${1:-red}; f=$2; l=$3; l=${l:-1234}; for i in `eaN $e core $l $4|gipo|a1line`; do echo $i; runph  $i "grep -rin $f /app/xap/*;" | grep "="; done ; }       

gfoph1 () {    h=$1; f=$2; runph  $h "grep -rin $f /app/xap/*;" ; }
gfo1 () {      h=$1; f=$2; run    $h "grep -rin $f /app/xap/*;" ; }
gfoR () {      gfo1 $hostOR   "$*" ; }
gfoR1 () {     gfo1 $hostOR1  "$*" ; }
gfoY () {      gfo1 $hostOY   "$*" ; }

### Grep code or configuration on server ip, pattern/flags:  gconf $hostR ODP_DB_CALL_OPTIMIZATION_ENABLED
gco () {       h=$1; h=${h:-$hostOR}; run    $h  "egrep -rin '$2 $3 $4 $5 $6 $7 $8 $9'  /app/xap/*;" ; }
gcoph () {     h=$1; h=${h:-$hostOR}; runph  $h  "egrep -rin '$2 $3 $4 $5 $6 $7 $8 $9'  /app/xap/*;" ; }

gcx () {       h=$1; h=${h:-$hostR};  run    $h  "egrep -rin '$2 $3 $4 $5 $6 $7 $8 $9'  /app/xpc/*;" ; }
gcxph () {     h=$1; h=${h:-$hostR};  runph  $h  "egrep -rin '$2 $3 $4 $5 $6 $7 $8 $9'  /app/xpc/*;" ; }

# grep log XPC+ODP ;  cd at an env host AXPC="/app/logs/api/xpc.log"; /app/logs/api/uwsgi_xpc.log;
glog () {      h=$1; h=${h:-$hostR};  run    $h  "egrep -rin '$2 $3 $4 $5 $6 $7 $8 $9'  /app/logs/*;" ; }

glx   () {     m=$1; h=$2; run    $h  grep --color -i $m /app/logs/api/xpc.log ; }
tlx   () {           h=$1; run    $h  tail -n100 -f      /app/logs/api/xpc.log ; }
glxph () {     m=$1; h=$2; runph  $h  grep --color -iE "\$m\|500\|\^E " /app/logs/api/xpc.log ; }
tlxph () {           h=$1; runph  $h  tail -n100 -f      /app/logs/api/xpc.log ; }

### Grep SmokeTest hightlights for Fail, Error, Passed, eXception
gst () {       grep -iEo "............................$1........................................................................" ; }
gstf () {      msg=$1; echo $msg && runh "conv|gst fail"      ;  }
gste () {      msg=$1; echo $msg && runh "conv|gst error"     ;  }
gstx () {      msg=$1; echo $msg && runh "conv|gst exception"     ;  }
gstp () {      msg=$1; echo $msg && hterm basic "conv|grep -Eo '...............Test Passed..........' " ; }
gst2 () {      gstf $1; gstp $1 ; }

alias seedupx='conv|grep -io  "CMMAC=............"  |sort|uniq -c'
alias seedupo='conv|grep -io  "CPE_MAC=............"|sort|uniq -c'
alias seedupa='conv|grep -ioE "CPE_MAC=............|CMMAC=............"|sed '/=/s/^.*=//'|sort|uniq -c'

alias grepp='  pdfgrep --color auto '

# Flip IPv6 to IPv4: tvworks: 10.253.86.138 aka opstools-mv.cvs-a.ula.comcast.net
flip_v6_to_v4 () { i=$1; echo "u:p = tvworks:tvworks"; echo "flipToIPv4.s ipv6 then reset"; ssh tvworks@opstools-mv.cvs-a.ula.comcast.net -t "./flipToIPv4.sh $i;"  ; }
# tunnel: /api/v1/operational/internal/gateway-cpe/$CPE/tunnel?names=Device.X_Comcast_com_ParentalControl.ManagedDevices.Device.
# XPC API:   GET http://96.118.253.117:8080/api/v1/internal/gateway-cpe/044E5A9AE8EC/tunnel?names=Device.DeviceInfo.X_RDKCENTRAL-COM_ConfigureWiFi,Device.DeviceInfo.X_RDKCENTRAL-COM_CloudUIEnable
# WebPA API: GET https://api.webpa.comcast.net:8090/api/v2/device/mac:5c8fe07ed532/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_ConfigureWiFi,Device.DeviceInfo.X_RDKCENTRAL-COM_CloudUIEnable,Device.DeviceInfo.X_CISCO_COM_FirmwareName
otn () {      m=$1; h=$2; o=$3; o=${o:-Device.DeviceInfo.X_COMCAST-COM_WAN_IP}; u="http://$h:8080/api/v1/internal/gateway-cpe/$m/tunnel?names=$o"      ; ech2 "GET $u"; curl -s -X GET $u -H 'content-type: application/json' |pjson|cpink ; }

#fw_cpes_st () { ( now; for i in 10.255.244.238  10.255.244.114  10.255.244.15 10.255.244.126 10.255.244.14 10.255.244.109 10.255.244.112 10.255.244.166 10.255.244.61 2001:0558:4000:001a:2eb3:13ff:fe03:62f2 10.255.244.106 10.255.244.68 10.255.244.24  2001:0558:4000:001a:764b:2aff:fe77:be79  2001:0558:4000:001a:faa0:97ff:feee:f795 ; do line;ech2 $i; sFW $i; done;line ) | tee -a $HOME/logs/FW_CPEs_Smoketest.log ; }
fwc_st () { (  now; for i in Mssy,$Issy Mssa,$Issa Mssr,$Issr  Mnrn,$Inrn  Mnrn1,$Inrn1 Mn1rn,$In1rn Mn1rn1,$In1rn1 Msrn,$Isrn  Mstoy,$Istoy Mstog,$Istog   Mstogv,$Istogv Mssg,$Issg  Mcisr,$Icisr Mcisy,$Icisy Mxb6,$Ixb6 ; do line; ech2 $i; k=${i%,*}; v=${i#*,}; sFW $v; done;line ) | tee -a $HOME/logs/FW_CPEs_Smoketest.log ; }

fwcR () { (    now; for i in Mssr,$Issr   Mnrn,$Inrn Mn1rn,$In1rn    Mnrn1,$Inrn1 Mn1rn1,$In1rn1 Msrn,$Isrn; do line;ech2 $i; k=${i%,*}; v=${i#*,}; sFW $v; done; line ) | tee -a $HOME/logs/FW_CPEs_Red.log ; }
fwcY () { (    now; for i in Mstoy,$Istoy Mssy,$Issy Mstoyv,$Istoyv; do line;ech2 $i; k=${i%,*}; v=${i#*,}; sFW $v; done; line ) | tee -a $HOME/logs/FW_CPEs_Yellow.log ; }
fwcG () { (    now; for i in Mstog,$Istog Mssy,$Issg Mstoyg,$Istogv; do line;ech2 $i; k=${i%,*}; v=${i#*,}; sFW $v; done; line ) | tee -a $HOME/logs/FW_CPEs_Green.log ; }

fwc () { (     now; for i in M1,$I1 M2,$I2 M3,$I3 M4,$I4 M5,$I5 M6,$I6 M30,$I30 M7,$I7 ; do line;ech2 $i; k=${i%,*}; v=${i#*,}; sFW $v; done; line ) | tee -a $HOME/logs/FW_CPEs.log ; }

D_WAN="Device.DeviceInfo.X_COMCAST-COM_WAN_IP"     
D_FW="Device.DeviceInfo.X_CISCO_COM_FirmwareName"
wpfwcR () { (  now; for m in $Mssr $Mnrn $Mn1rn $Mnrn1 $Mn1rn1 ; do line;ech2 $m; wp_ $m Device.DeviceInfo.X_CISCO_COM_FirmwareName; done; line ) | tee -a $HOME/logs/WPFW_CPEs_Red.log ; }

# XPC rules
nrxpf () {     m=$1; h=$2; h=${h:-$hostR};   b=$3; b=${b:-b_pfrule.json};     echo y|bjp $b; tmr 3; cPpf   $m  $h; now ; }
nrxmb () {     m=$1; h=$2; h=${h:-$hostR};   b=$3; b=${b:-b_mbrule.json};     echo y|bjp $b; tmr 3; cPmb   $m  $h; now ; }

nrx () {       m=$1; h=$2;       nrxpf $m $h; tmr 5; nrxmb $m $h ; }
crx () {       m=$1; h=$2;       mpf   $m $h; tmr 3; mmb   $m $h ; }
nrx2 () {      m=$1; h=$2;       cDpf  $m $h; cDmb $m $h; tmr 5; nrx $m $h; tmr 5; crx $m $h ; }

# ODP rules
nrobt () {     m=$1; h=$2; h=${h:-$hostOR};  b=$3; b=${b:-b_setbt.json};      echo y|bjp $b; tmr 3; cPbt   $m  $h; now ; }
nrogbt () {    m=$1; h=$2; h=${h:-$hostOR};  b=$3; b=${b:-b_setgbt.json};     echo y|bjp $b; tmr 3; cPgbt  $m  $h; now ; }
nroma () {     m=$1; h=$2; h=${h:-$hostOR};  b=$3; b=${b:-b_meshagentT.json}; echo y|bjp $b; tmr 3; cPma   $m  $h; now ; }
nroxd () {     m=$1; h=$2; h=${h:-$hostOR};  b=$3; b=${b:-b_xdnsT.json};      echo y|bjp $b; tmr 3; cPxd   $m  $h; now ; }
nrodl () {     m=$1; h=$2; h=${h:-$hostOR};  b=$3; b=${b:-b_devLevel.json};   echo y|bjp $b; tmr 3; cPdl   $m  $h; now ; }

nro () {       m=$1; h=$2;       nrobt $m $h; tmr 5; nroma $m $h ; }
cro () {       m=$1; h=$2;       obt   $m $h; tmr 3; oma   $m $h; tmr 3; oxd   $m $h; tmr 3; odl   $m $h; tmr 3; ogbt  $m $h; tmr 3; ods   $m $h ; }
nro2 () {      m=$1; h=$2;       cDbt  $m $h; cDma $m $h; tmr 5; nro $m $h; tmr 5; cro $m $h ; }

# run smoketest local:
# psto () {    t=${1:-xpc_tests/sanity}; h=${2:-$hostR};  m=${3:-$M2}; i=${4:-$I2}; s="smoketest-odp.py" ; }
# hlam001c@cacsvlo-16686:~/checkouts/xpc-test/boxertest_client$ python2.7 smoketest-odp.py --log INFO --scheme http --host 96.118.16.126:8080 --webpa https://api.webpa.comcast.net:8090 --mac 044E5A9AE8EC --cpe_ip 10.255.244.34 --service xap --api_prefix /api/v2 --enable_report True --suites v2/sanity_scheduler
pss  () {      t=${1:-sync_lite}; h=${2:-red};     m=${1:-$M2}; i=${2:-$I2}; s="smoketest-xpc.py --log INFO --scheme https --host $h.awsxpc.comcast.net --webpa https://api.webpa.comcast.net:8090 --mac $m  --cpe_ip $i   --suites sync/$t"; cdrunat; python2.7 $s ; }
pst () {       t=${1:-xpc_tests/sanity}; h=${2:-$hostR};  m=${3:-$M2}; i=${4:-$I2}; s="smoketest-xpc.py --log INFO --scheme http --host $h:8080   --webpa https://api.webpa.comcast.net:8090 --mac $m  --cpe_ip $i  --save_influxdb True --smoketest_header X-Xpc-Test=smoketests-nb-N --xpc_other_host_url 96.118.147.38:8080  --env_name red  --suites $t"; cdrunat; python2.7 $s ; }
pst1 () {      t=${1:-xpc_tests/sanity}; h=${2:-$hostR1}; m=${3:-$M2}; i=${4:-$I2}; s="smoketest-xpc.py --log INFO --scheme http --host $h:8080   --webpa https://api.webpa.comcast.net:8090 --mac $m  --cpe_ip $i  --smoketest_header X-Xpc-Test=smoketests-nb-n-1 --env_name ${5:-red} --suites $t"; cdrunat; python2.7 $s ; }
pstY() {       t=${1:-sanity}; h=${2:-$hostY};  m=${3:-$M2}; i=${4:-$I2}; s="smoketest-xpc.py --log INFO --scheme http --host $h:8080   --webpa https://api.webpa.comcast.net:8090 --mac $m  --cpe_ip $i   --suites xpc_tests/$t"; cdrunat; python2.7 $s ; }

pstltbm () {   t=${1:-get}; h=${2:-$hostR};  m=${3:-$M2}; i=${4:-$I2}; s="smoketest-xpc.py --log INFO --scheme http --host $h:8080   --webpa https://api.webpa.comcast.net:8090 --mac $m  --cpe_ip $i  --smoketest_header X-Xpc-Test=smoketests-nb-N --env_name ${5:-red} --suites latency/test_case_latency_bridge_mode/test_case_latency_bridge_mode_method_$t.boxersuite"; cdrunat; python2.7 $s ; }
pstltmm () {   t=${1:-get}; h=${2:-$hostR};  m=${3:-$M2}; i=${4:-$I2}; s="smoketest-xpc.py --log INFO --scheme http --host $h:8080   --webpa https://api.webpa.comcast.net:8090 --mac $m  --cpe_ip $i  --smoketest_header X-Xpc-Test=smoketests-nb-N --env_name ${5:-red} --suites latency/test_case_latency_moca_mode/test_case_latency_moca_mode_method_$t.boxersuite"; cdrunat; python2.7 $s ; }

# CUJO: http://96.118.61.37:8080/api/v1/operational/gateway-cpe/9C34263F9ADE/devices/DDDD5555DDDD/fingerprint_feedback; 200=in odp.device_fingerprint table; or 400 is not in
# Steps to have new CPE, check sWPA $I for fabric.webpa.comcast.net; save file, json, Mx, Ix, mXif; olob, msy: ok_wpa_api_snmp; 5 item m i u p fw; enable telnet: teli ; local ui: u:p; onb && awc get WAN ip;
# Steps to stop  XPC service: service puppet status; date; service puppet stop; puppet agent --disable;  supervisorctl stop api; date
# Steps to start XPC service: 1. service puppet start; 2. puppet agent --enable; 3. supervisorctl start api; date; supervisorctl status all; ps -aef | grep uwsgi;date
# Steps to disable ODP service: comment out on an XPC core: the flag ODP_HAPROXY_BASE_URL in instance_config.py. For ex: 1/ #/app/xap/conf/instance_config.py:101:ODP_HAPROXY_BASE_URL = 'https://odpredsync.odpaws.comcast.net'; 2/ #/app/xpc/conf/instance_config.py:101:ODP_HAPROXY_BASE_URL = 'https://odpredsync.odpaws.comcast.net';
# Steps to check When API ver got err: 1/ping2 $hostR; 2/dig it for DNS; 3/sshcor it for supervisorctl status api first, then uwsgi next; 4/check logs/api/*.log; 5/ps -ef some more 6/ check webpa via snmp query for fabric.webpa.comcast.net...ex: sWPA $I2
# petasos-prod-1000137.webpa.comcast.net (96.118.183.38)
### get version of core at slave: runcor 96.118.55.6 "curl  -X GET  http://96.118.57.12:8080/api/v1/version;"
# Steps to debug get_version() fails on smktest je job: run gver of core host from slave; then check uwsgi if running; check je smktest job config right?
# Steps to check if Outlook no mail: Cause1/ nw connection (CCemployee?); 2/ check credential (menu Tools>Accounts); 3/ WorkOffline (menu Tools); 4/ server running MS ExchangeServer is UNavailable (menu Tools>Accounts); 5/ req SSL? (menu Tools>Accounts>Adv>Server>Use SSL) 6/ req proxy server connect to MS ExcServer? (admin)
# Outlook scheduling a meeting: tip: search room "CSVCA-2" under “TO”, add room name, then click on “Scheduling” to see if the room is available or not before sending the invite out

# Steps to check CPE m2i: 1/[live webpa]$gowpa $m; 2/[last success in smoketest]$open je...; 3/[Production CPEs]$oPOD; 
# Steps to check CPE i2m: 1/teli $i; ifconfig -a wan0| egrep -o HW.*; 2/possibly SNMP ??? 

# Steps to factory reset CPE: 1/Pin 30secs 2/run lui [u:p=msooPOD] to enable telnet 3/teli to test 4/SNMP check sWPA 5/roll back fw=2.5 wait 15mins, then telnet in and a.nvm b.!factory c.stmfg d.!reset, wait 8mins then re-telnet arristi then upgrade fw, wiat 15mins and try telnet
# Steps to Enable telnet: 1/iportal 'oPOD' 2/lui mso:POD 3/Advance > Remote Mgmt > @Global Management: push button enable Telnet 4/Opt: enable both http 8080 and https 8181
# Steps to telnet to XB3 Arris cpe u:p=[none]:arristi (or factory pwd from Kevin). Type "quit": to shell; type "exit": back to console; Exit out Ctrl }, Ctrl d
# Steps to telnet to XB3 cisco u:p=admin:POD; mainMenu>shell; tail -f /rdklogs/logs/WEBPAlog.txt.0
# Steps to telnet to XB6 Arris u:p=admin:POD
# Steps/option to FW upgrade; 1/je job: jefwup="upgrade-rdkb"; 2/Kevin 3/SItools; 4/CLIs ssh+snmp+Dan's script
# Steps to clone Jenkins job: 1.New Job 2.Name it "smoketest-red-newton" 3.Copy from "smoketest-n-on-red-n" 4.save 5.Configure: add new CPE + XPC_INSTANCE + other_host + Advanced:new folder=/opt/smoketest-red-newton

# curl -X PATCH 'https://api.webpa.comcast.net:8090/api/v2/device/mac:044E5A9AE8EC/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_ConfigureWiFi'  -H 'authorization: Bearer eyJraWQiOiJzYXQtcHJvZC1rMS0xMDI0IiwiYWxnIjoiUlMyNTYifQ.eyJqdGkiOiJmMjNhNmExMy1hYmU2LTRmMmYtOGI2Yi1iN2QzYTNlZTc5ZjIiLCJpc3MiOiJzYXRzLXByb2R1Y3Rpb24iLCJzdWIiOiJ4MTpwcm9kOnhwYzowOTA4OWMiLCJpYXQiOjE1MTE4MjAxMzksIm5iZiI6MTUxMTgyMDEzOSwiZXhwIjoxNTExOTA2NTQyLCJ2ZXJzaW9uIjoiMS4wIiwiYWxsb3dlZFJlc291cmNlcyI6eyJhbGxvd2VkUGFydG5lcnMiOlsiY29tY2FzdCJdfSwiY2FwYWJpbGl0aWVzIjpbIngxOndlYnBhOmFwaTpkZXZpY2UvLiovY29uZmlnXFxiOmFsbCIsIngxOndlYnBhOmFwaTpkZXZpY2UvLiovY29uZmlnXFxiOmdldCIsIngxOndlYnBhOmFwaTpkZXZpY2UvLiovc3RhdFxcYjpnZXQiLCJ4MTp3ZWJwYTphcGk6aG9va1xcYjpwb3N0IiwieDE6d2VicGE6YXBpOmhvb2tzXFxiOmdldCJdLCJhdWQiOltdfQ.SPapxA-Z3JwpDkCyd2of29OyR9z5poL9ePbwYrVOM1bSAZD6_6nr7APDMB7rHStaN36LbN6P4L1stMKY-TKyza6Rn51iw6LKr1EXY6g1wnFUg7GaG5aSHOfv_EJnIH4HQ-mAbnWrGZ8JiGd_PUbfgdK7X1SJ5VqAUoSAdCB9cH4'   -H 'content-type: application/json'    -d '{"parameters":[ {"name":"Device.DeviceInfo.X_RDKCENTRAL-COM_ConfigureWiFi","value": "true", "dataType":3} ]}'

# XPC-4691: $ bjp b_r5_neg.json; cPr5 $M6 $hhostR //replace M2 M3 //expect 400 (of 552)

# Amogh; traffic drops: fail sync: https://etwiki.sys.comcast.net/display/SMARTINT/XPC+Runbook#XPCRunbook-Identifyingdropsinreportsandnotification

