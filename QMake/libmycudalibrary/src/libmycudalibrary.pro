#========== Configs ==========#
TEMPLATE = lib

CONFIG += c++17 shared

DEFINES += QT_DEPRECATED_WARNINGS \
           QT_MESSAGELOGCONTEXT \
           no_plugin_name_prefix \
           libmycudalibrary_BUILD

VERSION = 1.0.0.0
		   
#========== PRI Files (DO NOT CHANGE ORDER) ==========#
include($$PWD/../include/include.pri)
include($$PWD/../include/lib.pri)
include($$PWD/src.pri)
include($$PWD/../bin/bin.pri)
include($$PWD/cuda.pri)
