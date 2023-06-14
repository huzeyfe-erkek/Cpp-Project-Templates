######################################################################
### DIRECTORIES
# Check Shadow Build Directory
DESIRED_OUT_PWD = $$clean_path($$PWD/../bin/$$basename(OUT_PWD))
!equals(DESIRED_OUT_PWD, $$OUT_PWD) {
message($$basename(_PRO_FILE_) -> OUT_PWD is $$OUT_PWD)
message($$basename(_PRO_FILE_) -> PWD is $$PWD)
error($$basename(_PRO_FILE_) -> OUT_PWD is NOT equal to DESIRED_OUT_PWD! Make sure that OUT_PWD = $$clean_path($$PWD/../../bin/$$basename(OUT_PWD)))
}

# Get build specifications
include(build_info.pri)

# Set output directories
OUTDIR = $$OUT_PWD/$${PLATFORM}/$${BUILD_CONFIG}/$${CUR_ARCH}

DESTDIR     = $$OUTDIR
UI_DIR      = $$OUTDIR/.ui
MOC_DIR     = $$OUTDIR/.moc
RCC_DIR     = $$OUTDIR/.rcc
OBJECTS_DIR = $$OUTDIR/.obj
