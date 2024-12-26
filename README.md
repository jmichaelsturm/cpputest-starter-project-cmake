cpputest-starter-project-cmake
==============================

The cpputest-starter-project can help you integrate CppUTest based off-target testing with your production code.

This is a simplified fork of the following repos modified for CMake
- https://github.com/mikchel-26/cpputest-starter-project-cmake
- https://github.com/jwgrenning/cpputest-starter-project

### How to use (Linux)

Set the `CPPUTEST_HOME` environment variable to point to your installation of CppUTest.
```bash
export CPPUTEST_HOME=<path to the cpputest installation>
```
From the root directory of the project, create a new directory for CMake build and enter that directory.
```bash
mkdir build
cd build
```

Invoke `cmake` to build the project.
```bash
cmake ..
cmake --build .
```
