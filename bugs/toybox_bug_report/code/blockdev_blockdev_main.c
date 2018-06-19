void blockdev_main(void)
{
  int cmds[] = {BLKRRPART, BLKFLSBUF, BLKGETSIZE64,
		BLKGETSIZE, BLKGETSIZE64, BLKBSZSET,
		BLKBSZGET, BLKSSZGET, BLKROGET,
		BLKROSET, BLKROSET};
  char **ss;
  long long val = 0;

  if (!toys.optflags) help_exit("need --option");

  for (ss = toys.optargs;  *ss; ss++) {
    int fd = xopenro(*ss), i;

    // Command line order discarded so perform
    //  multiple operations in flag order
    for (i = 0; i < 32; i++) {
      long flag = toys.optflags & (1<<i);

      if (!flag) continue;

      if (flag & FLAG_setbsz) val = TT.bsz;
      else val = !!(flag & FLAG_setro);

      xioctl(fd, cmds[i], &val);

      flag &= FLAG_setbsz|FLAG_setro|FLAG_flushbufs|
	FLAG_rereadpt|FLAG_setrw;
      if (!flag) printf("%lld\n", (toys.optflags & FLAG_getsz) ?
			val >> 9: val);
    }
    xclose(fd);
  }
}
