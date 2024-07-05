#========== CUDA Path ==========#
isEmpty(CUDA_PATH): CUDA_PATH=$$(CUDA_PATH)
isEmpty(CUDA_PATH) {
    win32: CUDA_PATH = "C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v10.1"
    else:unix: CUDA_PATH = "/usr"
    warning("Using CUDA src dir specified at Qt Creator wizard. Set CUDA_PATH as environment variable or qmake variable to get rid of this message")
}

#========== Qt Libraries and include directories ==========#
QT += core widgets
INCLUDEPATH += $$PWD/include
INCLUDEPATH += $$CUDA_PATH/include

#========== Get build configuration and library path (ATTENTION: It DOES NOT use shadow build path for binaries)==========#
include(configuration.pri)
LIBMYCUDALIBRARY_BUILD_PATH = $$PWD/build/$${PLATFORM}/$${BUILD_CONFIG}/$${CUR_ARCH}
DEPENDPATH += $${LIBMYCUDALIBRARY_BUILD_PATH}

#========== Libraries ==========#
!contains(DEFINES, libmycudalibrary_BUILD) {
    LIB_NAME = libmycudalibrary
    win32|unix: LIBS += -L$${LIB_PATH} -l$${LIB_NAME}
}
