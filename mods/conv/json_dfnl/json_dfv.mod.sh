
json_dfnl_to_json_dfv() {
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
