static void loopback_setup(char *device, char *file)
{
  struct loop_info64 *loop = (void *)(toybuf+32);
  int lfd = -1, ffd = ffd;
  unsigned flags = toys.optflags;

  // Open file (ffd) and loop device (lfd)

  if (file) ffd = xopen(file, TT.openflags);
  // ...
}
