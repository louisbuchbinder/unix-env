alias chrome='open /Applications/Google\ Chrome.app'
alias text='open /Applications/TextEdit.app'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl '
alias localhost='python -m SimpleHTTPServer '
alias ll='ls -l '
alias la='ls -la '

if [ -z "`which eject`" ]; then
	alias eject='diskutil unmount '
fi

function li {
	ls $@ | sort
}

function length {
	awk '
		BEGIN {
			count = 0
		}
		{
			count++
		}
		END {
			print count
		}
	'
}
