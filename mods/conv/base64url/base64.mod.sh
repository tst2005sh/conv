
base64url_to_base64_deps() {
	Deps tr || return 1
}
base64url_to_base64() {
	base64url_to_base64_deps || return 1
	tr '_-' '/+'
}
