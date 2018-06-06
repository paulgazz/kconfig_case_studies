#include "macro_function_prototype.h"

EXP_FUNC void f() {
  int i;
  memcpy(entropy_pool, &i, ENTROPY_POOL_SIZE);
  rand_r((unsigned int *)entropy_pool);
}
