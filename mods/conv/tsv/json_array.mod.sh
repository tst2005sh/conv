#RequireMod jq_stack
#tsv_to_json_array() {
#	. "${scriptdir}/deps/jq-mods/lib/fromtsv.jq.lib.sh"
#	jq_stack init
#	jq_stack option -R
#	jq_stack envfunction fromtsv
#	jq_stack call '[.,inputs]|fromtsv'
#	jq_stack run
#}

tsv_to_json_array_deps() {
	RequireMod jq_stack4 || return 1
}
tsv_to_json_array() {
	tsv_to_json_array_deps || return 1
	jq_stack4 -R :precall '[.,inputs]' :modcall fromtsv :run
}
