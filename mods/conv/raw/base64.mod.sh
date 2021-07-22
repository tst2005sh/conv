
raw_to_base64_deps() {
	Deps base64 || return 1
}

raw_to_base64() {
	raw_to_base64_deps || return 1
	base64 -w0;
}
