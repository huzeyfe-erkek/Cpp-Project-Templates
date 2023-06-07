# libmylibrary

Template for libraries with QMake.

## New Project

Please do followings for a new project:

* Open bin/.gitignore and update libmylibrary
* Rename include/libmylibrary_global.h
* Open include/libmylibrary_global.h and update LIBMYLIBRARY_GLOBAL_H (header guard), libmylibrary_LIBRARY (C++ lib build keyword) and LIBMYLIBRARY_EXPORT (Export keyword).
* Open include/include.pri and update libmylibrary_LIBRARY and libmylibrary_global.h
* Rename src/libmylibrary.pro
* Open src/libmylibrary.pro and update libmylibrary_LIBRARY
* Rename src/libmylibrary-All.pro
* Open src/libmylibrary-All.pro and update *.pro files
* Rename test/libmessaging-test.pro
* Open test/libmessaging-test.pro and update include(...) commands
* Rename libmylibrary.pri
* Open libmylibrary.pri and update LIB_NAME
* Update README.md

## Adding files to project

* Add new source filenames to src/src.pri
* Add new header filenames to include/include.pri AND inside the contains(DEFINES, libmylibrary_LIBRARY) section
* Add new libraries to include/lib.pri

# Dependencies

# Build

Qt 5.14.2 is used.

* Open src/libmylibrary.pro
* Shadow build MUST be set '../bin/libmylibrary'
* Build all

Switching to MSVC just after building MinGW may be faulty. But deleting "/bin/libmylibrary/.qmake.stash" and re-opening project helps.

# Usage

Library can be linked by adding following line into the *.pro or *.pri file:
	include(libmylibrary.pri)
	