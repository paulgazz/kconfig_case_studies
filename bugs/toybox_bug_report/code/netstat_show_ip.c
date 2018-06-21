static void show_ip(char *fname)
{
  char *ss_state = "UNKNOWN", buf[12], *s,
    *label = strrchr(fname, '/')+1;
  char *state_label[] = {"", "ESTABLISHED", "SYN_SENT",
			 "SYN_RECV", "FIN_WAIT1", "FIN_WAIT2",
			 "TIME_WAIT", "CLOSE", "CLOSE_WAIT",
                         "LAST_ACK", "LISTEN", "CLOSING",
			 "UNKNOWN"};
  struct passwd *pw;
  FILE *fp = fopen(fname, "r");

  if (!fp) {
     perror_msg("'%s'", fname);
     return;
  }

  //skip header.
  if(!fgets(toybuf, sizeof(toybuf), fp)) return;

  // ...
}
