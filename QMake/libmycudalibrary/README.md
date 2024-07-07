# libmycudalibrary

Template for 64-bit CUDA libraries with QMake. Both Ubuntu and Windows are supported. In windows, MSVC compilers must be used.

## New Project

Followings should have been done by the script file.

* (1) Rename include/libmycudalibrary_global.h
* (2) Open include/libmycudalibrary_global.h and update LIBMYCUDALIBRARY_GLOBAL_H (header guard), libmycudalibrary_LIBRARY (C++ lib build keyword) and LIBMYCUDALIBRARY_EXPORT (Export keyword).
* (3) Rename libmycudalibrary-src.pro
* (4) Open libmycudalibrary-src.pro; update libmycudalibrary_BUILD, target name, build version, pri path and LIBMYCUDALIBRARY_BUILD_PATH
* (5) Rename libmycudalibrary.pro
* (6) Open libmycudalibrary.pro and update *.pro files
* (7) Rename libmycudalibrary-test.pro
* (8) Open libmycudalibrary-test.pro and update include(...) commands
* (9) Rename libmycudalibrary.pri
* (10) Open libmycudalibrary.pri; and update library name and LIBMYCUDALIBRARY_BUILD_PATH
* (11) Update README.md
* (12) Open cuda.pri and update libmycudalibrary_BUILD

## Adding files to project

* HEADER, SOURCE and FORM sources are automatically read by QMake, no need for adding by name.
* "*.h" files are need to be in the "include" folder
* "*.cpp", "*.cu" and "*.ui" files are need to be in the "src" folder
* After creating the new source files, libmycudalibrary.pro file need to read.

# Dependencies

* TODO 

# Build

Qt 5.14.2 is used.

* Open libmycudalibrary-ALL.pro
* Shadow build MUST be set 'build'
* Build all

Switching to MSVC just after building MinGW may be faulty. But deleting "qmake.stash" and re-opening project helps.

Binaries are ALWAYS created in "build" folder. No matter what the shadow directory is set (Check the libmycudalibrary.pro).

# Linking

* Library can be linked by adding following line into the *.pro or *.pri file:
	include(libmycudalibrary.pri)
* The project can also be added in a Qt SUBDIR template.
