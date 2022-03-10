set -e
cd "$(dirname "$0")"
cd deps && {

[ -e "jq-helpers" ] ||
git clone https://github.com/tst2005sh/jq-helpers

[ -e "jq-mods" ] ||
git clone https://github.com/tst2005sh/jq-mods

[ -e "xml2json" ] ||
git clone https://github.com/hay/xml2json

[ -e json2yaml ] ||
git clone https://github.com/redsymbol/json2yaml

[ -e csv2json ] ||
git clone https://github.com/tst2005sh/csv2json csv2json

#[ -e yaml2json ] ||
#git clone https://github.com/tst2005sh/yaml2json

}

# https://pypi.org/project/yq/
# https://github.com/martinblech/xmltodict

