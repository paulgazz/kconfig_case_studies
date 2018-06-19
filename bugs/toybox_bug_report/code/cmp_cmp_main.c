void cmp_main(void)
{
  toys.exitval = 2;
  loopfiles_rw(toys.optargs,
	       O_CLOEXEC|(WARN_ONLY*!(toys.optflags&FLAG_s)),
	       0, do_cmp);
}
