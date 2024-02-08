#include "Module1/include/Module1_CallbackApi.h"
#include <stdio.h>

void Module1CallbackApi_DummyCallback() {
#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)
    printf("Hello from Module1CallbackApi_DummyCallback!\n");
#else
    printf("Aloha from Module1CallbackApi_DummyCallback!\n");
#endif
}
