void chvt_main(void)
{
  int vtnum, fd = fd;
  char *consoles[]={"/dev/console", "/dev/vc/0",
		    "/dev/tty", NULL}, **cc;

  vtnum=atoi(*toys.optargs);
  for (cc = consoles; *cc; cc++)
    if (-1 != (fd = open(*cc, O_RDWR))) break;

  // These numbers are VT_ACTIVATE and VT_WAITACTIVE from linux/vt.h
  if (!*cc || fd < 0 || ioctl(fd, 0x5606, vtnum) ||
      ioctl(fd, 0x5607, vtnum))
    perror_exit(0);
}
