dos_to_unix_deps() {
	Deps dos2unix || return 1
}
dos_to_unix() {
	dos_to_unix_deps || return 1
	dos2unix -r
}
