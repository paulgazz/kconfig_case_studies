static void puts_time(char *fmt, struct tm *tm)
{
  char *s, *snap;
  long width = width;

  for (s = fmt;;s++) {

    // Find next %N or end
    if (*(snap = s) == '%') {
      width = isdigit(*++s) ? *(s++)-'0' : 9;
      if (*s && *s != 'N') continue;
    } else if (*s) continue;

    // Don't modify input string if
    //  no %N (default format is constant string).
    if (*s) *snap = 0;
    if (!strftime(toybuf, sizeof(toybuf)-10, fmt, tm))
      perror_exit("bad format '%s'", fmt);
    if (*s) {
      snap = toybuf+strlen(toybuf);
      sprintf(snap, "%09u", TT.nano);
      snap[width] = 0;
    }
    fputs(toybuf, stdout);
    if (!*s || !*(fmt = s+1)) break;
  }
  xputc('\n');
}
