json_array_to_sqlite_sql_deps() {
	RequireMod jq_stack4 || return 1
}
json_array_to_sqlite_sql() {
	json_array_to_sqlite_sql_deps || return 1
	jq_stack4 -cMr :modcall array_to_sqlite"${1}" :run
}
