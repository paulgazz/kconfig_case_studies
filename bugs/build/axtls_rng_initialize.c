/**
 * Initialise the Random Number Generator engine.
 * - On Win32 use the platform SDK's crypto engine.
 * - On Linux use /dev/urandom
 * - If none of these work then use a custom RNG.
 */
EXP_FUNC void STDCALL RNG_initialize()
{
#if !defined(WIN32) && defined(CONFIG_USE_DEV_URANDOM)
  rng_fd = open("/dev/urandom", O_RDONLY);
#elif defined(WIN32) && defined(CONFIG_WIN32_USE_CRYPTO_LIB)
  if (!CryptAcquireContext(&gCryptProv,
                           NULL, NULL, PROV_RSA_FULL, 0))
    {
      if (GetLastError() == NTE_BAD_KEYSET &&
          !CryptAcquireContext(&gCryptProv,
                               NULL,
                               NULL,
                               PROV_RSA_FULL,
                               CRYPT_NEWKEYSET))
        {
          printf("CryptoLib: %x\n", unsupported_str, GetLastError());
          exit(1);
        }
    }
  #else
  /* start of with a stack to copy across */
  int i;
  memcpy(entropy_pool, &i, ENTROPY_POOL_SIZE);
  rand_r((unsigned int *)entropy_pool);
  #endif
}

int main() {
#if !defined(WIN32) && defined(CONFIG_USE_DEV_URANDOM)
    rng_fd = open("/dev/urandom", O_RDONLY);
#elif defined(WIN32) && defined(CONFIG_WIN32_USE_CRYPTO_LIB)
    if (!CryptAcquireContext(&gCryptProv, 
                      NULL, NULL, PROV_RSA_FULL, 0))
    {
        if (GetLastError() == NTE_BAD_KEYSET &&
                !CryptAcquireContext(&gCryptProv, 
                       NULL, 
                       NULL, 
                       PROV_RSA_FULL, 
                       CRYPT_NEWKEYSET))
        {
            printf("CryptoLib: %x\n", unsupported_str, GetLastError());
            exit(1);
        }
    }
#else
    /* start of with a stack to copy across */
    int i;
    memcpy(entropy_pool, &i, ENTROPY_POOL_SIZE);
    rand_r((unsigned int *)entropy_pool); 
#endif
}
