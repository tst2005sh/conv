Deps jq
jq_array_to_csv() { jq -r '.[]|@csv'; }

#json_array_to_csv() {
#	RequireMod jq;
#	jq_array_to_csv;
#}
#jq_array_to_csv() { jq_stack option -r; jq_stack call '.[]|@csv'; }

#jq_function_array_to_csv='def array_to_csv: .[]|@csv;'
#jq_array_to_csv() { JQF_OPTIONS='-r' jqf 'array_to_csv'; }

