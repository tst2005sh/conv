sendmail_aliases_to_json_deps() {
	RequireMod jq_stack3 || return 1
	Deps jq || return 1
}
sendmail_aliases_to_json() {
	sendmail_aliases_to_json_deps || return 1
	jq_stack3 init option -R precall '[.,inputs]'
	jq_stack3 call 'map(if .!="" and (test("^#")|not) then split(" *: *";"g") | {"key":first , "value": (.[1:]|join(":")|split(", *";"g"))} else empty end)'
	jq_stack3 run
}
