
utf8_to_utf8bom_deps() {
	Deps sed || return 1
}
utf8_to_utf8bom() {
	utf8_to_utf8bom_deps || return 1
	sed '1s/^\(\xEF\xBB\xBF\|\)/\xEF\xBB\xBF/'
}
