
# conv

An util to convert text-based format.

At the beginning it was focused on:
- TSV <-> json
- FS files <-> rgrepn <-> json


## supported format

- See [FORMAT](./FORMAT.md)

## supported convertion


```sh
$ conv -l | grep -v raw | sort 
base64/base64url
base64url/base64
csv/json_array
csv/json_array_via_jq
csv/json_object
csv/ndjson_array
csv/ods
dos/unix
fs/ncdu
fs/rgrepn
html/xml
json_array/csv
json_array/json_object
json_array/sqlite_sql
json_array/tsv
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
ods/csv
rgrep/json_object
rgrepn/json_d1fnl
rgrepn/json_dfnl
rgrepn/rgrep
rgrep/rgrepn
sendmail_aliases_json/sendmail_aliases
sendmail_aliases/sendmail_aliases_json
sqlite_sql/json_array
sqlite_sql/sqlite
tb_filter_dat/tb_filter_json
tb_filter_json/tb_filter_dat
tsv/json_array
unix/dos
utf8bom/utf8
utf8/utf8bom
xml/html
xml/json
xml/json_via_xmltodict
yaml/json
```

```sh
$ conv -l |grep raw | sort
base64/raw
hex/raw
raw/base64
raw/hex
raw/raw
```

## dependencies

A POSIX shell is the first mandatory dependency.
All other dependencies depends of the convertion you use.

## how to check dependencies

You can use the `--deps` option to check if all dependencies are available for a specific convertion pipepline.
Sample:
```sh
$ conv --deps fs/rgrepn/tsv
deps: ok: fs/rgrepn
deps: ok: rgrepn/json_dfnl
deps: ok: json_dfnl/json_dfv
deps: ok: json_dfv/json_dirobj
deps: ok: json_object/json_array
deps: ok: json_array/tsv
```

Mainly:

- posix/shell (or bash)
- [jq](https://stedolan.github.io/jq/)
- grep
- base64

Optionnal:
- mlr : [miller](https://miller.readthedocs.io/)

## hex support

- od, tr (from coreutils)
- lua

## xml support

- tinyxml

## yaml supprt

- python
- [yaml2json]()
