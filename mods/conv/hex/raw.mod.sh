hex_to_raw_deps() {
	Deps lua || return 1
}
hex_to_raw() {
	hex_to_raw_deps || return 1
	lua -e '
		local _byte_from_hex = function(x) return string.char(tonumber(x, 16)) end
		local from_hex = function(s) return (s:gsub("[^0-9a-fA-f]",""):gsub("(..)", _byte_from_hex)) end
		io.stdout:write(from_hex(io.stdin:read("*a")))
	'
}

# known bug:
# - if the hex data in not pair (aa bb cc d) the last value (d) will kept as-is (not decoded)
