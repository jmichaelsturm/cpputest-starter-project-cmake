cmake_minimum_required(VERSION 3.7)
project(cmakeCppUTestDemo)

add_compile_options(-Wall -Werror -g)

# Code under test is compiled as a library
set(APP_NAME cppUTestDemo)
set(APP_LIB_NAME cppUTestDemoLib)
set(APP_LIB_SOURCE
    src/Example.c
    )
add_library(${APP_LIB_NAME} ${APP_LIB_SOURCE})
include_directories(${APP_LIB_INCLUDE_DIRS} ./include)

# Unit tests have their own CMakeLists.txt file included as a subdirectory
add_subdirectory(tests)
