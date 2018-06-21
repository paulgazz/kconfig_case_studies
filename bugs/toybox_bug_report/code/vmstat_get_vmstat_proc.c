static void get_vmstat_proc(struct vmstat_proc *vmstat_proc)
{
  char *vmstuff[] = { "/proc/stat", "cpu ",
		      0, 0, 0, 0, 0, 0, "intr ",
		      "ctxt ", "procs_running ",
		      "procs_blocked ", "/proc/meminfo",
		      "MemFree: ", "Buffers: ", "Cached: ",
		      "SwapFree: ", "SwapTotal: ", "/proc/vmstat",
		      "pgpgin ", "pgpgout ", "pswpin ",
		      "pswpout " };
  uint64_t *new = (uint64_t *)vmstat_proc;
  char *p = p, *name = name;
  int i, j;

  // ...
}
