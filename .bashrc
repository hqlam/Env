
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export PS1="\u@\h:\w\\$ "
export PATH=$PATH:.

### HELPERS

line () {      n=$1; n=${n:-80}; echo `seq  -f = -s '' $n ` ; }
ech2 () {      echo;echo $* ; }
alias h='      hostname | egrep  -C1 [a-z]+'
alias hn='     h; ifconfig | gip '

# Grep on history of cmd lines
alias ht='     history | tail -20 '
alias hist='   HISTTIMEFORMAT=%c'
fgh  ()  {     HISTTIMEFORMAT=%c ; history | egrep $*  ; }

fkp  () {      r=`ps -ef | grep $1 | grep -v grep |awk '{print $2}' ` ; if [ ! -z "$r" ]; then sudo kill  $r; fi ; }

fgbC ()   {    grep -i "$1" $2 $3 $4  ~/checkouts/hl/Env/bashrc_CSV ;}
fgbZ ()   {    grep -i "$1" $2 $3 $4  ~/checkouts/hl/Env/bashrc_ZBRA ;}
fgbH ()   {    grep -i "$1" $2 $3 $4  ~/checkouts/hl/Env/bashrc_H    ;}
alias vicC='   view   ~/checkouts/hl/Env/bashrc_CSV'
alias vicZ='   view   ~/checkouts/hl/Env/bashrc_ZBRA'
alias vicH='   view   ~/checkouts/hl/Env/bashrc_H   '
# Grep on file .bashrc
fgb  ()  {     egrep -i "$1" $2 $3 $4  $HOME/.bashrc ; }

alias vic='    vi        $HOME/.bashrc'
alias soc='    h; source $HOME/.bashrc'
alias soc0='   unalias -a && source $HOME/.bashrc '

# aliases for core nodes
alias vicore=' vi        $HOME/Help/bash_rcFiles/.core_bashrc'

# smoketest drivers
alias vidx='   vi        $HOME/checkouts/xpc-test/boxertest_client/smoketest-xpc.py'
alias vido='   vi        $HOME/checkouts/xpc-test/boxertest_client/smoketest-xpc.py'

# vi Splunk searches: 
alias visplunk='vi       $HOME/Help/splunk/hl_spl.txt '

# scp bashrc to core hosts
c2h () {       h=$1; scp ~/Help/bash_rcFiles/.core_bashrc  clduser@$h:~/ ; }
h2c () {       h=$1; scp clduser@$h:~/.bashrc             ~/Help/bash_rcFiles/.core_bashrc ; }
C2hk () {      for i in $lhkR $lhkA $lhkY; do ech2 $h; c2h $i ; done ; } 

alias grep='   grep    --color=auto'
alias egrep='  egrep   --color=auto'
#alias vifilerc='sudo vi /usr/share/vim/vimrc'

vion () {      filename=$1; old="$2"; new=$3; vi -bc ":%s/$old/$new/c|:q" $filename ; }
vid  () {      filename=$1; pat="$2";         vi -bc ":g/$pat/d|:q"       $filename ; }

vin  () {      filename=$1; num=$2;           vi      +$num               $filename ; }
vis  () {      filename=$1; pat=$2;           vi      +/$pat              $filename ; }

vinh () {      runh "vin $1 $2" ; }
vish () {      runh "vis $1 $2" ; }

vics () {      vis $HOME/.bashrc $* ; }
vih  () {      cmd=$*; bash $HOME/proj/shell/hterm.sh basic  vis $cmd ; }

# Timing
alias t1='     starttime=$(date +"%s")'
alias t2='     date; echo seconds=$(($(date +"%s")-$starttime)) | egrep "=[0-9]+" '

alias dateT='  date    "+%FT%T"'
alias dateU='  date -u "+%FT%T"'

datems () {    node -e 'console.log(new Date().getTime())' ; }
alias now='    echo UTC: `dateU`|cat09; echo Now: `dateT`|cat09 '

##  Print Json
alias pjson='  python -m json.tool'

### ALIASES_AND_FUNCTIONS

# tcl expect
sup () {       s=$1; u=$2; p=$3; ~/proj/tclex/ssh.exp $s $u $p ; }
siup () {      echo IP + User + Pwd;  expect -c "set timeout 20; set user [lindex $argv 1]; set password [lindex $argv 2]; puts \"hello [lindex $argv 1] \"  " ; }

# scp rsync cmds
#96.118.54.192 $ scp  -i /opt/xpc-openstack-key.pem.cer /tmp/cpe_devices_summary$day.csv clduser@96.118.59.197:/tmp/
#96.118.54.192 $ ssh  -i /opt/xpc-openstack-key.pem.cer  root@96.118.59.197 "rm -rf /tmp/cpe_devices_summary$day.csv"
rsy () {       mid=$3; mid=${mid:-10.1.2.3}; tarhost=$1; f=$2; rsync -av -e "ssh $mid ssh" $tarhost:~/$f  ~/ ; }
rsy2sdev () {  f=$1; p=$2; rsync -v $f  172.20.3.178:~/$p   ; }
scpfsdev () {  pf=$*;      scp   -r hlam001c@172.20.3.178:~/$pf   . ; }

# web share a local folder
ipad () {      python -c 'import socket; print (socket.gethostbyname(socket.gethostname())); ' ; }
webshare () {  p=$1; p=${p:-5777}; ech2 `ipad`:$p; python -m SimpleHTTPServer $p ; }
alias pyshare='echo Will share at localhost port 8888; python -m SimpleHTTPServer 8888 & '

alias ipdrop=' python $HOME/proj/py/iDropped.py |cat09'
ipdr () {      python -c 'import socket; print ("IP=", socket.gethostbyname(socket.gethostname()) , "If IP==127.0.0.1, Then Internet connection was dropped."  ) ' ; }

# cd cmds
alias cdthum=' cd /Volumes && ls -ltr '
alias cdapps=' cd /Applications/'

alias cddesk=' cd $HOME/Desktop/'
alias cddoc='  cd $HOME/Documents/'
alias cddown=' cd $HOME/Downloads/'

alias cddrop=' cd $HOME/Dropbox/; ls -ltra'
alias cdbox='  cd $HOME/box_sync; ls -ltra'

alias cdhelp=' cd $HOME/Help/;p'
alias cdbash=' cd $HOME/Help/bash_rcFiles;p'
alias cdDaniel='cd $HOME/Help/Daniel;p'
alias cdsplunk='cd $HOME/Help/splunk;p'
alias cdsi='   cd $HOME/Documents/si'

alias cdlogs=' cd $HOME/logs/; ls -ltraF|tail'
alias cdpy='   cd $HOME/proj/py'
alias cdsh='   cd $HOME/proj/shell'

alias oarch='  open /Users/hlam001c/Google\ Drive/cc/si/xpc/xpc_architecture.pptx '
alias cddoca=' cd ~/Documents/si/api_docs; open ~/Documents/si/api_docs'
alias cdbx='   cdco; cd boxer '

alias cdco='   cd $HOME/checkouts;h'
alias cdhl='   cd $HOME/checkouts/hl; llr '
alias cdvb='   cd $HOME/checkouts/hl/verify_bugs; llr '
alias cdtodo=' cd $HOME/checkouts/hl/todo       ; llr '
alias cdenv='  cd $HOME/checkouts/hl/Env; llr '
alias cdsplu=' cd $HOME/checkouts/hl/splunk/ '
alias cddevop='cd $HOME/checkouts/si/devops'

### TIG_COMMANDS
#   brew install tig; tig --help; tig //current branch;
#   tig  grep hlam; --all //allbranches; develop //a specific branch; ; test..develop //diff between; 
#   tig  refs             //all references like branches, remotes and tags
#   git  show |tig ; git log | tig;
#   tig  blame file ; tig master ; tig test..master; tig myFile; tig v0.0.3:README
alias t1w='       tig --all  --since=1.week -- '

### GIT_COMMANDS

gith () {         git help $* ; }

# Save fragments: git stash; then later:  git stash pop; list; drop
gitsc () {        commit=$1; git show                            $commit ; }

alias d_h='       co_d && echo ****Develop: `git show develop|grep Date:` ; co_h && echo ****henry  : `git show henry  |grep Date:` '

alias d_m='       co_d && echo ****Develop: `git show develop|grep Date:` ; co_m && echo ****Master : `git show master |grep Date:` '
alias m_d='       co_m && echo ****Master : `git show master |grep Date:` ; co_d && echo ****Develop: `git show develop|grep Date:` '

# git log --no-merges -p 1.12.0..v1.13.0 |egrep -A4 "^commit" # git log --since="2 days ago"
gitlastcommit () { git pull; commit=$1; commit=${commit:-1}; git log -p -$commit ; }
gitlastcom () {    git pull 2> /dev/null; commit=$1; commit=${commit:-1}; git log -p -$commit | egrep "commit [0-9a-f]{7}" |cut -c8-14 ; }

# recent commits
git1lmerge () {   git pull;                       git log --oneline --graph ; }
gitoneline () {   git pull;                       git log --pretty=oneline ; }

# grep text from git_log
gitgl () {        git pull;                       git log |egrep -i "$1" $2  ; }

# Review history: show history of a file
gitfilehist () {  f=$1 ; git pull;                git log -p -- $f ; }
alias gitfilehist2='                              git log -p --since="7 days ago" '
alias gitll='     echo "*LATEST LOG ... :";       git log |head -7;  echo '
gitdirhist () {   for f in `ls`; do echo  `gitfilehist $f|head -5|grep Date` $f ; done ; }
gitdirsort ()   { gitdirhist > ~/fh; cat ~/fh | sort ; rm -f ~/fh ; }
#gitdirsort ()  { for f in `ls`; do echo  `gitfilehist $f|head -5|grep Date|cut: -f2` $f ; done > ~/fh; cat ~/fh|sort ; }

# file history with tig command
catt () {         f=$1;  tig blame $f ; }

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

alias newxa='     cdxa   && gitp'
alias newxt='     cdxt   && gitp'
alias newxtm='    cdxtm  && gitp'

# reset upstream: git branch mamobile_fields_ivr --set-upstream-to origin/develop
#                 git rebase upstream/master
# alias gitpm='   git pull   origin master'
# alias gitpd='   git pull   origin develop'
alias gitpusho='  git push   origin ' 

### XPC check-in process
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

co_b () {         bORc=$1; bORc=${bORc:-master} && git checkout $bORc; date && echo ___NEW_PULL__&& git pull ; }
alias co_d='      co_b develop '
alias co_m='      co_b master '
alias co_h='      co_b henry  '

alias co_bx='     cdxt;    ech2 co_xt_boxerclient branch...; co_b boxerclient'
alias co_ma='     cdxtm;   ech2 co_xt_master  branch...;     co_m '

#alias co_henry='  cdxa;    pwd;cbr;ech2 co_henry       branch...; co_b henry      '

alias co_resetd=' git reset --hard origin/develop; date; gitst '
alias co_reset='  git reset --hard;                date; gitst '

# Refactor filenames: rm, mv; #git mv [file-ori] [file-renamed]
alias gitrm='     git rm --cached '

# List files # git ls-files --other --ignored --exclude-standard
alias gitlist='   git ls-files'

# Open github ogh
# all $gs= (pulls; commits; branches; releases; tags; compare; contributors; issues )
# branches/all; branches/yours; branches/active; tree/develop;  pull/3/files; pull/3/commits; pull/new/develop; compare/develop...csv_082316; 
oghh   () {                                         open https://github.comcast.com/xpcs/xap/tree/henry ; }
oghqlam () {                                        open https://github.com/hqlam/ ; } 

# Open ogh
ogh  () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt ; }

ogc () {                      rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/commits ; }
ogcp () {                     rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/compare ; }
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
ogcc  () { commit=$1;         rt=$2; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/commit/$commit?diff=split ; }

# open ogh compare
cpbran () { branch=$1;        rt=$2; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/compare/$branch  ; }
ogcp  () {                    rt=$1; rt=${rt:-xap}; open https://github.comcast.com/xpcs/$rt/compare/$2...$3 ; }

# xpc-test $              cat .git/config url = git@github.comcast.com:xpcs/xpc-test.git
#gcln () {                repo=$1;git clone git@github.comcast.com:xpcs/$repo ; } 
#alias clonexap='         cdco && gcln xap.git  '
#alias renewxap='         cdco && [[ -d xap ]]  && sudo mv -f xap   hl/xap_$(date '+%Y.%m.%d.%H.%M.%s')   && clonexap && cdxa && date; git branch -vv ; git log |head -7 '
gitcln () {               repo=$1; repo=${repo:-xpc-test}; git clone https://github.comcast.com/xpcs/$repo ; }

alias cdredis='           cd /app/redis/bin/     ; ls -ltr '
alias r-c='               /app/redis/bin/redis-cli '
alias status_serv='       service redis status '

##  Get JSON values of keys, subkeys

pjkey () {                python -c "import json,sys; print json.load(sys.stdin)['$1'] " ; }
pk2   () {                python -c "import json,sys; ol=json.load(sys.stdin); print ol['status']; od=json.dumps(ol);print od; print (json.dumps(ol), sort_keys=True, indent=4 ); print ol['data']['moca_enabled'] " ; }
#                         python -c "import json,sys; print json.load(sys.stdin)['payload'] "
#                         python -c "import json,sys; obj=json.load(sys.stdin);print obj['payload'] "
function getJsonVal2 () { python -c "import json,sys;sys.stdout.write(json.dumps(json.load(sys.stdin)$1, sort_keys=True, indent=4))"; }
function getJsonVal () {  python -c "import json,sys;sys.stdout.write(json.dumps(json.load(sys.stdin)$1))"; }

##  redis keys, value, subkeys 
getkey () {    redis-cli get $1 | python -m json.tool ; }
allk () {      redis-cli KEYS "*"  |sort ; }

##  Pull ERROR from log_stdout
IWE="INFO|WARN|ERROR"

### REDIS-CLI_COMMANDS

# redis-cli INFO | egrep "^db|connected|role|mem"
# redis-cli MONITOR
# redis-cli --version  
# redis-cli --stat   
# redis-cli --scan   
# redis-cli KEYS    map*; redis-cli KEYS rf*; redis-cli KEYS  "*" ; echo keys map*|redis-cli
# redis-cli DEL     testing_key
# redis-cli FLUSHALL           

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

alias oredishelp='   open http://redis.io/commands/hgetall'

# Monitor/Info redis keys:
alias redmo='        redis-cli          MONITOR   '
alias redif='        redis-cli          INFO      '

# cowsay -l;   for more pics
cowS () {      cowsay -f stegosaurus " DONE! $1 : `date` " ; }
cowT () {      cowsay -f turtle      " info: " ; }

gcw () {       tr -s ' ' '\n' | grep $1 $2 ; }
j122 () {      tr "\'"  "\"" ; }

headerx="Content-Type:application/xml"
headerj="Content-Type:application/json"

alias ojp='     open http://jsonpath.com/'
alias ojv='     open http://codebeautify.org/jsonviewer'
alias ojview='  open http://www.jsoneditoronline.org/'
alias timeu2e=' open http://www.epochconverter.com/'

#s_red=""
#s_com=""
# Reset XPC Red Splunk: sshcor to root@96.119.99.46; cd /opt/splunk/bin/; ./splunk stop; ./splunk clean eventdata; ./splunk start 
sshrx () {      sshcor 96.119.99.46 ; }
resetrx () {    runcor 96.119.99.46 /root/reset_splunk.sh ; }
# XPC Red Splunk: @slack odp-devops; marked 060917; ssh root@96.119.99.46; /root/reset_splunk.sh
# root@96.119.99.46 [root@xpcsplunk-wcdcb-1d-ops ~]# find / -iname splunk
# splunk query on os_rx sync_Red:    index=smart_internet syncnotification 5C8FE0D3C508 SYNC_NOTIFICATION
# splunk query on os_rx sync_Amber:  index=smart_internet syncnotification 3C7A8A376BCC SYNC_NOTIFICATION
# splunk query on os_rx sync_Yellow: index=smart_internet syncnotification 5C8FE0CF3F2E SYNC_NOTIFICATION

# splunk amberr 500 index=smart_internet cluster=amber   "internal server error" | stats count values(host) AS host by cluster

### Green sync: At Prod Splunk> Dashboards /sync > Sync Report https://splunk.ccp.cable.comcast.com/en-US/app/search/syncnotification?form.field1.earliest=-24h%40h&form.field1.latest=now&form.span=1d
#from_webpa       		     index=smart_internet  "*SYNC_NOTIFICATION"  source = *scytale.log* 

#webpa_to_hook    		   1 index=smart_internet cluster=green X-Webpa-Event:SYNC_NOTIFICATION host = xpchook*  source=*webserver.log 
#sync_notif_hook_to_kafka    	   2 index=smart_internet cluster=green  message_type=MSG_SYNC_STATUS host=xpchook* source=*producer.log  
#sync_notif_kafka_to_spark 	   3 index=smart_internet cluster=green  "message-type : HCPE-Sync-Status" host=xpcsprkw* NOT message_type=transactionStatusMessage 
#spark_to_sync (to xpc fr sprk consumer)4 index=smart_internet  "Submitting the sync status message to xpc host" host=xpcsprkw-ch2* OR host=xpcsprkw-ho* OR host=xpcsprkw-as* NOT host=*red* NOT host=*yellow* NOT host=*amber*

#(Sync msg process by xpc nodes)   5 index=smart_internet host=xpcsync* cluster=green path=*syncnotification request_end=1  
#(Sync succ processed by xpc nodes 6 index=smart_internet host=xpcsync* cluster=green path=*syncnotification request_end=1  status_code=200
#(Sync failed proc by xpc nodes)   7 index=smart_internet host=xpcsync* cluster=green path=*syncnotification request_end=1  status_code>200 
#(notif from webpa to hooks by cmc) table: (cmc, count, %) 
# ex for the cmc=544 	           8 index=smart_internet cluster=green  host = xpchook*  X-Webpa-Event:SYNC_NOTIFICATION source=*webserver.log  cmc=544
# cmc=1 16 32 33 48 128 129 160 161 176 289 516 528 560 640 656 672 768 896


alias os_rx_report='   echo "u:p=admin:changeme";   open http://96.119.99.46:8000/en-US/app/search/reports'
alias os_rx_dash='     echo "u:p=admin:changeme";   open http://96.119.99.46:8000/en-US/app/search/dashboards'
alias os_rx='   echo "u:p=admin:changeme";          open http://96.119.99.46:8000/en-US/app/search/search?q=search%20index%3Dsmart_internet%205C8FE0D3C508&display.page.search.mode=smart&earliest=-60m%40m&latest=now&sid=1492824317.4 '
alias os_ro='   echo "u:p=admin:changeme";          open http://96.118.29.46:8000/en-US/app/search/search'

alias os_sync=' echo "u:p=xpc_splunk:XPC_$plunk123";open https://splunk.ccp.cable.comcast.com/en-US/app/search/syncnotification '
alias os_dash=' echo "u:p=xpc_splunk:XPC_\$plunk123";open https://splunk.ccp.cable.comcast.com/en-US/app/search/dashboards '
alias os_='     echo "u:p=xpc_splunk:XPC_\$plunk123";open https://splunk.ccp.cable.comcast.com/en-US/app/search/search '
alias os_LDAP=' echo "u:p=hlam01:LDAP login;        open https://splunk.ccp.cable.comcast.com/ '

alias splu_odp='open https://splunk.ccp.cable.comcast.com/en-US/app/search/odp_operational_metrics_dashboard?form.CLUSTER=green&form.HOST=green&form.SPAN=1h&earliest=0&latest= '

#Jira; Conf; github; git pull; slack; outlook henry_lam@cc.c /NT ID ; magneto; 
#Howto change NTid pwd: 1/on wired 2/Open system pref > User & Groups > Change pwd  3/(still on wired network) logout/log in back/restart/wait/cross-finger
alias oslack='  open https://cim.slack.com/messages'
alias oldap='   open https://github.comcast.com'
alias oop5='    open https://op5-os1.sys.comcast.net/monitor/index.php/auth/login?uri=tac%2Findex'

# Outlook no mail: Cause1/ nw connection (CCemployee?); 2/ check credential (menu Tools>Accounts); 3/ WorkOffline (menu Tools); 4/ server running MS ExchangeServer is UNavailable (menu Tools>Accounts); 5/ req SSL? (menu Tools>Accounts>Adv>Server>Use SSL) 6/ req proxy server connect to MS ExcServer? (admin)

#cjb () {   b=$1; b={$1:-lastBuild}; curl -s http://ci2.csv.comcast.com/job/csv-smartconnect-x86_64-rel/$b ; }
#alias lastbconsole=' cjb lastBuild/consoleFull '
#alias gjb='          egrep "\(origin.*|Revision.*|NODE_ENV=|ERROR|error|Error:|Finished:|failing|failed|FAILURE$" '
#alias glastbconsole='cjb lastBuild/consoleFull | gjb '

# open apps
alias te='     open -a textedit '
alias opm='    open ~/Applications/Chrome\ Apps.localized/postman.app '
alias opy='    open /Applications/PyCharm\ CE.app/ '
alias ofacet=' open /Applications/FaceTime.app/ '
alias ophoto=' open /Applications/Photos.app/ '
alias ocamera='open /Applications/Photo\ Booth.app/ '
alias oquickt='open /Applications/QuickTime\ Player.app/ '
alias oAVrec=' open /Applications/QuickTime\ Player.app/ '

### Jira filters:
# 17.7.1:      project in (XPC, ODP) AND status in (Open,'Reopened','In Progress', 'BLOCKED', 'Blocked') AND assignee = hlam001c AND sprint in (17.7.1) ORDER BY assignee ASC
# project      in ("Operational Data Platform", "xPC Platform", "Cross Platform Services") AND sprint = 17.3.2 AND assignee not in (ddicke001c, mabrah200, kpatel205, sthang001c, kshea200, jthuru200) AND Status not in (Resolved, Closed) ORDER BY assignee ASC
# project      in (ODP,XPC)
# sprint       = 17.3.2  ; in openSprints()
# status       in (Open, Reopened, Blocked, Closed, Resolved, "At Risk", "In Progress")
# assignee     = currentUser() 
# Priority     = P0
# reporter     in (vmiran200, aubale200, dsunde001c, hlam001c) 
# resolution   = Unresolved
# issuekey     in issueHistory() 
# reporter     = hlam001c   OR  assignee    = currentUser() ORDER BY Priority DESC
# text         ~ "Security"      ORDER BY createdDate DESC ; ORDER BY updated DESC
# summary      ~ "Security"
# issuetype    != "Epic Story"

### JIRA       
ojtx () {      t=$1; t=${t:-3435}; echo "Browsing JIRA XPC ticket $t"; open https://ccp.sys.comcast.net/browse/XPC-$t ; }
ojto () {      t=$1; t=${t:-2380}; echo "Browsing JIRA ODP ticket $t"; open https://ccp.sys.comcast.net/browse/ODP-$t ; }
alias ojtf='   echo "Browsing JIRA filter $t";                  open https://ccp.sys.comcast.net/issues/?jql=  '

alias assnqa=' echo "assigned to QA to verify";   open https://ccp.sys.comcast.net/issues/?filter=74509'
# assignee in  (vmiran200, aubale200, dsunde001c, hlam001c, rsitar200) AND project in ("Operational Data Platform", "xPC Platform") ORDER BY createdDate DESC
alias cur4qa=' echo "available 4 qa to verify";   open https://ccp.sys.comcast.net/issues/?filter=74508'
# Status in    (Resolved) AND sprint in (openSprints()) AND project in ("Operational Data Platform", "xPC Platform") ORDER BY createdDate DESC

#alias curPlate='open https://ccp.sys.comcast.net/issues/?filter=74507'
alias curHenry='open https://ccp.sys.comcast.net/issues/?filter=73351'

# reporter    = currentUser() OR assignee = currentUser() ORDER BY Priority DESC
alias curSpr=' open https://ccp.sys.comcast.net/secure/RapidBoard.jspa?rapidView=2846&selectedIssue=XPC-3480&quickFilter=12617'
 

# old alias    oji='open https://www.teamccp.com/jira/secure/Dashboard.jspa'
#alias ojid='  open https://ccp.sys.comcast.net/secure/Dashboard.jspa '
alias oji='    open https://ccp.sys.comcast.net/browse/XPC '
alias ojira='  open http://jira.csv.comcast.com/secure/Dashboard.jspa '

# is Jira up?
alias iju='    open https://onejira.cable.comcast.com/up '

### Confluence
alias oconflu='open https://www.teamccp.com/confluence/#all-updates'
alias osi='    open https://www.teamccp.com/confluence/display/SMARTINT'

# open web apps
alias obox='    open https://comcast.account.box.com/login'
alias odropbox='cddrop; open Screenshots'
alias osmb='    open smb://10.172.52.221/Share'
alias owebmail='open http://webmail.comcast.com'

# Smmoketest agent/slave/build nodes
SMO_SLAVES="96.118.63.53 96.118.63.54 96.118.63.55 96.118.63.60 96.118.63.251 96.118.27.124"
projTied () {  for i in $SMO_SLAVES ; do echo `date`; echo -n  "===== $i : "; runcor $i "cd /opt;ls -ltra;ls|wc;" ; done ; }
hprojTied () { runh projTied ; }

alias oprojTired='open https://odpjenkins.awsxpc.comcast.net/computer/smoketest-server-96.118.63.54/'
alias ojenodes='  open https://odpjenkins.awsxpc.comcast.net/computer'

alias oje='    open https://odpjenkins.awsxpc.comcast.net'
alias ojenkin='open http://ci2.csv.comcast.com'

#alias osys='  open $jxm;ojid; curPlate '
alias omai='   open http://mail.yahoo.com; open http://www.hotmail.com; open http://gmail.com '

### TEST_SPECIFIC 

csvLines () {      wc -l $* ; }
csvCommaCount () { csvf=$1; perl -ne 'print tr/,//, "\n"' < $csvf      | sort -u ; }
csvSumHorizon () { csvf=$1; perl -ne '@a=split(/,/);  $b=0; foreach $r (1..$#a){ $b+=$a[$r] } print "$a[0],$b\n"' -f $csvf ; }

c2j () {           csvf=$1; python $HOME/proj/py/csv2json/c2j.py $csvf ; echo "Go check $(basename $csvf).json file" ; }
csv2json () {      python -c "import csv,json;      print json.dumps(list(csv.reader(open('$1'))), sort_keys=True, indent=4, separators=(',', ': ') )" ; }

csvCol () {        python $HOME/proj/py/csvcolumn.py $1 ; }
csvFields () {     f=$1; col=$2; col=${col:-35}; r=$3; r=${r:-3}; for i in `seq $col`; do echo -ne "FIELD $i:  \t"; head -n $r $f |cut -d"," -f $i; done ; }
csvHdup () {       f=$1; head -1 $f | trUC|tr ',' '\n'|sort|uniq -d ; }      
csvView () {       f=$1; sed -e 's/,,/, ,/g' $f | column -s, -t | less -#5 -N -S ; }

### ALIAS_FOR_COMMON_USE

alias a='         alias'
alias clr='       printf "\033c"'
alias cp='        cp -i'

alias duh='       pwd; du -shc'
alias dush='      pwd; du -sh'
alias dusk='      pwd; du -sk'

alias speedtest=' python $HOME/Help/speedtest.py --share | cat09 '
alias sptlog='    python $HOME/Help/speedtest.py --share | ftee1 speedtest_$(hostname) '
spt () {          echo WIFI: ; cwf; system_profiler SPAirPortDataType |egrep -A10 'Current Network Information:'  ; ifconfig|gip ; line;t1;speedtest|egrep 'load:.*s$'; t2;line ; }
ospt () {         oterm "line;t1;speedtest|egrep 'load:.*s$'; t2;line; echo WIFI: ; cwf; system_profiler SPAirPortDataType |egrep -A10 'Current Network Information:' " ; }


alias gmac4='       egrep -i "[0-9a-z]{1,2}\:[0-9a-z]{1,2}\:[0-9a-z]{1,2}\:[0-9a-z]{1,2}\:[0-9a-z]{1,2}\:[0-9a-z]{1,2}" '
alias gmac:='     egrep -i "([0-9a-z]{0,4}\:){5,7}[0-9a-z]{0,4}" '
alias gmac='      egrep -i "[0-9a-z]{12}" '

alias gip='       egrep      "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" '
alias gipo='      grep  -Eo  "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" '
alias gip6='      egrep -i   "[a-f0-9:]+" '
gii () {          p=$1; f=$2; if [ `egrep -co "$p" $f` -gt 0 ] ; then echo YES|grep YES; else echo Noooo|grep No; fi ; }

alias gateway='   netstat -nr '
alias dnsgateway='cat /etc/sysconfig/network-scripts/ifcfg-eth0'
alias dnsip='     cat /etc/resolv.conf'
alias pingdns='   dnsip|grep nameserver|rights; pingf `dnsip|grep nameserver|tail -1|cuts -f2`|egrep -B5 "%.*"'

alias nslu='      nslookup '

alias hip='       hostname -i'
alias hostip='    cat /etc/hosts '

# Networksetup
# 1. an alias; 2. Automator: File>New>Service>nwu.workflow... Define a new service;  3.System Preferences > Keyboard > Shortcuts > Services 
alias nwu='    open         /System/Library/CoreServices/Applications/Network\ Utility.app/'
alias nwpref=' open         /System/Library/PreferencePanes/Network.prefPane/'
alias cwf='    networksetup -getairportnetwork  en0   | right: '
alias cnw='    cwf; system_profiler SPAirPortDataType | egrep -A10 "Current Network Information:" '
alias wifi='   networksetup -setairportpower    airport '

alias mon='    ech2 "Monitor process status and jobs running ..."; ps -ef|egrep "webshare|python|tail"; jobs; date '
alias quepasa="ps auxwww"

left:  () {    egrep  ".*:" ; }
right: () {    egrep  ":.*" ; }
lefts  () {    egrep  ".*\s" ; }
rights () {    egrep  "\s.*" ; }
catl () {      cat $1 | left: ; }
catr () {      cat $1 | right: ; }

# cut last field: awk '{$NF=""}1'
# cut field 1:    sed 's/[^:]*://' OR cut -d: -f2-
alias cutf1='  cut -d:    -f2- '
alias cut:='   cut -d ":"  '
alias cut,='   cut -d ","  '
alias cut.='   cut -d "."  '

alias cuts='   cut -d " "  '
alias cutb='   cut -d "#"  '
alias cutp='   cut -d "|"  '
alias cutsc='  cut -d ";"  '
alias cutbf='  cut -d "\""  '
alias cutff='  cut -d "/"  '

#alias ducc='   cut -d"," -f'
alias duc='    cut -d" " -f'

apfield () {   awk               '{print $'$1'}'; }
fduc   () {    awk -v n=$1 -F"," '{print $n }'  ; }
fduc1 () {     awk               '{print $1 }'  ; }
alias lkh='    cat ~/.ssh/known_hosts | fduc1 '

alias d='      date '
alias df='     df -h'

alias e='      echo '
alias echob='  echo "*** echo BEGIN_at: `date` " '
alias echoe='  echo "*** echo END_at: `date` " '
#alias echod='  terminal-notifier -title "Terminal" -message "echo Done with task!" -open http://www.yahoo.com '

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

f2y () {       f=$1; mv $f $f.yaml; ls -ltra; pwd ; }
viy () {       f2y $1 ; vi $1.yaml ; }

alias catco='  egrep         -C1 [a-z]+ '
alias cat09='  egrep         -C1 [0-9]+ '
catln () {     fileName=$1 ;  sed -n "$2p" $fileName ; }
catn () {      f=$1; line=$2; cat -n $f|egrep -C10 $2 ; }

alias ge1='    sed -e 1,/ERROR/d |head '
fge1 () {      err=$2; err=${err:-ERROR}; grep -B2 $err  $1 |head -3 ; cat -n $1 | sed -e 1,/$err/d |head -n20 ; }

alias ldir='   ls -ltraF | egrep "^d" '
alias dir='    llr -F |egrep "^d" '
alias dirs='   find . -type d -d 1 -print0 | xargs -0 du -sc | sort -n '

alias l.='     ls -ld .* '
alias lR='     ls -Rh'
alias lh='     ls -tra | egrep "^\."'
alias lkh='    cat $HOME/.ssh/known_hosts | fduc '
alias ll='     ls -lhF'
alias llR='    ls -lRh'
alias lla='    ls -ltrahF'
alias lsr='    ls -trh'
alias llr='    ls -ltrh'
alias llrr='   ls -ltrhF|tail '
alias lls='    ls -sh '
alias llss='   ls -lShF '
alias llsd='   sudo find ./ -type d -exec du -sb {} \; | sort -g '
alias llt='    tree -L 1 '
alias tre1='   tree -L 1 '
alias tre2='   tree -L 2 '
alias lsp='    ls -p '

alias mv='     mv -i'
alias o='      open '
alias p='      pwd; tree -L 1 '

alias ping62=' ping6   -c2  '
alias pingf='  ping -a -c 2  '
alias ports='  netstat -tulan'

alias py='     python '
alias py27='   python2.7 '

alias repeatls='watch -t ls '

alias rm='     rm -i'
alias rmblank='sed "/^$/d;s/^[ \t]*//;s/[ \t]*$//" '
alias rmbline='sed "/^$/d" '

alias tree_='  find . -type d | ls -lARG'

alias tarextract=' tar   -xzf '
alias tarcompress='tar   -czf '
alias tarappend='  tar   -czfvr '
alias tarlist='    tar   -tzfv '
alias unziplist='  unzip -l '

ffnotexec () {  d=$1; d=${d:-.}; find $d -type f ! -perm -111 -ls ; }

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

alias u='       cd ..;ls; echo Current_dir is `pwd` '
alias cdu='     cd        ..;ls; echo Current_dir is `pwd` '
alias cdu2='    cd    ../..;ls; echo Current_dir is `pwd` '
alias cdu3='    cd ../../..;ls; echo Current_dir is `pwd` '

frep1 () {      while sleep 1;      do date;            $* ; echo ; done; }
frep () {       while sleep $1;     do date;  $2 $3 $4  $5 ; echo ; done; }
#loop150 () {   t1; for i in `seq 150`; do date; echo  $i:; $* ; echo ;            done; t2 ; } 
loop6 () {      t1; for i in `seq 6`;   do date; ech2 "Loop $i:"; bash -ic $* ; echo ; sleep 60;  done; t2 ; } 
loop () {       t1; for i in `seq 5`;   do date; ech2 "Loop $i:"; bash -ic $* ; echo ; sleep 5;   done; t2 ; } 

# use xargs cmd
alias xwc='     xargs wc -l'
alias xcat='    xargs cat'
alias xhead='   xargs head'
alias xllr='    xargs ls -ltra '

# loop files, loop dirs in a directoy
ffiles () {     n=0; for f in ./* ; do ((n++));ech2 $n; echo  "@ FILE: $f : "; $* $f; done ; }
fdirs ()  {     n=0; for d in ./* ; do pushd $d; pwd; $* ; popd; echo; done ; }

# NW dynamic IP
alias dynip='   curl -s http://checkip.dyndns.org | grep "\d*\d" '

##  grep dups
gdup () {       trLC|sort|uniq -d ; }

### USE_AWK_SED: http://sed.sourceforge.net/sed1line.txt
rmduplines () { cat $1 | awk '!NF || !seen[$0]++' ; }

awkfno () {     awk         -F"," '{print $'$1'}'; }
fmax   () {     awk -v n=$1 -F"," 'BEGIN {max = 0} {if ($n>max) max=$n} END {print max}' ; }
rmdup () {      awk '!($0 in array) { array[$0]; print }' ; }

alias rmblank='      sed "/^$/d;s/^[ \t]*//;s/[ \t]*$//" '
alias rmbline='      sed "/^$/d" '

a1line () {          tr '\n' ' '  ; }
alias anline='       perl -pe "s/,/\n/g" '

rmLeadingSpace () {  sed -e 's/^[ \t]*//' ; } 
rmTrailingSpace () { sed -e 's/[ \t]*$//' ; } 
rmSpace () {         sed -e 's/^[ \t]*// ; s/[ \t]*$//' ; } 
doubleSpace () {     sed G ; }
trippleSpace () {    sed 'G;G'; }
undodoubleSpace () { sed 'n;d' ; } 

## Back up
fbu  () {        cp -rfp $1 ./$(date '+%Y_%m_%d_%H_%M')_$1 ; ll|grep $1 ; }
fori () {        cp -rfp $1 $1.ori                         ; ll|grep $1 ; }

cpwithtar () {   src=$1; des=$2; cd $src ; tar cvf - ./* | (cd $des ; tar xvf - ) ; }


### USE_PYTHON
# print file extention: print '~/python/one-liners.py'.split('.')[-1]
# yum install -y facter
#/app/xap/conf/instance_config.py: import os; HOST_IP = os.popen('ifconfig eth0 | grep "inet\ addr" | cut -d: -f2 | cut -d" " -f1').read().strip()
insMod () {      ech2 "Install module $1"; mod=$1; mod=${mod:-ipaddr}; pip2.7 install $mod ; } 

# Testing a new py script: just enter to re-run script once
pystestloop () { pyscript=$*; while read ; do python $pyscript ; done ; }

# Testing ip
# def validate_ip(my_ip): p=my_ip.split(".") ; return len(p)==4 and all( 0<= int(i) < 256 for i in p)' 
pyisip () {      ip=$1; python -c 'import ipaddr,sys; print(ipaddr.ip_address(sys.argv[1]) ); ' ; }

titleUp () {     lo_title=$*;  python -c "print '$lo_title'.title()" ; }
week_number () { python -c 'import datetime; print(datetime.date.today().isocalendar()[1])' ; }

pyh ()   {       python -c "help( '$1' )" ; }
pyhq ()  {       echo q | pyh $1 ; }
pydoc () {       python -m pydoc $1 ; }
pyd ()   {       python -c "import $1;   print  dir($1)" ; }

pypath () {      python -c 'import sys, pprint; pprint.pprint(sys.path)' ; }
platf () {       python -c "from sys import platform; print platform " ; } 

### Parse json fields:

# given an json text
#>>> import json
#>>> x=json.loads("""{"msec":1.69403076171875,"error":"Not Found","data":{"data":null,"isBoom":true,"isServer":false,"output":{"statusCode":404,"payload":{"statusCode":404,"error":"Not Found"},"headers":{}},"message":"Not Found"}} """)
#>>> print x["data"]["isServer"]
#False

# given an API that returns json, parse fields like: a="http://96.118.57.11:8080/api/vi/version"
# {"status":200,"message":"OK","data":{"xpc":{"code_git_commit":"17.5.1-28.c2916a5","document_link":"https://comcast.box.com/s/4qwa5uh0ec200q1rz745jehaggd40225","build_time":"Tue May 16 18:59:00 2017 UTC"}}}
#>>> import urllib, json
#>>> a="http://96.118.57.11:8080/api/vi/version"
#>>> f=urllib.urlopen(a)
#>>> v=json.load(f)
#>>> f.close()
#>>> print v["status"]
#404


##  Convert
nonmacdates () { t=$1; echo $t " == " `date --date=@$1` ; }
nonmacdateu () { t=$1; echo $t " == " `date -d             "$t" +%s ` ; }
dates () {       t=$1; echo $t " == " `date -r              $t `      ; }
dateu () {       t=$1; echo $t " == " `date -jf "%Y-%m-%d" "$t" +%s ` ; }

h2d () {       echo $((0x$1)) ; }
d2h () {       printf '%x\n' $1 ; }
# WIP d2b () { printf '%o\n' $1 ; }

trUC () {      tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'   ; }
trLC () {      tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'   ; }

fgbz ()  {     grep -i $1 $2 $3 $4  $HOME/Help/bash_rcFiles/bashrc.zbra ; }

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

ffg () {       fn=$1; pat=$2; sudo find ./ -name $fn -exec grep -iH $pat {} \; ; }

ftee  () {     tee -a $HOME/logs/$1_$(date '+%Y.%m.%d').log ; }
ftee1 () {     tee    $HOME/logs/$(date '+%Y.%m.%d_%H.%M')_$1.log ; }
ftee2 () {     tee    $HOME/logs/$(date '+%H.%M_%m%d%Y')_$1.yaml ; }
#for f in *; do [[ -f "$f" ]] && mv "$f" "$f.yaml"; done

fman () {      cmd=$1; man $cmd | col -b > $HOME/man_$1.txt; cat -n $HOME/man_$1.txt; ls -l $HOME/man_$1.txt  ; }

### clipboard: copy and paste
# pbcopy < file.txt; pbpaste; 
alias controlc='tee >(pbcopy)'
alias conc='   pbcopy'
alias conv='   echo `pbpaste` '

### USE_TERMINALS
hterm () {     colour=$1; cmd=$2; bash $HOME/proj/shell/hterm.sh $colour $cmd ; }
runh () {      hterm novel " $*" ; }
# runh snn2;   runh odh $m $note

oterm () {     cmd=$*;   bash $HOME/proj/shell/oterm.sh "date;pwd;$cmd" ; } 
topo   () {    osascript -e 'tell application "Terminal" to do script  "clear;echo hello; top " ' ; }

### MACBOOKPRO_TIPS 
# brew install coreutils; 
# get the file pathname: greadlink -f fname; 
alias smartdisk='diskutil info disk0  | egrep -C5 "SMART|Verified"  '
alias smartSSD='smartctl -a    disk0  | egrep -i  "fail|smart|pass" '
alias vcamera1='lsof  |head -1; lsof  | egrep -i  "AppleCamera|VDC" '
alias vcamera2='ps -ef|head -1; ps -ef| egrep -i  "AppleCamera|VDC" '
alias vcamera=' vcamera1'

alias w2h='     open https://goo.gl/maps/3mU5Nybps632'
alias w2noi='   open https://goo.gl/maps/EQKr9SM9RF72 '
alias w2dai='   open https://goo.gl/maps/CB8P52LSk8Q2 '
alias w2tem='   open https://goo.gl/maps/zPmk69q7NW82'

alias timesh='  echo hlam001c; open -a "Safari" http://budget.cable.comcast.com'
alias adp='     echo adphenrylam save34; open http://myAccess.adp.com'

alias e_v='     open https://goo.gl/kY9EoV '				
e2v  () {       open http://dictionary.cambridge.org/us/dictionary/english-vietnamese/$1 ; }
alias kippbb='  open https://goo.gl/7BnUqU'

alias cccache=' echo chrome://settings/clearBrowserData'

alias godr='    open https://drive.google.com/drive/my-drive'

alias opec='    open -a "Google Chrome" '
alias opef='    open -a "Firefox" '
alias opes='    open -a "Safari" '


### Printers
PRT1="10.172.73.1"
PRT2="10.172.73.126"
PRTGREENLATERN="10.172.73.188"

### SI IP hosts

TFTP_IP="10.255.246.110"
XMGR="96.118.36.213"

hostG="96.115.78.175"
hostY="96.119.225.204"
hostA="96.118.23.51"  
hostR="96.118.57.11"

hostRed="red.awsxpc.comcast.net"
hostAmber="amber.awsxpc.comcast.net"
hostYellow="yellow.awsxpc.comcast.net"

hostOYellow="odpyellowuiorch.odpaws.comcast.net"
hostOAmber="odpamberuiorch.odpaws.comcast.net"
hostORed="odpreduiorch.odpaws.comcast.net"

hostOY="96.118.58.243" 
hostOA="96.118.59.53"  
hostOR="96.118.61.32"

licR="96.118.57.11     96.118.57.13   96.118.27.110  96.118.30.93"
licA="96.119.227.212                  96.119.245.37  96.119.243.238 96.118.23.51   96.118.30.94"
licY="96.119.225.204   96.119.228.79  96.118.16.114  96.118.165.225 96.118.185.219"
licX="96.118.57.11     96.118.57.13   96.118.27.110  96.118.30.93   96.119.227.212                96.119.245.37 96.119.243.238 96.118.23.51  96.118.30.94 96.119.225.204 96.119.228.79  96.118.16.114   96.118.165.225 96.118.185.219"

lic13R="96.118.57.10   96.118.57.12   96.118.27.107  96.118.27.106"
lic13A="96.119.227.189 96.119.227.222 96.119.245.35  96.119.243.237 96.118.23.53   96.118.23.52  "
lic13Y="96.119.225.205 96.119.224.255 96.118.16.113  96.118.16.111  96.118.165.224 96.118.172.88 "

licOR="96.118.61.32    96.118.61.37   96.118.27.90   96.118.16.126"
licOA="96.118.59.53    96.118.51.38   96.119.224.83  96.119.224.71  96.118.28.58   96.118.28.60"
licOY="96.118.58.243   96.118.59.240  96.119.228.102 96.118.167.133 96.118.190.181"
licO="96.118.61.32     96.118.61.37   96.118.27.90   96.118.16.126  96.118.59.53   96.118.51.38   96.119.224.83 96.119.224.71  96.118.28.58  96.118.28.60 96.118.58.243  96.118.59.240  96.119.228.102  96.118.167.133 96.118.190.181"

licGreen="96.115.78.175 96.115.78.176 96.115.78.21   96.114.241.135 96.114.241.127 96.114.22.211  68.87.23.10   68.87.23.100   68.87.23.101  96.114.34.109 96.114.34.110 96.114.34.142  96.114.35.226   96.114.35.227  " 
licG="96.115.78.175     68.87.23.10   "       

GH="https://github.comcast.com"
GHX="https://github.comcast.com/xpcs"

LISTALLCPE="$HOME/devices/cpe/List_All_CPEs_OdpJenkins_052517.csv"
CPRO_A2="$HOME/devices/cpe/cpro_a2.json"
CDEV_ec="$HOME/devices/cpe/cdev_ec.json"
CCIS_28="$HOME/devices/cpe/ccis_28.json"
CXB6="$HOME/devices/cpe/xb6.json"
CXB6A="$HOME/devices/cpe/xb6a.json"
CCIS_ef="$HOME/devices/cpe/ccis_ef.json"
CRA="$HOME/devices/smkRA.json"

Mssr="5C8FE0D3C508"
Mssa="3C7A8A376BCC"
Mssy="5C8FE07ED532"

Mnrn="5C8FE0A1BE32"
Mn1rn="3C7A8A3328C8"
Mnrn1="14CFE21473A2"
Mn1rn1="3C7A8A376B54"
Mstoy="14CFE2146492"

#M1="10868CEA6D24"
M1="ACB3130356A2"
M2="044E5A9AE8EC"
M3="F44B2A77BF28"
M4="14CFE2146E92"
M5="F8A097EF0CDA"
M6="F8A097EF091F"

M6A="F8A097EF0CDA"
McisR="F44B2A77BBEF"
MAprod="10868c6d5f1e"
IAprod="2001:558:4000:1a:1286:8cff:fe6d:5f1e"

MV="5c8fe07ee442"
MV2="14CFE2146802"

MA="5c8fe07ede92"
MD="9c34263faa06"

MM_prod="ACB31302BEF2"
IM_prod="2001:558:4000:1a:2eb3:13ff:fe02:bef2"
UM_prod="SI_XPC_UID18"

MK_122="5C8FE07EE122"
IK_122="10.255.244.89"

### not enabled smoktest 
# smo nan1 xb3 ipv6 ... 5C8FE09E07CE  2001:558:ff23:a:141b:38aa:563d:3224 TG1682_2.7s1_PROD_sey
# smo n1an1 xb3  v4 ... 14CFE2146E92  10.255.244.79                       TG1682_2.5p3s1_PROD_sey


# D2 dev dan1  9c34263f9adf

CDEV_IP="10.255.244.34"
CCIS_IP="10.255.244.20"
I1="2001:0558:4000:001a:aeb3:13ff:fe03:56a2"
I2="10.255.244.34"
I3="10.255.244.20"
I4="10.255.244.79"
I5="2001:558:4000:1a:faa0:97ff:feef:cda"    
I6="2001:0558:4000:001a:faa0:97ff:feef:091f"
I6A="2001:0558:4000:001a:faa0:97ff:feef:0cda"

alias cpro_acct='open https://customertimeline.cable.comcast.com/#/account/8155100181702543'
alias cpro='   pjson  ~/devices/cpe/cpro_a2.json | right: '
alias cdev='   pjson  ~/devices/cpe/cdev_ec.json | right: '
alias ccis='   pjson  ~/devices/cpe/ccis_28.json | right: '
alias cxb6='   pjson  ~/devices/cpe/xb6.json     | left: '
alias cxb6a='  pjson  ~/devices/cpe/xb6a.json    | left: '
alias ccisR='  pjson  ~/devices/cpe/ccis_ef.json | right: '
alias c_RA='   pjson  ~/devices/cpe/smkRA.json   | right: '
alias minfo='  echo $M1 $M2 $M3'

gmif () {      egrep "CMAC|IPv|UID" ; }
#alias m1if='  echo mac=$M1, ip=2001:0558:4000:001a:1286:8cff:feea:6d24, fwcpe=`wp_rdkb $M1|gc2 value`, UICloudPortal=internet.xfinity.com, UID=SI_XPC_UID65, UIPwd=Csv1050xPC  '
#alias m2if='  echo mac=$M2, ip=$I2, fwcpe=`wp_rdkb $M2|gc2 value` ,         UICloudPortal=$I2,         UID=cusadmin, UIPwd=Xfinity '
#alias m3if='  echo mac=$M3, ip=10.255.244.20 fwcpe=`wp_rdkb $M3|gc2 value`, UICloudPortal=internet.xfinity.com, UID=SI_XPC_UID24, UIPwd=Csv1050xPC  '
alias m1if='   cpro  | gmif ; ech2 "fwcpe=`wp_rdkb $M1|gc2   value` " '
alias m2if='   cdev  | gmif ; ech2 "fwcpe=`wp_rdkb $M2|gc2   value` " '
alias m3if='   ccis  | gmif ; ech2 "fwcpe=`wp_rdkb $M3|gc2   value` " ' 
alias m4if='   ech2 $M4 $I4 ; ech2 "fwcpe=`wp_rdkb $M4|gc2   value` " ' 
alias m6if='   cxb6  | gmif ; ech2 "fwcpe=`wp_rdkb $M6|gc2   value` " '
alias m6aif='  cxb6a | gmif ; ech2 "fwcpe=`wp_rdkb $M6A|gc2  value` " '

### UI
# soft launch - cpe UI - Xfinity Cloud Portal / Production/ Green     https://internet.xfinity.com/
# soft launch - cpe UI - Xfinity Cloud Portal / Production/ lui       https://my.xfinity.com/
# soft launch - cpe UI - Xfinity Cloud Portal / Staging   / Yellow    https://internet.staging.xfinity.com/
# soft launch - cpe UI - local lui                               open http://http://[2001:558:4000:1a:1286:8cff:feea:6d24]
#cui () {      i=$1;  ech2 "Comcast  UI: u:p=SI_XPC_UID65:Csv1050xPC";  open https://login.comcast.net/login ; } 
Cui () {       i=$1;  ech2 "Cloud    UI: u:p=SI_XPC_UID65:Csv1050xPC";  open https://internet.xfinity.com/ ; }
Iui () {       i=$1;  ech2 "Internet UI: u:p=SI_XPC_UID65:Csv1050xPC";  open https://internet.xfinity.com/ ; }
Mui () {       i=$1;  ech2 "My       UI: u:p=SI_XPC_UID65:Csv1050xPC";  open https://my.xfinity.com/ ; }
Yui () {       i=$1;  ech2 "Yellow   UI: u:p=                       ";  open https://internet.staging.xfinity.com/ ; }
Sui () {       i=$1;  ech2 "Staging  UI: u:p=                       ";  open https://internet.staging.xfinity.com/ ; }

### Local UI: u:p=cusadmin:Xfinity
lui () {       i=$1;  ech2 "Local UI: u:p=cusadmin:Xfinity";            open http://$i ; }
lui6 () {      i=$1;  ech2 "Local UI: u:p=cusadmin:Xfinity";            open http://[$i] ; }

alias lui_pro='m1if;  ech2 "Local UI: u:p=cusadmin:Xfinity";            open   https://internet.xfinity.com/'
alias lui_dev='m2if;  lui $I2'
#alias lui_dwf='m2if;  ech2 "Local UI: u:p=cusadmin:Xfinity";  open   http://10.255.244.34/wireless_network_configuration.php'
alias lui_cis='m3if;  lui $I3'
alias lui_m4=' m4if;  lui $I4'
alias lui_xb6='m6if;  lui $I6'
alias lui_xb6a='m6aif;lui $I6A'

alias lui_stg='echo SI_XPC_UID65/Csv1050xPC/Mac=10868CEA6D24; echo SI_XPC_UID49/Csv1050xPC CMMAC=5C8FE0A62F62; open https://internet.staging.xfinity.com/'

### Portal: 1/General>App>NWModem: Modem device info; 2/General>App>POD: Pwd of the day for mso
iportal_POD="http://ip-edge-portal.cable.comcast.com/index.php"
alias oPOD='   open $iportal_POD '
alias modemIP='echo "View cpro_a2 device info at: General>Apps>NW modems and CM_MAC" ; open http://ip-edge-portal.cable.comcast.com/login.php'

# Go iportal to 1.get POD: navigate menu General > POD > vendor= ArrisWG, copy the POD
# Go iportal to 2.get info of modem/CPE, similar info get from Kevin's spreadsheet 
# enable telnet at local ui> Advanced > Remote Mgmt, must use u:p=mso/POD
lui_mso () {   cpeip=$1; echo "Browse CPE_IP: $cpeip, u:p= mso/POD "; open http://$cpeip ; }
alias lui_dev_mso='lui_mso $CDEV_IP'

### boxer: checkout github; install boxer
alias installboxer='cdbx  ; echo Python should be 2.7; python setup.py develop'

# Jenkins monitor jobs
alias oje='    open https://odpjenkins.awsxpc.comcast.net/'

# Webex room
alias owebex=' open https://icollaborate.webex.com/meet/henry_lamcomcast.com'

# Enable telnet: 1/iportal 'oPOD' 2/lui mso:POD 3/Advance > Remote Mgmt > enable Telnet
# telnet to XB3 Arris cpe u:p=[none]:arristi (or factory pwd from Kevin). Type "quit": to shell; type "exit": back to console; Exit out Ctrl }, Ctrl d
# telnet to XB3 Cisco cpe u:p=admin:POD; mainMenu>shell; tail -f /rdklogs/logs/WEBPAlog.txt.0
# telnet to XB6 Arris cpe u:p=
RDKlog="/rdklogs/logs/WEBPAlog.txt.0"
WAPlog="/rdklogs/logs/WEBPAlog.txt.0"
# Request: {"command":"GET",
# 74:241] Notification Event
# 74:241] Notification received from stack Old CMC: 512
flct () {      echo " alias llr='ls -ltraF' && alias cdlr='cd /rdklogs/logs' && alias tlr='tail -n200 -f /rdklogs/logs/WEBPAlog.txt.0' && alias mi='ifconfig -a wan0' && alias gnot='grep -oEn \"Request:............|Notification....................................\" /rdklogs/logs/WEBPAlog.txt.0' " ; }
telI () {      i=$1; i=${i:-$I2};   flct;    telnet $i ; }
teli  () {     c=$2; c=${c:-grass}; hterm $c "telI  $1" ; }


### tail log WebPA aka rdk log aka RDKB device log aka cpe_log: 1/ telnet to CPE_IP, pwd=arristi, type quit to enter cli; 2/ cdlr;tlwpa 
#alias llr='ls -ltraF';alias cdlr='    cd            /rdklogs/logs/ && ls -ltra|tail -n20'; alias tlr='     tail -n200 -f /rdklogs/logs/WEBPAlog.txt.0 '
alias tlwpa='  tail -n200 -f /rdklogs/logs/WEBPAlog.txt.0 '
alias cpe_log='open https://sitools.sys.comcast.net/RDKBWebApplication/'

### Non-xmanage: start magneto 051117
#odp, use :         http://repos.awsxpc.comcast.net/version/env_info.py?color=red
alias odpR='   open http://repos.awsxpc.comcast.net/version/env_info.py?color=red'
alias odpA='   open http://repos.awsxpc.comcast.net/version/env_info.py?color=amber'
alias odpY='   open http://repos.awsxpc.comcast.net/version/env_info.py?color=yellow'
alias odpG='   open http://repos.awsxpc.comcast.net/version/env_info.py?color=green'

#xpc, use magneto :   https://magneto.sys.comcast.net/xb_cloud/powercloud/tree/dev/hiera
alias omag='   open https://magneto.sys.comcast.net/xb_cloud/powercloud/tree/dev/hiera'
alias magR='   open https://magneto.sys.comcast.net/xb_cloud/powercloud/blob/dev/hiera/red.yaml'
alias magA='   open https://magneto.sys.comcast.net/xb_cloud/powercloud/blob/dev/hiera/amber.yaml'
alias magY='   open https://magneto.sys.comcast.net/xb_cloud/powercloud/blob/dev/hiera/yellow.yaml'
alias magG='   open https://magneto.sys.comcast.net/xb_cloud/puppet_xpc/blob/master/hiera/xpc.yaml'

#Muthu 051117:      https://magneto.sys.comcast.net/xb_cloud/powercloud OR _xap 
alias magpc='  open https://magneto.sys.comcast.net/xb_cloud/powercloud'
alias magxa='  open https://magneto.sys.comcast.net/xb_cloud/powercloud_xap'


#checkenvhost: 1/env host (api curl get, api postman, pingf, dig, sshcor, runcor, tail logs, ps-ef, servive, supervisorctl); 2/celeRflower tasks; 3/


### Xmanage shows servers ip, hostname xpccore*, or odpcore*, 24=N, 13=N-1, 
# alias_cxi_red='curl -s http://$hostR:9900/env'
cxi_ () {      c=$1; c=${c:-red} ; curl -s http://96.118.36.213:8000/api/v1/xmanage/env/list-new/$c | python -m json.tool ; }

# replace xmanage by magneto
cxi () {       c=$1; c=${c:-red} ; cat ~/devices/mag/$c.yaml ; } 

# use node 2,4 as code N level
alias gx24='   egrep -A1   "core.*-[24]" '
alias gx13='   egrep -A1   "core.*-[13]" '

# use node 2 as flower
alias gxflower='egrep -A4   "xpccore.*-2d" '
alias goflower='egrep -A4   "odpcore.*-2d" '

# list apps nodes
gx () {         egrep -A1 "$*" ; }
alias gxredis=' gx           redis- '
alias gxsparkm='gx           sprkm- '
#gx xpc/red/xpcproxy- 	4
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

### xpcbuild as slave nodes

### godx red "db|redis"
godx () {      e=$1; a=$2; ech2 "Env=$e, App=$a"; cxi $e| gx $a ; }

#ipc () {      e=$1; e=${e:-red}; godx $e core  ; }
#ipr  () {     e=$1; e=${e:-red}; godx $e redis ; }
#ipdb  () {    e=$1; e=${e:-red}; godx $e db    ; }

### god command: show env, App (core) , Version { host ODP, IP, SHA = odpcore-ch2f-1d-yellow 96.119.228.111 17.3.1-58.8136fb2 }
god () {        c=$1; c=${c:-red}; a=$2; a=${a:-core}; u="http://repos.awsxpc.comcast.net/version/god_command_with_versions.py?color=$c&app=$a"; ech2 "$u u:p=devops:onlydevops"; open $u ; }

ipcO () {      e=$1; e=${e:-red}; god  $e core  ; }
iprO () {      e=$1; e=${e:-red}; god  $e redis ; }
ipdbO () {     e=$1; e=${e:-red}; god  $e db    ; }

### Env_App info http://repos.awsxpc.comcast.net/version/env_info.py?color=green&app=core,sync&region=e1a,e1b
# eaif red "core,db"
eaif () {      e=$1; a=$2; ech2 "Env=$e, App=$a"; open http://repos.awsxpc.comcast.net/version/env_info.py?color=$e\&app=$a ; }

### Nodes within lb
lbRED="https://red.awsxpc.comcast.net"
lbAMBER="https://amber.awsxpc.comcast.net"
lbYELLOW="https://yellow.awsxpc.comcast.net"
lbGREEN="https://xpcapi-si.xpc.comcast.net"

lbyellow_xpc="https://yellow.awsxpc.comcast.net"
lbyellow_odp="https://odpyellowapi.odpaws.comcast.net/"

lbamber_odp="https://odpamberuiorch.odpaws.comcast.net/"

alias lbRAY='  dig red.awsxpc.comcast.net amber.awsxpc.comcast.net yellow.awsxpc.comcast.net'
gRAY () {      egrep -i "red|amber|yellow" ; }

#nodee () {    for x in proxy consul core db sync sprkm sprkw hook que zoo rabbit redis lb; do echo;echo $x; cxi $1 |grep xpc$x- ; done ; }

### Flower:5555 xpc core 2d $ cxi amber     | egrep -A5 "xpccore.*2d"
# Flower odp core 1d $ cxi odp-amber | egrep -A5 "odpcore.*1d"
#alias gxflowero='egrep -A4 "odpcore.*-1d" '

# ce_xflower yellow ; to get IP, of5 on dashboards and task, check for failed
of5 () {        i=$1; u:p=color:color; open http://$i:5555/tasks ; ech2 "verify celery flower tasks, search for FAILURE " ; }
ce_xflower () { e=$1; cxi $e | gxflower ; ech2 "@@@ get ip, run of5/tasks, search for FAILURE " ; }
ce_oflower () { e=$1; cxi $e | goflower ; ech2 "@@@ get ip, run of5/tasks, search for FAILURE " ; }

# celery flower: on red - asb - xpc: $echo "u:p= red/red"; open http://96.118.57.11:5555/tasks 
celeflowR () {  for i in $licR; do ech2 $i; open http://$i:5555/tasks; done ; }

# celery for Green 76.96.27.96:5555 or 76.96.26.193:5555
alias celeGflower='ech2                  ;  open http://76.96.27.96:5555/dashboard'
alias celeYflower='ech2 u:p=admin:xpcadmin; open http://68.87.33.80:5555/dashboard'
alias celeAflower='ech2 u:p=amber:amber   ; open http://96.118.23.51:5555/dashboard'
alias celeRflower='ech2 u:p=red:red       ; open http://96.118.57.11:5555/dashboard'

# broad celery flower:5555 u:p=admin/xpcadmin OR admin/odpadmin
alias celeflower=' ech2 u:p=admin:xpcadmin; open http://68.87.33.80:5555/dashboard'
alias cfall='      celeRflower; celeAflower; celeYflower; celeflower '


### Env_App_NodeNum1234
ean () {       e=$1; e=${e:-red}; a=$2; a=${a:-core}; n=$3; n=${n:-24}; echo $e xpc $a $n :; cxi $e | egrep -A1 $a.*-[$n] ; }

ipc () {       ean $1 core     $2 ; }
ipr () {       ean $1 redis    $2 ; }
ipdb () {      ean $1 db       $2 ; }

ipc24 () {     e=$1; e=${e:-red}; echo core24_N_$e;   cxi $e | egrep -A1 "core.*-[24]"|grep ip|cut -d: -f2 ; }
ipc13 () {     e=$1; e=${e:-red}; echo core13_N-1_$e; cxi $e | egrep -A1 "core.*-[13]"|grep ip|cut -d: -f2 ; }

ipcR () {      n=$1; n=${n:-24}; echo red_xpccore $n :; ean red    core    $n | cred   ; }
ipcA () {      n=$1; n=${n:-24}; echo amb_xpccore $n :; ean amber  core    $n | camber ; }
ipcY () {      n=$1; n=${n:-24}; echo yel_xpccore $n :; ean yellow core    $n | cyellow ; }

#ipc red 1324
#ipc () {      e=$1; e=${e:-red}; n=$2; n=${n:-24}; echo $e_xpcore $n :; cxi $e | egrep -A1 core.*-[$n] ; }


### Jenkins

# odpjenkins henrylam ci job: 
jeci="henrylam-ci-xap-96.118.53.221"
alias ocihenry='open https://odpjenkins.awsxpc.comcast.net/job/henrylam-ci-xap-96.118.53.221/'

# Jenkins job download 
jedlfw="download-rdkb-image"

# Jenkins job XB6
jexb6="smoketest-XB6-on-amber"

# Jenkins jobs
jeXPC="https://jenkins.awsxpc.comcast.net/"
jeODP="https://odpjenkins.awsxpc.comcast.net"
nRedn="smoketest-n-on-red-n"

# utilities$ vih rdkb_auto_upgrade.py : def get_rdkb_last_successful_build(): u:p= base_url = https://xpcjenkins:rYxK8TeU)2@jenkins.ccp.xcal.tv/jenkins/job/ARRISXB3-Yocto-Build
# 1/new fw TGxx, 2/CPE MAC+IP 3/jenkins job ofwup 4/check after 15mins   
# location of unsigned, "DEV_master"....
# TG1682_DEV_master...bin; script utilities/unsigned.py; jenkins job: upgrade_rdkb_unsigned
# script utilities/rdkb_auto_upgrade.py; jenkins job, runs at 4am: download_rdkb_image
jefwup="upgrade-rdkb"
alias ofwup='    open  https://odpjenkins.awsxpc.comcast.net/job/upgrade-rdkb/build?delay=0sec'
alias olistcpe=' open  https://odpjenkins.awsxpc.comcast.net/view/List_All_smoketest_cpes/'

### sitools
# upgrade fw rdkb for XB6/Green/Production: use sitools
alias ofwup_sitools='  echo "Use NTid to login, input: MAC, image, http/tfpt to proceed"; open https://sitools.sys.comcast.net/siweb/'

alias sit_='    ech2 "sitools" ; open https://sitools.sys.comcast.net/siweb/'            
alias sit_wpa=' ech2 "Input with cpe mac, make sure cpe online"; open https://sitools.sys.comcast.net/RDKBWebApplication/deviceLogs'
alias sit_spl=' ech2 "Input with cpe mac"; open https://sitools.sys.comcast.net/SplunkQuery/'                 
alias sii_api=' ech2 "$OBJ"| tr " " "\n" ; open https://sitools.sys.comcast.net/api/api-docs'


# jenkins job for latency report, runs everyday at 7am - https://jenkins.awsxpc.comcast.net/job/latency_test
# script: utilities/latency.py aka sshDan d /root/webpa-restart; run $ ./latency.py 9C34263FAA06
# Dawg-house to retrieve CPE info
tmer () {      s=$1; s=${s:-480}; now; ech2 "START WAITING $s SECONDS ... "; sleep $s ; cowS $2 |cpink ; } 
timer () {     s=$1; s=${s:-480}; tmer $s $2 ; }

odhm () {      m=$1; m=${m:-10868CEA6D24}; n=$2; n=${n:-reboot_}; echo "1GO: link Open; 2MAC=$m right?; 3REBOOT: CPE $n"; open http://dawg-house.cvs-a.ula.comcast.net:8080/dawg-house/webpa/?q=$m ; tmer 1200 Dawg_House_reboot; ech2 Check online; gowpa $m ; }
odh () {       runh "odhm $1 $2" ; }


### Manual sync test in ENV: 1/trigger a change on CPE (snmpset new ssid) then 2/wait then check DB thru API call priv wifi 3/Splunk 4/cmc_cid match thru APIs webpa vs sync_info 5/RDK log aka webpa log aka cpe log
# 1/sGET_ssid $I2 && sSET_ssid $I2 sync_sS_2g && tmer 60 60sec_see_sync_sS_2g && sGET_ssid $I2 ; Then: echo "amh_bmh_aga $M2 $hostENV grep sync_sS_2g" ; Then: reset the old ssid name sS_ssid $I2 2gTest_SSID_Name
ms_cpe () {    i=$1; i=${i:-$I2}; sG_ssid  $i && sS_ssid  $i  sync_sS_2g && tmer 60 60sec_see_sync_sS_2g && sG_ssid  $i ; }
ms_cpe6 () {   i=$1; i=${i:-$I2}; sG_ssid6 $i && sS_ssid6 $i  sync_sS_2g && tmer 60 60sec_see_sync_sS_2g && sG_ssid6 $i ; }
db_cloud () {  m=$1; m=${m:-$M2}; h=$2; h=${h:-$hostR}; b=`bmh $m $h|grep 200`; if [ $? -eq 0 ]; then apw $m $h; amh $m $h; fi ; }

ms_R () {      ms_cpe     && db_cloud            ; }
ms_A () {      ms_cpe $I2 && db_cloud $M2 $hostA ; }
ms_Y () {      ms_cpe $I2 && db_cloud $M2 $hostY ; }

ms_  () {      m=$1; m=${m:-$M2}; i=$2; i=${i:-$I2}; h=$3; h=${h:-$hostR}; ms_cpe $i  && db_cloud $m  $h     ; }
ms_reset () {  m=$1; m=${m:-$M2}; i=$2; i=${i:-$I2}; sS_ssid $i  2gTest_SSID_Name; cle $m  ; }
# ms_reset $M3 $I3 && ms_ $M3 $I3 $hostR && ms_reset $M3 $I3

ms_6  () {     m=$1; m=${m:-$M2}; i=$2; i=${i:-$I2}; h=$3; h=${h:-$hostR}; ms_cpe6 $i && db_cloud $m  $h     ; }
ms_reset6 () { m=$1; m=${m:-$M2}; i=$2; i=${i:-$I2}; sS_ssid6 $i  2gTest_SSID_Name; cle $m  ; }

# ms61 $hostR; ms_reset6 $M1 $I1 && ms_6 $M1 $I1 $hostR && sleep 10 && ms_reset6 $M1 $I1
msy () {       m=$1; m=${m:-$M2}; i=$2; i=${i:-$I2}; h=$3; h=${h:-$hostR}; ms_reset  $m  $i  && ms_  $m  $i  $h && sleep 10 && ms_reset  $m  $i  ; }
msy6 () {      m=$1; m=${m:-$M1}; i=$2; i=${i:-$I1}; h=$3; h=${h:-$hostA}; ms_reset6 $m  $i  && ms_6 $m  $i  $h && sleep 10 && ms_reset6 $m  $i  ; }


### beside manual sync test ms_R... 2 GET to check sync: 1/ expect cmc=512; 2/expect match cmc_cid a/on CPE with webpa call and b/on DB with API sync_info call
# Postman shilpa: https://api.webpa.comcast.net:8090/api/v2/device/mac:F44B2A77BF28/config?names=Device.DeviceInfo.X_CISCO_COM_FirmwareName,Device.DeviceInfo.X_COMCAST-COM_WAN_IP,Device.DeviceInfo.Webpa.X_COMCAST-COM_CMC,Device.DeviceInfo.Webpa.X_COMCAST-COM_CID
# bmh F44B2A77BF28 $hostR ; GET http://{{host}}/api/v1/gateway-cpe/{{CPEMAC3}}/sync_info 
# CLI: for ex: curl -s -X GET http://$hostR:8080/api/v1/gateway-cpe/$M3/sync_info|pjson|gc2 "cid|cmc"


### SNMP and OID
OID_SSID=".1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001"
alias oOIDsnmp='open https://www.teamccp.com/confluence/display/SMARTINT/SNMP'

# check if webpa servive running…snmpget -v2c -c hDaFHJG7 10.255.244.38 .1.3.6.1.4.1.17270.50.4.1.2.0   
# check if correct web server="fabric.webpa.comcast.net" :  # snmpget -v2c -c hDaFHJG7 10.255.244.93 .1.3.6.1.4.1.17270.50.4.1.2.0 SNMPv2-SMI::enterprises.17270.50.4.1.2.0 = STRING: "fabric.webpa.comcast.net"


sS_ssid () {   cip=$1; n=$2; snmpset -v2c -c hDaFHJG7 $cip       .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001  s "$n" ; }
sS_ssid6 () {  cip=$1; n=$2; snmpset -v2c -c hDaFHJG7 udp6:$cip  .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001  s "$n" ; }
sG_ssid () {   cip=$1;       snmpget -v2c -c hDaFHJG7 $cip       .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001         ; }
sG_ssid6 () {  cip=$1;       snmpget -v2c -c hDaFHJG7 udp6:$cip  .1.3.6.1.4.1.17270.50.2.2.2.1.1.3.10001         ; }

# QA+Cheat+Sheet: SNMP to enableUI, reboot CPW, start/stop WebPA, get FW,
# WAN IP of $I1: snmpget -v2c -c hDaFHJG7 udp6:2001:0558:4000:001a:aeb3:13ff:fe03:56a2 .1.3.6.1.4.1.17270.50.2.3.9.2.1.0
sS_UIenab () {  cip=$1;      snmpset -v2c -c hDaFHJG7 $cip       .1.3.6.1.4.1.4115.1.3.4.1.2.6.0   i  1 ; }
sS_UIenab6 () { cip=$1;      snmpset -v2c -c hDaFHJG7 udp6:$cip  .1.3.6.1.4.1.4115.1.3.4.1.2.6.0   i  1 ; }
sG_UIenab () {  cip=$1;      snmpget -v2c -c hDaFHJG7 $cip       .1.3.6.1.4.1.4115.1.3.4.1.2.6.0        ; }
sG_UIenab6 () { cip=$1;      snmpget -v2c -c hDaFHJG7 udp6:$cip  .1.3.6.1.4.1.4115.1.3.4.1.2.6.0        ; }

sS_reboot () { cip=$1;       snmpset -v2c -c hDaFHJG7 $cip  1.3.6.1.2.1.69.1.1.3.0            i  1 ; }

sS_wpastart () { cip=$1;     snmpset -v2c -c hDaFHJG7 $cip  .1.3.6.1.4.1.17270.50.4.1.1.0     i  1 ; }
sS_wpastop  () { cip=$1;     snmpset -v2c -c hDaFHJG7 $cip  .1.3.6.1.4.1.17270.50.4.1.1.0     i  2 ; }

sG_fw  () {    cip=$1; cip=${cip:-$I2};snmpget -v2c -c hDaFHJG7 $cip      1.3.6.1.2.1.1.1.0 | tr ';<<' '\n' | column -s: -t ; }
sG_fw6 () {    cip=$1; cip=${cip:-$I2};snmpget -v2c -c hDaFHJG7 udp6:$cip 1.3.6.1.2.1.1.1.0 | tr ';<<' '\n' | column -s: -t ; }

sG_rdkb () {   cip=$1; ech2 "RDKB FW at CPE  (using snmpget):        $cip "; sG_fw $cip | egrep "SW_REV|_TG1682_" ; }

### thru WebPA/SATtoken
wp_rdkb () {   cip=$1; ech2 "RDKB FW at CPE  (thru WebPA/SATtoken):  $cip "; python ~/get_fwcpe_thru_webpa.py $cip ; }
wp_wan () {    m=$1;   ech2 "WAN IP for CPE  (thru WebPA/SATtoken):  $m ";   python ~/get_wan_thru_webpa.py   $m   ; }

wp_syn () {    m=$1;   ech2 "(thru WebPA/SATtoken):  $m ";   python ~/get_syn_thru_webpa.py   $m   ; }

### check cpe IP (and others: )  thru WebPA/SATtoken
OBJ="   Device.DeviceInfo.X_COMCAST-COM_CM_IP \
        Device.DeviceInfo.X_COMCAST-COM_WAN_IP \
        Device.DeviceInfo.Webpa.X_COMCAST-COM_CMC \
        Device.DeviceInfo.Webpa.X_COMCAST-COM_CID \
        Device.DeviceInfo.X_CISCO_COM_FirmwareName \
        Device.DeviceInfo.X_RDKCENTRAL-COM_CloudUIEnable \
        Device.DeviceInfo.X_RDKCENTRAL-COM_EnableXDNS \
        Device.DeviceInfo.X_RDKCENTRAL-COM_xOpsDeviceMgmt.Mesh.URL \
        Device.DeviceInfo.X_RDKCENTRAL-COM_xOpsDeviceMgmt.Mesh.Enable \
        Device.DeviceInfo.X_RDKCENTRAL-COM_xOpsDeviceMgmt.Mesh.Status \
        Device.DeviceInfo.X_RDKCENTRAL-COM_xOpsDeviceMgmt.Mesh.State \
        Device.X_Comcast_com_ParentalControl.ManagedDevices.Enable \
        Device.X_Comcast_com_ParentalControl.ManagedDevices.Device. \
        Device.X_CISCO_COM_CableModem.IPv6Address  \
        Device.X_CISCO_COM_DeviceControl.LanManagementEntry.1.LanMode \
        Device.X_RDKCENTRAL-COM_Report.NetworkDevicesStatus. "


gowpa () {     m=$1; m=${m:-$M2}; ech2 "Chk CPE (thru WebPA/SATtoken)"; line; bash ~/checkouts/xpc-testm/xpc-test/xpcfunctionaltest/utilities/check_device_webpa.sh $m;ech2 ; } 

#xpc-test/xpcfunctionaltest/utilities/cleanup_cpe.py
cle () {       m=$1;       ech2 "Clean CPE $m from envs";    cd;  python cleanup_cpe.py   --cpe $m ; line ; }
onb () {       m=$1; e=$2; ech2 "Onboard CPE $m to env $e."; cd; (python onboard_cpe.py   --cpe $m --env $e)|cblue; line ; }


# check if CPE mac is online thru webpa, and if onboard on any host/env
getipcm () {   m=$1; python ~/get_ipcpe_thru_webpa.py   $m |gc2 value ; }
getipv6 () {   m=$1; python ~/get_ipv6cpe_thru_webpa.py $m |gc2 value ; }

olob () {      m=$1; ech2 "Check if online thru WebPA ..."; gowpa $m|cblue; ech2 "Check if onboard ..."; cle     $m ; }


# olob GREEN: 1/postman 2/GET https://xpclb-ch2-01.sys.comcast.net/api/v1/gateway-cpe/044E5A9AE8EC/association 3/NTid:pwd
# apw  GREEN: https://xpclb-ch2-01.sys.comcast.net/api/v1/gateway-cpe/044E5A9AE8EC/configuration?group_id=group_private_wifi_configuration

### cd
alias sxa='    subl  ~/checkouts/xap'
alias sxt='    subl  ~/checkouts/xpc-test'

alias cdxa='   cd    ~/checkouts/xap'
alias cdxt='   cd    ~/checkouts/xpc-test; cbr|ccyan; pwd|grep test '
alias cdxtm='  cd    ~/checkouts/xpc-testm/xpc-test; cbr|cgreen; pwd|grep test '

alias cdrunodp='cd   ~/checkouts/xap/smoketests/test_odp;   ech2 Current branch is `cbr|ccyan`; p '
alias cdrunat='cd    ~/checkouts/xpc-test/boxertest_client; ech2 Current branch is `cbr|ccyan`; p '

alias cdcurls='cd    ~/checkouts/xpc-testm/xpc-test/testscripts/curlscripts; ech2 Current branch is `cbr|ccyan`; ls; pwd '
alias cdcerts='cd    ~/checkouts/xpc-testm/xpc-test/testscripts/signed_cert; ech2 Current branch is `cbr|ccyan`; ls; pwd '

alias runat='  subl  ~/checkouts/xpc-test/boxertest_client/run_any.sh'
alias onrn='   open https://odpjenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-n-on-red-n/'
alias onan='   open https://odpjenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-n-on-amber-n/'

alias run0='   grep python2 ~/checkouts/xpc-test/boxertest_client/run_any.sh |grep -v "\#"|cpink && runat && lastbox && p && onrn ; hterm pro "msy" ; hterm basic "msy6" ; runh "msy $M4 $I4 $hostY" '

runl () {      cdrunat; c=$1; c=${c:-basic}; hterm $c "now;echo $2;run_any.sh|ftee2 && cowS $2 |cgreen" ; }
alias run1='   runl           grass'
alias run2='   runl           pro '
alias run3='   runl           homebrew'
alias run4='   runl           ocean   '
alias run5='   runl           novel   '

# cd smoketest locations
alias cdsync=' cd   ~/checkouts/xap/smoketests/test_xpc/sync; p '
alias cdcele=' cd   ~/checkouts/xap/smoketests/test_xpc/test_case_celery_task; p '
alias cdnega=' cd   ~/checkouts/xap/smoketests/test_xpc/xpc_tests_negative; p '
alias cdxman=' cd   ~/checkouts/xap/smoketests/test_xpc/xmanage; p '           

alias cdsts='  cd   ~/checkouts/xap/smoketests/test_xpc/xpc_tests/; p '           
alias cdst='   cd   ~/checkouts/xap/smoketests ; p '           

alias cdsche=' cd   ~/checkouts/xap/smoketests/test_odp/v2/test_case_basic_scheduler; p '
alias cdbw='   cd   ~/checkouts/xap/smoketests/test_odp/v2/;llt;cbr|cred; pwd|grep test '
alias cdmesh=' cd   ~/checkouts/xap/smoketests/test_odp/test_case_mesh/;llt;cbr|cred; pwd '

# cdutil at xt master only
alias cdutil=' ech2 util only exists in branch master of xpc-testm/xpc-test repos; cd   ~/checkouts/xpc-testm/xpc-test/xpcfunctionaltest/utilities; p '

# expected json data xpc-3480
alias cdsan='  cd   ~/checkouts/xap/smoketests/test_xpc/xpc_tests/sanity; pwd|grep test '

alias cdhelper='cd   ~/checkouts/xpc-test/boxertest_client/util'
alias vixhelper='vis ~/checkouts/xpc-test/boxertest_client/util/xpc_helpers.py compare_response_data'
alias vixh='   runh  "vixhelper" '
alias s2gcom=' cd ~/checkouts/xap/smoketests/test_xpc/xpc_tests/sanity; subl test_case_group_radio_2g_onboard.xb3.boxersuite'

# SAMPLE TO RUN SMOKETEST: python smoketest.py --mac 5C8FE07ED532 --cpe_ip 10.255.244.69 --log INFO --host 96.119.227.212:8080 --scheme http  --webpa https://scytale-rc.webpa.comcast.net:8090   --suites test_suites/xpc_tests/test_case_sns_notification
alias obt='    open https://github.comcast.com/xpcs/xpc-test/tree/boxerclient/boxertest_client'

alias osts='   open https://github.comcast.com/xpcs/xap/tree/develop/smoketests/test_xpc/xpc_tests'
alias ost='    open https://github.comcast.com/xpcs/xap/tree/develop/smoketests'

alias oxa='    open https://github.comcast.com/xpcs/xap'
alias oxt='    open https://github.comcast.com/xpcs/xpc-test'
alias ocurls=' open https://github.comcast.com/xpcs/xpc-test/tree/master/testscripts/curlscripts'

### BOX API
APIX="XPC-Platform-API-V2.0.9.5-LifecycleAndConfigSetManagement_Phase2.1MVP_M0.1v1.2s.pdf"

alias boxobj=' echo Platform_CloudParameters_V-2.1.docx; open https://comcast.app.box.com/files/0/f/5008533769/1/f_196941031837'
alias boxapio='open https://comcast.app.box.com/files/0/f/9067651730/1/f_76978037221; ech2 ODP-Platform-API-V1-OperationalDataManagement_Phase1v0 8.3.31.pdf'
alias boxapix='open https://comcast.app.box.com/files/0/f/9067651730/1/f_98327234961; ech2 XPC-Platform-API-V2.0.9.5-LifecycleAndConfigSetManagement_Phase2.1MVP_M0.1v1.2s.pdf'
alias boxapi=' open https://comcast.app.box.com/files/0/f/9067651730/SprintN;         ech2 XPC/OPD-Platform-API.*.pdf'
#alias boxapi='open https://comcast.app.box.com/files/0/f/3173108275/Platform_API_Documents'

gc2 () {       egrep $*|cut -d: -f2- |tr ',\"' ' ' ; }
gbx  () {      egrep -n "context|Starting|expect|status|method|-|endpoint|query|before|after"; }
gbx2 () {      egrep -n "action|request|response|context|Starting|expect|status|method|-|endpoint|query|before|after"; }
cgbx () {      tc=$1; cat $tc|gbx ; }

### check association and get csid:
delc () {      m=$1; h=$2; curl -s -X DELETE http://$h:8080/api/v1/gateway-cpe/$m               |pjson|cblue ; }
isa () {       m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/association   |pjson|cblue ; }
isa2() {       m=$1; h=$2; curl -s -X GET    https://$h/api/v1/gateway-cpe/$m/association       |pjson|cblue ; }

isA () {       m=$1; m=${m:-10868CEA6D24}; h=$2; h=${h:-96.119.227.212}; u="http://$h:8080/api/v1/gateway-cpe/$m/association"; echo The MAC $m association verified with URL $u; python -c "import sys,json,os,requests; resp = json.loads(requests.get('$u',cert='./client.pem',verify=False).text); print json.dumps(resp)" | python -m json.tool |cgreen ; }

isAallm () {   m=$1; for h in 96.118.57.11   96.118.57.13   96.118.27.110 96.118.30.93                              96.119.243.238 96.118.23.51   96.118.30.94 96.119.225.204 96.119.228.79  96.118.16.114 96.118.165.225 96.118.185.219  ; do isA $m  $h; done ; }

# check if m1 or m2 being used, detect data in API asso
#cm1236 () {    nodata=`(isAm1 && isAm2 && isAm3 && isAm6 && isAm6A) |grep -c data`; [ $nodata != 0 ] && ech2 `line` "uh-oh, [ALERT] M1/M2"|cred ; }
cm1 () {       n=$1; n=${n:-3}; for c in `seq $n`; do echo $c; m="M$c"; echo ${m}; cle $m; done ; }

### create new empty csid
cr_csid () {   h=$1; h=${h:-96.119.227.212:8080}; u="http://$h/api/v1/gateway-configset"; echo "For host $h, creating CSID with  URL $u"; python -c "import sys,json,os,requests; resp= json.loads(requests.post('$u', cert='./client.pem', verify=False ).text) ; print json.dumps(resp, indent=4) " | python -m json.tool  ; }

### func a, b, c, d, p, s for Asso, onB, Clean
alias cac='    python ~/clean_ac.py '
amh () {       m=$1; h=$2;       isA                         $m  $h    ; }
bmh () {       m=$1; h=$2;       python ~/onboard.py             $m  $h    |cblue ; }
dmh () {       m=$1; h=$2;       python ~/detach.py              $m  $h    ; }
cmh () {       m=$1; h=$2;       python ~/clean_ac.py            $m  $h    ; }
cmh0 () {      m=$1; h=$2;       python ~/clean_ac_emptycsid.py  $m  $h    ; }
swapmhc () {   m=$1; h=$2; c=$3; python ~/swap_onb.py            $m  $h $c |cblue ; }
pmh () {       m=$1; h=$2;       python ~/purge_cpe_frDB.py      $m  $h    ; }
lmh () {       m=$1; h=$2;       glx                             $m  $h    ; } 
lmH  () {      runh  lmh $1 $2  ; } 

### firmware and tftp
# upgrade fw for Red/Amber/Yellow: jenkins job upgrade-rdkb to CPE: 0/fr Yocto ofw, scp 2Dan_2TFTP 1/smktest job shows CPE MAC 2/gowpa MAC 3/fill jenkins params: cpemac, cpeid, New FW image, document old FW, and running job number. OR 3bis/reboot cpemac, wait and fill params

xb6_fw="TG3482"
xb3_arris_fw="TG1682"
xb3_cisco_fw="DPC3941"

### Firmware at Yocto, u:p=hlam01/LDAP_pwd ;  upgrade firmware/RDKB :
alias ofw='    ech2 "u:p=hlam01/LDAP_pwd"; open  https://nexus.teamccp.com/nexus/content/repositories/arris_xb3/images/signing_stage/ArrisXB3-Yocto-Release/'

# scp image to Dan
i2d () {       img=$1; cd ~/Download; scp -r ./$img root@69.252.255.146:/ ; } 
alias imgDan=' sshDan -t "ls -ltr / " '

# scp image from Dan to TFTP
i2t () {       img=$1; cd /;          scp -r  /$img root@10.255.246.110:/var/www/html/images/  ; }
alias imgTFTP='sshDan -t "ssh 10.255.246.110 ls -ltr /var/www/html/images" '

# Dan's jumper host: lta27 aka 10.1.50.27 aka 69.252.255.146
alias sshDan=' ssh root@69.252.255.146 '
alias sshtftp='ssh root@69.252.255.146 -t "ssh 10.255.246.110" '

# [root@lta27 webpa-restart]# vim rdkb_auto_upgrade.py
alias viDanFwUpd='sshDan -t "vim      /root/webpa-restart/rdkb_auto_upgrade.py" '
alias lsDanFwUpd='sshDan -t "ls -ltra /root/webpa-restart/*.py" '

### ssh core as clduser or root
# $ brew install csshx; vi ~/.ssh/config; identityFile ~/.ssh/xpc-openstack-key.txt; csshx --login clduser  96.119.227.248 96.119.227.25
sshc () {      csshx -l clduser  $* ; }
sshC () {      csshx -l root     $* ; }

### sshcore ,  run cmds on sshcore                
sshcor  () {   coreip=$1; coreip=${coreip:-96.118.57.11};  ssh -i ~/.ssh/xpc-openstack-key.txt    root@$coreip ; }
sshcore () {   coreip=$1; coreip=${coreip:-96.118.57.11};  ssh -i ~/.ssh/xpc-openstack-key.txt clduser@$coreip ; }
sshcorexplat () {   coreip=$1; coreip=${coreip:-96.118.57.11};  ssh -i ~/.ssh/xpc-openstack-key.txt xplat@$coreip ; }

alias sshxplat='ssh -i ~/.ssh/id_rsa xplat@odpredis-as-01q.sys.comcast.net'
sshprivh () {  coreip=$1; coreip=${coreip:-odpredis-as-01q.sys.comcast.net};  ssh -i ~/.ssh/id_rsa hlam001c@$coreip ; }
sshprivx () {  coreip=$1; coreip=${coreip:-odpredis-as-01q.sys.comcast.net};  ssh -i ~/.ssh/id_rsa    xplat@$coreip ; }

sshcorh () {   hterm basic "sshcor  $1" ; }

runcor  () {   coreip=$1; coreip=${coreip:-96.118.57.11};  ssh -i ~/.ssh/xpc-openstack-key.txt    root@$coreip -t "hostname; $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15" ; }
runcore () {  coreip=$1; coreip=${coreip:-96.118.57.11};  ssh -i ~/.ssh/xpc-openstack-key.txt clduser@$coreip -t " hostname && $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15" ; }

hncore () {    eh=$1; eh=${eh:-96.118.57.11}; runcore $eh "hostname" | cpink ; }
hnip () {      i=$1; e=`hncore $1|cut -d"-" -f4`; echo "$i $e" ; cxi $(e)|egrep -n -C2 $i ; }

### cd at an env host
AXPC="/app/logs/api/xpc.log"
alias cdul='   cd      /app/logs/uwsgi;             ls -ltra; pwd '
alias cdal='   cd      /app/logs/api;               ls -ltra; pwd '
alias tlxpc='  tail -f /app/logs/api/xpc.log '
alias tluws='  tail -f /app/logs/uwsgi/uwsgi_xpc.log '

# glx $M2 96.118.166.130 #xpcsync-wcdcc-2d-yellow
glx () {       m=$1; h=$2; runcor $h grep --color -i $m /app/logs/api/xpc.log ; }
#tglx () {      m=$1; h=$2; sshcor $h "tail -f /app/los/api/xpc.log\|grep --color -iE '$m\|error\|webpa\|request\|async' " ; }
#[root@xpccore-ch2f-2d-amber ~]# tail -f /app/logs/api/xpc.log| egrep -i --color "5C8FE0A1BC2A|error|webpa|request|async"


# WIP sudo tail /var/log/yum.log
# WIP tail -f   /app/logs/api/xpc.log|egrep --color -i  "mac=[a-z0-9]{12}|_sns_|smoketests|forget_device|authhint|path|duration|backup|restore|webpa.*timeout"
# WIP tail -f   /app/logs/uwsgi/uwsgi_xpc.log | egrep --color "sync|8888"
# WIP curl -s   "localhost:8080/api/v1/gateway-cpe/9C34266E38A6/configuration?group_id=group_wan_configuration"

# watch env hosts if service API is running
weh () {       i=$1; sec=$2; watch -n $sec -t "ssh root@$i -i ~/.ssh/xpc-openstack-key.txt supervisorctl status all ;date" ; }
alias wehR='   weh $hostR 900'
alias wehA='   weh $hostA 900'
alias wehY='   weh $hostY 900'

#serviceA () {  e=$1; e=${e:-R}; for i in `seq 10`; do echo $i; serviceAR; now; line; sleep 900; done ; }
#alias servAA=' serviceA A'

### Check services on env hosts
# check python web server status on env hosts: $ for i in $licR; do echo;echo $i; runcor $i service uwsgi status; done
# sudo service splunk status
# sudo service ntpd   status
# sudo service puppet status
# supervisorctl       status all   # services as: api, consul_agent, flower, xmagent, xmanage 
alias serviceUR='(for i in $licR;   do echo;echo $i; runcor $i service uwsgi status;     done)|cred'

alias serviceAllR='(for i in $licR 96.118.57.10 96.118.57.12 96.118.27.107 96.118.27.106;   do echo;echo $i; runcor $i supervisorctl status all; done)|cred'

alias serviceAR='(for i in $licR;   do echo;echo $i; runcor $i supervisorctl status all; done)|cred'
alias serviceAA='(for i in $licA;   do echo;echo $i; runcor $i supervisorctl status all; done)|camber'
alias serviceAY='(for i in $licY;   do echo;echo $i; runcor $i supervisorctl status all; done)|cyellow'


alias serviceAOR='(for i in $licOR; do echo;echo $i; runcor $i supervisorctl status all; done)|camber'
alias serviceAOA='(for i in $licOA; do echo;echo $i; runcor $i supervisorctl status all; done)|camber'
alias serviceAOY='(for i in $licOY; do echo;echo $i; runcor $i supervisorctl status all; done)|camber'

alias llcR='for i in $licR; do echo;echo $i; runcor $i ls -ltra /app/logs/api|tail; done'
# check last file of api/ logs:                $ for i in $licR; do echo;echo $i; runcor $i ls -ltra /app/logs/api|tail; done
# When API ver got err: 1/pingf $hostR; 2/dig it for DNS; 3/sshcor it for supervisorctl status api first, then uwsgi next; 4/check logs/api/*.log; 5/ps -ef some more...
tlu () {       h=$1; runcor $h tail -f /app/logs/api/uwsgi_xpc.log ; }
tlx () {       h=$1; runcor $h tail -f /app/logs/api/xpc.log ; }
tlh () {       h=$1; runcor $h tail -f /app/logs/api/$2.log ; }
tlhg () {      h=$1; runcor $h tail -f /app/logs/api/$2.log | grep -iE "error|fail" ; }

### SHA
# get the latest SHA, by API version
sha1 () {      rp=$1; rp=${rp:-xap}; echo "@ `date` : "|cblue; cd ~/checkouts/$rp; echo -n "The lastest SHA: "; echo -n "/$rp/ <*`cbr`> : "|cpink; git log -p -1 | egrep -o "commit [0-9a-f]{7}" |cut -c8-14 ; }

# get SHA,     by sshcore and check yum log info
coresha () {   coreip=$1; coreip=${coreip:-96.118.57.13}; ssh -i ~/.ssh/xpc-openstack-key.txt clduser@$coreip -t "echo `seq  -f = -s '' 20 `; date; hostname; sudo tail -4 /var/log/yum.log" ; }
csha () {      coreip=$1; coreip=${coreip:-96.118.57.13}; ssh -i ~/.ssh/xpc-openstack-key.txt clduser@$coreip -t "echo `seq  -f = -s '' 20 `; date; hostname; yum info xap      " ; }
#alias shared=' for i in 57.11 57.13 27.110 30.93 ; do coresha 96.118.$i ; done '

# get the latest SHA  from github versus current on Red/A/Y hosts
g_c () {       cdxa; git pull 2> /dev/null; commit=$1; commit=${commit:-1}; gc=`git log -p -$commit | egrep -o "commit [0-9a-f]{7}" |cut -c8-14`; echo "GitHub xap repos: SHA=$gc"; echo; for i in $licR ; do echo -n red_core_$i: SHA=; cc=`curl -s $i:8080/api/v1/version|pjson|grep commit|tr ',\"' ' '|cut -d. -f4`; echo  $cc ; [ $gc != $cc ] && echo ">>>> NOT_matched `date` <<< " && echo ; done ; }
g_cA () {      cdxa;git pull 2> /dev/null;                                 gc=`git log -p -1       | egrep -o "commit [0-9a-f]{7}" |cut -c8-14`; echo "GitHub xap repos: SHA=$gc"; echo; for i in $licA ; do echo -n amb_core_$i: SHA=; cc=`curl -s $i:8080/api/v1/version|pjson|grep commit|tr ',\"' ' '|cut -d. -f4`; echo  $cc ; [ $gc != $cc ] && echo ">>>> NOT_matched `date` <<< " && echo ; done ; }
g_cY () {      cdxa;git pull 2> /dev/null;                                 gc=`git log -p -1       | egrep -o "commit [0-9a-f]{7}" |cut -c8-14`; echo "GitHub xap repos: SHA=$gc"; echo; for i in $licY ; do echo -n yel_core_$i: SHA=; cc=`curl -s $i:8080/api/v1/version|pjson|grep commit|tr ',\"' ' '|cut -d. -f4`; echo  $cc ; [ $gc != $cc ] && echo ">>>> NOT_matched `date` <<< " && echo ; done ; }

#g_c13 () {    cdxa; git pull 2> /dev/null; commit=$1; commit=${commit:-1}; gc=`git` log -p -$commit | egrep -o "commit [0-9a-f]{7}" |cut -c8-14`; echo "GitHub xap repos: SHA=$gc"; echo; for i in $lic13R ; do echo -n red13_core_$i: SHA=; cc=`curl -s $i:8080/api/v1/version|pjson|grep commit|tr ',\"' ' '|cut -d. -f4`; echo  $cc ; [ $gc != $cc ] && echo ">>>> NOT_matched `date` <<< " && echo ; done ; }

### get version SHA
# get ver Yellow or N-1: ask "version" API, using https to hit loadbalancer: https://yellow.awsxpc.comcast.net/api/v1/version

gOver () {     h=$1; u="http://$h:8080/api/v1/operational/version"; ech2 $u; curl -s -X GET $u|pjson ; }
gverO () {     h=$1; curl -s -X GET http://$h:8080/api/v1/operational/version|pjson|gc2 commit ; }
gver () {      h=$1; curl -s -X GET http://$h:8080/api/v1/version|pjson|gc2 commit ; }

ver24R () {    for h in $licR ; do echo -n "red_core_$h: ";     gver $h ;       done ; }
ver24A () {    for h in $licA ; do echo -n "amb_core_$h: ";     gver $h ;       done ; }
ver24Y () {    for h in $licY ; do echo -n "yel_core_$h: ";     gver $h ;       done ; }

verOR () {     for i in 96.118.61.36     96.118.61.32     96.118.61.26     96.118.61.37     96.118.27.89     96.118.27.90     96.118.16.118     96.118.16.126; do ech2 "ODP_red_core_$i: "; gverO $i; done ; }
#verOA () {     for h in $licOA; do echo -n "ODP_amb_core_$h: "; gverO $h ;       done ; }
#ipcOY $ cxi_ odp-yellow |grep -A5 odpcore-|gc2 ip|a1line
verOY () {     for i in 96.118.58.242     96.118.59.24     96.118.58.243     96.118.59.240     96.119.228.111     96.119.228.116     96.119.228.102     96.119.227.94     96.118.168.234     96.118.168.241; do ech2 "ODP_yellow_core_$i: "; gverO $i; done ; }

ver13R () {    for h in $lic13R;do echo -n "red13_core_$h: ";   gver $h ;       done ; }
ver13A () {    for h in $lic13A;do echo -n "amb13_core_$h: ";   gver $h ;       done ; }
ver13Y () {    for h in $lic13Y;do echo -n "yel13_core_$h: ";   gver $h ;       done ; }

verR () {      ver24R;  ver13R ; god red    core ; }
verA () {      ver24A;  ver13A ; god amber  core ; }
verY () {      ver24Y;  ver13Y ;                   }

# get ver N, N-1
verN () {      ver24R; verOR ; }
verN1 () {     verY;   verOY ; }
 
vern () {      gver    $hostR ; }
vern1() {      gver    $hostY ; }

# get current SHA at N, N-1
snn1 () {      sha1  xap ; echo "Code level   N : `vern`"|cred; echo "Code level N-1 : `vern1`"|camber  ; }
snn2 () {      (newxa && snn1) | tee -a $HOME/logs/snn.log ; }

# WIP alias apixpc='open https://red.awsxpc.comcast.net/docs'
#swagger UI Yellow https://odpyellowuiorch.odpaws.comcast.net/docs
#swagger UI hostR http://96.118.57.11:8080/docs/#!/v1
#swagger UI hostR http://96.118.57.11:8080/docs/#!/v1/Cscpe_Apply_Association_POST
#swagger UI hostR http://96.118.57.11:8080/docs/#!/v1/Cs_Create_Config_Set_POST
#http://96.118.57.11:8080/docs/#!/v1/Cs_Association_DELETE
#alias apixpc='open http://96.119.227.212:8080/docs/#!/v1'
#alias apiodp='open http://96.118.27.12/docs/#!/v1'
#oah () {      h=$1; open           http://$h:8080/docs ; }
#cah () {      h=$1; curl -s -X GET http://$h:8080/docs/api-docs/api/v1|pjson|grep path  ; }
#swagger ODP red core: for i in 96.118.61.36 96.118.61.32 96.118.61.26 96.118.61.37 96.118.27.89 96.118.27.90 96.118.16.118 96.118.16.126 ; do echo ODP $i; open http://$i:8080/docs; done
#swagger XPC red core: 96.118.57.10 96.118.57.11 96.118.57.12 96.118.57.13 96.118.27.107 96.118.27.110 96.118.27.106 96.118.30.93 

#swager webpa: https://swagger.webpa.comcast.net/
alias oswag_webpa='open https://swagger.webpa.comcast.net/'

### CPE configuration
isc () {      m=$1; h=$2; curl -s -X GET    http://$h:8080/api/v1/gateway-cpe/$m/configuration    |pjson|cblue ; }

### API
CSBU="/api/v1/gateway-configset"
CPEBU="/api/v1/gateway-cpe"

cpf () {      c=$1; h=$2; u="http://$h:8080$CSBU/$c/configuration_table/portforwarding_configuration_table"; ech2 $u; curl -s -X GET $u |pjson|cblue ; }

http://96.118.23.51:8080/api/v1/internal/gateway-cpe/3C7A8A376BCC/synccsidcmc
asc () {      m=$1; h=$2; u="http://$h:8080/api/v1/internal/gateway-cpe/$m/synccsidcmc"; ech2 $u; curl -s -X GET $u |pjson|ccyan ; }
asi () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/sync_info";     ech2 $u; curl -s -X GET $u |pjson|cblue ; }

acs () {      m=$1; h=$2; u="http://$h:8080$CSBU"; ech2 $u; curl -s -X GET $u |pjson|cblue ; }
aws () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/webpa_stat";    ech2 $u; curl -s -X GET $u |pjson|cblue ; }      
adc () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/device_class";  ech2 $u; curl -s -X GET $u |pjson|cblue ; }   
agw () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/gateways";      ech2 $u; curl -s -X GET $u |pjson|cblue ; }      
ain () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/initialization";ech2 $u; curl -s -X GET $u |pjson|cblue ; }
awp () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/wifi_personalization";      ech2 $u; curl -s -X GET $u |pjson|cblue ; }      
apf () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/post-factory-reset-action"; ech2 $u; curl -s -X GET $u |pjson|cblue ; }

aca () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_cpe_action";                   ech2 $u; curl -s -X GET $u |pjson|cblue ; }
aga () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_all";                          ech2 $u; curl -s -X GET $u |pjson|cblue ; }
aci () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_cpe_information&refresh";      ech2 $u; curl -s -X GET $u |pjson|cblue ; }
abm () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_bridge_mode_configuration";    ech2 $u; curl -s -X GET $u |pjson|cblue ; }
apws () {     m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_private_wifi_statistics";      ech2 $u; curl -s -X GET $u |pjson|cblue ; }
apwa () {     m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_private_wifi_advanced_configuration";   ech2 $u; curl -s -X GET $u |pjson|cblue ; }
apw () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_private_wifi_configuration";   ech2 $u; curl -s -X GET $u |pjson|cblue ; }
apl () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_private_lan_configuration";    ech2 $u; curl -s -X GET $u |pjson|cblue ; }
ar2 () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_radio_2g_configuration";       ech2 $u; curl -s -X GET $u |pjson|cblue ; }
ar5 () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_radio_5g_configuration";       ech2 $u; curl -s -X GET $u |pjson|cblue ; }
amm () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_moca_mode_configuration";      ech2 $u; curl -s -X GET $u |pjson|cblue ; }
awc () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_wan_configuration";            ech2 $u; curl -s -X GET $u |pjson|cblue ; }
awr () {      m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_interface_devices_wifi_report_configuration"; ech2 $u; curl -s -X GET $u |pjson|cblue ; }

ahsm () {     m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_home_security_wifi_configuration"; ech2 $u; curl -s -X GET $u |pjson|cblue ; }
ahsc () {     c=$1; h=$2; u="http://$h:8080$CSBU/$c/configuration?group_id=group_home_security_wifi_configuration";  ech2 $u; curl -s -X GET $u |pjson|cpink ; }

ifmh () {     m=$1; h=$2; amh $m $h; aci $m $h ; }

### traffic usage ... WIP
dtd () {      m=$1; h=$2; u="http://$h:8080/api/v1/operational/gateway-cpe/$m/devices/traffic_data?start_time=2017-03-31T16:57:47-07:00&end_time=2017-03-31T17:57:47-07:00&group=hour&delta=true&tz=PTZ" ; echo URL=$u; curl -s -X GET $u ; }

### check cpe is in bridge mode == LanMode: https://api.webpa.comcast.net:8090/api/v2/device/mac:F8A097EF28AA/config?names=Device.X_CISCO_COM_DeviceControl.LanManagementEntry.1.LanMode


### curl commands: GET, POST, input=[ api_url json_data_file ]
curltime=" -w @$HOME/Help/curl-format2.txt"

cPost () {    u="$1"; j=$2; ech2 $u; ech2 $j; curl -s -X POST $u -H "Content-Type: application/json" --data '$j' | pjson | cblue ; }
cP () {       u="$1"; j=$2; ech2 $u; ech2 $j; curl -s -X POST $u -H "Content-Type: application/json"  -d $j   | pjson | cblue ; }
# used this to reset value:false for XDNS: POST $ cP http://$hostR:8080/api/v1/internal/gateway-cpe/10868CEA6D24/tunnel @xvF.json
# file xvF.json: {"parameters":[ {"name":"Device.DeviceInfo.X_RDKCENTRAL-COM_EnableXDNS","value": "false", "dataType":3}]}
cPcsid () {   h=$1;   cG http://$h:8080/api/v1/gateway-configset/$2 ; }

cG () {       u="$1"; ech2 "GET $u"; curl -s -X GET  $u | pjson | ccyan ; }
cGver () {    h=$1;   u="http://$h:8080/api/v1/version";                cG $u ; }
cGcpe () {    h=$1;   u="http://$h:8080/api/v1/gateway-cpe/$2";         cG $u ; }
cGcsid () {   h=$1;   u="http://$h:8080/api/v1/gateway-configset/$2";   cG $u ; }

### check smkt sync failed at 1_SparkMaster + 2_Hook + 3_Kafka + (assumed OK at 4_WebPA + 5_RDKB)
# sync at 1_Spark
s1_sparkm () { c=$1; c=${c:-red}; ech2 $c; cxi_ $c |grep -A4 sprkm-|egrep -ni "is_active|sprkm-|ip|ch2f|cmce|asb|wcdcc" ; ech2 "Verify spark master sync... active true and false" ; ech2 "@@@ get ip ... to run ow8 next" ; }
ow8 () {       i=$1; u="http://$i:8080"; ech2 "verify spark master sync...$u... state: S/B Running, on app id"; open $u; curl -is $u|egrep -i "runn|waiting" ; }
ow8_swagger () { i=$1; u="http://$i:8080/docs"; ech2 "Swagger $u, click v1/v2"; open $u; curl -is $u ; }

# sync at 2_Hook
hkWeb="/app/logs/hooks/webserver.log"
hkPrd="/app/logs/hooks/producer.log"
hkXpc="/app/logs/hooks/xpc.log"

#sshc $lsyR
#alias llr='ls -ltraF';alias grep='grep --color '; alias cdls=' cd /app/logs/api/; ls -ltraF|tail' ;alias tlsy=' tail -f /app/logs/api/xpc.log | grep -iE "044E5A9AE8EC" '
#gsy () { ; }
lsyR="96.118.57.14    96.118.57.15   96.118.57.16   96.118.57.17   96.118.27.240  96.118.27.245  96.118.27.246  96.118.30.92"
lsyA="96.119.226.201  96.119.227.230 96.119.226.202 96.119.227.233 96.119.243.41  96.119.243.42  96.118.23.64   96.118.23.65  96.118.23.61  96.118.31.1"
lsyY="96.119.231.173  96.119.224.61  96.119.228.8   96.118.166.129 96.118.166.130 96.118.172.89  96.118.185.22  96.118.18.203 96.118.18.204 96.118.18.205"

ssyR () {     csshx -l root $lsyR ; }
ssyA () {     csshx -l root $lsyA ; }
ssyY () {     csshx -l root $lsyY ; }

lhkR="96.118.57.20    96.118.57.21   96.118.27.122  96.118.27.121"
lhkA="96.119.227.248  96.119.227.25  96.119.245.72  96.119.245.82  96.118.23.67  96.118.23.68"
lhkY="96.119.226.171  96.119.226.176 96.118.167.88  96.118.167.89"

shkR () {     sshc $lhkR ; }
shkA () {     sshc $lhkA ; }
shkY () {     sshc $lhkY ; }

sshchk () {   lhk=$*; sshc $lhk ; }
s2_hk () {    e=$1; e=${e:-red}; cxi $e |  egrep -A1 xpchook ; }

alias cdhk='  cd      /app/logs/hooks'
alias tlwp='  cdhook; tail -f webserver.log  producer.log '

hosthk () {   cxi $1 |  egrep -A1 xpchook |  gc2 ip | tail -1 ; }
hktable () {  tr ' <>' '\n'| column -s= -t ; }

listhk () {   hh=$1;  ech2 $hh; runcore $hh ls -ltra /app/logs/hooks               \|tail ; }

gehkw () {    hh=$1;  ech2 $hh; runcore $hh grep -i error  /app/logs/hooks/webserver.log ; }
gehkp () {    hh=$1;  ech2 $hh; runcore $hh grep -i error  /app/logs/hooks/producer.log ; }

thkwp () {    hh=$1;  ech2 $hh; runcore $hh tail -f  $hkWeb $hkPrd ; }
alias vhkwp=' conv |  hktable '

ghk () {      egrep -i "webserver.log|producer.log|SYNC_NOTIFICATION|cid|cmc.*|mac|topic|hCPE_Events|error" ; }


# sync at 3_Kafka , server named as "xpcque" and related "xpczoo"
# to check messages in kafka: cd /app/kafka/bin; ./kafka-console-consumer.sh --zookeeper 96.118.188.122:2181 --topic hCPE_Events
s3_k () {     e=$1; e=${e:-red}; cxi $e | gx "que|zoo" ; }
alias cdkcons='cd     /app/logs/consumer'
alias cdkxpcl='cd     /app/logs/xpclog'

# sync at 4_SparkWorker
s4_s () {     e=$1; e=${e:-red}; cxi $e | gx "sprkw" ; }



### Redis nodes
# log into a xpcredis or odpredis- node; ls /app/redis/; export PATH=$PATH:/app/redis/bin ; /app/redis/bin/redis-cli keys "sat*" ; /app/redis/bin/redis-cli get sat_token_yyyymm..
# find an odpcore node, sshcorh in; run curl on api get resdis sat-token $curSat 
# $ ipc red; #get a core host; then $ curSat 96.118.57.11
# alternately, can get sat-token from sat-server, thru webpa api, line in script get_fwcpe_thru_webpa.py
# ex: for i in $licR; do line; echo $i; runcor $i curl -s localhost:8080/api/v1/common/sat?source=current ; line; done

sat () {        open   https://red.awsxpc.comcast.net/api/v1/common/sat ; }
curSat () {     eh=$1; runcore $eh  curl -s localhost:8080/api/v1/common/sat?source=current         \| python -m json.tool ; }
curSatVerb () { eh=$1; runcore $eh  curl -s localhost:8080/api/v1/common/sat?source=current&verbose \| python -m json.tool ; }

# local and redis should matched
curSatLoca () { eh=$1; runcore $eh  curl -s localhost:8080/api/v1/common/sat?source=local           \| python -m json.tool ; }
curSatRedi () { eh=$1; runcore $eh  curl -s localhost:8080/api/v1/common/sat?source=redis           \| python -m json.tool ; }

### Remedial step: re-create sat-token (if found that it is expired, not refreshed, or invalid) from source CodeBig2
remSat () {     eh=$1; runcore $eh  curl -s localhost:8080/api/v1/common/sat                        \| python -m json.tool ; }

# @core: cdredis-cli  /app/redis/bin/redis-cli
# $ ipr red ; #get a "redis-" host: ex: 96.118.25.55; then $ ecli 96.118.25.55 keys sat*; then $ rcli 96.118.25.55 get  sat_token_2     01704061800
rcli () {       rh=$1; c2=$2; c3=$3; c4=$4; c5=$5; c6=$6; runcore $rh /app/redis/bin/redis-cli $c1 $c2 $c3 $c4 $c5 $c6 ; }


### SNS endpoints to notif per changes within CPE. egrep "event|_change"; using /api/v1/sns/gateway-cpe/$m/notifications
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
snsR_endp () {  m=$1; $2 $3 http://ec2-54-213-77-81.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/$m/notifications; now  ; }
snsA_endp () {  m=$1; $2 $3 http://ec2-54-186-182-99.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/$m/notifications; now  ; }
snsY_endp () {  m=$1; $2 $3 http://ec2-54-244-5-162.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/$m/notifications; now  ; }
gsns () {       egrep -i "event|_change" ; }

snsR () {       m=$1; m=${m:-$M2}; snsR_endp $m  open ; }
snsA () {       m=$1; m=${m:-$M2}; snsA_endp $m  open ; }
snsY () {       m=$1; m=${m:-$M2}; snsY_endp $m  open ; }
snsYc () {      m=$1; m=${m:-$M2}; snsY_endp $m  curl -s | pjson | gsns ; }

# POST { "is_whitelisted": true } ; GET http://ec2-54-213-77-81.us-west-2.compute.amazonaws.com/api/v1/sns/gateway-cpe/F8A097EF091F/whitelist


### icingamonitor
alias imon='    ech2  "Username:icingaadmin, Password:powercloud"; open http://icingamonitor.awsxpc.comcast.net/icinga/ '

### open teamccp
alias oautomqa='open  https://www.teamccp.com/confluence/pages/viewpage.action?pageId=104106675'
alias obookxpc='open  https://www.teamccp.com/confluence/pages/viewpage.action?pageId=167300441#xPCPlaybook(xFi)-XPCRunbook'
alias obook='   open  /Users/hlam001c/Documents/si/api_docs/XPCRunbook_042717.docx'
#alias oobj='    open  /Users/hlam001c/Documents/si/api_docs/'
alias oncall='  open  https://www.teamccp.com/confluence/pages/viewpage.action?pageId=181703531'

# user pwd in clear text ODP-2371: verified with $licO and $licX, see all encrypted
#for o in $licO; do echo $o; runcore $hostOY egrep -i "user\|pass" /app/xap/conf/instance_config.py; done

### enable moca;                              ex: xpccore-ch2f-2d-yellow 96.119.225.204 MAC=5C8FE07EE122
en_moca () {   m=$1; echo "enable moca: xpccore-ch2f-2d-yellow 96.119.225.204 MAC=5C8FE07EE122 " ; \
  curl --request POST \
  --url    'http://96.119.225.204:8080/api/v1/gateway-cpe/$m/configuration?group_id=group_moca_mode_configuration' \
  --header 'cache-control: no-cache' \
  --header 'content-type: application/json' \
  --header 'postman-token: 7a115ddd-a099-381f-0aac-4965a1988b11' \
  --data   '{"moca_enabled" : true}' | pjson | cpink ; }

### set CPE level XDNS policy filter_level:1; ex: 96.118.61.32 odpcore-asb-2d-red, MAC=10868CEA6D24
filter_level_1 () {  echo "set CPE level XDNS policy filter_level:1: 96.118.61.32 odpcore-asb-2d-red, MAC=10868CEA6D24"; \
  curl --request POST \
  --url    http://96.118.61.32:8080/api/v1/operational/gateway-cpe/10868CEA6D24/xdns_content_filtering \
  --header 'cache-control: no-cache' \
  --header 'content-type: application/json' \
  --header 'postman-token: 19f76f36-d05a-b68c-bf4d-c6a55a888414' \
  --data   '{"filter_level": 1}' | pjson | cpink ; }

### set device level:                         ex: 96.118.51.38 odpcore-asb-4d-amber, MAC=10868CEA6D24
set_dev_lev () {    curl --request POST \
  --url    http://96.118.51.38:8080/api/v1/operational/gateway-cpe/10868CEA6D24/devices/xdns_content_filtering \
  --header 'cache-control: no-cache' \
  --header 'content-type: application/json' \
  --header 'postman-token: 2903837a-8818-b8c8-a3f8-175b9f7c6134' \
  --data   '{ "xdns_content_filtering_list": [{"device_mac": "dd00dd00dd00", "filter_level": 0}, {"device_mac": "dd11dd11dd11", "filter_level": 1}, {"device_mac": "dd22dd22dd22", "filter_level": 2}, {"device_mac": "dd33dd33dd33", "filter_level": 3}]}' | pjson | cpink ; }

### create csid:                              ex: 96.118.57.13 hostR MAC=F44B2A77BF28
create_csid () {   curl --request GET \
  --url    http://96.118.57.13:8080/api/v1/gateway-cpe/F44B2A77BF28/association \
  --header 'cache-control: no-cache' \
  --header 'postman-token: 770997cc-8dc0-33bf-c45d-3b751e278181' ; }

create_csid_payload () { curl -X POST \
  http://96.118.57.13:8080/api/v1/gateway-configset \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: f35f9c9b-1f04-8da6-22ab-dfa14e117426' \
  -d '{ "group_private_wifi_configuration": { "ssid_name_2g": "temp_2g12", "wifi_passphrase_2g": "password1", "ssid_enabled_2g": true, "broadcast_ssid_2g": true, "wifi_security_2g": 2, "ssid_name_5g": "temp5g", "wifi_passphrase_5g": "password1", "ssid_enabled_5g": true, "broadcast_ssid_5g": true, "wifi_security_5g": 2 } }' ; }

### Graphana:
# URL:http://96.119.229.177:8080/dashboard/db/qa-metrics-red; u:p=admin:root12345

### greenpostman https://xpcapi-si.xpc.comcast.net/api/v1/gateway-configset/ Note: Do not run negative test on this endpoint as this will generate alerts
#   greenpostman https://xpcapi-si.xpc.comcast.net/api/v1/gateway-configset/5CB066241153/configuration?group_id=group_private_wifi_configuration

### reset flag CloudUIEnable steps:
#0/this to get version   : https://red.awsxpc.comcast.net/api/v1/version   
#1/this to get sat token : https://red.awsxpc.comcast.net/api/v1/common/sat
#put key in Authorization : Bearer <sat_token>
#curl -X GET 'https://api.webpa.comcast.net:8090/api/v2/device/mac:044E5A9AE8EC/config?names=Device.DeviceInfo.X_RDKCENTRAL-COM_CloudUIEnable' -H 'authorization: Bearer  eyJraWQiOiJzYXQtcHJvZC1rMS0xMDI0IiwiYWxnIjoiUlMyNTYifQ.eyJqdGkiOiI2MGZhODU0Mi1kNzNmLTRhZjktYWIxYi05ZTg4NTAxNDViZjYiLCJpc3MiOiJzYXRzLXByb2R1Y3Rpb24iLCJzdWIiOiJ4MTpwcm9kOnhwYzowOTA4OWMiLCJpYXQiOjE0OTYyNTYwMTQsIm5iZiI6MTQ5NjI1NjAxNCwiZXhwIjoxNDk2MzQyNDE3LCJ2ZXJzaW9uIjoiMS4wIiwiYWxsb3dlZFJlc291cmNlcyI6eyJhbGxvd2VkUGFydG5lcnMiOlsiY29tY2FzdCJdfSwiY2FwYWJpbGl0aWVzIjpbIngxOndlYnBhOmFwaTpkZXZpY2UvLiovY29uZmlnXFxiOmFsbCIsIngxOndlYnBhOmFwaTpkZXZpY2UvLiovY29uZmlnXFxiOmdldCIsIngxOndlYnBhOmFwaTpkZXZpY2UvLiovc3RhdFxcYjpnZXQiLCJ4MTp3ZWJwYTphcGk6aG9va1xcYjpwb3N0IiwieDE6d2VicGE6YXBpOmhvb2tzXFxiOmdldCJdLCJhdWQiOltdfQ.YrtVQQtrwmCHVcpeuC1mEfMpGBexUIX54Bxo61xMDIAvg_9VXYIW2qSdKED2-Bcj-GJHXCLqMTpEt5S7I4rNV7PIBoLx5Rj46LdmJSQr9khK56LKgCA0vvkcLPJd7mePmlannS5Bl7HHNUHg7hwrSd41LZyAfCneyw8O2HBOjXk' -H 'content-type: application/json' 
#
#curl -X PATCH https://api.webpa.comcast.net:8090/api/v2/device/mac:044E5A9AE8EC/config -H 'authorization: Bearer  eyJraWQiOiJzYXQtcHJvZC1rMS0xMDI0IiwiYWxnIjoiUlMyNTYifQ.eyJqdGkiOiI2MGZhODU0Mi1kNzNmLTRhZjktYWIxYi05ZTg4NTAxNDViZjYiLCJpc3MiOiJzYXRzLXByb2R1Y3Rpb24iLCJzdWIiOiJ4MTpwcm9kOnhwYzowOTA4OWMiLCJpYXQiOjE0OTYyNTYwMTQsIm5iZiI6MTQ5NjI1NjAxNCwiZXhwIjoxNDk2MzQyNDE3LCJ2ZXJzaW9uIjoiMS4wIiwiYWxsb3dlZFJlc291cmNlcyI6eyJhbGxvd2VkUGFydG5lcnMiOlsiY29tY2FzdCJdfSwiY2FwYWJpbGl0aWVzIjpbIngxOndlYnBhOmFwaTpkZXZpY2UvLiovY29uZmlnXFxiOmFsbCIsIngxOndlYnBhOmFwaTpkZXZpY2UvLiovY29uZmlnXFxiOmdldCIsIngxOndlYnBhOmFwaTpkZXZpY2UvLiovc3RhdFxcYjpnZXQiLCJ4MTp3ZWJwYTphcGk6aG9va1xcYjpwb3N0IiwieDE6d2VicGE6YXBpOmhvb2tzXFxiOmdldCJdLCJhdWQiOltdfQ.YrtVQQtrwmCHVcpeuC1mEfMpGBexUIX54Bxo61xMDIAvg_9VXYIW2qSdKED2-Bcj-GJHXCLqMTpEt5S7I4rNV7PIBoLx5Rj46LdmJSQr9khK56LKgCA0vvkcLPJd7mePmlannS5Bl7HHNUHg7hwrSd41LZyAfCneyw8O2HBOjXk' -H 'content-type: application/json' -d '{"parameters":[ {"name":"Device.DeviceInfo.X_RDKCENTRAL-COM_CloudUIEnable","value": "false", "dataType":3} ]}'
#

# oconf ; xFi Platform ; One Stop Page ; QA Cheat Sheet ; xfinity power cloud ; jxm 
# updated status: https://ccp.sys.comcast.net/browse/ODP


### DB cassandra cql_u:p=cassandra:cassandra    cassandra:c@ss@n6R@    xpcuser:ye!!eNV     odpuser2:Y3LLeNV

#cqlsh 96.118.54.192 -u cassandra -p cassandra --ssl; cassandra@cqlsh> use odp; desc table; desc table device_somthing
#cqlsh               -u cassandra -p cassandra --ssl  $(hostname -i)
# XPC 96.119.231.124 [root@xpcdb-ch2f-1d-yellow ~]# cqlsh -u cassandra -p c@ss@n6R@ $(facter ipaddress) --ssl -e "select * from xpc.hcpe_port_forward_config where cpe_mac='10868CEA6D24' "

#[root@odpdb-asb-10d-yellow ~]# cqlsh --ssl -u cassandra -p c@ss@n6R@ $(facter ipaddress)
#[root@odpdb-asb-10d-yellow ~]# cqlsh -u odpuser2 -p Y3LLeNV --ssl $(hostname -i) -e "select * from odp.device_management_celery_tasks           where cpe_mac = '3C7A8A3762DA' and device_mac = '11111D8CA420' " > nullData_3C7A8A3762DA_3C7A8A3762DA.txt
#[root@odpdb-asb-10d-yellow ~]# cqlsh -u odpuser2 -p Y3LLeNV --ssl $(hostname -i) -e "select * from odp.device_management_config                 limit 10"
#[root@odpdb-asb-10d-yellow ~]# cqlsh -u odpuser2 -p Y3LLeNV --ssl $(hostname -i) -e "select * from odp.device_management                        limit 10" 
#[root@odpdb-asb-10d-yellow ~]# cqlsh -u odpuser2 -p Y3LLeNV --ssl $(hostname -i) -e "select * from odp.device_management_gateway_schedules      limit 10"
#[root@odpdb-asb-10d-yellow ~]# cqlsh -u odpuser2 -p Y3LLeNV --ssl $(hostname -i) -e "select * from odp.device_management_cloud_schedules_config limit 10" 

### Device mgmt:
# GET/DELETE info of dev_mgmt in ODP DB on an env:  http://{{host}}/api/v1/operational/gateway-cpe/{{CPEMAC3}}/devices/device_management
# $ dm_db $M2 $hostR GET
dm_db () {   m=$1; e=$2; meth=$3; u="http://$e:8080/api/v1/operational/gateway-cpe/$m/devices/device_management"; ech2 $u; curl -s -X $meth $u | pjson ; }

### bedtime:
# GET sched https://odpyellowuiorch.odpaws.comcast.net/api/v1/operational/gateway-cpe/F44B2A77BF28/devices/111111111111/device_management_configuration
# POST { "action":"allow" }; { "action":"block" }; http://odpyellowuiorch.odpaws.comcast.net/api/v1/operational/gateway-cpe/044E5A9AE8EC/devices/111111111111/device_management_configuration 
# Create/set_bedtime { "action": "delete_bedtime" }; POST  https://odpyellowuiorch.odpaws.comcast.net/api/v1/operational/gateway-cpe/044E5A9AE8EC/devices/111111111111/device_management_configuration

### Get DM obj within CPE thru WebPA API:
# DELETE index of CPE: https://api.webpa.comcast.net:8090/api/v2/device/mac:044E5A9AE8EC/config/Device.X_Comcast_com_ParentalControl.ManagedDevices.Device.15.
# GET    info of dev_mgmt right on the CPE thru WebPA: means need SAT token: https://api.webpa.comcast.net:8090/api/v2/device/mac:{{CPEMAC3}}/config?names=Device.X_Comcast_com_ParentalControl.ManagedDevices.Device.
#dm_cpe () {  m=$1;                curl -s -X GET   http://api.webpa.comcast.net:8090/api/v2/device/mac:$m/config?names=Device.X_Comcast_com_ParentalControl.ManagedDevices.Device.  ; } 


# DB Update stmt: red DB 96.118.61.254 odpdb-asb-1d-red  cassandra@cqlsh:odp> update cpe_devices_summary set last_seen_hostname='henry' where cpe_mac='10868CEA6D24' and device_mac='2C200B1A237F' ;

# Vernon QUORUM/Nanda 051217
# set config:      /app/xap/conf/instance_config.py
# default set ODP: /app/xap/src/settings/odp_settings.py
# default set XPC: /app/xap/src/settings/xpc_settings.py

### List smoketests:
# smoketest GREEN:  3x: smoketest-on-green smoketest-on-green-validation smoketest-sync-green
#                       smoketest-celery-task-xpc-green  smoketest-celery-task-xpc-green-ho smoketest-celery-task-odp-green
# smoketest YELLOW: 3x: smoketest-on-yellow latest-rdkb-smoketest-on-yellow smoketest-sync-yellow 
#                       smoketest-on-yellow-expanded 
# smoketest AMBER: x:
# smoketest RED: x:

### Python 2.7.11 : [Tan] curl -OL http://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz ; tar xzvf Python-2.7.11.tgz ; cd Python-2.7.11 ; ./configure --prefix=/usr/local --enable-shared ; make ; make install ; which python ; python --version

### Python module tabulate: download https://pypi.python.org/pypi/tabulate#downloads and run $ sudo pip2.7 install tabulate
# pip freeze | grep tabulate
# sudo easy_install -U requests
# sudo pip install requests==2.8.1
# ls -l /usr/bin/python; versus: ls -l /usr/local/bin/python
# unlink python2.7; unlink python2

### Jira ticket2ver of 17.6.1 on 17.6.2 last monday : https://www.teamccp.com/confluence/display/SMARTINT/Release+Summary+-+17.6.1 
# Jira link tickets: open the new sub ticket of automation; from dropdown menu "More", select "Link", then name the XPC major ticket

### pem files: at ~/Documents/Vernon/ and txt guide file and pwd

# for all 4 xpc core nodes: code at /app/xpc/conf; [root@odpcore-asb-3d-red ~]# puppet agent -t
# for all 4 odp core nodes: code at /app/xap/conf; to check flag ODP_WEBPA520_HANDLER_ENABLED in file /app/xap/conf/instance_config.py

### Passed smoketest sync
alias ok_ssr=' ech2 "ssr ok fail:Passed= 1:14"; open  https://odpjenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-sync-on-red/64103/console'
alias ok_ssa=' ech2 "ssa ok fail:Passed= 1:9 "; open  https://odpjenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-sync-amber/96721/console'
alias ok_ssy=' ech2 "ssy ok fail:Passed= 1:14"; open  https://odpjenkins.awsxpc.comcast.net/view/All%20XPC%20Test%20jobs/job/smoketest-sync-yellow/58359/console'


### smoketest slave nodes of app=build , red/amber specific usage: production-96.119.83.200 red-smoketest-server-agent-96.118.55.6 
# smoketest run details at /opt/<the smoketest name>; $ [root@smoketest-server-agent smoketest-XB6-on-amber]# ls -ltra /opt
# https://odpjenkins.awsxpc.comcast.net/computer/

### LB, SparkM nodes, checks out of mem: 
# ean amber lb; for i in 96.119.228.186 96.119.244.139 96.118.23.63; do ech2 $i; df;  uptime; done
dfn () {       e=$1; a=$2; for i in `ean $e $a|gc2 ip|a1line` ; do ech2 "===== $i:"; runcor $i "df;uptime;" ; done ; }
topn () {      e=$1; a=$2; for i in `ean $e $a|gc2 ip|a1line` ; do ech2 "===== $i:"; runcor $i "top -bn1|head;"  ; done ; }


### DEVICES: Name: CMMAC: IP_ADDR: FW:
# smoketest-n-1-on-amber-n-1	CMMAC=-3C7A8A3769C4 IP_ADDR=10.255.244.21 not5 TG1682_2.7s1_PROD_sey
# 044E5A9AE8CE  10.255.244.106 TG1682_2.6p3s2_PROD_sey
#-14CFE21479D2  10.255.244.75  TG1682_2.7s1_PROD_sey
#-14CFE2147E42  10.255.244.63  TG1682_2.7s1_PROD_sey

### Check CPE WebPA: root@Docsis-Gateway:/# ps|grep subsys
 #/usr/bin/log_agent -subsys eRT.
 #/usr/bin/PsmSsp -subsys eRT.
 #/usr/bin/CcspCMAgentSsp -subsys eRT.
 #/usr/bin/CcspPandMSsp -subsys eRT.
 #/usr/bin/CcspWecbController -subsys eRT.
 #/usr/bin/CcspMtaAgentSsp -subsys eRT.
 #/usr/bin/CcspMoCA -subsys eRT.
 #/usr/bin/CcspTandDSsp -subsys eRT.
 #/usr/bin/webpa -subsys eRT.
 #/usr/bin/CcspXdnsSsp -subsys eRT.
 #/usr/bin/CcspLMLite -subsys eRT.
#1/usr/bin/CcspTr069PaSsp -subsys eRT.

#Yong Teng [2:25 PM] CPE_MAC=F44B2A77BCCB; curl -X DELETE http://localhost:8000/api/v1/operational/internal/gateway-cpe/$CPE_MAC/tunnel_delete?names=Device.X_Comcast_com_ParentalControl.ManagedDevices.Device.30569.


### Find file in repos
fin  () {      f=$1; find ./ -name *$f* ; }
finxa () {     cdxa; fin   $1 ; }
finxt () {     cdxt; fin   $1 ; }

### Grep trings in repos
grin  () {     egrep -rin "$1" $2 $3 $4 $5 $6 $7 $8 $9 * ; }
fgxa  () {     cdxa; grin  $*  ; }
fgxt  () {     cdxt; grin  $*  ; }
grind () {     cd ~/Documents/si; egrep -rin "$*" *; pdfgrep -rin --color auto $1 * ; }

### Grep field name in DB table
gfdbx () {     egrep -i "$1" $2 $3 $4 $HOME/Help/cassandra_db/tablename.txt ; }
gfdbo () {     egrep -i "$1" $2 $3 $4 $HOME/Help/cassandra_db/tableodp.txt ; }

### Vi setting in code repos
alias visettingsx=' vi    ~/checkouts/xap/src/settings/xpc_settings.py'
alias visettingso=' vi    ~/checkouts/xap/src/settings/odp_settings.py'

### Grep configuration on server ip, pattern/flags
gcip () {      i=$1; p=$2; runcor $i "grep -rin '$p' /app/xpc/conf /app/xap/conf;" ; }

# runcor ODP- hlam001c@cacsvlo-16686:~$ (runcor 96.118.58.242 "grep -rinE --color 'ODP_WEBPA5.._HANDLER_ENABLED|ODP_WEBPA503_DEFAULT_' /app/xap")| grep app
#live code/conf/setting in core: /app/xap/conf/instance_config.py:171:ODP_WEBPA503_HANDLER_ENABLED = True

# ODP-2617: for i in $licOR; do echo $i; runcor $i "grep -rin ODP_DB_CALL_OPTIMIZATION_ENABLED /app/xap/conf ;" ; done;
# search log RAY: fglR $licOR SNS_NOTIFICATION
#fglR () {       p="$2"; for i in $1;     do echo $i; runcor $i "grep -rin $p /app/xpc/* /app/xap/*;"  ; done ; }

fglYx () {      p="$*"; for i in $licY;  do echo $i; runcor $i "grep -rin $p /app/xpc/ ;"  ; done ; }
fglYo () {      p="$*"; for i in $licOY; do echo $i; runcor $i "grep -rin $p /app/xap/ ;"  ; done ; }

# Grep string/flags configured on Red, Yellow: grcfg "= false"; gycfg "= 1\|= true"; 
grcfg () {     p="$*"; for i in $licR;  do echo $i; runcor $i "grep -rin '$p' /app/xpc/conf;"  ; done ; }
gycfg () {     p="$*"; for i in $licY;  do echo $i; runcor $i "grep -rin '$p' /app/xpc/conf;"  ; done ; }


# https://xpcapi-si.xpc.comcast.net/api/v1/networking/version
# https://xpcapi-si.xpc.comcast.net/api/v1/networking/gateway-cpe/ACB31302AE42/status?details 
# index=smart_internet path=*networking* "I xbo" OR "I tyrion"
# [root@xpcdb-asb-2d-red ~]# /usr/bin/cqlsh $(facter ipaddress) -u cassandra -p c@ss@n6R@ --ssl -e "select * from xpc.cpe_account limit 10"

# Cloud UI and FW: https://internet.xfinity.com/more/deviceinfo u:p=SI_XPC_UID65:Csv1050xPC

gst () { grep -iEo ".............$1........................................................................" ; }
gstf () { runh "conv|gst fail"   ; }
gstp () { runh "conv|grep -Eo '.................Sync Test Passed...' " ; }
gste () { runh "conv|gst error" ; }
gstx () { runh "conv|gst exception" ; }
gst2 () { gstf; gste ; }

alias cdupx='  conv|grep -io  "CMMAC=............"  |sort|uniq -c'
alias cdupo='  conv|grep -io  "CPE_MAC=............"|sort|uniq -c'
alias cdupa='  conv|grep -ioE "CPE_MAC=............|CMMAC=............"|sed '/=/s/^.*=//'|sort|uniq -c'

# last argv; lasta () { echo $*; eval last=\${$#}; echo $last ; }

### Get Post Env: use $M2, onb first: bmh $M2 $hostR; gp_R
gp_Q () { e=$1:8080; echo $e; u="http://$e/api/v1/gateway-cpe/044E5A9AE8EC/configuration?group_id=group_private_wifi_configuration"; echo $u; curl -X GET   $u -H 'content-type: application/json' |pjson    ;   curl -X POST $u  -H 'content-type: application/json'  -d '{ "wifi_passphrase_2g": "2gtestssidQUICK" }' |pjson  ; }

gp_R () { i=$1; i=${i:-$hostR}; gp_Q $i ; }
gp_A () { i=$1; i=${i:-$hostA}; gp_Q $i ; }
gp_Y () {                       gp_Q  96.119.225.204 ; }

#gp_Y () { curl -X GET   'http://96.119.225.204:8080/api/v1/gateway-cpe/044E5A9AE8EC/configuration?group_id=group_private_wifi_configuration'   -H 'content-type: application/json' |pjson    ;   curl -X POST   'http://96.119.225.204:8080/api/v1/gateway-cpe/044E5A9AE8EC/configuration?group_id=group_private_wifi_configuration'   -H 'content-type: application/json'      -d '{ "wifi_passphrase_2g": "2gtestssidQUICK" }'   ; }

### Get Post $M $hostE

# POST only gp_aca () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_cpe_action";                   ech2 $u; curl -s -X GET $u |pjson|cblue ; }
gp_aga () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_all";                          ech2 $u; curl -s -X GET $u |pjson|cblue ; }
# GET only gp_aci () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_cpe_information&refresh";      ech2 $u; curl -s -X GET $u |pjson|cblue ; }

gp_abm () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_bridge_mode_configuration";    ech2 $u; curl -s -X GET $u |pjson|cblue ; }
# {"bridge_mode_enabled": false}

# GET only gp_apws () {  m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_private_wifi_statistics";      ech2 $u; curl -s -X GET $u |pjson|cblue ; }

gp_apwa () {  m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_private_wifi_advanced_configuration";   ech2 $u; curl -s -X GET $u |pjson|cblue ; }

gp_apw () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_private_wifi_configuration";   ech2 $u; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "wifi_passphrase_2g": "Password1_gp_apw" }' |pjson ; }

gp_apl () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_private_lan_configuration";    ech2 $u; curl -s -X GET $u |pjson|cblue ; }
# { "ip_address": "192.168.1.1" }

gp_ar2 () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_radio_2g_configuration";       ech2 $u; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "wifi_passphrase_2g": "Password1_gp" }' |pjson ; } 
# -1 for auto...{ "radio_enabled": true, "channel": ‐1 }

gp_ar5 () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_radio_5g_configuration";       ech2 $u; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "wifi_passphrase_5g": "Password1_gp" }' |pjson ; }
# -1 for auto...{ "radio_enabled": true, "channel": ‐1 }

gp_amm () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_moca_mode_configuration";      ech2 $u; curl -s -X GET $u |pjson|cblue ; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "moca_enabled":true} '                  |pjson ; }
# {"moca_enabled":true}

gp_awc () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_wan_configuration";            ech2 $u; curl -s -X GET $u |pjson|cblue ; }
# {"public_ip": "50.60.70.80" }

gp_awr () {   m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_interface_devices_wifi_report_configuration"; ech2 $u; curl -s -X GET $u |pjson|cblue ; }

gp_ahsm () {  m=$1; h=$2; u="http://$h:8080$CPEBU/$m/configuration?group_id=group_home_security_wifi_configuration"; ech2 $u; curl -s -X GET $u |pjson|cblue; now; sleep 5; curl -s -X POST $u -H 'content-type: application/json'  -d '{ "wifi_passphrase_2g": "Password1_gp" }' |pjson ; }

# /gateway-­‐configset/{xpc_csid }/configuration?group_id=group_device_management
#{ “enabled”:true, "allow_all_enabled": true }

# /gateway-­‐configset/{xpc_csid }/configuration?group_id=group_port_forwarding_configuration
# { "portforward_enabled": true }

# /gateway-configset/{xpc_csid }/configuration?group_id=group_private_network_ethernet_statistics
# { “bytes_sent”: 123455, “bytes_received”: 19394234 }

# /gateway-­‐configset/{xpc_csid }/configuration?group_id=group_interfaces_devices_wifi_report_configuration
# { "interface_devices_wifi_report_enable": true, "interface_devices_wifi_polling_period": 60, "interface_devices_wifi_reporting_period": 300 }

# /gateway-­‐configset/{xpc_csid }/configuration?group_id=group_network_devices_status_report_configuration
# { "network_devices_status_report_enable": true, "network_devices_status_polling_period": 60, "network_devices_status_reporting_period": 300 }

# /gateway-­‐configset/{xpc_csid }/configuration?group_id=group_network_devices_traffic_report_configuration
# { "network_devices_traffic_report_enable": true, "network_devices_traffic_polling_period": 60, "network_devices_traffic_reporting_period": 300 }



# log in to production:   637  ssh -i ~/.ssh/id_rsa hlam001c@odpredis-as-01q.sys.comcast.net
alias sshStgRedis='ssh -i ~/.ssh/id_rsa hlam001c@odpredis-as-01q.sys.comcast.net'

# http://macappstore.org/pdftotext/
# http://macappstore.org/pdfgrep/
alias grepp='  pdfgrep --color auto '

