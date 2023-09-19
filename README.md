# C++ Project Templates

Various templates for C++ projects. Bash scripts can be used for generating new projects

## QMake

### [libmylibrary](QMake/libmylibrary)

Template for libraries. File hierarchy:

<pre>
libmycudalibrary
 ├── bin
 │   └── libmylibrary                     (Build output directory)
 │   └── test                             (Test executables directory)
 │   └── bin.pri                          (Configuring build outputs)
 │   └── build_info.pri                   (Determining system architecture: x64 relese, x86 debug, ...)
 │   └── platform_info.pri                (Determining platform variables: unix, MSVC2015, MSVC2017, MSVC201, MSVC2022)
 ├── include
 │   └── include.pri                      (Include paths and header files)
 │   └── lib.pri                          (Libraries)
 ├── src
 │   └── libmylibrary-ALL.pro             (Qt SUBDIR project file includes project & Google test project)
 │   └── libmylibrary.pro                 (Base project)
 │   └── src.pri                          (Includes source and form files)
 ├── test                                 (Google test project)
 │   └── gtest_dependency.pri             (Configures Google Test Suite)
 │   └── libmylibrary-test.pro            (Test project, includes test source files)
 └── libmylibrary.pri                     (The library can be linked from another project by including this)
</pre>

 * libmylibrary.sh bash script can be used for generating a new project.

### [libmycudalibrary](QMake/libmycudalibrary)

Template for libraries with CUDA. It has the same structure as libmylibrary, only CUDA related modifications exist.

<pre>
libmycudalibrary
 ├
 ... 
 ├── src
 │   └── ...
 │   └──  cuda.pri                        (Configuring CUDA compiler)
 ...
</pre>
