#include "Module1/include/Module1_Api.h"
#include "Module1/include/Module1_CallbackApi.h"
#include <stdio.h>

void Module1Api_DummyMethod() {
#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)
    printf("Hello from Module1Api_DummyMethod!\n");
#else
    printf("Aloha from Module1Api_DummyMethod!\n");
#endif

    Module1CallbackApi_DummyCallback();
}
