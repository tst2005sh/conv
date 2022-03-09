ndjson_to_json_deps() {
	RequireMod jq_stack4 || return 1
}
ndjson_to_json() {
	ndjson_to_json_deps || return 1
	jq_stack4 :precall '[.,inputs]' :modcall fromndjson :run
}
