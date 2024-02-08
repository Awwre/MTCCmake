cmake_minimum_required(VERSION 3.5.0)
project(DummyProject VERSION 0.1.0 LANGUAGES C)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules")

set(MTCCMAKE_TESTPROJECT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/TestProject")

add_subdirectory(Targets/SubTarget1)
add_subdirectory(Targets/SubTarget2)
add_subdirectory(Targets/SubTarget3)
