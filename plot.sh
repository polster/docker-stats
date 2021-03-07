#!/usr/bin/env bash

metric="$1"
file="$2"

function usage {
    echo "Usage: $0 [cpu|mem] [file]"
   	exit 1
}

[[ -z "$file" ]] && usage

case "$metric" in
"cpu")
    col=3
    title="CPU in %"
    ;;
"mem")
    col=4
    title="MEM in %"
    ;;
*)
    usage
    ;;
esac

names=$(docker stats --no-stream --format "{{.Name}}" | xargs | sed -e 's/ / /g')

gnuplot -e "file='$file'" -e "names='$names'" -e "col=$col" -e "title='$title'" plot-config.gnu