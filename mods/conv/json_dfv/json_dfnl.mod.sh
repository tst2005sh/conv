json_dfv_to_json_dfnl_deps() {
	Deps jq || return 1
}
json_dfv_to_json_dfnl() {
	json_dfv_to_json_dfnl_deps || return 1
	jq '
	map(
		del(.value) as $orig
		| .value|split("\n")|to_entries|map({"n":(.key+1),"line":.value})
		| $orig+.[]
	)'
}
