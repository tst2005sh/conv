
base64_to_base64url_deps() {
	Deps tr || return 1
}
base64_to_base64url() {
	base64_to_base64url_deps || return 1
	tr '/+' '_-'
}
