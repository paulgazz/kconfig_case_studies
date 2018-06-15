static inline char *lsm_context(void)
{
  int ok = 0;
  char *result;

  if (CFG_TOYBOX_SMACK) ok = smack_new_label_from_self(&result) > 0;
  else ok = getcon(&result) == 0;

  return ok ? result : strdup("?");
}