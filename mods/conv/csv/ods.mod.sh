
csv_to_ods_deps() {
	Deps libreoffice || return 1
}
csv_to_ods() {
	csv_to_ods_deps || return 1
	local tmpd="$(mktemp -d /tmp/conv.XXXXXXXX)"
	local input=$tmpd/data.csv output=$tmpd/data.ods
	cat > $input
	libreoffice --headless --convert-to ods --outdir $tmpd $input >/dev/null 2>&1
	rm -f $input
	cat $output
	rm -rf $tmpd
}
