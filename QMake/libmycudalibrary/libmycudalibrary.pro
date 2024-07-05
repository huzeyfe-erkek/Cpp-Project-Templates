#========== Configs ==========#
TEMPLATE = lib

CONFIG += c++17 skip_target_version_ext shared

DEFINES += QT_DEPRECATED_WARNINGS \
           QT_MESSAGELOGCONTEXT \
           no_plugin_name_prefix \
           libmycudalibrary_BUILD

#========== Version ==========#
VERSION = 1.0.0.0 # major.minor.patch.build
DEFINES += LIBMYCUDALIBRARY_VERSION_MAJOR=1
DEFINES += LIBMYCUDALIBRARY_VERSION_MINOR=0
DEFINES += LIBMYCUDALIBRARY_VERSION_PATCH=0

#========== PRI Files (DO NOT CHANGE ORDER) ==========#
include($$PWD/libmycudalibrary.pri)
include($$PWD/cuda.pri)

#========== Output directories (DO NOT CHANGE ORDER USES LIB_PATH) ==========#
DESTDIR     = $$LIB_PATH
UI_DIR      = $$LIB_PATH/.ui
MOC_DIR     = $$LIB_PATH/.moc
RCC_DIR     = $$LIB_PATH/.rcc
OBJECTS_DIR = $$LIB_PATH/.obj

#========== Add source files ==========#
FORMS += $$files($$PWD/src/*.ui, true)
HEADERS += $$files($$PWD/include/*.h, true)
SOURCES += $$files($$PWD/src/*.cpp, true)
CUDA_SOURCES += $$files($$PWD/src/*.cu, true)
