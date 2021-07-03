json_ff_to_flatfiles() {
	jq -r '	if type=="array" then .[] else . end|
		if .mkdir and .write and .in then
			@sh "[ -d \(.mkdir) ] || mkdir -- \(.mkdir);echo \(.write|@base64)|base64 -d>\(.in)"
		else @sh "echo ERROR;"
		end
	' |
	if ${CONV_WRITE:-false}; then
		while read -r line; do
			eval "$line";
		done
	else
		echo >&2 "Use conv -w to allow flatfiles to create directories/files in $(pwd)"
	fi
}

