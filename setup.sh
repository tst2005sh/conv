set -e
cd "$(dirname "$0")"
cd deps
[ -e "jq-helpers" ] ||
git clone https://github.com/tst2005sh/jq-helpers
[ -e "jq-mods" ] ||
git clone https://github.com/tst2005sh/jq-mods
