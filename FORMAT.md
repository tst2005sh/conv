
# All Supported Formats


## fs

(I also named it `flatfiles`).

Any text files in directories on the file system.

I use it like a small database:

See sample in [samples/flatfiles/](./samples/flatfiles/)

```
./dir1/file1:
line 1 of file1
line 2 of file1

./dir1/file2:
line 1 of file2

./dir2/file3:
line 1 of file3 in dir2
```

## rgrepn

It is the format returned by the `cd sample/fs && rgrep -Hn '' .` command.
Something like:
```
dir1/file1:1:line 1 of file1
dir1/file1:2:line 2 of file1
dir1/file2:1:line 1 of file2
dir2/file3:1:line 1 of file3 in dir2
```

## rgrep

Like rgrepn but without the line number


## json_dfnl

it is the json format nearest to `rgrepn`

- dir file number line
- line is only one line
- dir can be a path with subdirectories
- file is a file name

sample:
```json
{"dir":"dir1","file":"file1","n":1,"line":"line 1 of file1"}
{"dir":"dir1","file":"file1","n":2,"line":"line 2 of file1"}
{"dir":"dir1","file":"file2","n":1,"line":"line 1 of file2"}
{"dir":"dir2","file":"file3","n":1,"line":"line 1 of file3 in dir2"}
```

## json_dfv

- dir file value
- with value like a file content. value can contains multiple lines



## json_object

It is an array of json objects.

sample of JSON data:
```json
[
  {
    "dir": "./dir1",
    "file": "file1",
    "value": "line 1 of file1\nline 2 of file1"
  },
  {
    "dir": "./dir1",
    "file": "file2",
    "value": "line 1 of file2"
  },
  {
    "dir": "./dir2",
    "file": "file3",
    "value": "line 1 of file3 in dir2"
  }
]
```


## json_array

This format is near a spreadsheet
It is a array of array.
The first item is the list of keys (like column title)
All other items are values of theses keys.
This format is usefull from json_object to TSV/CSV.

Sample of JSON data:
```json
[
  [
    "dir",
    "file",
    "value"
  ],
  [
    "dir1",
    "file1",
    "line 1 of file1\nline 2 of file1"
  ],
  [
    "dir1",
    "file2",
    "line 1 of file2"
  ],
  [
    "dir2",
    "file3",
    "line 1 of file3 in dir2"
  ]
]
```


## ndjson

See ndjson.org
Usually a stream of json objects.

The json_object's sample in NDJSON:
```json
{"dir":"./dir1","file":"file1","value":"line 1 of file1\nline 2 of file1"}
{"dir":"./dir1","file":"file2","value":"line 1 of file2"}
{"dir":"./dir2","file":"file3","value":"line 1 of file3 in dir2"}
```

The json_array's sample in NDJSON:
```ndjson
["dir","file","value"]
["dir1","file1","line 1 of file1\nline 2 of file1"]
["dir1","file2","line 1 of file2"]
["dir2","file3","line 1 of file3 in dir2"]
```


## tsv

## csv

## xml

## html

## yaml

## ldiff

## ncdu

## base64

## hex

## gzip



# Prefered format

- fs
- rgrepn
- json_object(as NDJSON)

