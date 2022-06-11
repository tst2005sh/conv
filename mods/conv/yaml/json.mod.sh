
yaml_to_json_deps() {
	local name=yaml_to_json
	local f="${scriptdir:-.}/deps/conv-py.$name/bin/$name.py3"
	if [ ! -x "$f" ]; then
		echo >&2 "missing dependency '${scriptdir:-.}/deps/conv-py.$name'"
		return 1
	fi
	Deps "$f" || return 1
	Deps python3 || return 1
}
yaml_to_json() {
	yaml_to_json_deps || return 1
	"${scriptdir:-.}/deps/conv-py.yaml_to_json/bin/yaml_to_json.py3"
}
