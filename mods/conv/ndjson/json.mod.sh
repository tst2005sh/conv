#RequireMod jq_stack
Deps jq
ndjson_to_json() {
	#jq -cM '[.,inputs]'
#	. "${scriptdir}/deps/jq-mods/lib/ndjson.jq.lib.sh"
#	jq_stack init
#	ndjson2json
#	jq_stack run
	jq -cM '[.,inputs]|if type=="array" and length==1 and (first|type)=="array" and (first|length)>=1 then .[] else . end'
}
