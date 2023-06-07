#========== Paths and configs ==========#
INCLUDEPATH += $$PWD/

#========== Libraries ==========#

#========== Header files should be included only for building ==========#
contains(DEFINES, libmylibrary_LIBRARY) {
    HEADERS += libmylibrary_global.h

}
