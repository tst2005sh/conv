json_dfv_to_json_ff() {
	jq 'map({"mkdir":.dir, "write":(.value+"\n"),"in": "\(.dir)/\(.file)"})'
}
