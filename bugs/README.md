# Bugs and Other Defects

In the course of sampling and building random configurations from the
space of valid configurations (as defined by Kconfig), we several
encountered several build errors due to defects in the code or in the
configurations.

## axtls

### language bindings

(see email to dev in this directory)

### macros in function prototype

`crypt/crypto_misc.c` has an uninitialized variable dereference bug in
`RNG_initialize. `cppcheck` apparently doesn't find this when running
on the original, unpreprocessed source code.  this was due to the
macros used in the function prototype.  it could be caused by improper
handling of preprocessor directives.

## busybox

problem with `-Werror` turned on by `CONFIG_WERROR`.  see `cases/busybox.../configs_broken/README.md`

## buildroot

there is a typo `BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS`, that caused kmax
to treat the variable as a value instead (quoting it).  see kmax's
proto-dimacs output called `buildroot_2018_02_sans_reverse.kmax`.
