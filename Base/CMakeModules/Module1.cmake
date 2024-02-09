add_library(${PROJECT_NAME}_Module1 OBJECT)

target_include_directories(${PROJECT_NAME}_Module1 PRIVATE
    ${MTCCMAKE_TESTPROJECT_PATH}
)

target_sources(${PROJECT_NAME}_Module1 PRIVATE
    ${MTCCMAKE_TESTPROJECT_PATH}/Module1/src/Module1_Api.c
)

target_compile_options(${PROJECT_NAME}_Module1 PRIVATE
    -include ${MTCCMAKE_AUTOCONFIG_FILE}
)