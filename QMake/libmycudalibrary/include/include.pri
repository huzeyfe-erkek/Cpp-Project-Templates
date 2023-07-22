#========== CUDA Path ==========#
isEmpty(CUDA_PATH):CUDA_PATH=$$(CUDA_PATH)

isEmpty(CUDA_PATH) {
    win32: CUDA_PATH = "C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v10.1"
    else:unix: CUDA_PATH = "/usr"
    warning("Using CUDA src dir specified at Qt Creator wizard")
    message("set CUDA_PATH as environment variable or qmake variable to get rid of this message")
}

#========== Paths and configs ==========#
INCLUDEPATH += $$PWD/
INCLUDEPATH += $$CUDA_PATH/include

#========== Header files must be included only for building ==========#
contains(DEFINES, libmycudalibrary_BUILD) {
HEADERS += \
    $$PWD/libmycudalibrary_global.h

}
