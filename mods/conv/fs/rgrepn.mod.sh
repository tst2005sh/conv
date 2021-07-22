fs_to_rgrepn_deps() {
	Deps rgrep || return 1
}
fs_to_rgrepn() {
	fs_to_rgrepn_deps || return 1
	rgrep -Hn --color=auto '' .
}
