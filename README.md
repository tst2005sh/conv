
# conv

An util to convert text-based format.

At the beginning it was focused on:
- TSV <-> json
- FS files <-> rgrepn <-> json


## supported format

- See [FORMAT](./FORMAT.md)

## supported convertion


```sh
$ conv -l | grep -v raw
csv/json_array
csv/json_object
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
json/yaml
ncdu/json
ncdu/json2
ndjson/json
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

```sh
$ conv -l |grep raw
base64/raw
hex/raw
raw/base64
raw/hex
```

## dependencies

No dependency is mandatory (except the shell it self).

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
