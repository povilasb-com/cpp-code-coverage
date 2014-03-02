cmake_minimum_required (VERSION 2.6)
project (Lib1 CXX)


set (CMAKE_CXX_FLAGS "-ggdb -fprofile-arcs -ftest-coverage")
set (CMAKE_EXE_LINKER_FLAGS "-fprofile-arcs -ftest-coverage")

set (SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

include_directories ("${SRC_DIR}")

file (GLOB_RECURSE SRC_FILES "${SRC_DIR}/*.cpp")

# Compiles static lib that will be linked with tests.
set (LIB_NAME "lib1")
add_library ("${LIB_NAME}" STATIC ${SRC_FILES})


# Include googletest.
set (GTEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/lib/googletest")
add_subdirectory (${GTEST_DIR})
include_directories ("${GTEST_DIR}/include")

# Build tests executable.
set (TEST_EXEC "${LIB_NAME}_test")
set (TEST_SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/test")
file (GLOB_RECURSE TEST_SRC_FILES "${TEST_SRC_DIR}/*.cpp")

add_executable ("${TEST_EXEC}" ${TEST_SRC_FILES})
target_link_libraries ("${TEST_EXEC}" "${LIB_NAME}" "gtest" "gtest_main")
