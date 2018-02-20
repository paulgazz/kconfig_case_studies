# Bugs and Other Defects

In the course of sampling and building random configurations from the
space of valid configurations (as defined by Kconfig), we several
encountered several build errors due to defects in the code or in the
configurations.

## axtls

language bindings (see email to dev).

## busybox

problem with `-Werror` turned on by `CONFIG_WERROR`.  see `cases/busybox.../configs_broken/README.md`
