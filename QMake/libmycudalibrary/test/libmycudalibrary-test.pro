include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console c++17 thread
#CONFIG -= app_bundle

include($$PWD/../libmycudalibrary.pri)
include($$PWD/../bin/bin.pri)

SOURCES += \
    $$GTEST_SRCDIR/src/gtest_main.cc

HEADERS +=
