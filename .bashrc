# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#export PS1="\u@\h:\w\\$ "

### ALIASES AND FUNCTIONS linux, cygwin, win_doskey_powershell, and osx

### CONSTANTS NAMING

### HELPERS


### USE_AWK_SED
### USE_PYTHON
### USE_TERMINALS_CENTOS_VM
### TIPS_UNIX

### TEST SPECIFIC


alias cdco='cd     ~/checkouts/      && ls -latr && pwd '

alias cdwww='cd    /var/www/html && pwd'
alias cdenv='cd    ~/checkouts/Env                        && ll && pwd '
alias cdqar='cd    ~/checkouts/qa-archive/                && ll && pwd '
alias cdtest='cd   ~/checkouts/qa/tests                   && ll && pwd '
alias cdsim='cd    ~/checkouts/qa/simulation/            && ll && pwd '
alias cdsl='cd     ~/checkouts/qa/scripts_lib            && ll && pwd '
alias cdrt='cd     ~/checkouts/qa/scripts                && ll && pwd '

isemp () { ext=$1; find ./ -empty -name *$ext |grep $ext ; }
 
alias cdlog='cd ~/logs;pwd  '
alias lastlog='cdlog; ls -latr|tail;pwd'
alias lastfile='ls -1 -t * | head -1'

lastchars () { filename=$1 ; awk '{printf("%s\n",substr($0,length($0)- 3))}' $filename ; }

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias dusk='pwd; du -sk'
alias dush='pwd; du -sh'

# Misc :)
alias whence='type -a'                        # where, of a sort
#export GREP_COLOR="1;32"
alias grepstrong='GREP_COLOR="1;34;46" \grep --color'
alias grep=' grep     --color=auto'              # show differences in colour
alias egrep='egrep    --color=auto'              # show differences in colour
alias fgrep='fgrep    --color=auto'              # show differences in colour
alias clr='printf "\033c"'                    # clear screen
alias catcolor='egrep --color -C1 [a-z]+ '
# diffuse  20150422_hosts_boeing_boeing_1.0.0.39_boeing_p5_p6_a 20150422_hosts_boeing_boeing_1.0.0.39_boeing_p3_p4_a


# Some shortcuts for different directory listings
alias a='   alias'
alias c='   cat  '
alias d='   date '
alias e='   echo '
ech2  () {  echo;echo $* ; }
alias f='   finger'
alias g='   grep '
alias h='   head '
alias hist='history'
alias ht='  history|tail ' 
alias i='   ip r | cut -f12 -d" " '
alias m='   more'
alias n='   hostname -vI '
alias p='   pwd; ls -l'
alias py='  python '
alias u='   cd          ..;ls; echo Current_dir is `pwd` '
alias cdu=' cd        ..;ls; echo Current_dir is `pwd` '
alias u2='  cd      ../..;ls; echo Current_dir is `pwd` '
alias u3='  cd   ../../..;ls; echo Current_dir is `pwd` '

alias dir=' ls -ltra | egrep "^d" '
alias dirs='find . -type d -d 1 -print0 | xargs -0 du -sc | sort -n '

alias l.='  ls -ld .* '
alias lh='  ls -tra | egrep "^\."'
alias lkh=' cat $HOME/.ssh/known_hosts | fduc '
#alias lhid='  diff <(ls) <(ls -a) '
alias ls='  ls -hF --color=tty'                 # classify files in colour
#alias lf=' ls -ltra | egrep -v "^d" '
alias ldir='ls -ltra | egrep "^d" '
alias llsd='sudo find ./ -type d -exec du -sh {} \; | sort -g '

#alias dir2='ls --color=auto --format=vertical'
#alias dir3='ls --color=auto --format=long'

alias ll='  ls -l'  
alias lR='  ls -R'                              # all but . and ..
alias llR=' ls -lR'
alias l='   ls -CF'  
alias llt=' ls -lt'
alias llr=' ls -ltr'
alias llrr='ls -ltr|tail '
alias lla=' ls -ltra'
alias lls=' ls -s '
alias pingf='ping -a -c 2 -s.2 '
alias pingn='ping -a -n 2      '
alias s='   sort '
alias t='   tail '
#alias t='  type'

alias vihostname='sudo vi /etc/sysconfig/network '
alias nwr='/etc/init.d/network restart; echo   Restarted_network_$(date) '
alias vihosts='vi /cygdrive/c/Windows/System32/drivers/etc/hosts '
alias cdc=' cd    /cygdrive/c ;p'
alias cdws='cd    /cygdrive/c/workspace             ;p'
alias cddt='cd    /cygdrive/c/Users/henry/Desktop   ;p'
alias cddl='cd    /cygdrive/c/Users/henry/Downloads ;p'
alias cdmd='cd    /cygdrive/c/Users/henry/Documents/;p'
alias cdh3='cd    /cygdrive/c/Users/hqlam           ;p'
alias cdh7='cd    /cygdrive/c/Users/henry           ;p'
alias cdpy='cd    /cygdrive/c/Python27/mws_py  ;p'
alias cdwt='cd    /cygdrive/c/Users/henry;p'


function mkdir2 { mkdir -p "$1" && cd "$1" && pwd ; }
cd2 ()          { folder=$1; cd $folder ; ls -l ; pwd  ; }
frep1 () {  c=$* ; while sleep 1; do date; $c; echo ; done; }
frep ()  {  c=$* ; while (true)   do date; $c; echo -e "($c)...";echo ;sleep 5; done  ; }
alias repeatls=' watch -t ls '
alias cksocket=' frep ss '
loop () {   t1; for i in `seq 5`;   do date; echo  $i:; $* ; echo ; sleep 5;   done; t2 ; }

ffiles () { for f in ./* ; do $* $f; done ; }
fdirs ()  { for d in ./* ; do pushd $d; pwd; $* ; popd; echo; done ; }

function my_ip() # Get IP adresses.
{
    #MY_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' |    sed -e s/addr://) ;
    #MY_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' |  sed -e s/P-t-P://) ;
    MY_IP=$(/sbin/ifconfig | awk '/inet/ { print $2 } ' | sed -e s/addr://) ;
    MY_ISP=$(/sbin/ifconfig | awk '/P-t-P/ { print $3 } ' | sed -e s/P-t-P://) ;
}
function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on ${RED}$HOST" ;
    echo -e "\nAdditionnal information:$NC " ; uname -a ;
    echo -e "\n${RED}Users logged on:$NC " ; w -h ;
    echo -e "\n${RED}Current date :$NC " ; date ;
    echo -e "\n${RED}Machine stats :$NC " ; uptime ;
    echo -e "\n${RED}Memory stats :$NC " ; free ;
    my_ip 2>&- ;
    echo -e "\n${RED}Local IP Address :$NC" ; 
    echo ${MY_IP:-"Not connected"} ;
    echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"} ;
    #echo -e "\n${RED}Open connections :$NC "; netstat -pan --inet;
    echo "DNS IPs are: ";
    cat /etc/resolv.conf ;
}
alias iig='ii |egrep -A2 "User|IP" '
function fbkup() {   
    DateTimeStamp=$(date '+%Y.%m.%d_%H:%M:%S')  ; 
    #DateTimeStamp=$(date '+%d_%m_%y_%H_%M')  ; 
    ip=$(ifconfig | grep Bcast | awk -F: '{print $2}'| awk -F" " '{print $1}')
    Original=$1 ; 
    FileName=$(basename $Original)  ; 
    Directory=$(dirname $Original)  ; 
    cp -rfp $Original ${Directory}/${ip}_${DateTimeStamp}_${FileName} ;   
}   

# echo {A,C,T,G}{A,C,T,G}{A,C,T,G} //Print all possible 3mer DNA sequence combinations
#fbakcp () { cp filename{,.bak} ; }
fbak () { cp -rfp $1 ./$(date '+%Y.%m.%d_%H:%M')_$1 ;}
fori () { cp -rfp $1 $1.ori; ll ;}

fbu  () { cp -rfp $1 ./$1_$(date '+%Y_%m_%d_%H_%M') ; lla|grep $1 ; }

function tl {
    #LOGDIR="~/checkouts/qa-archive/archive"
    case "$1" in
	#"aperr")	file=`ls -tr $LOGDIR/ | tail -1` ;;
	#l*)		file="`ls -tr $LOGDIR/ | tail -1`" ;;
	#r*)		file="$LOGDIR/resizer.log" ;;
	yu*)		file="/var/log/yum.log" ;;
	supd*)		file="/var/log/supervisor/supervisord.log" ;;
	*) echo "default" ;;
    esac
    echo "last log folder: $file"
    tail -50f $file
    #$2 $3 $4  $file
}
extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           gunzip $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

alias tarextract=' tar   -xzf '
alias tarcompress='tar   -czf '
alias tarappend='  tar   -czfvr '
alias tarlist='    tar   -tzfv '
alias unziplist='  unzip -l '

pwithtar () { src=$1; des=$2; cd $src ; tar cvf - ./* | (cd $des ; tar xvf - ) ; }

alias vi='   vim'
alias vip='  vim -p '
alias vicC=' view   ~/checkouts/Env/bashrc_CSV'
alias vicZ=' view   ~/checkouts/Env/bashrc_ZBRA'
alias vice=' vi     ~/checkouts/Env/.bashrc'
alias vic='  vi     ~/.bashrc'
alias soc='  source ~/.bashrc; a|wc; b2e '
alias soce=' source ~/checkouts/Env/.bashrc; a|wc; deb '

vis () {   pattern=$2; filename=$1; vi +/$pattern $filename  ; }
#fvin () { vi +$1 $2  ; }

fgbC ()   {    grep -i $1 $2 $3 $4  ~/checkouts/Env/bashrc_CSV ;}
fgbZ ()   {    grep -i $1 $2 $3 $4  ~/checkouts/Env/bashrc_ZBRA ;}
fgb  ()   {    grep -i $1 $2 $3 $4  ~/.bashrc ;}

h2d () {   echo $((0x$1)) ; }
d2h () {   printf '%x\n' $1 ; }

#          python -c "print int('c0ffee'    , 16)"
#          python -c "print int('12648430  ', 10)"
#pyh ()  { python -c "import $1;                print help($1)" ; }
pyh ()   { python -c "help( '$1' )" ; }
pyhq ()  { echo q | pyh $1 ; }
pydoc () { python -m pydoc $1 ; }
pyd ()   { python -c "import $1;                print  dir($1)" ; }

#platf () { python -c "from sys import platform; print platform " ; } 
fcsv2json () { python -c "import csv,json;      print json.dumps(list(csv.reader(open('$1'))), sort_keys=True, indent=4, separators=(',', ': ') )" ; }
alias pjson='python -m json.tool'
# python -c "import sys; print ''.join(x.capitalize() for x in sys.stdin)"  < names.txt

# python -m timeit "'-'.join(str(n) for n in range(100))"

# subtitute $1 with $2: () { perl -p -i -e 's/$1/$2/g' $3 $4 $5 $6 ; }

# print only matched item: echo "hallo 123 kadflsdkal" | perl -ne '/(\d+)/ && print "$1\n";'# 123
# find . -type d -empty -exec touch {}/.ignore \; 
#findOlder () { find . -mmin -$((($(date "+%s") - $(stat -c %Y $1))/60)) -type f ; }
# find /path/to/files* -mtime +5 -exec rm {} \;

alias deb=' diff            ~/checkouts/Env/.bashrc ~/.bashrc '
alias e2b=' echo y|      cp ~/checkouts/Env/.bashrc ~/ '
alias b2e=' echo y|      cp               ~/.bashrc ~/checkouts/Env '

### Aliases / Functions work with pipeline:

#headft () {  awk -v m=$1 -v n=$2 'NR>=$m && NR<=$n'  $3  ; }
alias xwc='   xargs wc -l'
alias xcat='  xargs cat'
alias xhead=' xargs head'
alias xllr='  xargs ls -ltra '

alias tee2='  tee ./tee_$(date +%Y.%m.%d_%H:%M).txt '
# output to 2 files: my_command | tee -a /some/file > /some/other/file

#alias sortu='sort|uniq -c '

alias cuts="  cut -d \" \"  "
#alias cutst="cut -d \"*\"  "
#alias cute=" cut -d \"!\"  "
alias cutd="  cut -d \".\"  "
alias cutb="  cut -d \"#\"  "
#alias cuta=" cut -d \"@\"  "
#alias cutam="cut -d \"&\"  "
alias cutp="  cut -d \"|\"  "
#alias cutpc="cut -d \"%\"  "
alias cut2c=" cut -d \":\"  "
alias cutsc=" cut -d \";\"  "
alias cutff=" cut -d \"/\"  "

alias cutc="  cut -d \",\"  "
alias ducc='  cut -d"," -f'
awkfno () {   awk         -F"," '{print $'$1'}'; }
fduc   () {   awk -v n=$1 -F"," '{print $n }'  ; }
fmax   () {   awk -v n=$1 -F"," 'BEGIN {max = 0} {if ($n>max) max=$n} END {print max}' ; }
#fmax7 () {   awk -F"," 'BEGIN {max = 0} {if ($7>max) max=$7} END {print max}' ; }
# avg: awk '{ sum=sum+$1} END {print sum/NR}

fduc1 () {    awk  '{print $1}'  ; }

rmdup () {    awk '!($0 in array) { array[$0]; print }' ; }
#s_join ()  { echo $@ | tr ' ' '_'  ; }
alias rmblank='sed "/^$/d;s/^[ \t]*//;s/[ \t]*$//" '
alias rmbline='sed "/^$/d" '
alias a_1line='grep -n -- "-1"'
alias a1line=' awk -vORS=" " 1 $1 '
alias anline=' sed -e  "s/,/\n/g" | cat '
catln () { fileName=$2 ; sed -n "$1p" $fileName ; }

# alias ge1='sed -e 1,/ERROR/d |head '
#fge1 () { grep -B2 ERROR $1 |head -3 ; cat -n $1 | sed -e 1,/ERROR/d |head ;}

strUC () {    echo $1 | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'   ;}
strLC () {    echo $1 | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'   ;}

alias yumgoodstuff='yes|sudo yum install finger;yes|sudo yum install kdiff3; yes|sudo yum install tree;'
alias tlyum='  xterm -title tail_yum_log -e sudo tail -50f /var/log/yum.log & '

fgh  ()   {    HISTTIMEFORMAT=%c ; history | grep $* |tail -20 ; }
# print the last "cp" cmd: !cp:p
fgc  ()   {    grep -inr $* ~/config_file ; }
fgpy ()   {    grep -inrH $* /cygdrive/c/Python27/* ; }
#fgei ()   {   grep -iEn "fail|error" $* ; }
fgl  ()   {    cd ~/logs; ls -tr |tail -1|xargs tail -f |grep -iE "fail|error|FATAL:|TASK:" ; }
ffg  ()   {    sudo find ./ -name $1 -exec grep -iH $2 {} \; ;}
fkp  ()   {    pgrep -f $1 ;pkill $1    ; }
fgserv () {    chkconfig|grep $1 ; }
fgalt    () {  cd ~/checkouts/qa/deployments/inventories && egrep -C1 $*  hosts_boeing_alt_v1 ; }
fgaltgen () {  cd ~/checkouts/qa/work/hlam/ && egrep -C1 $*  qa_gen_inventory ; }

ftee1 ()  {    tee ~/logs/$(date '+%Y.%m.%d_%H.%M')_$1.log ; }

ftrk1a  () { t1; echob;cd ~/checkouts/qa/scripts ; ls; pwd; if [ ! -z $1 ]; then ip=$1; else ip=10.21.2.30 ; fi; python run_test_tracker.py -t  01a_tracker_rnd_0.7 -m zadm@$ip |ftee1 trk1a_$ip; echoe ;t2 ;echo "Pls cdarc to check..." ; }

t1a="01_alarm_status"


fsnr () { t1; echob;cd ~/checkouts/qa/scripts ; ls; pwd; if [ ! -z $1 ]; then tn=$1; else tn=01_basic_json_validation ; fi;python run_test_sim_nfl_report.py   -t $tn   | ftee1 t1a_py_$tn_$pbo ; echoe ;t2 ;echo "Pls cdarc to check..." ;lastlog; }

flms () { t1; echob;cd ~/checkouts/qa/scripts ; ls; pwd; if [ ! -z $1 ]; then tn=$1; else tn=01_basic_patterns ; fi;python run_test_sim_lms.py   -t $tn   | ftee1 t1a_py_$tn_$pbo ; echoe ;t2 ;echo "Pls cdarc to check..." ;lastlog; }

#frasc () { t1; ansible-playbook -vvv $1 -i $2 -u $3 --skip-tags "common" |tee ~/logs/$(date '+%Y.%m.%d_%H:%M')_$1.log; cat $1; pwd;t2 ; }

alias updpy='t1; cdrt; python update.py -r $pbo.txt ;cdco; t2  '
fupdpy  () { t1; echob; cdrt; python update.py       -r $1 | ftee1 $1 ; echoe; t2 ; }

alias depi='  t1; cdrt; python deploy_info.py -c $dbo ; t2  '
alias dep_='  t1; cdrt; python deploy.py      -c $dbo ; t2  '
fdep () { t1; echob; cdrt; python deploy.py    -c $dbo | ftee1 dep_$pbo ; beep; echoe;  t2 ;  }

alias xssh='   xterm -e ssh '

alias manansible='ansible-doc'
alias tlall='  sudo find /var/log -type f -iregex '.*[^\.][^0-9]+$' -not -iregex '.*gz$' 2> /dev/null | xargs tail -n0 -f  '
alias serv_all='service --status-all | egrep "postg|ntpd|superv"; chkconfig --list '

alias cdsupd=' cd /etc/supervisor.d/; ls -l /etc/supervisor.d/mws_nfl.conf; cat -n mws_nfl.conf;p '
alias supdpid='cd /var/run/; ls -ltra; more supervisord.pid; pwd '
alias supdtmp='cd /tmp     ; ls -ltra | egrep "^s" ; pwd '
alias tlsupd=' sudo xterm -title tail_supervisord_log -e tail -100f /var/log/supervisor/supervisord.log & '
alias supd='        sudo service supervisord status' 
alias supdr='  date;sudo service supervisord restart' 
alias supda='  date;sudo service supervisord start' 
alias supdo='  date;sudo service supervisord stop ' 

alias sup='    hostname -vI && supervisorctl status && date '
alias supctl=' date;supervisorctl '
alias sups='        supervisorctl status'
alias supsr='  date;supervisorctl restart '
alias supso='  date;supervisorctl stop all '
alias supsa='  date;supervisorctl start all '
alias sups2='  hostname -vI; supervisorctl status; date '

supff () {     firefox http://$1:9001/  ; }


alias pog="    sudo service postgresql-9.3 status"
alias poga="   sudo service postgresql-9.3 start "
alias pogo="   sudo service postgresql-9.3 stop  "

#ftp://ftp.box.com phuser Pa1ntHangar
alias ftpbox=' echo "hlam@zebra.com Motion12!"; ftp ftp.box.com '
alias ftpnoczi='ftp://10.120.248.2/Installers/ZebraInterlock/'

fkp  () {   r=`ps -ef | grep $1 | grep -v grep |awk '{print $2}' ` ; if [ ! -z "$r" ]; then sudo kill -9 $r; fi ; }
fkpy () {   ps -ef | grep -E "python" | grep -v grep  | awk  '{print $2}' | xargs kill -9 ; }
fkmw1 () {  ps -ef | grep -E "python|start.sh|start_|standalone.config" | grep -v grep  | awk  '{print $2}' | xargs sudo kill -9 ;  }
fkbo () {   ps -ef | grep -v python2.7| grep -E "python|start.sh|start_|standalone.config|distributor|GUI|notty" | grep -v grep  | awk  '{print $2}' | xargs sudo kill -9 ;  }
fknfl () {  ps -ef | grep -v python2.7| grep -E "python|start.sh|start_|standalone.config|distributor|GUI|notty|nfl|mws" | grep -v grep  | awk  '{print $2}' | xargs sudo kill -9 ;  }
alias kmw=' fkbo ; fknfl'

alias ckpy='date; ps -ef|grep python| grep -v grep|cat -n  '
#service supervisord status |cat -n; netstat -vatn; 
alias ckmw='while (true) do date; ss; ps auxf|grep -v python2.7| grep -iE "sshd|python|start.sh|start_|standalone.config|distrib|GUI|notty|supervisor|mws|nfl|noc|venue|gameclock-server|play-server|entity-server|roster-server|http-server|config_monitor"|grep -v grep|cat -n  ;ps auxef|wc; echo "  "; sleep 5 ; done;'

dates () {  t=$1; echo $t " == " `date --date=@$1`   ; }
dateu () {  t=$1; echo $t " == " `date -d "$t" +%s ` ; }
alias t__s='date "+%FT%T"'
alias t1='  date; starttime=$(date +"%s")'
alias t2='  date; echo seconds=$(($(date +"%s")-$starttime)) | egrep "=[0-9]+" '
ftiktoc () { t1; $* ; t2 ; }
# time t=$(cat 3min.csv| cut -d',' -f1) ;  time t=$(cat 3min.csv| awk -F ',' '{print $3}' ); or echo $line, with line=1,hai, ba, 4, 5

alias echob='    echo "*** BEGIN_at: `date` " '
alias echoe='    echo "*** END_at: `date` " '
alias echodate=' echo "fsettimeCentos `date '+%m%d%H%M%y'`" '
fsettimeCentos () { echo "time format mmddHHMMyyyy"; sudo  rm /etc/localtime; sudo ln -s /usr/share/zoneinfo/PST8PDT /etc/localtime; sudo date $1  ; sudo hwclock --systohc; sudo hwclock; echo "*** DONE script run at `date`" ; }

alias crlf='file `find ./` |grep CRLF '
 #alias grepbincrlf='grep  -IUrl  $'\r' ./ '    
fcrlf () { file `find ./ -name *.$1 ` |grep CRLF ; }
fconvertcrlf () { crlf|awk -F: '{print $1}'|xargs dos2unix; }

# $ git show |tig; git log | tig;

### GIT_COMMANDS

# Install git: https://mac.github.com; or https://windows.github.com;
# Create/migrate repos: git init [project]; clone [url]
# git config --global/--get user.name/user.email
# smartconnect $ cat .git/config url = git@github.comcast.com:Baymax/smartconnect.git
# migrate: git clone --bare https://github.csv.comcast.com/hlam001c/bmx-qa; epen https://github.comcast.com/hlam001c/; create a new bmx-qa repos; git push --mirror https://github.comcast.com/hlam001c/bmx-qa

# git refspec
genv="https://github.com/hqlam/Env"          

#gcln () {  repo=$1; git clone git@github.comcast.com:Baymax/$repo ; }
gitcln () { repo=$1; repo=${repo:-Env}; git clone https://github.com/hqlam/$repo ; }

githelp () {      git help $* ; }
# Save fragments: git stash; then later:  git stash pop; list; drop
# git show --color --pretty=format:%b     efe1243
gitshowc () {     commit=$1; git show --color --pretty=format:%b $commit ; }
alias d_m='       echo ****Develop: `git show develop|grep Date:`; echo ****Master : `git show master|grep Date:` '
# git log --no-merges -p 1.12.0..v1.13.0 |egrep -A4 "^commit" # git log --since="2 days ago"
gitlastcom () {   commit=$1; commit=${commit:-1}; git log -p -$commit ; }
git1line () {                                     git log --oneline --graph ; }
gitoneline () {                                   git log --pretty=oneline ; }
gitgl () {                                        git log |egrep -i -C10 $* ; }
gitfilehist () {  f=$1 ;                          git log -p -- $f ; }
alias gitfilehist2='                              git log -p --since="7 days ago" '
alias gitll='     echo "*LATEST LOG ... :";       git log |head -7;  echo '
# Diff the commit to its parents: git diff efe1243^! ; OR git diff --staged;
gitdif () {       f=$1 ; git diff      $f ; }
alias gitdiff='          git diff HEAD HEAD^1 ; git diff HEAD HEAD^1 --stat'
alias gitmod='           git diff `git status|grep modified:|cut: -f2` '
gitdirty () {     topic=$1;                             echo $topic; upstr=$2; git diff --name-status $topic $upstr ; }
gitdirty1 () {    topic=`git branch|grep "*"|cuts -f2`; echo $topic; upstr=$1; git diff --name-status $topic $upstr ; }
gitdirhist () {   for f in `ls`; do echo  `gitfilehist $f|head -5|grep Date` $f ; done ; }
gitdirsort ()   { gitdirhist > ~/fh; cat ~/fh | sort ; rm -f ~/fh ; }
#gitdirsort ()  { for f in `ls`; do echo  `gitfilehist $f|head -5|grep Date|cut: -f2` $f ; done > ~/fh; cat ~/fh|sort ; }
alias gits='      echo "****STATUS:";     git status; echo '
alias gitst='cdenv;echo "****BRANCH ...:"; git status; echo; git branch -vv; ech2 "****THE LATEST LOG ... :"; git log |head -7;  echo '
alias gitb='      echo -ne "****BRANCH: \t ";               git branch; echo '
alias cbr='                                                 git branch | grep "*" | cuts -f2'
alias gitallb='   echo "All branches: "; git pull;          git branch -av; pwd'
alias gitp='      t1;  git pull;  t2 '
fgitp () {        soc;cddisp; for d in `ls ..`; do echo -n "**** $d : "; cd ../$d; gitp ; done ; }
fgitb () {        soc;cddisp; for d in `ls ..`; do echo -n "**** $d : "; cd ../$d; cbr  ; done ; }
# reset upstream: git branch mamobile_fields_ivr --set-upstream-to origin/develop
# git rebase upstream/master
# alias gitpm='   git pull origin master'
# alias gitpd='   git pull origin develop'
alias gitpusho='  git push origin '
createdev2b () {  git checkout -b $1 origin/develop ; }
alias co_reset='  git reset --hard; date; gitst '
reset_b () {      bORc=$1; git reset --hard  $bORc; git pull; date; gitst ; }
delete_b () {     bORc=$1; git branch -d     $bORc; date; gitst ; }
co_b () {         bORc=$1; bORc=${bORc:-master} && git checkout $bORc; date && echo ___NEW_PULL__&& git pull ; }
# Refactor filenames: rm, mv; #git mv [file-ori] [file-renamed]
alias gitrm='     git rm --cached '
# List files # git ls-files --other --ignored --exclude-standard
alias gitlist='   git ls-files'

# Open github ogh
eghlib () {                                                  epen https://github.com/hqlam/Env/tree/master/lib ; }
eghtd  () {                                                  epen https://github.com/hqlam/Env/tree/master/test/test_data ; }
eghhl  () {                                                  epen https://github.com/hlam001c/bmx-qa ; }
egh  () {                     rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/$2 ; }
#ogc () {                     rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/commits ; }
#ogcp () {                    rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/compare ; }
egr  () {                     rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/releases ; }
egt  () {                     rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/tags ; }
egp  () {                     rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/pulls ; }
egb  () {                     rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/branches ; }
eab () {                      rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/branches/active ; }
eby () {                      rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/branches/yours ; }
etb  () { b=$2;b=${b:-master};rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/tree/$b ; }

etd  () {                     rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/tree/develop ; }
etm  () {                     rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/tree/master ; }
epr  () { pr=$2;              rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/pull/$pr ; }
eprf () { pr=$2;              rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/pull/$pr/files ; }
eprc () { pr=$2;              rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/pull/$pr/commits ; }
egc  () { commit=$2;          rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/commit/$commit?diff=split ; }
cpbran () { branch=$2;        rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/compare/$branch  ; }
egcp  () {                     rt=$1; rt=${rt:-Env}; epen https://github.com/hqlam/$rt/compare/$2...$3 ; }

alias sptd='      wget --no-check-certificate -O speedtest-cli.py https://github.com/sivel/speedtest-cli/raw/master/speedtest_cli.py'
alias sptdr='     wget --no-check-certificate -O speedtest-cli.py https://github.com/sivel/speedtest-cli/raw/master/speedtest_cli.py && python speedtest-cli.py --share '


### HG Mercury
rtbu () { cd ~/checkouts/qa; hg status | awk '/~$/  {print $2}' | xargs rm ;  }
rpyc () { cd ~/checkouts/qa; hg status | awk '/pyc/ {print $2}' | xargs rm ; } 

#for i in `grep -r "restart postgresql" * | cut -d":" -f1`; do hg parents $i; done;
#hgpa () { pwd; for i in $*; do ls $i; hg parents $i|grep changeset; echo;done ; }
hgpa () { for i in $*; do echo `hg parents $i|grep changeset | cut -d: -f2,3`_`ls $i`>> temp 2>/dev/null; echo;done ; sort -h temp;pwd ; rm -f temp; }
alias hgpar='    hg parents '
alias hgid='     hg id '
#alias hgid='    hghelp id|grep -C3 local ; echo ; hg id '
alias hghelp='   hg -v help '
alias hgheads='  hg heads '
alias hgbr='     hg branches'
alias hgtg='     hg tags -v   '
alias hgverify=' hg verify '
alias hgversion='hg version '
alias hgroot='   hg root '
alias curtag='   hg showconfig |grep default ; hgtg '
alias curtags='  cat -n `hg root`/.hg/tags.cache '
alias hgpath='   hg path ' 
alias hgg='      hg grep -f -u '
alias hglocate=' hg locate -f '
alias hgst='     hg status'
alias hgcnt='    hg st -A|wc -l'
alias hglfc='    hg log --style changelog|head -30'
alias hg2update='echo [Local:`hg tip|grep changeset|cut -d: -f2`] versus [Cloud: `hg incoming|grep change|cut -d: -f2`] '
alias hg2clone=' hg incoming |grep change|cut -d: -f2'
alias hg2pull='  hg incoming'
alias hg2push='  hg outgoing'
alias hgsu='     hg summary|grep  -E "tip|branch|zebra|parent:.*:[0-9,a-f,A-F]{7}|changeset:.*:[0-9,a-f,A-F]{7}"; echo ___Total_of_Files___ ;hg st -A|wc -l  '
alias hgti='     hg tip    |grep  -E "tip|branch|zebra|parent:.*:[0-9,a-f,A-F]{7}|changeset:.*:[0-9,a-f,A-F]{7}" '
alias curtip='   pwd|grep zebra-.*; echo Summary: ; hgsu -C5; echo;hgcnt;echo;  echo Tip: ; hgti -C5'


#good alias POSTentities='curl -X POST -d @entities_combined_rev14.json -H "Content-Type: application/json" http://127.0.0.1:3122/entities/upload'
alias GETentDB=' curl -X GET http://127.0.0.1:3122/entities '
alias WCLentDB=' curl -X GET http://127.0.0.1:3122/entities | wc -l'
alias dumpBackup='pg_dump zebra > db.sql'


### WINDOWS shortcuts:

# PATH 
# PATH C:\ProgramData\Oracle\Java\javapath;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\Common Files\Roxio Shared\DLLShared\;C:\Program Files (x86)\Common Files\Roxio Shared\10.0\DLLShared\;C:\Program Files\Intel\WiFi\bin\;C:\Program Files\Common Files\Intel\WirelessCommon\;

#C:\Program Files\Java\jdk1.8.0_121\bin;
#C:\Program Files\Internet Explorer;
#C:\Program Files (x86)\Mozilla Firefox;
#C:\Program Files (x86)\Notepad++;
#C:\Program Files (x86)\PyScripter;
#C:\Program Files (x86)\WinSCP
#C:\Program Files (x86)\RealVNC\VNC4
alias epen='  explorer.exe '
alias ie='    iexplore.exe '
alias ff='    firefox.exe '
alias np='    notepad.exe '
alias npp='   notepad++.exe '
alias pys='   PyScripter.exe '
alias winscp='WinSCP.exe  '
alias vnc='   vncviewer.exe'
alias wex='   explorer /n '
alias sky=' cd /cygdrive/c/Program\ Files\ \(x86\)/Skype/Phone && ./Skype.exe  & '
alias skyo='cd /cygdrive/c/Program\ Files\ \(x86\)/Skype/Phone && ./Skype.exe  /shutdown '


# alias cleanoz=' cd /opt; sudo rm -rf /opt/zebra; p; cd /etc/supervisor.d/; sudo rm -rf mws_*.conf; p ' 
# alias cleansup='supso;supdo;date;sleep 30; sups; supd; date '
alias cleanpipe='cd /etc/init.d/ && ./network restart && cd /tmp && rm -rf mws_ipc*pipe* && ls && pwd '

alias getclone=' mv qa qa-`date '+%Y%m%d_%H%M'` &&  cowsay "Start cloning qa ..." && hg clone https://bitbucket.org/bobkuehne/zebra-sj qa '

alias getclnup='  t1; cd ~/checkouts;ls -tr ; sudo rm -rf qa; pwd; ls -tr ; cowsay "Start cloning qa ..." && hg clone https://rodrigogalonso:mw3entral!@bitbucket.org/bobkuehne/zebra-sj qa ; t2 '

alias getcln='  t1; cd ~/checkouts;ls -tr ; sudo rm -rf qa; pwd; ls -tr ; hg clone https://bitbucket.org/bobkuehne/zebra-sj qa ; t2 '

alias getzi='  date;date1=$(date +"%s"); cd ~/checkouts;ls -tr ; sudo rm -rf zebra-industrial; pwd; ls -tr ; hg clone https://bitbucket.org/dle7/zebra-industrial  ; date2=$(date +"%s"); diff=$(($date2-$date1)); echo "$(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed." ; pwd ;date '

#checkouts]$ hg clone https://bitbucket.org/dle7/zebra-innovation
#checkouts]$ hg clone https://bitbucket.org/danbuckler/firmware
#checkouts]$ hg clone https://bitbucket.org/danbuckler/mission_planner
#checkouts]$ hg clone https://bitbucket.org/danbuckler/c-check-for-point-in-polygon


alias vipyn='   vi /cygdrive/c/Python27/mws_py/pynotes.py '

#alias dftot='df -h --total | awk 'NR==1; END{print}''
alias dfdu='   cd ~; f="~/Documents/df_dush.txt"; date >> $f; df >> $f; du -sh|grep -v cannot >> $f; echo "+++++++" >> $f; cat $f      '

fFindBigFiles () { if [ ! -z $2]; then s=$2; else s=120M; fi ; from_dir=$1; find $from_dir -size +$s   -ls 2>/dev/null ; }
#fFindBigFiles () { if [ ! -z $2]; then s=$2; else s=120M; fi ; if [ ! -z $1]; then from_dir=$1; else from_dir="./"; fi ; find $from_dir -size +120M -ls 2>/dev/null ; }

alias cpuinfo='cat /proc/cpuinfo; lscpu '
alias cputop=' xterm -e top & '
alias dirsize='xterm -hold -e "du -sh; df " '
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}
fman () { cmd=$1; man $cmd | col -b > ~/man_$1.txt; cat -n ~/man_$1.txt; ls -l ~/man_$1.txt  ; }
# alias erc='    echo $?'
# alias bc='     bc -l'
alias ports='  netstat -tulanp'
alias gateway='netstat -nr '
alias dnsgateway='cat /etc/sysconfig/network-scripts/ifcfg-eth0'
alias dnsip='     cat /etc/resolv.conf'
alias ipconf='ipconfig /all |egrep --color -C12 "IPv.*|adapter" '
alias gip='egrep --color -C12 "IPv.*|adapter|addr:[.0-9]*" '

# alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'

#alias vnctar29=' scp -r hl@10.21.2.29:~/hl/VNC_enable.tar .'
alias vncenable='sudo rpm -ivh VNC-Server-5.2.1-Linux-x64.rpm; sudo vnclicense -add F743B-R22UH-PBGQH-RJ2PQ-H6R9A; sudo service vncserver-x11-serviced start; wait; echo "For target, type in pwd zadmin"; echo "For controller, type in pwd mwcentral"; sudo vncpasswd '

fdiffWeek () { cd /cygdrive/e/GameData;p; if [ ! -d Week$1 ]; then echo should_check_folder... ; wait ; fi ;for f in `ls Week$1`; do ls Week$1/$f; diff Week$1/$f /cygdrive/c/tem/Week$1/$f; done;  }

#zgtd () { t1; f="/cygdrive/m/Analysis/LowBATT/BatteryHistory/$1_$2"; echo "zgrep -a $1 $2" > $f; zgrep -a $1 $2 >> $f; t2 ; }
gtd () { t1; f="/cygdrive/m/Analysis/LowBATT/BatteryHistory/$1_$2"; echo "grep $1 $2" > $f; grep $1 $2 >> $f; t2 ; }

alias bh='cd /cygdrive/m/Analysis/LowBATT/BatteryHistory'
alias s1='cd /cygdrive/m/Analysis/LOGS/Box\ Sync/LOWBATT' 
alias s2='cd /cygdrive/m/Analysis/LOGS/Box\ Sync/LOWBATT/home/zadmin/mws_staging'

alias xnload='   xterm -e nload & '
alias nload1000='nload –t 1000'
alias speedtest='   python ~/Help/speedtest-cli.py --share '
alias speedtestlog='python ~/Help/speedtest-cli.py --share | ftee1 speedtest_$(hostname -I) '
alias dlspeedtest=' wget -O speedtest-cli.py https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py '
alias wgetprotobuf='cd /tmp && wget https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.gz && ls -ltr '

alias beep='echo -en "\007"'

# psql -A -F ',' -t -c 'select * from tablename;' # postgreSQL CSV output from the CLI

#    % supervisorctl stop all
#    % psql -d zebra_monitor_p1
#    % zebra_monitor_p1=> \dt
# either   % zebra_monitor_p1=>DROP TABLE events;
#    % zebra_monitor_p1=> \dt
# or % zebra_monitor_p1=> SELECT * FROM events WHERE event::json->>'description' LIKE 'LOW BATT';
#    % should backup DB before delete
#    % zebra_monitor_p1=> DELETE FROM events WHERE event::json->>'description' LIKE 'LOW BATT';

# generate 8-letter passwd: cat /dev/urandom|tr -dc 'a-zA-Z0-9'|fold -w 8|head -1                          | python -c "import sys,crypt; stdin=sys.stdin.readline().rstrip('\n'); print stdin;print crypt.crypt(stdin)"
# pssh -h RemoteHosts.txt -P -I < ~/LocalScript.sh 2014-07-14 16:02:12 User: zlemini 1 Up Down # Run a script in parrallel over ssh 
# sudo ntpdate serverip # Synchronize date and time with a server 
# display disks by id, UUID and HW path UUID: tree /dev/disk
# top -c |grep -E "tar|scp"
# top cmd at a remote IP: ssh mwcentral@192.168.30.206 'top -bn2|awk -F, '\''/Cpu/{if (NR>4){print $4}}'\''|awk -F" id" '\''{print 100-$1}'\'
# echo thisIsATest | sed -r 's/([A-Z])/_\L\1/g'
# awk '{if (NR % 2 == 1) print $0}' file.txt
# "\\21S03DATA01\Main\Software\MotionWorks\10 Activities\Agile_Work_List.xlsx"
#[hl]$ man date | col -b > man_date.txt
alias dynip='curl -s http://checkip.dyndns.org'
frevStrInBASH () { for ((i=${#1}; i>=0; i--)); do printf "${1:$i:1}"; done; echo; }

#http://alinirimia.com/2013/11/run-commands-in-windows-tested-in-windows-8-and-8-1/
# C:\> net use M:  /delete
# doskey use240=net use Z: \\21nasbuildstore.cluster-2003.wherenet.com\Public /user:builduser builduser@1
# doskey use243=net use M: \\192.168.30.243\Public /user:builduser builduser@1
# find /?

alias timesh='    explorer.exe  http://budget.cable.comcast.com'
alias e_v='       explorer.exe  https://goo.gl/kY9EoV '
e2v  () {         explorer.exe  http://dictionary.cambridge.org/us/dictionary/english-vietnamese/$1 ; }
alias mdlink='    explorer.exe  https://www.mydlink.com/device#26298103'
alias kippbb='    explorer.exe  https://goo.gl/7BnUqU'
alias mp3q='      explorer.exe  https://goo.gl/mL4QSJ'

alias clearcache='   echo chrome://settings/clearBrowserData'

alias gfh='       explorer.exe  https://goo.gl/cgF7Hd'
alias etud='      explorer.exe  https://myetudes.org/portal'
alias grades='    explorer.exe  https://foothillcollege.instructure.com'
alias canvas='    explorer.exe  https://www.foothill.edu/fga/canvas_login.php'
alias netlab='    explorer.exe  https://ccna.bayict.cabrillo.edu '
alias netaca='    explorer.exe  https://www.netacad.com/group/landing/'
alias gdrive='    explorer.exe  https://drive.google.com/drive/my-drive'
alias cs50a='     etud;   netaca; gdrive'
alias cs50b='     canvas; netaca; gdrive; netlab'

alias omai='      explorer.exe  http://mail.yahoo.com; explorer.exe http://www.hotmail.com; explorer.exe http://mail.google.com; explorer.exe http://www.linkedin.com '

### Powershell Cmds fir Cygwin -- C:/USERS/HENRY/MACROS.TXT
alias vicm=' vi      /cygdrive/c/Users/hqlam/macros.txt'
alias socm=' /cygdrive/c/Users/hqlam/soc.bat '
alias pll='     powershell   ls'
alias pgrepv='  powershell   select-string -notmatch      $*'
alias pgrepi='  powershell   select-string -casesensitive $*'
alias pdf='     powershell   gdr'
alias pdu='     powershell  -noprofile   -command "foreach ($o in gci) { Write-output $o $o.Length } "'
alias psef='    powershell   gps      $*'
alias psleep='  powershell   sleep    $1'
alias ptouch='  powershell   sp -path $1 -name LastWriteTime -value $(get-date)'
alias puptime=' powershell  (gwmi -Class Win32_OperatingSystem).LastBootUpTime'
alias penv='    powershell   ls env:'
alias ppwd='    powershell   pwd'
alias pshelp='  powershell   get-help $* -full'
alias psalias=' powershell   alias    $*'
alias psgcm='   powershell   gcm      $1*'
alias psvar='   powershell   ls       variable:'
alias ptailf='  powershell   gc       $1  -wait'
alias ptemp_head='powershell gc  $*  -t 10'


### netsh
# netsh wlan show profile name=labnol key=clear

