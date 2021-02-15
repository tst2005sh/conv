
conv() {
	if [ $# -lt 2 ]; then
		echo >&2 "Usage: conv <from> <to> [args...]"
		return 1
	fi
	RequireMod "conv/$1/$2"
	local name="$1_to_$2";shift 2
	"$name" "$@"
}

RequireMod() {
	if [ -z "$scriptdir" ]; then
		echo >&2 "ERROR: scriptdir variable not defined"
		return 1
	fi
	if [ -z "$1" ]; then
		echo >&2 "ERROR: Require: missing argument"
		return 1
	fi
	. "${scriptdir}/mods/$1.mod.sh"
}

Deps() {
	local self="Deps"
	while [ $# -gt 0 ]; do
		if ! command >/dev/null 2>&1 -v "$1"; then
			echo >&2 "ERROR: ${self}: missing dependency (command $1)"
			return 1
		fi
		shift
	done
	return 0
}
