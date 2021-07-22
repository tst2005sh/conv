json_to_ndjson_deps() {
	#RequireMod jq_stack || return 1
	Deps jq || return 1
}
json_to_ndjson() {
	json_to_ndjson_deps || return 1
	#jq -cM '.[]'
	#. "${scriptdir}/deps/jq-mods/lib/ndjson.jq.lib.sh"
	#jq_stack init
	#json2ndjson
	#jq_stack run
	jq -cM 'if type=="array" then .[] else . end'
}
