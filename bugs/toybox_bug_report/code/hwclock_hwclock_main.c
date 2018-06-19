if (!w) {
  char *s = s;
  
  xioctl(fd, RTC_RD_TIME, &tm);
  if (TT.utc) s = xtzset("UTC0");
  if ((time = mktime(&tm)) < 0) error_exit("mktime failed");
  if (TT.utc) {
    free(xtzset(s));
    free(s);
  }
}
