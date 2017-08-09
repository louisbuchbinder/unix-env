set -e # Exit if something fails during load

function loadRunCommands {
	local __DIRNAME=`dirname $BASH_SOURCE`
	local IGNORE=(`cat $__DIRNAME/rc.ignore`)

	IGNORE=${IGNORE[*]}
	IGNORE=${IGNORE/\ /|}"|rc.ignore"

	for file in `ls $__DIRNAME | egrep -v "$IGNORE"`; do
		source $__DIRNAME/$file
	done
}

loadRunCommands
set +e # Turn off auto-exit
