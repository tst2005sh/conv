#!/bin/bash

cd "$(dirname "$0")/.." || exit 1

fs=samples/flatfiles/
json_dfv=samples/sample.json_dfv.json
rgrepn=samples/sample.rgrepn
json_dfnl=samples/sample.json_dfnl.json
json_dirobj=samples/sample.json_dirobj.json
yaml_dfv=samples/sample.yaml_dfv.yaml
#yaml_dfv=samples/sample2.yaml_dfv.yaml
csv=samples/sample.csv
tsv=samples/sample.tsv

test_conv() {
	local a="$1";shift
	local b="$1";shift
	local c="$1";shift
	if [ ! -f "$c" ]; then
		cat "$a" | ./bin/conv "$b" > "$c"
	fi
	diff -u <(cat "$a" | ./bin/conv "$b") "$c" && echo "ok: $b" || echo "fail: $b"
}
test_conv "$csv" csv/json_array/tsv "$tsv"
test_conv "$tsv" tsv/json_array/csv "$csv"
test_conv "$tsv" tsv/json_array samples.tests/tsv.json_array
test_conv "$csv" csv/json_array/csv "$csv"
test_conv "$csv" csv/json_array samples.tests/csv.json_array
test_conv "$csv" csv/json_object samples.tests/csv.json_object

json_array=samples.tests/json_array
test_conv "$json_array" json_array/tsv "$tsv"
test_conv "$json_array" json_array/csv "$csv"
test_conv "$json_array" json_array/json_object samples.tests/json_array.json_object
test_conv "$json_array" json_array/sqlite_sql samples.tests/json_array.sqlite_sql

json_object=samples.tests/json_array.json_object
test_conv "$json_object" json_object/json_array "$json_array"

test_conv "$rgrepn" rgrepn/rgrep samples.tests/rgrepn.rgrep
rgrep=samples.tests/rgrepn.rgrep
test_conv "$rgrep" rgrep/rgrepn "$rgrepn"

test_conv "$rgrepn" rgrepn/json_d1fnl samples.tests/rgrepn.json_d1fnl
test_conv "$rgrepn" rgrepn/json_dfnl samples.tests/rgrepn.json_dfnl
test_conv "$rgrep" rgrep/rgrepn "$rgrepn"
test_conv "$rgrep" rgrep/json_object samples.tests/rgrepn.json_object

tb_filter_dat=samples/sample.thunderbird.msgFilterRules.dat
tb_filter_json=samples.tests/tb_filter_dat.tb_filter_json
test_conv "$tb_filter_dat" tb_filter_dat/tb_filter_json "$tb_filter_json"
test_conv "$tb_filter_json" tb_filter_json/tb_filter_dat "$tb_filter_dat"

# modified:   mods/conv/ndjson/json.mod.sh
# modified:   mods/conv/sendmail_aliases/json.mod.sh

sendmail_aliases=samples.tests/sendmail_aliases_json.sendmail_aliases
sendmail_aliases_json=samples.tests/sendmail_aliases.sendmail_aliases_json
test_conv "samples/sample.sendmail_aliases" sendmail_aliases/sendmail_aliases_json "$sendmail_aliases_json"
test_conv "$sendmail_aliases_json" sendmail_aliases'(v1)'/sendmail_aliases_json "$sendmail_aliases.v1"
test_conv "$sendmail_aliases_json" sendmail_aliases'(v3)'/sendmail_aliases_json "$sendmail_aliases.v3"
test_conv "$sendmail_aliases_json" sendmail_aliases/sendmail_aliases_json "$sendmail_aliases"

exit

dos/unix
fs/ncdu
fs/rgrepn

html/xml
json_array/sqlite_sql
json_dfnl/json_dfv
json_dfnl/json_dfv_to_ikv_to_obj
json_dfnl/rgrepn
json_dfv/fs
json_dfv/json_dfnl
json_dfv/json_dirobj
json_dirobj/json_dfv
json_flat_dfnv/json_struct_dfv
json/ndjson
json_object/json_array
json/xml
json/yaml

ncdu/find
ncdu/json
ncdu/json2

ndjson/json

sendmail_aliases/json

sqlite_sql/json_array
sqlite_sql/sqlite

tb_filter_dat/tb_filter_json
tb_filter_json/tb_filter_dat
unix/dos
utf8bom/utf8
utf8/utf8bom
xml/html
xml/json
yaml/json

base64/raw
hex/raw
raw/base64
raw/hex
raw/raw
