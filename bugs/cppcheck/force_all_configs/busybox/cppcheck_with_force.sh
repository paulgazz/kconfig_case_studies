date
echo processing ./loginutils/passwd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/loginutils/passwd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/passwd.c
echo processing ./loginutils/add-remove-shell.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/loginutils/add-remove-shell.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/add-remove-shell.c
echo processing ./loginutils/sulogin.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/loginutils/sulogin.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/sulogin.c
echo processing ./loginutils/chpasswd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/loginutils/chpasswd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/chpasswd.c
echo processing ./loginutils/login.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/loginutils/login.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/login.c
echo processing ./loginutils/su.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/loginutils/su.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/su.c
echo processing ./loginutils/cryptpw.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/loginutils/cryptpw.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/cryptpw.c
echo processing ./loginutils/vlock.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/loginutils/vlock.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/vlock.c
echo processing ./loginutils/addgroup.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/loginutils/addgroup.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/addgroup.c
echo processing ./loginutils/adduser.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/loginutils/adduser.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/adduser.c
echo processing ./loginutils/deluser.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/loginutils/deluser.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/deluser.c
echo processing ./loginutils/getty.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/loginutils/getty.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./loginutils/getty.c
echo processing ./applets/individual.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./applets/individual.c
echo processing ./applets/applet_tables.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/applets/applet_tables.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./applets/applet_tables.c
echo processing ./applets/usage.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/applets/usage.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I include ./applets/usage.c
echo processing ./applets/applets.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/applets/applets.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./applets/applets.c
echo processing ./applets/usage_pod.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/applets/usage_pod.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I include ./applets/usage_pod.c
echo processing ./scripts/kconfig/images.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/images.c
echo processing ./scripts/kconfig/lxdialog/msgbox.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/lxdialog/msgbox.c
echo processing ./scripts/kconfig/lxdialog/menubox.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/lxdialog/menubox.c
echo processing ./scripts/kconfig/lxdialog/inputbox.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/lxdialog/inputbox.c
echo processing ./scripts/kconfig/lxdialog/yesno.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/lxdialog/yesno.c
echo processing ./scripts/kconfig/lxdialog/util.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/lxdialog/util.c
echo processing ./scripts/kconfig/lxdialog/lxdialog.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/lxdialog/lxdialog.c
echo processing ./scripts/kconfig/lxdialog/textbox.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/lxdialog/textbox.c
echo processing ./scripts/kconfig/lxdialog/checklist.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/lxdialog/checklist.c
echo processing ./scripts/kconfig/symbol.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/symbol.c
echo processing ./scripts/kconfig/confdata.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/confdata.c
echo processing ./scripts/kconfig/lex.zconf.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/lex.zconf.c
echo processing ./scripts/kconfig/kconfig_load.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/kconfig_load.c
echo processing ./scripts/kconfig/menu.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/menu.c
echo processing ./scripts/kconfig/mconf.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/scripts/kconfig/mconf.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/mconf.c
echo processing ./scripts/kconfig/zconf.hash.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/zconf.hash.c
echo processing ./scripts/kconfig/conf.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/scripts/kconfig/conf.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/conf.c
echo processing ./scripts/kconfig/zconf.tab.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/scripts/kconfig/zconf.tab.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I scripts/kconfig ./scripts/kconfig/zconf.tab.c
echo processing ./scripts/kconfig/gconf.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/gconf.c
echo processing ./scripts/kconfig/expr.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/expr.c
echo processing ./scripts/kconfig/util.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/util.c
echo processing ./scripts/kconfig/kxgettext.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/scripts/kconfig/kxgettext.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/kconfig/kxgettext.c
echo processing ./scripts/echo.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/echo.c
echo processing ./scripts/test_setenv_leak.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/test_setenv_leak.c
echo processing ./scripts/basic/docproc.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/scripts/basic/docproc.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/basic/docproc.c
echo processing ./scripts/basic/split-include.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/scripts/basic/split-include.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/basic/split-include.c
echo processing ./scripts/basic/fixdep.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/scripts/basic/fixdep.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./scripts/basic/fixdep.c
echo processing ./libpwdgrp/uidgid_get.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libpwdgrp/uidgid_get.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libpwdgrp/uidgid_get.c
echo processing ./libpwdgrp/pwd_grp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libpwdgrp/pwd_grp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libpwdgrp/pwd_grp.c
echo processing ./modutils/rmmod.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/modutils/rmmod.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./modutils/rmmod.c
echo processing ./modutils/modinfo.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/modutils/modinfo.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./modutils/modinfo.c
echo processing ./modutils/modprobe-small.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/53.config/modutils/modprobe-small.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./modutils/modprobe-small.c
echo processing ./modutils/modutils-24.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./modutils/modutils-24.c
echo processing ./modutils/insmod.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/modutils/insmod.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./modutils/insmod.c
echo processing ./modutils/modutils.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/modutils/modutils.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./modutils/modutils.c
echo processing ./modutils/lsmod.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/modutils/lsmod.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./modutils/lsmod.c
echo processing ./modutils/modprobe.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/modutils/modprobe.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./modutils/modprobe.c
echo processing ./modutils/depmod.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/modutils/depmod.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./modutils/depmod.c
echo processing ./e2fsprogs/tune2fs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/e2fsprogs/tune2fs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./e2fsprogs/tune2fs.c
echo processing ./e2fsprogs/chattr.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/e2fsprogs/chattr.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./e2fsprogs/chattr.c
echo processing ./e2fsprogs/fsck.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/e2fsprogs/fsck.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./e2fsprogs/fsck.c
echo processing ./e2fsprogs/lsattr.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/e2fsprogs/lsattr.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./e2fsprogs/lsattr.c
echo processing ./e2fsprogs/e2fs_lib.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/e2fsprogs/e2fs_lib.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./e2fsprogs/e2fs_lib.c
echo processing ./klibc-utils/minips.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./klibc-utils/minips.c
echo processing ./klibc-utils/run-init.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./klibc-utils/run-init.c
echo processing ./klibc-utils/resume.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/klibc-utils/resume.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./klibc-utils/resume.c
echo processing ./klibc-utils/nuke.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/523.config/klibc-utils/nuke.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./klibc-utils/nuke.c
echo processing ./archival/ar.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/ar.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/ar.c
echo processing ./archival/libarchive/unsafe_symlink_target.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/unsafe_symlink_target.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/unsafe_symlink_target.c
echo processing ./archival/libarchive/find_list_entry.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/find_list_entry.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/find_list_entry.c
echo processing ./archival/libarchive/lzo1x_9x.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/lzo1x_9x.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/lzo1x_9x.c
echo processing ./archival/libarchive/decompress_uncompress.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/libarchive/decompress_uncompress.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/decompress_uncompress.c
echo processing ./archival/libarchive/header_verbose_list.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/header_verbose_list.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/header_verbose_list.c
echo processing ./archival/libarchive/decompress_unxz.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/decompress_unxz.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/decompress_unxz.c
echo processing ./archival/libarchive/get_header_tar_gz.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/libarchive/get_header_tar_gz.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/get_header_tar_gz.c
echo processing ./archival/libarchive/data_extract_to_command.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/data_extract_to_command.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/data_extract_to_command.c
echo processing ./archival/libarchive/filter_accept_reject_list.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/filter_accept_reject_list.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/filter_accept_reject_list.c
echo processing ./archival/libarchive/filter_accept_list_reassign.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/libarchive/filter_accept_list_reassign.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/filter_accept_list_reassign.c
echo processing ./archival/libarchive/filter_accept_all.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/filter_accept_all.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/filter_accept_all.c
echo processing ./archival/libarchive/unxz/xz_dec_lzma2.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./archival/libarchive/unxz/xz_dec_lzma2.c
echo processing ./archival/libarchive/unxz/xz_dec_bcj.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./archival/libarchive/unxz/xz_dec_bcj.c
echo processing ./archival/libarchive/unxz/xz_dec_stream.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./archival/libarchive/unxz/xz_dec_stream.c
echo processing ./archival/libarchive/header_list.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/header_list.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/header_list.c
echo processing ./archival/libarchive/open_transformer.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/open_transformer.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/open_transformer.c
echo processing ./archival/libarchive/seek_by_jump.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/seek_by_jump.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/seek_by_jump.c
echo processing ./archival/libarchive/header_skip.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/header_skip.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/header_skip.c
echo processing ./archival/libarchive/unsafe_prefix.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/unsafe_prefix.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/unsafe_prefix.c
echo processing ./archival/libarchive/get_header_tar_xz.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/libarchive/get_header_tar_xz.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/get_header_tar_xz.c
echo processing ./archival/libarchive/bz/compress.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./archival/libarchive/bz/compress.c
echo processing ./archival/libarchive/bz/bzlib.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./archival/libarchive/bz/bzlib.c
echo processing ./archival/libarchive/bz/blocksort.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./archival/libarchive/bz/blocksort.c
echo processing ./archival/libarchive/bz/huffman.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./archival/libarchive/bz/huffman.c
echo processing ./archival/libarchive/data_align.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/data_align.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/data_align.c
echo processing ./archival/libarchive/get_header_tar_lzma.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/libarchive/get_header_tar_lzma.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/get_header_tar_lzma.c
echo processing ./archival/libarchive/filter_accept_list.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/filter_accept_list.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/filter_accept_list.c
echo processing ./archival/libarchive/common.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/common.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/common.c
echo processing ./archival/libarchive/get_header_tar.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/get_header_tar.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/get_header_tar.c
echo processing ./archival/libarchive/decompress_gunzip.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/decompress_gunzip.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/decompress_gunzip.c
echo processing ./archival/libarchive/get_header_ar.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/libarchive/get_header_ar.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/get_header_ar.c
echo processing ./archival/libarchive/get_header_cpio.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/get_header_cpio.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/get_header_cpio.c
echo processing ./archival/libarchive/init_handle.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/init_handle.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/init_handle.c
echo processing ./archival/libarchive/data_extract_to_stdout.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/data_extract_to_stdout.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/data_extract_to_stdout.c
echo processing ./archival/libarchive/unpack_ar_archive.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/libarchive/unpack_ar_archive.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/unpack_ar_archive.c
echo processing ./archival/libarchive/data_extract_all.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/data_extract_all.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/data_extract_all.c
echo processing ./archival/libarchive/decompress_unlzma.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/decompress_unlzma.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/decompress_unlzma.c
echo processing ./archival/libarchive/lzo1x_1.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/lzo1x_1.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/lzo1x_1.c
echo processing ./archival/libarchive/data_skip.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/data_skip.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/data_skip.c
echo processing ./archival/libarchive/lzo1x_d.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/lzo1x_d.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/lzo1x_d.c
echo processing ./archival/libarchive/lzo1x_1o.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/lzo1x_1o.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/lzo1x_1o.c
echo processing ./archival/libarchive/decompress_bunzip2.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/decompress_bunzip2.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/decompress_bunzip2.c
echo processing ./archival/libarchive/lzo1x_c.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./archival/libarchive/lzo1x_c.c
echo processing ./archival/libarchive/get_header_tar_bz2.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/libarchive/get_header_tar_bz2.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/get_header_tar_bz2.c
echo processing ./archival/libarchive/seek_by_read.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/libarchive/seek_by_read.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/libarchive/seek_by_read.c
echo processing ./archival/lzop.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/lzop.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/lzop.c
echo processing ./archival/bzip2.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/bzip2.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/bzip2.c
echo processing ./archival/rpm.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/rpm.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/rpm.c
echo processing ./archival/bbunzip.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/bbunzip.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/bbunzip.c
echo processing ./archival/tar.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/tar.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/tar.c
echo processing ./archival/cpio.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/cpio.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/cpio.c
echo processing ./archival/dpkg.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/53.config/archival/dpkg.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/dpkg.c
echo processing ./archival/gzip.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/gzip.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/gzip.c
echo processing ./archival/unzip.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/archival/unzip.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/unzip.c
echo processing ./archival/dpkg_deb.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/archival/dpkg_deb.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./archival/dpkg_deb.c
echo processing ./libbb/make_directory.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/make_directory.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/make_directory.c
echo processing ./libbb/kernel_version.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/kernel_version.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/kernel_version.c
echo processing ./libbb/bb_askpass.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/bb_askpass.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/bb_askpass.c
echo processing ./libbb/ptr_to_globals.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/ptr_to_globals.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/ptr_to_globals.c
echo processing ./libbb/print_flags.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/print_flags.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/print_flags.c
echo processing ./libbb/warn_ignoring_args.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/warn_ignoring_args.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/warn_ignoring_args.c
echo processing ./libbb/bbunit.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/bbunit.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/bbunit.c
echo processing ./libbb/unicode.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/unicode.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/unicode.c
echo processing ./libbb/isdirectory.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/isdirectory.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/isdirectory.c
echo processing ./libbb/appletlib.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/appletlib.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/appletlib.c
echo processing ./libbb/progress.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/progress.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/progress.c
echo processing ./libbb/human_readable.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/human_readable.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/human_readable.c
echo processing ./libbb/perror_msg.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/perror_msg.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/perror_msg.c
echo processing ./libbb/die_if_bad_username.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/libbb/die_if_bad_username.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/die_if_bad_username.c
echo processing ./libbb/copyfd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/copyfd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/copyfd.c
echo processing ./libbb/run_shell.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/run_shell.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/run_shell.c
echo processing ./libbb/obscure.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/libbb/obscure.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/obscure.c
echo processing ./libbb/llist.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/llist.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/llist.c
echo processing ./libbb/common_bufsiz.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/common_bufsiz.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/common_bufsiz.c
echo processing ./libbb/get_cpu_count.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/get_cpu_count.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/get_cpu_count.c
echo processing ./libbb/xregcomp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xregcomp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xregcomp.c
echo processing ./libbb/read_printf.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/read_printf.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/read_printf.c
echo processing ./libbb/sysconf.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/sysconf.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/sysconf.c
echo processing ./libbb/getopt32.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/getopt32.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/getopt32.c
echo processing ./libbb/auto_string.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/auto_string.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/auto_string.c
echo processing ./libbb/isqrt.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/isqrt.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/isqrt.c
echo processing ./libbb/selinux_common.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/selinux_common.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/selinux_common.c
echo processing ./libbb/printable.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/printable.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/printable.c
echo processing ./libbb/pw_encrypt_sha.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./libbb/pw_encrypt_sha.c
echo processing ./libbb/find_pid_by_name.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/find_pid_by_name.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/find_pid_by_name.c
echo processing ./libbb/in_ether.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/in_ether.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/in_ether.c
echo processing ./libbb/read_key.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/read_key.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/read_key.c
echo processing ./libbb/pw_encrypt_md5.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./libbb/pw_encrypt_md5.c
echo processing ./libbb/herror_msg.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/herror_msg.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/herror_msg.c
echo processing ./libbb/xatonum_template.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./libbb/xatonum_template.c
echo processing ./libbb/safe_write.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/safe_write.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/safe_write.c
echo processing ./libbb/write.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/write.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/write.c
echo processing ./libbb/inode_hash.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/inode_hash.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/inode_hash.c
echo processing ./libbb/chomp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/chomp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/chomp.c
echo processing ./libbb/hash_md5prime.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./libbb/hash_md5prime.c
echo processing ./libbb/ubi.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/ubi.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/ubi.c
echo processing ./libbb/procps.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/procps.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/procps.c
echo processing ./libbb/bb_strtonum.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/bb_strtonum.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/bb_strtonum.c
echo processing ./libbb/xfuncs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xfuncs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xfuncs.c
echo processing ./libbb/bb_getgroups.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/bb_getgroups.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/bb_getgroups.c
echo processing ./libbb/match_fstype.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/match_fstype.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/match_fstype.c
echo processing ./libbb/parse_config.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/parse_config.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/parse_config.c
echo processing ./libbb/print_numbered_lines.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/print_numbered_lines.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/print_numbered_lines.c
echo processing ./libbb/trim.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/trim.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/trim.c
echo processing ./libbb/speed_table.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/speed_table.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/speed_table.c
echo processing ./libbb/parse_mode.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/parse_mode.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/parse_mode.c
echo processing ./libbb/str_tolower.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/str_tolower.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/str_tolower.c
echo processing ./libbb/device_open.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/device_open.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/device_open.c
echo processing ./libbb/xreadlink.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xreadlink.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xreadlink.c
echo processing ./libbb/remove_file.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/remove_file.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/remove_file.c
echo processing ./libbb/lineedit.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/lineedit.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/lineedit.c
echo processing ./libbb/simplify_path.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/simplify_path.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/simplify_path.c
echo processing ./libbb/hash_md5_sha.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/hash_md5_sha.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/hash_md5_sha.c
echo processing ./libbb/lineedit_ptr_hack.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/lineedit_ptr_hack.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/lineedit_ptr_hack.c
echo processing ./libbb/replace.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/replace.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/replace.c
echo processing ./libbb/wfopen_input.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/wfopen_input.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/wfopen_input.c
echo processing ./libbb/correct_password.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/correct_password.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/correct_password.c
echo processing ./libbb/pw_encrypt.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/pw_encrypt.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/pw_encrypt.c
echo processing ./libbb/find_root_device.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/find_root_device.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/find_root_device.c
echo processing ./libbb/bb_strtod.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./libbb/bb_strtod.c
echo processing ./libbb/change_identity.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/change_identity.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/change_identity.c
echo processing ./libbb/login.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/login.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/login.c
echo processing ./libbb/uuencode.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/uuencode.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/uuencode.c
echo processing ./libbb/endofname.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/endofname.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/endofname.c
echo processing ./libbb/safe_gethostname.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/safe_gethostname.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/safe_gethostname.c
echo processing ./libbb/bb_bswap_64.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/bb_bswap_64.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/bb_bswap_64.c
echo processing ./libbb/time.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/time.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/time.c
echo processing ./libbb/strrstr.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/strrstr.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/strrstr.c
echo processing ./libbb/getopt_allopts.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/getopt_allopts.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/getopt_allopts.c
echo processing ./libbb/udp_io.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/udp_io.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/udp_io.c
echo processing ./libbb/makedev.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/makedev.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/makedev.c
echo processing ./libbb/get_last_path_component.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/get_last_path_component.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/get_last_path_component.c
echo processing ./libbb/platform.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/platform.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/platform.c
echo processing ./libbb/last_char_is.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/last_char_is.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/last_char_is.c
echo processing ./libbb/vfork_daemon_rexec.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/vfork_daemon_rexec.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/vfork_daemon_rexec.c
echo processing ./libbb/setup_environment.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/setup_environment.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/setup_environment.c
echo processing ./libbb/verror_msg.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/verror_msg.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/verror_msg.c
echo processing ./libbb/bb_pwd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/bb_pwd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/bb_pwd.c
echo processing ./libbb/xrealloc_vector.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xrealloc_vector.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xrealloc_vector.c
echo processing ./libbb/xgethostbyname.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xgethostbyname.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xgethostbyname.c
echo processing ./libbb/fclose_nonstdin.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/fclose_nonstdin.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/fclose_nonstdin.c
echo processing ./libbb/utmp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/utmp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/utmp.c
echo processing ./libbb/mtab.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/523.config/libbb/mtab.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/mtab.c
echo processing ./libbb/safe_strncpy.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/safe_strncpy.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/safe_strncpy.c
echo processing ./libbb/getpty.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/getpty.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/getpty.c
echo processing ./libbb/xgetcwd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xgetcwd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xgetcwd.c
echo processing ./libbb/messages.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/messages.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/messages.c
echo processing ./libbb/pw_encrypt_des.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./libbb/pw_encrypt_des.c
echo processing ./libbb/wfopen.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/wfopen.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/wfopen.c
echo processing ./libbb/xatonum.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xatonum.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xatonum.c
echo processing ./libbb/ask_confirmation.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/ask_confirmation.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/ask_confirmation.c
echo processing ./libbb/perror_nomsg.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/perror_nomsg.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/perror_nomsg.c
echo processing ./libbb/copy_file.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/copy_file.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/copy_file.c
echo processing ./libbb/executable.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/executable.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/executable.c
echo processing ./libbb/percent_decode.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/percent_decode.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/percent_decode.c
echo processing ./libbb/recursive_action.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/recursive_action.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/recursive_action.c
echo processing ./libbb/find_mount_point.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/find_mount_point.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/find_mount_point.c
echo processing ./libbb/capability.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/capability.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/capability.c
echo processing ./libbb/concat_path_file.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/concat_path_file.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/concat_path_file.c
echo processing ./libbb/bb_qsort.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/bb_qsort.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/bb_qsort.c
echo processing ./libbb/perror_nomsg_and_die.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/perror_nomsg_and_die.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/perror_nomsg_and_die.c
echo processing ./libbb/compare_string_array.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/compare_string_array.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/compare_string_array.c
echo processing ./libbb/safe_poll.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/safe_poll.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/safe_poll.c
echo processing ./libbb/rtc.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/rtc.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/rtc.c
echo processing ./libbb/get_volsize.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/get_volsize.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/get_volsize.c
echo processing ./libbb/pidfile.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/pidfile.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/pidfile.c
echo processing ./libbb/get_shell_name.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/get_shell_name.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/get_shell_name.c
echo processing ./libbb/loop.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/loop.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/loop.c
echo processing ./libbb/nuke_str.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/nuke_str.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/nuke_str.c
echo processing ./libbb/inet_common.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/inet_common.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/inet_common.c
echo processing ./libbb/read.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/read.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/read.c
echo processing ./libbb/printable_string.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/printable_string.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/printable_string.c
echo processing ./libbb/mode_string.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/mode_string.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/mode_string.c
echo processing ./libbb/process_escape_sequence.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/process_escape_sequence.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/process_escape_sequence.c
echo processing ./libbb/get_line_from_file.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/get_line_from_file.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/get_line_from_file.c
echo processing ./libbb/crc32.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/crc32.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/crc32.c
echo processing ./libbb/u_signal_names.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/u_signal_names.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/u_signal_names.c
echo processing ./libbb/missing_syscalls.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/missing_syscalls.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/missing_syscalls.c
echo processing ./libbb/single_argv.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/single_argv.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/single_argv.c
echo processing ./libbb/securetty.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/securetty.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/securetty.c
echo processing ./libbb/update_passwd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/update_passwd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/update_passwd.c
echo processing ./libbb/get_console.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/get_console.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/get_console.c
echo processing ./libbb/logenv.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/logenv.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/logenv.c
echo processing ./libbb/full_write.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/full_write.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/full_write.c
echo processing ./libbb/fgets_str.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/fgets_str.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/fgets_str.c
echo processing ./libbb/xconnect.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xconnect.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xconnect.c
echo processing ./libbb/fflush_stdout_and_exit.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/fflush_stdout_and_exit.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/fflush_stdout_and_exit.c
echo processing ./libbb/xfunc_die.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xfunc_die.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xfunc_die.c
echo processing ./libbb/signals.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/signals.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/signals.c
echo processing ./libbb/default_error_retval.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/default_error_retval.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/default_error_retval.c
echo processing ./libbb/inet_cksum.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/inet_cksum.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/inet_cksum.c
echo processing ./libbb/dump.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/dump.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/dump.c
echo processing ./libbb/bb_cat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/bb_cat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/bb_cat.c
echo processing ./libbb/xfuncs_printf.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/xfuncs_printf.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/xfuncs_printf.c
echo processing ./libbb/concat_subpath_file.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/concat_subpath_file.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/concat_subpath_file.c
echo processing ./libbb/skip_whitespace.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/skip_whitespace.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/skip_whitespace.c
echo processing ./libbb/bb_do_delay.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/libbb/bb_do_delay.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./libbb/bb_do_delay.c
echo processing ./sysklogd/syslogd.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./sysklogd/syslogd.c
echo processing ./sysklogd/syslogd_and_logger.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/sysklogd/syslogd_and_logger.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./sysklogd/syslogd_and_logger.c
echo processing ./sysklogd/logger.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./sysklogd/logger.c
echo processing ./sysklogd/logread.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/sysklogd/logread.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./sysklogd/logread.c
echo processing ./sysklogd/klogd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/sysklogd/klogd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./sysklogd/klogd.c
echo processing ./editors/ed.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/523.config/editors/ed.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./editors/ed.c
echo processing ./editors/patch_toybox.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./editors/patch_toybox.c
echo processing ./editors/sed.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/editors/sed.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./editors/sed.c
echo processing ./editors/cmp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/editors/cmp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./editors/cmp.c
echo processing ./editors/diff.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/editors/diff.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./editors/diff.c
echo processing ./editors/vi.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/editors/vi.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./editors/vi.c
echo processing ./editors/patch.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/editors/patch.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./editors/patch.c
echo processing ./editors/patch_bbox.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./editors/patch_bbox.c
echo processing ./editors/awk.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/editors/awk.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./editors/awk.c
echo processing ./shell/shell_common.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/shell/shell_common.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./shell/shell_common.c
echo processing ./shell/match.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/shell/match.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./shell/match.c
echo processing ./shell/random.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/shell/random.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./shell/random.c
echo processing ./shell/ash.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/shell/ash.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./shell/ash.c
echo processing ./shell/ash_ptr_hack.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/shell/ash_ptr_hack.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./shell/ash_ptr_hack.c
echo processing ./shell/ash_test/recho.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./shell/ash_test/recho.c
echo processing ./shell/ash_test/printenv.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./shell/ash_test/printenv.c
echo processing ./shell/ash_test/zecho.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./shell/ash_test/zecho.c
echo processing ./shell/math.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/shell/math.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./shell/math.c
echo processing ./shell/cttyhack.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/shell/cttyhack.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./shell/cttyhack.c
echo processing ./shell/hush.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/shell/hush.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./shell/hush.c
echo processing ./findutils/grep.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/findutils/grep.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./findutils/grep.c
echo processing ./findutils/xargs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/findutils/xargs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./findutils/xargs.c
echo processing ./findutils/find.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/findutils/find.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./findutils/find.c
echo processing ./util-linux/setsid.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/setsid.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/setsid.c
echo processing ./util-linux/fstrim.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/util-linux/fstrim.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/fstrim.c
echo processing ./util-linux/unshare.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/unshare.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/unshare.c
echo processing ./util-linux/chrt.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/chrt.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/chrt.c
echo processing ./util-linux/ipcs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/ipcs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/ipcs.c
echo processing ./util-linux/acpid.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/acpid.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/acpid.c
echo processing ./util-linux/fbset.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/fbset.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/fbset.c
echo processing ./util-linux/blockdev.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/blockdev.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/blockdev.c
echo processing ./util-linux/hwclock.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/hwclock.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/hwclock.c
echo processing ./util-linux/blkdiscard.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/blkdiscard.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/blkdiscard.c
echo processing ./util-linux/losetup.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/losetup.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/losetup.c
echo processing ./util-linux/nsenter.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/nsenter.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/nsenter.c
echo processing ./util-linux/renice.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/renice.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/renice.c
echo processing ./util-linux/fdisk_sgi.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/fdisk_sgi.c
echo processing ./util-linux/lspci.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/lspci.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/lspci.c
echo processing ./util-linux/scriptreplay.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/scriptreplay.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/scriptreplay.c
echo processing ./util-linux/mkswap.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/mkswap.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/mkswap.c
echo processing ./util-linux/last_fancy.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/129.config/util-linux/last_fancy.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/last_fancy.c
echo processing ./util-linux/eject.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/eject.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/eject.c
echo processing ./util-linux/dmesg.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/dmesg.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/dmesg.c
echo processing ./util-linux/getopt.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/getopt.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/getopt.c
echo processing ./util-linux/blkid.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/blkid.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/blkid.c
echo processing ./util-linux/hexdump_xxd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/hexdump_xxd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/hexdump_xxd.c
echo processing ./util-linux/taskset.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/taskset.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/taskset.c
echo processing ./util-linux/setarch.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/setarch.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/setarch.c
echo processing ./util-linux/switch_root.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/switch_root.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/switch_root.c
echo processing ./util-linux/rev.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/rev.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/rev.c
echo processing ./util-linux/freeramdisk.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/freeramdisk.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/freeramdisk.c
echo processing ./util-linux/mountpoint.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/mountpoint.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/mountpoint.c
echo processing ./util-linux/mount.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/mount.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/mount.c
echo processing ./util-linux/mesg.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/mesg.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/mesg.c
echo processing ./util-linux/readprofile.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/readprofile.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/readprofile.c
echo processing ./util-linux/fatattr.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/129.config/util-linux/fatattr.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/fatattr.c
echo processing ./util-linux/fdisk_gpt.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/fdisk_gpt.c
echo processing ./util-linux/mkfs_vfat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/mkfs_vfat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/mkfs_vfat.c
echo processing ./util-linux/fdisk_aix.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/fdisk_aix.c
echo processing ./util-linux/flock.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/flock.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/flock.c
echo processing ./util-linux/swaponoff.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/swaponoff.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/swaponoff.c
echo processing ./util-linux/fsfreeze.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/fsfreeze.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/fsfreeze.c
echo processing ./util-linux/uevent.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/uevent.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/uevent.c
echo processing ./util-linux/script.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/script.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/script.c
echo processing ./util-linux/more.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/more.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/more.c
echo processing ./util-linux/mdev.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/mdev.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/mdev.c
echo processing ./util-linux/mkfs_reiser.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/mkfs_reiser.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/mkfs_reiser.c
echo processing ./util-linux/last.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/last.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/last.c
echo processing ./util-linux/fsck_minix.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/fsck_minix.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/fsck_minix.c
echo processing ./util-linux/fdisk_osf.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/fdisk_osf.c
echo processing ./util-linux/fdisk.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/fdisk.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/fdisk.c
echo processing ./util-linux/fdformat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/fdformat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/fdformat.c
echo processing ./util-linux/cal.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/cal.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/cal.c
echo processing ./util-linux/setpriv.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/setpriv.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/setpriv.c
echo processing ./util-linux/ipcrm.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/ipcrm.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/ipcrm.c
echo processing ./util-linux/rdate.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/rdate.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/rdate.c
echo processing ./util-linux/rtcwake.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/rtcwake.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/rtcwake.c
echo processing ./util-linux/fdisk_sun.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/fdisk_sun.c
echo processing ./util-linux/fallocate.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/util-linux/fallocate.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/fallocate.c
echo processing ./util-linux/mkfs_ext2.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/mkfs_ext2.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/mkfs_ext2.c
echo processing ./util-linux/pivot_root.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/pivot_root.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/pivot_root.c
echo processing ./util-linux/rdev.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/rdev.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/rdev.c
echo processing ./util-linux/ionice.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/util-linux/ionice.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/ionice.c
echo processing ./util-linux/umount.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/umount.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/umount.c
echo processing ./util-linux/wall.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/wall.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/wall.c
echo processing ./util-linux/volume_id/udf.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/udf.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/udf.c
echo processing ./util-linux/volume_id/iso9660.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/iso9660.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/iso9660.c
echo processing ./util-linux/volume_id/unused_msdos.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_msdos.c
echo processing ./util-linux/volume_id/linux_raid.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/linux_raid.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/linux_raid.c
echo processing ./util-linux/volume_id/btrfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/btrfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/btrfs.c
echo processing ./util-linux/volume_id/unused_lsi_raid.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_lsi_raid.c
echo processing ./util-linux/volume_id/cramfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/volume_id/cramfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/cramfs.c
echo processing ./util-linux/volume_id/minix.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/minix.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/minix.c
echo processing ./util-linux/volume_id/unused_mac.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_mac.c
echo processing ./util-linux/volume_id/unused_promise_raid.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_promise_raid.c
echo processing ./util-linux/volume_id/exfat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/exfat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/exfat.c
echo processing ./util-linux/volume_id/volume_id.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/volume_id/volume_id.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/volume_id.c
echo processing ./util-linux/volume_id/ocfs2.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/volume_id/ocfs2.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/ocfs2.c
echo processing ./util-linux/volume_id/squashfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/squashfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/squashfs.c
echo processing ./util-linux/volume_id/unused_isw_raid.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_isw_raid.c
echo processing ./util-linux/volume_id/sysv.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/129.config/util-linux/volume_id/sysv.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/sysv.c
echo processing ./util-linux/volume_id/fat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/util-linux/volume_id/fat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/fat.c
echo processing ./util-linux/volume_id/hfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/volume_id/hfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/hfs.c
echo processing ./util-linux/volume_id/nilfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/volume_id/nilfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/nilfs.c
echo processing ./util-linux/volume_id/linux_swap.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/volume_id/linux_swap.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/linux_swap.c
echo processing ./util-linux/volume_id/ntfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/793.config/util-linux/volume_id/ntfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/ntfs.c
echo processing ./util-linux/volume_id/ext.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/ext.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/ext.c
echo processing ./util-linux/volume_id/unused_highpoint.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_highpoint.c
echo processing ./util-linux/volume_id/unused_ufs.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_ufs.c
echo processing ./util-linux/volume_id/unused_via_raid.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_via_raid.c
echo processing ./util-linux/volume_id/xfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/util-linux/volume_id/xfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/xfs.c
echo processing ./util-linux/volume_id/unused_hpfs.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_hpfs.c
echo processing ./util-linux/volume_id/unused_lvm.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_lvm.c
echo processing ./util-linux/volume_id/luks.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/volume_id/luks.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/luks.c
echo processing ./util-linux/volume_id/f2fs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/volume_id/f2fs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/f2fs.c
echo processing ./util-linux/volume_id/get_devname.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/volume_id/get_devname.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/get_devname.c
echo processing ./util-linux/volume_id/util.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/volume_id/util.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/util.c
echo processing ./util-linux/volume_id/ubifs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/ubifs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/ubifs.c
echo processing ./util-linux/volume_id/jfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/volume_id/jfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/jfs.c
echo processing ./util-linux/volume_id/unused_silicon_raid.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_silicon_raid.c
echo processing ./util-linux/volume_id/reiserfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/reiserfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/reiserfs.c
echo processing ./util-linux/volume_id/romfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/romfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/romfs.c
echo processing ./util-linux/volume_id/unused_nvidia_raid.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./util-linux/volume_id/unused_nvidia_raid.c
echo processing ./util-linux/volume_id/bcache.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/util-linux/volume_id/bcache.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/volume_id/bcache.c
echo processing ./util-linux/hexdump.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/hexdump.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/hexdump.c
echo processing ./util-linux/findfs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/findfs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/findfs.c
echo processing ./util-linux/lsusb.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/lsusb.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/lsusb.c
echo processing ./util-linux/mkfs_minix.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/util-linux/mkfs_minix.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./util-linux/mkfs_minix.c
echo processing ./miscutils/crontab.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/crontab.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/crontab.c
echo processing ./miscutils/rx.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/rx.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/rx.c
echo processing ./miscutils/ubi_tools.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/ubi_tools.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/ubi_tools.c
echo processing ./miscutils/setfattr.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/setfattr.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/setfattr.c
echo processing ./miscutils/ttysize.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/ttysize.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/ttysize.c
echo processing ./miscutils/adjtimex.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/adjtimex.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/adjtimex.c
echo processing ./miscutils/makedevs.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/makedevs.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/makedevs.c
echo processing ./miscutils/nandwrite.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/nandwrite.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/nandwrite.c
echo processing ./miscutils/strings.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/miscutils/strings.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/strings.c
echo processing ./miscutils/ubirename.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/ubirename.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/ubirename.c
echo processing ./miscutils/watchdog.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/miscutils/watchdog.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/watchdog.c
echo processing ./miscutils/beep.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/beep.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/beep.c
echo processing ./miscutils/fbsplash.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/fbsplash.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/fbsplash.c
echo processing ./miscutils/devmem.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/devmem.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/devmem.c
echo processing ./miscutils/mt.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/miscutils/mt.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/mt.c
echo processing ./miscutils/microcom.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/microcom.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/microcom.c
echo processing ./miscutils/hexedit.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/hexedit.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/hexedit.c
echo processing ./miscutils/runlevel.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/runlevel.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/runlevel.c
echo processing ./miscutils/dc.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/dc.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/dc.c
echo processing ./miscutils/flash_lock_unlock.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/flash_lock_unlock.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/flash_lock_unlock.c
echo processing ./miscutils/crond.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/crond.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/crond.c
echo processing ./miscutils/time.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/523.config/miscutils/time.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/time.c
echo processing ./miscutils/readahead.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/miscutils/readahead.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/readahead.c
echo processing ./miscutils/partprobe.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/partprobe.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/partprobe.c
echo processing ./miscutils/man.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/man.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/man.c
echo processing ./miscutils/rfkill.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/miscutils/rfkill.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/rfkill.c
echo processing ./miscutils/flash_eraseall.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/flash_eraseall.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/flash_eraseall.c
echo processing ./miscutils/raidautorun.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/raidautorun.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/raidautorun.c
echo processing ./miscutils/i2c_tools.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/i2c_tools.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/i2c_tools.c
echo processing ./miscutils/conspy.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/conspy.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/conspy.c
echo processing ./miscutils/volname.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/miscutils/volname.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/volname.c
echo processing ./miscutils/less.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/less.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/less.c
echo processing ./miscutils/chat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/chat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/chat.c
echo processing ./miscutils/hdparm.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/hdparm.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/hdparm.c
echo processing ./miscutils/inotifyd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/523.config/miscutils/inotifyd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/inotifyd.c
echo processing ./miscutils/lsscsi.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/miscutils/lsscsi.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/lsscsi.c
echo processing ./miscutils/devfsd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/devfsd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/devfsd.c
echo processing ./miscutils/flashcp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/flashcp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/flashcp.c
echo processing ./miscutils/setserial.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/setserial.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/setserial.c
echo processing ./miscutils/bbconfig.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/miscutils/bbconfig.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./miscutils/bbconfig.c
echo processing ./coreutils/rm.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/rm.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/rm.c
echo processing ./coreutils/mktemp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/coreutils/mktemp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/mktemp.c
echo processing ./coreutils/chroot.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/chroot.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/chroot.c
echo processing ./coreutils/test.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/test.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/test.c
echo processing ./coreutils/sort.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/sort.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/sort.c
echo processing ./coreutils/df.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/df.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/df.c
echo processing ./coreutils/link.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/coreutils/link.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/link.c
echo processing ./coreutils/stty.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/coreutils/stty.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/stty.c
echo processing ./coreutils/mv.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/mv.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/mv.c
echo processing ./coreutils/md5_sha1_sum.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/md5_sha1_sum.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/md5_sha1_sum.c
echo processing ./coreutils/od_bloaty.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./coreutils/od_bloaty.c
echo processing ./coreutils/fold.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/fold.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/fold.c
echo processing ./coreutils/yes.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/coreutils/yes.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/yes.c
echo processing ./coreutils/rmdir.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/rmdir.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/rmdir.c
echo processing ./coreutils/sync.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/sync.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/sync.c
echo processing ./coreutils/mkfifo.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/mkfifo.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/mkfifo.c
echo processing ./coreutils/od.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/od.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/od.c
echo processing ./coreutils/tac.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/tac.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/tac.c
echo processing ./coreutils/sleep.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/sleep.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/sleep.c
echo processing ./coreutils/logname.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/coreutils/logname.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/logname.c
echo processing ./coreutils/cut.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/coreutils/cut.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/cut.c
echo processing ./coreutils/cp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/coreutils/cp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/cp.c
echo processing ./coreutils/dirname.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/dirname.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/dirname.c
echo processing ./coreutils/nl.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/nl.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/nl.c
echo processing ./coreutils/unlink.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/unlink.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/unlink.c
echo processing ./coreutils/chgrp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/chgrp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/chgrp.c
echo processing ./coreutils/true.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/true.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/true.c
echo processing ./coreutils/printf.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/printf.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/printf.c
echo processing ./coreutils/install.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/install.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/install.c
echo processing ./coreutils/who.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/who.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/who.c
echo processing ./coreutils/tty.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/tty.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/tty.c
echo processing ./coreutils/whoami.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/129.config/coreutils/whoami.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/whoami.c
echo processing ./coreutils/printenv.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/printenv.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/printenv.c
echo processing ./coreutils/touch.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/touch.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/touch.c
echo processing ./coreutils/truncate.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/truncate.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/truncate.c
echo processing ./coreutils/head.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/head.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/head.c
echo processing ./coreutils/echo.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/echo.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/echo.c
echo processing ./coreutils/timeout.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/timeout.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/timeout.c
echo processing ./coreutils/uuencode.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/uuencode.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/uuencode.c
echo processing ./coreutils/cksum.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/793.config/coreutils/cksum.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/cksum.c
echo processing ./coreutils/shred.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/shred.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/shred.c
echo processing ./coreutils/id.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/id.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/id.c
echo processing ./coreutils/tr.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/tr.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/tr.c
echo processing ./coreutils/du.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/du.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/du.c
echo processing ./coreutils/sum.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/coreutils/sum.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/sum.c
echo processing ./coreutils/tee.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/tee.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/tee.c
echo processing ./coreutils/uname.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/uname.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/uname.c
echo processing ./coreutils/test_ptr_hack.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/test_ptr_hack.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/test_ptr_hack.c
echo processing ./coreutils/stat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/stat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/stat.c
echo processing ./coreutils/nice.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/nice.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/nice.c
echo processing ./coreutils/paste.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/paste.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/paste.c
echo processing ./coreutils/mknod.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/mknod.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/mknod.c
echo processing ./coreutils/uniq.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/uniq.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/uniq.c
echo processing ./coreutils/basename.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/basename.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/basename.c
echo processing ./coreutils/uudecode.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/uudecode.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/uudecode.c
echo processing ./coreutils/readlink.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/readlink.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/readlink.c
echo processing ./coreutils/mkdir.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/mkdir.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/mkdir.c
echo processing ./coreutils/env.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/env.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/env.c
echo processing ./coreutils/usleep.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/usleep.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/usleep.c
echo processing ./coreutils/nohup.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/nohup.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/nohup.c
echo processing ./coreutils/seq.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/coreutils/seq.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/seq.c
echo processing ./coreutils/factor.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/factor.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/factor.c
echo processing ./coreutils/split.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/split.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/split.c
echo processing ./coreutils/comm.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/coreutils/comm.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/comm.c
echo processing ./coreutils/realpath.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/realpath.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/realpath.c
echo processing ./coreutils/expr.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/expr.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/expr.c
echo processing ./coreutils/libcoreutils/getopt_mk_fifo_nod.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/libcoreutils/getopt_mk_fifo_nod.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/libcoreutils/getopt_mk_fifo_nod.c
echo processing ./coreutils/libcoreutils/cp_mv_stat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/libcoreutils/cp_mv_stat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/libcoreutils/cp_mv_stat.c
echo processing ./coreutils/nproc.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/coreutils/nproc.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/nproc.c
echo processing ./coreutils/shuf.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/129.config/coreutils/shuf.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/shuf.c
echo processing ./coreutils/dos2unix.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/dos2unix.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/dos2unix.c
echo processing ./coreutils/pwd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/523.config/coreutils/pwd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/pwd.c
echo processing ./coreutils/cat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/cat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/cat.c
echo processing ./coreutils/hostid.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/hostid.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/hostid.c
echo processing ./coreutils/tail.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/tail.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/tail.c
echo processing ./coreutils/false.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/coreutils/false.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/false.c
echo processing ./coreutils/expand.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/coreutils/expand.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/expand.c
echo processing ./coreutils/ls.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/ls.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/ls.c
echo processing ./coreutils/date.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/date.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/date.c
echo processing ./coreutils/chown.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/chown.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/chown.c
echo processing ./coreutils/fsync.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/129.config/coreutils/fsync.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/fsync.c
echo processing ./coreutils/chmod.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/chmod.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/chmod.c
echo processing ./coreutils/dd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/dd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/dd.c
echo processing ./coreutils/wc.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/wc.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/wc.c
echo processing ./coreutils/ln.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/coreutils/ln.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./coreutils/ln.c
echo processing ./console-tools/chvt.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/console-tools/chvt.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/chvt.c
echo processing ./console-tools/openvt.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/openvt.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/openvt.c
echo processing ./console-tools/clear.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/console-tools/clear.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/clear.c
echo processing ./console-tools/showkey.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/showkey.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/showkey.c
echo processing ./console-tools/setconsole.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/setconsole.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/setconsole.c
echo processing ./console-tools/loadkmap.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/loadkmap.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/loadkmap.c
echo processing ./console-tools/resize.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/resize.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/resize.c
echo processing ./console-tools/setlogcons.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/setlogcons.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/setlogcons.c
echo processing ./console-tools/reset.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/console-tools/reset.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/reset.c
echo processing ./console-tools/dumpkmap.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/dumpkmap.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/dumpkmap.c
echo processing ./console-tools/setkeycodes.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/setkeycodes.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/setkeycodes.c
echo processing ./console-tools/fgconsole.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/console-tools/fgconsole.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/fgconsole.c
echo processing ./console-tools/kbd_mode.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/kbd_mode.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/kbd_mode.c
echo processing ./console-tools/deallocvt.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/console-tools/deallocvt.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/deallocvt.c
echo processing ./console-tools/loadfont.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/console-tools/loadfont.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./console-tools/loadfont.c
echo processing ./init/init.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/init/init.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./init/init.c
echo processing ./init/halt.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/init/halt.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./init/halt.c
echo processing ./init/bootchartd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/init/bootchartd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./init/bootchartd.c
echo processing ./runit/runsvdir.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/runit/runsvdir.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./runit/runsvdir.c
echo processing ./runit/svlogd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/runit/svlogd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./runit/svlogd.c
echo processing ./runit/runsv.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/runit/runsv.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./runit/runsv.c
echo processing ./runit/chpst.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/runit/chpst.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./runit/chpst.c
echo processing ./runit/sv.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/runit/sv.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./runit/sv.c
echo processing ./mailutils/sendmail.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/mailutils/sendmail.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./mailutils/sendmail.c
echo processing ./mailutils/popmaildir.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/mailutils/popmaildir.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./mailutils/popmaildir.c
echo processing ./mailutils/reformime.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/mailutils/reformime.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./mailutils/reformime.c
echo processing ./mailutils/mail.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/mailutils/mail.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./mailutils/mail.c
echo processing ./mailutils/makemime.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/405.config/mailutils/makemime.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./mailutils/makemime.c
echo processing ./debianutils/start_stop_daemon.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/debianutils/start_stop_daemon.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./debianutils/start_stop_daemon.c
echo processing ./debianutils/pipe_progress.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/debianutils/pipe_progress.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./debianutils/pipe_progress.c
echo processing ./debianutils/run_parts.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/debianutils/run_parts.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./debianutils/run_parts.c
echo processing ./debianutils/which.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/debianutils/which.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./debianutils/which.c
echo processing ./printutils/lpr.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/printutils/lpr.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./printutils/lpr.c
echo processing ./printutils/lpd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/printutils/lpd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./printutils/lpd.c
echo processing ./networking/httpd_ssi.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./networking/httpd_ssi.c
echo processing ./networking/ip.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/ip.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ip.c
echo processing ./networking/udhcp/arpping.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/arpping.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/arpping.c
echo processing ./networking/udhcp/dhcpd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/dhcpd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/dhcpd.c
echo processing ./networking/udhcp/d6_socket.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/d6_socket.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/d6_socket.c
echo processing ./networking/udhcp/dumpleases.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/dumpleases.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/dumpleases.c
echo processing ./networking/udhcp/d6_dhcpc.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/d6_dhcpc.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/d6_dhcpc.c
echo processing ./networking/udhcp/dhcprelay.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/523.config/networking/udhcp/dhcprelay.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/dhcprelay.c
echo processing ./networking/udhcp/d6_packet.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/d6_packet.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/d6_packet.c
echo processing ./networking/udhcp/common.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/common.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/common.c
echo processing ./networking/udhcp/socket.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/socket.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/socket.c
echo processing ./networking/udhcp/signalpipe.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/signalpipe.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/signalpipe.c
echo processing ./networking/udhcp/dhcpc.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/dhcpc.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/dhcpc.c
echo processing ./networking/udhcp/domain_codec.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/domain_codec.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/domain_codec.c
echo processing ./networking/udhcp/packet.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/udhcp/packet.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/udhcp/packet.c
echo processing ./networking/pscan.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/pscan.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/pscan.c
echo processing ./networking/isrv_identd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/isrv_identd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/isrv_identd.c
echo processing ./networking/ssl_helper/ssl_helper.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./networking/ssl_helper/ssl_helper.c
echo processing ./networking/interface.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/interface.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/interface.c
echo processing ./networking/netstat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/netstat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/netstat.c
echo processing ./networking/ssl_client.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/networking/ssl_client.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ssl_client.c
echo processing ./networking/slattach.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/slattach.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/slattach.c
echo processing ./networking/traceroute.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/traceroute.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/traceroute.c
echo processing ./networking/hostname.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/hostname.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/hostname.c
echo processing ./networking/ssl_helper-wolfssl/ssl_helper.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./networking/ssl_helper-wolfssl/ssl_helper.c
echo processing ./networking/ether-wake.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/ether-wake.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ether-wake.c
echo processing ./networking/tc.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./networking/tc.c
echo processing ./networking/tls_pstm.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/tls_pstm.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tls_pstm.c
echo processing ./networking/ftpd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/ftpd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ftpd.c
echo processing ./networking/tftp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/tftp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tftp.c
echo processing ./networking/inetd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/inetd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/inetd.c
echo processing ./networking/telnetd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/telnetd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/telnetd.c
echo processing ./networking/dnsd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/dnsd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/dnsd.c
echo processing ./networking/tcpudp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/tcpudp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tcpudp.c
echo processing ./networking/telnet.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/telnet.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/telnet.c
echo processing ./networking/ipcalc.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/ipcalc.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ipcalc.c
echo processing ./networking/tls.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/tls.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tls.c
echo processing ./networking/wget.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/wget.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/wget.c
echo processing ./networking/zcip.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/zcip.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/zcip.c
echo processing ./networking/nslookup.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/nslookup.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/nslookup.c
echo processing ./networking/ifconfig.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/ifconfig.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ifconfig.c
echo processing ./networking/tls_pstm_mul_comba.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/tls_pstm_mul_comba.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tls_pstm_mul_comba.c
echo processing ./networking/whois.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/whois.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/whois.c
echo processing ./networking/nameif.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/nameif.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/nameif.c
echo processing ./networking/arping.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/networking/arping.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/arping.c
echo processing ./networking/ping.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/ping.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ping.c
echo processing ./networking/ifenslave.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/ifenslave.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ifenslave.c
echo processing ./networking/tls_pstm_sqr_comba.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/tls_pstm_sqr_comba.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tls_pstm_sqr_comba.c
echo processing ./networking/route.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/route.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/route.c
echo processing ./networking/httpd_indexcgi.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./networking/httpd_indexcgi.c
echo processing ./networking/vconfig.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/vconfig.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/vconfig.c
echo processing ./networking/tls_aes.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/tls_aes.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tls_aes.c
echo processing ./networking/libiproute/rtm_map.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/rtm_map.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/rtm_map.c
echo processing ./networking/libiproute/ll_addr.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/ll_addr.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/ll_addr.c
echo processing ./networking/libiproute/rt_names.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/rt_names.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/rt_names.c
echo processing ./networking/libiproute/ipneigh.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/libiproute/ipneigh.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/ipneigh.c
echo processing ./networking/libiproute/iproute.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/iproute.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/iproute.c
echo processing ./networking/libiproute/ll_proto.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/ll_proto.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/ll_proto.c
echo processing ./networking/libiproute/ll_map.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/ll_map.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/ll_map.c
echo processing ./networking/libiproute/iplink.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/libiproute/iplink.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/iplink.c
echo processing ./networking/libiproute/ll_types.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/ll_types.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/ll_types.c
echo processing ./networking/libiproute/libnetlink.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/libnetlink.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/libnetlink.c
echo processing ./networking/libiproute/utils.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/utils.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/utils.c
echo processing ./networking/libiproute/iprule.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/iprule.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/iprule.c
echo processing ./networking/libiproute/ipaddress.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/ipaddress.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/ipaddress.c
echo processing ./networking/libiproute/iptunnel.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/libiproute/iptunnel.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/iptunnel.c
echo processing ./networking/libiproute/ip_parse_common_args.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/libiproute/ip_parse_common_args.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/libiproute/ip_parse_common_args.c
echo processing ./networking/tls_pstm_montgomery_reduce.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/tls_pstm_montgomery_reduce.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tls_pstm_montgomery_reduce.c
echo processing ./networking/tcpudp_perhost.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/tcpudp_perhost.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tcpudp_perhost.c
echo processing ./networking/tls_rsa.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/tls_rsa.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tls_rsa.c
echo processing ./networking/isrv.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/isrv.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/isrv.c
echo processing ./networking/httpd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/httpd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/httpd.c
echo processing ./networking/ntpd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/ntpd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ntpd.c
echo processing ./networking/arp.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/networking/arp.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/arp.c
echo processing ./networking/ifupdown.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/ifupdown.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ifupdown.c
echo processing ./networking/brctl.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/brctl.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/brctl.c
echo processing ./networking/nbd-client.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/networking/nbd-client.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/nbd-client.c
echo processing ./networking/ftpgetput.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/ftpgetput.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ftpgetput.c
echo processing ./networking/nc_bloaty.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force ./networking/nc_bloaty.c
echo processing ./networking/ifplugd.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/networking/ifplugd.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/ifplugd.c
echo processing ./networking/nc.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/networking/nc.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/nc.c
echo processing ./networking/tunctl.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/networking/tunctl.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./networking/tunctl.c
echo processing ./selinux/setfiles.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/selinux/setfiles.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/setfiles.c
echo processing ./selinux/getenforce.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/selinux/getenforce.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/getenforce.c
echo processing ./selinux/chcon.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/selinux/chcon.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/chcon.c
echo processing ./selinux/setsebool.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/selinux/setsebool.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/setsebool.c
echo processing ./selinux/selinuxenabled.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/selinux/selinuxenabled.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/selinuxenabled.c
echo processing ./selinux/matchpathcon.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/selinux/matchpathcon.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/matchpathcon.c
echo processing ./selinux/getsebool.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/selinux/getsebool.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/getsebool.c
echo processing ./selinux/runcon.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/535.config/selinux/runcon.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/runcon.c
echo processing ./selinux/setenforce.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/selinux/setenforce.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/setenforce.c
echo processing ./selinux/load_policy.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/selinux/load_policy.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/load_policy.c
echo processing ./selinux/sestatus.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/selinux/sestatus.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./selinux/sestatus.c
echo processing ./procps/pidof.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/pidof.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/pidof.c
echo processing ./procps/ps.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/ps.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/ps.c
echo processing ./procps/mpstat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/procps/mpstat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/mpstat.c
echo processing ./procps/pmap.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/procps/pmap.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/pmap.c
echo processing ./procps/sysctl.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/sysctl.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/sysctl.c
echo processing ./procps/nmeter.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/nmeter.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/nmeter.c
echo processing ./procps/powertop.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/powertop.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/powertop.c
echo processing ./procps/kill.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/kill.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/kill.c
echo processing ./procps/lsof.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/lsof.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/lsof.c
echo processing ./procps/pgrep.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/pgrep.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/pgrep.c
echo processing ./procps/watch.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/watch.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/watch.c
echo processing ./procps/smemcap.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/smemcap.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/smemcap.c
echo processing ./procps/top.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/top.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/top.c
echo processing ./procps/pstree.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/pstree.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/pstree.c
echo processing ./procps/uptime.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/procps/uptime.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/uptime.c
echo processing ./procps/fuser.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/fuser.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/fuser.c
echo processing ./procps/pwdx.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/368.config/procps/pwdx.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/pwdx.c
echo processing ./procps/free.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/9.config/procps/free.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/free.c
echo processing ./procps/iostat.c
echo cli_file /mnt/scratch/paul/varbugs/output/busybox_1_28_0/944.config/procps/iostat.c.cli
cd /mnt/scratch/paul/varbugs/src/busybox-1.28.0/
cppcheck --force -I include -I libbb ./procps/iostat.c
date
