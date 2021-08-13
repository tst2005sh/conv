
utf8bom_to_utf8_deps() {
	Deps sed || return 1
}
utf8bom_to_utf8() {
	utf8bom_to_utf8_deps || return 1
	sed '1s/^\xEF\xBB\xBF//'
}
