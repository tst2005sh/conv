json_dfv_to_json_dirobj_deps() {
	Deps jq || return 1
}
json_dfv_to_json_dirobj() {
	json_dfv_to_json_dirobj_deps || return 1
	jq '
	map( {"dir":(.dir),(.file):(.value)} )
        | group_by(.dir)|map(add)
	'
}
