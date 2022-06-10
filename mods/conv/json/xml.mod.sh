json_to_xml_deps() {
	if [ ! -x "${scriptdir:-.}/deps/xml2json/xml2json.py" ]; then
		echo >&2 "Missing util. No such ${scriptdir:-.}/deps/xml2json/xml2json.py (Maybe, git clone https://github.com/hay/xml2json ?)"
		return 1
	fi
	Deps "${scriptdir:-.}/deps/xml2json/xml2json.py" || return 1
	Deps python || return 1
}
json_to_xml() {
	json_to_xml_deps || return 1
	"${scriptdir:-.}/deps/xml2json/xml2json.py" --type json2xml
}
