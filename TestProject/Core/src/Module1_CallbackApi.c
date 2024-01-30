#include "Module1/include/Module1_CallbackApi.h"
#include "AutoConfig/DummyConfig.h"
#include <stdio.h>

void Module1CallbackApi_DummyCallback() {
#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)
    printf("Hello from Module1CallbackApi_DummyCallback!");
#else
    printf("Aloha from Module1CallbackApi_DummyCallback!");
#endif
}
