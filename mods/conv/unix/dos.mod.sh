unix_to_dos_deps() {
	Deps unix2dos || return 1
}
unix_to_dos() {
	unix_to_dos_deps || return 1
	case "$1" in
	('(nobom)'|'(without bom)')
		unix2dos
	;;
	('(bom)'|'(with bom)'|'()'|'')
		unix2dos -m
	;;
	(*)
		echo >&2 ERROR; return 1
	;;
	esac
}
