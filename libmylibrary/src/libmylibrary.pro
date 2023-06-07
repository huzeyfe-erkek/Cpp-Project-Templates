#========== Configs ==========#
QT += core widgets

TEMPLATE = lib

CONFIG += c++17 shared

DEFINES += QT_DEPRECATED_WARNINGS \
           QT_MESSAGELOGCONTEXT \
           libmylibrary_LIBRARY
		   
#========== PRI Files ==========#
include($$PWD/../include/include.pri)
include($$PWD/../include/lib.pri)
include(src.pri)
include($$PWD/../bin/bin.pri)
