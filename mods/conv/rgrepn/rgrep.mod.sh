rgrepn_to_rgrep_deps() {
	Deps cut || return 1
}
rgrepn_to_rgrep() {
	rgrepn_to_rgrep_deps || return 1
	cut -d: -f1,3-
#	while read -r line; do
#		pathkey="${line%%:*}" # easy parse...
#		count_value="${line#*:}"
#		printf '%s:%s\n' "$pathkey" "$value"
#		lastpathkey="$pathkey"
#	done
}
