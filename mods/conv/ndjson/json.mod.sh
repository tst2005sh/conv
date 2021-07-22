ndjson_to_json_deps() {
	RequireMod jq_stack3 || return 1
}
ndjson_to_json() {
	ndjson_to_json_deps || return 1
	jq_stack3 init call '[.,inputs]' modcall fromndjson run
}
