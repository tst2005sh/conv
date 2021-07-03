json_dfnl_to_rgrepn() {
	jq '
	map(
		(if (.dir|startswith("/")) then (".") else ("") end) +
		.dir + "/" + .file + ":" + (.n//0|tostring) + ":" + (.line//"")
	)
	'|jq -r '.[]'
}
