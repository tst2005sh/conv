
csv_to_json_array_deps() {
	local name=csv_to_json
	local f="${scriptdir:-.}/deps/conv-py.$name/bin/${name}_array.py3"
	if [ ! -x "$f" ]; then
		echo >&2 "missing dependency 'conv-py.csv_to_json'"
		return 1
	fi
	Deps "$f" || return 1
	Deps python3 || return 1
}
csv_to_json_array() {
	csv_to_json_array_deps || return 1
	"${scriptdir}/deps/conv-py.csv_to_json/bin/csv_to_json_array.py3"
}

