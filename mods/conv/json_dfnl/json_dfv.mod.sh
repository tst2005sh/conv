json_dfnl_to_json_dfv_deps() {
	Deps jq || return 1
}
json_dfnl_to_json_dfv() {
	json_dfnl_to_json_dfv_deps || return 1
	jq '
	def dfnl_to_dfv:
		group_by(.dir+.file)|
		map({
			"dir":(first|.dir),
			"file":(first|.file),
			"value": sort_by(.n)|map(.line)|join("\n")
		})
	;
	dfnl_to_dfv';
}
