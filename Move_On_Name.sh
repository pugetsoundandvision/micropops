#!/bin/bash
for f in *.mp4; do
	#F is exactly the same as TARGET, so here is defining the target, in this case, the target is any file ending in mp4
  [[ -f "$f" ]] || continue # skip if not regular file
  #These brackets make this a true or false test, in this case: is target "$f" a file (-f)?
  # the double pipe means OR - if it exits as 0 or true, it continues, if it exits as 1 or false, it continutes to the next value in the loop
  dir="${f%.*}"
  mv "$f" "$dir"
done
