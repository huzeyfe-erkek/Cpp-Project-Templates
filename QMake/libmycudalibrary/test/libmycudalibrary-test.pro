#========== Configs ==========#
TEMPLATE = app
CONFIG += console c++17 thread

#========== PRI Files (DO NOT CHANGE ORDER) ==========#
include($$PWD/gtest_dependency.pri)
include($$PWD/../libmycudalibrary.pri)

#========== Add source files ==========#
HEADERS += $$files($$PWD/*.h, true)
SOURCES += $$files($$PWD/*.cpp, true)
SOURCES += $$GTEST_SRCDIR/src/gtest_main.cc
