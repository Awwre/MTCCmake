#include "Module3/include/Module3_CallbackApi.h"
#include <stdio.h>

void Module3CallbackApi_DummyCallback() {
#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)
    printf("Hello from Module3CallbackApi_DummyCallback!\n");
#else
    printf("Aloha from Module3CallbackApi_DummyCallback!\n");
#endif
}
