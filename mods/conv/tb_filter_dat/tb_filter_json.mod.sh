
tb_filter_dat_to_tb_filter_json_deps() {
	RequireMod jq_stack4 || return 1
	Deps jq || return 1
}
tb_filter_dat_to_tb_filter_json() {
	tb_filter_dat_to_tb_filter_json_deps || return 1
	jq_stack4 -R :precall '[.,inputs]'
	jq_stack4 :call 'map(split("=")|{"key":first,"value":(.[1:]|join(":"))})'
	jq_stack4 :call '(.[0:2]) as $header|(.[2:])'
	jq_stack4 :modcall 'unlinebreak(.key!="name")'
	jq_stack4 :call '{"header":$header,"filters":.}'
	jq_stack4 :run
}

#"name"
#"enabled"
#"type"
#"action"
#"actionValue"
#"action"
#"actionValue"
#"action"
#"actionValue"
#"action"
#"condition"

#"name"
#"enabled"
#"type"
#"action"
#"actionValue"
#"condition"

