#include "Module2/include/Module2_Api.h"
#include "AutoConfig/DummyConfig.h"
#include "Module2/include/Module2_CallbackApi.h"
#include <stdio.h>

void Module2Api_DummyMethod() {
#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)
    printf("Hello from Module2Api_DummyMethod!");
#else
    printf("Aloha from Module2Api_DummyMethod!");
#endif

    Module2CallbackApi_DummyCallback();
}
