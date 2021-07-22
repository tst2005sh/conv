
raw_to_hex_deps() {
	Deps od || return 1
	Deps tr || return 1
}
raw_to_hex() {
	raw_to_hex_deps || return 1
	od -t x1 -An | tr -d -c '0-9a-fA-F'
}
