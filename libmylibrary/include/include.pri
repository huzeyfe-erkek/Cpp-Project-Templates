#========== Paths and configs ==========#
INCLUDEPATH += $$PWD/

#========== Libraries ==========#

#========== Header files should be included only for building ==========#
contains(DEFINES, libmylibrary_BUILD) {
    HEADERS += libmylibrary_global.h

}
