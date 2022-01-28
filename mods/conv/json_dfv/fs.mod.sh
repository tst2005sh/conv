json_dfv_to_fs_deps() {
	Deps base64 || return 1
	Deps jq || return 1
	Deps cat || return 1
}
json_dfv_to_fs() {
	json_dfv_to_fs_deps || return 1

	case "$1" in
	('(v1)'|"")
	jq -r '	if type=="array" then .[] else . end|
		if .dir and .file and .value then
			.dir|= if startswith("/") then "."+. else . end |
			@sh "[ -d \(.dir) ] || mkdir -- \(.dir);echo \(.value|@base64)|base64 -d>\("\(.dir//".")/\(.file)")"
		else @sh "echo ERROR;"
		end
	'
	;;
	('(v2)')
	jq -r '	# require a array of entries
		if type!="array" then error("input must be a array (of objects), found \(type)") else . end|

		# change absolute path to relative
		map( if .dir then .dir|= if startswith("/") then "."+. else . end else @sh "echo ERROR;" end)|

		# process per directory
		group_by(.dir)|

		map(
		(first|if .dir then .dir|@sh "[ -d \(.) ] || mkdir -- \(.)" else @sh "echo ERROR;" end),
		(
			.[]|
			if .dir and .file and .value then
				@sh "echo \(.value|@base64)|base64 -d>\("\(.dir//".")/\(.file)")"
			else @sh "echo ERROR;"
			end
		)
		)[]
	'
	;;
	esac |
	if ${CONV_WRITE:-false}; then
		while read -r line; do
			eval "$line";
		done
	else
		cat
		echo >&2
		echo >&2 "Use: conv -w ..."
		echo >&2 "   to allow write in $(pwd)"
		echo >&2 "   that will create directories/files"
	fi
}

