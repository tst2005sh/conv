
base64_to_raw_deps() {
	Deps base64 || return 1
}
base64_to_raw() {
	base64_to_raw_deps || return 1
	base64 -di;
}
