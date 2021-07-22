html_to_xml_deps() {
	if ! command -v tidy >/dev/null 2>&1; then
		echo >&2 "Command required: tidy (please install tidy, maybe: apt-get install tidy ?)"
		return 1
	fi
	Deps tidy || return 1
}

html_to_xml() {
	html_to_xml_deps || return 1
	tidy -q -asxml 2>&-
}
