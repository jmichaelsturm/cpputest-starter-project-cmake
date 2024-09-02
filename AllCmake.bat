rem mkdir cpputest_build_test
rem mkdir lib
rem mkdir bin
rem cmake -G "MSYS Makefiles" -B cpputest_build_test
cmake -G "MSYS Makefiles" -B cpputest_build_test -DCOMPILE_TESTS=ON
cmake --build cpputest_build_test
bin\fooApp_tests.exe