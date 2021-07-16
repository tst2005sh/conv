
if [ ! -x "${scriptdir}/deps/yaml2json/yaml2json" ]; then
	echo >&2 "missing dependency 'yaml2json'"
	exit 1
fi
yaml_to_json() {
	"${scriptdir}/deps/yaml2json/yaml2json"
}
