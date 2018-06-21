void switch_root_main(void)
{
  char *newroot = *toys.optargs, **cmdline = toys.optargs+1;
  struct stat st1, st2;
  struct statfs stfs;
  int console = console; // gcc's "may be used" warnings are broken.

  // ...
  
  if (TT.console && -1 == (console = open(TT.console, O_RDWR))) {
    perror_msg("bad console '%s'", TT.console);
    goto panic;
  }

  // ...
  
  if (TT.console) {
    int i;
    for (i=0; i<3; i++) if (console != i) dup2(console, i);
    if (console>2) close(console);
  }
  execv(*cmdline, cmdline);
  perror_msg("Failed to exec '%s'", *cmdline);
panic:
  if (toys.optflags & FLAG_h) for (;;) wait(NULL);
}
