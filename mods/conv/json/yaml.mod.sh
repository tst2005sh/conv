
json_to_yaml_deps() {
	if [ ! -x "${scriptdir}/deps/json2yaml/json2yaml" ]; then
		echo >&2 "missing dependency 'json2yaml'"
		return 1
	fi
	Deps python3 || return 1
	Deps "${scriptdir}/deps/json2yaml/json2yaml" || return 1
}
json_to_yaml() {
	json_to_yaml_deps || return 1
	"${scriptdir}/deps/json2yaml/json2yaml"
}
