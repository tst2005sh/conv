
csv_to_ndjson_array_deps() {
	local name=csv_to_ndjson_array
	local f="${scriptdir}/deps/conv-py.csv_to_json/bin/${name}.py23"
	if [ ! -x "$f" ]; then
		echo >&2 "missing dependency 'conv-py.csv_to_json'"
		return 1
	fi
	Deps "$f" || return 1
	DepsAny python{3,,2} || return 1
}
csv_to_ndjson_array() {
	csv_to_ndjson_array_deps || return 1
	"${scriptdir}/deps/conv-py.csv_to_json/bin/csv_to_ndjson_array.py23"
}
