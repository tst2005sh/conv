json_to_ndjson_deps() {
	RequireMod jq_stack4 || return 1
}
json_to_ndjson() {
	json_to_ndjson_deps || return 1
	jq_stack4 :init :modcall tondjson :run
}
