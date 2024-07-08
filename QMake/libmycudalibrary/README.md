# libmycudalibrary

Template for 64-bit CUDA libraries with QMake. Both Ubuntu and Windows are supported. In windows, MSVC compilers must be used.

## New Project

Followings should have been done by the script file.

* (1 - 11) Same as libmylibrary
* (12) Open cuda.pri; update libmycudalibrary_BUILD and LIBMYCUDALIBRARY_BUILD_PATH

## Adding files to project

* HEADER, SOURCE and FORM sources are automatically read by QMake, no need for adding by name.
* "*.h" files are need to be in the "include" folder
* "*.cpp", "*.cu" and "*.ui" files are need to be in the "src" folder
* After creating the new source files, libmycudalibrary.pro file need to read.

# Dependencies

* TODO 

# Build

Qt 5.14.2 is used.

* Open libmycudalibrary.pro
* Shadow build MUST be set 'build'
* Build all

Switching to MSVC just after building MinGW may be faulty. But deleting "qmake.stash" and re-opening project helps.

Binaries are ALWAYS created in "build" folder. No matter what the shadow directory is set (Check the libmycudalibrary.pro).

# Linking

* Library can be linked by adding following line into the *.pro or *.pri file:
	include(libmycudalibrary.pri)
* The project can also be added in a Qt SUBDIR template.
