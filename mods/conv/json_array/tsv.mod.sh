Deps jq
json_array_to_tsv() {
	. ${scriptdir}/deps/jq-mods/lib/is_array_of_array.jq.lib.sh
	. ${scriptdir}/deps/jq-mods/lib/totsv.jq.lib.sh

	jq -r "$jq_function_is_array_of_array$jq_function_totsv"'totsv';
}
