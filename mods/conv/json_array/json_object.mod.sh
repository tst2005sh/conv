RequireMod jq_stack
json_array_to_json_object() {
	. "${scriptdir}/deps/jq-mods/lib/array_to_object.jq.lib.sh"
	jq_stack init
	jq_stack envfunction array_to_object
	jq_stack call array_to_object
	jq_stack run
}
