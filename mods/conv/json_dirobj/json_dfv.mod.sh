
json_dirobj_to_json_dfv() {
	jq 'map(
		.dir as $dir|
		del(.dir)|to_entries|.[]|{"dir":$dir,"file":.key,"value":.value}
	)'
}
