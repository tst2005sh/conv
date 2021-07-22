json_dfnl_to_json_dfv_to_ikv_to_obj_deps() {
	Deps jq || return 1
}
json_dfnl_to_json_dfv_to_ikv_to_obj() {
	json_dfnl_to_json_dfv_to_ikv_to_obj_deps || return 1
	jq '
	def dfnl_to_dfv:
		group_by(.dir+.file)|
		map({
			"dir":(first|.dir),
			"file":(first|.file),
			"value": sort_by(.n)|map(.line)|join("\n")
		})
	;
	def dfv_to_ikv:
		map({"id":.dir, "key":.file, "value":.value})
	;
	def ikv_to_obj:
		map( {"id":(.id), (.key): (.value)} )
		| group_by(.id) | map(add) | .[]
	;
	dfnl_to_dfv | dfv_to_ikv | ikv_to_obj';
}
