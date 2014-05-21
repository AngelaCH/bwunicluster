OpenMP Test
===========

This short example shows how to create a C++ application using OpenMP.


How to compile
--------------

This example needs [CMake](http://www.cmake.org/) and a recent version of [GCC](http://gcc.gnu.org/).
On the bwUniCluster you can load both using the module system:
```sh
module load devel/cmake
module load compiler/gnu
```

Then you should create an output directory, run cmake on the source directory (which includes CMakeLists.txt), and run the created Makefile:
```sh
mkdir build && cd build
cmake .. && make
```

How to run
----------

Run the example by using the following command:
```sh
./openmp_test 100000000
```

The argument sets the number of iterations to run.
