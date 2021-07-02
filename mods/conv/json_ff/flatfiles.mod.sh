json_ff_to_flatfiles() {
	jq -r '	if type=="array" then .[] else . end|
		if .mkdir and .write and .in then
			@sh "[ -d \(.mkdir) ] || mkdir -- \(.mkdir);echo \(.value|@base64)|base64 -d>\(.in)"
		else @sh "echo ERROR;"
		end
	' |
	while read -r line; do
		eval "$line";
	done
}

