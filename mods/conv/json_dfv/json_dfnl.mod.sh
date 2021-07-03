json_dfv_to_json_dfnl() {
	jq '
	map(
		del(.value) as $orig
		| .value|split("\n")|to_entries|map({"n":(.key+1),"line":.value})
		| $orig+.[]
	)'
}
