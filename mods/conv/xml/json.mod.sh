xml_to_json() {
	if [ ! -x "${scriptdir:-.}/deps/xml2json/xml2json.py" ]; then
		echo >&2 "Missing util. No such ${scriptdir:-.}/deps/xml2json/xml2json.py (Maybe, git clone https://github.com/hay/xml2json ?)"
		return 1
	fi
	"${scriptdir:-.}/deps/xml2json/xml2json.py" --strip_namespace
}
