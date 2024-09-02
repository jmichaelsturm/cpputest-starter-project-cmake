# (1) CMake definitions, compiler flags and useful variables
cmake_minimum_required(VERSION 3.7)
project(cmakeCppUTestDemo)

add_compile_options(-Wall -Werror)

set(APP_NAME fooApp)
set(APP_LIB_NAME fooAppLib)

# (1) Build a library with my application sources
set(APP_LIB_SOURCE
    example-src/Example.c
)

# Разместить выходные исполняемые файлы и файлы библиотек в заданных директориях
# Let put executable and library files in defined directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "$<1:${CMAKE_BINARY_DIR}/../bin>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "$<1:${CMAKE_BINARY_DIR}/../lib>")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "$<1:${CMAKE_BINARY_DIR}/../lib>")

add_library(${APP_LIB_NAME} ${APP_LIB_SOURCE})

include_directories(${APP_LIB_INCLUDE_DIRS} ./example-include)

# (3) include tests build instructions   
option(COMPILE_TESTS "Compile the tests" OFF)
if(COMPILE_TESTS)
    add_subdirectory(tests)
endif(COMPILE_TESTS)