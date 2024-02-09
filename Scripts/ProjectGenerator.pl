#!/usr/bin/perl

use strict;
use warnings;
use File::Path qw(make_path remove_tree);

my $root_dir_path = "../AutoGen/";

my $project_dir_path = $root_dir_path . "TestProject/";
my $cmake_project_dir_path = $root_dir_path . "Targets/";

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
    # Module Api header
    open my $api_header_fh, '>', $project_dir_path."Module".$module_id."/include/Module".$module_id."_Api.h" or die "Cannot open Module".$module_id."_Api.h: $!";
    print {$api_header_fh} ("#ifndef MODULE".$module_id."_API_H\n");
    print {$api_header_fh} ("#define MODULE".$module_id."_API_H\n");
    print {$api_header_fh} ("\n");
    print {$api_header_fh} ("extern void Module".$module_id."Api_DummyMethod(void);\n");
    print {$api_header_fh} ("\n");
    print {$api_header_fh} ("#endif\n");
    close $api_header_fh;
    # Module Callback header
    open my $callback_header_fh, '>', $project_dir_path."Module".$module_id."/include/Module".$module_id."_CallbackApi.h" or die "Cannot open Module".$module_id."_CallbackApi.h: $!";
    print {$callback_header_fh} ("#ifndef MODULE".$module_id."_CALLBACKAPI_H\n");
    print {$callback_header_fh} ("#define MODULE".$module_id."_CALLBACKAPI_H\n");
    print {$callback_header_fh} ("\n");
    print {$callback_header_fh} ("extern void Module".$module_id."CallbackApi_DummyCallback(void);\n");
    print {$callback_header_fh} ("\n");
    print {$callback_header_fh} ("#endif\n");
    close $callback_header_fh;
    # Module Api
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