json_array_to_csv_deps() {
	Deps jq || return 1
}
json_array_to_csv() {
	json_array_to_csv_deps || return 1
	jq -r '.[]|@csv'
	# |map(if type=="array" or type=="object" then "\(tostring)" else . end)
}

#json_array_to_csv() {
#	RequireMod jq;
#	jq_array_to_csv;
#}
#jq_array_to_csv() { jq_stack option -r; jq_stack call '.[]|@csv'; }

#jq_function_array_to_csv='def array_to_csv: .[]|@csv;'
#jq_array_to_csv() { JQF_OPTIONS='-r' jqf 'array_to_csv'; }

