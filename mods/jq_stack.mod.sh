Deps jq
#use_jq_stack() {
        JQ_STACK_MODDIR="$scriptdir/deps/jq-mods/lib"

        . "$scriptdir/deps/jq-helpers/lib/jq_stack.lib.sh"
        . "$scriptdir/deps/jq-helpers/lib/jq_stack_modcall.lib.sh"
        . "$scriptdir/deps/jq-helpers/lib/jq_stack_modload.lib.sh"
        . "$scriptdir/deps/jq-helpers/lib/jq_stack_oneline.lib.sh"

        #. "$scriptdir/deps/jq-mods/jqf.lib.sh"

        jqf() {
                jq_stack modcall "$@"
        }
#}

