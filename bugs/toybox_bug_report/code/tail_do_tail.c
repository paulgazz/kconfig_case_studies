if (bytes<0 || lines<0) {
  struct line_list *list = 0, *new;

  // The slow codepath is always needed, and
  //  can handle all input, so make lseek support
  //  optional.
  if (CFG_TAIL_SEEK && try_lseek(fd, bytes, lines))
    return;

  // Read data until we run out, keep a trailing buffer
  for (;;) {
    // Read next page of data, appending to linked list
    //  in order
    if (!(new = get_chunk(fd, sizeof(toybuf)))) break;
    dlist_add_nomalloc((void *)&list, (void *)new);

    // If tracing bytes, add until we have enough,
    //  discarding overflow.
    if (TT.bytes) {
      bytes += new->len;
      if (bytes > 0) {
	while (list->len <= bytes) {
	  bytes -= list->len;
	  free(dlist_pop(&list));
	}
	list->data += bytes;
	list->len -= bytes;
	bytes = 0;
      }
    } else {
      int len = new->len, count;
      char *try = new->data;

      // First character _after_ a newline starts
      // a new line, which works even if file
      // doesn't end with a newline
      for (count=0; count<len; count++) {
	if (linepop) lines++;
	linepop = try[count] == '\n';
	  
	// ...
