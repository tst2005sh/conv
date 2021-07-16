
if [ ! -x "${scriptdir}/deps/json2yaml/json2yaml" ]; then
	echo >&2 "missing dependency 'json2yaml'"
	exit 1
fi
json_to_yaml() {
	"${scriptdir}/deps/json2yaml/json2yaml"
}
