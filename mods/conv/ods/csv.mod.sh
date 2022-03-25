
ods_to_csv_deps() {
	Deps libreoffice || return 1
}
ods_to_csv() {
	ods_to_csv_deps || return 1
	local tmpd="$(mktemp -d /tmp/conv.XXXXXXXX)"
	local input=$tmpd/data.ods output=$tmpd/data.csv
	cat > $input
	libreoffice --headless --convert-to csv --outdir $tmpd $input >/dev/null 2>&1
	rm -f $input
	cat $output
	rm -rf $tmpd
}
