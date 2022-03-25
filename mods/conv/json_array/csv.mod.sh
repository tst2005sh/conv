
json_array_to_csv_deps() {
	Deps jq || return 1
	RequireMod jq_stack4 ||return 1
}
json_array_to_csv() {
	json_array_to_csv_deps || return 1
	jq_stack4 -r :modcall tocsv :run;
}
