Helped pick an arbitrary list of BusyBox bugs to investigate using the following commands

From the `../../scripts/` directory:

Filter out dead stores (since they are quality issues rather than bugs):

    python filter.py -i ../clang-4.0/busybox/busybox_clang.json -o ../clang-4.0/busybox/busybox_clang_filtered.json  clang

Then pick an arbitrary set of 50 bugs

    seed=$(date +%s); echo $seed; python randomly_pick.py -s $seed ../clang-4.0/busybox/busybox_clang.json 50
    mv picked.json ../clang-4.0/busybox/

Using the seed 1539013282.
