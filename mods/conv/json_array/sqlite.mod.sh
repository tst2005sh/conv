json_array_to_sqlite_deps() {
	RequireMod jq_stack3 || return 1
}
json_array_to_sqlite() {
	json_array_to_sqlite_deps || return 1
	jq_stack3 init option -cMr modcall array_to_sqlite"${1}" run
}
