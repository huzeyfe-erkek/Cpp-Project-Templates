#========== Paths and configs ==========#
INCLUDEPATH += $$PWD/

#========== Header files should be included only for building ==========#
contains(DEFINES, libmylibrary_BUILD) {
HEADERS += \
    $$PWD/libmylibrary_global.h

}
