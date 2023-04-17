
json_to_yaml_deps() {
	local name=json_to_yaml
	local f="${scriptdir}/deps/conv-py.$name/bin/$name.py23"
	if [ ! -x "$f" ]; then
		echo >&2 "missing dependency 'conv-py.$name'"
		return 1
	fi
	Deps "$f" || return 1
	DepsAny python{3,,2} || return 1
}
json_to_yaml() {
	json_to_yaml_deps || return 1
	"${scriptdir}/deps/conv-py.json_to_yaml/bin/json_to_yaml.py23"
}
