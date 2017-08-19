#!/bin/bash

shopt -s nullglob

dir="$1"
if [[ -z $dir ]]; then
	dir="."
fi
dir="$(realpath "$dir")"

basename="$(basename "$dir")"
dirname="$(dirname "$dir")"

rm -f "$dir/index.md"
printf "# $basename\n\n" >> "$dir/index.md"
for i in "$dir"/*; do
	if [[ ! -d "$i" ]]; then
		continue
	fi
	link_name="$(basename "$i")"
	link_url="$(echo $link_name | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')"
	printf -- "- [$link_name]($link_url)\n\n" >> "$dir/index.md"
	# mv "$dir/$link_name" "$dir/$link_url"
done
pandoc "$dir/index.md" -o "$dir/index.html"
dir_url="$dirname/$(echo $basename | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')"
mv "$dir" "$dir_url"
