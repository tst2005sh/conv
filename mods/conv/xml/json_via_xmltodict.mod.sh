xml_to_json_via_xmltodict_deps() {
	local name=xml_to_json.via_xmltodict
	local f="${scriptdir:-.}/deps/conv-py3.$name/bin/${name%%.*}.py3"
	if [ ! -x "$f" ]; then
		echo >&2 "missing dependency '${scriptdir:-.}/deps/conv-py3.$name'"
		return 1
	fi
	Deps "$f" || return 1
	DepsAny python{3,} || return 1
}
xml_to_json_via_xmltodict() {
	xml_to_json_via_xmltodict_deps || return 1
	"$(CommandAny python3)" "${scriptdir:-.}/deps/conv-py3.xml_to_json.via_xmltodict/bin/xml_to_json.py3" --strip_namespace
}
