fs_to_rgrepn_deps() {
	Deps grep || return 1
}
fs_to_rgrepn() {
	fs_to_rgrepn_deps || return 1
	grep -r -Hn --color=auto '' .
}
