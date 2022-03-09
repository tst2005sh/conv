#RequireMod jq_stack
#json_array_to_json_object() {
#	. "${scriptdir}/deps/jq-mods/lib/array_to_object.jq.lib.sh"
#	jq_stack init
#	jq_stack envfunction array_to_object
#	jq_stack call array_to_object
#	jq_stack run
#}

json_array_to_json_object_deps() {
	RequireMod jq_stack4 || return 1
}
json_array_to_json_object() {
	json_array_to_json_object_deps || return 1
	jq_stack4 -cM :modcall array_to_object :run
}
