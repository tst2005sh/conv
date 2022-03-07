
Deps jq || return 1 :# here return is valid because we source it from a function
JQ_STACK4_MODDIR="$scriptdir/deps/jq-mods/lib"
. "$scriptdir/deps/jq-helpers/lib/jq_stack4.lib.sh"
#jq_stack() { jq_stack4 "$@"; }
