
tb_filter_json_to_tb_filter_dat_deps() {
	RequireMod jq_stack4 || return 1
	Deps jq || return 1
}
tb_filter_json_to_tb_filter_dat() {
	tb_filter_json_to_tb_filter_dat_deps || return 1
	jq_stack4 -r
	jq_stack4 :call '.header |= (map("\(.key)=\(.value|tostring)"))'
	jq_stack4 :call '.filters |= (map(map("\(.key)=\(.value|tostring)")))'
	jq_stack4 :call '[.header, .filters] | flatten[]'
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

