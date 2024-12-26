# (1) Look for installed version of CppUTest
if(DEFINED ENV{CPPUTEST_HOME})
    message(STATUS "Using CppUTest home: $ENV{CPPUTEST_HOME}")
    set(CPPUTEST_INCLUDE_DIRS $ENV{CPPUTEST_HOME}/include)
    set(CPPUTEST_LIBRARIES
        $ENV{CPPUTEST_HOME}/lib/libCppUTest.a
        $ENV{CPPUTEST_HOME}/lib/libCppUTestExt.a
        )
    set(CPPUTEST_LDFLAGS libCppUTest.a libCppUTestExt.a)
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

# (3) Build the unit tests objects and link then with the app library
add_executable(${TEST_APP_NAME} ${TEST_SOURCES})

target_include_directories(${TEST_APP_NAME}
    PUBLIC
    ${CPPUTEST_INCLUDE_DIRS}
    ${SOURCE_DIR}/include/
    )

target_link_libraries(${TEST_APP_NAME}
    PUBLIC
    ${APP_LIB_NAME}
    ${CPPUTEST_LIBRARIES}
    )

add_custom_command(TARGET ${TEST_APP_NAME} POST_BUILD
   COMMAND ${TEST_APP_NAME}
   VERBATIM)