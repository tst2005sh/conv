unix_to_dos_deps() {
	Deps unix2dos || return 1
}
unix_to_dos() {
	unix_to_dos_deps || return 1
	unix2dos -m
}
