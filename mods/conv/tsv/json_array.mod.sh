#RequireMod jq_stack
#tsv_to_json_array() {
#	. "${scriptdir}/deps/jq-mods/lib/fromtsv.jq.lib.sh"
#	jq_stack init
#	jq_stack option -R
#	jq_stack envfunction fromtsv
#	jq_stack call '[.,inputs]|fromtsv'
#	jq_stack run
#}

RequireMod jq_stack3
tsv_to_json_array() {
	jq_stack3 init option -R modcall fromtsv precall '[.,inputs]' run
}
