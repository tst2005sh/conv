sendmail_aliases_to_sendmail_aliases_json_deps() {
	RequireMod jq_stack4 || return 1
	Deps jq || return 1
}
sendmail_aliases_to_sendmail_aliases_json() {
	sendmail_aliases_to_sendmail_aliases_json_deps || return 1
	jq_stack4 -R :precall '[.,inputs]'
	jq_stack4 :call 'map(select( .!="" and (test("^#")|not) ))'
	jq_stack4 :call 'map(split(" *: *";"g") | {"key":first , "value": (.[1:]|join(":")|split(", *";"g"))})'

	case "$1" in
	('(v1)'|"")
	jq_stack4 :call 'map(.value|=(sort|join(", ")))'
	;;
	('(v2)')
	:
	;;
	('(v3)')
	jq_stack4 :call 'map( (.key) as $key|.value[]|{"key":$key, "value":.} )'
	#jq_stack4 :call 'map( (.key) as $key|.value|map({"key":$key, "value":.})[] )'
	;;
	('(v4)')
	jq_stack4 :call 'map((.key) as $key|(.value|length) as $count|.value|to_entries|map({"key":$key, "value":.value, "z":"\(.key+1)/\($count)"})[] )'
	;;
	esac
	jq_stack4 :run :deinit
}
