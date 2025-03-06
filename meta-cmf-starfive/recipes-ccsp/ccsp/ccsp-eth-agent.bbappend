require ccsp_common_rpi.inc
CFLAGS_append = " -Wno-unused-variable"
CFLAGS_aarch64_append = " -Werror=format-truncation=1 "

# In the recipe file (e.g., `my-recipe.bb`)
CFLAGS_append = " -Wno-error=format"

