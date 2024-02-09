add_library(${PROJECT_NAME}_Module2 OBJECT)

target_include_directories(${PROJECT_NAME}_Module2 PRIVATE
    ${MTCCMAKE_TESTPROJECT_PATH}
)

target_sources(${PROJECT_NAME}_Module2 PRIVATE
    ${MTCCMAKE_TESTPROJECT_PATH}/Module2/src/Module2_Api.c
)

target_compile_options(${PROJECT_NAME}_Module2 PRIVATE
    -include ${MTCCMAKE_AUTOCONFIG_FILE}
)