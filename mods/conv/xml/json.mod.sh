xml_to_json_deps() {
	if [ ! -x "${scriptdir:-.}/deps/xml2json/xml2json.py" ]; then
		echo >&2 "Missing util. No such ${scriptdir:-.}/deps/xml2json/xml2json.py (Maybe, git clone https://github.com/hay/xml2json ?)"
		return 1
	fi
	Deps "${scriptdir:-.}/deps/xml2json/xml2json.py" || return 1
	Deps python || return 1
}
xml_to_json() {
	xml_to_json_deps || return 1
	"${scriptdir:-.}/deps/xml2json/xml2json.py" --strip_namespace
}
