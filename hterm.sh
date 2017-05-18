#!/bin/sh 
osascript <<END 
tell application "Terminal"
    do script "cd \"`pwd`\";$2 $3 $4 $5 $6 $7 "
    set current settings of selected tab of window 1 to settings set "$1"
end tell
END
