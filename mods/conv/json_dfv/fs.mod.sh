Deps base64
json_dfv_to_fs() {
	jq -r '	if type=="array" then .[] else . end|
		if .dir and .file and .value then
			@sh "[ -d \(.dir) ] || mkdir -- \(.dir);echo \(.value|@base64)|base64 -d>\("\(.dir//".")/\(.file)")"
		else @sh "echo ERROR;"
		end
	' |
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

