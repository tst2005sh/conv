
csv_to_json_object_deps() {
	local name=csv_to_json
	local f="${scriptdir}/deps/conv-py.$name/bin/${name}_object.py23"
	if [ ! -x "$f" ]; then
		echo >&2 "missing dependency 'conv-py.$name'"
		return 1
	fi
	Deps "$f" || return 1
	DepsAny python3 python python2 || return 1
}
csv_to_json_object() {
	csv_to_json_object_deps || return 1
	"${scriptdir}/deps/conv-py.csv_to_json/bin/csv_to_json_object.py23"
}
