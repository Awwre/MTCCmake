add_library(${PROJECT_NAME}_Module3 OBJECT)

target_include_directories(${PROJECT_NAME}_Module3 PRIVATE
    ${MTCCMAKE_TESTPROJECT_PATH}
)

target_sources(${PROJECT_NAME}_Module3 PRIVATE
    ${MTCCMAKE_TESTPROJECT_PATH}/Module3/src/Module3_Api.c
)

target_compile_options(${PROJECT_NAME}_Module3 PRIVATE
    -include ${MTCCMAKE_AUTOCONFIG_FILE}
)