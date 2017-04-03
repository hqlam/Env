
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export PS1="\u@\h:\w\\$ "

export NODE_ENV="dev_local"
export LOG_LEVEL=debug

# to edit "git commit" -m 
export EDITOR=vim

export NVM_DIR="/Users/hlam001c/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# soft launch 			https://internet.xfinity.com/
# xpc$odp current sprint   	https://www.teamccp.com/jira/secure/RapidBoard.jspa?rapidView=2846&view=detail&selectedIssue=ODP-1804&quickFilter=11536
# xpc platform JIRA 		https://www.teamccp.com/jira/browse/XPC/?selectedTab=com.atlassian.jira.jira-projects-plugin:issues-panel
# oper Data Plat 		https://www.teamccp.com/jira/browse/ODP/?selectedTab=com.atlassian.jira.jira-projects-plugin:issues-panel
# XBCLOUD JIRA 			https://www.teamccp.com/jira/browse/XBC/?selectedTab=com.atlassian.jira.jira-projects-plugin:summary-panel
# oconf ; xFi Platform ; One Stop Page ; QA Cheat Sheet ; xfinity power cloud ; jxm 


### HELPERS

line () {  n=$1; n=${n:-80}; echo `seq  -f = -s '' $n ` ; }
ech2 () {  echo;echo $* ; }
alias h='  hostname|egrep  -C1 [a-z]+'
alias hn=' h; ifconfig|gip '

# Grep on History of cmd lines
alias ht='   history|tail -40 '
alias hist=' HISTTIMEFORMAT=%c'
fgh  ()  {   HISTTIMEFORMAT=%c ; history | egrep $*  ; }

# Kill Process using Pkill: #fkpp () { pgrep -lf $1 ;pkill $1    ; }
fkp  () {    r=`ps -ef | grep $1 | grep -v grep |awk '{print $2}' ` ; if [ ! -z "$r" ]; then sudo kill  $r; fi ; }

fgbC ()   {    grep -i "$1" $2 $3 $4  ~/checkouts/hl/Env/bashrc_CSV ;}
fgbZ ()   {    grep -i "$1" $2 $3 $4  ~/checkouts/hl/Env/bashrc_ZBRA ;}
fgbH ()   {    grep -i "$1" $2 $3 $4  ~/checkouts/hl/Env/bashrc_H    ;}
alias vicC=' view   ~/checkouts/hl/Env/bashrc_CSV'
alias vicZ=' view   ~/checkouts/hl/Env/bashrc_ZBRA'
alias vicH=' view   ~/checkouts/hl/Env/bashrc_H   '
# Grep on file .Bashrc
fgb  ()  {   egrep -i "$1" $2 $3 $4  $HOME/.bashrc ; }

alias vic='  vi        $HOME/.bashrc'
alias soc='  h; source $HOME/.bashrc'
socjv () {   h; sed -i -- 's/cowsay/echo/g'   ~/.bashrc;  unalias -a && source $HOME/.bashrc  ; }
socjb () {   h; cd; awk   '!/--color|cowsay/' ~/.bashrc > .tb; yes|mv .tb .bashrc; unalias -a && source $HOME/.bashrc  ; }
alias soc2=' unalias -a && source $HOME/.bashrc '
alias teb='  te        $HOME/.bashrc'

alias grep=' grep    --color=auto'
alias egrep='egrep   --color=auto'
#alias grepstrong='GREP_COLOR="1;34;46" \grep --color'
#alias vi='   vim'
#alias vifilerc='sudo vi /usr/share/vim/vimrc'

vibc () {    filename=$1; old="$2"; new=$3; vi -bc ":%s/$old/$new/c|:q" $filename ; }
vid  () {    filename=$1; pat="$2";         vi -bc ":g/$pat/d|:q"       $filename ; }

vin  () {    filename=$1; num=$2;           vi      +$num               $filename ; }
vis  () {    filename=$1; pat=$2;           vi      +/$pat              $filename ; }

vics () {    vis $HOME/.bashrc $* ; }
vih  () {    cmd=$*; bash $HOME/proj/shell/hterm.sh basic  vis $cmd ; }

# Timing
alias t1='   starttime=$(date +"%s")'
alias t2='   date; echo seconds=$(($(date +"%s")-$starttime)) | egrep "=[0-9]+" '
alias dateT='date    "+%FT%T"'
alias dateU='date -u "+%FT%T"'
datems () {  node -e 'console.log(new Date().getTime())' ; }
alias now='  echo UTC: `dateU`|cat09; echo Now: `dateT`|cat09 '
#lastm () {  m=$1; m=${m:-10}; sshds "date +'%x:%H:%M:%S';  date -d '$m minutes ago' +'%x:%H:%M:%S' " ; }
# date in sec: $ date +%s; date in millisec $ date +%s%3N

##  Splunk search help funcs
#mnow () {   sshjv "date +'%x:%H:%M:%S' " ; }
#mlast () {  m=$1; m=${m:-10}; sshjv " date -d '-$m minutes' +'%x:%H:%M:%S' " ; }
#mplus () {  m=$1; m=${m:-10}; sshjv " date -d '+$m minutes' +'%x:%H:%M:%S' " ; }
#m10 () {    m=$1; m=${m:-10}; l=`mlast $m`; n=`mnow`; date; echo -n  "earliest=$l latest=$n";echo ; }
s22 () {     m=$2; m=${m:-22};                        date; echo -n  "earliest=-$m"m latest=now ; echo  " index=baymax sourcetype=json source=\"/opt/csv/var/log/*smartconnect_stdout.log\" hostname=\"smartconnectb*\" $1   " ; }

#splu10 () {   earliest=$l latest=$n  index=baymax sourcetype=json source="/opt/csv/var/log/*smartconnect_stdout.log" hostname="smartconnectc*"  ; }
#spluXOD () { index=baymax sourcetype=json source="/opt/csv/var/log/*smartconnect_stdout*.log" hostname="smartconnectc*" | eval Time=strftime(_time,"%F %T.%3N") | eval EventStream='Time'." - ".'msg' | eval BaymaxId='metadata.baymaxReqId' | eval Source='payload.incident.source' | stats min(_time) AS _time,          values(Source) AS Source,          range(_time) AS Range(sec) BY BaymaxId | search Source=XOD  Source=XOD  ; }

##  Print Json
alias pjson='python -m json.tool'


### NAMING


#sonicw="172.20.7.100"    	
sonic="204.15.241.57"           # aka sonicwall="sslvpn.plaxo.com" # PING sslvpn.plaxo.com (204.15.241.57)
alias psonic='   oterm "pingf      $sonic |cat09 " ' 
alias trsonic='  oterm "line;t1;traceroute $sonic|cat09;t2;line" '
alias pingsw='   watch -t "ping -a -c 2 $sonic&&date" '

#hl="$HOME/checkouts/hl"

##  Pings

# check heartbeat kafka services
# $ sshjv "curl -s http://10.1.47.43:3100/status;echo" 
alias chbk='sshjv "hostname;date;k="http://10.1.47.43:3100/status";echo "$k"; curl -s http://10.1.47.43:3100/status;echo" '
#hbk () { s=$1; s=${s:-10.1.47.43}; p=$2; p={p:-3100}; sshjv -t -Y "curl -s  http://$s:$p/status;echo" ; }
#alias hbk1='hbk 10.1.47.43 3200'

### ALIASES_AND_FUNCTIONS

# hterm ssh
alias ssh93='  bash $HOME/proj/shell/hterm.sh novel    sshsdev '
alias sshadm1='bash $HOME/proj/shell/hterm.sh homebrew sshadm'
#16686:~/proj/tclex$ ./ssh.exp 10.255.246.110 root
sup () { s=$1; u=$2; p=$3; ~/proj/tclex/ssh.exp $s $u $p ; }

# scp rsync cmds
# hlam001c@CACSVML-15870:~$ rsync -av -e "ssh 10.1.2.3 ssh" 10.1.47.93:~/bm-stg-dispatcher01-deploy-dispatcher.sh ~/
# $ rsy  $b93 bm-stg-dispatcher01-deploy-dispatcher.sh 
rsy () {       mid=$3; mid=${mid:-10.1.2.3}; tarhost=$1; f=$2; rsync -av -e "ssh $mid ssh" $tarhost:~/$f  ~/ ; }

rsy2sdev () {  f=$1; p=$2; rsync -v $f  172.20.3.178:~/$p   ; }

scpfsdev () {  pf=$*;      scp   -r hlam001c@172.20.3.178:~/$pf   . ; }

# webshare at http://host_ip_addr:5777
# @resosurce host server: pwd;ipaddr; webshare 51234. Then, @end-user server: open http://host_ip_addr:51234
# to monitor if sharing is going on: $w; or fispydone; or ps -ef|grep python; Example: CACSVML-15870:~$ sshsdev fispydone; CACSVML-15870:~$ sshsdev w
#webshare () { p=$1; p=${p:-5777}; python -c "from SimpleHTTPServer import test; import sys; sys.argv = [None,$p]; test()" ; }
webshare () {  p=$1; p=${p:-5777}; ech2 `ipad`:$p; python -m SimpleHTTPServer $p ; }
alias pyshare='python -m SimpleHTTPServer 8888 & '

alias ipdrop='python $HOME/proj/py/iDropped.py '
ipdr () {     python -c 'import socket; print ("IP=", socket.gethostbyname(socket.gethostname()) , "If IP==127.0.0.1, Then Internet connection was dropped."  ) ' ; }
ipad () {     python -c 'import socket; print (socket.gethostbyname(socket.gethostname())); ' ; }
#idr () {     python -c 'import urllib; try: urllib.urlopen("http://google.com"); except: print("NOT connected"); ' ; } 

# C2A update .bashrc
alias C2ds='   scp   $HOME/.bashrc      10.172.52.190:~  '
C2b () { b=$1; scp   $HOME/.bashrc      hlam001c@$b:~ ; }

alias C2A='    ech2 ***DS:;C2ds; ech2 ***SDEV:;C293; ech2 ***adm1:;C2b adm1; ech2 ***JV:;C2jv '
alias C2B='    ech2 ***b91:;C2b $b91; ech2 ***b92:;C2b $b92; ech2 ***b93:;C2b $b93 '

# cd cmds
alias cdthum='  cd /Volumes && ls -ltr '
alias cdapps='  cd /Applications/'

alias cddesk='  cd $HOME/Desktop/'
alias cddocs='  cd $HOME/Documents/'
alias cddown='  cd $HOME/Downloads/'
alias cddrop='  cd $HOME/Dropbox/'
alias cdhelp='  cd $HOME/Help/'
alias cdpy='    cd $HOME/proj/py'
alias cdsh='    cd $HOME/proj/shell'
#alias cdnode='  cd $HOME/proj/nodejs'

alias cdbmx='   cd $HOME/checkouts/hl/bmx-qa/bmx '
alias cdxap='   cd $HOME/checkouts/xap  '
alias cdbx='    cdco; cd boxer '

alias cdco='    cd $HOME/checkouts;h'
alias cdhl='    cd $HOME/checkouts/hl; llr '
alias cdenv='   cd $HOME/checkouts/hl/Env; llr '
alias cdsplu='  cd $HOME/checkouts/hl/splunk/ '

alias cdtd='    cd test/test_data/'


### TIG_COMMANDS

# $ brew install tig; tig --help; tig //current branch;
# $ tig grep hlam; --all //allbranches; develop //a specific branch; ; test..develop //diff between; 
# on specific file: tig US733009-dotcom-support..develop -- smartconnect.js //revisions bw 2 dates of a specific file; blame file //history of changes; tig --all  --since=1.week -- rfNoiseCalls.js //any line changed in last (1) week
# tig refs //all references like branches, remotes and tags
# $ git show |tig; git log | tig;
# git status ; tig blame file ; tig master ; tig test..master; tig myFile; tig v0.0.3:README
alias t1w='tig --all  --since=1.week -- '

### GIT_COMMANDS

# git refspec

gith () {      git help $* ; }

# Save fragments: git stash; then later:  git stash pop; list; drop

gitsc () {     commit=$1; git show                            $commit ; }
alias d_m='    co_d && echo ****Develop: `git show develop|grep Date:` ; co_m && echo ****Master : `git show master |grep Date:` '
alias m_d='    co_m && echo ****Master : `git show master |grep Date:` ; co_d && echo ****Develop: `git show develop|grep Date:` '

# git log --no-merges -p 1.12.0..v1.13.0 |egrep -A4 "^commit" # git log --since="2 days ago"
gitlastcommit () { git pull; commit=$1; commit=${commit:-1}; git log -p -$commit ; }
#gitlastcom () {    git pull; gitlastcommit $1 | grep commit|cut -c8-14 ; }
gitlastcom () {    git pull 2> /dev/null; commit=$1; commit=${commit:-1}; git log -p -$commit | egrep "commit [0-9a-f]{7}" |cut -c8-14 ; }
#work g_c () {    git pull 2> /dev/null; commit=$1; commit=${commit:-1}; gc=`git log -p -$commit | grep commit|cut -c8-14`; echo "GitHub xap repos: SHA=$gc"; echo; for i in 57.11 57.13 27.110 30.93 ; do echo -n core_96.118.$i: SHA=; cc=`curl -s 96.118.$i:8080/api/v1/version|pjson|grep commit|tr ',\"' ' '|cut -d. -f4`; echo  $cc ; [ $gc == $cc ] && echo ">>>> NOT_matched `date` <<< " && echo && cd ~/proj/py && python m.py ; done ; }

# recent commits
git1line () {                                     git log --oneline --graph ; }
gitoneline () {                                   git log --pretty=oneline ; }

# grep text from git_log
gitgl () {                                        git log |egrep -i -C10 $* ; }

# Review history:  show history of a file
gitfilehist () {  f=$1 ;                          git log -p -- $f ; }
alias gitfilehist2='                              git log -p --since="7 days ago" '
alias gitll='     echo "*LATEST LOG ... :";       git log |head -7;  echo '
gitdirhist () {   for f in `ls`; do echo  `gitfilehist $f|head -5|grep Date` $f ; done ; }
gitdirsort ()   { gitdirhist > ~/fh; cat ~/fh | sort ; rm -f ~/fh ; }
#gitdirsort ()  { for f in `ls`; do echo  `gitfilehist $f|head -5|grep Date|cut: -f2` $f ; done > ~/fh; cat ~/fh|sort ; }

# file history with tig command
tigfilehist () {  f=$1 ; tig blame        $f ; }
alias catt='      tigfilehist '


# Diff the commit to its parents: git diff efe1243^! ; OR git diff --staged;
gitdif () {       f=$1 ; git diff      $f ; }
alias gitdiff='          git diff HEAD HEAD^1 ; git diff HEAD HEAD^1 --stat'
alias gitmod='           git diff `git status|grep modified:|cut: -f2` '
gitdirty () {     topic=$1;                             echo $topic; upstr=$2; git diff --name-status $topic $upstr ; }
gitdirty1 () {    topic=`git branch|grep "*"|cuts -f2`; echo $topic; upstr=$1; git diff --name-status $topic $upstr ; }

# status, branch, last log, last commit
alias gits='      echo "****STATUS:";     git status; echo '
alias gitst='     echo "****BRANCH ...:"; git status; echo; git branch -vv; ech2 "****THE LATEST LOG ... :"; git log |head -7;  echo '
alias gitb='      echo -ne "****BRANCH: \t ";               git branch; echo '
alias cbr='                                                 git branch | grep "*" | cuts -f2'
alias gitallb='   echo "All branches: "; git pull;          git branch -av; pwd'

# git pull all
alias gitp='      t1;  git pull;  t2 '
fgitp () {        soc;cdxap; for d in `ls ..`; do echo -n "**** $d : "; cd ../$d; gitp ; done ; }
fgitb () {        soc;cdxap; for d in `ls ..`; do echo -n "**** $d : "; cd ../$d; cbr  ; done ; }

# reset upstream: git branch mamobile_fields_ivr --set-upstream-to origin/develop
# git rebase upstream/master
# alias gitpm='   git pull origin master'
# alias gitpd='   git pull origin develop'
alias gitpusho='  git push origin ' 

# Branch create/checkout/delete 
createdev2b () {  git checkout -b $1 origin/develop ; }

alias co_reset='  git reset --hard; date; gitst '
reset_b () {      bORc=$1; git reset --hard  $bORc; git pull; date; gitst ; }
delete_b () {     bORc=$1; git branch -d     $bORc; date; gitst ; }

co_b () {         bORc=$1; bORc=${bORc:-master} && git checkout $bORc; date && echo ___NEW_PULL__&& git pull ; }
alias co_d='      co_b develop '
alias co_m='      co_b master '
alias co_bx='     cdxt;pwd;cbr;ech2 co_boxerclient branch...; co_b boxerclient'

# Refactor filenames: rm, mv; #git mv [file-ori] [file-renamed]
alias gitrm='     git rm --cached '

# List files # git ls-files --other --ignored --exclude-standard
alias gitlist='   git ls-files'

# Open github ogh
# all $gs= (pulls; commits; branches; releases; tags; compare; contributors; issues )
# branches/all; branches/yours; branches/active; tree/develop;  pull/3/files; pull/3/commits; pull/new/develop; compare/develop...csv_082316; 
oghhl  () {                                              open https://github.comcast.com/hlam001c/bmx-qa ; } 
oghh   () {                                              open https://github.com/hqlam/ ; } 

# Open ogh
ogh  () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt ; }

#ogc () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/commits ; }
#ogcp () {                    rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/compare ; }
ogr  () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/releases ; }
ogt  () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/tags ; }
ogp  () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/pulls ; }
ogb  () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/branches ; }

# open ogh branches
oab () {                      rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/branches/active ; }
oby () {                      rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/branches/yours ; }

# open ogh tree
otb  () { b=$2;b=${b:-master};rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/tree/$b ; }
otd  () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/tree/develop ; }
otm  () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/tree/master ; }

# open ogh pull
opr  () { pr=$1;              rt=$2; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/pull/$pr ; }
oprf () { pr=$1;              rt=$2; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/pull/$pr/files ; }
oprc () { pr=$1;              rt=$2; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/pull/$pr/commits ; }

# open ogh commit
ogc  () { commit=$1;          rt=$2; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/commit/$commit?diff=split ; }

# open ogh compare
cpbran () { branch=$1;        rt=$2; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/compare/$branch  ; }
ogcp  () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/compare/$2...$3 ; }
#ocp    develop  master' ;ocp    1.12.0   v1.13.0 #https://github.comcast.com/xpcs/xap/compare/1.12.0...v1.13.0

# Install git: https://mac.github.com; or https://windows.github.com; 

# Create/migrate repos: git init [project]; clone [url]

# git config --global/--get user.name/user.email
# xpc-test $ cat .git/config url = git@github.comcast.com:xpcs/xpc-test.git
# migrate: git clone --bare https://github.csv.comcast.com/hlam001c/bmx-qa; open https://github.comcast.com/hlam001c/; create a new bmx-qa repos; git push --mirror https://github.comcast.com/hlam001c/bmx-qa
alias clonesc93=' git clone git@github.comcast.com:xpcs/xpc-test.git'
gcln () { repo=$1;git clone git@github.comcast.com:xpcs/$repo ; } 

gitcln () {       repo=$1; repo=${repo:-xpc-test}; git clone https://github.comcast.com/xpcs/$repo ; }
alias clonexap='  cdco && gcln xap.git  '
alias renewxap='  cdco && [[ -d xap ]]  && sudo mv -f xap   hl/xap_$(date '+%Y.%m.%d.%H.%M.%s')   && clonexap && cdxa && date; git branch -vv ; git log |head -7 '

alias cdredis='   cd /usr/local/bin/redis; ls -ltr '
# make avail $ rpm -qf /usr/local/bin/redis/redis.conf
alias startredis='redis-server   /usr/local/bin/redis/redis.conf     & '
alias startsenti='redis-sentinel /usr/local/bin/redis/sentinel.conf  & '
alias pingredis=' echo "redis-cli ping, and PONG ? " && redis-cli ping '
alias startr='    hterm pro startredis'

# sdev startredis; sudo systemctl start redis.service; sudo systemctl status redis.service
alias status_serv='      service redis status '

alias startredis_serv='  sudo service redis start '
alias startsenti_serv='  sudo service redis-sentinel start '
alias startredis_3='cd ${HOME}/redis-3.2.3; src/redis-server redis.conf '


#alias gredis='    egrep "^db|connected|role|mem|REDIS" '
#alias gisource='  egrep "event.incident.source" '

#alias starthapp=' cd $HOME/WebstormProjects/henry_starter_project/henry_app; pwd; ls; npm start & '

#alias startt_l='  NODE_ENV=test_local ' 
#alias starttmo='  startt_l mocha test/integration/testEnrichment_MockCS'
#alias startmms='  cdsc && pwd && startt_l node MockMELDServer.js | bunyan -L & ' 
#alias omms='      open http://localhost:5002/'
#alias vmms='      curl -s  http://localhost:5002 |catco '

alias startsc_l=' cdsc && pwd && NODE_ENV=dev_local      node smartconnect.js    | bunyan -o short -l debug -L & '
#alias startsc_l='cdsc && pwd && NODE_ENV=dev_local      node smartconnect.js   | bunyan -o short -l debug    & '
# /usr/local/bin/node --debug-brk=62963 --nolazy smartconnect.js
# bash -c cd smartconnect && NODE_ENV=dev_local nohup npm run sd 2>&1 > smartconnect.log &
alias startl='    hterm pro startsc_l'

alias stopsc='    fkp smartconnect '
alias stopnode='  fkp node'
alias stopredis=' fkp redis-server  ; fkp redis-sentinel'

alias stopall='   stopredis ; sleep 2; stopnode ; sleep 2 '
alias mon='       ech2 "Monitor process status and jobs running ..."; ps -ef|egrep "webshare|python|tail"; jobs; date '

alias startcsng=' cd $HOME/checkouts/context-store-ng; date; pwd; ./bin/www | bunyan -L '

alias startgeo='  cdchor; now; npm install &&  node upload_geodata.js '


alias sdisp=' sshsdev "bash -ic startdisp " '
alias sbser=' sshsdev "bash -ic startbser " '
alias sbcli=' sshsdev "bash -ic startbcli " '
alias sgeo='  sshsdev "bash -ic startgeo  " '

alias tbser=' sshsdev "bash -ic tailbser" '
alias tbcli=' sshsdev "bash -ic tailbcli" '
alias tdisp=' sshsdev "bash -ic taildisp" '
alias tredm=' sshsdev "bash -ic redismo " '

tdisp93 () {  bash $HOME/proj/shell/hterm.sh novel   "sshsdev 'tail -n100 -F /home/hlam001c/checkouts/dispatcher/dispatcher.log|bunyan -L -o short ' " ; }
tredm93 () {  bash $HOME/proj/shell/hterm.sh novel   "sshsdev 'bash -ic redismo ' " ; }
mon93 () {    bash $HOME/proj/shell/hterm.sh novel   "sshsdev 'bash -ic mon ' " ; }


##  Get JSON values of keys, subkeys

pjkey () {                python -c "import json,sys; print json.load(sys.stdin)$1 " ; }
#                         python -c "import json,sys;                      print json.load(sys.stdin)['payload'] "
#                         python -c "import json,sys;                        obj=json.load(sys.stdin);print obj['payload'] "
function getJsonVal2 () { python -c "import json,sys;sys.stdout.write(json.dumps(json.load(sys.stdin)$1, sort_keys=True, indent=4))"; }
function getJsonVal () {  python -c "import json,sys;sys.stdout.write(json.dumps(json.load(sys.stdin)$1))"; }
# cat ki.json          |  getJsonVal            "['events'][0]['data']['nlTagNum']";echo
# cat other_enrich.json|  getJsonVal "['payload']['events'][0]['data']['nlTagNum']";echo
# cat other_enrich.json|  python -c "import json,sys;                          obj=json.load(sys.stdin);print obj['payload']['customer']['data']['xbo_Id']"
# cat other_enrich.json|  python -c "import json,sys;                        print json.load(sys.stdin)['payload']['customer']['data']['xbo_Id']"


##  Curl read redisData

alias v='  curl -s http://baymax-next.csv.comcast.com:3000/heartbeat > $HOME/tem/curlog && pjson $HOME/tem/curlog '
vulh () {  d=$1; d=${d:-log_stdout};      u=http://localhost:4031/$d &&                 curl -s  $u > $HOME/tem/curlog && pjson $HOME/tem/curlog  ; }
vu () {    s=$1; d=$2; d=${d:-heartbeat}; u=http://baymax-$s.csv.comcast.com:3000/$d && curl -s  $u > $HOME/tem/curlog && pjson $HOME/tem/curlog  ; }
alias vun='vu next '
alias vuc='vu curr '

##  redis keys, value, subkeys 

getkey () {    redis-cli get $1 | python -m json.tool ; }
# getkey all_map_rules_info ; getkey all_map_rules_info |pjkey "['userInfo']"

getkv () {     k=$1; k=${k:-name}; f=$2; f=${f:-$HOME/checkouts/mapping-rules/prod_rules/rules.json}; grep $k $f -n | cat -n ; }
# mapping-rules$ for fi in event.incident.source name execMethod; do echo $fi; getkv $fi prod_rules/rules.json ; done


# vun redisData>rd.json; python -c "import json; print json.load( open ('rd.json', 'r') )['all_map_rules']"  | tee bn_r
rl_teekey () { k=$1; vulh redisData > rd.json; python -c "import json; print json.load( open ('rd.json', 'r') )['$k']" | tee lh_$k ; rm -f rd.json ; }
rn_teekey () { k=$1; vun  redisData > rd.json; python -c "import json; print json.load( open ('rd.json', 'r') )['$k']" | tee bn_$k ; rm -f rd.json ; }
rc_teekey () { k=$1; vuc  redisData > rd.json; python -c "import json; print json.load( open ('rd.json', 'r') )['$k']" | tee bc_$k ; rm -f rd.json ; }

##  redis keys, count and compare
rl_key () {    k=$1; vulh redisData > rd.json; python -c "import json; print json.load( open ('rd.json', 'r') )['$k']" > lh_$k ; rm -f rd.json ; }
rn_key () {    k=$1; vun  redisData > rd.json; python -c "import json; print json.load( open ('rd.json', 'r') )['$k']" > bn_$k ; rm -f rd.json ; }
rc_key () {    k=$1; vuc  redisData > rd.json; python -c "import json; print json.load( open ('rd.json', 'r') )['$k']" > bc_$k ; rm -f rd.json ; }

ckey () {      k=$1; cd $HOME/logs; rl_key $k && rn_key $k && rc_key $k && echo "Compare word-count of lh_ bn_ bc_ for key=$k:" && wc lh_$k bn_$k bc_$k ; }
allk () {      redis-cli KEYS "*"  |sort ; }
cckey () {     for k in `allk`; do echo $k; ckey $k; done ; }


##  Pull ERROR from log_stdout
ERRst="ECONNRESET|ETIMEDOUT|ENETUNREACH|ERROR"
IWE="INFO|WARN|ERROR"
sts () {  c=$1; c=${c:-head}; egrep 2016 | $c -1|cut -d"]" -f1 | tr '"[' ' ' ; }
lon () {  vun  log_stdout >> ~/logs/temln && f=~/logs/temln ; echo Start_time: `cat $f|sts` ; egrep "$ERRst" $f ; echo "End_time  :" `cat $f|sts tail` ; now ; }
loc () {  vuc  log_stdout >> ~/logs/temlc && f=~/logs/temlc ; echo Start_time: `cat $f|sts` ; egrep "$ERRst" $f ; echo "End_time  :" `cat $f|sts tail` ; now ; }

##  Pull data from redisData
rl () {             vulh redisData | egrep $* ; }
rn () {             vun  redisData | egrep $* ; }
rc () {             vuc  redisData | egrep $* ; }

##  Pull redisData from a string of "IVRBucket", or eventType
rn_ivrbucket () {   s=$1; vun redisData|egrep -i -C3 "IVRBucket\": \"$s\",?" ; }
rc_ivrbucket () {   s=$1; vuc redisData|egrep -i -C3 "IVRBucket\": \"$s\",?" ; }
rn_eventType () {   s=$1; vun redisData|egrep -i -C3 "eventType\": \"$s\"?" ; } 
rc_eventType () {   s=$1; vuc redisData|egrep -i -C3 "eventType\": \"$s\"?" ; } 

##  Pull redisData map_ivr_itg key from a string of "Primary Key", or csr_description, or display_priority 
rl_PK () {          s=$1; vulh redisData|egrep -i -B30 -A5 "Primary Key\": \".*$s.*\",?" ; }
rn_PK () {          s=$1; vun  redisData|egrep -i -B30 -A5 "Primary Key\": \".*$s.*\",?" ; }
rc_PK () {          s=$1; vuc  redisData|egrep -i -B40 -A9 "Primary Key\": \".*$s.*\",?" ; }
#rc_csrdesc () {     s=$1; vuc redisData|egrep -i -B30 -A5 "csr_description\": \".*$s.*\",?" ; }
#rc_displayprio () { s=$1; vuc redisData|egrep -i -B30 -A5 "display_priority\": \".*$s.*\",?" ; }
rl_ftp () {         s=$1; vulh redisData|egrep -i -C4      "FTP\": \".*$s.*\"?" ; }


### REDIS-CLI_COMMANDS

# redis-cli INFO | egrep "^db|connected|role|mem"
# redis-cli MONITOR
# redis-cli --version  
# redis-cli --stat   
# redis-cli --scan   
# redis-cli KEYS    map*; redis-cli KEYS rf*; redis-cli KEYS  "*" ; echo keys map*|redis-cli
# redis-cli DEL     testing_key

# redis-cli TYPE    rfNoise_data:70:85:C6:33:9F:09
# redis-cli HLEN    rfNoise_data:70:85:C6:33:9F:09 
# redis-cli HKEYS   rfNoise_data:70:85:C6:33:9F:09 
# redis-cli HVALS   rfNoise_data:70:85:C6:33:9F:09 
# redis-cli HGETALL rfNoise_data:70:85:C6:33:9F:09 

# redis-cli HGET    rfNoise_data:70:85:C6:33:9F:09 counter
# redis-cli HMGET   rfNoise_data:70:85:C6:33:9F:09 counter cmtsValue
# redis-cli HEXISTS rfNoise_data:70:85:C6:33:9F:09 counter

# redis-cli CONFIG  GET    "*"
# redis-cli CLIENT  LIST
# redis-cli SLOWLOG RESET
# redis-cli SLOWLOG GET    25 
# redis-cli HMSET   myhash f1 HelloWorld f2 99 f3 -256
# redis-cli DBSIZE
# redis-cli BGSAVE
# redis-cli TIME   

alias oredishelp='     open http://redis.io/commands/hgetall'

# FLUSHALL redis keys:
# redis-cli -p 6379 keys "*" | awk ' {print $1}' | xargs redis-cli -p 6379 del
alias flushallkeysstag='redis-cli -h $red64 -p 6379 FLUSHALL  '
alias flushallkeys='    redis-cli                   FLUSHALL  '
alias jv_flush='        sshjv "redis-cli            FLUSHALL" '

# Monitor/Info redis keys:
alias redmo='           redis-cli                   MONITOR   '
alias redif='           redis-cli                   INFO      '

redismo () {   h=$1; h=${h:-localhost}; p=6379;                     redis-cli -h $h -p $p MONITOR ; }
redisif () {   h=$1; h=${h:-localhost}; p=6379;                     redis-cli -h $h -p $p INFO    ; }
alias rif62='  redisif $red62'
alias rif64='  redisif $red64'
alias rif21='  redisif $red21'

# All redis keys from redis-cli cmd:
akeyss () {    h=$1; h=${h:-localhost}; p=6379; echo Redis_keys_$h; redis-cli -h $h -p $p KEYS "*" |sort|cat -n; date ; }
akh () {       h=$1; h=${h:-localhost}; p=6379;                     redis-cli -h $h -p $p KEYS "*"     ; }
alias akh62='  akh   $red62'
alias akh64='  akh   $red64 '
alias akh21='  akh   $red21 '

# KEYS
akrh () {      h=$1; h=${h:-localhost}; p=6379;                     redis-cli -h $h -p $p KEYS "rf*"   ; }
alias akrh62=' akrh $red62'
alias akrh64=' akrh $red64 '
alias akrh21=' akrh $red21 '

# HGETALL
krf () {       rfk=$1; h=$2; h=${h:-localhost}; p=6379; echo $h $p; redis-cli -h $h -p $p HGETALL $rfk ; }

# Tails all keys of rfNoise
krl () {       n=0; for i in $* ; do ((n++));ech2 "$n ###$i ... " ; krf $i            ; done ; }
alias krtail=' krl    `akrh|tail|aoneline` '

krn () {       n=0; for i in $* ; do ((n++));ech2 "$n ###$i ... " ; krf $i $red64 6379; done ; }
alias kr64tail='kr64   `akrh64|tail|aoneline` '

krc () {       n=0; for i in $* ; do ((n++));ech2 "$n ###$i ... " ; krf $i $red21 6379; done ; }
alias kr21tail='kr21   `akrh21|tail|aoneline` '

# HGET details of counter or cmtsValue or timestamp
krcm () {     rfk=$1; h=$2; h=${h:-localhost}; p=6379;             redis-cli -h $h -p $p HGET    $rfk cmtsValue ; }
krco () {     rfk=$1; h=$2; h=${h:-localhost}; p=6379;             redis-cli -h $h -p $p HGET    $rfk counter   ; }
krts () {     rfk=$1; h=$2; h=${h:-localhost}; p=6379;             redis-cli -h $h -p $p HGET    $rfk timestamp ; }

krd () {      h=$1; h=${h:-localhost}; p=6379; echo redis host= $h $p; akrh $h $p |cut -d "\"" -f2 > ~/logs/krdetails_$h && for line in `cat ~/logs/akr_$h`; do ech2 "RFN key $line"; echo -ne counter = ; krco $line; echo -ne cmtsVal = ; krcm $line; echo -ne timestam= ;krts $line ; done ; }

##  grep dups
gdup () {          trLC|sort|uniq -d ; }

# MAC OSX version of Find Dupplicate Primary Key in /redisData route
#fdupPK () { b=$1; b=${b:-http://baymax-next.csv.comcast.com:3001/redisData}; curl -s $b |sed 's/},/}\'$'\n/g'|egrep -i "Primary Key\":\""| cut -d"," -f1 | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'| sort  | uniq -c|grep -v  11 ; }
#fdupPK () { b=$1; b=${b:-http://baymax-next.csv.comcast.com:3001/redisData}; curl -s $b |sed 's/},/}\'$'\n/g'|egrep -i "Primary Key\":\""| cut -d"," -f1 | trLC| sort | uniq -d ; }

##  grep from folders
fgbmx()   {    egrep -rinH $* $HOME/checkouts/[sm]*/*         | grep -v node_modules ; }

fbbl  () { osascript -e 'tell application "Terminal" to do script  "clear;echo hello; bbl     " ' ; }
fbbn  () { osascript -e 'tell application "Terminal" to do script  "clear;echo hello; bbn     " ' ; }
fbbc  () { osascript -e 'tell application "Terminal" to do script  "clear;echo hello; bbc     " ' ; }

#vs:  VarSource as of 08182016
#vs1       'IVR': 			ivrEnrichmentCache,
#vs2       'XH': 			ivrEnrichmentCache,	#XHUI US731562 
#vs3       'Internet Speed Experience':	ivrEnrichmentCache,
#vs4       'dotcom support': 		ivrEnrichmentCache,
#vs5       'XOD': 				vodEnrichmentCache,
#vs6       'STB': 				vodEnrichmentCache,
#vs7       'RFNoise': 			ivrEnrichmentCache,
#vs8       'XRAY': 				xrayEnrichmentCache,
#vs9       'moves assistant': 		ivrEnrichmentCache,
#vs10      ' DO': 			ivrEnrichmentCache,
#vs11      'XRE': 			ivrEnrichmentCache 	??? # enr should be as non-ivr
#vs12      FindReplace			ivrEnrichmentCache				
#vs13      Mobile Callback			enr as non-ivr
#vs14      TVNS					enr as nothing 
#vs15      XML                          ivr-like
#          ITG ???

### POST_AND_VERIFy
fpv3 () {    p=$1; jfile=$2; verEvtId=$3;           ($p $jfile |gcea;echo)|tee ~/logs/cea; sleep 2; while read -r l; do c=`$verEvtId   $l 200|tee ~/logs/t_$p_$jfile |wc -l` ; if [[ $c -gt 100 ]] ; then cat ~/logs/t_$p_$jfile; echo -n Pass; else echo -n FAIL; fi; echo -e "\t`dateT` \t test post_$p and verified_$verEvtId";echo; done < ~/logs/cea ; }
fpv30 () {   p=$1; jfile=$2; verEvtId=$3;           ($p $jfile |gcea;echo)|tee ~/logs/cea; sleep 2; while read -r l; do c=`$verEvtId   $l 200|tee ~/logs/t_$p_$jfile |wc -l` ; if [[ $c -gt 100 ]] ; then echo -n Pass; else echo -n FAIL; fi; echo -e "\t`dateT` \t test post_$p and verified_$verEvtId";echo; done < ~/logs/cea ; }

fpv0 () {    p=$1; p=${p:-fpil}; v=$2; v=${v:-epn}; ($p    |gcea;echo)|tee ~/logs/cea; sleep 2; while read -r l; do c=`$v   $l 200|tee ~/logs/t_$p |wc -l` ; if [[ $c -gt 100 ]] ; then echo -n Pass; else echo -n FAIL; fi; echo -e "\t`dateT` \t test post_$p and verified_$v"; echo;done < ~/logs/cea ; }

fpv () {     p=$1; p=${p:-fpil}; v=$2; v=${v:-epn}; ($p    |gcea;echo)|tee ~/logs/cea; sleep 2; while read -r l; do c=`$v   $l 200|tee ~/logs/t_$p |wc -l` ; if [[ $c -gt 100 ]] ; then cat ~/logs/t_$p; echo -n Pass; else echo -n FAIL; fi; echo -e "\t`dateT` \t test post_$p and verified_$v"; echo; echo; done < ~/logs/cea ; }

# watch /heartbeat route of Baymax next or curr for result
wrt () { rt=$1; secs=$2; secs=${secs:-60}; watch -n $secs -t " date && curl -s $rt > $HOME/tem/curlog && python -m json.tool $HOME/tem/curlog|grep result" ; }
alias wrtbn_hb='wrt $bn_hb'
alias wrtbc_hb='wrt $bc_hb'

# watch /info route of Baymax next or curr for build number and where the baymax points to 
wib () { rt=$1; watch -n 10 -t " date && curl -s $rt | cut -d: -f2,3,6  " ; }
alias wibn='watch -n 10 -t " date && curl -s $bn_if | cut -d: -f2,3,6  " '
alias wibc='wib $bc_if '

alias wihbn='watch -n 10 -t " date && curl -s $bn_if | cut -d: -f2,3,6  && date && curl -s $bn_hb > $HOME/tem/curlog && python -m json.tool $HOME/tem/curlog|grep -C3 result " '	
alias wihbc='watch -n 10 -t " date && curl -s $bc_if | cut -d: -f2,3,6  && date && curl -s $bc_hb > $HOME/tem/curlog && python -m json.tool $HOME/tem/curlog|grep -C3 result " '

hbl  () { cowsay "local baymax heartbeat: ";      curl -s $lh_hb | python -m json.tool ; }
chbn () { cowsay "staging baymax heartbeat: ";    curl -s $bn_hb | python -m json.tool ; }
chbc () { cowsay "production baymax heartbeat: "; curl -s $bc_hb | python -m json.tool ; }
hb () {   b=$1; b=${b:-next}; cowsay "baymax-$b heartbeat:"; curl -s http://baymax-$b.csv.comcast.com:3000/heartbeat > $HOME/tem/curlog && python -m json.tool $HOME/tem/curlog|egrep -A1 "result|Redis|ContextStore|Heartbeat|Meld|Group" ; }
alias hbn='hb next'
alias hbc='hb curr'

pbn () { curl -s $bn_if > $HOME/tem/build.txt ;  cowsay "Baymax-next points to: " && cat $HOME/tem/build.txt| cut -d: -f2,3|cut -d, -f1 |grep "baymax.*" ; }
pbc () { curl -s $bc_if > $HOME/tem/build.txt ;  cowsay "Baymax-curr points to: " && cat $HOME/tem/build.txt| cut -d: -f2,3|cut -d, -f1 |grep "baymax.*"; }

ebn () { curl -s $bn_if | tr '"' ' '|cut -d" " -f9 ; }
ebc () { curl -s $bc_if | tr '"' ' '|cut -d" " -f9 ; }

ibn () { cowsay -f stegosaurus "Baymax-next info: " && curl -s $bn_if | cut -d: -f2,3,6 | egrep "baymax.*smartconnect" ; }
ibc () { cowsay "Baymax-curr info: "                && curl -s $bc_if | cut -d: -f2,3,6 | egrep "baymax.*" ; }

rbn () { curl -s $bn_if | tr '"' ' '|cut -d"/" -f10 ; }
rbc () { curl -s $bc_if | tr '"' ' '|cut -d"/" -f10 ; }

### DEBUGS curl post directly, to debug if Baymax fails to post

#curl -H 'Accept: application/json' -H 'Content-Type: application/json' -d@OMP.json $lh_ev  | python -m json.tool
cpost () { e=$1; p=$2; curl -s -H 'Accept: application/json' -H 'Content-Type: application/json' "$e" -d@$p  ; }
cpl () {   p=$1; cpost $lh_ev $p ; }
cpn () {   p=$1; cpost $bn_ev $p ; }
cpc () {   p=$1; cpost $bc_ev $p ; }


##  curl post and verify
cpv0 () {   p=$1; p=${p:-cpil}; v=$2; v=${v:-epn}; ($p |gceaxm;echo)|tee ~/logs/cea; sleep 2; while read -r l; do c=`$v   $l 200|tee ~/logs/t_$p |wc -l` ; if [[ $c -gt 100 ]] ; then echo -n Pass; else echo -n FAIL; fi; echo -e "\t`dateT` \t test curl_post_$p and verified_$v"; echo;done < ~/logs/cea ; }

##  curl get for XRE, send to CS of VIP-groupA
xrel () {   a=$2; c=$1; l=$3; l=${l:-30}; curl -s  -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC" "http://scwbga-wc-ap-vip.cable.comcast.com/WebAPI/CDT.WebAPI.ContextStore/ContextStore/customers/$a/Incidents/$c/Events?limit=$l&detail=all" ; echo ; }
#xrel () {  a=$2; c=$1; l=$3; l=${l:-30}; curl -s  -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC" "http://scwbgc-wc-ap-vip.cable.comcast.com/WebAPI/CDT.WebAPI.ContextStore/ContextStore/customers/$a/Incidents/$c/Events?limit=$l&detail=all" ; echo ; }
xree () {   a=$3; c=$1; e=$2; lim=$4; lim=${lim:-200}; echo Searching event_id $e; xrel $c $a $lim | python -m json.tool | egrep -C80  "$c.$e"  ; date ; }

capis () {  a=$2; c=$1; l=$3; l=${l:-30}; curl -s  -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC" "http://wgtapp-wc-1u.cable.comcast.com/WebAPI/CDT.WebAPI.ContextStore/1511/2/0/ContextStore/customers/$a/Incidents/$c/Events?limit=$l&detail=all" ; echo ; }

# endpoint vip    
capiv () {  a=$1; c=$2; l=$3; l=${l:-30}; curl -s  -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC" "http://$4.cable.comcast.com/WebAPI/CDT.WebAPI.ContextStore/ContextStore/customers/$a/Incidents/$c/Events?limit=$l&detail=all" ; echo ; }

r_apis () { a=$1; l=$2; l=${l:-30}; curl -s  -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC" "http://scwbga-po-bp-vip.cable.comcast.com/WebAPI/CDT.WebAPI.ContextStore/ContextStore/customers/$a/Incidents?limit=$l&detail=all" ; echo ; }
r_apip () { a=$1; l=$2; l=${l:-30}; curl -s  -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC" "http://widgetexternal-a.g.cable.comcast.com/WebAPI/CDT.WebAPI.ContextStore/ContextStore/customers/$a/Incidents?limit=$l&detail=all" ; echo ; }


##  Curl Web API: given correlationid , accountnum and limit , then  search event_id in CS
epn () {    a=$3; c=$1; e=$2; lim=$4; echo Searching event_id $e; capis $c $a $lim | python -m json.tool | egrep -C90  "$c.$e"  ; dateT ; }
epc () {    a=$3; c=$1; e=$2; lim=$4; echo Searching event_id $e; capip $c $a $lim | python -m json.tool | egrep -C80  "$c.$e"  ; dateT ; }
epv () {    a=$3; c=$1; e=$2; lim=$4; vip=$5; echo Searching event_id $e; capiv $c $a $lim $vip | python -m json.tool | egrep -C80  "$c.$e"  ; dateT ; }

epva () {   a=$3; c=$1; e=$2;                    echo Searching event_id $e; capiv $c $a 200  $vipa| python -m json.tool | egrep -C80  "$c.$e"  ; date ; }
epvb () {   a=$3; c=$1; e=$2;                    echo Searching event_id $e; capiv $c $a 200  $vipb| python -m json.tool | egrep -C80  "$c.$e"  ; date ; }
epvc () {   a=$3; c=$1; e=$2;                    echo Searching event_id $e; capiv $c $a 200  $vipc| python -m json.tool | egrep -C80  "$c.$e"  ; date ; }

gcw () {    tr -s ' ' '\n' | grep $1 $2 ; }

gcea () {   tail -7 |            egrep -A2 correlation_id:|right:|cut -d "'" -f2|    tr '\n'   ' ' ; }
gceaxm () { tail -1 |tr ',' '\n'|egrep -A2 correlation_id | rev  |cut -d ":" -f1|rev|tr '\n\"' ' ' ; }

#gceaxm () { tail -1 |tr ',' '\n'|sed -ne 2,4p|rev|cut -d ":" -f1|rev|tr '\n\"' ' ' ; }

#alias gcea1='fpil | gcea; echo'
# fpil|i  tail -4 |head -3|right:|cut -d"'" -f2

# p3=`fpin|gcea;echo`; parr=( $(IFS=" " echo "$p3") );echo `echo ${p[0]}` `echo ${p[1]}` `echo ${p[2]}`

# for e in "${arr_lines[@]}"; do echo $e; done

# read file, store into array $ i=0; while IFS= read -r myarray[i++]; do :; done < t_fpxrec
# print the arry              $ for line in "${myarray[@]}"; do printf '%s\n' "$line"; done


##  End to end using API, query event_id in CS
# curl post: using API:  /smartconnect$ cpn test/test_data/enriched_payloads/OMP.json        
# curl get   using API:  /smartconnect$ epn c5e2888b-f897-4d46-82ed-565a77ea80ef 1a01e779-bcdd-40e9-8cf9-c4cf9a95d093 8499101410192154 200
headerx="Content-Type:application/xml"
headerj="Content-Type:application/json"
idheader="X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC"
qa54="8499101410192154"
qa29="8497404620452729"

##  Curl perf, option -w -o
#function perf { curl -o /dev/null  -s -w "%{time_connect} + %{time_starttransfer} = %{time_total}\n" "$1" }
wof="$HOME/Help/curl-format.txt"
wof2="$HOME/Help/curl-format2.txt"

cwhh () {      curl -w "@$wof"  "$1" -H "$headerj" -H "$idheader" ; }
# $ oterm cwhh http://scwbga-po-bp-vip.cable.comcast.com/webapi/cdt.webapi.contextstore/ContextStore/Customers/$qa54/Incidents?limit=10&detail=all
 
alias cw='     curl -w "@$wof" ' 

cw2  () {      curl -w "@$HOME/Help/curl-format2.txt" -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC" -s "$1" ; }

cws_good  () { a=$1; a=${a:-$qa54}; curl -w "@$wof2"  -H "$headerj" -H "$idheader" -s "http://scwbga-po-bp-vip.cable.comcast.com/webapi/cdt.webapi.contextstore/ContextStore/Customers/$a/Incidents?limit=10&detail=all" ; }

cws  () {      a=$1; a=${a:-$qa54}; ep="http://scwbga-po-bp-vip.cable.comcast.com/webapi/cdt.webapi.contextstore/ContextStore/Customers/$a/Incidents?limit=10&detail=all"; echo "Endpoint: $ep"; echo; curl -w "@$wof2"  -H "$headerj"           -H "$idheader" -s "$ep" ; }
#  Mon Mar 14 15:48:49 2016cw  http://wgtapp-wc-1u.cable.comcast.com/webapi/cdt.webapi.contextstore/ContextStore/Customers/8499101380346301/Incidents?limit=10&detail=all 

cw_o () {      curl -w "@$HOME/Help/curl-format.txt" -o /dev/null -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC" -s "$1" ; }

cpost_stg_cs () { pl=$1; pl=${pl:-no_metadata.json}; a=$2; a=${a:-$qa54}; echo "Payload= $pl , Account= $a , Endpoint= scwbga-po-bp-vip.cable.comcast.com";    curl -w "@$HOME/Help/curl-format2.txt" -X POST -d @$pl -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC"  -s "http://scwbga-po-bp-vip.cable.comcast.com/webapi/cdt.webapi.contextstore/ContextStore/Customers/$a/Incidents/Ingest" ; }
# curl -w "@$HOME/Help/curl-format2.txt" -X POST -d @test.json -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC"  -s "http://wgtapp-wc-1u.cable.comcast.com/webapi/cdt.webapi.contextstore/ContextStore/Customers/8499101380346301/Incidents/Ingest"

cpost_new_cs () { pl=$1; pl=${pl:-no_metadata.json}; a=$2; a=${a:-$qa54}; echo "Payload= $pl , Account= $a , Endpoint=scwbga-wc-ap-vip"; curl -w "@$HOME/Help/curl-format2.txt" -X POST -d @$pl -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC"  -s "http://scwbga-wc-ap-vip.cable.comcast.com/webapi/cdt.webapi.contextstore/ContextStore/Customers/$a/Incidents/Ingest" ; }

# curl http://baymaxkafkab01.sjc.i.sv.comcast.com:3100/status
# curl http://baymaxkafkab02.sjc.i.sv.comcast.com:3200/status


##  Curl MELD

meldH_char="charset:utf-8"
meldH_auth_prod="Authorization:Kj8FK3gKyT2yvN7q2FdMZAazW6w2VU"
meldH_auth_stag="Authorization:36c9af8ed7d846f18f0013f1d5b420f5"
meldH_auth_devlocal="Authorization:36c9af8ed7d846f18f0013f1d5b420f5"
meldH_ctype="Content-Type:application/octet-stream"

meldUrl_prod="http://meld-kafka.g.comcast.net:8080/kafka-gw/api/api/kafka/put/cxe_timeline_ivr_v0?access_token=Kj8FK3gKyT2yvN7q2FdMZAazW6w2VU"
meldUrl_stag="http://a-96-119-176-116.sys.comcast.net:8081/kafka-gw/api/api/kafka/put/cxe_timeline_ivr_v0?access_token=36c9af8ed7d846f18f0013f1d5b420f5"
alias cmeld=' curl -vvv -X POST  "$meldUrl_stag"   -H "$meldH_ctype" -H "$meldH_auth_stag"  -d@"test/test_data/enriched_payloads/OMP.json" '
meld_prod () { cdsc; p=$1; p=${p:-Bill}; echo POST $meldUrl_stag ; echo Payload $p.json ; curl -vvv -X POST "$meldUrl_prod"  -w "@$wof2" -H "$meldH_ctype" -H "$meldH_auth_stag" -H "$meldctheadr"  -d@"test/test_data/enriched_payloads/$p.json" ; }
meld_stag () { cdsc; p=$1; p=${p:-Bill}; echo POST $meldUrl_stag ; echo Payload $p.json ; curl -vvv -X POST "$meldUrl_stag"  -w "@$wof2" -H "$meldH_ctype" -H "$meldH_auth_stag" -H "$meldctheadr"  -d@"test/test_data/enriched_payloads/$p.json" ; }


##  CodeBig codebug TA1663903 https://rally1.rallydev.com/#/32352864245/detail/task/53170852856

codeb_stg="https://baymax-ingest-stg.codebig2.net/event"
codeb_prd="https://baymax-ingest-prod.codebig2.net/event"

alias ocodebsecret='open $HOME/checkouts/hl/codebig/*.txt'
alias ocodeb='   open https://codebig.comcast.com/secure/tools/codebug/ ;echo $codeb_prd; echo $codeb_stg; ocodebsecret '
alias ojv='     open http://codebeautify.org/jsonviewer'
alias ojview='  open http://www.jsoneditoronline.org/'
alias timeu2e='  open http://www.epochconverter.com/'

alias osplupdf=' open $HOME/checkouts/hl/splunk/Splunk-6.3.0-SearchTutorial.pdf'
alias osplusearch='open $HOME/checkouts/hl/splunk/adrian_searches.txt '
alias osplunk='  open  https://splunk.ccp.cable.comcast.com/ '
alias splu_odp=' open https://splunk.ccp.cable.comcast.com/en-US/app/search/odp_operational_metrics_dashboard?form.CLUSTER=green&form.HOST=green&form.SPAN=1h&earliest=0&latest= '
alias osplulate='open "http://splunk-search.sjc.i.sv.comcast.com:8080/en-US/app/search/baymax_smartconnect?earliest=0&latest=" '
#alias osplulate='open http://goo.gl/opFiiL'
#henry_lam@cc.c /NT ID ; /cimdef ; /cust
alias oslack='   open https://cim.slack.com/'
alias oldap='    open https://github.comcast.com'
alias oop5='     open https://op5-os1.sys.comcast.net/monitor/index.php/auth/login?uri=tac%2Findex'

alias owebmail=' open http://webmail.comcast.com'
# Outlook no mail: Cause1/ nw connection (CCemployee?); 2/ check credential (menu Tools>Accounts); 3/ WorkOffline (menu Tools); 4/ server running MS ExchangeServer is UNavailable (menu Tools>Accounts); 5/ req SSL? (menu Tools>Accounts>Adv>Server>Use SSL) 6/ req proxy server connect to MS ExcServer? (admin)

jxm="https://jenkins.awsxpc.comcast.net/view/Monitor/job/smoketest-n-1-on-amber-n"
jbrev () { b=$1; b={$1:-lastBuild}; curl -s http://ci2.csv.comcast.com/job/csv-smartconnect-x86_64-rel/$b/ |tr '[<>/\"]' ' '|egrep  "Revision.*" ; }
cjb () {   b=$1; b={$1:-lastBuild}; curl -s http://ci2.csv.comcast.com/job/csv-smartconnect-x86_64-rel/$b ; }
ojb () {   b=$1;                    open    http://ci2.csv.comcast.com/job/csv-smartconnect-x86_64-rel/$b ; }

alias rjblast='  rjb '
alias ojbconf='  ojb configure '
alias lastb='    ojb lastBuild '

alias jbfinished='   curl -s $jb_/lastBuild/console |grep Finished: '
jbn1ambern () { r=$1; curl -s $jst/$r/console |grep fail      ; }
alias lastbconsole=' cjb lastBuild/consoleFull | gjb '
alias gjb='          egrep "\(origin.*|Revision.*|NODE_ENV=|ERROR|error|Error:|Finished:|failing|failed|FAILURE$" '
alias glastbconsole='cjb lastBuild/consoleFull | gjb '

# open apps
#alias ows='     open -a WebStorm'                               # /usr/local/bin/wstorm
#visu () { f=$1; open -a "Visual Studio Code" --args  "$f" ; }
alias te='       open -a textedit '
#alias otvr='    open /Applications/TeamViewer.app '
#alias ojme='    open /Applications/join.me.app/   '
#alias opy='     open /Applications/PyCharmCE.app/ '
#alias ofacet='  open /Applications/FaceTime.app/ '
alias ophoto='   open /Applications/Photos.app/ '
alias ocamera='  open /Applications/Photo\ Booth.app/ '
alias oquickt='  open /Applications/QuickTime\ Player.app/ '
alias oAVrec='   open /Applications/QuickTime\ Player.app/ '

# open web apps
#alias orally='  open https://rally1.rallydev.com/slm/login.op '
ojt () { t=$1; t=${t:-XPC-3435}; echo "Browsing JIRA ticket $t"; open https://www.teamccp.com/jira/browse/$t ; }
alias oji='      open https://www.teamccp.com/jira/secure/Dashboard.jspa'
alias ojira='    open http://jira.csv.comcast.com/secure/Dashboard.jspa '
alias oconflu='  open https://www.teamccp.com/confluence/#all-updates'
alias osi='      open https://www.teamccp.com/confluence/display/SMARTINT'

alias obox='     open https://comcast.account.box.com/login'

alias ovnc='     open vnc://172.20.4.156 '
alias osmb='     open smb://10.172.52.221/Share'

alias ojenkin='  open http://ci2.csv.comcast.com'

alias teelog='   tee -a $HOME/logs/qa_$(date '+%Y.%m.%d').log '
alias osys='     ogh; ojb; orally;           osplunk ; okib_prod '
alias omai='     open http://mail.yahoo.com; open http://www.hotmail.com; open http://gmail.com '

### TEST_SPECIFIC 

#siup () {      echo IP + User + Pwd;  expect -c "set timeout 20; set user [lindex $argv 1]; set password [lindex $argv 2]; spawn ssh \"$user\@$ip\"; expect \"Password:\" send \"$password\r\"; interact " ; }
siup () {      echo IP + User + Pwd;  expect -c "set timeout 20; set user [lindex $argv 1]; set password [lindex $argv 2]; puts \"hello [lindex $argv 1] \"  " ; }

csvLines () {      wc -l $* ; }
csvCommaCount () { csvf=$1; perl -ne 'print tr/,//, "\n"' < $csvf      | sort -u ; }
csvSumHorizon () { csvf=$1; perl -ne '@a=split(/,/);  $b=0; foreach $r (1..$#a){ $b+=$a[$r] } print "$a[0],$b\n"' -f $csvf ; }
# $ cat sample.csv |perl -nle 'print length,"\t",$_ if 17 == length ' ;  OR length > 17 ; OR 18 > length

c2j () {           csvf=$1; python $HOME/proj/py/csv2json/c2j.py $csvf ; echo "Go check $(basename $csvf).json file" ; }
csv2json () {      python -c "import csv,json;      print json.dumps(list(csv.reader(open('$1'))), sort_keys=True, indent=4, separators=(',', ': ') )" ; }

csvCol () { python $HOME/proj/py/csvcolumn.py $1 ; }
#python csvcolumn.py < csv2json/sample.csv 2 ; cat csv2json/sample.csv|python csvcolumn.py 2
# csvCol  < csv2json/sample.csv 2;              cat csv2json/sample.csv | csvCol 2

csvFields () {     f=$1; col=$2; col=${col:-35}; r=$3; r=${r:-3}; for i in `seq $col`; do echo -ne "FIELD $i:  \t"; head -n $r $f |cut -d"," -f $i; done ; }
csvHdup () {       f=$1; head -1 $f | trUC|tr ',' '\n'|sort|uniq -d ; }      
csvView () {       f=$1; sed -e 's/,,/, ,/g' $f | column -s, -t | less -#5 -N -S ; }
#csvSed () {       sed -e 's/,,/, ,/g'    | column -s, -t | less -#5 -N -S ; }

# $csvCommaCOunt to get 15;  for i in `seq 15`; do echo -ne "$i:  \t"; head vod-credit-limit.csv|cutc -f $i; done
# prod_rules$ for i in `seq 7`; do echo -ne "$i:  \t"; head xray_enrich.csv|cutc -f $i; done
# for i in {1..3} ; do echo -ne "$i:  \t"; head findreplace_01_03_16.csv|cutc -f $i; done
# for i in `seq 10`; do echo -ne "$i:  \t"; head tvns.csv|cutc -f $i; done
# 

#Einstein_enrichment_file_20160927.csv  32 
grow () {  egrep -n "ITG764|ITG763|ITG762|ITG761|ITG729|ITG754" $1 ; }

##gmetadata () { egrep "metadata|payload" $* ; }

## test for fields that data type is defined as number 
gdtn () {   egrep -i "callTime|callDate|duration|ANI|cspIngestTime|unixTime|techETA|apptResch" $* ; }
gdta () {   egrep -i "callTime|callDate|duration|ANI|cspIngestTime|unixTime|techETA|apptResch|error|code|status|accountnum|CSGAcct|stPercentAvg|advDownSpeed|num_events_hour|num_events_month" $* ; }


##  AdminUI $ api=http://172.20.3.31:3000/# ; for a in index home overview dashboard userProfile mapping_rules_crud upload; do echo "##  $api$a "; curl $api$a; done
##  Test AdminUI $ api=$jv_:3000/# ; for a in index home overview dashboard userProfile mapping_rules_crud upload; do echo "##  $api$a "; open $api$a; done
# watch -t -n 15 "echo AdminUI; curl  http://172.20.3.31:3000/ ; date"

# $ cat check_db.sql #use test; show tables; select * from user; select count(*) from user; select * from mapping_type; select count(*) from mapping_type; exit
#hlam001c@smartconnect:~$ mysql -uroot --tee=test_au_mysql < check_db.sql > output.tab

alias oau='        open $jv_:3000 '

# $ cat check_db.sql #use test; show tables; select * from user; select count(*) from user; select * from mapping_type; select count(*) from mapping_type; exit
#alias jvmdb='      sshjv "mysql -v -uroot < check_db.sql > jvmdb.out ; cat -n jvmdb.out" '


##  Event-Factory  sendNotif with new (arch) bser
# start redis; optional redmon to monitor # stop sc
# start dispa: node bin/baymax_dispatcher
# at bser: . .bashrc ; startbser: node bin/baymax_server
# at bcli: . .bashrc ; startbcli: node bin/baymax-client -t rfnoise -r test_rules_05.json
# mon
# accountnum: Sita Panyam 8155100181471461 # Ranjit 8155100140021662 # Henry 8155100521885602 # Flavius 8499100090284083 # Flavius2 8499100022395742 # Kurt 8499102520136487 # Kurt2 8499102520136487
# at event-fact $ ./bin/uploader-tool -fp test/fixtures/test.csv
# at sc: post XH like payload
# check 201 + txt msg



### DATA_SCIENCE

alias lllog='     ls -lh $HOME/logs/*'
alias llvx='      ls -lh /var/xfer/*'
alias llupro='    ls -lh /home/bburg200/data/RAW_RECONNECT_UNPROCESSED/*'
alias llpro='     ls -lh /home/bburg200/data/RAW_RECONNECT_PROCESSED/*'

alias expy27='    source $HOME/.bash_profile  '
alias cdupro='    cd     /home/bburg200/data/RAW_RECONNECT_UNPROCESSED; pwd; date'
alias cdpro='     cd     /home/bburg200/data/RAW_RECONNECT_PROCESSED; pwd; date'
alias cdvx='      cd     /var/xfer/; pwd; date'
alias cdvd='      cd     /var/data/; pwd; date'
alias cdlogs='    cd     $HOME/logs; llrr;pwd;date'
alias cdrehadoop='cd     /home/bburg200/data/RECONNECT-HADOOP; pwd; date'

#alias pingds=' watch -t "ping -a -c 2 $ds_ip ;date " '

fvxlastdate () {  d=$1; cdvx; ls -lh; date;ls -lh |grep $d ; }
alias pyE='       cdrehadoop;     python readE.py & '
alias pyR='       cdrehadoop;     python readR.py & '
alias pyI='       cd ~/data/RECONNECT-HADOOP/ && y=`bash yest` && python readIVR.py    $y  2>&1 >> /var/data/logs/qa_IVR.log & '
alias pyS='       cd ~/data/RECONNECT-HADOOP/ && y=`bash yest` && python readSpeedT.py $y  2>&1 >> /var/data/logs/qa_SpeedT.log & '
alias pypro='     cdrehadoop; t1; python process.py ; t2'

##  if error* and recconect* file sizes are still > 10mb, then rerun readE.py and readR.py
alias pyEfailed=' e=`find ~/data/RAW_RECONNECT_UNPROCESSED/ -name err* -size -10M -ctime 0 -ls|wc -l` && [ $e -eq 0 ] && cd ~/data/RECONNECT-HADOOP/ && python readE.py 2>&1 >> /var/data/logs/qa.log & '

##  if there exists either IVR* of SpeedT* file size == 12 bytes, then correct them with readIVRFails.py or readSpeedTFails.py
alias pyIfailed=' i=`find ~/data/RAW_RECONNECT_UNPROCESSED/ -name IVR* -size 12c -ctime 0 -ls|wc -l` && [ $i -gt 0 ] && cd ~/data/RECONNECT-HADOOP/ && python readIVRFails.py    2>&1 >> /var/data/logs/qa_IVR.log & '
alias pySfailed=' s=`find ~/data/RAW_RECONNECT_UNPROCESSED/ -name Spe* -size 12c -ctime 0 -ls|wc -l` && [ $s -gt 0 ] && cd ~/data/RECONNECT-HADOOP/ && python readSpeedTFails.py 2>&1 >> /var/data/logs/qa_SpeedT.log & '

alias cronlast='  ll /var/spool/ | egrep "K.*\scron" && date && crontab -l  '
alias todayfiles='cnt=`find ./ -ctime 0 -ls|wc -l` && if [ $cnt -gt 1 ] ; then echo Yes_$cnt ; else echo Nope_$cnt; fi '
fispydone () {    s=$1; s=${s:-60}; while true; do pgrep -lf "python|RXBI"; pgrep -lf "python|RXBI"|wc -l; date; sleep $s; done; }
alias rmpro='     rm -f $HOME/data/RAW_RECONNECT_PROCESSED/[erIS]*'

alias ver12='     find ./               -size 12c   -ctime 0 -ls'
alias ver10m='    find ./               -size -10M  -ctime 0 -ls -name "err*" -or -name "rec*"'
alias ver10e='    find ./ -name "err*"  -size -10M  -ctime 0 -ls'
alias ver10r='    find ./ -name "rec*"  -size -10M  -ctime 0 -ls'

#alias wate='      watch -t "ls -ltrh err*|tail && date" '
#alias watr='      watch -t "ls -ltrh rec*|tail && date" '

ets () {          f=$1; dates `head -2 $f |cutc -f19|cut: -f3`; dates `tail  $f |cutc -f19|cut: -f3` ; }

alias subb='      h; sudo -u bburg200 -s'

#fvds () {      osascript -e 'tell application "Terminal" to do script  "clear;echo hello; vds|ftee vdata " ' ; }
fvds () {       ssh2; hterm grass "vds|ftee vdata"  ; }
alias vds='     sshds  "ls  -lh   /var/xfer   | grep `date -v-1d +%m_%d` ; df -h ; du -sh /var/xfer /backup/ " '
alias vds_log=' sshds  "cat -n    /var/data/logs/qa.log"'
alias vds_list='sshds "ls  -ltrh /var/data/logs/*"'

fvxs () {       cdvx; d=$1; y=$2 ; ll|egrep "$d";  date; e=err* ; ls -lSh $e|grep -C15 $y; date; i=IVR* ;ls -lSh $i|grep -C15 $y; date; s=SpeedT*.txt; ls -lSh $s|grep -C15 $y; date ; }
alias fvxs1='   fvxs "Feb 23" 02_2 '
#vdsvx () {    today=`date|awk '{print $2, $3}' `; yest=`date -d "1 day ago" '+%m_%d' `; ym=`date -d "1 day ago" '+%m`; yd=`date -d "1 day ago" '+%d`;echo "Yesterday=$yest"; echo "Today=$today"; ls -l /var/xfer|egrep "$ym.$yd" > vvx ; cat vvx; c=`wc -l vvx | awk '{print $1}' `; d=`grep -c "${today}" vvx`; y=`grep -c $yest  vvx`; e=`grep -c error vvx`; I=`grep -c IVR vvx` ; rec=`grep -c reconnect vvx`; S=`grep -c SpeedT vvx`; echo $c $d $y $e $I $rec $S; if [[ $d==$c && $y==$c && $e -gt 0 && $I -gt 0 && $rec -gt 0 && $S -gt 0  ]] ; then echo Passed; else echo "Failed, by `date`" ; fi ; df -h; }


# cspIngestTime   bburg200@bburg1:/var/xfer$ dates `head -1 IVR_2016_01_01.txt |tr '"' ' '|cutc -f30|cut: -f3`
# unixTime        bburg200@bburg1:/var/xfer$ dates `head -1 IVR_2016_01_01.txt |tr '"' ' '|cutc -f70|cut: -f2`
# convertu2d _ to -  /var/data/tem$ for f in `ls *_*`; do n=`echo $f|tr '_' '-'`; mv $f $n; done

# hochmeister: find . -iname "*.mp4" -print0 | xargs -0 mv --verbose -t /media/backup/

# Check if SpeedT is processed failed:
# SpeedT14="ipv6_upload_kbps cm_prov_dn_kbps ipv6_download_kbps cm_prov_up_kbps cm_adv_up_kbps ipv4_download_kbps ipv6_latency_ms ipv4_latency_ms cm_adv_dn_kbps ipv4_upload_kbps directly_connected cm_docsis_version region"
# for i in $SpeedT14; do echo $i:; head -1 SpeedT_2016_10_15.txt |egrep -io $i; done
# head -1 SpeedT_2016_10_15.txt|egrep -i "ipv6_upload_kbps|cm_prov_dn_kbps|ipv6_download_kbps|cm_prov_up_kbps|cm_adv_up_kbps|ipv4_download_kbps|ipv6_latency_ms|ipv4_latency_ms|cm_adv_dn_kbps|ipv4_upload_kbps|directly_connected|cm_docsis_version|region"


### ALIAS_FOR_COMMON_USE

alias a='alias'
alias clr='printf "\033c"'
alias cp='cp -i'

alias duh='  pwd; du -shc'
alias dush=' pwd; du -sh'
alias dusk=' pwd; du -sk'

alias sptd='      wget --no-check-certificate -O speedtest.py https://github.com/sivel/speedtest-cli/raw/master/speedtest_cli.py'
alias sptdr='     wget --no-check-certificate -O speedtest.py https://github.com/sivel/speedtest-cli/raw/master/speedtest_cli.py && python speedtest.py --share '

alias speedtest=' python $HOME/Help/speedtest.py --share | cat09 '
alias sptlog='    python $HOME/Help/speedtest.py --share | ftee1 speedtest_$(hostname) '
spt () {          echo WIFI: ; cwf; system_profiler SPAirPortDataType |egrep -A10 'Current Network Information:'  ; ifconfig|gip ; line;t1;speedtest|egrep 'load:.*s$'; t2;line ; }

alias gateway='   netstat -nr '
alias gm4='       egrep -i "[0-9a-z]{1,2}\:[0-9a-z]{1,2}\:[0-9a-z]{1,2}\:[0-9a-z]{1,2}\:[0-9a-z]{1,2}\:[0-9a-z]{1,2}" '
alias gmac='      egrep -i "([0-9a-z]{0,4}\:){5,7}[0-9a-z]{0,4}" '
alias gip='       egrep    "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" '
gii () {          p=$1; f=$2; if [ `egrep -co "$p" $f` -gt 0 ] ; then echo YES|grep YES; else echo Noooo|grep No; fi ; }

alias dnsgateway='cat /etc/sysconfig/network-scripts/ifcfg-eth0'
alias dnsip='     cat /etc/resolv.conf'
alias hostip='    cat /etc/hosts '
#dns1="69.252.80.80"
alias pingdns='   dnsip|grep nameserver|rights; pingf `dnsip|grep nameserver|tail -1|cuts -f2`|egrep -B5 "%.*"'

# Networksetup
# list HWport + DeviceName + EthernetAddress_MACAddr:  oterm networksetup -listallhardwareports; oterm networksetup -listallnetworkservices
# 1. an alias; 2. Automator: File>New>Service>nwu.workflow... Define a new service;  3.System Preferences > Keyboard > Shortcuts > Services 
alias nwu='   open /System/Library/CoreServices/Applications/Network\ Utility.app/'
alias nwpref='open /System/Library/PreferencePanes/Network.prefPane/'
#alias nwr='/etc/init.d/network restart; echo   Restarted_network_$(date) '
alias cwf='   networksetup -getairportnetwork en0 | right: '
alias cnw='   cwf; system_profiler SPAirPortDataType |egrep -A10 "Current Network Information:" '
#alias wifi='  networksetup -setairportpower airport '
#alias wificy='wifi off; wifi on; nwpref '
#alias wile='  networksetup -setairportnetwork en0 ' # wile CCemployee

alias cpuinfo='lscpu'
alias crlf=' file `find ./` |grep CRLF '

alias cut2c='cut -d ":"  '
alias cut:=' cut -d ":"  '
left:  () {  egrep  ".*:" ; }
right: () {  egrep  ":.*" ; }
lefts  () {  egrep  ".*\s" ; }
rights () {  egrep  "\s.*" ; }
catl () {    cat $1 | left: ; }
catr () {    cat $1 | right: ; }
alias cutc=' cut -d ","  '
alias cut,=' cut -d ","  '
alias cuts=' cut -d " "  '
alias cutdq='cut -d "\""  '
alias cutb=' cut -d "#"  '
alias cutd=' cut -d "."  '
alias cutff='cut -d "/"  '
alias cutp=' cut -d "|"  '
alias cutsc='cut -d ";"  '

alias ducc=' cut -d"," -f'
awducc () {  awk -v n=$1 -F"," '{print $n}'   ; }
awduc  () {  awk               '{print $1}'   ; }
awp () {     awk               '{print $'$1'}'; }

fduc1 () { awk  '{print $1}'  ; }

alias d='    date '
alias df='   df -h'

alias e='    echo '
alias echob='echo "*** echo BEGIN_at: `date` " '
alias echoe='echo "*** echo END_at: `date` " '
alias echod='terminal-notifier -title "Terminal" -message "echo Done with task!" -open http://www.yahoo.com '

# npm install commander; commander color: http://dailyjs.com/2012/03/08/unix-node-pipes/
alias cyellow=' $HOME/proj/nodejs/colour.js --yellow'
alias camber='  $HOME/proj/nodejs/colour.js --amber'
alias cblue='   $HOME/proj/nodejs/colour.js --blue'
alias cgreen='  $HOME/proj/nodejs/colour.js --green'
alias cred='    $HOME/proj/nodejs/colour.js --red '

alias catvet='cat -vet '
alias catco='egrep         -C1 [a-z]+ '
alias cat09='egrep         -C1 [0-9]+ '
catln () {   fileName=$1 ;  sed -n "$2p" $fileName ; }
catn () {    f=$1; line=$2; cat -n $f|egrep -C10 $2 ; }
# print line 4: sed -n '4p' file.txt; awk 'NR==4' file.txt;  perl -ne '$. == 4 && print && exit' 
# cat a file backwards: $ tac ~/fl_cmd
# catvet; expand f1_tab f2_spaces; unexpand

alias ge1='  sed -e 1,/ERROR/d |head '
#alias ge2=' sed -e /ERROR/,$d |head '
fge1 () {    err=$2; err=${err:-ERROR}; grep -B2 $err  $1 |head -3 ; cat -n $1 | sed -e 1,/$err/d |head -n20 ; }
# egrep '^.{9}A' file_name; perl -ne 'print if m/^.{9}A/' file_name
# print only match items:grep -o; awk 'match($0,/regexp/) {print substr($0,RSTART,RLENGTH)}' inputfile;  echo "hallo 123 kadflsdkal" | perl -ne '/(.*123)/ && print "$1\n";'
# print multiple matches: awk '/regexp/{for(i=1;i<=NF;++i)if($i~/regexp/)print $i}' /path/to/inputfile

alias ldir=' ls -ltra | egrep "^d" '
alias dir='  llr |egrep "^d" '
alias dirs=' find . -type d -d 1 -print0 | xargs -0 du -sc | sort -n '
#alias dir=' sudo find ./ -type d -ls '

alias l.='   ls -ld .* '
alias lR='   ls -Rh'
alias lh='   ls -tra | egrep "^\."'
alias lkh='  cat $HOME/.ssh/known_hosts | fduc1 '
alias ll='   ls -lh'
alias llR='  ls -lRh'
alias lla='  ls -ltrah'
alias llr='  ls -ltrh'
alias llrr=' ls -ltrh|tail '
alias lls='  ls -sh '
alias llss=' ls -lSh '
alias llsd=' sudo find ./ -type d -exec du -sb {} \; | sort -g '
alias llt='  ls -lth'

alias mv='   mv -i'
alias o='open '
alias p='pwd; ls -l'

alias pingf='  ping -a -c 2  '
alias ports='  netstat -tulan'

alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

alias py='python '

alias repeatls=' watch -t ls '

alias rm='     rm -i'
alias rmblank='sed "/^$/d;s/^[ \t]*//;s/[ \t]*$//" '
alias rmbline='sed "/^$/d" '

alias tree_='find . -type d | ls -lARG'

#alias t='tail'

alias tarextract=' tar   -xzf '
alias tarcompress='tar   -czf '
alias tarappend='  tar   -czfvr '
alias tarlist='    tar   -tzfv '
alias unziplist='  unzip -l '

#tarmcom () { m="$1"; cdvx; echo "Start compress ..."; t1; tarcompress /backup/2016_$m.tar.gz *_2016_$m_* ; t2; echo "list result: "; ls -ltr /backup ; }
#tarmapp () { yest=`date -d "1 day ago" '+%m_%d' `; m=`date -d yesterday '+%m'; cdvx; echo "Start append   ..."; t1; tarappend   /backup/2016_$m.tar.gz *_2016_$yest* ; t2; echo "list result: "; ls -ltr /backup ; }

ffnotexec () {  d=$1; d=${d:-.}; find $d -type f ! -perm -111 -ls ; }

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
#function fe() { find . -type f -iname '*'"${1:-}"'*' \ -exec ${2:-file} {} \;  ; }

# find . -type d -empty -exec touch {}/.ignore \; 
#findOlder () { find . -mmin -$((($(date "+%s") - $(stat -c %Y $1))/60)) -type f ; }
# find /path/to/files* -mtime +5 -exec rm {} \tee2=' tee ./tee_$(date +%Y.%m.%d_%H:%M).txt '
alias tlall='sudo find /var/log -type f -iregex .*[^.][^0-9]+ -not -iregex .*gz 2> /dev/null | xargs tail -n0 -f  '

alias u='    cd ..;ls; echo Current_dir is `pwd` '
alias cdu='  cd        ..;ls; echo Current_dir is `pwd` '
alias cdu2=' cd    ../..;ls; echo Current_dir is `pwd` '
alias cdu3=' cd ../../..;ls; echo Current_dir is `pwd` '

frep1 () {       while sleep 1;      do date;            $* ; echo ; done; }
frep () {        while sleep $1;     do date;  $2 $3 $4  $5 ; echo ; done; }
loop150 () { t1; for i in `seq 150`; do date; echo  $i:; $* ; echo ;            done; t2 ; } 
loop60 () {  t1; for i in `seq 6`;   do date; echo  $i:; $* ; echo ; sleep 60;  done; t2 ; } 
loop () {    t1; for i in `seq 5`;   do date; echo  $i:; $* ; echo ; sleep 5;   done; t2 ; } 
alias loopn='loop fpv0 fpil epn'                    
alias loopc='loop fpv0 fpic epc'

alias xwc='  xargs wc -l'
alias xcat=' xargs cat'
alias xhead='xargs head'
alias xllr=' xargs ls -ltra '

ffiles () {  n=0; for f in ./* ; do ((n++));ech2 $n; echo  "@ FILE: $f : "; $* $f; done ; }
fdirs ()  {  n=0; for d in ./* ; do pushd $d; pwd; $* ; popd; echo; done ; }

alias dynip='curl -s http://checkip.dyndns.org | grep "\d*\d" '


### USE_AWK_SED: http://sed.sourceforge.net/sed1line.txt

rmduplines () { cat $1 | awk '!NF || !seen[$0]++' ; }
awkfno () { awk         -F"," '{print $'$1'}'; }
fmax   () { awk -v n=$1 -F"," 'BEGIN {max = 0} {if ($n>max) max=$n} END {print max}' ; }
# fmax7 () { awk -F"," 'BEGIN {max = 0} {if ($7>max) max=$7} END {print max}' ; }
# avg: awk '{sum=sum+$1} END {print sum/NR}
rmdup () {  awk '!($0 in array) { array[$0]; print }' ; }

#s_join ()  { echo $@ | tr ' ' '_'  ; }
alias rmblank='sed "/^$/d;s/^[ \t]*//;s/[ \t]*$//" '
alias rmbline='sed "/^$/d" '

alias a_1line='grep -n -- "-1"'
alias a1line=' awk  1 $1 '
aoneline () { tr '\n' ' '  ; }
alias anline='perl -pe "s/,/\n/g" '
# alias anline=' sed -e  "s/,/\'$'\n/g" | cat '

# remove all leading whitespace: sed -e 's/^[ \t]*//' 
# double space: sed G; tripple space sed 'G;G'; Undo double space sed 'n;d'
# delete BOTH leading and trailing whitespace from each line sed 's/^[ \t]*//;s/[ \t]*$//'


## Back up

#fbak () {   filename=$1; cp $filename\{,.baki\} ;     ; ll|grep $1 ; }
fbu  () {    cp -rfp $1 ./$(date '+%Y_%m_%d_%H_%M')_$1 ; ll|grep $1 ; }
fori () {    cp -rfp $1 $1.ori                         ; ll|grep $1 ; }

cpwithtar () { src=$1; des=$2; cd $src ; tar cvf - ./* | (cd $des ; tar xvf - ) ; }


### USE_PYTHON

insMod () {      mod=$1; mod=${mod:-ipaddr}; pip2.7 install $mod ; } 
# Testing a new py script: /proj/py$ while read ; do python iDropped.py ; done
pystestloop () { pyscript=$*; while read ; do python $pyscript ; done ; }

# Testing ip
pyisip () { ip=$1; python -c 'import ipaddr,sys; print(ipaddr.ip_address(sys.argv[1]) ); ' ; }

# pip install sqlparse; echo "select a, b, c from table where a = 3;"| python -c "import sys;import sqlparse;print sqlparse.format(sys.stdin.read(), reindent=True, keyword_case='upper')"

# python -c "print 'this is a test'.title()"
# week number: python -c 'import datetime; print(datetime.date.today().isocalendar()[1])'
# $ node -p -e 'process.stdin.isTTY'
# python -c "print unichr(234)"
# convert hex to int    python -c "print int('c0ffee'    , 16)"
# convert               python -c "print int('12648430  ', 10)"
#pyh ()  {  python -c "import $1;   print help($1)" ; }
pyh ()   {  python -c "help( '$1' )" ; }
pyhq ()  {  echo q | pyh $1 ; }
pydoc () {  python -m pydoc $1 ; }
pyd ()   {  python -c "import $1;   print  dir($1)" ; }
pypath () { python -c 'import sys, pprint; pprint.pprint(sys.path)' ; }
#platf () { python -c "from sys import platform; print platform " ; } 
#python -c "import sys; print ''.join(x.capitalize() for x in sys.stdin)"  < names.txt
#python -m timeit "'-'.join(str(n) for n in range(100))"

#findOlder () { find . -mmin -$((($(date "+%s") - $(stat -c %Y $1))/60)) -type f ; }

# (echo "import sys" ; echo "for r in range(10): print 'rob'") | python
# python -c "exec(\"import sys\\nfor r in range(10): print 'rob'\")"

# print '\n'.join(line.split(":",1)[0] for line in open("/etc/passwd"))

##  Convert

dates    () { t=$1; echo $t " == " `date --date=@$1` ; }
dateu    () { t=$1; echo $t " == " `date -d             "$t" +%s ` ; }
macdates () { t=$1; echo $t " == " `date -r              $t `      ; }
macdateu () { t=$1; echo $t " == " `date -jf "%Y-%m-%d" "$t" +%s ` ; }
# date -j -f "%Y-%m-%d"       "2010-10-02"      "+%s"
# date -jf   "%Y-%m-%d %H:%M" "2011-11-13 08:11" +"%Y-%m-%d %H:%M"

h2d () {      echo $((0x$1)) ; }
d2h () {      printf '%x\n' $1 ; }

trUC () {     tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'   ; }
trLC () {     tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'   ; }

fgbz ()  {    grep -i $1 $2 $3 $4  $HOME/Help/bash_rcFiles/bashrc.zbra ; }
# print the last "cp" cmd: !cp:p

lastjsli () {    name=$1; tail -1  `ls -1 -th $name* | head -1` | python -m json.tool ; }
lastfili () {    name=$1; tail -1  `ls -1 -th $name* | head -1` ; }

lastline () {    sed '$!d' $1 ; }
lastfile () {    ls -At $1* |head -1 ; } 

lastlog () {     cd $HOME/logs; ls -ltrh |tail -1 ; }
lastloghead () { cd $HOME/logs; ls -tr   |tail -1|xargs head -20 ; }
lastlogmore () { cd $HOME/logs; ls -tr   |tail -1|xargs more     ; }
#fgelastlog () {  cd $HOME/logs; ls -tr   |tail -1|xargs tail -100f |grep -iE "error|IVR|rec|Speed|py" ; }

ffg () {       fn=$1; pat=$2; sudo find ./ -name $fn -exec grep -iH $pat {} \; ; }

ftee  () {     tee -a $HOME/logs/$1_$(date '+%Y.%m.%d').log ; }
ftee1 () {     tee    $HOME/logs/$(date '+%Y.%m.%d_%H.%M')_$1.log ; }

fman () { cmd=$1; man $cmd | col -b > $HOME/man_$1.txt; cat -n $HOME/man_$1.txt; ls -l $HOME/man_$1.txt  ; }

#alias nload1000='nload -t 1000'

# Windows: cat file > /dev/clipboard; cat /dev/clipboard > file
# pbcopy < file.txt; pbpaste; 
alias controlc='tee >(pbcopy)'
alias conc='pbcopy'
alias conv='echo `pbpaste` '
# cat A |xargs -i grep {} B|sort -u # comm sorted_A sorted_B

### USE_TERMINALS

hterm () { colour=$1; cmd=$2; bash $HOME/proj/shell/hterm.sh $colour $cmd ; }

oterm () { cmd=$*;   bash $HOME/proj/shell/oterm.sh "date;pwd;$cmd" ; } 
alias stag=' oterm fpvstag'
alias prod=' oterm fpvprod'
alias pstag='oterm fpAn   '
alias pprod='oterm fpAc   '

ftop   () { osascript -e 'tell application "Terminal" to do script  "clear;echo hello; top " ' ; }

#alias notifyDone='terminal-notifier -title "Terminal" -message "Done with task!" -open http://www.yahoo.com '

# port forwarding: from local:8888, to server90:80, thru adm1 hlam001c@CACSVML-15870:~$ ssh -L 8888:10.1.47.90:80 adm1
#pfw () { bash $HOME/proj/shell/hterm.sh  homebrew 'ssh -L 8888:10.1.47.90:80 adm1 ' ; }
repoBC7="http://127.0.0.1:8888/repos/Baymax/Centos/7/RPMS/x86_64/"
alias pfwd='ssh -L 8888:10.1.47.90:80 adm1 '

# launch port forwarding
pfw ()  {   hterm homebrew pfwd ; }

# test port forwarding
alias pfwt='open $repoBC7 && curl -s http://127.0.0.1:8888/repos/Baymax/Centos/7/RPMS/x86_64/|ftee1 pfwt1'


### VM_CENTOS 7 LINUX

# hostnamectl; rpm -qa centos-release; cat /etc/centos-release; cat /etc/redhat-release; cat /etc/system-release
# sudo yum install -y git; sudo yum install -y redis; sudo systemctl start redis.service; sudo service redis-sentinel start
# redis-cli ping; mon
# sudo yum install -y zeromq; rpm -qa zeromq; npm install zmq; sudo npm install bunyan


### UNIX_TIPS

# csplit ~/.bashrc /HELPERS/ /NAMING/ /DATA_SCIENCE/ /VM_CENTOS/ ; then cat xx0* > backtooriginalfile
# ~$ mkdir -p tmp OR ~$ if [[ ! -e ${HOME}/tmp ]]; then mkdir  ${HOME}/tmp ; fi OR ~$ [ -d tmp ] && echo "The directory exists" || mkdir tmp
# ip=129.252.30.192; IFS='.' eval 'array=($string)'; echo ${array[@]}
# $ for i in `cat ~/.ssh/known_hosts |gip -o|sort ` ; do echo -n $i: ; nslookup $i |egrep "name|NXDOMAIN"|cut -d'=' -f2|egrep .*com ; echo; done
# sum per column: awk '{s+=$1}END{print s}' <file>
# sum per row: 
# UNIX sequel or range: echo {01..10}; seq 10; seq 1 2 10; seq -w 5 10
# for j in `seq 0 255`; do for i in `seq 0 255` ; do seq -f "10.$j.$i.%g" 0 255 ; done ; done 
# echo {A,C,T,G}{A,C,T,G}{A,C,T,G} //Print all possible 3mer DNA sequence combinations
# uname -a; cat /etc/redhat-release; cat /etc/centos-release;
# cp data.{json,txt}
# substring $ s=1a2b3c ; echo ${s:(-4)}
# echo `date -d "1 day ago" '+%m'`; echo `date -d "1 day ago" '+%d'`;  echo `date -v-1d +%m`; echo `date -v-1d +%d`

# vi +18d +wq $HOME/.ssh/known_hosts; ssh-keygen -R <hostname>
# ssh user@server bash/python < /path/to/local/script.sh/py
# do_something.sh &> out.log ; do_something.sh >out.log 2>out.log

# basic calc, bc. $ echo $(expr 16 / 6 ); echo $(( 16 / 6 )); echo $[4433/60]
# sudo yum install expect;  ftp;  python-pip ; 
# sudo pip install python-googl
# npm      install zmq
# A && B: only check B, when A is true;  A || B : only check B, when A is false
# Russia $ [ $[ $RANDOM % 6 ] == 0 ] && echo Bang   || echo *Click*
# How much memory is Chrome sucking: $ ps -e -m -o user,pid,args,%mem,rss | grep Chrome | perl -ne 'print "$1\n" if / (\d+)$/' | ( x=0;while read line; do (( x += $line )); done; echo $((x/1024)) );
# Reserve range of lines 3..5, and remove the rest lines: $ perl -i -ne 'print if $. == 3..5' aaa.txt


### MACBOOKPRO_TIPS 

# ~/checkouts/bmx-qa/bmx$ opendiff bashrc_bmx bashrc_bmx.ori 
# brew install pkg-config; brew install zmq
# first-aid to verify healthy SSD: ~$ (brew install smartmontools;) smartctl -a disk0| egrep -i "fail|smart|pass"
# ~$ diskutil info disk0| egrep -C5 "SMART|Verified"
# Command + Option(Alt) + i     === view console
# Command + Shift       + i     === send email with url and information of the current page
# mac Z$ diskutil list; to list all thumb drives
# system_profiler SPAirPortDataType |egrep -A10 "Current Network Information:" '
# system_profiler -listDataTypes; system_profiler SPFirewallDataType; system_profiler SPPrintersDataType;
# sw_vers; softwareupdate --list
# csv2json$ textutil -convert html sample.json; OR textutil -cat html sample.json; textutil -convert txt *.doc
alias smartdisk='diskutil info disk0  | egrep -C5 "SMART|Verified"  '
alias smartSSD=' smartctl -a   disk0  | egrep -i  "fail|smart|pass" '
alias vcamera1='lsof  |head -1; lsof  | egrep -i  "AppleCamera|VDC" '
alias vcamera2='ps -ef|head -1; ps -ef| egrep -i  "AppleCamera|VDC" '
alias vcamera='vcamera1'


##  Adrian 
# for i in 5 6 10 13; do ip="10.1.47.$i"; echo "################ $ip ###"; ssh -t $ip "ls -l /opt/csv/etc/alternatives/smartconnect"; done
# curl -vvv -X POST -H 'content-type: application/json' -d@foo.json 'http://10.1.47.5:3000/event'`
# mm001c@CACSVML-15870:$HOME/Help$ mail -s test.bburg1 henry_lam@sv.comcast.com

##  hlam001c@CACSVML-15870:$HOME$ brew install MariaDB

# linux_sdev $ cat /etc/redhat-release ;  yum provides "*/g++"  ; sudo yum install gcc-c++
# linux sdev $ yum info redis; sudo yum update; repoquery --requires --resolve redis 
# linux sdev $ sudo yum install google-perftools-libs; sudo vi /etc/yum.repos.d/csv.repo (for all test, ser to 0);  sudo yum install redis;  
# linux sdev $ sudo service redis start; sudo service redis-sentinel start;
# linux sdev $ sudo chkconfig --level 2345 redis  on; sudo chkconfig --level 2345 redis-sentinel  on
# linux_sdev $ (new nvm + bunyan) curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash; source ~/.bashrc; nvm install 0.12.9; nvm list; {option: nvm alias default 0.12.9; cat ~/.nvm/alias/default } ; nvm use default; npm install -g bunyan; 

# linux sdev 36379 since geo needs redis port 36379: wget http://download.redis.io/releases/redis-3.2.3.tar.gz; tarextract xzf; cd redis-3.2.3/; make; make test; vi redis-3.2.3/redis.conf; to add in port 36379, instead of 6379; 
# linux sdev 36379 prepare monitor redis-3.2.3 for new geo as $ hlam001c@dev93:~/redis-3.2.3$ src/redis-cli -p 36379 -n 3 MONITOR ; OR redis-cli -p 6379 MONITOR | grep -Ev 'PING|PUBLISH" "__'
# linux sdev 36379 exec redis-3.2.3 for new geo as            $ redis-3.2.3/src/redis-server redis.conf 

# grep zmq package.json; npm install zmq; node bin/baymax-server &
# @bcli: $ unset NODE_PATH; unset NODE_ENV; . .bashrc; node bin/baymax-client -t rfnoise -r test_rules_05.json

##  Flavius API for CS
# Flavius: 012216: PROD:  http://widgetexternal-a.g.cable.comcast.com/ExtWidgets/ContextStore/ContextStore/GetIncidentContext?accountNumber=8220133034165544&details=snaphot&ConsumerID=F4D96842-B8A2-4560-A2F9-3A1BD046CD2B&output=JSON
# Flavius: A.Ingest Event: PUT: http://<servername>/webapi/cdt.webapi.contextstore/ContextStore/Incidents/<CorrelationID>/Events/<EventID>
# Flavius: B.Ingest Event: PUT: http://<servername>/webapi/cdt.webapi.contextstore/ContextStore/Customers/<AccountNumber>/Incidents/Ingest     #with CorrelationID creation on Ingest
# Flavius: C.Close Event: POST: http://<servername>/webapi/cdt.webapi.contextstore/ContextStore/Incidents/Close
# Flavius: D.Close EvtStatuGET: http://<servername>/webapi/cdt.webapi.contextstore/ContextStore/Incidents/Close/Status/<StatusID>
# Flavius: E.Get Top N Titles for an Account Number:                  GET: http://<servername>/Widgets/ContextStore/ContextStore/GetIncidentContext?accountNumber=<AccountNumber>&details=<DetailType>&limit=<LimitCount>&ConsumerID=<ConsumerID>&output=JSON
# Flavius: F.Get Top N Events for a CorrelationID  :                  GET: http://<servername>/Widgets/ContextStore/ContextStore/GetEventContext?accountNumber=AccountNumber&incident=<CorrelationID>&details=<DetailType>&limit=<LimitCount>&ConsumerID=<ConsumerID>&output=JSON
# Flavius: G.Get Top CorrelationID for Event Type and Account Number: GET: http://<servername>/Widgets/ContextStore/ContextStore/GetCorrelationIDContext?accountNumber=<AccountNumber>&errorType=<ErrorType>&ConsumerID=<ConsumerID>                                             
## webapi Mobile_Callback: http://widgetexternal-a.g.cable.comcast.com/ExtWidgets/ContextStore/ContextStore/GetIncidentContext?accountNumber=8499101390235528&details=snaphot&ConsumerID=F4D96842-B8A2-4560-A2F9-3A1BD046CD2B&output=JSON
## Adrian: result=null: `http://widgetexternal-a.g.cable.comcast.com/ExtWidgets/ContextStore/ContextStore/GetIncidentContext?accountNumber=1234567890123123&details=snaphot&&limit=100&ConsumerID=F4D96842-B8A2-4560-A2F9-3A1BD046CD2B&output=JSON`

#curlapi () { a=$1; a=${a:-8499101410192154}; e=$2; e=${e:-widgetexternal-a.g.cable.comcast.com}; curl "http://$e/ExtWidgets/ContextStore/ContextStore/GetIncidentContext?accountNumber=$a&details=snaphot&ConsumerID=F4D96842-B8A2-4560-A2F9-3A1BD046CD2B&output=JSON" | egrep -i "accountnum|event_id" ; }
 
# Sample CS API to PROD timeline: hlam001c@CACSVML-15870:$HOME$ curl -i -H "Content-Type:application/json" -H "X-consumer-id:RjREOTY4NDItQjhBMi00NTYwLUEyRjktM0ExQkQwNDZDRDJC" -X GET "http://172.24.17.35/ExtWidgets/ContextStore/ContextStore/GetIncidentContext?accountNumber=0958644794902&details=snaphot&limit=100&ConsumerID=F4D96842-B8A2-4560-A2F9-3A1BD046CD2B&output=JSON"

# # context-store-ng setup: yum search mongodb # sudo yum install mongodb-server mongodb # sudo service mongod start
# test mobile callback accountnum: Approaching High Effort Customer 8155400580834347 8220160140183251 8155400571040698 8497202485993906 8499052380550469 8499051460235041  8499100223787598 8497950055348972
# test mobile callback accountnum: Highly Impacted Customer 8499101380346301 
# test mobile callback accountnum: High Effort Customer 8499051640312769  0610513358804 8495600073924864 8495741200715393 8499102010079890 8495753103580097 8777703151095406 8498330080265674 8497950580003100

# incident.source: IVR, ITG, XRE, XOD, STB, XH, CEMP, timeline, "mobile callback", "internet speed experience", RFNoise, KC, null 
# accountnum:				IVR  			8495741500248509
# accountnum: 				ITG  			0956953580301   
# accountnum: 				XRE: 			0957748866410
# accountnum: 				RFNoise: 1551511622606, 8499051650239787, 0166824206303		
# accountnum: CEMP			XOD  			8495752542410551
# accountnum: 				STB  			qa29
# accountnum: XH			XH   			8778100020112414
# accountnum: CEMP 			CEMP				xxxx
# accountnum: 				Timeline 			8498310020278169
# accountnum: CSP			Mobile Callback 		8495753910471373
# accountnum:   			internet speed experience 8499052450150703 
# accountnum:                           XRAY notification	Sita Panyam 8155100181471461 # Ranjit 8155100140021662 # Henry 8155100521885602 # Flavius 8499100090284083 # Flavius2 8499100022395742

# change NTid pwd, use webmail.comcast.com; log in and retype (or wait to sync) accts:
# NTid reset: Outlook, PlaxoVPN, CCEmplyeeWifi, Timesheet, Jira, Confluence, Github clone-push, Keychain
# change pwd for keychain loging

# LDAP reset: hlam01_ld_P5: got [ Splunk, OP5, Jenkins?, RDKPortal?] 

# node -e "console.log(JSON.stringify(JSON.parse(process.argv[1]), null, '\t'));"  '{"foo":"lorem","bar":"ipsum"}'

# $ node -e "console.log(JSON.stringify(JSON.parse(require('fs').readFileSync(process.argv[1])), null, 4));"  filename.json 

#hlam001c@CACSVML-15870:~/checkouts/mapping-rules$ vun log_stdout > ~/temlg && f=~/temlg ; echo Start_time: `cat $f|sts` ; egrep "ECONNRESET|ETIMEDOUT|ENETUNREACH|ERROR" $f ; echo "End_time  :" `cat $f|sts tail`
# diskutil info disk0| egrep -i "fail|smart|pass|verif"

alias w2h='       open https://goo.gl/maps/3mU5Nybps632'
alias w2noi='     open https://goo.gl/maps/EQKr9SM9RF72 '
alias w2dai='     open https://goo.gl/maps/CB8P52LSk8Q2 '
alias w2tem='     open https://goo.gl/maps/zPmk69q7NW82'

#alias timesheet=' echo hlam001c; open http://budgetcomcast.budget.myshn.net/home/home.jsp'
alias timesh='    echo hlam001c; open http://budget.cable.comcast.com'
alias adp='       echo adphenrylam save34; open http://myAccess.adp.com'

alias e_v='       open https://goo.gl/kY9EoV '				
e2v  () {         open http://dictionary.cambridge.org/us/dictionary/english-vietnamese/$1 ; }
alias mdlink='    open https://www.mydlink.com/device#26298103'
alias kippbb='    open https://goo.gl/7BnUqU'

alias cccache='   echo chrome://settings/clearBrowserData'

alias godr='      open https://drive.google.com/drive/my-drive'


### Printers
PRT1="10.172.73.1"
PRT2="10.172.73.126"
PRTGREENLATERN="10.172.73.188"

###

TFTP_IP="10.255.246.110"
XMGR="96.118.36.213"

hostY="96.119.225.204"
hostA="96.119.227.212"
hostR="96.118.57.13"

licR="96.118.57.11   96.118.57.13   96.118.27.110 96.118.30.93"
licA="96.119.227.212 96.119.227.195 96.119.245.37 96.119.243.238 96.118.23.51   96.118.30.94"
licY="96.119.225.204 96.119.228.79  96.118.16.114 96.118.165.225 96.118.185.219"

GH="https://github.comcast.com"
GHX="https://github.comcast.com/xpcs"
CPRO_24="$HOME/devices/cpe/cpro_24.json"
CDEV_ec="$HOME/devices/cpe/cdev_ec.json"
M1="10868CEA6D24"
M2="044E5A9AE8EC"
CDEV_IP="10.255.244.34"
alias m2ip='      echo $M2 $CDEV_IP '

alias uipro='     open https://internet.xfinity.com/'
alias uidev='     open https://internet.xfinity.com/'
alias uistg='     echo SI_XPC_UID65/Csv1050xPC/Mac=10868CEA6D24; echo SI_XPC_UID49/Csv1050xPC CMMAC=5C8FE0A62F62; open https://internet.staging.xfinity.com/'

# Jenkins monitor jobs
alias jxm='       open https://jenkins.awsxpc.comcast.net/'

# Webex room
alias owebex='    open https://icollaborate.webex.com/meet/henry_lamcomcast.com'

# tail WebPA log
alias twlog='     tail -f /rdklogs/logs/WEBPAlog.txt.0 '

# god command
god () {          c=$1; c=${c:-red}; a=$2; a=${a:-core}; echo "color=$c, app=$a"; open http://repos.awsxpc.comcast.net/version/god_command_with_versions.py?color=$c\&app=$a ; }

### Xmanage shows servers ip, hostname xpccore*,  24=N, 13=N-1, 
alias oxmanage='open http://96.118.36.213:8000/api/v1/xmanage/env/list-new/red '
oxi () {       c=$1; c=${c:-red} ; open    http://96.118.36.213:8000/api/v1/xmanage/env/list-new/$c ; }
cxi () {       c=$1; c=${c:-red} ; curl -s http://96.118.36.213:8000/api/v1/xmanage/env/list-new/$c | python -m json.tool ; }

alias gN='     egrep -A4 "xpccore.*-[24]" '
alias g13='    egrep -A4 "xpccore.*-[13]" '

ipcore () {    echo red_list_core24_N:    ; cxi | egrep -A4 "xpccore.*-[24]"|grep ip|cut -d: -f2|cat09 ; echo amber_list_core24_N: ; cxi amber | egrep -A4 "xpccore.*-[24]"|grep ip|cut -d: -f2|camber; echo yellow_list_core24_N: ; cxi yellow | egrep -A4 "xpccore.*-[24]"|grep ip|cut -d: -f2|cyellow ; }

ipcoreN () {   c=$1; c=${c:-red}    ; echo core24_N_$c;   cxi $c | egrep -A4 "xpccore.*-[24]"|grep ip|cut -d: -f2       ;  }
ipcore13 () {  c=$1; c=${c:-yellow} ; echo core13_N-1_$c; cxi $c | egrep -A4 "xpccore.*-[13]"|grep ip|cut -d: -f2       ;  }

ipcoreR () {   echo red_list_core24_N:    ; cxi        | egrep -A4 "xpccore.*-[24]"|grep ip|cut -d: -f2|cred  ; }
ipcoreA () {   echo amb_list_core24_N:    ; cxi amber  | egrep -A4 "xpccore.*-[24]"|grep ip|cut -d: -f2|camber ; }
ipcoreY () {   echo yel_list_core24_N:    ; cxi yellow | egrep -A4 "xpccore.*-[24]"|grep ip|cut -d: -f2|cyellow ; }


### reboot, upgrade firmware:
rebootodh () {   m=$1; m=${m:-10868CEA6D24}; echo "1GO: link Open; 2MAC=$m right?; 3REBOOT: click Change Power State"; open http://dawg-house.cvs-a.ula.comcast.net:8080/dawg-house/webpa/?q=$m ; }
alias odh='      open http://dawg-house.cvs-a.ula.comcast.net:8080/dawg-house/webpa/'
#alias oistool='  open https://istools.sys.comcast.com/'
# hlam001c@cacsvlo-16686:~$ snmpget -v2c -c hDaFHJG7 10.255.244.80 1.3.6.1.2.1.1.1.0         | tr ';<<' '\n' | column -s: -t | grep SW_REV
# SNMPv2-MIB::sysDescr.0 = STRING: ARRIS DOCSIS 3.0 / PacketCable 2.0 Touchstone Residential Gateway <<HW_REV: 7; VENDOR: ARRIS Group, Inc.; BOOTR: 4.2.0.39; SW_REV: 10.0.145B.SIP.PC20.CT_TG1682_2.3p8s1_PROD_sey; MODEL: TG1682G>>

### cd
alias sxa='      subl ~/checkouts/xap'
alias sxt='      subl ~/checkouts/xpc-test'
alias cdxa='     cd   ~/checkouts/xap'
alias cdxt='     cd   ~/checkouts/xpc-test'
alias runat='    cd ~/checkouts/xpc-test/boxertest_client'
alias cdst='     cd   ~/checkouts/xap/smoketests/'
alias cdsts='    cd   ~/checkouts/xap/smoketests/test_xpc/xpc_tests'

fgsts () {       cdsts; grep -rin $* * ; }

# SAMPLE TO RUN SMOKETEST: python smoketest.py --mac 5C8FE07ED532 --cpe_ip 10.255.244.69 --log INFO --host 96.119.227.212:8080 --scheme http  --webpa https://scytale-rc.webpa.comcast.net:8090   --suites test_suites/xpc_tests/test_case_sns_notification
# run smoketest_xpc.py to run xpc apis in xap repo
alias obt='      open https://github.comcast.com/xpcs/xpc-test/tree/boxerclient/boxertest_client'

alias osts='     open https://github.comcast.com/xpcs/xap/tree/develop/smoketests/test_xpc/xpc_tests'
alias ost='      open https://github.comcast.com/xpcs/xap/tree/develop/smoketests'

alias oxa='      open https://github.comcast.com/xpcs/xap'
alias oxt='      open https://github.comcast.com/xpcs/xpc-test'

alias oapis='    open https://comcast.app.box.com/files/0/f/9067651730/1/f_76978037221'

alias cpro='     pjson  ~/devices/cpe/cpro_24.json | right: '
alias cdev='     pjson  ~/devices/cpe/cdev_ec.json | right: '
alias macp='     cpro | gc2 -i cmac'
alias macd='     cdev | gc2 -i cmac'
alias cdevip='   cdev | gc2 -i ip'
alias telcdev='  echo "pwd=arristi"; telnet 10.255.244.34'

gc2 () {         egrep $*|cut -d: -f2|tr ',\"' ' ' ; }
gnem () {        egrep "name:|endpoint:|method:|eq__:" ; }

### check association and get csid:
#isAssociate () {   m=$1; m=${m:-10868CEA6D24}; python -c "import sys,json,os,requests; print json.loads(requests.get('http://96.119.227.212:8080/api/v1/gateway-cpe/$m/association',cert='./client.pem',verify=False).text)" ; }
# $ curl -s -X GET http://$hostY:8080/api/v1/gateway-cpe/$M1/association|pjson
delc () {          m=$1; h=$2; curl -s -X DELETE http://$h:8080/api/v1/gateway-cpe/$m               |pjson ; }
isa () {           m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/association   |pjson ; }

isA () {           m=$1; m=${m:-10868CEA6D24}; h=$2; h=${h:-96.119.227.212}; u="http://$h:8080/api/v1/gateway-cpe/$m/association"; echo The MAC $m association verified with URL $u; python -c "import sys,json,os,requests; resp = json.loads(requests.get('$u',cert='./client.pem',verify=False).text); print json.dumps(resp)" | python -m json.tool ; }
gcsid () {       isA $1 $2 | gc2 csid ; }

alias isAY='    isA $M1 $hostY'
alias isAA='    isA $M1 $hostA'
alias isAR='    isA $M1 $hostR'
alias isA1='    isAY; isAA; isAR '

alias isA2Y='   isA $M2 $hostY'
alias isA2A='   isA $M2 $hostA'
alias isA2R='   isA $M2 $hostR'
alias isA2='    isA2Y; isA2A; isA2R '

alias isAall='  isA1; isA2 '

#gcsid () {      m=$1; m=${m:-10868CEA6D24}; h=$2; h=${h:-96.119.227.212}; u="http://$h:8080/api/v1/gateway-cpe/$m/association"; python -c "import sys,json,os,requests; resp = json.loads(requests.get('$u',cert='./client.pem',verify=False).text); print resp[\"data\"][\"xpc_csid\"] "  ; }
gdata () {       m=$1; m=${m:-10868CEA6D24}; h=$2; h=${h:-96.119.227.212}; u="http://$h:8080/api/v1/gateway-cpe/$m/association"; python -c "import sys,json,os,requests; resp = json.loads(requests.get('$u',cert='./client.pem',verify=False).text); print resp[\"data\"] "  ; }


### create new csid
#create_csid () { h=$1; h=${h:-96.119.227.212:8080}; u="http://$h/api/v1/gateway-configset"; echo For host $h, creating CSID with  URL $u; python -c "import sys,json,os,requests; print json.loads(requests.post('$u', cert='./client.pem', verify=False ).text)  " ; }
cr_csid () {    h=$1; h=${h:-96.119.227.212:8080}; u="http://$h/api/v1/gateway-configset"; echo "For host $h, creating CSID with  URL $u"; python -c "import sys,json,os,requests; resp= json.loads(requests.post('$u', cert='./client.pem', verify=False ).text) ; print json.dumps(resp, indent=4) " | python -m json.tool  ; }

### func a, b, c for Asso, onB, Clean
alias onb=' py ~/check_association.py '
alias onb=' py ~/onboard.py '
alias cac=' py ~/clean_ac.py '
amh () {    m=$1; h=$2; isA                 $m  $h    ; }
bmh () {    m=$1; h=$2; py ~/onboard.py     $m  $h    ; }
cacmh () {  m=$1; h=$2; py ~/clean_ac.py    $m  $h    ; }

### Modem device info
alias modIP='   echo "View cpro_24 device info at: General>Apps>NW modems and CM_MAC" ; open http://ip-edge-portal.cable.comcast.com/login.php'

### reminders
alias reminder_Mon_Yel='echo reminder_Mon_Yellow'
alias reminder_Wed_Gre='echo reminder_Wed_Green'
alias reminder_endSprint='echo "Check https://jenkins.awsxpc.comcast.net/view/red/job/smoketest-n-on-red* , or amber* , to find at least 1 job of N level, actually PASSED, before going to the next sprint" '

### firmware and tftp
alias sshtftp=' ssh root@10.255.246.110 '
alias vikey='   echo "Add in key of id_rsa.pub for non-pwd login"; vi ~/.ssh/authorized_keys'
alias lfw='     ls -ltra /var/www/html/images'

### clduser
#alias sshcld='   ssh clduser@96.118.61.26'
#ssh -i ~/.ssh/xpc-openstack-key.txt clduser@96.118.30.93 -t "date; hostname; sudo tail /var/log/yum.log"

### SHA: github and red_core
sshcore () {   coreip=$1; coreip=${coreip:-96.118.57.11}; ech2 $coreip; ssh -i ~/.ssh/xpc-openstack-key.txt clduser@$coreip                         ; }
runcore () {   coreip=$1; coreip=${coreip:-96.118.57.11}; ech2 $coreip; ssh -i ~/.ssh/xpc-openstack-key.txt clduser@$coreip -t "hostname; $2 $3 $4" ; }
hncore () {    h=$1; h=${h:-96.118.57.11}; runcore $h ; }

#hnR () {       while read hname ; do echo $hname; hncore $hname ; done <   $1  ; }
coresha () {   coreip=$1; coreip=${coreip:-96.118.57.13}; ssh -i ~/.ssh/xpc-openstack-key.txt clduser@$coreip -t "echo `seq  -f = -s '' 20 `; date; hostname; sudo tail -4 /var/log/yum.log" ; }
csha () {      coreip=$1; coreip=${coreip:-96.118.57.13}; ssh -i ~/.ssh/xpc-openstack-key.txt clduser@$coreip -t "echo `seq  -f = -s '' 20 `; date; hostname; yum info xap      " ; }
alias shared=' for i in 57.11 57.13 27.110 30.93 ; do coresha 96.118.$i ; done '

g_c () { cdxa; git pull 2> /dev/null; commit=$1; commit=${commit:-1}; gc=`git log -p -$commit | egrep -o "commit [0-9a-f]{7}" |cut -c8-14`; echo "GitHub xap repos: SHA=$gc"; echo; for i in $licR ; do echo -n red_core_$i: SHA=; cc=`curl -s $i:8080/api/v1/version|pjson|grep commit|tr ',\"' ' '|cut -d. -f4`; echo  $cc ; [ $gc != $cc ] && echo ">>>> NOT_matched `date` <<< " && echo ; done ; }
g_cA () { cdxa;git pull 2> /dev/null; commit=$1; commit=${commit:-1}; gc=`git log -p -$commit | egrep -o "commit [0-9a-f]{7}" |cut -c8-14`; echo "GitHub xap repos: SHA=$gc"; echo; for i in $licA ; do echo -n amb_core_$i: SHA=; cc=`curl -s $i:8080/api/v1/version|pjson|grep commit|tr ',\"' ' '|cut -d. -f4`; echo  $cc ; [ $gc != $cc ] && echo ">>>> NOT_matched `date` <<< " && echo ; done ; }

### boxer
alias insboxer='cdbx  ; echo Python should be 2.7; python setup.py develop'

### get version

gver () {      h=$1; curl -s -X GET http://$h:8080/api/v1/version|pjson|gc2 commit ; }
verR () {      for h in $licR ; do echo -n "red_core_$i: "; gver $h ; echo; done ; }
verA () {      for h in $licA ; do echo -n "amb_core_$i: "; gver $h ; echo; done ; }
verY () {      for h in $licY ; do echo -n "yel_core_$i: "; gver $h ; echo; done ; }

### API
#alias apixpc='open https://red.awsxpc.comcast.net/docs'
alias apixpc=' open http://96.119.227.212:8080/docs/#!/v1'
alias apiodp=' open http://96.118.27.12/docs/#!/v1'
oah () {      h=$1; open           http://$h:8080/docs ; }
cah () {      h=$1; curl -s -X GET http://$h:8080/docs/api-docs/api/v1|pjson|grep path  ; }

### CPE configuration
isc () {           m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/configuration    |pjson ; }

### API
acs () {      m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-configset               |pjson ; }
aws () {      m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/webpa_stat       |pjson ; }
adc () {      m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/device_class     |pjson ; }
agw () {      m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/gateways         |pjson ; }
ain () {      m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/initialization   |pjson ; }
asi () {      m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/sync_info        |pjson ; }
awp () {      m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/wifi_personalization |pjson ; }
apf () {      m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/post-factory-reset-action |pjson ; }


# run with $M2 and cdev_ip, test N on Red N-1, ex: https://jenkins.awsxpc.comcast.net/view/Monitor/job/smoketest-n-on-red-n-1/60817/consoleFull
# hlam001c@cacsvlo-16686:~/checkouts/xpc-test/boxertest_client$ /usr/bin/python2.7 smoketest-xpc.py --log INFO --scheme https --host red.awsxpc.comcast.net --webpa https://api.webpa.comcast.net:8090 --mac 044E5A9AE8EC --cpe_ip 10.255.244.34  --suites xpc_tests/sanity

dtd () {      m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/traffic_data?start_time=2017-03-31T16:57:47-07:00&end_time=2017-03-31T17:57:47-07:00&group=hour&delta=true&tz=PTZ" ; echo URL=$u; curl -s -X GET $u ; }
