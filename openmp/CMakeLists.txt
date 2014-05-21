cmake_minimum_required(VERSION 2.6)

# create a project, which can include several binaries, libraries etc.
project(OpenMPTest)

# use C++11
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")

# load OpenMP
# (REQUIRED means that the compilation fails, if OpenMP isn't found)
find_package(OpenMP REQUIRED)
if(OPENMP_FOUND)
	message("OpenMP found")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
endif()

# set the list of source files, which are needed for the openmp_test executable
set(openmp_test_src
	OpenMPTest.cpp)

add_executable(openmp_test ${openmp_test_src})
