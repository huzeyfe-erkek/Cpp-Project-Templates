# C++ Project Templates

Various templates for C++ projects. 

## QMake

### libmylibrary

Template for libraries. You can use libmylibrary.sh bash script for generating new projects. File hierarchy:

libmylibrary
 ├── bin
 │   └── libmylibrary (Build output directory)
 │   └── test (Test executables directory)
 │   └── bin.pri (Configuring build outputs)
 │   └── build_info.pri (Determining system architecture: x64 release, x86 debug, ...)
 │   └── platform_info.pri (Determining platform variables: unix, MSVC2015, MSVC2017, MSVC2019, MSVC2022)
 ├── include
 │   └── include.pri (Include paths & Header files)
 │   └── lib.pri (Linked libraries)
 ├── src
 │   └── libmylibrary-ALL.pro (Qt SUBDIR project file includes project & test project)
 │   └── libmylibrary.pro (Base project)
 │   └── src.pri (Includes source and form files) 
 ├── test (Google Test project)
 │   └── gtest_dependency.pri (Configures Google Test Suite) 
 │   └── libmylibrary-test.pro (Test project, includes test source files)
 └── libmylibrary.pri (The library can be linked from another project by including this)

 * libmylibrary.sh bash script can be used for generating a new project.

### libmycudalibrary (Beta)

Template for libraries with CUDA. You can use libmycudalibrary.sh bash script for generating new projects. File hierarchy has same structure with libmylibrary. And, it has CUDA related modifications. 

libmycudalibrary
 ├
 ... 
 ├── src
 │   └── ...
 │   └──  cuda.pri (Configuring CUDA compiler)
 ... 
