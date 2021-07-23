
# conv

An util to convert text-based format.

- TSV <-> json
- FS files <-> rgrepn <-> json

## supported format

- See [FORMAT](./FORMAT.md)

## convertion supported


```sh
$ conv -l
base64/raw
csv/json_array
csv/json_object
fs/ncdu
fs/rgrepn
hex/raw
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
json/yaml
ncdu/json
ncdu/json2
ndjson/json
raw/base64
raw/hex
rgrep/json_object
rgrepn/json_d1fnl
rgrepn/json_dfnl
rgrepn/rgrep
rgrep/rgrepn
sqlite_sql/json_array
sqlite_sql/sqlite
tsv/json_array
xml/json
yaml/json
```

## dependencies

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
