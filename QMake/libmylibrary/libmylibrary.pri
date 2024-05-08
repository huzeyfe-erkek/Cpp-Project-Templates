#========== Add lib ==========#
LIB_NAME = libmylibrary

include(bin/configuration.pri)
LIB_PATH = $$PWD/bin/$${LIB_NAME}/$${PLATFORM}/$${BUILD_CONFIG}/$${CUR_ARCH}
win32|unix: LIBS += -L$${LIB_PATH} -l$${LIB_NAME}
DEPENDPATH += $${LIB_PATH}

#========== Include dir and files ==========#
include(include/include.pri)
include(include/lib.pri)
