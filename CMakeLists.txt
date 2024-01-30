cmake_minimum_required(VERSION 3.5.0)
project(DummyProject VERSION 0.1.0 LANGUAGES C)

include(CTest)
enable_testing()

add_library(Module1 OBJECT)

target_include_directories(Module1 PRIVATE
    TestProject
)

target_sources(Module1 PRIVATE
    TestProject/Module1/src/Module1_Api.c
)

add_library(Module2 OBJECT)

target_include_directories(Module2 PRIVATE
    TestProject
)

target_sources(Module2 PRIVATE
    TestProject/Module2/src/Module2_Api.c
)

add_library(Module3 OBJECT)

target_include_directories(Module3 PRIVATE
    TestProject
)

target_sources(Module3 PRIVATE
    TestProject/Module3/src/Module3_Api.c
)

add_executable(TestProject)

target_include_directories(TestProject PRIVATE
    TestProject
)

target_sources(TestProject PRIVATE
    TestProject/Core/src/main.c
    TestProject/Core/src/Module1_CallbackApi.c
    TestProject/Core/src/Module2_CallbackApi.c
    TestProject/Core/src/Module3_CallbackApi.c
)

target_link_libraries(TestProject PRIVATE
    Module1
    Module2
    Module3
)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
