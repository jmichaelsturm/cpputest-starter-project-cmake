# (1) Look for installed version of CppUTest
if(DEFINED ENV{CPPUTEST_HOME})
    message(STATUS "Using CppUTest home: $ENV{CPPUTEST_HOME}")
    set(CPPUTEST_INCLUDE_DIRS $ENV{CPPUTEST_HOME}/include)
    set(CPPUTEST_LIBRARIES 
        $ENV{CPPUTEST_HOME}/cpputest_build_MSYS/src/CppUTest
        $ENV{CPPUTEST_HOME}/cpputest_build_MSYS/src/CppUTestExt
        )
    set(CPPUTEST_LDFLAGS CppUTest CppUTestExt)
else()
    find_package(PkgConfig REQUIRED)
    pkg_search_module(CPPUTEST REQUIRED cpputest>=3.8)
    message(STATUS "Found CppUTest version ${CPPUTEST_VERSION}")
endif()

# (2) Our unit tests sources
set(TEST_APP_NAME ${APP_NAME}_tests)
set(TEST_SOURCES
    ExampleTest.cpp
    MyFirstTest.cpp
    AllTests.cpp
)

# (3) Take care of include directories
include_directories(${CPPUTEST_INCLUDE_DIRS} ../example-include/)
link_directories(${CPPUTEST_LIBRARIES})


# (4) Build the unit tests objects and link then with the app library
add_executable(${TEST_APP_NAME} ${TEST_SOURCES})
target_link_libraries(${TEST_APP_NAME} ${APP_LIB_NAME} ${CPPUTEST_LDFLAGS})

# (5) Run the test once the build is done
# If there is an error, the executable file is deleted
# Если есть ошибка, то удаляет исполняемый файл
# It's inconvenient, so the launch is commented out
# Неудобно, поэтому запуск закомментирован
#add_custom_command(TARGET ${TEST_APP_NAME} POST_BUILD
#    COMMAND ./../../bin/${TEST_APP_NAME}
#    VERBATIM)