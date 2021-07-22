
yaml_to_json_deps() {
	if [ ! -x "${scriptdir}/deps/yaml2json/yaml2json" ]; then
		echo >&2 "missing dependency 'yaml2json'"
		return 1
	fi
	Deps python3 || return 1
	Deps "${scriptdir}/deps/yaml2json/yaml2json" || return 1
}
yaml_to_json() {
	yaml_to_json_deps || return 1
	"${scriptdir}/deps/yaml2json/yaml2json"
}
