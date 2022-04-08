
raw_to_hex_deps() {
	Deps od || return 1
	Deps tr || return 1
}
raw_to_hex() {
	raw_to_hex_deps || return 1
	if [ -z "$1" ] && command -v luajit >/dev/null 2>&1; then
		set -- '(lua)'
	fi
	case "$1" in
	(''|'(od+tr)')
		od -t x1 -An | tr -d -c '0-9a-fA-F'
	;;
	('(lua)')
		${LUA:-luajit} -e '
		local I,O,v=io.stdin,io.stdout
		while true do
			v = I:read(1024);
			if not v then break end
			O:write( ("%0.2x"):rep(#v):format( string.byte(v,1,-1) ) )
		end
		'
	;;
	(*) echo >&2 ERROR:raw_to_hex; return 1;;
	esac
}
