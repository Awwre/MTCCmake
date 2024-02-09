#include "Module1/include/Module1_Api.h"
#include "Module2/include/Module2_Api.h"
#include "Module3/include/Module3_Api.h"
#include <stdio.h>

void main() {
#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)
    printf("Hello from main! -> Current config file: %s\n", DUMMYCONFIG_PATH);
#else
    printf("Aloha from main!\n");
#endif

    Module1Api_DummyMethod();
    Module2Api_DummyMethod();
    Module3Api_DummyMethod();
}
