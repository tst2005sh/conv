
RequireMod jq_stack
tsv_to_json_array() {
	. "${scriptdir}/deps/jq-mods/lib/fromtsv.jq.lib.sh"
	jq_stack init
	jq_stack option -R
	jq_stack envfunction fromtsv
	jq_stack call '[.,inputs]|fromtsv'
	jq_stack run
}
