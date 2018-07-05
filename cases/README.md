## axtls

Tried on two versions 1.2.7 and 2.1.4, and all sampled configurations configure properly.

This creates the dimacs constraint file for feature model.

    check_dep --dimacs -p config/Config.in | tee ~/research/repos/kconfig_case_studies/cases/axtls_2_1_4/axtls_2_1_4.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > ~/research/repos/kconfig_case_studies/cases/axtls_2_1_4/axtls_2_1_4.dimacs

This checks the contraints for all generated sample configurations (contained in `generated_configs`).

    for i in generated_configs/*.config; do echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; done > generated_configs/config_results.out 2>&1
    
This checks constraints for all generated samples and ensures they are the same.

    for i in generated_configs/*.config; do echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; /home/paul/research/repos/kmax/scripts/compare_configs.sh "${i}" config/.config; echo "diff result: ${?}"; done > generated_configs/config_diff_results.out 2>&1

This builds all configurations

    for i in generated_configs/*.config; do echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; echo "building $i"; make; echo "return code $?"; done > generated_configs/build_results.out 2>&1

This builds only linux configurations

    for i in generated_configs/*.config; do grep "CONFIG_PLATFORM_LINUX=y" $i; if [ $? -eq 0 ]; then echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; echo "building $i"; make; echo "return code $?"; fi done > generated_configs/build_results.out 2>&1

Older versions (1.2.7) don't build

Trying 2.1.4.  It required me to install the following extra libraries
to build it with `allyesconfig`:

    libreadline-dev
    
### System-specific changes

Forcing linux on (to avoid having to build on windows and cygwin platforms)

Turning off language extensions (because of a variability bug)

Disabling `CONFIG_HTTP_BUILD_LUA=y` and `CONFIG_HTTP_ENABLE_LUA=y`
because of shared library build problems.

### Kconfig semantics differences

- axtls seems to disable the automatic CONFIG_ prefix and instead it
is in the name of the variables in the Kconfig files.
- Non-booleans seem to be always included in the `.config` file even
  when the dependencies for them are not met.

### Building
    
    apt-get install libselinux1-dev libsepol1-dev

For building, we constrain are samples to PLATFORM_LINUX, since
cross-compiling for other systems is difficult.  We also constrain
language bindings, since there is a bug with that configuration
variable, as well as lua, since we lack system support.

## busybox

    
Trying on 1.28.0

    git clone https://git.busybox.net/busybox
    git checkout 1_28_0

The Config.src files need to be preprocessed.  Use
`scripts/gen_build_files.sh` or run

    make allyesconfig
    
Get the dimacs file with

    check_dep --dimacs Config.in | tee ~/research/repos/kconfig_case_studies/cases/busybox_1_28_0/busybox_1_28_0.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > ~/research/repos/kconfig_case_studies/cases/busybox_1_28_0/busybox_1_28_0.dimacs

### Building

    apt-get install libpam0g-dev

### Additional Constraints

We turned off `CONFIG_WERROR`, because 8 out of a sample of 10 had a
broken build due to this option.  It enables the `-Werror` flag to the
compiler which treats warnings as errors.  These configs are perhaps
untested in this configuration.  See
`cases/busybox_1_28_0/configs_broken/README.md` `bugs/README.md` for
more information.

`CONFIG_FEATURE_2_4_MODULES` is also disabled, because it is only for
for older Linux kernels.  See the following for more info:

    modutils/Config.in
    https://dev.openwrt.org/ticket/8933
    https://dev.openwrt.org/ticket/7460
    https://dev.openwrt.org/ticket/7349


We also disable `CONFIG_STATIC` and `CONFIG_FEATURE_LIBBUSYBOX_STATIC`
due to difficulties with linking.

## toybox

Trying on 0.7.5

Needs a generated config file, `generated/Config.probed`

    scripts/genconfig.sh
    
I don't know how platform-specific the generated configs are.

This collects the contraints

    check_dep --dimacs Config.in | tee ~/research/repos/kconfig_case_studies/cases/toybox_0_7_5/toybox_0_7_5.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > ~/research/repos/kconfig_case_studies/cases/toybox_0_7_5/toybox_0_7_5.dimacs

Comparing 0.0.9.2

    check_dep --dimacs Config.in | tee ~/research/repos/kconfig_case_studies/cases/toybox_0_0_9_2/toybox_0_0_9_2.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > ~/research/repos/kconfig_case_studies/cases/toybox_0_0_9_2/toybox_0_0_9_2.dimacs

### Constrained Features

Removed all pending ones.

`sys/smack.h` depends on some random library that doesn't come with
Debian.  It can be disabled with `TOYBOX_SMACK`.

## fiasco

https://os.inf.tu-dresden.de/download/snapshots/

Need to call `tool/gen_kconfig`

    tool/gen_kconfig src/Kconfig my_kconfig $(find src/ | grep Kconfig | grep -v src/Kconfig)

Collect constraints

    check_dep --dimacs build/Kconfig | tee  ~/research/repos/kconfig_case_studies/cases/fiasco_17_10/fiasco_17_10.kmax | python ~/research/repos/kmax/kconfig/dimacs.py >  ~/research/repos/kconfig_case_studies/cases/fiasco_17_10/fiasco_17_10.dimacs

### Building

For building, we constrain are samples to IA32, since cross-compiling
for other systems is difficult.


## BuildRoot



## Additional Info

## axTLS

### Download

(If using the VM, this step is unnecessary.)

Download version 2.1.4 at
<https://sourceforge.net/projects/axtls/files/2.1.4/axTLS-2.1.4.tar.gz/download>
([direct link](https://downloads.sourceforge.net/project/axtls/2.1.4/axTLS-2.1.4.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Faxtls%2Ffiles%2F2.1.4%2FaxTLS-2.1.4.tar.gz%2Fdownload&ts=1516376523)).

Untar and move into the root of the source tree.

### Configure

To use an already-generated config file with Kconfig, copy the file to
`config/.config` and use `make oldconfig` to process it.

1. Copy one of the sampled config files to `config/`.

        cd /path/to/axtls-code
        cp /path/to/samples/0.config config/.config
    
2. Configure according to the copied `.config`.

        make oldconfig

This will overwrite `config/.config` with the results of processing
the sampled file with Kconfig.  There will be some difference due to
default values being added by Kconfig.

This generates, among other files, the `config/config.h` header file
that provides preprocessor macros for configuration within C files.
It also generates `config/makefile.conf` to set Makefile variables
used to configure the build process.

### Build

The configurations are restricted to the Linux platform.  Building the
samples has been tested on Debian 9.1.  At least the following
dependency needs to be installed.  Other dependencies may be needed to
build the system, depending on the configuration options selected.

    apt-get install make gcc libreadline-dev selinux

To build, simply run make.

    make
    
For source-level tools, compiling may not be necessary, though getting
the list of C files may be easiest by running `make`.  There could be
some generated C files during the build, but I do not know for sure.

## toybox (and busybox)

(If using the VM, this step is unnecessary.)

### Download

Download from <http://www.landley.net/toybox/downloads/toybox-0.7.5.tar.gz>.

Untar tar and move in to the root of the source directory.

### Configure

To use an already-generated config file with Kconfig, copy the file to
`.config` and use `make oldconfig` to process it.

1. Copy one of the sampled config files.

        cd /path/to/toybox-0.7.5
        cp /path/to/samples/0.config .config
    
2. Configure according to the copied `.config`.

        make oldconfig

This will overwrite `.config` with the results of processing
the sampled file with Kconfig.  There will be some difference due to
default values being added by Kconfig.

### Build

Run make

    make
    
This generates, among other files, the `generated/config.h` header
file that provides preprocessor macros for configuration within C
files.  Also created is `generated build.sh`, which contains the list
of C files.
