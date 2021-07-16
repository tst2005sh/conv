
RequireMod jq_stack3
json_array_to_sqlite() {
	jq_stack3 init option -cMr modcall array_to_sqlite run
}
