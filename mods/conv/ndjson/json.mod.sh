ndjson_to_json_deps() {
	#RequireMod jq_stack || return 1
	Deps jq || return 1
}
ndjson_to_json() {
	ndjson_to_json_deps || return 1
	#jq -cM '[.,inputs]'
#	. "${scriptdir}/deps/jq-mods/lib/ndjson.jq.lib.sh"
#	jq_stack init
#	ndjson2json
#	jq_stack run
	jq -cM '[.,inputs]|if type=="array" and length==1 and (first|type)=="array" and (first|length)>=1 then .[] else . end'
}
