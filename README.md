# C++ Project Templates

Various templates for C++ projects. Bash scripts can be used for generating new projects

## QMake

### [libmylibrary](QMake/libmylibrary)

Template for libraries. File hierarchy:

<pre>
libmylibrary
 ├── build                                (Build output directory. Binaries are always created in this directory)
 ├── include                              ("*.h" files are automatically read from this directory) 
 │   └── libtest1_global.h
 ├── src                                  ("*.cpp" and "*.ui" files are automatically read from this directory) 
 ├── test                                 (Google test project)
 │   └── gtest_dependency.pri             (Configures Google Test Suite)
 │   └── libmylibrary-test.pro            (Test project, includes test source files)
 ├── CHANGELOG.md                         (Release notes)
 ├── configuration.pri                    (Get architecture (x64 release, x86 debug) and platform (unix, MSVC2017, MSVC2019, ...))
 ├── ISSUES.md                            (Known issues of the releases)
 ├── libmylibrary.pri                     (The library can be linked from another project by including this)
 ├── libmylibrary.pro                     (Base project)
 ├── libmylibrary-ALL.pro                 (Qt SUBDIR project file includes project & Google test project)
 └── README.md
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
