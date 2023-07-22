#========== Settings ==========#
CUDA_ARCH = sm_52 # Type of CUDA architecture
CUDA_OBJECTS_DIR = $$OUTDIR/cuda
NVCC_OPTIONS = --use_fast_math

#========== Include paths & Libs ==========#
CUDA_INCLUDEPATH = $$join(INCLUDEPATH,'" -I"','-I"','"')

QMAKE_LIBDIR += $$CUDA_DIR/lib/x64
              
for (lib, CUDA_LIBS) {
    LIBS += -l$$lib
}

#========== Setup CUDA compiler ==========#
win32: NVCC_PATH = \"$$CUDA_DIR/bin/nvcc.exe\"
else:unix: NVCC_PATH = \"$$CUDA_DIR/bin/nvcc\"

cuda.input = CUDA_SOURCES
cuda.output = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}_cuda.o
cuda.dependency_type = TYPE_C

cuda.commands = $$NVCC_PATH -m64
CONFIG(debug, debug|release): cuda.commands += -D_DEBUG 
cuda.commands += $$NVCC_OPTIONS $$CUDA_INCLUDEPATH $$LIBS -arch=$$CUDA_ARCH -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME} -Dlibmycudalibrary_BUILD

win32: cuda.commands += --compile -cudart static -Dx64 -D_MBCS
win32:CONFIG(debug, debug|release): cuda.commands += -Xcompiler "/wd4819,/EHsc,/W3,/nologo,/Od,/Zi,/RTC1,/MDd" 
win32:CONFIG(release, debug|release): cuda.commands += -Xcompiler "/wd4819,/EHsc,/W3,/nologo,/O2,/Zi,/MD"

unix: cuda.commands += -Xcompiler -fPIC
unix:CONFIG(debug, debug|release): cuda.depend_commands = $$CUDA_DIR/bin/nvcc -O0
unix:CONFIG(release, debug|release): cuda.depend_commands = $$CUDA_DIR/bin/nvcc -O3
unix: cuda.depend_commands += -M $$CUDA_INCLUDEPATH $$NVCC_OPTIONS ${QMAKE_FILE_NAME}

QMAKE_EXTRA_COMPILERS += cuda

