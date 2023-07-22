# libmycudalibrary

Template for 64-bit CUDA libraries with QMake. Both Ubuntu and Windows are supported. In windows, MSVC compilers must be used.

## New Project

Followings should have been done by the script file.

* Open bin/.gitignore and update libmycudalibrary
* Rename include/libmycudalibrary_global.h
* Open include/libmycudalibrary_global.h and update LIBMYCUDALIBRARY_GLOBAL_H (header guard), libmycudalibrary_LIBRARY (C++ lib build keyword) and LIBMYCUDALIBRARY_EXPORT (Export keyword).
* Open include/include.pri and update libmycudalibrary_LIBRARY and libmycudalibrary_global.h
* Rename src/libmycudalibrary.pro
* Open src/libmycudalibrary.pro and update libmycudalibrary_LIBRARY
* Rename src/libmycudalibrary-All.pro
* Open src/libmycudalibrary-All.pro and update *.pro files
* Rename test/libmessaging-test.pro
* Open test/libmessaging-test.pro and update include(...) commands
* Rename libmycudalibrary.pri
* Open libmycudalibrary.pri and update LIB_NAME
* Update README.md
* Open src/cuda.pri and update libmycudalibrary_BUILD

## Adding files to project

* Add new source filenames to src/src.pri under SOURCES list
* Add new CUDA source filenames to src/src.pri under CUDA_SOURCES list
* Add new header filenames to include/include.pri AND inside the contains(DEFINES, libmycudalibrary_LIBRARY) section
* Add new libraries to include/lib.pri

# Dependencies

# Build

Qt 5.14.2 is used.

* Open src/libmycudalibrary.pro
* Shadow build MUST be set '../bin/libmycudalibrary'
* Build all

Switching to MSVC just after building MinGW may be faulty. But deleting "/bin/libmycudalibrary/.qmake.stash" and re-opening project helps.

# Usage

Library can be linked by adding following line into the *.pro or *.pri file:
	include(libmycudalibrary.pri)
	
