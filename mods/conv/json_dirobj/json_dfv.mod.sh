json_dirobj_to_json_dfv_deps() {
	Deps jq || return 1
}
json_dirobj_to_json_dfv() {
	json_dirobj_to_json_dfv_deps || return 1
	jq 'map(
		.dir as $dir|
		del(.dir)|to_entries|.[]|{"dir":$dir,"file":.key,"value":.value}
	)'
}
