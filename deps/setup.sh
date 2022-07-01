set -e
cd "$(dirname "$0")/../deps/"

[ -e "jq-helpers" ] ||
git clone https://github.com/tst2005sh/jq-helpers

[ -e "jq-mods" ] ||
git clone https://github.com/tst2005sh/jq-mods


#[ -e "xml2json" ] ||
#git clone https://github.com/hay/xml2json

#[ -e json2yaml ] ||
#git clone https://github.com/redsymbol/json2yaml

for d in \
	conv-py.csv_to_json \
	conv-py.yaml_to_json \
	conv-py.json_to_yaml \
	conv-py.xml_to_json \
	conv-py.json_to_xml \
	conv-py3.xml_to_json.via_xmltodict \
; do
	[ -e "$d" ] ||
	git clone "https://github.com/tst2005sh/$d"
done

# https://pypi.org/project/yq/
# https://github.com/martinblech/xmltodict
