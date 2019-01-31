

## True Positives

### Shifting a negative value is undefined behaviour

_(This appears in all configurations, so is not a variability bug.)_

    "[libbb/read_key.c:262]: (error) Shifting a negative value is undefined behaviour", 1000
    
This may not be a variability-aware bug, since it appeared in all of
the sampled configurations.  Since the samples are from a constrained
version of the feature model, however, it is possible that these
constraints lead to the bug and configurations without them will not
expose the bug.


    col |= (((-1 << 15) | row) << 16);

Looking at the source code file, this is not in a
configuration-specific section of the code.  It's Kbuild file
`libbb/Kbuild` also shows `read_key.c` is always compiled.

This is a true positive, but not a variability bug.

Associated features: None


### Memory leak: line

    "[scripts/basic/split-include.c:227]: (error) Memory leak: line", 1000

Line is not freed.  However, this is the `main` method for some helper
program.

Associated features: None

### Array 'freelist[17]' accessed at index 17, which is out of bounds.

_(This may not actually be triggered.)_

    "[util-linux/fdisk_sgi.c:138]: (error) Array 'freelist[17]' accessed at index 17, which is out of bounds.", 486
    "[util-linux/fdisk_sgi.c:139]: (error) Array 'freelist[17]' accessed at index 17, which is out of bounds.", 486

These are the offending lines:

    static void
    setfreelist(int i, unsigned int f, unsigned int l)
    {
	    freelist[i].first = f;
	    freelist[i].last = l;
    }

This alarm is likely triggered by the following method:

    static void
    add2freelist(unsigned int f, unsigned int l)
    {
        int i;
        for (i = 0; i < 17; i++)
            if (freelist[i].last == 0)
                break;
        setfreelist(i, f, l);
    }

There could be a bug here if the loop does not `break`, which would
cause a call to `setfreelist` with `i=17`.  Proving this safe requires
finding an invariant on `freelist`'s contents, i.e., that at least one
of the element's `last` field is `0` at index `16` or less.

`add2freelist` only has two call sites, though it is tricky to see
whether the code ever allow last to not equal zero in `17` items.
`grep` shows plenty of places that look for and operate on the last
block.

			add2freelist(start, sgi_get_start_sector(Index[i]));

This is a variability defect, because `fdisk_sgi.c` is included by `fdisk.c`

    // util-linux/fdisk.c
    #include "fdisk_sgi.c"

and `fdisk.c` is configurable.

    // util-linux/Kbuild
    lib-$(CONFIG_FDISK) += fdisk.o

Associated features: CONFIG_FDISK, CONFIG_FEATURE_FDISK_WRITABLE, CONFIG_FEATURE_SGI_LABEL

## False Positives

### Shifting 32-bit value by 32 bits is undefined behaviour

    "[libbb/hash_md5_sha.c:665]: (error) Shifting 32-bit value by 32 bits is undefined behaviour", 318
    
Looking at the line of code,

    uint32_t K_t = NEED_SHA512 ? (sha_K[t] >> 32) : sha_K[t];
    
this would be a true defect if sha_K[t] is a 32-bit value.

The definition involves the following lines

    #if NEED_SHA512
    typedef uint64_t sha_K_int;
    # define K(v) v
    #else
    typedef uint32_t sha_K_int;
    # define K(v) (uint32_t)(v >> 32)
    #endif
    static const sha_K_int sha_K[] = {

Depending on the configuration, `sha_K_int` is either 32- or 64-bit.
The bug is only true for the former.

Looking at the preprocessed version for one of the offending configurations, 2.config, 

    // preprocessed version 2.config/libbb/hash_md5_sha.i:11037
    uint32_t K_t = (0 || 0) ? (sha_K[t] >> 32) : sha_K[t];

we see that it is not possible for the shift to occur due since the
inline conditional's condition is always false.

This is because `NEED_SHA512` is defined with two configurations, SHA512SUM and USE_BB_CRYPT_SHA, that are disabled by 2.config

    #define NEED_SHA512 (ENABLE_SHA512SUM || ENABLE_USE_BB_CRYPT_SHA)
    

<!-- // both SHA512SUM and USE_BB_CRYPT_SHA are undefined in one of the buggy configs, 2.config -->
<!-- #define NEED_SHA512 (ENABLE_SHA512SUM || ENABLE_USE_BB_CRYPT_SHA) -->

<!-- // decs/defs -->
<!-- #if NEED_SHA512 -->
<!-- typedef uint64_t sha_K_int; -->
<!-- # define K(v) v -->
<!-- #else -->
<!-- typedef uint32_t sha_K_int; -->
<!-- # define K(v) (uint32_t)(v >> 32) -->
<!-- #endif -->
<!-- static const sha_K_int sha_K[] = { -->

<!-- // unpreprocessed version -->
<!-- uint32_t K_t = NEED_SHA512 ? (sha_K[t] >> 32) : sha_K[t]; -->

<!-- // preprocessed version 2.config/libbb/hash_md5_sha.i:11037 -->
<!-- uint32_t K_t = (0 || 0) ? (sha_K[t] >> 32) : sha_K[t]; -->


### Allocation with xmalloc, memcpy doesn't release it

_(This appears in all configurations, so is not a variability bug.)_

    "[libbb/xfuncs_printf.c:115]: (error) Allocation with xmalloc, memcpy doesn't release it.", 1000

The definition of `xmemdup` shows it calling `xmalloc` and immediately
passing the pointer to `memcpy.

    void* FAST_FUNC xmemdup(const void *s, int n)
    {
	    return memcpy(xmalloc(n), s, n);
    }


`xmalloc` is defined in the same file.  It is a wrapper for `malloc`
that halting if there is an error.

This is not a bug at this location, because `memcpy` returns a pointer
to the first argument, which is the destination address for the copy,
as described by its manpage:

    SYNOPSIS
           #include <string.h>

           void *memcpy(void *dest, const void *src, size_t n);

    DESCRIPTION
           The  memcpy()  function  copies  n bytes from memory area src to memory
           area dest.  The memory areas must not overlap.  Use memmove(3)  if  the
           memory areas do overlap.

    RETURN VALUE
           The memcpy() function returns a pointer to dest.

Moreover, this is not configurable code: it is always in the C file
and always compiled by Kbuild.
