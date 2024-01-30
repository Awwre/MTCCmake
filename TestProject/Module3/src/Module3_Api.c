#include "Module3/include/Module3_Api.h"
#include "AutoConfig/DummyConfig.h"
#include "Module3/include/Module3_CallbackApi.h"
#include <stdio.h>

void Module3Api_DummyMethod() {
#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)
    printf("Hello from Module3Api_DummyMethod!");
#else
    printf("Aloha from Module3Api_DummyMethod!");
#endif

    Module3CallbackApi_DummyCallback();
}
