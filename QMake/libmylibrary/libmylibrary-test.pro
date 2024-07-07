#========== Configs ==========#
TEMPLATE = app
CONFIG += console c++17 thread

#========== PRI Files (DO NOT CHANGE ORDER) ==========#
include($$PWD/gtest_dependency.pri)
include($$PWD/libmylibrary.pri)

#========== Add source files ==========#
HEADERS += $$files($$PWD/test/*.h, true)
SOURCES += $$files($$PWD/test/*.cpp, true)
SOURCES += $$GTEST_SRCDIR/src/gtest_main.cc
