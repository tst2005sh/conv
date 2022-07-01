json_to_xml_deps() {
	local name=json_to_xml
	local f="${scriptdir:-.}/deps/conv-py.$name/bin/$name.py23"
	if [ ! -x "$f" ]; then
		echo >&2 "missing dependency '${scriptdir:-.}/deps/conv-py.$name'"
		return 1
	fi
	Deps "$f" || return 1
	Deps python3 python python2 || return 1
}
json_to_xml() {
	json_to_xml_deps || return 1
	"$(CommandAny python3 python python2)" "${scriptdir:-.}/deps/conv-py.json_to_xml/bin/json_to_xml.py23"
}
