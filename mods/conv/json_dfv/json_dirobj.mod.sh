json_dfv_to_json_dirobj() {
	jq '
	map( {"dir":(.dir),(.file):(.value)} )
        | group_by(.dir)|map(add)
	'
}
