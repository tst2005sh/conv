sendmail_aliases_to_json_deps() {
	RequireMod jq_stack3 || return 1
	Deps jq || return 1
}
sendmail_aliases_to_json() {
	sendmail_aliases_to_json_deps || return 1
	jq_stack3 init option -R precall '[.,inputs]'
	jq_stack3 call 'map(select( .!="" and (test("^#")|not) ))'
	jq_stack3 call 'map(split(" *: *";"g") | {"key":first , "value": (.[1:]|join(":")|split(", *";"g"))})'

	case "$1" in
	('(v1)'|"")
	jq_stack3 call 'map(.value|=join(", "))'
	;;
	('(v2)')
	:
	;;
	('(v3)')
	jq_stack3 call 'map( (.key) as $key|.value[]|{"key":$key, "value":.} )'
	;;
	esac
	jq_stack3 run deinit
}
