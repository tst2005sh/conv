xml_to_html_deps() {
	if ! command -v tidy >/dev/null 2>&1; then
		echo >&2 "Command required: tidy (please install tidy, maybe: apt-get install tidy ?)"
		return 1
	fi
	Deps tidy || return 1
}

xml_to_html() {
	xml_to_html_deps || return 1
	tidy --tidy-mark no --indent yes --indent-with-tabs yes --wrap 0 -utf8 --preserve-entities yes -q -xml -ashtml
}
