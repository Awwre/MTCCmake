#!/usr/bin/perl

use strict;
use warnings;
use File::Path qw(make_path remove_tree);

my $root_dir_path = "../AutoGen/";

my $project_dir_path = $root_dir_path . "TestProject/";
my $targets_dir_path = $root_dir_path . "Targets/";
my $cmake_modules_dir_path = $root_dir_path . "CMakeModules/";

my $core_dir_path = $project_dir_path . "Core/";

my $number_of_targets = 10;
my $number_of_modules = 10;

if (-e $root_dir_path) {
    remove_tree($root_dir_path);
}

# Core
make_path($core_dir_path."src/");
## Main
open my $main_fh, '>', $core_dir_path."src/main.c" or die "Cannot open main.c: $!";
for my $module_id (0 .. $number_of_modules - 1) {
    print {$main_fh} ("#include \"Module".$module_id."/include/Module".$module_id."_Api.h\"\n");
}
print {$main_fh} ("#include <stdio.h>\n");
print {$main_fh} ("\n");
print {$main_fh} ("void main() {\n");
print {$main_fh} ("#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)\n");
print {$main_fh} ("    printf(\"Hello from main! -> Current config file: \%s\\n\", DUMMYCONFIG_PATH);\n");
print {$main_fh} ("#else\n");
print {$main_fh} ("    printf(\"Aloha from main!\\n\");\n");
print {$main_fh} ("#endif\n");
print {$main_fh} ("\n");
for my $module_id (0 .. $number_of_modules - 1) {
    print {$main_fh} ("    Module".$module_id."Api_DummyMethod();\n");
}
print {$main_fh} ("}\n");
close $main_fh;
## Callbacks
for my $module_id (0 .. $number_of_modules - 1) {
    open my $callback_fh, '>', $core_dir_path."src/Module".$module_id."_CallbackApi.c" or die "Cannot open Module".$module_id."_CallbackApi.c: $!";
    print {$callback_fh} ("#include \"Module".$module_id."/include/Module".$module_id."_CallbackApi.h\"\n");
    print {$callback_fh} ("#include <stdio.h>\n");
    print {$callback_fh} ("\n");
    print {$callback_fh} ("void Module".$module_id."CallbackApi_DummyCallback() {\n");
    print {$callback_fh} ("#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)\n");
    print {$callback_fh} ("    printf(\"Hello from Module".$module_id."CallbackApi_DummyCallback!\\n\");\n");
    print {$callback_fh} ("#else\n");
    print {$callback_fh} ("    printf(\"Aloha from Module".$module_id."CallbackApi_DummyCallback!\\n\");\n");
    print {$callback_fh} ("#endif\n");
    print {$callback_fh} ("}\n");
    close $callback_fh;
}
# Modules
for my $module_id (0 .. $number_of_modules - 1) {
    make_path($project_dir_path."Module".$module_id."/include/");
    make_path($project_dir_path."Module".$module_id."/src/");
    ## Module Api header
    open my $api_header_fh, '>', $project_dir_path."Module".$module_id."/include/Module".$module_id."_Api.h" or die "Cannot open Module".$module_id."_Api.h: $!";
    print {$api_header_fh} ("#ifndef MODULE".$module_id."_API_H\n");
    print {$api_header_fh} ("#define MODULE".$module_id."_API_H\n");
    print {$api_header_fh} ("\n");
    print {$api_header_fh} ("extern void Module".$module_id."Api_DummyMethod(void);\n");
    print {$api_header_fh} ("\n");
    print {$api_header_fh} ("#endif\n");
    close $api_header_fh;
    ## Module Callback header
    open my $callback_header_fh, '>', $project_dir_path."Module".$module_id."/include/Module".$module_id."_CallbackApi.h" or die "Cannot open Module".$module_id."_CallbackApi.h: $!";
    print {$callback_header_fh} ("#ifndef MODULE".$module_id."_CALLBACKAPI_H\n");
    print {$callback_header_fh} ("#define MODULE".$module_id."_CALLBACKAPI_H\n");
    print {$callback_header_fh} ("\n");
    print {$callback_header_fh} ("extern void Module".$module_id."CallbackApi_DummyCallback(void);\n");
    print {$callback_header_fh} ("\n");
    print {$callback_header_fh} ("#endif\n");
    close $callback_header_fh;
    ## Module Api
    open my $api_fh, '>', $project_dir_path."Module".$module_id."/src/Module".$module_id."_Api.c" or die "Cannot open Module".$module_id."_Api.c: $!";
    print {$api_fh} ("#include \"Module".$module_id."/include/Module".$module_id."_Api.h\"\n");
    print {$api_fh} ("#include \"Module".$module_id."/include/Module".$module_id."_CallbackApi.h\"\n");
    print {$api_fh} ("#include <stdio.h>\n");
    print {$api_fh} ("\n");
    print {$api_fh} ("void Module".$module_id."Api_DummyMethod() {\n");
    print {$api_fh} ("#if (DUMMY_CONFIG_PRINT == PRINT_HELLO)\n");
    print {$api_fh} ("    printf(\"Hello from Module".$module_id."Api_DummyMethod!\\n\");\n");
    print {$api_fh} ("#else\n");
    print {$api_fh} ("    printf(\"Aloha from Module".$module_id."Api_DummyMethod!\\n\");\n");
    print {$api_fh} ("#endif\n");
    print {$api_fh} ("\n");
    print {$api_fh} ("    Module".$module_id."CallbackApi_DummyCallback();\n");
    print {$api_fh} ("}\n");
    close $api_fh;
}
# Targets
for my $target_id (0 .. $number_of_targets - 1) {
    make_path($targets_dir_path."Target".$target_id."/AutoConfig/");
    ## AutoConfig
    open my $autoconfig_fh, '>', $targets_dir_path."Target".$target_id."/AutoConfig/DummyConfig.h" or die "Cannot open DummyConfig.h: $!";
    print {$autoconfig_fh} ("#define DUMMYCONFIG_PATH \"Target".$target_id."/AutoConfig/DummyConfig\"\n");
    print {$autoconfig_fh} ("#define DUMMY_CONFIG_PRINT PRINT_HELLO\n");
    print {$autoconfig_fh} ("//#define DUMMY_CONFIG_PRINT PRINT_ALOHA\n");
    print {$autoconfig_fh} ("\n");
    print {$autoconfig_fh} ("//#error \"Error from DummyConfig on Target".$target_id."!\"\n");
    close $autoconfig_fh;
    ## CMakeLists
    open my $cmakelists_fh, '>', $targets_dir_path."Target".$target_id."/CMakeLists.txt" or die "Cannot open CMakeLists.txt: $!";
    print {$cmakelists_fh} ("cmake_minimum_required(VERSION 3.5.0)\n");
    print {$cmakelists_fh} ("project(Target".$target_id." VERSION 0.1.0 LANGUAGES C)\n");
    print {$cmakelists_fh} ("\n");
    print {$cmakelists_fh} ("include(CTest)\n");
    print {$cmakelists_fh} ("enable_testing()\n");
    print {$cmakelists_fh} ("\n");
    print {$cmakelists_fh} ("set(MTCCMAKE_AUTOCONFIG_FILE \"\${CMAKE_CURRENT_SOURCE_DIR}/AutoConfig/DummyConfig.h\")\n");
    print {$cmakelists_fh} ("\n");
    print {$cmakelists_fh} ("include(Core)\n");
    print {$cmakelists_fh} ("\n");
    print {$cmakelists_fh} ("set(CPACK_PROJECT_NAME \${PROJECT_NAME})\n");
    print {$cmakelists_fh} ("set(CPACK_PROJECT_VERSION \${PROJECT_VERSION})\n");
    print {$cmakelists_fh} ("include(CPack)\n");
    close $cmakelists_fh;
}
# CMakeModules
make_path($cmake_modules_dir_path);
## Core
open my $core_fh, '>', $cmake_modules_dir_path."Core.cmake" or die "Core.cmake: $!";
for my $module_id (0 .. $number_of_modules - 1) {
    print {$core_fh} ("include(Module".$module_id.")\n");
}
print {$core_fh} ("\n");
print {$core_fh} ("add_executable(\${PROJECT_NAME}_Core)\n");
print {$core_fh} ("\n");
print {$core_fh} ("target_include_directories(\${PROJECT_NAME}_Core PRIVATE\n");
print {$core_fh} ("    \${MTCCMAKE_TESTPROJECT_PATH}\n");
print {$core_fh} (")\n");
print {$core_fh} ("\n");
print {$core_fh} ("target_sources(\${PROJECT_NAME}_Core PRIVATE\n");
print {$core_fh} ("    \${MTCCMAKE_TESTPROJECT_PATH}/Core/src/main.c\n");
for my $module_id (0 .. $number_of_modules - 1) {
    print {$core_fh} ("    \${MTCCMAKE_TESTPROJECT_PATH}/Core/src/Module".$module_id."_CallbackApi.c\n");
}
print {$core_fh} (")\n");
print {$core_fh} ("\n");
print {$core_fh} ("target_link_libraries(\${PROJECT_NAME}_Core PRIVATE\n");
for my $module_id (0 .. $number_of_modules - 1) {
    print {$core_fh} ("    \${PROJECT_NAME}_Module".$module_id."\n");
}
print {$core_fh} (")\n");
print {$core_fh} ("\n");
print {$core_fh} ("target_compile_options(\${PROJECT_NAME}_Core PRIVATE\n");
print {$core_fh} ("    -include \${MTCCMAKE_AUTOCONFIG_FILE}\n");
print {$core_fh} (")\n");
close $core_fh;
## Modules
for my $module_id (0 .. $number_of_modules - 1) {
    open my $module_fh, '>', $cmake_modules_dir_path."Module".$module_id.".cmake" or die "Module".$module_id.".cmake: $!";
    print {$module_fh} ("add_library(\${PROJECT_NAME}_Module".$module_id." OBJECT)\n");
    print {$module_fh} ("\n");
    print {$module_fh} ("target_include_directories(\${PROJECT_NAME}_Module".$module_id." PRIVATE\n");
    print {$module_fh} ("    \${MTCCMAKE_TESTPROJECT_PATH}\n");
    print {$module_fh} (")\n");
    print {$module_fh} ("\n");
    print {$module_fh} ("target_sources(\${PROJECT_NAME}_Module".$module_id." PRIVATE\n");
    print {$module_fh} ("    \${MTCCMAKE_TESTPROJECT_PATH}/Module".$module_id."/src/Module".$module_id."_Api.c\n");
    print {$module_fh} (")\n");
    print {$module_fh} ("\n");
    print {$module_fh} ("target_compile_options(\${PROJECT_NAME}_Module".$module_id." PRIVATE\n");
    print {$module_fh} ("    -include \${MTCCMAKE_AUTOCONFIG_FILE}\n");
    print {$module_fh} (")\n");
    close $module_fh;
}
# Main CMakeLists
open my $maincmakelists_fh, '>', "../CMakeLists.txt" or die "CMakeLists.txt: $!";
    print {$maincmakelists_fh} ("cmake_minimum_required(VERSION 3.5.0)\n");
    print {$maincmakelists_fh} ("project(AutoGeneratedProject VERSION 0.1.0 LANGUAGES C)\n");
    print {$maincmakelists_fh} ("\n");
    print {$maincmakelists_fh} ("list(APPEND CMAKE_MODULE_PATH \"\${CMAKE_CURRENT_SOURCE_DIR}/AutoGen/CMakeModules\")\n");
    print {$maincmakelists_fh} ("\n");
    print {$maincmakelists_fh} ("set(MTCCMAKE_TESTPROJECT_PATH \"\${CMAKE_CURRENT_SOURCE_DIR}/AutoGen/TestProject\")\n");
    print {$maincmakelists_fh} ("\n");
    for my $target_id (0 .. $number_of_targets - 1) {
        print {$maincmakelists_fh} ("add_subdirectory(AutoGen/Targets/Target".$target_id.")\n");
    }
close $maincmakelists_fh;
