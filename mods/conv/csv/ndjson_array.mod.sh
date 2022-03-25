
csv_to_ndjson_array_deps() {
	if [ ! -x "${scriptdir}/deps/csv2json/csv2ndjson_array.py" ]; then
		echo >&2 "missing dependency 'csv2json'"
		return 1
	fi
	Deps python2 || return 1
	Deps "${scriptdir}/deps/csv2json/csv2ndjson_array.py" || return 1

}
csv_to_ndjson_array() {
	csv_to_ndjson_array_deps || return 1
	"${scriptdir}/deps/csv2json/csv2ndjson_array.py"
}

