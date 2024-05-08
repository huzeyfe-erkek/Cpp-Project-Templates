#========== Check shadow build directory ==========#
DESIRED_OUT_PWD = $$clean_path($$PWD/$$basename(OUT_PWD))
!equals(DESIRED_OUT_PWD, $$OUT_PWD) {
error([$$basename(_PRO_FILE_)] OUT_PWD=\"$$OUT_PWD\" is NOT equal to DESIRED_OUT_PWD==\"$$DESIRED_OUT_PWD\")
}

#========== Get build configuration ==========#
include(configuration.pri)

#========== Output directories ==========#
OUTDIR = $$OUT_PWD/$${PLATFORM}/$${BUILD_CONFIG}/$${CUR_ARCH}

DESTDIR     = $$OUTDIR
UI_DIR      = $$OUTDIR/.ui
MOC_DIR     = $$OUTDIR/.moc
RCC_DIR     = $$OUTDIR/.rcc
OBJECTS_DIR = $$OUTDIR/.obj
