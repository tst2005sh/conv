
csv_to_json_object_deps() {
	if [ ! -x "${scriptdir}/deps/csv2json/csv2json_object.py" ]; then
		echo >&2 "missing dependency 'csv2json'"
		return 1
	fi
	Deps python2 || return 1
	Deps "${scriptdir}/deps/csv2json/csv2json_object.py" || return 1
}
csv_to_json_object() {
	csv_to_json_object_deps || return 1
	"${scriptdir}/deps/csv2json/csv2json_object.py;
}
