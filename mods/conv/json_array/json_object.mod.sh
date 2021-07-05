RequireMod jq_stack
json_array_to_json_object() {
	jq_stack init
	jq_stack encfunction array_to_object
	jq_stack call array_to_object
	jq_stack run
}
