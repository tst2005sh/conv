
Deps jq || return 1 :# here return is valid because we source it from a function
JQ_STACK3_MODDIR="$scriptdir/deps/jq-mods/lib"
. "$scriptdir/deps/jq-helpers/lib/jq_stack3.lib.sh"
#jq_stack() { jq_stack3 "$@"; }
# jqf() { jq_stack modcall "$@"; }
