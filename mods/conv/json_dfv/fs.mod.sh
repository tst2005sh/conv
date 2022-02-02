json_dfv_to_fs_deps() {
	Deps base64 || return 1
	Deps jq || return 1
	Deps cat || return 1
}
json_dfv_to_fs() {
	json_dfv_to_fs_deps || return 1

	case "$1" in
	('(v1)'|"")
	jq -r '
		if type=="array" then .[] else . end
		| select(.dir and .file and .value)
		| .dir|= if startswith("/") then "."+. else . end
		| @sh "[ -d \(.dir) ] || ${mkdir:-mkdir} -- \(.dir);echo \(.value|@base64)|base64 -d>\("\(.dir//".")/\(.file)")"
	'
	;;
	('(v2)')
	jq -r '
		# require a array of entries
		if type!="array" then error("input must be a array (of objects), found \(type)") else . end

		# change absolute path to relative
		| map(
			select(.dir and .file and .value)
			| .dir|= if startswith("/") then "."+. else . end
		)

		# process per directory
		| group_by(.dir)

		| map(
		(first|if .dir then .dir|@sh "[ -d \(.) ] || ${mkdir:-mkdir}  -- \(.)" else @sh "echo ERROR;" end),
		(
			.[]
			| select(.dir and .file and .value)
			| @sh "echo \(.value|@base64)|base64 -d>\("\(.dir//".")/\(.file)")"
		)
		)[]
	'
	;;
	('(v1b)')
	jq -r '
		.[]
		| select(.dir and .file and .value)
		| .dir|= if startswith("/") then "."+. else . end
		| @sh "[ -d \(.dir) ] || ${mkdir:-mkdir} -- \(.dir);base64 -d >\("\(.dir//".")/\(.file)") <<@" + "\n\(.value|@base64)\n@"
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

