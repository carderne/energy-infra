#!/bin/bash
# Extract roads/grid from o5m
# Arg 1: o5m dir
# Arg 2: gpkg out dir

for f in $1/*; do
	name=$(echo $f | sed -r "s/.+\/(.+)\..+/\1/");
    out=$2/$name.gpkg
    if [ ! -f $out ]; then
        echo "Doing $name"
        #osmfilter $f --keep="highway=motorway =trunk =primary =secondary =tertiary power=line" | ogr2ogr -select highway,power,voltage -f GPKG $out /vsistdin/ lines
        osmfilter $f --keep="power=line" | ogr2ogr -select highway,power,voltage -f GPKG $out /vsistdin/ lines
    fi
done
