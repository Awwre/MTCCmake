include(Module1)
include(Module2)
include(Module3)

add_executable(${PROJECT_NAME}_Core)

target_include_directories(${PROJECT_NAME}_Core PRIVATE
    ${MTCCMAKE_TESTPROJECT_PATH}
)

target_sources(${PROJECT_NAME}_Core PRIVATE
    ${MTCCMAKE_TESTPROJECT_PATH}/Core/src/main.c
    ${MTCCMAKE_TESTPROJECT_PATH}/Core/src/Module1_CallbackApi.c
    ${MTCCMAKE_TESTPROJECT_PATH}/Core/src/Module2_CallbackApi.c
    ${MTCCMAKE_TESTPROJECT_PATH}/Core/src/Module3_CallbackApi.c
)

target_link_libraries(${PROJECT_NAME}_Core PRIVATE
    ${PROJECT_NAME}_Module1
    ${PROJECT_NAME}_Module2
    ${PROJECT_NAME}_Module3
)

target_compile_options(${PROJECT_NAME}_Core PRIVATE
    -include ${MTCCMAKE_AUTOCONFIG_FILE}
)