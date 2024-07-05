# libmylibrary

Template for libraries with QMake.

## New Project

Followings should have been done by the script file.

* (1) Rename include/libmylibrary_global.h
* (2) Open include/libmylibrary_global.h and update LIBMYLIBRARY_GLOBAL_H (header guard), libmylibrary_LIBRARY (C++ lib build keyword) and LIBMYLIBRARY_EXPORT (Export keyword).
* (3) Rename libmylibrary.pro
* (4) Open libmylibrary.pro, update libmylibrary_LIBRARY and update LIBMYLIBRARY_*
* (5) Rename libmylibrary-All.pro
* (6) Open libmylibrary-All.pro and update *.pro files
* (7) Rename test/libmessaging-test.pro
* (8) Open test/libmessaging-test.pro and update include(...) commands
* (9) Rename libmylibrary.pri
* (10) Open libmylibrary.pri and update LIB_NAME
* (11) Update README.md

## Adding files to project

* HEADER, SOURCE and FORM sources are automatically read by QMake, no need for adding by name.
* "*.h" files are need to be in the "include" folder
* "*.cpp" and "*.ui" files are need to be in the "src" folder
* After creating the new source files, libmylibrary.pro file need to read.

# Dependencies

* Write 

# Build

Qt 5.14.2 is used.

* Open libmylibrary-ALL.pro
* Shadow build MUST be set 'build'
* Build all

Switching to MSVC just after building MinGW may be faulty. But deleting "qmake.stash" and re-opening project helps.

Binaries are ALWAYS created in "build" folder. No matter what the shadow directory is set (Check the libmylibrary.pro).

# Linking

* Library can be linked by adding following line into the *.pro or *.pri file:
	include(libmylibrary.pri)
* The project can also be added in a Qt SUBDIR template.
	