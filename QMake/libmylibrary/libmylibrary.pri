#========== Qt Libraries and include directories ==========#
QT += core widgets
INCLUDEPATH += $$PWD/include

#========== Get build configuration and library path (ATTENTION: It DOES NOT use shadow build path for binaries)==========#
include(configuration.pri)
LIBMYLIBRARY_BUILD_PATH = $$PWD/build/$${PLATFORM}/$${BUILD_CONFIG}/$${CUR_ARCH}
DEPENDPATH += $${LIBMYLIBRARY_BUILD_PATH}

#========== Libraries ==========#
!contains(DEFINES, libmylibrary_BUILD) {
    LIB_NAME = libmylibrary
    win32|unix: LIBS += -L$${LIB_PATH} -l$${LIB_NAME}
}
