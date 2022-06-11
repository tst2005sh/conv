xml_to_json_deps() {
	local name=xml_to_json
	local f="${scriptdir:-.}/deps/conv-py.$name/bin/$name.py23"
	if [ ! -x "$f" ]; then
		echo >&2 "missing dependency '${scriptdir:-.}/deps/conv-py.$name'"
		return 1
	fi
	Deps "$f" || return 1
	Deps python || return 1
}
xml_to_json() {
	xml_to_json_deps || return 1
	"${scriptdir:-.}/deps/conv-py.xml_to_json/bin/xml_to_json.py23" --strip_namespace
}
