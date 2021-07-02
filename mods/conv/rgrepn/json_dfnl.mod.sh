
# path:n:value ; path = dir[/dirN]/file
# - do not remove stuff
# - dirname/filename splitted at the first ':'
# - dirname is all path except the last one
# - filename is the last value splited by /

#jq_function_split1='def split1($sep): [split($sep)|(first,(skipfirst|join($sep)))];'
#jq_function_splitn='def splitn($sep;$n): [split($sep)|(.[0:$n],(.[$n:]|join($sep)))];'

. "$scriptdir/deps/jq-mods/lib/dirname_filename.jq.lib.sh"

# RGREP
# [.../dir/]dir '/' file ':' value

# RGREPN
# [.../dir/]dir '/' file-key ':' number ':' line

jq_function_removeprefix='
	def removeprefix:
		if (.|startswith("./")) then (.|.[2:]) else (.) end
	;'

jq_function_skipfirst='
	def skipfirst:
		del(.[0])
	;'

jq_function_split_skipfirst='
	def split_skipfirst($sep):
		(split($sep)|skipfirst|join($sep))
	;'

#jq_function_trytonumber='
#	def trytonumber:
#		if (try (.|tonumber) catch false) then (.|tonumber) else (.) end
#	;'

#jq_function_maybe='def maybe(f): if (try (f) catch false) then (f) else (.) end;'
jq_function_maybe='
	def maybe(f):
		(f?//.)
	;'

jq_function_ifempty='
	def ifempty($v):
		if (.=="") then ($v) else (.) end
	;'

rgrepn_to_json_dfnl() {
	jq -R '
	'"$jq_function_removeprefix"'
	'"$jq_function_skipfirst"'
	'"$jq_function_split_skipfirst"'
	'"$jq_function_ifempty"'
	'"$jq_function_maybe"'
	'"$jq_function_dirname_filename"'
	[.,inputs] |
	map(
		split(":")
		| (first|dirname_filename) as $df
		| (.[1]|ifempty("1")|maybe(tonumber)) as $n
		| (.[2:]|join(":")) as $line
		| ($df|first) as $dir
		| ($df|last) as $file|
		{
			"dir":$dir,
			"file": $file,
			"n": $n,
			"line": $line,
#			"n":    (split_skipfirst("/")|split_skipfirst(":")|split(":")|first|ifempty("1")|maybe(tonumber)),
#			"line": (split_skipfirst("/")|split_skipfirst(":")|split_skipfirst(":")),
		}
	)'
}
