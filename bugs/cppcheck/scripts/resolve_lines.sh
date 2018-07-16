#!/bin/bash

# This program runs resolve_lines.js on each configuration separately,
# optimizing memory usage, since resolve_lines.js has out of memory
# errors on large systems, e.g., busybox.

resolve_lines_js="$(dirname $0)/resolve_lines.js"

ls -d *.config | sort -h | while read i; do
  echo $i
  (cd $i; node ${resolve_lines_js})
done
