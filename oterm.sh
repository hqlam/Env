#!/bin/sh 
osascript <<END 
tell application "terminal"
    do script "cd \"`pwd`\";$1"
end tell
END
