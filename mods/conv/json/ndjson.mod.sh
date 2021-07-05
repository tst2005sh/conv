#RequireMod jq_stack
Deps jq
json_to_ndjson() {
	#jq -cM '.[]'
	#. "${scriptdir}/deps/jq-mods/lib/ndjson.jq.lib.sh"
	#jq_stack init
	#json2ndjson
	#jq_stack run
	jq -cM 'if type=="array" then .[] else . end'
}
