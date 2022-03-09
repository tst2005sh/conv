
#RequireMod jq_stack
#json_object_to_json_array() {
#	jq_stack init
#	case "$1" in
#	('('*')')	jq_stack modcall 'object_to_array'"$1"	;;
#	(*) 		jq_stack modcall 'object_to_array'	;;
#	esac
#	jq_stack run
#}

json_object_to_json_array_deps() {
	RequireMod jq_stack4 || return 1
}
json_object_to_json_array() {
	json_object_to_json_array_deps || return 1
	if [ "$1" = "()" ]; then set -- ""; fi
	jq_stack4 :modcall 'object_to_array'"$1" :run
}
