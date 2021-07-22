json_array_to_tsv_deps() {
	Deps jq || return 1
	#RequireMod jq_stack3 ||return 1
}
json_array_to_tsv() {
	json_array_to_tsv_deps || return 1
	. ${scriptdir}/deps/jq-mods/lib/is_array_of_array.jq.lib.sh
	. ${scriptdir}/deps/jq-mods/lib/totsv.jq.lib.sh

	jq -r "$jq_function_is_array_of_array$jq_function_totsv"'totsv';

	#jq_stack3 init option -r modcall totsv run;
}
