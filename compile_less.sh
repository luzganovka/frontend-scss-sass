#!/bin/bash

for less_file in less/*.less; do
  if [ -f "$less_file" ]; then
    filename=$(basename -- "$less_file")
    css_file="css/${filename%.*}.css"
    
    echo "    Compiling... $less_file --> $css_file"
    lessc "$less_file" "$css_file"
    
    if [ $? -ne 0 ]; then
      echo "ERROR while compilation $less_file"
    fi
  fi
done