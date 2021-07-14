Deps jq
#use_jq_stack3() {
        JQ_STACK3_MODDIR="$scriptdir/deps/jq-mods/lib"

	. "$scriptdir/deps/jq-helpers/lib/jq_stack3.lib.sh"
	#jq_stack() { jq_stack3 "$@"; }
	# jqf() { jq_stack modcall "$@"; }
#}
