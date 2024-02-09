cmake_minimum_required(VERSION 3.5.0)
project(SubProject3 VERSION 0.1.0 LANGUAGES C)

include(CTest)
enable_testing()

set(MTCCMAKE_AUTOCONFIG_FILE "${CMAKE_CURRENT_SOURCE_DIR}/AutoConfig/DummyConfig.h")

include(../../CMakeModules/Core.cmake)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
