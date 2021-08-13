dos_to_unix_deps() {
	Deps dos2unix || return 1
}
dos_to_unix() {
	dos_to_unix_deps || return 1
	case "$1" in
	('(bom)'|'(with bom)')
		dos2unix -b
	;;
	('(nobom)'|'(without bom)'|'()'|'')
		dos2unix -r
	;;
	(*)
		echo >&2 ERROR; return 1
	;;
	esac

}
