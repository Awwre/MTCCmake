#include "Module2/include/Module2_CallbackApi.h"
#include <stdio.h>

void Module2CallbackApi_DummyCallback() {
#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)
    printf("Hello from Module2CallbackApi_DummyCallback!\n");
#else
    printf("Aloha from Module2CallbackApi_DummyCallback!\n");
#endif
}
