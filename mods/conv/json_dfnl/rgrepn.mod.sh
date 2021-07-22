json_dfnl_to_rgrepn_deps() {
	Deps jq || return 1
}
json_dfnl_to_rgrepn() {
	json_dfnl_to_rgrepn_deps || return 1
	jq '
	map(
		(if (.dir|startswith("/")) then (".") else ("") end) +
		.dir + "/" + .file + ":" + (.n//0|tostring) + ":" + (.line//"")
	)
	'|jq -r '.[]'
}
