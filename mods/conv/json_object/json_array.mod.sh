
RequireMod jq_stack
json_object_to_json_array() {
	jq_stack init
	case "$1" in
	('('*')')	jq_stack modcall 'object_to_array'"$1"	;;
	(*) 		jq_stack modcall 'object_to_array'	;;
	esac
	jq_stack run
}
